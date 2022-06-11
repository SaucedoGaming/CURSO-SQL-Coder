CREATE SCHEMA biblioteca;

USE biblioteca;

-- CREAR TABLAS
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
    nombre VARCHAR(25) NOT NULL,
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
    telefono INT NOT NULL,
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
	isbn INT NOT NULL,
    id_autor INT NOT NULL,
    ordinal_autor INT
);

-- Tabla Editorial
CREATE TABLE Editorial(
	id_editorial INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL
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
	isbn INT NOT NULL PRIMARY KEY,
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
    isbn INT NOT NULL
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

-- AGREGAR FOREIGN KEYS
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
ALTER TABLE Prestamo ADD FOREIGN KEY (matricula) REFERENCES Estudiante(matricula);

-- FK Devolucion
ALTER TABLE Devolucion ADD FOREIGN KEY (id_prestamo) REFERENCES Prestamo(id_prestamo);


