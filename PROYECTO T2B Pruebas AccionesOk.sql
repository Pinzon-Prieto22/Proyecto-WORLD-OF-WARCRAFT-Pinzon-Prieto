/*
AccionesOK

Casos que prueban las acciones de referencia
*/

-- PRUEBA 1: al borrar un pj tambien borra sus estadisticas
INSERT INTO PERSONAJES VALUES ('00010.TempPJ.WOW','TempPJ',10,12000,1000,
    'MANA,100%,2000',500,'VIVO','guerrero','Humano',NULL,NULL,NULL,'Dalaran',NULL,'Dalaran');
INSERT INTO PJ_ESTADISTICAS VALUES ('TempPJ',50,40,10,20,15,12,8);

SELECT COUNT(*) AS filas_antes_de_borrar
FROM PJ_ESTADISTICAS 
WHERE nombrePJ = 'TempPJ';

DELETE FROM PERSONAJES WHERE nombre = 'TempPJ';

SELECT COUNT(*) AS filas_despues_de_borrar
FROM PJ_ESTADISTICAS 
WHERE nombrePJ = 'TempPJ';

-- PRUEBA 2: al borrar una hermandad pone null al pj que pertenece a esa hermandad
INSERT INTO HERMANDADES VALUES (SEQ_IDHERMANDAD.NEXTVAL,'HermandadTemp',5,SYSDATE,NULL,1000);
INSERT INTO PERSONAJES VALUES ('00011.PJTemp2.WOW','PJTemp2',10,12000,1000,
    'IRA,50%,100',200,'VIVO','guerrero','Humano',NULL,NULL,'HermandadTemp','Dalaran',NULL,'Dalaran');

SELECT nombrePJ||': hermandad='||hermandad AS antes 
FROM PERSONAJES 
WHERE nombre='PJTemp2';

DELETE FROM HERMANDADES WHERE nombreHermandad = 'HermandadTemp';

SELECT nombre, hermandad,
       CASE WHEN hermandad IS NULL THEN 'OK: SET NULL aplicado' ELSE 'ERROR' END AS resultado
FROM PERSONAJES 
WHERE nombre = 'PJTemp2';

DELETE FROM RANKINGPERSONAJES WHERE idPersonaje = 'PJTemp2';
DELETE FROM PERSONAJES WHERE nombre = 'PJTemp2';

-- PRUEBA 3: ON DELETE SET NULL en PERSONAJES.nombreMision ──
INSERT INTO PERSONAJES VALUES ('00012.PJTemp3.WOW','PJTemp3',10,12000,1000,'MANA,100%,1000',200,'VIVO','paladin','Humano',NULL,NULL,NULL,'Dalaran',
    'casa del tesoro de adornos','Dalaran');

SELECT nombre, nombreMision AS antes 
FROM PERSONAJES 
WHERE nombre = 'PJTemp3';

UPDATE PERSONAJES SET nombreMision = NULL WHERE nombre != 'PJTemp3' AND nombreMision = 'casa del tesoro de adornos';

DELETE FROM MISIONES WHERE nombreMision = 'casa del tesoro de adornos';

SELECT nombre, nombreMision,
       CASE WHEN nombreMision IS NULL THEN 'OK: SET NULL aplicado' ELSE 'ERROR' END AS resultado_despues
FROM PERSONAJES 
WHERE nombre = 'PJTemp3';

DELETE FROM RANKINGPERSONAJES WHERE idPersonaje = 'PJTemp3';
DELETE FROM PERSONAJES WHERE nombre = 'PJTemp3';

-- PRUEBA 4: al eliminar una hermandad se elimina del ranking
INSERT INTO HERMANDADES VALUES (SEQ_IDHERMANDAD.NEXTVAL,'HermCascade',10,SYSDATE,NULL,2000);
INSERT INTO RANKINGHERMANDADES VALUES (99,
    (SELECT idHermandad 
    FROM HERMANDADES 
    WHERE nombreHermandad='HermCascade'),10,'TestSeason');

SELECT COUNT(*) AS filas_antes_de_borrar
FROM RANKINGHERMANDADES 
WHERE temporada = 'TestSeason';

DELETE FROM HERMANDADES WHERE nombreHermandad='HermCascade';

SELECT COUNT(*) AS filas_despues_de_borrar
FROM RANKINGHERMANDADES 
WHERE temporada='TestSeason';
