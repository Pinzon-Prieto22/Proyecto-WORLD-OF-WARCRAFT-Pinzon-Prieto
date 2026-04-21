/*
DisparadoresOK

Ingreso de datos usando la automatización definida en los disparadores.
*/

-- PRUEBA 1: Crea automaticamente el Id del personaje
INSERT INTO PERSONAJES (nombre, nivel, experiencia, salud, recurso, oro, estado,clase, raza, profesion1, profesion2, hermandad, hogar, nombreMision, ciudad)
VALUES ('Sylvanas',60,60000,5500,'MANA,65%,8000',20000,'VIVO','cazador','Elfo de sangre',NULL,NULL,NULL,'Orgrimmar',NULL,'Orgrimmar');

INSERT INTO PERSONAJES (nombre, nivel, experiencia, salud, recurso, oro, estado, clase, raza, profesion1, profesion2, hermandad, hogar, nombreMision, ciudad)
VALUES ('Garrosh',80,90000,9000,'IRA,100%,1000',50000,'VIVO','guerrero','Orco',NULL,NULL,NULL,'Orgrimmar',NULL,'Orgrimmar');

SELECT idPersonaje, nombre, nivel 
FROM PERSONAJES 
WHERE nombre IN ('Sylvanas','Garrosh');

-- PRUEBA 2: Crea automaticamente el id d la  mision
INSERT INTO MISIONES (nombreMision, descripcion, nivelRequerido, tipoMision, npcAsignador, xpMision, oroMision, recompensa)
VALUES ('La amenaza de Hogger','Hogger ha vuelto a atacar',5,'HISTORIA', Alderik Cresta',2000,1000,'Daga sombria');

INSERT INTO MISIONES (nombreMision, descripcion, nivelRequerido, tipoMision, npcAsignador, xpMision, oroMision, recompensa)
VALUES ('Suministros de guerra','Consigue 10 cueros de lobo',1,'DIARIA', 'Kargok',300,150,'Arco del viento');

SELECT idMision, nombreMision 
FROM MISIONES 
ORDER BY idMision;

-- PRUEBA 3: Crea automaticamente el id del mob
INSERT INTO MOBS (nombreMob, nivel, salud, damage, tipoCriatura, comportamiento, tiempoRespawn, ciudad)
VALUES ('Murmullo del pantano',12,150,18,'BESTIA','AGRESIVO',2,'Forjaz');

SELECT idMob, nombreMob 
FROM MOBS 
ORDER BY idMob;

-- PRUEBA 4: Crea automatucamente el id de la trasfiguracion
INSERT INTO TRASFIGURACIONES (apariencia) VALUES ('Aspecto de la luna');
INSERT INTO TRASFIGURACIONES (apariencia) VALUES ('Forma de tierra');

SELECT idTrasfiguracion, apariencia 
FROM TRASFIGURACIONES 
ORDER BY idTrasfiguracion;

-- PRUEBA 5: Actualiza la experiencia al matar un nob
SELECT nombre, experiencia AS antes
FROM PERSONAJES 
WHERE nombre='Sylvanas';

INSERT INTO PJ_MOBS VALUES ('Sylvanas','Lobo de las estepas',150,300);

SELECT nombre, experiencia AS despues
FROM PERSONAJES 
WHERE nombre='Sylvanas';

-- PRUEBA 6: Actualiza el oro en ventas
SELECT nombre, oro AS antes
FROM PERSONAJES 
WHERE nombre IN ('Garrosh','Sylvanas');

INSERT INTO PJ_VENTAS VALUES ('Garrosh','Peto de hierro negro',500,1,'Sylvanas');

SELECT nombre, oro AS despues
FROM PERSONAJES 
WHERE nombre IN ('Garrosh','Sylvanas');

-- PRUEBA 7: Al completar una mision se actualiza lo que tiene el pj
SELECT nombreArma AS antes
FROM PJ_ARMAS 
WHERE nombrePJ='Sylvanas';

INSERT INTO PJ_MISIONES VALUES ('Sylvanas','La amenaza de Hogger',2000,1000,'Daga sombria');

SELECT nombreArma AS despues
FROM PJ_ARMAS 
WHERE nombrePJ='Sylvanas';

-- PRUEBA 8: Calcula la salud del pj
INSERT INTO PERSONAJES (nombre, nivel, experiencia, salud, recurso, oro, estado, clase, raza, profesion1, profesion2, hermandad, hogar, nombreMision, ciudad)
VALUES ('Jaina',50,55000,0,'MANA,80%,15000',25000,'VIVO','mago','Humano',NULL,NULL,NULL,'Dalaran',NULL,'Dalaran');

SELECT nombre, nivel, salud AS salud_auto_calculada 
FROM PERSONAJES 
WHERE nombre = 'Jaina';
-- salud = 50*100 + 700 (mago) + 50 (humano bonus) = 5750 aproximadamente