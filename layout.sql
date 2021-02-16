
CREATE DATABASE netflix;

USE netflix;


CREATE TABLE IF NOT EXISTS PlanStreaming (
  id_plan int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nombre_plan varchar(50) NOT NULL,
  max_enlaces smallint NOT NULL,
  max_dispositivos smallint NOT NULL,
  precio_actual double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS Cuenta (
  id_cuenta int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  email varchar(100) UNIQUE NOT NULL,
  id_plan int NOT NULL,
  contrasenia varchar(100) NOT NULL,
  nro_celular varchar(100) NOT NULL,
  CONSTRAINT CUENTA_PLAN_FK FOREIGN KEY (id_plan) REFERENCES PlanStreaming (id_plan)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS Actividad (
  id_actividad int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  id_cuenta int NOT NULL,
  fecha_hora timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  ip varchar(50) NOT NULL,
  dispositivo enum('tablet android','iphone','navegador web','telefono android','smart tv','otros') NOT NULL,
  CONSTRAINT ACTIVIDAD_CUENTA_FK FOREIGN KEY (id_cuenta) REFERENCES Cuenta (id_cuenta)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS Clasificacion (
  id_clasificacion int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  clasificacion varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS Creador (
  id_creador int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  creador varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS Genero (
  id_genero int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  genero varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS PalabraDescriptora (
  id_palabra_descriptora int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  palabra_descriptora varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS Material (
  id_material int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  titulo varchar(100) NOT NULL,
  anio varchar(10) NOT NULL,
  id_genero int NOT NULL,
  sinopsis varchar(1000) NOT NULL,
  UNIQUE KEY MATERIAL_TITULO_ANIO_UNIQUE (titulo, anio),
  CONSTRAINT MATERIAL_GENERO_FK FOREIGN KEY (id_genero) REFERENCES Genero (id_genero)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS SerieTemporada (
  id_material int NOT NULL,
  nro_temporada smallint NOT NULL,
  PRIMARY KEY (id_material,nro_temporada),
  CONSTRAINT SERIE_TEMPORADA_MATERIAL_FK FOREIGN KEY (id_material) REFERENCES Material (id_material)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS Episodio (
  id_material int NOT NULL,
  nro_temporada smallint NOT NULL,
  nro_episodio smallint NOT NULL,
  titulo varchar(100) NOT NULL,
  duracion int NOT NULL,
  sinopsis varchar(1000) NOT NULL,
  PRIMARY KEY (id_material,nro_temporada,nro_episodio),
  CONSTRAINT EPISODIO_MATERIAL_FK FOREIGN KEY (id_material, nro_temporada) REFERENCES SerieTemporada (id_material, nro_temporada)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS MiniSerieParte (
  id_material int NOT NULL,
  nro_parte smallint NOT NULL,
  titulo varchar(100) NOT NULL,
  duracion int NOT NULL,
  sinopsis varchar(1000) NOT NULL,
  PRIMARY KEY (id_material, nro_parte),
  CONSTRAINT MINISERIEPARTE_MATERIAL_FK FOREIGN KEY (id_material) REFERENCES Material (id_material)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS Pelicula (
  id_material int PRIMARY KEY NOT NULL,
  duracion int NOT NULL,
  CONSTRAINT PELICULA_MATERIAL_FK FOREIGN KEY (id_material) REFERENCES Material (id_material)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS Facturacion (
  id_cuenta int NOT NULL,
  fecha date NOT NULL,
  id_plan int NOT NULL,
  periodo varchar(100) NOT NULL,
  total double NOT NULL,
  ultimos_digitos varchar(10) NOT NULL,
  nombre_tarjeta varchar(100) NOT NULL,
  PRIMARY KEY (id_cuenta,fecha),
  CONSTRAINT FACTURACION_CUENTA_FK FOREIGN KEY (id_cuenta) REFERENCES Cuenta (id_cuenta),
  CONSTRAINT FACTURACION_PLAN_FK FOREIGN KEY (id_plan) REFERENCES PlanStreaming (id_plan)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS Perfil (
  id_perfil int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  id_cuenta int NOT NULL,
  idioma varchar(100) NOT NULL,
  prefiere_doblaje tinyint(1) NOT NULL,
  nombre varchar(100) NOT NULL,
  id_clasificacion int NOT NULL,
  UNIQUE KEY PERFIL_CUENTA_NOMBRE_UNIQUE (id_cuenta, nombre),
  CONSTRAINT PERFIL_CUENTA_FK FOREIGN KEY (id_cuenta) REFERENCES Cuenta (id_cuenta),
  CONSTRAINT PERFIL_CLASIFICACION_FK FOREIGN KEY (id_clasificacion) REFERENCES Clasificacion (id_clasificacion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS EpisodioVisto (
  id_perfil int NOT NULL,
  id_material int NOT NULL,
  nro_episodio smallint NOT NULL,
  nro_temporada smallint NOT NULL,
  PRIMARY KEY (id_perfil, id_material, nro_episodio, nro_temporada),
  CONSTRAINT EPISODIO_VISTO_PERFIL_FK FOREIGN KEY (id_perfil) REFERENCES Perfil (id_perfil),
  CONSTRAINT EPISODIO_VISTO_EPISODIO_FK FOREIGN KEY (id_material, nro_temporada, nro_episodio) REFERENCES Episodio (id_material, nro_temporada, nro_episodio)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS ParteVista (
  id_perfil int NOT NULL,
  id_material int NOT NULL,
  nro_parte smallint NOT NULL,
  PRIMARY KEY (id_perfil, id_material, nro_parte),
  CONSTRAINT PARTE_VISTA_PERFIL_FK FOREIGN KEY (id_perfil) REFERENCES Perfil (id_perfil),
  CONSTRAINT PARTE_VISTA_PARTE_FK FOREIGN KEY (id_material, nro_parte) REFERENCES MiniSerieParte (id_material, nro_parte)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS PeliculaVista (
  id_material int NOT NULL,
  id_perfil int NOT NULL,
  minutos_vistos int NOT NULL,
  PRIMARY KEY (id_perfil, id_material),
  CONSTRAINT PELICULA_VISTA_PERFIL_FK FOREIGN KEY (id_perfil) REFERENCES Perfil (id_perfil),
  CONSTRAINT PELICULA_VISTA_PARTE_FK FOREIGN KEY (id_material) REFERENCES Pelicula (id_material)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS MaterialAsociado (
  id_material int NOT NULL,
  id_perfil int NOT NULL,
  PRIMARY KEY (id_material, id_perfil),
  CONSTRAINT MATERIAL_ASOCIADO_MATERIAL_FK FOREIGN KEY (id_material) REFERENCES Material (id_material),
  CONSTRAINT MATERIAL_ASOCIADO_PERFIL_FK FOREIGN KEY (id_perfil) REFERENCES Perfil (id_perfil)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS GeneroPreferido (
  id_perfil int NOT NULL,
  id_genero int NOT NULL,
  orden_preferencia smallint NOT NULL,
  PRIMARY KEY (id_perfil,id_genero),
  CONSTRAINT GENERO_PREFERIDO_GENERO_FK FOREIGN KEY (id_genero) REFERENCES Genero (id_genero),
  CONSTRAINT GENERO_PREFERIDO_PERFIL_FK FOREIGN KEY (id_perfil) REFERENCES Perfil (id_perfil)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS InfoDePago (
  id_info_de_pago int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  id_cuenta int NOT NULL,
  nombre_apellido varchar(100) NOT NULL,
  nro_tarjeta varchar(100) NOT NULL,
  fecha_vencimiento date NOT NULL,
  cod_seguridad varchar(10) NOT NULL,
  CONSTRAINT INFO_DE_PAGO_CUENTA_FK FOREIGN KEY (id_cuenta) REFERENCES Cuenta (id_cuenta)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS MaterialCreador (
  id_material int NOT NULL,
  id_creador int NOT NULL,
  PRIMARY KEY (id_material,id_creador),
  CONSTRAINT MATERIAL_CREADOR_CREADOR_FK FOREIGN KEY (id_creador) REFERENCES Creador (id_creador),
  CONSTRAINT MATERIAL_CREADOR_MATERIAL_FK FOREIGN KEY (id_material) REFERENCES Material (id_material)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS Persona (
  id_persona int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nombre varchar(100) NOT NULL,
  apellido varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS MaterialDirector (
  id_material int NOT NULL,
  id_persona int NOT NULL,
  PRIMARY KEY (id_material,id_persona),
  CONSTRAINT MATERIAL_DIRECTOR_MATERIAL_FK FOREIGN KEY (id_material) REFERENCES Material (id_material),
  CONSTRAINT MATERIAL_DIRECTOR_PERSONA_FK FOREIGN KEY (id_persona) REFERENCES Persona (id_persona)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS MaterialGenero (
  id_material int NOT NULL,
  id_genero int NOT NULL,
  PRIMARY KEY (id_material,id_genero),
  CONSTRAINT MATERIAL_GENERO_GENERO_FK FOREIGN KEY (id_genero) REFERENCES Genero (id_genero),
  CONSTRAINT MATERIAL_GENERO_MATERIAL_FK FOREIGN KEY (id_material) REFERENCES Material (id_material)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS MaterialGuionista (
  id_material int NOT NULL,
  id_persona int NOT NULL,
  PRIMARY KEY (id_material,id_persona),
  CONSTRAINT MATERIAL_GUIONISTA_MATERIAL_FK FOREIGN KEY (id_material) REFERENCES Material (id_material),
  CONSTRAINT MATERIAL_GUIONISTA_PERSONA_FK FOREIGN KEY (id_persona) REFERENCES Persona (id_persona)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS MaterialInterprete (
  id_material int NOT NULL,
  id_persona int NOT NULL,
  es_protagonista tinyint(1) NOT NULL,
  PRIMARY KEY (id_material,id_persona),
  CONSTRAINT MATERIAL_INTERPRETE_MATERIAL_FK FOREIGN KEY (id_material) REFERENCES Material (id_material),
  CONSTRAINT MATERIAL_INTERPRETE_PERSONA_FK FOREIGN KEY (id_persona) REFERENCES Persona (id_persona)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS MaterialPalabraDescriptora (
  id_material int NOT NULL,
  id_palabra_descriptora int NOT NULL,
  PRIMARY KEY (id_material,id_palabra_descriptora),
  CONSTRAINT MATERIAL_PALABRA_DESCRIPTORA_MATERIAL_FK FOREIGN KEY (id_material) REFERENCES Material (id_material),
  CONSTRAINT MATERIAL_PALABRA_DESCRIPTORA_PALABRA_DESCRIPTORA_FK FOREIGN KEY (id_palabra_descriptora) REFERENCES PalabraDescriptora (id_palabra_descriptora)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS Similitud (
  id_material int NOT NULL,
  id_material_dos int NOT NULL,
  porcentaje double NOT NULL,
  PRIMARY KEY (id_material,id_material_dos),
  CONSTRAINT SIMILITUD_MATERIAL_DOS_FK FOREIGN KEY (id_material_dos) REFERENCES Material (id_material),
  CONSTRAINT SIMILITUD_MATERIAL_FK FOREIGN KEY (id_material) REFERENCES Material (id_material)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS Calificacion (
  id_perfil int NOT NULL,
  id_material int NOT NULL,
  calificacion_positiva BOOL NOT NULL,
  PRIMARY KEY (id_perfil,id_material),
  CONSTRAINT CALIFICACION_MATERIAL_FK FOREIGN KEY (id_material) REFERENCES Material (id_material),
  CONSTRAINT CALIFICACION_PERFIL_FK FOREIGN KEY (id_perfil) REFERENCES Perfil (id_perfil)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS MaterialAfinidad (
  id_material int NOT NULL,
  id_perfil int NOT NULL,
  porcentaje double NOT NULL,
  PRIMARY KEY (id_material,id_perfil),
  CONSTRAINT MATERIAL_AFINIDAD_MATERIAL_FK FOREIGN KEY (id_material) REFERENCES Material (id_material),
  CONSTRAINT MATERIAL_AFINIDAD_PERFIL_FK FOREIGN KEY (id_perfil) REFERENCES Perfil (id_perfil)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

