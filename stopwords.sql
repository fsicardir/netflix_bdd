
CREATE DATABASE stopwords;
USE stopwords;

CREATE TABLE index_stopwords (
  value varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO index_stopwords (value) VALUES
(''),
(''),
('a'),
('acá'),
('ahí'),
('ajena'),
('al'),
('algo'),
('algún'),
('allá'),
('ambos'),
('ante'),
('antes'),
('aquel'),
('aquella'),
('aquí'),
('arriba'),
('así'),
('atrás'),
('aun'),
('aunque'),
('bajo'),
('bastante'),
('bien'),
('cabe'),
('cada'),
('casi'),
('cierto'),
('como'),
('con'),
('conmigo'),
('conseguimos'),
('conseguir'),
('consigo'),
('consigue'),
('consiguen'),
('consigues'),
('contigo'),
('contra'),
('cual'),
('cuales'),
('cualquier'),
('cuan'),
('cuando'),
('cuanto'),
('de'),
('dejar'),
('del'),
('demás'),
('demasiada'),
('dentro'),
('desde'),
('donde'),
('dos'),
('el'),
('él'),
('ella/o/s'),
('empleáis'),
('emplean'),
('emplear'),
('empleas'),
('empleo'),
('en'),
('encima'),
('entonces'),
('entre'),
('era'),
('eramos'),
('eran'),
('eres'),
('es'),
('porque'),
('a'),
('acá'),
('ahí'),
('ajena'),
('al'),
('algo'),
('algún'),
('allá'),
('ambos'),
('ante'),
('antes'),
('aquel'),
('aquella'),
('aquí'),
('arriba'),
('así'),
('atrás'),
('aun'),
('aunque'),
('bajo'),
('bastante'),
('bien'),
('cabe'),
('cada'),
('casi'),
('cierto'),
('como'),
('con'),
('conmigo'),
('conseguimos'),
('conseguir'),
('consigo'),
('consigue'),
('consiguen'),
('consigues'),
('contigo'),
('contra'),
('cual'),
('cuales'),
('cualquier'),
('cuan'),
('cuando'),
('cuanto'),
('de'),
('dejar'),
('del'),
('demás'),
('demasiada'),
('dentro'),
('desde'),
('donde'),
('dos'),
('el'),
('él'),
('ella/o/s'),
('empleáis'),
('emplean'),
('emplear'),
('empleas'),
('empleo'),
('en'),
('encima'),
('entonces'),
('entre'),
('era'),
('eramos'),
('eran'),
('eres'),
('es'),
('porque'),
('a'),
('acá'),
('ahí'),
('ajena'),
('al'),
('algo'),
('algún'),
('allá'),
('ambos'),
('ante'),
('antes'),
('aquel'),
('aquella'),
('aquí'),
('arriba'),
('así'),
('atrás'),
('aun'),
('aunque'),
('bajo'),
('bastante'),
('bien'),
('cabe'),
('cada'),
('casi'),
('cierto'),
('como'),
('con'),
('conmigo'),
('conseguimos'),
('conseguir'),
('consigo'),
('consigue'),
('consiguen'),
('consigues'),
('contigo'),
('contra'),
('cual'),
('cuales'),
('cualquier'),
('cuan'),
('cuando'),
('cuanto'),
('de'),
('dejar'),
('del'),
('demás'),
('demasiada'),
('dentro'),
('desde'),
('donde'),
('dos'),
('el'),
('él'),
('ella/o/s'),
('empleáis'),
('emplean'),
('emplear'),
('empleas'),
('empleo'),
('en'),
('encima'),
('entonces'),
('entre'),
('era'),
('eramos'),
('eran'),
('eres'),
('es'),
('esa'),
('esta/s'),
('estaba'),
('estado'),
('estáis'),
('estamos'),
('están'),
('estar'),
('este'),
('estoy'),
('etc'),
('fin'),
('fue'),
('fueron'),
('fui'),
('fuimos'),
('gueno'),
('ha'),
('hace'),
('hacéis'),
('hacemos'),
('hacen'),
('hacer'),
('hacia'),
('hago'),
('hasta'),
('incluso'),
('intenta'),
('intentáis'),
('intentamos'),
('intentan'),
('intentar'),
('intento'),
('ir'),
('jamás'),
('junto'),
('la'),
('largo'),
('más'),
('me'),
('menos'),
('mi'),
('mía'),
('mientras'),
('mío'),
('mism'),
('modo'),
('mucha'),
('muchísima'),
('mucho/s'),
('muy'),
('nada'),
('ni'),
('ningún'),
('no'),
('nos'),
('nosotras'),
('nuestra'),
('nunca'),
('os'),
('otra'),
('para'),
('parecer'),
('pero'),
('poca'),
('podéis'),
('podemos'),
('poder'),
('podría'),
('podríais'),
('podríamos'),
('podrían'),
('por'),
('por qué'),
('porque'),
('primero'),
('puede/n'),
('puedo'),
('pues'),
('que'),
('qué'),
('querer'),
('quién'),
('quienesquiera'),
('quienquiera'),
('quizá'),
('sabe'),
('sabéis'),
('sabemos'),
('saber'),
('se'),
('según'),
('ser'),
('si'),
('sí'),
('siempre'),
('siendo'),
('sin'),
('sino'),
('so'),
('sobre'),
('sois'),
('solamente'),
('solo'),
('sólo'),
('somos'),
('soy'),
('sr'),
('sra'),
('sres'),
('sta'),
('su'),
('suya'),
('tal/es'),
('también'),
('tampoco'),
('tan'),
('tanta'),
('te'),
('tenéis'),
('tenemos'),
('tener'),
('tengo'),
('ti'),
('tiempo'),
('tiene'),
('tienen'),
('toda'),
('tomar'),
('trabaja'),
('trabajáis'),
('trabajamos'),
('trabajan'),
('trabajar'),
('trabajas'),
('tras'),
('tú'),
('tu'),
('tus'),
('tuya'),
('último'),
('ultimo'),
('un'),
('usa'),
('usáis'),
('usamos'),
('usan'),
('usar'),
('uso'),
('usted'),
('va/n'),
('vais'),
('valor'),
('vamos'),
('varias'),
('vaya'),
('verdadera'),
('vosotras'),
('voy'),
('vuestra'),
('y'),
('ya'),
('yo');

set GLOBAL innodb_ft_user_stopword_table='stopwords/index_stopwords';

