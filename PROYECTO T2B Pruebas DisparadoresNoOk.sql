/*
DisparadoresNoOK

Intento de ingreso de datos erroneos protegidos por las restricciones de los disparadores.
*/

-- Nombre con numeros
INSERT INTO PERSONAJES (nombre, nivel, experiencia, salud, recurso, oro, estado, clase, raza, profesion1, profesion2, hermandad, hogar, nombreMision, ciudad)
VALUES ('dark123',1,0,100,'IRA,100%,100',0,'VIVO','guerrero','Humano',NULL,NULL,NULL,'Dalaran',NULL,'Dalaran');

--Nombre con espacios 
INSERT INTO PERSONAJES (nombre, nivel, experiencia, salud, recurso, oro, estado,clase, raza, profesion1, profesion2, hermandad, hogar, nombreMision, ciudad)
VALUES ('Dark Knight',1,0,100,'MANA,100%,1000',0,'VIVO','guerrero','Humano',NULL,NULL,NULL,'Dalaran',NULL,'Dalaran');

-- Raza+clase invalida
INSERT INTO PERSONAJES (nombre, nivel, experiencia, salud, recurso, oro, estado,clase, raza, profesion1, profesion2, hermandad, hogar, nombreMision, ciudad)
VALUES ('OrcoPalad',1,0,100,'MANA,100%,1000',0,'VIVO','paladin','Orco',NULL,NULL,NULL,'Orgrimmar',NULL,'Orgrimmar');

-- Raza+clase no registrada 
INSERT INTO PERSONAJES (nombre, nivel, experiencia, salud, recurso, oro, estado,clase, raza, profesion1, profesion2, hermandad, hogar, nombreMision, ciudad)
VALUES ('EnanoDru',1,0,100,'MANA,100%,1000',0,'VIVO','druida','Enano',NULL,NULL,NULL,'Forjaz',NULL,'Forjaz');

-- Mob con nivel incompatible con ciudad 
INSERT INTO MOBS (nombreMob, nivel, salud, damage, tipoCriatura, comportamiento, tiempoRespawn, ciudad)
VALUES ('DragonSupremo',90,9999,999,'DRAGON','AGRESIVO',30,'Ciudad de Ventormenta');

--Ropa cosmetica con stats 
INSERT INTO ROPAS VALUES ('CapeCosmMala',0,100,80,50,30,20,10,5);

-- PVB victoria con damageTotal < 800
INSERT INTO PVBS VALUES (SEQ_IDPVB.NEXTVAL,'RAID','BossFacil','NORMAL','VICTORIA',5,200,100);

-- Intentar poner nombre de personaje ya existente
INSERT INTO PERSONAJES (nombre, nivel, experiencia, salud, recurso, oro, estado,clase, raza, profesion1, profesion2, hermandad, hogar, nombreMision, ciudad)
VALUES ('darkKnight',1,0,100,'IRA,100%,100',0,'VIVO','guerrero','Humano',NULL,NULL,NULL,'Dalaran',NULL,'Dalaran');