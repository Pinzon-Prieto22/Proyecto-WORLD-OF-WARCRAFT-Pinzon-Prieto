/*
TuplasNoOK

Intento de ingreso de datos incorrectos con respecto a las restricciones de tupla
*/

-- nivel=15 pero experiencia < 15000 
-- NoOk porque no respeta el check de la xp respeccto al nivel
INSERT INTO PERSONAJES VALUES ('00099.PJMalExp.WOW','PJMalExp',15,100,1000,'MANA,100%,1000',0,'VIVO','guerrero','Humano',NULL,NULL,NULL,'Dalaran',NULL,'Dalaran');

-- mision DIARIA con nivelRequerido=75 > 60 
-- NoOk porque no respeta el check del nivel de la mision diaria
INSERT INTO MISIONES VALUES (SEQ_IDMISION.NEXTVAL,'Mision Imposible','Descripcion',75,'DIARIA','Alderik Cresta',100,50,'Muñeco de gnomo');

-- PJ_VENTAS vendido=0 con comprador != NULL 
-- NoOk porque no respeta que si no se ha vendido el comprador es nulo
INSERT INTO PJ_VENTAS VALUES ('darkKnight','Muñeco de gnomo',50,0,'Tyrande');

-- Ropa qeu solo es cosmetica con estadisticas asignadas
-- NoOk porque no respeta que si no da estadisticas las estadisticas deben sdr cero
INSERT INTO ROPAS VALUES ('CapaCosmeticaMala',0,100,80,50,0,0,0,0);

-- Mob con nivel no adecuado con ciudad
-- NoOk porque no respeta que el nivel del mob debe ser adecuado con la ciudad
INSERT INTO MOBS VALUES (SEQ_IDMOB.NEXTVAL,'Dragon Supremo',80,9999,999,'DRAGON','AGRESIVO',30,'Ciudad de Ventormenta');

-- raza+clase invalida (Orco+paladin=0)
-- NoOk porque no respeta las combinaciones validas
INSERT INTO PERSONAJES VALUES ('00099.OrcoPaladin.WOW','OrcoPaladin',1,0,100,'MANA,100%,1000',0,'VIVO','paladin','Orco',NULL,NULL,NULL,'Orgrimmar',NULL,'Orgrimmar');

-- PVB victoria con damageTotal=200 < 800
-- NoOk porque el damage debe ser minimo 800
INSERT INTO PVBS VALUES (SEQ_IDPVB.NEXTVAL,'MAZMORRA','Enemigo debil','NORMAL','VICTORIA',5,200,100);

-- T8: nombre de personaje con numeros
-- NoOk porque un nombre no puede tener numeros
INSERT INTO PERSONAJES VALUES ('00099.Knight123.WOW','Knight123',1,0,100,'MANA,100%,1000',0,'VIVO','guerrero','Humano',NULL,NULL,NULL,'Dalaran',NULL,'Dalaran');