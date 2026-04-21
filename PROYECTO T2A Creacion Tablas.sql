/*
Tablas
Creación de tablas
*/

-- Tabla MUNDOS
CREATE TABLE MUNDOS (
    nombreMundo      VARCHAR2(20)  NOT NULL, --PK
    descripcionMundo VARCHAR2(300) NOT NULL, --UK
    versionMundo     NUMBER(5)     NOT NULL
);

-- Tabla CONTINENTES
CREATE TABLE CONTINENTES (
    nombreContinente VARCHAR2(20) NOT NULL, --PK
    nombreMundo      VARCHAR2(20) NOT NULL, --PK FK
    clima            VARCHAR2(20) NOT NULL,
    nivelRecomendado NUMBER(2)    NOT NULL
);

-- Tabla PAISES
CREATE TABLE PAISES (
    nombrePais       VARCHAR2(20) NOT NULL, --PK
    nombreContinente VARCHAR2(20) NOT NULL, --PK FK
    nombreMundo      VARCHAR2(20) NOT NULL, --PK FK
    tipoZona         VARCHAR2(20) NOT NULL,
    nivelRecomendado NUMBER(2)    NOT NULL
);

-- Tabla CIUDADES
CREATE TABLE CIUDADES (
    nombreCiudad     VARCHAR2(20) NOT NULL, --PK
    nombrePais       VARCHAR2(20) NOT NULL, --PK FK 
    nombreContinente VARCHAR2(20) NOT NULL, --PK FK
    nombreMundo      VARCHAR2(20) NOT NULL, --PK FK
    nivelRecomendado NUMBER(2)    NOT NULL, --FK = nivelRecomendadoPaises
    faccionDominante VARCHAR2(20) NOT NULL
);

-- Tabla RAZAS
CREATE TABLE RAZAS (
    nombreR VARCHAR2(25) NOT NULL, --PK
    faccion VARCHAR2(25) NOT NULL,
    idioma  VARCHAR2(25) NOT NULL
);

-- Tabla CLASES
CREATE TABLE CLASES (
    nombreC      VARCHAR2(25)  NOT NULL, --PK
    rolPrincipal VARCHAR2(6)   NOT NULL,
    descripcion  VARCHAR2(300) NOT NULL
);

-- Tabla COMBINACIONES  (tabla de combiancioned raza-clase validas)
CREATE TABLE COMBINACIONES (
    raza   VARCHAR2(25) NOT NULL,
    clase  VARCHAR2(25) NOT NULL,
    valido NUMBER(1)    NOT NULL   -- 1=true, 0=false
);

-- Tabla BONIFICACIONESRACIALES
CREATE TABLE BONIFICACIONESRACIALES (
    raza         VARCHAR2(25) NOT NULL, --FK
    fuerza       NUMBER(5),
    agilidad     NUMBER(5),
    intelecto    NUMBER(5),
    celeridad    NUMBER(5),
    critico      NUMBER(5),
    maestria     NUMBER(5),
    versatilidad NUMBER(5)
);

-- Tabla LOGROS
CREATE TABLE LOGROS (
    nombreLogro      VARCHAR2(50)  NOT NULL, --PK
    descripcionLogro VARCHAR2(300) NOT NULL,    
    puntosLogro      NUMBER(5)     NOT NULL
);

-- Tabla PROFESIONES
CREATE TABLE PROFESIONES (
    nombreProfesion          VARCHAR2(30)  NOT NULL,--PK
    nivelProfesion           NUMBER(3)     NOT NULL,
    especializacionProfesion VARCHAR2(50)  NOT NULL,
    recetas                  VARCHAR2(300) NOT NULL
);

-- Tabla ICONOS
CREATE TABLE ICONOS (
    idIcono NUMBER(5)    NOT NULL, --OK
    ruta    VARCHAR2(50) NOT NULL,
    tamaño NUMBER(3)    NOT NULL,
    formato VARCHAR2(5)  NOT NULL
);

-- Tabla HECHIZOS
CREATE TABLE HECHIZOS (
    idHechizo           NUMBER(5)    NOT NULL, --PK
    nombreHechizo       VARCHAR2(50) NOT NULL,
    descripcion         VARCHAR2(300)NOT NULL,
    tipoHechizo         VARCHAR2(20) NOT NULL,
    costoRecurso        NUMBER(5)    NOT NULL,
    tiempoLanzamiento   NUMBER(3)    NOT NULL,
    tiempoReutilizacion NUMBER(3)    NOT NULL,
    nivelRequerido      NUMBER(2)    NOT NULL,
    icono               NUMBER(5)    NOT NULL  -- FK -> ICONOS
);

-- Tabla MACROS
CREATE TABLE MACROS (
    idMacro          NUMBER(10)    NOT NULL, --PK
    idIcono          NUMBER(5)     NOT NULL, --PK FK
    idHechizo        NUMBER(5)     NOT NULL, --PK FK
    nombreMacro      VARCHAR2(20)  NOT NULL,
    comandos         VARCHAR2(200) NOT NULL,
    descripcionMacro VARCHAR2(300) NOT NULL
);

-- Tabla MONTURAS
CREATE TABLE MONTURAS (
    nombreMontura      VARCHAR2(20) NOT NULL, --PK FK
    descripcionMontura VARCHAR2(50) NOT NULL,
    velocidad          NUMBER(3)    NOT NULL,
    nivelRequerido     NUMBER(2)    NOT NULL,
    esVoladora         NUMBER(1)    NOT NULL,  -- 0=false 1=true
    fuerza             NUMBER(5),
    agilidad           NUMBER(5),
    intelecto          NUMBER(5),
    celeridad          NUMBER(5),
    critico            NUMBER(5),
    maestria           NUMBER(5),
    versatilidad       NUMBER(5)
);

-- Tabla MASCOTAS
CREATE TABLE MASCOTAS (
    nombreMascota      VARCHAR2(20) NOT NULL, --PK FK
    descripcionMascota VARCHAR2(50) NOT NULL,
    tipoMascota        VARCHAR2(20) NOT NULL,
    nivelMascota       NUMBER(2)    NOT NULL,
    poderMascota       VARCHAR2(20) NOT NULL,
    esCombate          NUMBER(1)    NOT NULL,  -- 0=false 1=true
    fuerza             NUMBER(5),
    agilidad           NUMBER(5),
    intelecto          NUMBER(5),
    celeridad          NUMBER(5),
    critico            NUMBER(5),
    maestria           NUMBER(5),
    versatilidad       NUMBER(5)
);

-- Tabla JUGUETES
CREATE TABLE JUGUETES (
    nombreJuguete       VARCHAR2(20) NOT NULL, --PK FK
    descripcionJuguete  VARCHAR2(50) NOT NULL,
    efecto              VARCHAR2(50),
    tiempoReutilizacion NUMBER(3)    NOT NULL,
    esAplicable         NUMBER(1)    NOT NULL,  -- 0=false 1=true
    fuerza              NUMBER(5),
    agilidad            NUMBER(5),
    intelecto           NUMBER(5),
    celeridad           NUMBER(5),
    critico             NUMBER(5),
    maestria            NUMBER(5),
    versatilidad        NUMBER(5)
);

-- Tabla ARMAS
CREATE TABLE ARMAS (
    nombreArma      VARCHAR2(20) NOT NULL, --PK FK
    descripcionArma VARCHAR2(50) NOT NULL,
    tipoArma        VARCHAR2(20) NOT NULL,
    nivelRequerido  NUMBER(2)    NOT NULL,
    durabilidad     NUMBER(3)    NOT NULL,
    esDosManos      NUMBER(1)    NOT NULL,  -- 0=false 1=true
    fuerza          NUMBER(5),
    agilidad        NUMBER(5),
    intelecto       NUMBER(5),
    celeridad       NUMBER(5),
    critico         NUMBER(5),
    maestria        NUMBER(5),
    versatilidad    NUMBER(5)
);

-- Tabla ROPAS
CREATE TABLE ROPAS (
    nombreRopa     VARCHAR2(20) NOT NULL,--PK FK
    daEstadisticas NUMBER(1)    NOT NULL,  -- 0=false 1=true
    fuerza         NUMBER(5),
    agilidad       NUMBER(5),
    intelecto      NUMBER(5),
    celeridad      NUMBER(5),
    critico        NUMBER(5),
    maestria       NUMBER(5),
    versatilidad   NUMBER(5)
);

-- Tabla TRASFIGURACIONES
CREATE TABLE TRASFIGURACIONES (
    idTrasfiguracion NUMBER(5)    NOT NULL, --PK
    apariencia       VARCHAR2(20) NOT NULL
);

-- Tabla NPCs
CREATE TABLE NPCS (
    nombre  VARCHAR2(20)  NOT NULL, --PK
    cuidad  VARCHAR2(20), --PK
    tipo    VARCHAR2(15),
    dialogo VARCHAR2(300)
);

-- Tabla MISIONES
CREATE TABLE MISIONES (
    idMision       NUMBER(10)    NOT NULL, --PK
    nombreMision   VARCHAR2(100) NOT NULL,
    descripcion    VARCHAR2(300) NOT NULL,
    nivelRequerido NUMBER(2)     NOT NULL,
    tipoMision     VARCHAR2(11)  NOT NULL,
    npcAsignador   VARCHAR2(20)  NOT NULL,
    xpMision       NUMBER(6)     NOT NULL,
    oroMision      NUMBER(7)     NOT NULL
);

-- Tabla RECOMPENSAS
CREATE TABLE RECOMPENSAS (
    idMision NUMBER(10) NOT NULL, --PK y FK misiones
    idObjeto NUMBER(10) NOT NULL --PK y FK objetos
);

-- Tabla Objetos
CREATE TABLE OBJETOS (
    idObjeto     NUMBER(10) NOT NULL, --PK
    nombreObjeto VARCHAR2(20) NOT NULL,  -- UK
    tipoObjeto   VARCHAR2(20) NOT NULL -- PUEDE SER: Montura / Mascota / Juguete / Arma / Ropa
);

-- Tabla MOBS 
CREATE TABLE MOBS (
    idMob          NUMBER(10)   NOT NULL, --PK
    nombreMob      VARCHAR2(20) NOT NULL,
    nivel          NUMBER(2)    NOT NULL,
    salud          NUMBER(4)    NOT NULL,
    damage         NUMBER(4)    NOT NULL,
    tipoCriatura   VARCHAR2(20) NOT NULL,
    comportamiento VARCHAR2(15) NOT NULL,
    tiempoRespawn  NUMBER(3)    NOT NULL,
    ciudad         VARCHAR2(20) NOT NULL --FK
);

-- Tabla PVBS
CREATE TABLE PVBS (
    idPvB           NUMBER(10)   NOT NULL, --PK
    tipoDeEncuentro VARCHAR2(20) NOT NULL,
    boss            VARCHAR2(50) NOT NULL,
    dificultad      VARCHAR2(20) NOT NULL,
    resultado       VARCHAR2(10) NOT NULL,
    duracion        NUMBER(5)    NOT NULL,
    damageTotal     NUMBER(10)   NOT NULL,
    sanacionTotal   NUMBER(10)   NOT NULL
);

-- Tabla HERMANDADES  
CREATE TABLE HERMANDADES (
    idHermandad         NUMBER(10)   NOT NULL, --PK
    nombreHermandad     VARCHAR2(50) NOT NULL,
    nivelHermandades    NUMBER(3)    NOT NULL,
    fechaCreacion       DATE         NOT NULL,
    idLider             VARCHAR2(12),  -- FK -> PERSONAJES
    reputacionHermandad NUMBER(7)    NOT NULL
);

-- Tabla PERSONAJES
CREATE TABLE PERSONAJES (
    idPersonaje  VARCHAR2(25)  NOT NULL,   -- PK  auto-generado: NNNNN.nombre.WOW   
    nombre       VARCHAR2(12)  NOT NULL,   -- UK  solo letras sin espacios ni caracteres especiales
    nivel        NUMBER(2)     NOT NULL,   -- CHECK 1-90
    experiencia  NUMBER(6)     NOT NULL,   -- calculada automaticamente
    salud        NUMBER(5)     NOT NULL,   -- calculada automaticamente
    recurso      VARCHAR2(17)  NOT NULL,   -- formato 'TIPO,XX%,NNNNN'  (MANA/ENERGIA/IRA)
    oro          NUMBER(7)     NOT NULL,   -- calculado automaticamente
    estado       VARCHAR2(11)  NOT NULL,   -- VIVO / MUERTO / EN COMBATE
    clase        VARCHAR2(25)  NOT NULL,   -- FK -> CLASES.nombreC
    raza         VARCHAR2(25)  NOT NULL,   -- FK -> RAZAS.nombreR
    profesion1   VARCHAR2(20),             -- FK -> PROFESIONES (nullable)
    profesion2   VARCHAR2(20),             -- FK -> PROFESIONES (nullable)
    hermandad    VARCHAR2(50),             -- FK -> HERMANDADES.nombreHermandad (nullable)
    hogar        VARCHAR2(30),             -- FK -> CIUDADES.nombreCiudad (nullable)
    nombreMision VARCHAR2(100),            -- FK -> MISIONES.nombreMision (nullable)
    ciudad       VARCHAR2(30)  NOT NULL    -- FK -> CIUDADES.nombreCiudad
);

-- Tabla PJ_ESTADISTICAS
CREATE TABLE PJ_ESTADISTICAS (
    nombrePJ     VARCHAR2(12) NOT NULL,
    fuerza       NUMBER(5),
    agilidad     NUMBER(5),
    intelecto    NUMBER(5),
    celeridad    NUMBER(5),
    critico      NUMBER(5),
    maestria     NUMBER(5),
    versatilidad NUMBER(5)
);

-- Tabla PJ_MONTURAS
CREATE TABLE PJ_MONTURAS (
    nombrePJ      VARCHAR2(12) NOT NULL,
    nombreMontura VARCHAR2(20) NOT NULL,
    trasfiguracion VARCHAR2(20),
    fuerza        NUMBER(5),
    agilidad      NUMBER(5),
    intelecto     NUMBER(5),
    celeridad     NUMBER(5),
    critico       NUMBER(5),
    maestria      NUMBER(5),
    versatilidad  NUMBER(5)
);

-- Tabla PJ_MASCOTAS
CREATE TABLE PJ_MASCOTAS (
    nombrePJ       VARCHAR2(12) NOT NULL,
    nombreMascota  VARCHAR2(20) NOT NULL,
    trasfiguracion VARCHAR2(20),
    fuerza         NUMBER(5),
    agilidad       NUMBER(5),
    intelecto      NUMBER(5),
    celeridad      NUMBER(5),
    critico        NUMBER(5),
    maestria       NUMBER(5),
    versatilidad   NUMBER(5)
);

-- Tabla PJ_JUGUETES
CREATE TABLE PJ_JUGUETES (
    nombrePJ       VARCHAR2(12) NOT NULL,
    nombreJuguete  VARCHAR2(20) NOT NULL,
    trasfiguracion VARCHAR2(20),
    fuerza         NUMBER(5),
    agilidad       NUMBER(5),
    intelecto      NUMBER(5),
    celeridad      NUMBER(5),
    critico        NUMBER(5),
    maestria       NUMBER(5),
    versatilidad   NUMBER(5)
);

-- Tabla PJ_ARMAS
CREATE TABLE PJ_ARMAS (
    nombrePJ       VARCHAR2(12) NOT NULL,
    nombreArma     VARCHAR2(20) NOT NULL,
    trasfiguracion VARCHAR2(20),
    fuerza         NUMBER(5),
    agilidad       NUMBER(5),
    intelecto      NUMBER(5),
    celeridad      NUMBER(5),
    critico        NUMBER(5),
    maestria       NUMBER(5),
    versatilidad   NUMBER(5)
);

-- Tabla PJ_ROPAS
CREATE TABLE PJ_ROPAS (
    nombrePJ       VARCHAR2(12) NOT NULL,
    nombreRopa     VARCHAR2(20) NOT NULL,
    trasfiguracion VARCHAR2(20),
    fuerza         NUMBER(5),
    agilidad       NUMBER(5),
    intelecto      NUMBER(5),
    celeridad      NUMBER(5),
    critico        NUMBER(5),
    maestria       NUMBER(5),
    versatilidad   NUMBER(5)
);

-- Tabla PJ_MOBS
CREATE TABLE PJ_MOBS (
    nombrePJ VARCHAR2(12) NOT NULL,
    mob      VARCHAR2(20) NOT NULL,
    xpMob    NUMBER(6)    NOT NULL,
    oroMob   NUMBER(7)    NOT NULL
);

-- Tabla PJ_BOSSES
CREATE TABLE PJ_BOSSES (
    nombrePJ  VARCHAR2(12) NOT NULL,
    boss      VARCHAR2(20) NOT NULL,
    xpBoss    NUMBER(6)    NOT NULL,
    oroBoss   NUMBER(7)    NOT NULL
);

-- Tabla PJ_MISIONES
CREATE TABLE PJ_MISIONES (
    nombrePJ        VARCHAR2(12)  NOT NULL,
    mision          VARCHAR2(100) NOT NULL,
    xpMision        NUMBER(6)     NOT NULL,
    oroMision       NUMBER(7)     NOT NULL,
    recompensaMision VARCHAR2(20) NOT NULL
);

-- Tabla PJ_VENTAS  (personaje vendio un objeto)
CREATE TABLE PJ_VENTAS (
    nombrePJ  VARCHAR2(12) NOT NULL,
    objeto    VARCHAR2(20) NOT NULL,
    precio    NUMBER(7)    NOT NULL,
    vendido   NUMBER(1)    NOT NULL,  -- 0=false 1=true
    comprador VARCHAR2(12)            -- NULL si vendido=0
);

-- Tabla PJ_COMPRAS  (personaje compro un objeto)
CREATE TABLE PJ_COMPRAS (
    nombrePJ VARCHAR2(12) NOT NULL,
    objeto   VARCHAR2(20) NOT NULL,
    precio   NUMBER(7)    NOT NULL,
    vendedor VARCHAR2(12) NOT NULL
);

-- Tabla ESPECIALIZACIONES 
CREATE TABLE ESPECIALIZACIONES (
    idPersonaje                  VARCHAR2(25) NOT NULL,  -- FK -> PERSONAJES.id (PK)
    idHechizo                    NUMBER(5)    NOT NULL,
    nombreHechizo                VARCHAR2(20) NOT NULL,
    rolEspecializacion           VARCHAR2(20) NOT NULL,
    descripcionEspecializacion   VARCHAR2(20) NOT NULL,
    modificadoresEspecializacion VARCHAR2(20) NOT NULL
);

-- Tabla RANKINGPERSONAJES
CREATE TABLE RANKINGPERSONAJES (
    posicion    NUMBER(5)    NOT NULL,
    idPersonaje VARCHAR2(12) NOT NULL,   -- FK -> PERSONAJES.nombre (UK)
    puntuacion  NUMBER(10)   NOT NULL
);

-- Tabla RANKINGHERMANDADES
CREATE TABLE RANKINGHERMANDADES (
    posicion    NUMBER(5)    NOT NULL,
    idHermandad NUMBER(10)   NOT NULL,
    puntuacionH NUMBER(10)   NOT NULL,
    temporada   VARCHAR2(20)
);

-- Secuencias para los ids
CREATE SEQUENCE SEQ_PJ_ID          START WITH 10001 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_IDMISION       START WITH 1     INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_IDMOB          START WITH 1     INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_IDTRASFIG      START WITH 1     INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_IDHERMANDAD    START WITH 1     INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_IDPVB          START WITH 1     INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_IDICONO        START WITH 1     INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_IDHECHIZO      START WITH 1     INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_IDMACRO        START WITH 1     INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE SEQ_IDOBJETO       START WITH 1     INCREMENT BY 1 NOCACHE;