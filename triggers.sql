
USE netflix;


CREATE TRIGGER agregar_pelicula_vista_a_lista_asociada
  AFTER INSERT ON PeliculaVista FOR EACH ROW
    INSERT IGNORE INTO MaterialAsociado (id_material, id_perfil)
    VALUES (NEW.id_material, NEW.id_perfil);

CREATE TRIGGER agregar_serie_vista_a_lista_asociada
  AFTER INSERT ON EpisodioVisto FOR EACH ROW
    INSERT IGNORE INTO MaterialAsociado (id_material, id_perfil)
    VALUES (NEW.id_material, NEW.id_perfil);

CREATE TRIGGER agregar_miniserie_vista_a_lista_asociada
  AFTER INSERT ON ParteVista FOR EACH ROW
    INSERT IGNORE INTO MaterialAsociado (id_material, id_perfil)
    VALUES (NEW.id_material, NEW.id_perfil);

DELIMITER $$
CREATE TRIGGER agregar_material_calificado_positivo_a_lista_asociada
  AFTER INSERT ON Calificacion FOR EACH ROW
  BEGIN
    IF NEW.calificacion_positiva IS TRUE THEN
      INSERT IGNORE INTO MaterialAsociado (id_material, id_perfil)
      VALUES (NEW.id_material, NEW.id_perfil);
    END IF;
  END$$
DELIMITER ;

