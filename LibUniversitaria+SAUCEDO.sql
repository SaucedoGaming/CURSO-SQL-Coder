-- --------------------------------------------------------------------------------------------------------------------
/* CREAR SCHEMA */
-- --------------------------------------------------------------------------------------------------------------------

DROP DATABASE IF EXISTS biblioteca;
CREATE SCHEMA biblioteca;
USE biblioteca;

-- --------------------------------------------------------------------------------------------------------------------
/* CREAR TABLAS */
-- --------------------------------------------------------------------------------------------------------------------

-- Tabla Campus
CREATE TABLE Campus (
					id_campus INT NOT NULL PRIMARY KEY,
					nombre VARCHAR(30) NOT NULL,
					municipio VARCHAR(30)
);

-- Tabla Facultad
CREATE TABLE Facultad(
					 id_facultad INT NOT NULL PRIMARY KEY,
					 siglas VARCHAR(10) NOT NULL,
					 nombre VARCHAR(70) NOT NULL,
					 id_campus INT NOT NULL
);

-- Tabla Grado
CREATE TABLE Grado(
				  id_grado INT NOT NULL PRIMARY KEY,
				  grado VARCHAR(15) NOT NULL
);

-- Tabla Carrera
CREATE TABLE Carrera(
					id_carrera INT NOT NULL PRIMARY KEY,
					nombre VARCHAR(50) NOT NULL,
					id_grado INT NOT NULL,
					id_facultad INT NOT NULL
);

-- Tabla Estudiante
CREATE TABLE Estudiante(
					   matricula INT NOT NULL PRIMARY KEY,
					   nombre VARCHAR(25) NOT NULL,
					   apellido VARCHAR(40) NOT NULL,
					   edad INT,
					   id_carrera INT NOT NULL,
					   semestre INT,
					   correo VARCHAR(50) NOT NULL,
					   sexo VARCHAR(10) NOT NULL
);

-- Tabla Autor
CREATE TABLE Autor(
				  id_autor INT NOT NULL PRIMARY KEY,
				  nombre VARCHAR(25) NOT NULL,
				  apellido VARCHAR(40) NOT NULL
);

-- Tabla Autores_Libro
CREATE TABLE Autores_Libro(
						  isbn VARCHAR(15) NOT NULL,
						  id_autor INT NOT NULL,
						  ordinal_autor INT,
						  PRIMARY KEY (isbn,id_autor)
);

-- Tabla Editorial
CREATE TABLE Editorial(
					  id_editorial INT NOT NULL PRIMARY KEY,
					  nombre VARCHAR(40) NOT NULL
);

-- Tabla Genero
CREATE TABLE Genero(
				   id_genero INT NOT NULL PRIMARY KEY,
				   genero VARCHAR(40) NOT NULL
);

-- Tabla Formato
CREATE TABLE Formato(
	                id_formato INT NOT NULL PRIMARY KEY,
                    formato VARCHAR(20) NOT NULL
);

-- Tabla Libro
CREATE TABLE Libro(
				  isbn VARCHAR(15) NOT NULL PRIMARY KEY,
				  titulo VARCHAR(150) NOT NULL,
				  edicion INT,
				  copyright INT,
				  id_genero INT NOT NULL,
				  id_editorial INT NOT NULL,
				  id_formato INT NOT NULL
    );

-- Tabla Inv_Libro
CREATE TABLE Inv_Libro(
					  id_libro INT NOT NULL PRIMARY KEY,
					  isbn VARCHAR(15) NOT NULL
);

-- Tabla Prestamo
CREATE TABLE Prestamo(
					 id_prestamo INT NOT NULL PRIMARY KEY,
					 id_libro INT NOT NULL,
					 matricula INT NOT NULL,
					 fecha_prestamo DATE NOT NULL,
					 fecha_vencimiento DATE NOT NULL
);

-- Tabla Devolucion
CREATE TABLE Devolucion(
					   id_prestamo INT NOT NULL,
					   fecha_devolucion DATE NOT NULL
);

-- --------------------------------------------------------------------------------------------------------------------
/* AGREGAR FOREIGN KEYS */
-- --------------------------------------------------------------------------------------------------------------------

-- FK Facultad
ALTER TABLE Facultad ADD FOREIGN KEY (id_campus) REFERENCES Campus(id_campus);

-- FK Carrera
ALTER TABLE Carrera ADD FOREIGN KEY (id_grado) REFERENCES Grado(id_grado);
ALTER TABLE Carrera ADD FOREIGN KEY (id_facultad) REFERENCES Facultad(id_facultad);

-- FK Estudiante
ALTER TABLE Estudiante ADD FOREIGN KEY (id_carrera) REFERENCES Carrera(id_carrera);

-- FK Autores_Libro
ALTER TABLE Autores_libro ADD FOREIGN KEY (isbn) REFERENCES Libro(isbn);
ALTER TABLE Autores_libro ADD FOREIGN KEY (id_autor) REFERENCES Autor(id_autor);

-- FK Libro
ALTER TABLE Libro ADD FOREIGN KEY (id_genero) REFERENCES Genero(id_genero);
ALTER TABLE Libro ADD FOREIGN KEY (id_editorial) REFERENCES Editorial(id_editorial);
ALTER TABLE Libro ADD FOREIGN KEY (id_formato) REFERENCES Formato(id_formato);

-- FK Inv_Libro
ALTER TABLE Inv_Libro ADD FOREIGN KEY (isbn) REFERENCES Libro(isbn);

-- FK Prestamo
ALTER TABLE Prestamo ADD FOREIGN KEY (id_libro) REFERENCES Inv_Libro(id_libro);
ALTER TABLE Prestamo ADD FOREIGN KEY (matricula) REFERENCES Estudiante(matricula) ON DELETE CASCADE;

-- FK Devolucion
ALTER TABLE Devolucion ADD FOREIGN KEY (id_prestamo) REFERENCES Prestamo(id_prestamo) ON DELETE CASCADE;

-- --------------------------------------------------------------------------------------------------------------------
/* INSERTAR REGISTROS */
-- --------------------------------------------------------------------------------------------------------------------

-- INSERT INTO campus
INSERT INTO campus(`id_campus`,`nombre`,`municipio`) VALUES (1,'Universidad','San Nicolas');
INSERT INTO campus(`id_campus`,`nombre`,`municipio`) VALUES (2,'Mederos','Monterrey');
INSERT INTO campus(`id_campus`,`nombre`,`municipio`) VALUES (3,'Ciencias de la Salud','Monterrey');
INSERT INTO campus(`id_campus`,`nombre`,`municipio`) VALUES (4,'Ciencias Agropecuarias','General Escobedo');

-- INSERT INTO facultad
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (1,'FA','Facultad de Agronomia',4);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (2,'FARQ','Facultad de Arquitectura',1);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (3,'FAE','Facultad de Artes Escenicas',2);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (4,'FAV','Facultad de Artes Visuales',2);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (5,'FCB','Facultad de Ciencias Biologicas',1);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (6,'FCC','Facultad de Ciencias de la Comunicacion',2);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (7,'FCFM','Facultad de Ciencias Fisico Matematicas',1);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (8,'FCPyRI','Facultad de Ciencias Politicas y Relaciones Internacionales',2);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (9,'FCQ','Facultad de Ciencias Quimicas',1);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (10,'FACPyA','Facultad de Contaduria Publica y Administracion',1);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (11,'FACDyC','Facultad de Derecho y Criminologia',1);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (12,'FAECO','Facultad de Economia',2);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (13,'FIC','Facultad de Ingenieria Civil',1);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (14,'FIME','Facultad de Ingenieria Mecanica y Electrica',1);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (15,'FAMED','Facultad de Medicina',3);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (16,'FMVZ','Facultad de Medicina Veterinaria y Zootecnia',4);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (17,'FAO','Facultad de Odontologia',3);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (18,'FAPSI','Facultad de Psicologia',3);
INSERT INTO facultad(`id_facultad`,`siglas`,`nombre`,`id_campus`) VALUES (19,'FASPyN','Facultad de Salud Publica y Nutricion',3);

-- INSERT INTO grado
INSERT INTO grado(`id_grado`,`grado`) VALUES (1,'Licenciatura');
INSERT INTO grado(`id_grado`,`grado`) VALUES (2,'Maestria');
INSERT INTO grado(`id_grado`,`grado`) VALUES (3,'Doctorado');

-- INSERT INTO carrera
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (1,'Agronomia',1,1);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (2,'Agronegocios',2,1);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (3,'Arquitectura',1,2);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (4,'Arte Teatral',1,3);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (5,'Diseno Grafico',1,4);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (6,'Biologia',1,5);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (7,'Microbiologia',2,5);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (8,'Microbiologia',3,5);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (9,'Ciencias de la Comunicacion',1,6);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (10,'Mercadotecnia',1,6);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (11,'Actuaria',1,7);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (12,'Ciencias Computacionales',1,7);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (13,'Fisica',1,7);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (14,'Matematicas',1,7);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (15,'Ciencia de Datos',2,7);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (16,'Ingenieria Fisica',3,7);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (17,'Ciencias Politicas',1,8);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (18,'Relaciones Internacionales',1,8);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (19,'Negocios Digitales',2,8);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (20,'Ingeniero Industrial Administrador',1,9);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (21,'Ingenieria Quimica',1,9);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (22,'Administracion',1,10);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (23,'Negocios Internacionales',1,10);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (24,'Contador Publico',1,10);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (25,'Derecho',1,11);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (26,'Criminologia',1,11);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (27,'Economia',1,12);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (28,'Ingenieria Civil',1,13);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (29,'Aeronautica',1,14);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (30,'Mecatronica',1,14);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (31,'Medico Cirujano',1,15);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (32,'Veterinaria',1,16);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (33,'Odontologia',1,17);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (34,'Psicologia',1,18);
INSERT INTO carrera(`id_carrera`,`nombre`,`id_grado`,`id_facultad`) VALUES (35,'Nutricion',1,19);

-- INSERT INTO estudiante
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1700687,'Rana','Volk',20,34,6,'ranvolk@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1701090,'Bonnibelle','Hebborne',20,14,10,'bonhebborne@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1701210,'Therese','Francesc',18,6,4,'thefrancesc@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1701437,'Nert','MacDonald',18,5,4,'nermacdonald@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1701695,'Merissa','Hayley',20,4,6,'merhayley@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1702467,'Emile','Michael',20,21,6,'emimichael@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1702668,'Francklyn','Elflain',20,32,8,'fraelflain@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1702873,'Dante','Martina',21,9,9,'danmartina@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1703180,'Marvin','Donohoe',20,27,7,'mardonohoe@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1703554,'Neila','McClaren',19,4,4,'neimcclaren@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1703588,'Merrill','Porrett',19,24,3,'merporrett@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1704351,'Frans','Kesterton',18,16,1,'frakesterton@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1705189,'Milo','Remmers',18,26,4,'milremmers@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1705654,'Wilhelm','Lindenfeld',21,34,5,'willindenfeld@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1705930,'Alwyn','Haily',18,7,3,'alwhaily@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1706078,'Cora','Hammond',18,9,2,'corhammond@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1706917,'Shalne','Thunderchief',18,16,3,'shathunderchief@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1709158,'Freeman','Das',20,15,10,'fredas@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1709462,'Cthrine','Alner',20,32,5,'cthalner@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1710836,'Putnam','Bending',20,1,6,'putbending@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1711487,'Milzie','Barlow',20,20,10,'milbarlow@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1711889,'Gib','Jedrych',20,33,10,'gibjedrych@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1714748,'Harbert','Burtwistle',19,28,3,'harburtwistle@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1715586,'Yevette','Aberdein',18,5,2,'yevaberdein@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1717303,'Cristina','Pallin',20,2,10,'cripallin@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1717645,'Otto','Bohman',19,6,1,'ottbohman@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1718428,'Efren','Rochford',19,13,2,'efrrochford@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1719086,'Avrit','Fine',18,12,2,'avrfine@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1719512,'Misty','Ormshaw',21,1,8,'misormshaw@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1719960,'Flin','Gambell',19,3,3,'fligambell@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1720984,'Ninon','Loachhead',21,22,6,'ninloachhead@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1721724,'Templeton','Brettor',19,7,2,'tembrettor@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1722764,'Berri','Georgeot',21,21,5,'bergeorgeot@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1723031,'Eada','Dubarry',18,27,1,'eaddubarry@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1723116,'Reggis','Pearne',21,15,5,'regpearne@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1724309,'Daisy','Tedorenko',21,2,9,'daitedorenko@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1724680,'Drucie','Drinnan',19,4,3,'drudrinnan@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1726221,'Alleyn','Grinishin',18,24,3,'allgrinishin@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1726853,'Madonna','Decroix',20,15,6,'maddecroix@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1728231,'Carolus','Goodayle',21,10,10,'cargoodayle@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1728614,'Homer','Raubenheim',20,20,7,'homraubenheim@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1728944,'Oralle','Gull',19,33,4,'oragull@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1729424,'Claudell','Bloor',21,5,5,'clabloor@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1733464,'Nicolis','Gulley',18,2,4,'nicgulley@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1733567,'Bartel','Marsay',18,9,1,'barmarsay@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1737519,'Errick','Sabatier',18,2,4,'errsabatier@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1737846,'Brion','Kewley',21,15,7,'brikewley@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1738610,'Ami','Porteous',19,13,4,'amiporteous@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1738928,'Reg','Thomasset',19,3,3,'regthomasset@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1739629,'Darcy','Sidebottom',20,28,7,'darsidebottom@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1739885,'Iormina','Wressell',19,22,3,'iorwressell@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1741652,'Dell','Burdfield',19,7,3,'delburdfield@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1742265,'Artur','Tynan',21,35,6,'arttynan@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1742847,'Vivian','Sparshutt',19,11,2,'vivsparshutt@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1743678,'Cully','Kerfod',18,17,2,'culkerfod@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1743811,'Glendon','Kunert',20,6,9,'glekunert@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1743846,'Merrill','Knifton',19,32,3,'merknifton@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1744396,'Blakelee','Lucius',19,24,2,'blalucius@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1744932,'Elfrieda','Lambdon',21,3,5,'elflambdon@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1747581,'Pat','Borland',21,22,10,'patborland@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1750419,'Paige','Valerio',19,10,2,'paivalerio@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1750511,'Crawford','Laurie',18,23,4,'cralaurie@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1750791,'Ava','Ewenson',18,29,2,'avaewenson@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1756966,'Cristobal','Duncanson',19,28,2,'criduncanson@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1758344,'Isidoro','Popworth',19,35,2,'isipopworth@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1759522,'Ilario','Senner',19,16,2,'ilasenner@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1760208,'Cathee','Claricoats',18,18,4,'catclaricoats@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1761130,'Corabelle','Kinchin',20,33,10,'corkinchin@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1762504,'Veda','Minshull',20,17,10,'vedminshull@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1766186,'Rani','Reddoch',20,13,9,'ranreddoch@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1769282,'Winifield','Yokel',21,6,5,'winyokel@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1769839,'Lynnell','Heatly',21,9,9,'lynheatly@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1773451,'Eduino','Buckenham',18,29,1,'edubuckenham@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1773710,'Eben','Millhouse',18,31,4,'ebemillhouse@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1774190,'Douglass','Sear',18,14,4,'dousear@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1775188,'Sal','Moore',19,30,2,'salmoore@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1775414,'Guillermo','McDyer',20,23,8,'guimcdyer@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1778762,'Thorstein','Kunc',18,20,1,'thokunc@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1778942,'Lemmie','Vedmore',19,15,4,'lemvedmore@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1779003,'Steffen','Iwanicki',21,18,9,'steiwanicki@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1779471,'Betsey','Latek',19,25,3,'betlatek@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1780973,'Mylo','Bentjens',19,27,3,'mylbentjens@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1781905,'Tomlin','De Filippis',19,6,4,'tomde filippis@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1783093,'Addia','Ramstead',18,17,1,'addramstead@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1784735,'Tasha','Willmont',20,32,5,'taswillmont@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1785296,'Tami','Toplis',20,25,10,'tamtoplis@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1786069,'Mikel','Ingleston',19,23,2,'mikingleston@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1786154,'Laetitia','Grigsby',21,30,9,'laegrigsby@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1786259,'Clay','Sterland',20,3,6,'clasterland@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1786888,'Ailyn','Sherrett',18,17,2,'ailsherrett@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1787091,'Sid','Margetts',19,31,4,'sidmargetts@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1788049,'Lanny','Deroche',18,8,4,'landeroche@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1788425,'Bernadine','Merrett',19,8,4,'bermerrett@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1789141,'Ferdinande','Radish',20,27,7,'ferradish@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1791000,'Guinevere','Threadgall',20,26,9,'guithreadgall@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1791312,'Margret','Levane',21,34,6,'marlevane@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1791721,'Erik','Baverstock',19,33,2,'eribaverstock@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1791978,'Victor','Trevains',21,23,10,'victrevains@uanl.edu.mx','H');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1798007,'Noelani','Wharton',18,19,1,'noewharton@uanl.edu.mx','M');
INSERT INTO estudiante(`matricula`,`nombre`,`apellido`,`edad`,`id_carrera`,`semestre`,`correo`,`sexo`) VALUES (1799242,'Cash','Collingdon',20,29,8,'cascollingdon@uanl.edu.mx','H');

-- INSERT INTO autor
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (1,'Wallache','Langhorn');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (2,'Munroe','Baldocci');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (3,'Tildie','Pattullo');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (4,'Rene','Pothergill');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (5,'Husein','Caesman');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (6,'Herold','Lurriman');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (7,'Kessiah','Parfitt');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (8,'Anna-diane','Marston');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (9,'Ardeen','Jerratsch');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (10,'Sherye','Berthelet');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (11,'Enid','Glanders');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (12,'Jorey','Boyles');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (13,'Hillard','Vinick');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (14,'Marcelia','Brolly');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (15,'Marin','Medina');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (16,'Eda','Mobley');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (17,'Florence','Epsly');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (18,'Bernete','Purdie');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (19,'Nikki','Abadam');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (20,'Eydie','Simpkin');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (21,'Cherrita','Heasly');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (22,'Ave','Klehyn');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (23,'May','Bockman');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (24,'Dale','Tuckley');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (25,'Jessica','De Paoli');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (26,'Chet','Grossman');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (27,'Francesca','Durie');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (28,'Jordon','Goldsbury');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (29,'Angelico','Rentoll');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (30,'Maurene','Argile');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (31,'Riannon','Thomton');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (32,'Kori','Regglar');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (33,'Hercules','Borland');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (34,'Rolf','Carcas');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (35,'Cherie','Mallebone');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (36,'Elle','Bittany');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (37,'Rurik','Pittway');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (38,'Byram','Mauger');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (39,'Camella','Martynov');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (40,'Shelbi','Arter');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (41,'Dahlia','Di Franceschi');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (42,'Selia','Gioan');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (43,'Ryley','Taberer');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (44,'Danette','Duignan');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (45,'Joanie','Raiker');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (46,'Gunar','Midgley');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (47,'Eal','Malkin');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (48,'Ferdinand','Volker');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (49,'Thaddeus','Polycote');
INSERT INTO autor(`id_autor`,`nombre`,`apellido`) VALUES (50,'Hanni','Crothers');

-- INSERT INTO editorial
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (1,'Tromp, Farrell and Collins');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (2,'Mohr-Kuhn');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (3,'Jacobs-Wiegand');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (4,'Quigley-Sawayn');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (5,'Crist, Feest and Padberg');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (6,'Carter-Labadie');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (7,'Friesen Group');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (8,'Bahringer-Conroy');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (9,'Gerhold-D\'Amore');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (10,'Hamill Inc');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (11,'Connelly Group');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (12,'Farrell, Raynor and Walter');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (13,'Luettgen-Hammes');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (14,'Hammes-Kirlin');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (15,'Hettinger LLC');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (16,'O\'Reilly, Bode and Erdman');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (17,'Auer, Grant and Funk');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (18,'Steuber and Sons');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (19,'Volkman LLC');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (20,'Prosacco Group');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (21,'Mann-Fahey');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (22,'Ward Inc');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (23,'Purdy-Kassulke');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (24,'Koch Inc');
INSERT INTO editorial(`id_editorial`,`nombre`) VALUES (25,'Ledner-Sporer');

-- INSERT INTO genero
INSERT INTO genero(`id_genero`,`genero`) VALUES (1,'Autobiografia');
INSERT INTO genero(`id_genero`,`genero`) VALUES (2,'Biografia');
INSERT INTO genero(`id_genero`,`genero`) VALUES (3,'Arte y Fotografia');
INSERT INTO genero(`id_genero`,`genero`) VALUES (4,'Autoayuda');
INSERT INTO genero(`id_genero`,`genero`) VALUES (5,'Historia');
INSERT INTO genero(`id_genero`,`genero`) VALUES (6,'Casos Reales');
INSERT INTO genero(`id_genero`,`genero`) VALUES (7,'Ensayos');
INSERT INTO genero(`id_genero`,`genero`) VALUES (8,'Guias/Tutoriales');
INSERT INTO genero(`id_genero`,`genero`) VALUES (9,'Religion/Espiritualidad');
INSERT INTO genero(`id_genero`,`genero`) VALUES (10,'Humanidades/Ciencias Sociales');
INSERT INTO genero(`id_genero`,`genero`) VALUES (11,'Ciencia');
INSERT INTO genero(`id_genero`,`genero`) VALUES (12,'Tecnologia');

-- INSERT INTO formato
INSERT INTO formato(`id_formato`,`formato`) VALUES (1,'Pasta Blanda');
INSERT INTO formato(`id_formato`,`formato`) VALUES (2,'Pasta Dura');

-- INSERT INTO libro (titulos inventados)
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('015794603-7','Haliaeetus leucoryphus',1,1995,5,4,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('016133730-9','Haliaeetus leucocephalus',4,1991,7,20,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('021227150-4','Macropus eugenii',2,2002,5,15,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('051749109-5','Psophia viridis',3,2018,12,8,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('056456979-8','Platalea leucordia',2,1994,8,18,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('059290692-2','Stercorarius longicausus',1,2016,5,3,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('095087802-2','Spermophilus richardsonii',2,1993,6,8,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('106395212-3','unavailable',4,1997,1,25,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('116276221-7','Hyaena hyaena',4,1995,5,8,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('143204729-9','Bassariscus astutus',3,1991,6,16,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('154757947-1','Antilope cervicapra',1,2011,1,11,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('216680255-9','Bison bison',1,1997,4,14,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('234256998-X','Pelecanus conspicillatus',3,2011,5,8,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('241788698-7','Cacatua tenuirostris',3,2003,7,6,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('245742786-X','Laniarius ferrugineus',2,2006,6,4,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('333314525-1','Otaria flavescens',3,1992,11,21,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('338007338-5','Echimys chrysurus',4,1995,7,20,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('366044982-2','Diomedea irrorata',1,2016,3,18,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('379740938-9','Tockus erythrorhyncus',4,2015,9,20,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('412823446-X','Casmerodius albus',1,2002,9,23,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('422954603-3','Anastomus oscitans',3,2010,10,5,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('434912049-1','Boa constrictor mexicana',7,2012,11,8,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('439777150-2','Speotyte cuniculata',1,2003,12,20,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('441480480-9','Ovis musimon',2,2012,8,2,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('460484062-8','Calyptorhynchus magnificus',1,1994,4,18,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('504786802-8','Lamprotornis nitens',4,2006,10,10,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('504801070-1','Bassariscus astutus',4,2013,12,16,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('507604456-9','Alopex lagopus',3,2010,6,13,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('580413621-6','Spheniscus magellanicus',3,2012,1,20,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('581077012-6','Marmota flaviventris',3,2003,11,8,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('594892597-8','Propithecus verreauxi',4,1997,1,3,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('619405503-0','Theropithecus gelada',2,2018,3,7,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('620305985-4','Hystrix cristata',3,2000,8,20,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('626466582-7','Thamnolaea cinnmomeiventris',2,2006,5,15,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('643673769-3','Manouria emys',3,1993,11,23,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('681631728-9','Parus atricapillus',4,1995,9,22,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('686847120-3','Gyps bengalensis',3,1998,10,25,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('704281565-3','Tragelaphus angasi',2,1995,9,6,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('808561492-8','Vanellus sp.',3,2019,5,2,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('820698367-8','Oncorhynchus nerka',3,2018,3,12,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('822098574-7','Bubo sp.',3,2016,3,13,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('831321534-8','Herpestes javanicus',4,2005,1,13,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('867218075-5','Ciconia ciconia',1,2017,9,25,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('869521514-8','Tiliqua scincoides',4,2003,9,15,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('873824580-9','Geochelone elephantopus',3,2017,3,20,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('882826461-6','Corvus brachyrhynchos',4,1992,6,18,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('902354870-1','Lamprotornis sp.',3,1992,11,14,1);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('945010905-2','Phascolarctos cinereus',3,1990,7,13,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('971059199-1','Castor canadensis',4,1995,11,20,2);
INSERT INTO libro(`isbn`,`titulo`,`edicion`,`copyright`,`id_genero`,`id_editorial`,`id_formato`) VALUES ('972805617-6','Francolinus leucoscepus',3,1999,2,16,2);

-- INSERT INTO autores_libro
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('015794603-7',1,3);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('015794603-7',17,2);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('015794603-7',41,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('015794603-7',48,4);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('016133730-9',1,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('021227150-4',5,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('051749109-5',6,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('056456979-8',36,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('059290692-2',28,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('095087802-2',10,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('106395212-3',4,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('116276221-7',15,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('116276221-7',50,2);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('143204729-9',3,2);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('143204729-9',35,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('154757947-1',37,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('216680255-9',47,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('234256998-X',32,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('241788698-7',3,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('245742786-X',9,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('333314525-1',33,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('338007338-5',18,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('366044982-2',20,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('379740938-9',50,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('412823446-X',12,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('422954603-3',29,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('434912049-1',2,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('434912049-1',48,2);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('439777150-2',21,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('441480480-9',25,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('460484062-8',24,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('460484062-8',48,2);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('504786802-8',38,2);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('504786802-8',48,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('504801070-1',17,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('507604456-9',49,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('580413621-6',14,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('581077012-6',42,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('594892597-8',22,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('619405503-0',34,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('620305985-4',16,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('626466582-7',45,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('643673769-3',40,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('681631728-9',7,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('681631728-9',18,2);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('681631728-9',33,3);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('686847120-3',31,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('704281565-3',23,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('808561492-8',44,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('820698367-8',27,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('822098574-7',11,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('831321534-8',30,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('867218075-5',8,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('869521514-8',19,2);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('869521514-8',46,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('873824580-9',43,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('882826461-6',39,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('902354870-1',13,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('902354870-1',42,2);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('945010905-2',19,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('971059199-1',38,1);
INSERT INTO autores_libro(`isbn`,`id_autor`,`ordinal_autor`) VALUES ('972805617-6',26,1);

-- INSERT INTO inv_libro
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (1,'016133730-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (2,'016133730-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (3,'016133730-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (4,'016133730-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (5,'434912049-1');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (6,'434912049-1');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (7,'434912049-1');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (8,'241788698-7');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (9,'241788698-7');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (10,'106395212-3');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (11,'021227150-4');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (12,'021227150-4');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (13,'021227150-4');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (14,'021227150-4');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (15,'051749109-5');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (16,'051749109-5');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (17,'051749109-5');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (18,'681631728-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (19,'681631728-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (20,'867218075-5');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (21,'245742786-X');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (22,'245742786-X');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (23,'245742786-X');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (24,'095087802-2');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (25,'095087802-2');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (26,'822098574-7');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (27,'822098574-7');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (28,'412823446-X');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (29,'412823446-X');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (30,'412823446-X');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (31,'412823446-X');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (32,'902354870-1');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (33,'902354870-1');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (34,'580413621-6');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (35,'580413621-6');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (36,'580413621-6');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (37,'116276221-7');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (38,'116276221-7');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (39,'620305985-4');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (40,'620305985-4');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (41,'504801070-1');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (42,'504801070-1');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (43,'338007338-5');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (44,'338007338-5');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (45,'338007338-5');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (46,'945010905-2');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (47,'945010905-2');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (48,'366044982-2');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (49,'366044982-2');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (50,'366044982-2');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (51,'439777150-2');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (52,'439777150-2');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (53,'439777150-2');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (54,'439777150-2');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (55,'594892597-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (56,'704281565-3');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (57,'460484062-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (58,'460484062-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (59,'460484062-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (60,'460484062-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (61,'460484062-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (62,'460484062-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (63,'441480480-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (64,'441480480-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (65,'441480480-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (66,'972805617-6');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (67,'972805617-6');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (68,'820698367-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (69,'820698367-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (70,'059290692-2');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (71,'059290692-2');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (72,'059290692-2');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (73,'422954603-3');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (74,'422954603-3');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (75,'831321534-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (76,'831321534-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (77,'831321534-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (78,'831321534-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (79,'686847120-3');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (80,'686847120-3');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (81,'234256998-X');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (82,'333314525-1');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (83,'619405503-0');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (84,'619405503-0');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (85,'619405503-0');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (86,'143204729-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (87,'056456979-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (88,'154757947-1');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (89,'154757947-1');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (90,'154757947-1');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (91,'971059199-1');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (92,'971059199-1');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (93,'882826461-6');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (94,'882826461-6');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (95,'882826461-6');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (96,'643673769-3');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (97,'015794603-7');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (98,'581077012-6');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (99,'581077012-6');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (100,'581077012-6');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (101,'873824580-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (102,'873824580-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (103,'808561492-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (104,'808561492-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (105,'626466582-7');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (106,'869521514-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (107,'869521514-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (108,'869521514-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (109,'216680255-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (110,'216680255-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (111,'504786802-8');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (112,'507604456-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (113,'507604456-9');
INSERT INTO inv_libro(`id_libro`,`isbn`) VALUES (114,'379740938-9');

-- INSERT INTO prestamo
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (1,2,1786069,'2022-05-26','2022-06-16');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (2,9,1799242,'2022-05-26','2022-06-16');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (3,13,1717303,'2022-05-27','2022-06-17');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (4,88,1762504,'2022-05-30','2022-06-20');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (5,68,1701090,'2022-05-31','2022-06-21');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (6,40,1785296,'2022-05-31','2022-06-21');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (7,45,1701437,'2022-06-01','2022-06-22');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (8,73,1761130,'2022-06-01','2022-06-22');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (9,54,1769282,'2022-06-13','2022-07-04');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (10,29,1718428,'2022-06-13','2022-07-04');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (11,44,1773710,'2022-06-15','2022-07-06');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (12,79,1726853,'2022-06-17','2022-07-08');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (13,12,1739885,'2022-06-17','2022-07-08');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (14,74,1723116,'2022-06-20','2022-07-11');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (15,113,1705654,'2022-06-20','2022-07-11');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (16,51,1774190,'2022-06-20','2022-07-11');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (17,100,1711889,'2022-06-20','2022-07-11');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (18,64,1709462,'2022-06-20','2022-07-11');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (19,81,1784735,'2022-06-20','2022-07-11');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (20,96,1787091,'2022-06-20','2022-07-11');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (21,46,1719512,'2022-06-21','2022-07-12');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (22,19,1780973,'2022-06-21','2022-07-12');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (23,38,1700687,'2022-06-21','2022-07-12');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (24,28,1703554,'2022-06-21','2022-07-12');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (25,108,1739629,'2022-06-21','2022-07-12');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (26,66,1778942,'2022-06-22','2022-07-13');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (27,63,1703180,'2022-06-22','2022-07-13');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (28,57,1702668,'2022-06-22','2022-07-13');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (29,31,1781905,'2022-06-23','2022-07-14');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (30,110,1778762,'2022-06-23','2022-07-14');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (31,23,1728231,'2022-06-23','2022-07-14');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (32,98,1733567,'2022-06-24','2022-07-15');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (33,24,1728944,'2022-06-24','2022-07-15');
INSERT INTO prestamo(`id_prestamo`,`id_libro`,`matricula`,`fecha_prestamo`,`fecha_vencimiento`) VALUES (34,80,1743846,'2022-06-24','2022-07-15');

-- INSERT INTO devolucion
INSERT INTO devolucion(`id_prestamo`,`fecha_devolucion`) VALUES (1,'2022-06-15');
INSERT INTO devolucion(`id_prestamo`,`fecha_devolucion`) VALUES (2,'2022-06-17');
INSERT INTO devolucion(`id_prestamo`,`fecha_devolucion`) VALUES (3,'2022-06-15');
INSERT INTO devolucion(`id_prestamo`,`fecha_devolucion`) VALUES (4,'2022-06-15');
INSERT INTO devolucion(`id_prestamo`,`fecha_devolucion`) VALUES (5,'2022-06-17');
INSERT INTO devolucion(`id_prestamo`,`fecha_devolucion`) VALUES (6,'2022-06-20');
INSERT INTO devolucion(`id_prestamo`,`fecha_devolucion`) VALUES (7,'2022-06-20');
INSERT INTO devolucion(`id_prestamo`,`fecha_devolucion`) VALUES (8,'2022-06-21');

-- --------------------------------------------------------------------------------------------------------------------
/* CREAR VISTAS */
-- --------------------------------------------------------------------------------------------------------------------

-- VISTA Informacion de Estudiante Completa 
CREATE VIEW vw_estudiante_completo AS
	   SELECT e.matricula
            , e.nombre
			, e.apellido
            , e.edad
            , e.correo
            , e.sexo
            , c.nombre as nombre_carrera
            , e.semestre
            , g.grado
            , f.siglas as siglas_facultad
            , f.nombre as nombre_facultad
            , ca.nombre as nombre_campus
	     FROM estudiante e 
		INNER JOIN carrera c 
		        ON (e.id_carrera = c.id_carrera)
		INNER JOIN grado g 
                ON (c.id_grado=g.id_grado)
		INNER JOIN facultad f 
                ON (c.id_facultad=f.id_facultad)
		INNER JOIN campus ca 
                ON (f.id_campus=ca.id_campus);

-- VISTA Informacion de Libro Completa
CREATE VIEW vw_libro_completo AS
	   SELECT l.isbn
            , l.titulo
            , l.edicion
            , l.copyright
            , g.genero as genero
            , e.nombre as editorial
            , f.formato as formato_impresion
	     FROM libro l
		INNER JOIN genero g 
                ON (l.id_genero=g.id_genero)
		INNER JOIN editorial e 
                ON (l.id_editorial=e.id_editorial)
		INNER JOIN formato f 
                ON (l.id_formato=f.id_formato);
 
-- VISTA prestamo + devolucion (con status de entrega incluido)
CREATE VIEW vw_status_prestamos AS
	   SELECT p.id_prestamo
            , p.id_libro
            , p.matricula
            , p.fecha_prestamo
            , p.fecha_vencimiento
            , d.fecha_devolucion
            , CASE
			     WHEN p.fecha_vencimiento>d.fecha_devolucion THEN "A tiempo"
			     WHEN p.fecha_vencimiento<d.fecha_devolucion THEN "Retraso"
			     ELSE null
		       END as status_entrega
		FROM prestamo p
	    LEFT JOIN devolucion d 
               ON (p.id_prestamo=d.id_prestamo);

-- VISTA Libro con Nombre y apellido de los Autores
CREATE VIEW vw_autores_libro AS
	   SELECT l.isbn
            , l.titulo
			, a.nombre as nombre_autor
            , a.apellido as apellido_autor 
		 FROM libro l
	     LEFT JOIN autores_libro autores 
                ON (l.isbn=autores.isbn)
	     LEFT JOIN autor a 
                ON (autores.id_autor=a.id_autor)
	    ORDER BY l.isbn
            , ordinal_autor;

-- VISTA con cantidad de libros en existencia
CREATE VIEW vw_libros_disponibles AS
	   SELECT i.isbn
            , l.titulo
            , count(i.isbn) as existencias_totales
            , (count(p.id_prestamo) - count(d.id_prestamo)) as prestados_actualmente
            , (count(i.isbn) - (count(p.id_prestamo) - count(d.id_prestamo))) as disponibles
	     FROM inv_libro i
	     LEFT JOIN libro l ON(i.isbn=l.isbn)
	     LEFT JOIN prestamo p ON(i.id_libro=p.id_libro)
	     LEFT JOIN devolucion d ON(p.id_prestamo=d.id_prestamo)
	    GROUP BY isbn
	    ORDER BY i.id_libro;
    
-- --------------------------------------------------------------------------------------------------------------------
/* CREAR FUNCIONES PERSONALIZADAS */
-- --------------------------------------------------------------------------------------------------------------------

-- 1. Obtener la cantidad de libros prestados en un mes y anio en especifico insertando la matricula del estudiante (mas util con muchisimos mas datos).

USE `biblioteca`;
DROP function IF EXISTS `cantidad_prestados`;

DELIMITER $$
USE `biblioteca`$$
CREATE FUNCTION `cantidad_prestados` (est_matricula INT, year INT, month INT)
RETURNS INTEGER
DETERMINISTIC
BEGIN
	DECLARE resultado INT;
    SET resultado = (
						SELECT count(id_prestamo)
                        FROM prestamo
                        WHERE matricula = est_matricula
						AND year(fecha_prestamo) = year
                        AND month(fecha_prestamo) = month
					);
RETURN resultado;
END$$

DELIMITER ;

-- 2. Obtener la cantidad de libros en inventario, insertando el nombre del mismo.

USE `biblioteca`;
DROP function IF EXISTS `cantidad_libros`;

USE `biblioteca`;
DROP function IF EXISTS `biblioteca`.`cantidad_libros`;
;

DELIMITER $$
USE `biblioteca`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `cantidad_libros`(titulo VARCHAR(150)) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE cantidad INT;
    SET cantidad = (
						SELECT count(id_libro)
						FROM inv_libro AS inv
						LEFT JOIN libro AS l
						ON (inv.isbn = l.isbn)
						WHERE l.titulo = titulo
					);
    
RETURN cantidad;
END$$

DELIMITER ;
;

-- --------------------------------------------------------------------------------------------------------------------
/* CREAR STORED PROCEDURES */
-- --------------------------------------------------------------------------------------------------------------------

-- 1. SP Ordenamiento de tabla

USE `biblioteca`;
DROP procedure IF EXISTS `ordenamiento_libros`;

USE `biblioteca`;
DROP procedure IF EXISTS `biblioteca`.`ordenamiento_libros`;
;

DELIMITER $$
USE `biblioteca`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ordenamiento_libros`(IN p_campo TEXT, IN direccion TEXT)
BEGIN
		SET @query = CONCAT (
								'SELECT *
                                FROM libro
                                ORDER BY (',p_campo,') ',direccion
							);
		PREPARE stmt FROM @query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
END$$

DELIMITER ;
;

-- 2. SP Insertar libro

USE `biblioteca`;
DROP procedure IF EXISTS `insertar_libro`;

DELIMITER $$
USE `biblioteca`$$
CREATE PROCEDURE `insertar_libro` (IN p_isbn VARCHAR(15), IN p_titulo VARCHAR(150), IN p_edicion INT, IN p_copyright INT, IN p_id_genero INT,IN p_id_editorial INT, IN p_id_formato INT)
BEGIN
		IF p_isbn NOT IN (SELECT DISTINCT titulo FROM libro)
        THEN
			INSERT INTO libro (isbn,titulo,edicion,copyright,id_genero,id_editorial,id_formato)
			VALUES	(p_isbn,p_titulo,p_edicion,p_copyright,p_id_genero,p_id_editorial,p_id_formato);
		ELSE
			SELECT 'Libro (ISBN) repetido';
		END IF;
END$$

DELIMITER ;


-- --------------------------------------------------------------------------------------------------------------------
/* CREAR TRIGGERS */
-- --------------------------------------------------------------------------------------------------------------------

-- 1. TRIGGER AFTER
-- EXPLICACION; Al insertar un registro en la tabla 'Libro' se agrega el ISBN,el titulo, el usario, la fecha y hora a la tabla 'nuevos_libros' automaticamente

CREATE TABLE nuevos_libros (
						   id INT PRIMARY KEY AUTO_INCREMENT,
						   isbn VARCHAR(15) NOT NULL,
						   titulo VARCHAR(150) NOT NULL,
						   registrado_por VARCHAR(100),
						   fecha_insertado DATETIME,
						   hora_insertado TEXT
);


DELIMITER //

CREATE TRIGGER INS_AFT_libro_nuevos
AFTER INSERT ON libro
FOR EACH ROW
BEGIN
	INSERT INTO nuevos_libros (isbn,titulo,registrado_por,fecha_insertado,hora_insertado)
    VALUES (NEW.isbn,NEW.titulo,USER(),CURDATE(),CURTIME());
END//

DELIMITER ;


-- 2. TRIGGER BEFORE
-- EXPLICACION; Una tabla en la que se reflejen los estudiantes eliminados de la tabla 'estudiante', mostrando si su baja se debe a que el estudiante se dio de baja voluntariamente (fue eliminado de la tabla cuando SEMESTRE < 10) o si se graduo (SEMESTRE = 10)

CREATE TABLE `bajas` (
					 matricula INT NOT NULL,
					 semestre_final INT NOT NULL,
					 motivo ENUM('baja voluntaria','graduado')
);


DELIMITER //

CREATE TRIGGER  DEL_BEF_estudiante_bajas
BEFORE DELETE ON estudiante
FOR EACH ROW
BEGIN
	IF old.semestre < 10 THEN
		INSERT INTO bajas (matricula, semestre_final, motivo)
        VALUES (old.matricula,old.semestre,"BAJA VOLUNTARIA");
	ELSE
		INSERT INTO bajas (matricula, semestre_final, motivo)
        VALUES (old.matricula,old.semestre,"GRADUADO");
	END IF;
END//

DELIMITER ;


-- --------------------------------------------------------------------------------------------------------------------
/* LENGUAJE DCL */
-- --------------------------------------------------------------------------------------------------------------------

-- CREAR USUARIOS
CREATE USER joel@localhost; -- Creacion de Usuario Joel en el server local
CREATE USER yuan@localhost IDENTIFIED BY 'coder'; -- Creacion de Usuario 'Yuan' en el server local con contrasena
CREATE USER hacker@localhost; -- Creacion de Usuario Hacker en el server local

RENAME USER yuan@localhost TO juan@localhost; -- Correccion de nombre de Yuan a Juan
DROP USER hacker@localhost; -- Eliminacion de usuario Hacker

GRANT SELECT ON biblioteca.* TO joel@localhost; -- Otorgar permisos para lectura al usuario Joel
GRANT SELECT,INSERT,UPDATE ON biblioteca.* TO juan@localhost; -- Otorgar permisos para Lectura, Insercion y Modificacion al usuario Juan

REVOKE DELETE ON biblioteca.* FROM joel@localhost; -- Revocacion de permisos para eliminar registros al usuario Joel
REVOKE DELETE ON biblioteca.* FROM juan@localhost; -- Revocacion de permisos para eliminar registros al usuario Juan

-- --------------------------------------------------------------------------------------------------------------------
/* LENGUAJE TCL */
-- --------------------------------------------------------------------------------------------------------------------

-- PRIMERA TABLA: ESTUDIANTE

SELECT * FROM estudiante WHERE matricula = '1711487';
START TRANSACTION;
	DELETE FROM estudiante WHERE matricula IN ('1701090','1711487');
-- ROLLBACK
COMMIT;

SELECT * FROM estudiante WHERE matricula = '1711487';
INSERT INTO estudiante 
	(matricula,nombre,apellido,edad,id_carrera,semestre,correo,sexo)
VALUES
	(1701090,"Bonnibelle","Hebborne",20,14,10,"bonhebborne@uanl.edu.mx","M"),
	(1711487, 'Milzie', 'Barlow',20,20, 10, 'milbarlow@uanl.edu.mx', 'M');
SELECT * FROM estudiante WHERE matricula = '1711487';


-- SEGUNDA TABLA: Libro
SELECT * FROM libro;

START TRANSACTION;
	INSERT INTO libro
	VALUES
		('111111111-1','Primero',1,2000,4,2,1),
		('222222222-2','Segundo',1,2001,6,19,1),
		('333333333-3','Tercero',3,2002,9,12,1),
		('444444444-4','Cuarto',2,2003,10,5,1);
	SAVEPOINT formato1;
    INSERT INTO libro
	VALUES
		('555555555-5','Quinto', 4, 2004,1,2,2),
		('666666666-6','Sexto',6,2005,7,18,2),
		('777777777-7','Septimo',4,2006,2,2,2),
		('888888888-8','Octavo',9,2007,10,20,2);
	SAVEPOINT formato2;
COMMIT;
-- RELEASE SAVEPOINT formato1;

SELECT * FROM LIBRO;
DELETE FROM LIBRO WHERE titulo IN ('Primero','Segundo','Tercero','Cuarto',"Quinto","Sexto","Septimo","Octavo");
SELECT * FROM LIBRO;


        












