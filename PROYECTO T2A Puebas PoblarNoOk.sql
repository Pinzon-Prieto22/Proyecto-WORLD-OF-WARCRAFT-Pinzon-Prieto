/*
PoblarNoOK
Intento de ingreso de datos erroneos protegidos por los tipos de datos, 
definición de nulidades y claves primarias, únicas y foraneas.
*/

-- MUNDOS no puede estar si n descripcion
INSERT INTO MUNDOS VALUES ('MundoMalo',NULL,1);

-- Clima invalido en CONTINENTES
INSERT INTO CONTINENTES VALUES ('ZonaMala','Azeroth','HELADO',10);

-- Nivel recomendado fuera del rango en CONTINENTES
INSERT INTO CONTINENTES VALUES ('ZonaMala','Azeroth','FRIO',99);

-- Rol proncipal invalido en CLASES
INSERT INTO CLASES VALUES ('brujo','SOPORTE','Clase oscura');

-- la PK de Razas no se puede repetir
INSERT INTO RAZAS VALUES ('Humano','ALIANZA','Common');

-- raza que no es valida en PERSONAJES
INSERT INTO PERSONAJES VALUES ('00099.PJMalo.WOW','PJMalo',1,0,100,
    'MANA,100%,1000',0,'VIVO','guerrero','RazaFalsa',NULL,NULL,NULL,'Dalaran',NULL,'Dalaran');

-- nivel fuera de rango en PERSONAJES
INSERT INTO PERSONAJES VALUES ('00099.PJMalo3.WOW','PJMalo3',0,0,100,'MANA,100%,1000',0,'VIVO','guerrero','Humano',
        NULL,NULL,NULL,'Dalaran',NULL,'Dalaran');

-- estado invalido en PERSONAJES
INSERT INTO PERSONAJES VALUES ('00099.PJMalo4.WOW','PJMalo4',10,1000,500,
    'IRA,50%,100',100,'FANTASMA','guerrero','Humano',NULL,NULL,NULL,'Dalaran',NULL,'Dalaran');

-- tipo de objeto invalido en OBJETOS
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'ObjMal','Pocion');

-- insertar una montura en MONTURAS que no existe antes en OBJETOS
INSERT INTO MONTURAS VALUES ('Gryphon Fantasma','Descripcion',300,40,1,20,15,0,5,3,2,1);

-- insertar una arma en ARMAS que no existe antes en OBJETOS
INSERT INTO ARMAS VALUES ('Espada Fantasma','Espada sin registro',
    'ESPADA',10,100,0,30,20,0,5,3,2,1);

-- insertar una mascota en MASCOTAS que no existe antes en OBJETOS
INSERT INTO MASCOTAS VALUES ('Mascota Fantasma','Sin registro en OBJETOS',
    'BESTIA',1,'Fuerte',1,1,1,1,1,1,1,1);
    
-- poner una mision que no existe con un objeto que si existe en RECOMPENSAS
INSERT INTO RECOMPENSAS VALUES (9999, 1);

-- poner una mision que si existe con un objeto que no existe en RECOMPENSAS
INSERT INTO RECOMPENSAS VALUES (1, 9999);

-- repetir recompensas
INSERT INTO RECOMPENSAS VALUES (1, 11);  -- ya lo creamos en PoblarOK

-- repetir objetos
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'Daga sombria','Arma'); 

-- esVoladora debe ser 0 o 1
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'MonturaTestMala','Montura');
INSERT INTO MONTURAS VALUES ('MonturaTestMala','Descripcion',300,40,5,20,15,0,5,3,2,1);

-- nombre de personaje repetido
INSERT INTO PERSONAJES VALUES ('00099.darkKnight.WOW','darkKnight',1,0,100,
    'MANA,100%,1000',0,'VIVO','guerrero','Humano',NULL,NULL,NULL,'Dalaran',NULL,'Dalaran');

-- resultado invalido en PvBs
INSERT INTO PVBS VALUES (SEQ_IDPVB.NEXTVAL,'RAID','Jefe','NORMAL','ABANDONO',30,5000,1000);

-- vendido solo puede ser 0 o 1
INSERT INTO PJ_VENTAS VALUES ('Thrallok','Arco del viento',500,2,NULL);