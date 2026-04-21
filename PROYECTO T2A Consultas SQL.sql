/*
Consultas
Consulta SQL 
Incluir identificador
*/

-- MUNDOS
SELECT nombreMundo AS "PK MUNDO", descripcionMundo AS "DESCRIPCION", versionMundo AS "VERSION" 
FROM MUNDOS;

-- CONTINENTES
SELECT nombreContinente||'-'||nombreMundo AS "PK CONTINENTE", nombreContinente AS "CONTINENTE", clima AS "CLIMA", nivelRecomendado AS "NIVEL"
FROM CONTINENTES;

-- PAISES
SELECT nombrePais||'-'||nombreContinente||'-'||nombreMundo AS "PK PAIS", nombrePais AS "PAIS", tipoZona AS "TIPO ZONA", nivelRecomendado AS "NIVEL" 
FROM PAISES;

-- CIUDADES
SELECT nombreCiudad||'-'||nombrePais||'-'||nombreContinente||'-'||nombreMundo AS "PK CIUDAD", nombreCiudad AS "CIUDAD", nivelRecomendado AS "NIVEL" , faccionDominante AS "FACCION" 
FROM CIUDADES;

-- RAZAS
SELECT nombreR AS "PK_RAZA", faccion, idioma 
FROM RAZAS;

-- CLASES
SELECT nombreC AS "PK_CLASE", rolPrincipal AS "ROL", descripcion 
FROM CLASES;

-- COMBINACIONES
SELECT raza||'+'||clase AS "COMBINACION",
CASE valido WHEN 1 THEN 'TRUE' ELSE 'FALSE' END AS valido 
FROM COMBINACIONES;

-- BONIFICACIONESRACIALES
SELECT raza AS "RAZA", fuerza, agilidad, intelecto, celeridad, critico, maestria, versatilidad 
FROM BONIFICACIONESRACIALES;

-- LOGROS
SELECT nombreLogro AS "PK_LOGRO", descripcionLogro, puntosLogro 
FROM LOGROS;

-- PROFESIONES
SELECT nombreProfesion AS "PK_PROFESION", nivelProfesion, especializacionProfesion, recetas 
FROM PROFESIONES;

-- ICONOS
SELECT idIcono AS "ID_ICONO", ruta, tamaño, formato 
FROM ICONOS;

-- HECHIZOS
SELECT idHechizo AS "ID_HECHIZO", nombreHechizo, tipoHechizo, costoRecurso, nivelRequerido 
FROM HECHIZOS;

-- MACROS
SELECT idMacro AS "ID_MACRO", nombreMacro, idIcono, idHechizo 
FROM MACROS;

-- MONTURAS
SELECT nombreMontura AS "ID_MONTURA", velocidad, nivelRequerido,
CASE esVoladora WHEN 1 THEN 'SI' ELSE 'NO' END AS esVoladora 
FROM MONTURAS;

-- MASCOTAS
SELECT nombreMascota AS "PK_MASCOTA", tipoMascota, nivelMascota,
CASE esCombate WHEN 1 THEN 'COMBATE' ELSE 'COMPAÑIA' END AS esCombate 
FROM MASCOTAS;

-- JUGUETES
SELECT nombreJuguete AS "PK_JUGUETE", efecto, tiempoReutilizacion 
FROM JUGUETES;

-- ARMAS
SELECT nombreArma AS "PK_ARMA", tipoArma, nivelRequerido,
CASE esDosManos WHEN 1 THEN 'SI' ELSE 'NO' END AS esDosManos 
FROM ARMAS;

-- ROPAS
SELECT nombreRopa AS "PK_ROPA",
CASE daEstadisticas WHEN 1 THEN 'CON STATS' ELSE 'COSMETICA' END AS tipo 
FROM ROPAS;

-- TRASFIGURACIONES
SELECT idTrasfiguracion AS "ID_TRASFIG", apariencia 
FROM TRASFIGURACIONES;

-- NPCS
SELECT nombre AS "PK_NPC", cuidad, tipo 
FROM NPCS;

-- OBJETOS
SELECT idObjeto AS "ID_OBJETO", nombreObjeto, tipoObjeto 
FROM OBJETOS;

-- MISIONES
SELECT idMision AS "ID_MISION", nombreMision, tipoMision, nivelRequerido, npcAsignador, xpMision, oroMision 
FROM MISIONES;

-- RECOMPENSAS
SELECT r.idMision, m.nombreMision, r.idObjeto, o.nombreObjeto, o.tipoObjeto
FROM   RECOMPENSAS r
JOIN   MISIONES m ON m.idMision = r.idMision
JOIN   OBJETOS  o ON o.idObjeto = r.idObjeto;

-- MOBS
SELECT idMob AS "ID_MOB", nombreMob, nivel, tipoCriatura, comportamiento, ciudad 
FROM MOBS;

-- PVBS
SELECT idPvB AS "ID_PVB", tipoDeEncuentro, boss, dificultad, resultado, duracion 
FROM PVBS;

-- HERMANDADES
SELECT idHermandad AS "ID_HERMANDAD", nombreHermandad, nivelHermandades, idLider 
FROM HERMANDADES;

-- PERSONAJES  (tabla central con todas sus columnas)
SELECT idPersonaje AS "ID_PERSONAJE", nombre, nivel, experiencia, salud, recurso, oro, estado, clase, raza, profesion1, profesion2, hermandad, hogar, nombreMision, ciudad 
FROM PERSONAJES;

-- PJ_ESTADISTICAS
SELECT nombrePJ, fuerza, agilidad, intelecto, celeridad, critico, maestria, versatilidad 
FROM PJ_ESTADISTICAS;

-- PJ_MONTURAS
SELECT nombrePJ||'+'||nombreMontura AS "ID_PJMONT", nombrePJ, nombreMontura, trasfiguracion 
FROM PJ_MONTURAS;

-- PJ_MASCOTAS
SELECT nombrePJ||'+'||nombreMascota AS "ID_PJMASC", nombrePJ, nombreMascota, trasfiguracion 
FROM PJ_MASCOTAS;

-- PJ_JUGUETES
SELECT nombrePJ||'+'||nombreJuguete AS "ID_PJJUG", nombrePJ, nombreJuguete, trasfiguracion 
FROM PJ_JUGUETES;

-- PJ_ARMAS
SELECT nombrePJ||'+'||nombreArma AS "ID_PJARMA",nombrePJ, nombreArma, trasfiguracion 
FROM PJ_ARMAS;

-- PJ_ROPAS
SELECT nombrePJ||'+'||nombreRopa AS "ID_PJROPA", nombrePJ, nombreRopa, trasfiguracion 
FROM PJ_ROPAS;

-- PJ_MOBS
SELECT nombrePJ||'+'||mob AS "ID_PJMOB", nombrePJ, mob, xpMob, oroMob 
FROM PJ_MOBS;

-- PJ_BOSSES
SELECT nombrePJ||'+'||mob AS "ID_PJBOSS", nombrePJ, mob, xpMob, oroMob 
FROM PJ_BOSSES;

-- PJ_MISIONES
SELECT nombrePJ||'+'||mision AS "ID_PJMISIONES", nombrePJ, mision, xpMision, oroMision 
FROM PJ_MISIONES;

-- PJ_VENTAS
SELECT nombrePJ||'+'||objeto AS "ID_PJVEN",nombrePJ, objeto, precio,
CASE vendido WHEN 1 THEN 'VENDIDO' ELSE 'DISPONIBLE' END AS vendido, comprador 
FROM PJ_VENTAS;

-- PJ_COMPRAS
SELECT nombrePJ||'+'||objeto AS "ID_PJCOM", nombrePJ, objeto, precio, vendedor 
FROM PJ_COMPRAS;

-- ESPECIALIZACIONES
SELECT idPersonaje||'-'||TO_CHAR(idHechizo) AS "ID_ESPEC", idPersonaje, idHechizo, rolEspecializacion 
FROM ESPECIALIZACIONES;

-- RANKINGPERSONAJES
SELECT posicion AS "POSICION", idPersonaje, puntuacion
FROM RANKINGPERSONAJES 
ORDER BY posicion;

-- RANKINGHERMANDADES
SELECT posicion AS "POSICION", idHermandad, puntuacionH, temporada
FROM RANKINGHERMANDADES 
ORDER BY posicion;