
USE netflix;

INSERT INTO Clasificacion (id_clasificacion, clasificacion) VALUES
(1, 'niños'),
(2, '+ 13'),
(3, '+ 7'),
(4, '+16');

INSERT INTO Creador (id_creador, creador) VALUES
(1, 'Disney'),
(2, 'HBO'),
(3, 'Netflix'),
(4, '20th Century '),
(5, 'Fox ');

INSERT INTO PlanStreaming (id_plan, nombre_plan, max_enlaces, max_dispositivos, precio_actual) VALUES
(1, 'Plan uno)', 1, 1, 900),
(2, 'Plan dos)', 2, 3, 1200),
(3, 'Plan tres)', 4, 10, 5000);

INSERT INTO Persona (id_persona, nombre, apellido) VALUES
(1, 'Servetto', '1'),
(2, 'Nahuel', '2'),
(3, 'Guionista', '1'),
(4, 'Guionista', '2'),
(5, 'Interprete', '1'),
(6, 'Interprete', '2');

INSERT INTO Cuenta (id_cuenta, email, id_plan, contrasenia, nro_celular) VALUES
(1, 'BDD@fiuba.com.ar', 1, 'BDD', '1122334455');

INSERT INTO Genero (id_genero, genero) VALUES
(1, 'Acción y aventuras'),
(2, 'Acción asiático'),
(3, 'Thrillers de acción'),
(4, 'Aventuras'),
(5, 'Cine de cómics y superhéroes'),
(6, 'Westerns');

INSERT INTO Material (id_material, id_genero, titulo, anio, sinopsis) VALUES
(1, 1, 'Titanic', '1997', 'la tragedia del titanic'),
(2, 1, 'un', '200', 'titanic'),
(3, 3, 'Game of thrones', '2010', 'juego de tronos'),
(4, 1, 'Friends', '1990', 'amigos'),
(5, 3, 'Miniserie', '2000', 'esto es una miniserie de 3 partes');

INSERT INTO MaterialCreador (id_material, id_creador) VALUES
(1, 1),
(2, 2);

INSERT INTO MiniSerieParte (id_material, nro_parte, titulo, duracion, sinopsis) VALUES
(5, 1, 'capitulo 1', '30', 'es la primera parte'),
(5, 2, 'capitulo 2', '30', 'es la segunda parte'),
(5, 3, 'capitulo 3', '30', 'es la tercera parte');

INSERT INTO Pelicula (id_material, duracion) VALUES
(1, 100);

INSERT INTO SerieTemporada (id_material, nro_temporada) VALUES
(3, 1),
(3, 2),
(3, 3),
(4, 1);

INSERT INTO Episodio (id_material, nro_temporada, nro_episodio, titulo, duracion, sinopsis) VALUES
(3, 1, 1, 'capitulo 1', 60, 'introduccion'),
(3, 1, 2, 'capitulo 2', 60, 'nudo'),
(3, 1, 3, 'capitulo 3', 60, 'desenlace'),
(3, 2, 1, 'capitulo 1', 60, 'introduccion'),
(3, 2, 2, 'capitulo 2', 60, 'nudo'),
(3, 2, 3, 'capitulo 3', 60, 'desenlace'),
(3, 3, 1, 'capitulo 1', 60, 'introduccion'),
(3, 3, 2, 'capitulo 2', 60, 'nudo'),
(3, 3, 3, 'capitulo 3', 60, 'desenlace'),
(4, 1, 1, 'piloto', 60, 'capitulo piloto'),
(4, 1, 2, 'segundo cap', 60, 'show 2');

INSERT INTO PalabraDescriptora (id_palabra_descriptora, palabra_descriptora) VALUES
(1, 'Amor'),
(2, 'Barco'),
(3, 'Tragedia'),
(4, 'Guerra'),
(5, 'Armas'),
(6, 'Drogas');

INSERT INTO Perfil (id_perfil, id_cuenta, idioma, prefiere_doblaje, nombre, id_clasificacion) VALUES
(1, 1, 'ingles', false, 'Juan Perez', 4),
(2, 1, 'ingles', false, 'Maria Perez', 1),
(3, 1, 'ingles', false, 'Pedro Perez', 1);

INSERT INTO Calificacion (id_perfil, id_material, calificacion_positiva) VALUES
(1, 1, TRUE);

INSERT INTO PeliculaVista (id_material, id_perfil, minutos_vistos) VALUES
(1, 2, 60),
(1, 1, 60);

INSERT INTO ParteVista (id_material, id_perfil, nro_parte) VALUES
(5, 2, 1),
(5, 2, 2),
(5, 2, 3);

INSERT INTO EpisodioVisto (id_material, id_perfil, nro_episodio, nro_temporada) VALUES
(3, 2, 1, 1),
(4, 2, 1, 1),
(4, 2, 2, 1),
(4, 1, 2, 1),
(4, 3, 2, 1);

INSERT INTO MaterialDirector (id_material, id_persona) VALUES
(1, 1),
(2, 2);

INSERT INTO MaterialGenero (id_material, id_genero) VALUES
(1, 1);

INSERT INTO MaterialGuionista (id_material, id_persona) VALUES
(1, 3);

INSERT INTO MaterialInterprete (id_material, id_persona, es_protagonista) VALUES
(1, 4, 1);

INSERT INTO GeneroPreferido (id_perfil, id_genero, orden_preferencia) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(2, 6, 1);

INSERT INTO MaterialAfinidad (id_material, id_perfil, porcentaje) VALUES
(1, 1, 60),
(2, 1, 40),
(3, 1, 50),
(2, 2, 90),
(4, 3, 40);

