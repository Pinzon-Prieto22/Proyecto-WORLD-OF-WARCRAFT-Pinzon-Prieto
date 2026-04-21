/*
TuplasOK

Ingreso de datos correctos con respecto a la restricciones de tuplas
*/

-- nivel y experiencia 
-- OK porque  nivel=15 >= 10 y experiencia=20000 >= 15*1000=15000
INSERT INTO PERSONAJES VALUES (
    '00005.Varian.WOW','Varian',15,20000,1500,'IRA,80%,100',3000,'VIVO',
    'guerrero','Humano',NULL,NULL,NULL,'Ciudad de Ventormenta',NULL,'Ciudad de Ventormenta');

-- mision DIARIA con nivelRequerido <= 60
-- OK porque DIARIA y nivelRequerido=15 <= 60
INSERT INTO MISIONES VALUES (SEQ_IDMISION.NEXTVAL,'Patrulla del alba','Patrulla el sector norte',15,'DIARIA',
    'Alderik Cresta',300,100,'Arco del viento');

-- PJ_VENTAS con vendido=0 el comprador DEBE ser NULL
-- OK porque vendido=0 y comprador=NULL cumplimos el CHK_VEN_COMP_NULO
INSERT INTO PJ_VENTAS VALUES ('Varian','Muñeco de gnomo',50,0,NULL);

-- PJ_VENTAS con vendido=1 el comprador es una persona real
-- OKporque vendido=1 y comprador no es NULL
INSERT INTO PJ_VENTAS VALUES ('Varian','Daga sombria',150,1,'darkKnight');

-- Ropa que solo es cosmetica con todos los stats en 0 respeta el TRG_ROPA_ESTADISTICAS
-- OK porque daEstadisticas=0 y todos los stats = 0
INSERT INTO ROPAS VALUES ('Traje de fiesta v2',0,0,0,0,0,0,0,0);

-- Mob con nivel adecuado con ciudad 
-- Dalaran nivel=74; mob nivel=72 su diferencia da 2 <= 10
INSERT INTO MOBS VALUES (SEQ_IDMOB.NEXTVAL,'Golem de hielo',72,5000,400,'MECANICO','DEFENSIVO',10,'Dalaran');

-- combinacion raza+clase valida (Tauren+druida=1)
-- OK porque Tauren+druida tiene valido=1 en COMBINACIONES
INSERT INTO PERSONAJES VALUES (
    '00006.Moonfang.WOW','Moonfang',40,45000,4000,'MANA,50%,6000',10000,'VIVO',
    'druida','Tauren',NULL,NULL,NULL,'Cima del Trueno',NULL,'Cima del Trueno');