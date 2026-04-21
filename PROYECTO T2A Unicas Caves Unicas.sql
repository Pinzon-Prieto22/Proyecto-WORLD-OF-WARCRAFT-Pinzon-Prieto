/*
Unicas
Definición de claves únicas
*/
-- Mundos su descripcion es unica
ALTER TABLE MUNDOS        ADD CONSTRAINT UK_MUNDOS_DESC    UNIQUE (descripcionMundo);
-- Un NPC solo pueden estar en una ciudad
ALTER TABLE NPCS          ADD CONSTRAINT UK_NPCS_CIUDAD    UNIQUE (nombre, cuidad);
-- Los nombres de las ciudades son unicos
ALTER TABLE CIUDADES      ADD CONSTRAINT UK_CIUDAD_NOMBRE  UNIQUE (nombreCiudad);
-- Los nombres de las misiones son unicas
ALTER TABLE MISIONES      ADD CONSTRAINT UK_MIS_NOMBRE     UNIQUE (nombreMision);
-- Los nombres de los personajes don univos
ALTER TABLE PERSONAJES    ADD CONSTRAINT UK_PJ_NOMBRE      UNIQUE (nombre);
-- Los nombres de las hermandades son unicos
ALTER TABLE HERMANDADES   ADD CONSTRAINT UK_HERM_NOMBRE    UNIQUE (nombreHermandad);
-- Los nombres de los hechizos son unicos
ALTER TABLE HECHIZOS      ADD CONSTRAINT UK_HECH_NOMBRE    UNIQUE (nombreHechizo);
-- Los nombres de los mobs son unicos
ALTER TABLE MOBS ADD CONSTRAINT UK_MOB_NOMBRE UNIQUE (nombreMob);
-- Las aparirnncias de las trasfiguraciones son unicas
ALTER TABLE TRASFIGURACIONES ADD CONSTRAINT UK_TRASFIG_APAR UNIQUE (apariencia);
-- EL nombre de cada objeto es unico
ALTER TABLE OBJETOS ADD CONSTRAINT UK_OBJ_NOMBRE UNIQUE (nombreObjeto);