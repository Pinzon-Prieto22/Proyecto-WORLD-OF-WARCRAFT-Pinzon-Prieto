/*
Disparadores

Definición de disparadores
*/

-- TRIGGER 1: Generamos automaticamente un id con formato NNNNN.nombre.WOW antes de insertar un personaje
CREATE OR REPLACE TRIGGER TRG_PJ_ID_AUTO
    BEFORE INSERT ON PERSONAJES
    FOR EACH ROW
BEGIN
    :NEW.id := LPAD(SEQ_PJ_ID.NEXTVAL, 5, '0') || '.' || :NEW.nombre || '.WOW';
END TRG_PJ_ID_AUTO;

-- TRIGGER 2: Validamos nombre de PERSONAJE que sea solo letras yq ue no sea el nombre de un NPC
CREATE OR REPLACE TRIGGER TRG_PJ_NOMBRE_VALIDO
    BEFORE INSERT OR UPDATE OF nombre ON PERSONAJES
    FOR EACH ROW
DECLARE
    npc_contador NUMBER;
BEGIN
    -- Solo Letras
    IF NOT REGEXP_LIKE(:NEW.nombre, '^[A-Za-zÁÉÍÓÚáéíóúÑñ]+$') THEN
        RAISE_APPLICATION_ERROR(-20010,'ERROR: El nombre del personaje solo puede contener letras sin espacios ni caracteres especiales. Nombre: ' || :NEW.nombre);
    END IF;
    -- No puede coincidir con nombre de NPC
    SELECT COUNT(*) 
            INTO npc_contador 
            FROM NPCS 
            WHERE nombre = :NEW.nombre;
    IF v_npc_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20011,'ERROR: El nombre "' || :NEW.nombre || '" ya esta en uso por un NPC.');
    END IF;
END TRG_PJ_NOMBRE_VALIDO;

-- TRIGGER 3: Vamos poniendo eel Id de las misiones 
CREATE OR REPLACE TRIGGER TRG_IDMISION_AUTO
    BEFORE INSERT ON MISIONES
    FOR EACH ROW
BEGIN
    :NEW.idMision := SEQ_IDMISION.NEXTVAL;
END TRG_IDMISION_AUTO;

-- TRIGGER 4: Vamos poniendo el Id de los mobs
CREATE OR REPLACE TRIGGER TRG_IDMOB_AUTO
    BEFORE INSERT ON MOBS
    FOR EACH ROW
BEGIN
    :NEW.idMob := SEQ_IDMOB.NEXTVAL;
END TRG_IDMOB_AUTO;

-- TRIGGER 5: Vamos poniendo el Id de las trasfirguraciones
CREATE OR REPLACE TRIGGER TRG_IDTRASFIG_AUTO
    BEFORE INSERT ON TRASFIGURACIONES
    FOR EACH ROW
BEGIN
    :NEW.idTrasfiguracion := SEQ_IDTRASFIG.NEXTVAL;
END TRG_IDTRASFIG_AUTO;

-- TRIGGER 6: verificamos las combinaciones de raza y de clase que tiene el personaje
CREATE OR REPLACE TRIGGER TRG_PJ_RAZA_CLASE
    BEFORE INSERT OR UPDATE OF raza, clase ON PERSONAJES
    FOR EACH ROW
DECLARE
    v_valido NUMBER := 0;
BEGIN
    BEGIN
        SELECT valido INTO v_valido
          FROM COMBINACIONES
         WHERE raza  = :NEW.raza
           AND clase = :NEW.clase;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20002,'ERROR: No existe combinacion de raza=' || :NEW.raza ||' y clase=' || :NEW.clase || ' en la tabla COMBINACIONES.');
    END;
    IF v_valido = 0 THEN
        RAISE_APPLICATION_ERROR(-20001,'ERROR: La combinacion raza=' || :NEW.raza ||' con l clase=' || :NEW.clase || ' es INVALIDA en WoW.');
    END IF;
END TRG_PJ_RAZA_CLASE;

-- TRIGGER 7: Ponemos la salud de cada personaje
-- salud = nivel*100 + bonus_clase + bonus_raza
CREATE OR REPLACE TRIGGER TRG_PJ_SALUD_AUTO
    BEFORE INSERT ON PERSONAJES
    FOR EACH ROW
DECLARE
    v_bonus_clase NUMBER := 0;
    v_bonus_raza  NUMBER := 0;
BEGIN
    -- Bonus por clase
    v_bonus_clase := CASE :NEW.clase
        WHEN 'guerrero'              THEN 2000
        WHEN 'paladin'               THEN 1500
        WHEN 'caballero de la muerte'THEN 1800
        WHEN 'druida'                THEN 1200
        WHEN 'chaman'                THEN 1000
        WHEN 'sacerdote'             THEN 800
        WHEN 'mago'                  THEN 700
        WHEN 'brujo'                 THEN 750
        WHEN 'cazador'               THEN 900
        WHEN 'picaro'                THEN 850
        ELSE 1000
    END;
    -- Bonus por raza (basado en BONIFICACIONESRACIALES por fuerza)
    BEGIN
        SELECT NVL(fuerza,0)*10 
        INTO v_bonus_raza
        FROM BONIFICACIONESRACIALES 
        WHERE raza = :NEW.raza;
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN v_bonus_raza := 0;
    END;
    -- Calcular salud si no se da explicitamente
    IF :NEW.salud = 0 THEN
        :NEW.salud := (:NEW.nivel * 100) + v_bonus_clase + v_bonus_raza;
    END IF;
END TRG_PJ_SALUD_AUTO;

-- TRIGGER 8: Actualizamos el estado del personajke
CREATE OR REPLACE TRIGGER TRG_PJ_ESTADO_AUTO
    BEFORE INSERT OR UPDATE OF salud, hermandad ON PERSONAJES
    FOR EACH ROW
DECLARE
    v_hermandad_en_pvb NUMBER := 0;
BEGIN
    -- Verifica si la hermandad del PJ esta en un PvB activo
    IF :NEW.hermandad IS NOT NULL THEN
        SELECT COUNT(*) 
        INTO v_hermandad_en_pvb
          FROM PVBS p
         WHERE EXISTS (SELECT 1 
                        FROM HERMANDADES h
                        WHERE h.nombreHermandad = :NEW.hermandad)
            AND p.resultado IS NULL;  -- PvB sin resultado = activo
    END IF;

    IF :NEW.salud <= 0 THEN
        :NEW.estado  := 'MUERTO';
        :NEW.salud   := 0;
    ELSIF v_hermandad_en_pvb > 0 THEN
        :NEW.estado  := 'EN COMBATE';
    ELSE
        :NEW.estado  := 'VIVO';
    END IF;
END TRG_PJ_ESTADO_AUTO;

-- TRIGGER 9: Actuallizamos la experiencia al matar a un MOB
CREATE OR REPLACE TRIGGER TRG_ACTUALIZAR_EXP_MOB
    AFTER INSERT ON PJ_MOBS
    FOR EACH ROW
BEGIN
    UPDATE PERSONAJES
       SET experiencia = experiencia + :NEW.xpMob
     WHERE nombre = :NEW.nombrePJ;
END TRG_ACTUALIZAR_EXP_MOB;

-- TRIGGER 10: Actualizamos oro cuando mata un MOB
CREATE OR REPLACE TRIGGER TRG_ACTUALIZAR_ORO_MOB
    AFTER INSERT ON PJ_MOBS
    FOR EACH ROW
BEGIN
    UPDATE PERSONAJES
       SET oro = oro + :NEW.oroMob
     WHERE nombre = :NEW.nombrePJ;
END TRG_ACTUALIZAR_ORO_MOB;

-- TRIGGER 11: Actualizamos experiencia y oro al matar un boss
CREATE OR REPLACE TRIGGER TRG_ACTUALIZAR_EXP_BOSS
    AFTER INSERT ON PJ_BOSSES
    FOR EACH ROW
BEGIN
    UPDATE PERSONAJES
       SET experiencia = experiencia + :NEW.xpMob,
           oro         = oro         + :NEW.oroMob
     WHERE nombre = :NEW.nombrePJ;
END TRG_ACTUALIZAR_EXP_BOSS;

-- TRIGGER 12: Actualizamos la experiencia y oro al completar mision junto con su recompensa
CREATE OR REPLACE TRIGGER TRG_ACTUALIZAR_MISION_COMPLETADA
    AFTER INSERT ON PJ_MISIONES
    FOR EACH ROW
DECLARE
    v_tipo_recompensa VARCHAR2(20);
BEGIN
    -- Sumamos XP y oro al personaje
    UPDATE PERSONAJES
       SET experiencia = experiencia + :NEW.xpMision,
           oro         = oro         + :NEW.oroMision
     WHERE nombre = :NEW.nombrePJ;

    -- Agregamos la recompensa a la tabla PJ_coso correspondiente segun tipo de objeto
    BEGIN
        INSERT INTO PJ_MONTURAS (nombrePJ, nombreMontura)
        SELECT :NEW.nombrePJ, m.nombreMontura FROM MONTURAS m
         WHERE m.nombreMontura = :NEW.recompensaMision
           AND NOT EXISTS (SELECT 1 FROM PJ_MONTURAS
                            WHERE nombrePJ=:NEW.nombrePJ AND nombreMontura=m.nombreMontura);
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    BEGIN
        INSERT INTO PJ_MASCOTAS (nombrePJ, nombreMascota)
        SELECT :NEW.nombrePJ, m.nombreMascota FROM MASCOTAS m
         WHERE m.nombreMascota = :NEW.recompensaMision
           AND NOT EXISTS (SELECT 1 FROM PJ_MASCOTAS
                            WHERE nombrePJ=:NEW.nombrePJ AND nombreMascota=m.nombreMascota);
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    BEGIN
        INSERT INTO PJ_ARMAS (nombrePJ, nombreArma)
        SELECT :NEW.nombrePJ, a.nombreArma FROM ARMAS a
         WHERE a.nombreArma = :NEW.recompensaMision
           AND NOT EXISTS (SELECT 1 FROM PJ_ARMAS
                            WHERE nombrePJ=:NEW.nombrePJ AND nombreArma=a.nombreArma);
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    BEGIN
        INSERT INTO PJ_ROPAS (nombrePJ, nombreRopa)
        SELECT :NEW.nombrePJ, r.nombreRopa FROM ROPAS r
         WHERE r.nombreRopa = :NEW.recompensaMision
           AND NOT EXISTS (SELECT 1 FROM PJ_ROPAS
                            WHERE nombrePJ=:NEW.nombrePJ AND nombreRopa=r.nombreRopa);
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
    BEGIN
        INSERT INTO PJ_JUGUETES (nombrePJ, nombreJuguete)
        SELECT :NEW.nombrePJ, j.nombreJuguete FROM JUGUETES j
         WHERE j.nombreJuguete = :NEW.recompensaMision
           AND NOT EXISTS (SELECT 1 FROM PJ_JUGUETES
                            WHERE nombrePJ=:NEW.nombrePJ AND nombreJuguete=j.nombreJuguete);
    EXCEPTION WHEN OTHERS THEN NULL;
    END;
END TRG_ACTUALIZAR_MISION_COMPLETADA;

-- TRIGGER 13: Actualizamos el oro en las ventas
CREATE OR REPLACE TRIGGER TRG_ACTUALIZAR_ORO_VENTA
    AFTER INSERT ON PJ_VENTAS
    FOR EACH ROW
BEGIN
    IF :NEW.vendido = 1 THEN
        -- El vendedor gana oro
        UPDATE PERSONAJES SET oro = oro + :NEW.precio
         WHERE nombre = :NEW.nombrePJ;
        -- El comprador pierde oro
        IF :NEW.comprador IS NOT NULL THEN
            UPDATE PERSONAJES SET oro = oro - :NEW.precio
             WHERE nombre = :NEW.comprador;
        END IF;
    END IF;
END TRG_ACTUALIZAR_ORO_VENTA;

-- TRIGGER 14: Actualizamos oro en las compras
CREATE OR REPLACE TRIGGER TRG_ACTUALIZAR_ORO_COMPRA
    AFTER INSERT ON PJ_COMPRAS
    FOR EACH ROW
BEGIN
    UPDATE PERSONAJES SET oro = oro - :NEW.precio WHERE nombre = :NEW.nombrePJ;
END TRG_ACTUALIZAR_ORO_COMPRA;

-- TRIGGER 15: Actualizamos las estadisticas del PJ
CREATE OR REPLACE TRIGGER TRG_ACTUALIZAR_STATS_PJ
    AFTER INSERT OR UPDATE ON PJ_ARMAS
    FOR EACH ROW
BEGIN
    UPDATE PJ_ESTADISTICAS
       SET fuerza       = NVL(fuerza,0)       + NVL(:NEW.fuerza,0)       - NVL(:OLD.fuerza,0),
           agilidad     = NVL(agilidad,0)     + NVL(:NEW.agilidad,0)     - NVL(:OLD.agilidad,0),
           intelecto    = NVL(intelecto,0)    + NVL(:NEW.intelecto,0)    - NVL(:OLD.intelecto,0),
           celeridad    = NVL(celeridad,0)    + NVL(:NEW.celeridad,0)    - NVL(:OLD.celeridad,0),
           critico      = NVL(critico,0)      + NVL(:NEW.critico,0)      - NVL(:OLD.critico,0),
           maestria     = NVL(maestria,0)     + NVL(:NEW.maestria,0)     - NVL(:OLD.maestria,0),
           versatilidad = NVL(versatilidad,0) + NVL(:NEW.versatilidad,0) - NVL(:OLD.versatilidad,0)
     WHERE nombrePJ = :NEW.nombrePJ;
END TRG_ACTUALIZAR_STATS_PJ;

-- TRIGGER 16: Verificamos que una hermandad solo puede tener maximo 1000 integrantes
CREATE OR REPLACE TRIGGER TRG_PJ_HERMANDAD_LIMITE
    BEFORE INSERT OR UPDATE OF hermandad ON PERSONAJES
    FOR EACH ROW
DECLARE
    v_integrantes NUMBER;
BEGIN
    IF :NEW.hermandad IS NOT NULL THEN
        SELECT COUNT(*) INTO v_integrantes
          FROM PERSONAJES
         WHERE hermandad = :NEW.hermandad;
        IF v_integrantes >= 1000 THEN
            RAISE_APPLICATION_ERROR(-20020,'ERROR: La hermandad "' || :NEW.hermandad ||'" ya tiene 1000 integrantes. No se puede unir mas.');
        END IF;
    END IF;
END TRG_PJ_HERMANDAD_LIMITE;

-- TRIGGER 17: Verificamos que el nivel del MOB sea addecuado para su Ciudad
CREATE OR REPLACE TRIGGER TRG_MOB_NIVEL_CIUDAD
    BEFORE INSERT OR UPDATE OF nivel, ciudad ON MOBS
    FOR EACH ROW
DECLARE
    v_nivel_ciudad NUMBER;
BEGIN
    SELECT nivelRecomendado INTO v_nivel_ciudad
      FROM CIUDADES WHERE nombreCiudad = :NEW.ciudad
      AND ROWNUM = 1;
    IF ABS(:NEW.nivel - v_nivel_ciudad) > 10 THEN
        RAISE_APPLICATION_ERROR(-20003,'ERROR: Mob nivel ' || :NEW.nivel ||' difiere mas de 10 del nivel recomendado de la ciudad (' ||v_nivel_ciudad || ').');
    END IF;
EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
END TRG_MOB_NIVEL_CIUDAD;

-- TRIGGER 18: Ropa sin estadisticas
CREATE OR REPLACE TRIGGER TRG_ROPA_ESTADISTICAS
    BEFORE INSERT OR UPDATE ON ROPAS
    FOR EACH ROW
BEGIN
    IF :NEW.daEstadisticas = 0 THEN
        IF NVL(:NEW.fuerza,0) != 0 OR NVL(:NEW.agilidad,0) != 0 OR
           NVL(:NEW.intelecto,0) != 0 OR NVL(:NEW.celeridad,0) != 0 OR
           NVL(:NEW.critico,0) != 0 OR NVL(:NEW.maestria,0) != 0 OR
           NVL(:NEW.versatilidad,0) != 0 THEN
            RAISE_APPLICATION_ERROR(-20004,'ERROR: Ropa cosmetica (daEstadisticas=0) no puede tener estadisticas asignadas.');
        END IF;
    END IF;
END TRG_ROPA_ESTADISTICAS;

-- TRIGGER 19: Gestiona el ranking de personajes
CREATE OR REPLACE TRIGGER TRG_RANKING_PJ
    AFTER INSERT OR UPDATE OF experiencia ON PERSONAJES
    FOR EACH ROW
BEGIN
    DELETE FROM RANKINGPERSONAJES WHERE idPersonaje = :NEW.nombre;
    INSERT INTO RANKINGPERSONAJES (posicion, idPersonaje, puntuacion)
    SELECT ROWNUM, nombre, experiencia
      FROM (SELECT nombre, experiencia 
            FROM PERSONAJES 
            ORDER BY experiencia DESC);
END TRG_RANKING_PJ;

--TRIGGER 20: al ganar un PvB el damage deve ser mayor a 800
CREATE OR REPLACE TRIGGER TRG_PVB_VICTORIA
    BEFORE INSERT OR UPDATE ON PVBS
    FOR EACH ROW
BEGIN
    IF :NEW.resultado = 'VICTORIA' AND NVL(:NEW.damageTotal,0) < 800 THEN
        RAISE_APPLICATION_ERROR(-20005,'ERROR: Una VICTORIA debe tener damageTotal >= 800. Se recibio: ' || :NEW.damageTotal);
    END IF;
END TRG_PVB_VICTORIA;