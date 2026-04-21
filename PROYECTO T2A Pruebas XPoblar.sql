/*
XPoblar

Eliminación de datos
*/

-- Rankings
DELETE FROM RANKINGHERMANDADES WHERE temporada = 'Temporada 1';
DELETE FROM RANKINGPERSONAJES  WHERE idPersonaje = 'Cairno';
DELETE FROM RANKINGPERSONAJES  WHERE idPersonaje = 'Thrallok';
DELETE FROM RANKINGPERSONAJES  WHERE idPersonaje = 'Tyrande';
DELETE FROM RANKINGPERSONAJES  WHERE idPersonaje = 'darkKnight';

-- Tablas PJ_* de Cairno
DELETE FROM PJ_MONTURAS WHERE nombrePJ = 'Cairno';
DELETE FROM PJ_MASCOTAS WHERE nombrePJ = 'Cairno';
DELETE FROM PJ_ARMAS    WHERE nombrePJ = 'Cairno';
DELETE FROM PJ_ROPAS    WHERE nombrePJ = 'Cairno';
DELETE FROM PJ_MOBS     WHERE nombrePJ = 'Cairno';
DELETE FROM PJ_BOSSES   WHERE nombrePJ = 'Cairno';
DELETE FROM PJ_MISIONES WHERE nombrePJ = 'Cairno';
DELETE FROM PJ_VENTAS   WHERE nombrePJ = 'Cairno';
DELETE FROM PJ_COMPRAS  WHERE nombrePJ = 'Cairno';
DELETE FROM PJ_ESTADISTICAS WHERE nombrePJ = 'Cairno';

-- Tablas PJ_* de Thrallok
DELETE FROM PJ_MONTURAS WHERE nombrePJ = 'Thrallok';
DELETE FROM PJ_MASCOTAS WHERE nombrePJ = 'Thrallok';
DELETE FROM PJ_ARMAS    WHERE nombrePJ = 'Thrallok';
DELETE FROM PJ_ROPAS    WHERE nombrePJ = 'Thrallok';
DELETE FROM PJ_MOBS     WHERE nombrePJ = 'Thrallok';
DELETE FROM PJ_BOSSES   WHERE nombrePJ = 'Thrallok';
DELETE FROM PJ_MISIONES WHERE nombrePJ = 'Thrallok';
DELETE FROM PJ_VENTAS   WHERE nombrePJ = 'Thrallok';
DELETE FROM PJ_COMPRAS  WHERE nombrePJ = 'Thrallok';
DELETE FROM PJ_ESTADISTICAS WHERE nombrePJ = 'Thrallok';

-- Tablas PJ_* de Tyrande
DELETE FROM PJ_MONTURAS WHERE nombrePJ = 'Tyrande';
DELETE FROM PJ_MASCOTAS WHERE nombrePJ = 'Tyrande';
DELETE FROM PJ_ARMAS    WHERE nombrePJ = 'Tyrande';
DELETE FROM PJ_ROPAS    WHERE nombrePJ = 'Tyrande';
DELETE FROM PJ_MOBS     WHERE nombrePJ = 'Tyrande';
DELETE FROM PJ_BOSSES   WHERE nombrePJ = 'Tyrande';
DELETE FROM PJ_MISIONES WHERE nombrePJ = 'Tyrande';
DELETE FROM PJ_VENTAS   WHERE nombrePJ = 'Tyrande';
DELETE FROM PJ_COMPRAS  WHERE nombrePJ = 'Tyrande';
DELETE FROM PJ_ESTADISTICAS WHERE nombrePJ = 'Tyrande';

-- Tablas PJ_* de darkKnight
DELETE FROM PJ_MONTURAS WHERE nombrePJ = 'darkKnight';
DELETE FROM PJ_MASCOTAS WHERE nombrePJ = 'darkKnight';
DELETE FROM PJ_ARMAS    WHERE nombrePJ = 'darkKnight';
DELETE FROM PJ_ROPAS    WHERE nombrePJ = 'darkKnight';
DELETE FROM PJ_MOBS     WHERE nombrePJ = 'darkKnight';
DELETE FROM PJ_BOSSES   WHERE nombrePJ = 'darkKnight';
DELETE FROM PJ_MISIONES WHERE nombrePJ = 'darkKnight';
DELETE FROM PJ_VENTAS   WHERE nombrePJ = 'darkKnight';
DELETE FROM PJ_COMPRAS  WHERE nombrePJ = 'darkKnight';
DELETE FROM PJ_ESTADISTICAS WHERE nombrePJ = 'darkKnight';

-- para Personajes
UPDATE PERSONAJES  SET hermandad = NULL WHERE nombre = 'darkKnight';
UPDATE HERMANDADES SET idLider   = NULL  WHERE idLider = 'darkKnight';
DELETE FROM PERSONAJES WHERE nombre = 'darkKnight';
UPDATE PERSONAJES  SET hermandad = NULL WHERE nombre = 'Thrallok';
UPDATE HERMANDADES SET idLider   = NULL  WHERE idLider = 'Thrallok';
DELETE FROM PERSONAJES WHERE nombre = 'Thrallok';
DELETE FROM PERSONAJES WHERE nombre = 'Cairno';
DELETE FROM PERSONAJES WHERE nombre = 'Tyrande';

-- Borrar una mision: primero sus RECOMPENSAS, luego la mision
-- (y quitar la referencia desde PERSONAJES si la tienen activa)
UPDATE PERSONAJES SET nombreMision = NULL
 WHERE nombreMision = 'casa del tesoro de adornos';
DELETE FROM RECOMPENSAS WHERE idMision =
    (SELECT idMision FROM MISIONES WHERE nombreMision = 'casa del tesoro de adornos');
DELETE FROM MISIONES WHERE nombreMision = 'casa del tesoro de adornos';
COMMIT;


DELETE FROM PJ_VENTAS  WHERE objeto = 'Pez espadin';
DELETE FROM PJ_COMPRAS WHERE objeto = 'Pez espadin';
DELETE FROM PJ_JUGUETES WHERE nombreJuguete = 'Pez espadin';
DELETE FROM JUGUETES WHERE nombreJuguete = 'Pez espadin';
DELETE FROM OBJETOS  WHERE nombreObjeto = 'Pez espadin';
COMMIT;

-- Borrar la Loba negra (montura sin PJ activo luego de borrar Cairno):
-- Orden: PJ_MONTURAS → MONTURAS → OBJETOS
DELETE FROM PJ_MONTURAS WHERE nombreMontura = 'Loba negra';
DELETE FROM MONTURAS    WHERE nombreMontura = 'Loba negra';
DELETE FROM OBJETOS     WHERE nombreObjeto  = 'Loba negra';
COMMIT;

-- Borrar un NPC sin misiones activas
UPDATE MISIONES SET npcAsignador = 'Alderik Cresta' WHERE npcAsignador = 'Rivok Veloz';
DELETE FROM NPCS WHERE nombre = 'Rivok Veloz';
COMMIT;

-- Borrar un mob sin referencias de PJ
DELETE FROM MOBS WHERE nombreMob = 'Murloc barbacuero';
COMMIT;

-- Borrar mundo temporal de prueba
INSERT INTO MUNDOS VALUES ('MundoTemp','Descripcion temporal de prueba',99);
DELETE FROM MUNDOS WHERE nombreMundo = 'MundoTemp';
COMMIT;