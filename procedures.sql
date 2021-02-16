
USE netflix;

DELIMITER $$

CREATE PROCEDURE BUSQUEDA_MATERIAL (IN P_BUSQUEDA VARCHAR(100))
SELECT * FROM Material WHERE MATCH(titulo,sinopsis)
AGAINST(P_BUSQUEDA IN NATURAL LANGUAGE MODE)

UNION

SELECT Material.* 
FROM (
        SELECT id_material
        FROM (SELECT id_persona FROM Persona WHERE MATCH(nombre,apellido)
        AGAINST(P_BUSQUEDA IN NATURAL LANGUAGE MODE) ) persona
        INNER JOIN MaterialDirector matDir
        ON persona.id_persona = matDir.id_persona
     ) materialDirector
INNER JOIN Material
ON materialDirector.id_material = Material.id_material$$


CREATE PROCEDURE CONTINUAR_VIENDO_MINISERIE (IN P_PERFIL INT)
SELECT mat.* FROM (
SELECT EPT.id_material
	FROM (SELECT id_material, COUNT(*) as cantidadPartesVistos FROM ParteVista WHERE id_perfil = P_PERFIL GROUP by id_material ) vistos
INNER JOIN (SELECT id_material, COUNT(*) as episodiosPorPartes FROM MiniSerieParte GROUP by id_material) EPT
ON vistos.id_material = EPT.id_material WHERE EPT.episodiosPorPartes > vistos.cantidadPartesVistos
) continuar_viendo
INNER JOIN Material mat
ON mat.id_material = continuar_viendo.id_material$$


CREATE PROCEDURE CONTINUAR_VIENDO_PELICULA (IN P_PERFIL INT, IN P_PORCENTAJE DOUBLE)
SELECT mat.* 
    FROM (
            SELECT pelicula.id_material 
                FROM (
                      SELECT * FROM PeliculaVista WHERE id_perfil = P_PERFIL     
                     ) materialParaVer
            INNER JOIN Pelicula pelicula
            ON pelicula.id_material = materialParaVer.id_material  WHERE  (materialParaVer.minutos_vistos / 		             pelicula.duracion) < P_PORCENTAJE
        ) continuar_viendo
INNER JOIN Material mat
ON mat.id_material = continuar_viendo.id_material$$


CREATE PROCEDURE CONTINUAR_VIENDO_SERIE (IN P_PERFIL INT)
SELECT mat.* FROM (
SELECT EPT.id_material
	FROM (SELECT id_material, COUNT(*) as cantidadEpisodiosVistos FROM EpisodioVisto WHERE id_perfil = P_PERFIL GROUP by id_material ) vistos
INNER JOIN (SELECT id_material, COUNT(*) as episodiosPorTemporada FROM Episodio GROUP by id_material) EPT
ON vistos.id_material = EPT.id_material WHERE EPT.episodiosPorTemporada > vistos.cantidadEpisodiosVistos
) continuar_viendo
INNER JOIN Material mat
ON mat.id_material = continuar_viendo.id_material$$


CREATE PROCEDURE GET_MI_LISTA (IN P_PERFIL INT)
SELECT * 
	FROM Material material
INNER JOIN (SELECT * FROM MaterialAsociado WHERE MaterialAsociado.id_perfil = P_PERFIL) materialAsociado
ON material.id_material = materialAsociado.id_material$$


CREATE PROCEDURE MATERIALES_POPULARES (IN P_LIMIT INT)
SELECT m.*
FROM (
	SELECT visualizaciones.id_material as mat
	FROM (
		SELECT id_material, id_perfil 
		FROM PeliculaVista
		
		UNION
		
		SELECT id_material, id_perfil 
		FROM EpisodioVisto
		
		UNION
		
		SELECT id_material, id_perfil 
		FROM ParteVista
	) as visualizaciones
	GROUP BY visualizaciones.id_material
	ORDER BY count(*) DESC
    LIMIT P_LIMIT
) as pupular
LEFT JOIN Material m
ON mat = m.id_material$$


CREATE PROCEDURE MATERIALES_RECOMENDADOS_POR_PREFERENCIA_DE_GENERO
  (IN P_PERFIL INT, IN P_ORDEN_DE_PREFERENCIA INT, IN P_LIMIT INT)
SELECT m.*
FROM MaterialAfinidad ma 
LEFT JOIN Material m 
ON ma.id_material = m.id_material 
WHERE ma.id_perfil = P_PERFIL AND m.id_genero = (
	SELECT id_genero 
	FROM GeneroPreferido gp 
	WHERE id_perfil = P_PERFIL AND orden_preferencia = P_ORDEN_DE_PREFERENCIA
)
ORDER BY ma.porcentaje DESC
LIMIT P_LIMIT$$

DELIMITER ;

