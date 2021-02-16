
USE netflix;

ALTER TABLE Material
ADD FULLTEXT(titulo, sinopsis);

ALTER TABLE Persona
ADD FULLTEXT(nombre, apellido);


