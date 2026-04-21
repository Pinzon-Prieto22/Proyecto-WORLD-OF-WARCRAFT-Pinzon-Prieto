/*
Tuplas

Definición de las restricciones que implican más de un atributo
*/

-- Nivel y experiencia
-- PERSONAJES A partir de nivel >= 10 la experiencia minima es nivel*1000 
ALTER TABLE PERSONAJES ADD CONSTRAINT CHK_PJ_EXP_NIVEL CHECK (nivel < 10 OR experiencia >= nivel * 1000);

-- Tipo de la mision y el nivel requerido
-- MISIONES DIARIAS el nivelRequerido <= 60 Las misiones DIARIA no pueden tener nivel requerido mayor a 60 
ALTER TABLE MISIONES ADD CONSTRAINT CHK_MIS_DIARIA_NIVEL CHECK (tipoMision != 'DIARIA' OR nivelRequerido <= 60);

-- Objeto en estado no vendido y su comprador
-- PJ_VENTAS comprador nulo si no ha vendido Si vendido=0 (false), el comprador DEBE ser NULL
ALTER TABLE PJ_VENTAS ADD CONSTRAINT CHK_VEN_COMP_NULO CHECK (vendido = 1 OR comprador IS NULL);

-- Ropa y estadisticas(7)
-- ROPAS Si la ropa no da estadisticas, Si daEstadisticas=0 todas las estadisticas deben ser 0 o NULL
-- Lo pusimos como trigger mas adelante 

-- Estado del PvB y el daño
-- PvBs la victoria implica que el daño total fue mayor a 800minimo
-- Lo pusimos como trigger mas adelante 

-- Raza y clase
-- PERSONAJES la raza debe ser compatible con la clase
-- Lo pusimos como trigger mas adelante

-- Hermandad y la cantidad de 
-- HERMANDADES pueden tener maximo 1000 integrantes
-- Lo pusimos como trigger mas adelante

-- MOBS que tengan un nivel acorde a su ciudad
-- Lo pusimos como Trigger mas adelante
