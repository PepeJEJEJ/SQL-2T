-- --------------------------------------------------------
-- Host:                         bbdd.dlsi.ua.es
-- Versión del servidor:         5.1.66-0+squeeze1 - (Debian)
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             7.0.0.4320
-- --------------------------------------------------------
-- Jose A.
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
Drop database if exists liga;
CREATE DATABASE `liga` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `liga`;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo` (
  `id_equipo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `web` varchar(250) DEFAULT 'sin web oficial',
  `puntos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'Regal Barcelona','Barcelona','http://www.fcbarcelona.com/web/index_idiomes.html',10),(2,'Real Madrid','Madrid','http://www.realmadrid.com/cs/Satellite/es/1193040472450/SubhomeEquipo/Baloncesto.htm',9),(3,'P.E. Valencia','Valencia','http://www.valenciabasket.com/',11),(4,'Caja Laboral','Vitoria','http://www.baskonia.com/prehomes/prehomes.asp?id_prehome=69',22),(5,'Gran Canaria','Las Palmas','http://www.acb.com/club.php?id=CLA',14),(6,'CAI Zaragoza','Zaragoza','http://basketzaragoza.net/',23);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jugador` (
  `id_jugador` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `posicion` varchar(45) DEFAULT NULL,
  `id_capitan` int(11) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL,
  `salario` int(11) DEFAULT NULL,
  `equipo` int(11) DEFAULT NULL,
  `altura` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id_jugador`),
  KEY `fequipo` (`equipo`),
  CONSTRAINT `fequipo` FOREIGN KEY (`equipo`) REFERENCES `equipo` (`id_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (1,'Juan Carlos','Navarro','escolta',1,'2010-01-10 00:00:00',130000,1,'1.96'),(2,'Felipe','Reyes','Pivot',2,'2009-02-20 00:00:00',132000,2,'2.04'),(3,'Victor','Claver','Alero',3,'2009-03-08 00:00:00',99000,3,'2.08'),(4,'Rafa ','Martinez','ala-pivot',4,'2010-11-11 00:00:00',51000,3,'1.91'),(5,'Fernando','San Emeterio','Alero',6,'2008-09-22 00:00:00',60000,4,'1.99'),(6,'Mirza','Teletovic','Pivot',6,'2010-05-13 00:00:00',77000,4,'2.06'),(7,'Sergio ','Llull','Escolta',2,'2011-10-29 00:00:00',100000,2,'1.90'),(8,'Victor ','Sada','Base',1,'2012-01-01 00:00:00',80000,1,'1.92'),(9,'Carlos','Suarez','Alero',2,'2011-02-19 00:00:00',66000,2,'2.03'),(10,'Xavi ','Rey','Pivot',14,'2008-10-12 00:00:00',104500,5,'2.09'),(11,'Carlos ','Cabezas','Base',13,'2012-01-21 00:00:00',105000,6,'1.86'),(12,'Pablo ','Aguilar','Alero',13,'2011-06-14 00:00:00',51700,6,'2.03'),(13,'Rafa','Hettsheimeir','Pivot',13,'2008-04-15 00:00:00',58300,6,'2.08'),(14,'Sitapha','Savané','Pivot',14,'2011-07-27 00:00:00',66000,5,'2.01'),(15,'anonimo','anonimo','Ala-pivot',2,'2012-01-01 00:00:00',4000,3,'2.00'),(22,'j1',NULL,NULL,NULL,NULL,NULL,2,'2.00'),(23,'j2',NULL,NULL,NULL,NULL,NULL,2,NULL);
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partido` (
  `id_partido` int(11) NOT NULL AUTO_INCREMENT,
  `local` int(11) NOT NULL,
  `visitante` int(11) NOT NULL,
  `resultado` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `arbitro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_partido`),
  KEY `flocal` (`local`),
  KEY `fvisitante` (`visitante`),
  CONSTRAINT `flocal` FOREIGN KEY (`local`) REFERENCES `equipo` (`id_equipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fvisitante` FOREIGN KEY (`visitante`) REFERENCES `equipo` (`id_equipo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` VALUES (1,1,2,'100-100','2011-10-10','4\r'),(2,2,3,'90-91','2011-11-17','5\r'),(3,3,4,'88-77','2011-11-23','6\r'),(4,1,6,'66-78','2011-11-30','6\r'),(5,2,4,'90-90','2012-01-12','7\r'),(6,4,5,'79-83','2012-01-19','3\r'),(7,3,6,'91-88','2012-02-22','3\r'),(8,5,4,'90-66','2012-04-27','2\r'),(9,6,5,'110-70','2012-05-30','1'),(10,3,5,'88-77','2011-09-01','2');
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;


-- Consultas:
-- PRIMERA RELACIÓN – Consultas básicas:

-- 1 Obtener los datos de los jugadores del equipo 3 ordenados por su apellido.
select * from jugador where equipo = 3 order by apellido;

-- 2 Jugadores que sean escolta o alero.
select * from jugador where posicion in ('escolta','alero');

-- 3 Jugadores con salarios entre 60.000 y 100.000
select * from jugador where salario between 60000 and 100000;

-- 4 Obtener los datos de los jugadores que sean pívot ordenados por su identificador.
select * from jugador where posicion = 'pivot' order by id_jugador;

-- 5 Seleccionar los datos de los jugadores que midan más de dos metros y ganen al menos 50.000 euros.
select * from jugador where altura > 2.00 and salario >= 50000;

-- 6 Seleccionar el nombre de los jugadores que jueguen como pívot y ganen más de 100.000 euros.
select nombre from jugador where posicion = 'pivot' and salario > 100000;

-- 7 Seleccionar el nombre de los jugadores de los equipos 1 y 2 que jueguen como base.
select nombre from jugador where equipo in (1,2) and posicion = 'base';

-- 8 Seleccionar los datos de jugadores de los equipos 1 y 2 que ganen más de 80.000 euros al mes.
select * from jugador where equipo in (1,2) and salario > 80000;

-- 9 Listar las posiciones diferentes que pueden ocupar los jugadores en la liga.
select distinct posicion from jugador;

-- 10 Mostrar todos los datos de los 5 jugadores más altos.
select * from jugador order by altura desc limit 5;

-- 11 Calcular en una columna llamada SALARIO NETO ANUAL el sueldo neto de cada jugador sabiendo que el IRPF del 18% deja un 82% del salario bruto.
select nombre, salario, salario*12*0.82 as salario_neto_anual from jugador;

-- 12 Seleccionar los datos de los jugadores cuyo salario neto anual sea al menos 70.000 euros.
select * from jugador where salario*12*0.82 >= 70000;

-- 13 Jugadores sin posición asignada (NULL)
select * from jugador where posicion is null;

-- TERCERA RELACIÓN – Operadores y funciones

-- 1. Mostrar los datos de los partidos jugados en el mes de febrero.
select * from partido where extract(month from fecha) = 2;

-- 2. Mostrar el nombre y apellido de cada jugador en una sola columna llamada “Nombre Completo”, en MAYÚSCULAS.
select upper(concat(nombre, ' ', apellido)) as "Nombre Completo" from jugador;

-- 3. Mostrar los enlaces de las webs de los equipos que NO contengan “www”.
select web from equipo where web not like '%www%';

-- 4. Mostrar los datos de los equipos cuya web incluya la palabra “basket”.
select * from equipo where web like '%basket%';

-- 5. Mostrar los enlaces de las webs de los equipos pero sin “http://”.
select replace(web, 'http://', '') as web_sin_http from equipo;

-- 6. Consulta que devuelva esta frase:
-- “El jugador con nombre y apellidos: Juan Carlos Navarro juega en la posición: escolta”.
select 'El jugador con nombre y apellidos: Juan Carlos Navarro juega en la posición: escolta' as mensaje;

-- 7. Datos de los equipos cuyo nombre tenga 12 caracteres o menos.
select * from equipo where length(nombre) <= 12;

-- 8. Datos de los jugadores que fueron dados de alta en 2008 o 2011.
select * from jugador where extract(year from fecha_alta) in (2008, 2011);

-- 9. Mostrar un listado de las páginas web de los equipos pero cambiando “http://” por “https://”.
select replace(web, 'http://', 'https://') as web_segura from equipo;

-- 10. Mostrar el nombre del jugador y su nombre invertido.
select nombre, reverse(nombre) as nombre_invertido from jugador;

-- 11. Mostrar el nombre de los equipos rellenado por la izquierda hasta 20 caracteres con ‘*’.
select lpad(nombre, 20, '*') as nombre_relleno from equipo;

-- 12. Mostrar el apellido de los jugadores y sus 3 primeras letras.
select apellido, substring(apellido, 1, 3) as iniciales from jugador;

-- 13. Mostrar la posición en la que aparece la letra ‘a’ en el nombre del equipo.
select nombre, position('a' in nombre) as posicion_a from equipo;

-- 14. Mostrar el nombre del jugador y un campo que indique:
-- “Veterano” si fue dado de alta antes de 2010
-- “Moderno” si fue dado de alta a partir de 2010 (usar case)
select nombre, case when extract(year from fecha_alta) < 2010 then 'Veterano' else 'Moderno' end as categoria from jugador;

-- 15. Mostrar los jugadores cuyo apellido termina en “ez”.
select * from jugador where apellido like '%ez';

-- 16. Mostrar los equipos ordenados por la longitud de su nombre.
select nombre, length(nombre) as longitud from equipo order by longitud;

-- 17. Mostrar el nombre del jugador completamente en minúsculas.
select lower(nombre) as nombre_minusculas from jugador;

-- 18. Mostrar el nombre del jugador y las 2 primeras letras de su apellido.
select nombre, substring(apellido, 1, 2) as iniciales_apellido from jugador;

-- 19. Mostrar el nombre del jugador y el año en el que fue dado de alta.
select nombre, extract(year from fecha_alta) as anio_alta from jugador;

-- 20. Mostrar nombre y apellido en una sola columna separados por un guion.
select concat(nombre, '-', apellido) as nombre_completo from jugador;