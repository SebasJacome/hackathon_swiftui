DROP DATABASE IF EXISTS parkalot;

CREATE DATABASE parkalot;

USE parkalot;

CREATE TABLE usuarios (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    PRIMARY KEY(id_usuario)
);

CREATE TABLE estacionamientos (
    id_estacionamiento INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    cLatitud DECIMAL(10,8) NOT NULL,
    cLongitud DECIMAL(11,8) NOT NULL,
    PRIMARY KEY(id_estacionamiento)
);

CREATE TABLE resena (
    id_resena INT NOT NULL AUTO_INCREMENT,
    id_estacionamiento INT NOT NULL,
    calificacion INT NOT NULL,
    comentario VARCHAR(200) NOT NULL,
    PRIMARY KEY(id_resena),
    CONSTRAINT fk_estacionamiento FOREIGN KEY(id_estacionamiento) REFERENCES estacionamientos(id_estacionamiento)
);

CREATE TABLE solicitud (
    id_solicitud INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_estacionamiento INT NOT NULL,
    fecha DATE NOT NULL,
    placasVehiculo VARCHAR(50) NOT NULL,
    modeloVehiculo VARCHAR(50) NOT NULL,
    formaDePago INT NOT NULL,
    PRIMARY KEY(id_solicitud),
    CONSTRAINT fk_usuario_solicitud FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario),
    CONSTRAINT fk_estacionamiento_solicitud FOREIGN KEY(id_estacionamiento) REFERENCES estacionamientos(id_estacionamiento)
);

-- Insercion de registros aleatorios en la tabla estacionamientos
INSERT INTO estacionamientos (nombre, direccion, cLatitud, cLongitud) VALUES
('Estacionamiento Coyoacan', 'Callejon de la Condesa 1, Ciudad de Mexico, CDMX', 19.347860, -99.162553),
('Estacionamiento Reforma', 'Avenida Paseo de la Reforma 145, Ciudad de Mexico, CDMX', 19.427753, -99.165926),
('Estacionamiento Roma', 'Calle Guanajuato 135, Ciudad de Mexico, CDMX', 19.415259, -99.167136),
('Estacionamiento Zocalo', 'Calle 5 de Mayo s/n, Centro Historico, Ciudad de Mexico, CDMX', 19.432990, -99.133111),
('Estacionamiento Polanco', 'Calle Alejandro Dumas 81, Ciudad de Mexico, CDMX', 19.433032, -99.190034),
('Estacionamiento Narvarte', 'Calle Cuauhtemoc 799, Ciudad de Mexico, CDMX', 19.391744, -99.154195),
('Estacionamiento Condesa', 'Calle Campeche 281, Ciudad de Mexico, CDMX', 19.411692, -99.174022),
('Estacionamiento Satelite', 'Avenida Lomas Verdes 70, Naucalpan, Edo. de Mexico', 19.522466, -99.237110),
('Estacionamiento Tlalpan', 'Calle Insurgentes Sur 1391, Ciudad de Mexico, CDMX', 19.343161, -99.160188),
('Estacionamiento Centro Medico', 'Avenida Cuauhtemoc 330, Ciudad de Mexico, CDMX', 19.412319, -99.156722),
('Estacionamiento San angel', 'Calle Minerva 6, Ciudad de Mexico, CDMX', 19.351819, -99.190141),
('Estacionamiento Azcapotzalco', 'Calle Tepantongo 152, Ciudad de Mexico, CDMX', 19.482486, -99.200391),
('Estacionamiento Santa Fe', 'Avenida Vasco de Quiroga 3900, Ciudad de Mexico, CDMX', 19.359411, -99.265801),
('Estacionamiento Tlatelolco', 'Eje Central Lazaro Cardenas 73, Ciudad de Mexico, CDMX', 19.450927, -99.146176),
('Estacionamiento Xochimilco', 'Avenida Nuevo Leon s/n, Ciudad de Mexico, CDMX', 19.245173, -99.103448),
('Estacionamiento Del Valle', 'Calle Luz Saviñon 727, Ciudad de Mexico, CDMX', 19.393996, -99.171415),
('Estacionamiento Lindavista', 'Eje Central Lazaro Cardenas 746, Ciudad de Mexico, CDMX', 19.485803, -99.131098);

-- Insercion de registros aleatorios en la tabla estacionamientos
INSERT INTO estacionamientos (nombre, direccion, cLatitud, cLongitud) VALUES
('Estacionamiento Aeropuerto', 'Avenida Capitan Carlos Leon S/N, Ciudad de Mexico, CDMX', 19.434738, -99.073440),
('Estacionamiento Parque Delta', 'Calle Jose Vasconcelos 151, Ciudad de Mexico, CDMX', 19.401234, -99.160356),
('Estacionamiento Condesa DF', 'Avenida Veracruz 102, Ciudad de Mexico, CDMX', 19.411372, -99.175125),
('Estacionamiento WTC', 'Avenida Insurgentes Sur 2210, Ciudad de Mexico, CDMX', 19.369472, -99.174676),
('Estacionamiento Patriotismo', 'Avenida Patriotismo 295, Ciudad de Mexico, CDMX', 19.399330, -99.181016),
('Estacionamiento Insurgentes', 'Calle de Xola 535, Ciudad de Mexico, CDMX', 19.395361, -99.155646),
('Estacionamiento Toreo', 'Boulevard Manuel avila Camacho 600, Naucalpan, Edo. de Mexico', 19.453817, -99.215460),
('Estacionamiento Anzures', 'Calle Darwin 36, Ciudad de Mexico, CDMX', 19.433050, -99.183286),
('Estacionamiento Colonia Roma', 'Calle Zacatecas 127, Ciudad de Mexico, CDMX', 19.418843, -99.163503),
('Estacionamiento Pedregal', 'Avenida de las Fuentes 392, Ciudad de Mexico, CDMX', 19.303882, -99.202070),
('Estacionamiento Santa Maria la Ribera', 'Calle Dr. Atl 170, Ciudad de Mexico, CDMX', 19.448013, -99.156557),
('Estacionamiento Tlatilco', 'Avenida Insurgentes Norte 209, Ciudad de Mexico, CDMX', 19.459294, -99.129815),
('Estacionamiento alvaro Obregon', 'Calle Vicente Suarez 142, Ciudad de Mexico, CDMX', 19.408414, -99.178515),
('Estacionamiento Universidad', 'Avenida Universidad 1200, Ciudad de Mexico, CDMX', 19.332787, -99.165622),
('Estacionamiento Barranca del Muerto', 'Avenida de los Insurgentes Sur 431, Ciudad de Mexico, CDMX', 19.356253, -99.188988),
('Estacionamiento Parque Mexico', 'Calle Tamaulipas 103, Ciudad de Mexico, CDMX', 19.414646, -99.172056),
('Estacionamiento La Villa', 'Calle Ferrocarril Hidalgo 96, Ciudad de Mexico, CDMX', 19.462843, -99.116032),
('Estacionamiento San Jeronimo', 'Avenida Contreras 1100, Ciudad de Mexico, CDMX', 19.325191, -99.201547);

-- Insercion de registros aleatorios en la tabla estacionamientos
INSERT INTO estacionamientos (nombre, direccion, cLatitud, cLongitud) VALUES
('Estacionamiento Lindavista', 'Calle Politecnico Nacional 1100, Ciudad de Mexico, CDMX', 19.485122, -99.132467),
('Estacionamiento Metrobus Buenavista', 'Avenida Insurgentes Norte 390, Ciudad de Mexico, CDMX', 19.448045, -99.154025),
('Estacionamiento San angel', 'Avenida Revolucion 1250, Ciudad de Mexico, CDMX', 19.348198, -99.196143),
('Estacionamiento Santa Fe', 'Avenida Vasco de Quiroga 3800, Ciudad de Mexico, CDMX', 19.361161, -99.277579),
('Estacionamiento Bosque de Tlalpan', 'Carretera Picacho-Ajusco 150, Ciudad de Mexico, CDMX', 19.292933, -99.166865),
('Estacionamiento Polanco', 'Calle de la Paz 37, Ciudad de Mexico, CDMX', 19.435902, -99.198722),
('Estacionamiento Coyoacan', 'Avenida Miguel angel de Quevedo 435, Ciudad de Mexico, CDMX', 19.348624, -99.161657),
('Estacionamiento Reforma', 'Paseo de la Reforma 222, Ciudad de Mexico, CDMX', 19.427293, -99.163752),
('Estacionamiento Narvarte', 'Avenida Universidad 933, Ciudad de Mexico, CDMX', 19.386607, -99.163181),
('Estacionamiento El Rosario', 'Avenida Central del Norte 200, Tlalnepantla de Baz, Edo. de Mexico', 19.532331, -99.215774),
('Estacionamiento Vallejo', 'Avenida Cuitlahuac 800, Ciudad de Mexico, CDMX', 19.472562, -99.151034),
('Estacionamiento Plaza Carso', 'Lago Zurich 245, Ciudad de Mexico, CDMX', 19.442964, -99.199642),
('Estacionamiento San Juan de Aragon', 'Avenida Oceania 442, Ciudad de Mexico, CDMX', 19.469150, -99.100909),
('Estacionamiento Xochimilco', 'Avenida Canal Nacional S/N, Ciudad de Mexico, CDMX', 19.240622, -99.107460),
('Estacionamiento Pino Suarez', 'Calle Pino Suarez 16, Ciudad de Mexico, CDMX', 19.430509, -99.135491),
('Estacionamiento Buenavista', 'Calle Euzkaro 47, Ciudad de Mexico, CDMX', 19.450182, -99.149015),
('Estacionamiento Cuitlahuac', 'Avenida Cuitlahuac 355, Ciudad de Mexico, CDMX', 19.465000, -99.145085);

INSERT INTO usuarios (nombre, correo, contrasena)
VALUES 
('Pedro Velazquez', 'p.velazquez@hotmail.com', 'vsgOz*Jl'),
('Adriana Gallegos', 'adriana.gallegos@yahoo.com', 'L-6nX9vK'),
('Jorge Diaz', 'jorge.diaz@gmail.com', 'Mw3*tU4p'),
('Mariana Martinez', 'mariana.martinez@hotmail.com', 'r%tR8JtF'),
('Raul Sanchez', 'raul.sanchez@yahoo.com', 'b#1dV0nM'),
('Gabriela Garcia', 'gabriela.garcia@gmail.com', 'f@6zA1lI'),
('Mario Ortiz', 'mario.ortiz@hotmail.com', 'd$fE7oJp'),
('Alejandra Flores', 'alejandra.flores@yahoo.com', 't@8wQ3sZ'),
('Jose Hernandez', 'jose.hernandez@gmail.com', 'H-2cB1vF'),
('Ana Torres', 'ana.torres@hotmail.com', 'v!7zR4kM'),
('Eduardo Fernandez', 'e.fernandez@yahoo.com', 'a#9xU0oP'),
('Monica Vargas', 'monica.vargas@gmail.com', 'W-4pC3yS'),
('Sergio Aguilar', 'sergio.aguilar@hotmail.com', 'l#9vX5sA'),
('Paola Rios', 'paola.rios@yahoo.com', 'D-1cF8qJ'),
('Fernando Reyes', 'fernando.reyes@gmail.com', 'b#7eZ2tL'),
('Julia Jimenez', 'julia.jimenez@hotmail.com', 't&4pW1sV'),
('Carlos Gonzalez', 'carlos.gonzalez@yahoo.com', 'v@6lT9mI'),
('Maria Hernandez', 'maria.hernandez@gmail.com', 'x#3qB9zV'),
('Andres Mendez', 'andres.mendez@hotmail.com', 's#2nF7yR'),
('Laura Ramirez', 'laura.ramirez@yahoo.com', 'a!5vC3bR'),
('Rodrigo Torres', 'rodrigo.torres@gmail.com', 'r$7eM2wQ'),
('Lorena Castro', 'lorena.castro@hotmail.com', 'd*9lH1jC'),
('Manuel Flores', 'manuel.flores@yahoo.com', 'f$2tN6zA'),
('Silvia Reyes', 'silvia.reyes@gmail.com', 'g!3pB5cR'),
('Francisco Medina', 'francisco.medina@hotmail.com', 'x&9vL2uQ'),
('Carmen Sanchez', 'carmen.sanchez@yahoo.com', 'j#8cS2fP'),
('Pablo Aguilar', 'pablo.aguilar@gmail.com', 's!4tF1mB'),
('Sofia Hernandez', 'sofia.hernandez@hotmail.com', 'w#7pJ4nT');
