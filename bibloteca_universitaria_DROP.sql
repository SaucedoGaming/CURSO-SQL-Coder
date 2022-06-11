-- DROP Tablas
DROP TABLE autor;
DROP TABLE autores_libro;
DROP TABLE campus;
DROP TABLE carrera;
DROP TABLE devolucion;
DROP TABLE editorial;
DROP TABLE estudiante;
DROP TABLE facultad;
DROP TABLE formato;
DROP TABLE genero;
DROP TABLE grado;
DROP TABLE inv_libro;
DROP TABLE libro;
DROP TABLE prestamo;



-- DROPPEAR FOREIGN KEYS
-- FK Facultad
ALTER TABLE Facultad DROP FOREIGN KEY id_campus;

-- FK Carrera
ALTER TABLE Carrera DROP FOREIGN KEY id_grado;
ALTER TABLE Carrera DROP FOREIGN KEY id_facultad;

-- FK Estudiante
ALTER TABLE Estudiante DROP FOREIGN KEY id_carrera;

-- FK Autores_Libro
ALTER TABLE Autores_libro DROP FOREIGN KEY isbn;
ALTER TABLE Autores_libro DROP FOREIGN KEY id_autor;

-- FK Libro
ALTER TABLE Libro DROP FOREIGN KEY id_genero;
ALTER TABLE Libro DROP FOREIGN KEY id_editorial;
ALTER TABLE Libro DROP FOREIGN KEY id_formato;

-- FK Inv_Libro
ALTER TABLE Inv_Libro DROP FOREIGN KEY isbn;

-- FK Prestamo
ALTER TABLE Prestamo DROP FOREIGN KEY id_libro;
ALTER TABLE Prestamo DROP FOREIGN KEY matricula;

-- FK Devolucion
ALTER TABLE Devolucion DROP FOREIGN KEY id_prestamo;
