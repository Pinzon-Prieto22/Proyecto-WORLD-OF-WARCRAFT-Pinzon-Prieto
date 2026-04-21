/*
PoblarOK
Ingreso de datos correctos. (Sin automatización)
*/

-- MUNDOS
INSERT INTO MUNDOS VALUES ('Azeroth',    'Mundo principal de WoW, hogar de humanos y orcos', 1);
INSERT INTO MUNDOS VALUES ('Outland',    'Fragmento del planeta roto Draenor', 2);
INSERT INTO MUNDOS VALUES ('Shadowlands','Reino de los muertos donde van las almas', 10);
INSERT INTO MUNDOS VALUES ('Draenor',    'Draenor antes de su destruccion en el pasado', 6);

-- CONTINENTES
INSERT INTO CONTINENTES VALUES ('Eastern Kingdoms','Azeroth','TEMPLADO',15);
INSERT INTO CONTINENTES VALUES ('Kalimdor',         'Azeroth','CALIDO',  10);
INSERT INTO CONTINENTES VALUES ('Northrend',         'Azeroth','FRIO',    70);
INSERT INTO CONTINENTES VALUES ('Broken Isles',      'Azeroth','TEMPLADO',98);

-- PAISES
INSERT INTO PAISES VALUES ('Stormwind', 'Eastern Kingdoms','Azeroth','BOSQUE',  10);
INSERT INTO PAISES VALUES ('Dun Morogh','Eastern Kingdoms','Azeroth','NEVADO',  15);
INSERT INTO PAISES VALUES ('Durotar',   'Kalimdor',         'Azeroth','DESIERTO',10);
INSERT INTO PAISES VALUES ('Mulgore',   'Kalimdor',         'Azeroth','SAVANA',  10);

-- CIUDADES 
INSERT INTO CIUDADES VALUES ('Ciudad de Ventormenta','Stormwind', 'Eastern Kingdoms','Azeroth', 1, 'ALIANZA');
INSERT INTO CIUDADES VALUES ('Forjaz',                'Dun Morogh','Eastern Kingdoms','Azeroth',10, 'ALIANZA');
INSERT INTO CIUDADES VALUES ('Orgrimmar',              'Durotar',   'Kalimdor',         'Azeroth', 1,'HORDA');
INSERT INTO CIUDADES VALUES ('Cima del Trueno',        'Mulgore',   'Kalimdor',         'Azeroth', 5,'HORDA');
INSERT INTO CIUDADES VALUES ('Dalaran',                'Stormwind', 'Eastern Kingdoms','Azeroth',74,'NEUTRA');
INSERT INTO CIUDADES VALUES ('Escudo de Tormenta',     'Stormwind', 'Eastern Kingdoms','Azeroth',30,'ALIANZA');

-- RAZAS
INSERT INTO RAZAS VALUES ('Humano',          'ALIANZA','Common');
INSERT INTO RAZAS VALUES ('Enano',           'ALIANZA','Dwarvish');
INSERT INTO RAZAS VALUES ('Elfo de la noche','ALIANZA','Darnassian');
INSERT INTO RAZAS VALUES ('Draenei',         'ALIANZA','Draenei');
INSERT INTO RAZAS VALUES ('Orco',            'HORDA',  'Orcish');
INSERT INTO RAZAS VALUES ('Tauren',          'HORDA',  'Taur-ahe');
INSERT INTO RAZAS VALUES ('Elfo de sangre',  'HORDA',  'Thalassian');

-- CLASES
INSERT INTO CLASES VALUES ('guerrero',              'TANQUE','Clase combate cuerpo a cuerpo con gran resistencia');
INSERT INTO CLASES VALUES ('paladin',               'HEALER','Clase sagrada con capacidad de tanquear y sanar');
INSERT INTO CLASES VALUES ('mago',                  'DPS',   'Clase de daño a distancia con magia arcana fuego y hielo');
INSERT INTO CLASES VALUES ('sacerdote',             'HEALER','Clase sanadora especializada en magia sagrada y sombria');
INSERT INTO CLASES VALUES ('picaro',                'DPS',   'Clase sigilosa de daño cuerpo a cuerpo');
INSERT INTO CLASES VALUES ('chaman',                'HEALER','Clase de elementos con rol de soporte y sanacion');
INSERT INTO CLASES VALUES ('druida',                'TANQUE','Clase versatil que puede cambiar de forma');
INSERT INTO CLASES VALUES ('cazador',               'DPS',   'Clase a distancia especializada con mascotas');
INSERT INTO CLASES VALUES ('brujo',                 'DPS',   'Clase de magia oscura y convocacion de demonios');
INSERT INTO CLASES VALUES ('caballero de la muerte','TANQUE','Caballero oscuro que usa runas y magia de muerte');

-- COMBINACIONES
INSERT INTO COMBINACIONES VALUES ('Humano','guerrero',  1);
INSERT INTO COMBINACIONES VALUES ('Humano','paladin',   1);
INSERT INTO COMBINACIONES VALUES ('Humano','mago',      1);
INSERT INTO COMBINACIONES VALUES ('Humano','sacerdote', 1);
INSERT INTO COMBINACIONES VALUES ('Humano','picaro',    1);
INSERT INTO COMBINACIONES VALUES ('Humano','cazador',   1);
INSERT INTO COMBINACIONES VALUES ('Humano','brujo',     1);
INSERT INTO COMBINACIONES VALUES ('Humano','chaman',    0);
INSERT INTO COMBINACIONES VALUES ('Humano','druida',    0);
INSERT INTO COMBINACIONES VALUES ('Humano','caballero de la muerte',1);
INSERT INTO COMBINACIONES VALUES ('Orco',  'guerrero',  1);
INSERT INTO COMBINACIONES VALUES ('Orco',  'chaman',    1);
INSERT INTO COMBINACIONES VALUES ('Orco',  'cazador',   1);
INSERT INTO COMBINACIONES VALUES ('Orco',  'brujo',     1);
INSERT INTO COMBINACIONES VALUES ('Orco',  'paladin',   0);
INSERT INTO COMBINACIONES VALUES ('Orco',  'mago',      0);
INSERT INTO COMBINACIONES VALUES ('Orco',  'druida',    0);
INSERT INTO COMBINACIONES VALUES ('Orco',  'caballero de la muerte',1);
INSERT INTO COMBINACIONES VALUES ('Tauren','guerrero',  1);
INSERT INTO COMBINACIONES VALUES ('Tauren','druida',    1);
INSERT INTO COMBINACIONES VALUES ('Tauren','chaman',    1);
INSERT INTO COMBINACIONES VALUES ('Tauren','paladin',   1);
INSERT INTO COMBINACIONES VALUES ('Tauren','cazador',   1);
INSERT INTO COMBINACIONES VALUES ('Tauren','picaro',    0);
INSERT INTO COMBINACIONES VALUES ('Tauren','mago',      0);
INSERT INTO COMBINACIONES VALUES ('Draenei','paladin',  1);
INSERT INTO COMBINACIONES VALUES ('Draenei','chaman',   1);
INSERT INTO COMBINACIONES VALUES ('Draenei','mago',     1);
INSERT INTO COMBINACIONES VALUES ('Draenei','guerrero', 1);
INSERT INTO COMBINACIONES VALUES ('Draenei','sacerdote',1);
INSERT INTO COMBINACIONES VALUES ('Elfo de sangre','paladin',1);
INSERT INTO COMBINACIONES VALUES ('Elfo de sangre','mago',   1);
INSERT INTO COMBINACIONES VALUES ('Elfo de sangre','brujo',  1);
INSERT INTO COMBINACIONES VALUES ('Elfo de sangre','picaro', 1);
INSERT INTO COMBINACIONES VALUES ('Elfo de sangre','chaman', 0);

-- BONIFICACIONESRACIALES
INSERT INTO BONIFICACIONESRACIALES VALUES ('Humano',        5,5,5,5,5,5,5);
INSERT INTO BONIFICACIONESRACIALES VALUES ('Orco',         10,5,0,5,3,4,2);
INSERT INTO BONIFICACIONESRACIALES VALUES ('Tauren',       15,3,0,4,2,3,1);
INSERT INTO BONIFICACIONESRACIALES VALUES ('Draenei',       5,4,8,6,5,4,3);
INSERT INTO BONIFICACIONESRACIALES VALUES ('Elfo de sangre',2,8,10,7,8,6,5);

-- LOGROS 
INSERT INTO LOGROS VALUES ('Explorador',         'Descubre todos los mapas del juego',       10);
INSERT INTO LOGROS VALUES ('Cazador de dragones','Mata 100 dragones en el mundo',            25);
INSERT INTO LOGROS VALUES ('Maestro artesano',   'Alcanza nivel maximo en una profesion',   15);

-- PROFESIONES
INSERT INTO PROFESIONES VALUES ('Herreria',75,'Armadura de placas','Espada de acero, Yelmo de hierro');
INSERT INTO PROFESIONES VALUES ('Sastreria',80,'Telas de sombra',  'Capa del tejedor, Vestido de arquimago');
INSERT INTO PROFESIONES VALUES ('Alquimia', 60,'Elixires de combate','Pocion de fuerza, Elixir de resistencia');
INSERT INTO PROFESIONES VALUES ('Joyeria',  70,'Gemas de poder',     'Anillo de rubies, Collar de esmeraldas');
INSERT INTO PROFESIONES VALUES ('Mineria',  90,'Minerales raros',    'Carbon de cobalto, Mineral de titanio');

-- ICONOS
INSERT INTO ICONOS VALUES (SEQ_IDICONO.NEXTVAL,'/icons/fire_ball.png',32,'PNG');
INSERT INTO ICONOS VALUES (SEQ_IDICONO.NEXTVAL,'/icons/shield.png',   64,'PNG');
INSERT INTO ICONOS VALUES (SEQ_IDICONO.NEXTVAL,'/icons/sword.blp',    32,'BLP');

-- HECHIZOS
INSERT INTO HECHIZOS VALUES (SEQ_IDHECHIZO.NEXTVAL,'Bola de fuego','Lanza bola de fuego','DAÑO',  100,2,5,10,1);
INSERT INTO HECHIZOS VALUES (SEQ_IDHECHIZO.NEXTVAL,'Escudo divino', 'Invulnerabilidad temporal','DEFENSA',50,0,300,20,2);
INSERT INTO HECHIZOS VALUES (SEQ_IDHECHIZO.NEXTVAL,'Golpe heroico', 'Ataque fisico poderoso','DAÑO',0,0,6,1,3);

-- MACROS
INSERT INTO MACROS VALUES (SEQ_IDMACRO.NEXTVAL,1,1,'MacroFuego', '#showtooltip/cast Bola de fuego','Macro rapido DPS mago');
INSERT INTO MACROS VALUES (SEQ_IDMACRO.NEXTVAL,2,2,'MacroShield','#showtooltip/cast Escudo divino','Macro defensivo paladin');

-- TRASFIGURACIONES
INSERT INTO TRASFIGURACIONES VALUES (1,'Dragon dorado');
INSERT INTO TRASFIGURACIONES VALUES (2,'Oso ancestral');
INSERT INTO TRASFIGURACIONES VALUES (3,'Fuego eterno');


-- Registrar MONTURAS en OBJETOS 
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'Corcel de tormenta','Montura');  -- idObjeto = 1
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'Protocolo de wyrm', 'Montura');  -- idObjeto = 2
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'Loba negra',         'Montura');  -- idObjeto = 3

-- Detalle de MONTURAS
INSERT INTO MONTURAS VALUES ('Corcel de tormenta','Caballo epico de la Alianza',100,40,0,20,15,0,5,3,2,1);
INSERT INTO MONTURAS VALUES ('Protocolo de wyrm', 'Dragon del nexo de alta velocidad',310,80,1,30,25,10,8,5,4,2);
INSERT INTO MONTURAS VALUES ('Loba negra',          'Montura terrestre orca',60,20,0,10,8,0,3,2,1,0);

-- Registrar MASCOTAS en OBJETOS
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'Garra ignea',    'Mascota');  -- idObjeto = 4
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'Gustavino',       'Mascota');  -- idObjeto = 5
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'Feligno noxiano','Mascota');  -- idObjeto = 6

-- Detalle de MASCOTAS 
INSERT INTO MASCOTAS VALUES ('Garra ignea',   'Pequeno elemental de fuego','BESTIA',  1,'Fuerte',1,5,3,2,4,3,2,1);
INSERT INTO MASCOTAS VALUES ('Gustavino',     'Mascota mecanica gnoma',    'MECANICO',1,'Debil', 0,0,0,5,2,1,0,0);
INSERT INTO MASCOTAS VALUES ('Feligno noxiano','Criatura del vacio',       'DEMONIO', 1,'Normal',1,2,5,8,3,4,2,1);

-- Registrar JUGUETES en OBJETOS
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'Muneco de gnomo','Juguete');  -- idObjeto = 7
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'Pez espadin',    'Juguete');  -- idObjeto = 8

-- Detalle de JUGUETES
INSERT INTO JUGUETES VALUES ('Muneco de gnomo','Pequeno muneco coleccionable','Baila al activarse',30,0,0,0,0,0,0,0,0);
INSERT INTO JUGUETES VALUES ('Pez espadin',    'Un pez que parece espada',    NULL,               60,0,0,0,0,0,0,0,0);

-- Registrar ARMAS en OBJETOS 
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'Tormenta de fuego','Arma');  -- idObjeto = 9
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'Arco del viento',  'Arma');  -- idObjeto = 10
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'Daga sombria',     'Arma');  -- idObjeto = 11

-- Detalle de ARMAS
INSERT INTO ARMAS VALUES ('Tormenta de fuego','Espada de dos manos con llamas','ESPADA',40,150,1,50,30,0,10,8,6,5);
INSERT INTO ARMAS VALUES ('Arco del viento',  'Arco elfico de precision',      'ARCO',  20,80, 0,20,60,0,15,10,8,4);
INSERT INTO ARMAS VALUES ('Daga sombria',      'Daga envenenada de rogues',     'DAGA',  10,60, 0,15,40,0,12,8,5,3);

-- Registrar ROPAS en OBJETOS 
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'Manto del archimago', 'Ropa');  -- idObjeto = 12
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'Peto de hierro negro','Ropa');  -- idObjeto = 13
INSERT INTO OBJETOS VALUES (SEQ_IDOBJETO.NEXTVAL,'Vestido de la fiesta','Ropa');  -- idObjeto = 14

-- Detalle de ROPAS
INSERT INTO ROPAS VALUES ('Manto del archimago', 1,0,0,80,20,15,30,10);
INSERT INTO ROPAS VALUES ('Peto de hierro negro',1,90,10,0,15,20,25,8);
INSERT INTO ROPAS VALUES ('Vestido de la fiesta',0,0,0,0,0,0,0,0);

-- NPCs 
INSERT INTO NPCS VALUES ('Alderik Cresta','Ciudad de Ventormenta','QUEST_GIVER','Necesito tu ayuda campeon');
INSERT INTO NPCS VALUES ('Theron Forge',  'Forjaz',               'VENDEDOR',   'Bienvenido a mi tienda');
INSERT INTO NPCS VALUES ('Kargok',        'Orgrimmar',             'ENTRENADOR', 'Aprende las tecnicas de guerra');
INSERT INTO NPCS VALUES ('Rivok Veloz',   'Dalaran',               'VUELO',      'A donde quieres volar?');

-- MISIONES
INSERT INTO MISIONES VALUES (SEQ_IDMISION.NEXTVAL,'El Azote de Ventormenta','El Azote amenaza la ciudad',10,'HISTORIA','Alderik Cresta',5000,2500);
INSERT INTO MISIONES VALUES (SEQ_IDMISION.NEXTVAL,'Derrota a Ragnaros','Entra al Corazon del Fuego y acaba con Ragnaros',60,'HISTORIA','Kargok',15000,8000);
INSERT INTO MISIONES VALUES (SEQ_IDMISION.NEXTVAL,'casa del tesoro de adornos','Explora el tesoro',15,'SECUNDARIA','Rivok Veloz',1000,500);

-- RECOMPENSAS 
-- Mision 1 (El Azote de Ventormenta) → Daga sombria (idObjeto=11)
INSERT INTO RECOMPENSAS VALUES (1, 11);
-- Mision 2 (Derrota a Ragnaros) → Tormenta de fuego (idObjeto=9)
INSERT INTO RECOMPENSAS VALUES (2,  9);
-- Mision 3 (casa del tesoro) → Muneco de gnomo (idObjeto=7)
INSERT INTO RECOMPENSAS VALUES (3,  7);
-- Mision 3 tiene doble recompensa: tambien da Arco del viento (idObjeto=10)
INSERT INTO RECOMPENSAS VALUES (3, 10);

-- PVBS 
INSERT INTO PVBS VALUES (SEQ_IDPVB.NEXTVAL,'MAZMORRA','Onyxia',   'HEROICO','VICTORIA',120,8500,2000);
INSERT INTO PVBS VALUES (SEQ_IDPVB.NEXTVAL,'RAID',    'Ragnaros',  'NORMAL', 'DERROTA', 45, 3000,1500);
INSERT INTO PVBS VALUES (SEQ_IDPVB.NEXTVAL,'MAZMORRA','Murloc Jefe','NORMAL','VICTORIA', 30, 900, 500);

-- HERMANDADES
INSERT INTO HERMANDADES VALUES (SEQ_IDHERMANDAD.NEXTVAL,'Legends of Azeroth',25,TO_DATE('2020-01-15','YYYY-MM-DD'),NULL,85000);
INSERT INTO HERMANDADES VALUES (SEQ_IDHERMANDAD.NEXTVAL,'Hijos de la Tormenta',18,TO_DATE('2021-06-30','YYYY-MM-DD'),NULL,40000);

-- MOBS
INSERT INTO MOBS VALUES (SEQ_IDMOB.NEXTVAL,'gusano',             5, 80, 8,'BESTIA',   'PASIVO',  2,'Ciudad de Ventormenta');
INSERT INTO MOBS VALUES (SEQ_IDMOB.NEXTVAL,'Lobo de las estepas',10,200,22,'BESTIA',   'AGRESIVO', 3,'Orgrimmar');
INSERT INTO MOBS VALUES (SEQ_IDMOB.NEXTVAL,'Espectro errante',   72,8500,650,'NO MUERTO','DEFENSIVO',5,'Dalaran');
INSERT INTO MOBS VALUES (SEQ_IDMOB.NEXTVAL,'Murloc barbacuero',   8,120,15,'HUMANOIDE','AGRESIVO', 2,'Ciudad de Ventormenta');

-- PERSONAJES
INSERT INTO PERSONAJES VALUES ('00001.darkKnight.WOW','darkKnight',60,155,2000,'ENERGIA,30%,5000',5800,'VIVO','paladin','Humano','Joyeria',NULL,
    'Legends of Azeroth','Escudo de Tormenta','casa del tesoro de adornos','Dalaran');
INSERT INTO PERSONAJES VALUES ('00002.Thrallok.WOW','Thrallok',80,92000,8500,'MANA,75%,12000',35000,'VIVO','chaman','Orco','Herreria','Mineria',
    'Hijos de la Tormenta','Orgrimmar',NULL,'Orgrimmar');
INSERT INTO PERSONAJES VALUES ('00003.Tyrande.WOW','Tyrande',60,45000,5200,'MANA,60%,9000',12000,'VIVO','sacerdote','Elfo de la noche','Sastreria',NULL,
    NULL,'Ciudad de Ventormenta','El Azote de Ventormenta','Ciudad de Ventormenta');
INSERT INTO PERSONAJES VALUES ('00004.Cairno.WOW','Cairno',50,30000,4500,'IRA,90%,1000',8000,'VIVO',
    'guerrero','Tauren','Alquimia',NULL,'Legends of Azeroth','Cima del Trueno',NULL,'Cima del Trueno');

-- Actualizamos lideres de hermandades
UPDATE HERMANDADES SET idLider='darkKnight' WHERE nombreHermandad='Legends of Azeroth';
UPDATE HERMANDADES SET idLider='Thrallok'   WHERE nombreHermandad='Hijos de la Tormenta';

-- PJ_ESTADISTICAS
INSERT INTO PJ_ESTADISTICAS VALUES ('darkKnight',120,90, 0,30,25,40,15);
INSERT INTO PJ_ESTADISTICAS VALUES ('Thrallok',   60,80,110,45,35,30,20);
INSERT INTO PJ_ESTADISTICAS VALUES ('Tyrande',    20,30,150,55,60,70,25);
INSERT INTO PJ_ESTADISTICAS VALUES ('Cairno',    100,70,  0,25,20,35,10);

-- PJ_MONTURAS / MASCOTAS / ARMAS / ROPAS
INSERT INTO PJ_MONTURAS VALUES ('darkKnight','Corcel de tormenta','Dragon dorado',20,15,0,5,3,2,1);
INSERT INTO PJ_MONTURAS VALUES ('Thrallok',  'Protocolo de wyrm', 'Oso ancestral', 30,25,10,8,5,4,2);
INSERT INTO PJ_MONTURAS VALUES ('Cairno',    'Loba negra',         NULL,           10,8,0,3,2,1,0);

INSERT INTO PJ_MASCOTAS VALUES ('darkKnight','Garra ignea',   'Fuego eterno',5,3,2,4,3,2,1);
INSERT INTO PJ_MASCOTAS VALUES ('Thrallok',  'Gustavino',      NULL,          0,0,5,2,1,0,0);
INSERT INTO PJ_MASCOTAS VALUES ('Cairno',    'Feligno noxiano',NULL,          2,5,8,3,4,2,1);

INSERT INTO PJ_ARMAS VALUES ('darkKnight','Daga sombria',    'Oso ancestral',15,40,0,12,8,5,3);
INSERT INTO PJ_ARMAS VALUES ('Thrallok',  'Tormenta de fuego',NULL,          50,30,0,10,8,6,5);
INSERT INTO PJ_ARMAS VALUES ('Tyrande',   'Arco del viento',  NULL,          20,60,0,15,10,8,4);

INSERT INTO PJ_ROPAS VALUES ('Tyrande', 'Manto del archimago', NULL,0,0,80,20,15,30,10);
INSERT INTO PJ_ROPAS VALUES ('Thrallok','Peto de hierro negro', NULL,90,10,0,15,20,25,8);
COMMIT;

-- PJ_MOBS 
INSERT INTO PJ_MOBS   VALUES ('darkKnight','gusano',            100,200);
INSERT INTO PJ_MOBS   VALUES ('Thrallok',  'Lobo de las estepas',150,300);
INSERT INTO PJ_MOBS   VALUES ('Cairno',    'Murloc barbacuero',   80,100);

-- PJ+BOSSES
INSERT INTO PJ_BOSSES VALUES ('Thrallok',  'Espectro errante',  3000,8000);

-- PJ_MISIONES
INSERT INTO PJ_MISIONES VALUES ('darkKnight','casa del tesoro de adornos',1000,500);
INSERT INTO PJ_MISIONES VALUES ('Tyrande',   'El Azote de Ventormenta',   5000,2500);

-- PJ_VENTAS y PJ_COMPRAS 
INSERT INTO PJ_VENTAS  VALUES ('Thrallok','Pez espadin',100,1,'darkKnight');
INSERT INTO PJ_VENTAS  VALUES ('Cairno',  'Arco del viento',200,0,NULL);
INSERT INTO PJ_COMPRAS VALUES ('darkKnight','Pez espadin',100,'Thrallok');

-- ESPECIALIZACIONES
INSERT INTO ESPECIALIZACIONES VALUES ('00002.Thrallok.WOW',  3,'Golpe heroico','DPS',   'Mele mejorado',   NULL);
INSERT INTO ESPECIALIZACIONES VALUES ('00001.darkKnight.WOW',2,'Escudo divino', 'TANQUE','Sagrado defensivo',NULL);

-- RANKINGPERSONAJES y RANKINGHERMANDADES
INSERT INTO RANKINGPERSONAJES  VALUES (1,'Thrallok', 92000);
INSERT INTO RANKINGPERSONAJES  VALUES (2,'Tyrande',  45000);
INSERT INTO RANKINGPERSONAJES  VALUES (3,'Cairno',   30000);
INSERT INTO RANKINGPERSONAJES  VALUES (4,'darkKnight',155);
INSERT INTO RANKINGHERMANDADES VALUES (1,1,25,'Temporada 1');
INSERT INTO RANKINGHERMANDADES VALUES (2,2,18,'Temporada 1');