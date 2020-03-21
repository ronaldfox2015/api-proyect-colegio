/*
SQLyog Ultimate v9.02 
MySQL - 5.5.62 : Database - bd_iepmae
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bd_iepmae` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bd_iepmae`;

/*Table structure for table `tb_Matricula` */

DROP TABLE IF EXISTS `tb_Matricula`;

CREATE TABLE `tb_Matricula` (
  `idSeccion` int(11) NOT NULL,
  `fecMatricula` date DEFAULT NULL,
  `idEstudiante` int(11) NOT NULL,
  PRIMARY KEY (`idSeccion`,`idEstudiante`),
  KEY `R_19` (`idEstudiante`),
  CONSTRAINT `tb_Matricula_ibfk_1` FOREIGN KEY (`idSeccion`) REFERENCES `tb_seccion` (`idSeccion`),
  CONSTRAINT `tb_Matricula_ibfk_2` FOREIGN KEY (`idEstudiante`) REFERENCES `tb_estudiante` (`idEstudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_Matricula` */

/*Table structure for table `tb_accesoUsuario` */

DROP TABLE IF EXISTS `tb_accesoUsuario`;

CREATE TABLE `tb_accesoUsuario` (
  `idAccesoUsuario` int(11) NOT NULL,
  `fechaAcceso` date DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAccesoUsuario`),
  KEY `R_4` (`idUsuario`),
  CONSTRAINT `tb_accesoUsuario_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_accesoUsuario` */

/*Table structure for table `tb_administrativo` */

DROP TABLE IF EXISTS `tb_administrativo`;

CREATE TABLE `tb_administrativo` (
  `dni` varchar(8) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apePat` varchar(30) DEFAULT NULL,
  `apeMat` varchar(30) DEFAULT NULL,
  `fecNac` date DEFAULT NULL,
  `fecIngreso` date DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telfMovil` varchar(50) DEFAULT NULL,
  `telfFijo` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `idGenero` int(11) DEFAULT NULL,
  `idDistrito` int(11) DEFAULT NULL,
  `idAdministrativo` int(11) NOT NULL,
  `idCargo` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAdministrativo`),
  KEY `R_15` (`idGenero`),
  KEY `R_16` (`idDistrito`),
  KEY `R_58` (`idCargo`),
  KEY `R_65` (`idUsuario`),
  CONSTRAINT `tb_administrativo_ibfk_1` FOREIGN KEY (`idGenero`) REFERENCES `tb_genero` (`idGenero`),
  CONSTRAINT `tb_administrativo_ibfk_2` FOREIGN KEY (`idDistrito`) REFERENCES `tb_distrito` (`idDistrito`),
  CONSTRAINT `tb_administrativo_ibfk_3` FOREIGN KEY (`idCargo`) REFERENCES `tb_cargo` (`idCargo`),
  CONSTRAINT `tb_administrativo_ibfk_4` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_administrativo` */

insert  into `tb_administrativo`(`dni`,`nombre`,`apePat`,`apeMat`,`fecNac`,`fecIngreso`,`direccion`,`telfMovil`,`telfFijo`,`email`,`estado`,`idGenero`,`idDistrito`,`idAdministrativo`,`idCargo`,`idUsuario`) values ('09450506','MarÃ­a Teresa','Quispe','Amar','1970-05-17','2009-02-15','Jr. Tacna 311','923130877','4017166','techiquam@gmail.com',1,2,1,1,2,2),('09489511','Sandra','Quispe','Amar','1973-06-25','2008-01-19','Jr. Tacna 311','943130277','4017166','sandraq@gmail.com',1,2,1,2,1,1);

/*Table structure for table `tb_apoderado` */

DROP TABLE IF EXISTS `tb_apoderado`;

CREATE TABLE `tb_apoderado` (
  `observacion` varchar(100) DEFAULT NULL,
  `idApoderado` int(11) NOT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apePat` varchar(30) DEFAULT NULL,
  `apeMat` varchar(30) DEFAULT NULL,
  `fecNac` date DEFAULT NULL,
  `fecIngreso` date DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telfMovil` varchar(40) DEFAULT NULL,
  `telfFijo` varchar(40) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idDistrito` int(11) DEFAULT NULL,
  `idGenero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idApoderado`),
  KEY `R_57` (`idDistrito`),
  KEY `R_59` (`idGenero`),
  CONSTRAINT `tb_apoderado_ibfk_1` FOREIGN KEY (`idDistrito`) REFERENCES `tb_distrito` (`idDistrito`),
  CONSTRAINT `tb_apoderado_ibfk_2` FOREIGN KEY (`idGenero`) REFERENCES `tb_genero` (`idGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_apoderado` */

insert  into `tb_apoderado`(`observacion`,`idApoderado`,`dni`,`nombre`,`apePat`,`apeMat`,`fecNac`,`fecIngreso`,`direccion`,`telfMovil`,`telfFijo`,`email`,`estado`,`idDistrito`,`idGenero`) values ('religiÃ³n mormÃ³n',1,'11059943','Margarita','Huaranca','Rojas','1970-09-25','2014-02-19','Jr. Amazonas 422','980230119','4508221','margaritahuro@gmail.com',1,1,2),('exagera las situaciones al hablar',2,'14059933','Roxana','Rivera','Huaman','1978-09-25','2010-03-11','Jr. Amazonas 122','980230119','4508221','roxanarihu@gmail.com',1,1,2),('se compromete a donar cada fin de aÃ±o una caja de panetones',3,'13099941','Gladys','Herrera','Zapata','1977-11-25','2011-02-23','Jr. Tacna 333','980230119','4508221','gladysheza@gmail.com',1,1,2),('',4,'16059443','Katherine','Gonzales','Vargas','1983-04-11','2012-03-10','Jr. Amazonas 611','980230119','4508221','katherinegova@gmail.com',1,1,2),('',5,'16041143','Mateo','Cardenas','Rivera','1972-06-25','2014-02-16','Jr. Loreto 402','980230119','4508224','mateocari@gmail.com',1,1,1),('',6,'11775743','Rosa','Pajuelo','ZuÃ±iga','1979-02-21','2015-03-13','Jr. Amazonas 122','980230119','4508221','rosapazu@gmail.com',1,2,2),('',7,'10885711','Elvira','RomÃ¡n','Chipana','1979-01-21','2016-02-27','Jr. Huanuco 409','980230119','4508221','elviraroch@gmail.com',1,1,2),('',8,'20045701','Flor','Camposano','Rosales','1980-03-12','2016-02-27','Jr. Tacna 109','980230119','4508221','florcaro@gmail.com',1,1,2),('',9,'13045113','Mercedes','Durand','Bautista','1977-08-20','2016-02-27','Jr. Amazonas 417','980230119','4508221','mercedesduba@gmail.com',1,2,2),('',10,'19041143','Angela','Sebastian','Gonzales','1985-02-12','2016-02-27','Jr. Amazonas 199','980230119','4508221','angelasego@gmail.com',1,2,2),('',11,'13455743','Sandra','Alvarez','Quispe','1976-08-08','2016-02-27','Jr. Loreto 177','980230119','4508221','sandraalqu@gmail.com',1,1,2),('',12,'16045747','AngÃ©lica','Abad','Carbajal','1986-12-25','2016-02-27','Jr. Apurimac 422','980230119','4508221','angelicaabca@gmail.com',1,1,2),('',13,'10849743','Camila','Contreras','Zapata','1982-09-01','2016-02-27','Jr. Amazonas 347','980230119','4508221','camilacoza@gmail.com',1,2,2),('',14,'13149743','Adriana','Cabezas','Salgado','1982-11-01','2016-02-27','Jr. Amazonas 197','980230119','4508221','adrianacasa@gmail.com',1,2,2),('',15,'10867741','Daniela','Huaman','Salcedo','1982-03-03','2016-02-27','Jr. Amazonas 677','980230119','4508221','danielahusa@gmail.com',1,2,2),('',16,'10841640','Cecilia','Portilla','Tamariz','1974-01-19','2016-02-27','Jr. Tacna 347','980230119','4508221','ceciliapota@gmail.com',1,1,2),('',17,'13844143','Carla','Franco','Contreras','1985-09-07','2016-02-27','Jr. Amazonas 687','980230119','4508221','carlafrco@gmail.com',1,2,2),('',18,'19249740','Ana MarÃ­a','Pirco','Pacheco','1980-09-04','2016-02-27','Jr. Amazonas 874','980230119','4508221','anapipa@gmail.com',1,2,2),('',19,'14879783','Elena','NuÃ±ez','Vargas','1982-03-11','2016-02-27','Jr. Amazonas 680','980230119','4508221','elenanuva@gmail.com',1,2,2),('',20,'10808797','Susana','Quispe','Barreto','1980-09-01','2016-02-27','Jr. Ica 347','980230119','4508221','susanaquba@gmail.com',1,1,2);

/*Table structure for table `tb_cargo` */

DROP TABLE IF EXISTS `tb_cargo`;

CREATE TABLE `tb_cargo` (
  `idCargo` int(11) NOT NULL,
  `desCargo` varchar(20) DEFAULT NULL,
  `estadoCargo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_cargo` */

insert  into `tb_cargo`(`idCargo`,`desCargo`,`estadoCargo`) values (1,'Director',1),(2,'Sub-Director',1),(3,'Coordinador',1),(4,'Secretaria',1);

/*Table structure for table `tb_curso` */

DROP TABLE IF EXISTS `tb_curso`;

CREATE TABLE `tb_curso` (
  `idCurso` int(11) NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_curso` */

insert  into `tb_curso`(`idCurso`,`descripcion`,`estado`) values (1,'ComunicaciÃ³n',1),(2,'MatemÃ¡tica',1),(3,'Personal Social',1),(4,'Ciencia y TecnologÃ­a',1),(5,'InglÃ©s',1),(6,'ComputaciÃ³n',1),(7,'EducaciÃ³n Religiosa',1),(8,'Arte y Cultura',1),(9,'EducaciÃ³n FÃ­sica',1);

/*Table structure for table `tb_curso_seccion` */

DROP TABLE IF EXISTS `tb_curso_seccion`;

CREATE TABLE `tb_curso_seccion` (
  `idCurso` int(11) NOT NULL,
  `idSeccion` int(11) NOT NULL,
  `idDocente` int(11) DEFAULT NULL,
  `fechaCurso` date DEFAULT NULL,
  PRIMARY KEY (`idCurso`,`idSeccion`),
  KEY `R_22` (`idSeccion`),
  KEY `R_23` (`idDocente`),
  CONSTRAINT `tb_curso_seccion_ibfk_1` FOREIGN KEY (`idCurso`) REFERENCES `tb_curso` (`idCurso`),
  CONSTRAINT `tb_curso_seccion_ibfk_2` FOREIGN KEY (`idSeccion`) REFERENCES `tb_seccion` (`idSeccion`),
  CONSTRAINT `tb_curso_seccion_ibfk_3` FOREIGN KEY (`idDocente`) REFERENCES `tb_docente` (`idDocente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_curso_seccion` */

insert  into `tb_curso_seccion`(`idCurso`,`idSeccion`,`idDocente`,`fechaCurso`) values (1,10,6,'2019-01-15'),(1,11,6,'2019-01-15'),(2,10,5,'2019-01-15'),(2,11,6,'2019-01-15'),(3,10,5,'2019-01-15'),(3,11,6,'2019-01-15'),(4,10,5,'2019-01-15'),(4,11,6,'2019-01-15'),(5,10,5,'2019-01-15'),(5,11,6,'2019-01-15'),(6,10,1,'2019-01-15'),(6,11,1,'2019-01-15'),(7,10,5,'2019-01-15'),(7,11,6,'2019-01-15'),(8,10,5,'2019-01-15'),(8,11,6,'2019-01-15'),(9,10,3,'2019-01-15'),(9,11,3,'2019-01-15');

/*Table structure for table `tb_desarrollo_respuesta` */

DROP TABLE IF EXISTS `tb_desarrollo_respuesta`;

CREATE TABLE `tb_desarrollo_respuesta` (
  `idRespuesta` int(11) DEFAULT NULL,
  `idDesarrolloRespuesta` int(11) NOT NULL,
  PRIMARY KEY (`idDesarrolloRespuesta`),
  KEY `R_31` (`idRespuesta`),
  CONSTRAINT `tb_desarrollo_respuesta_ibfk_1` FOREIGN KEY (`idRespuesta`) REFERENCES `tb_respuesta` (`idRespuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_desarrollo_respuesta` */

/*Table structure for table `tb_distrito` */

DROP TABLE IF EXISTS `tb_distrito`;

CREATE TABLE `tb_distrito` (
  `idDistrito` int(11) NOT NULL,
  `desDistrito` varchar(40) DEFAULT NULL,
  `codigoPostal` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idDistrito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_distrito` */

insert  into `tb_distrito`(`idDistrito`,`desDistrito`,`codigoPostal`) values (1,'Villa MarÃ­a del Triunfo','LIMA35'),(2,'Villa El Salvador','LIMA42'),(3,'San Juan de Miraflores','LIMA29'),(4,'Chorrillos','LIMA09');

/*Table structure for table `tb_docente` */

DROP TABLE IF EXISTS `tb_docente`;

CREATE TABLE `tb_docente` (
  `idEspecialidad` int(11) DEFAULT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `idDocente` int(11) NOT NULL,
  `idDistrito` int(11) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `apePat` varchar(30) DEFAULT NULL,
  `apeMat` varchar(30) DEFAULT NULL,
  `fecNac` date DEFAULT NULL,
  `fecIng` date DEFAULT NULL,
  `telfMovil` varchar(40) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telfFijo` varchar(40) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `idGenero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDocente`),
  KEY `R_14` (`idEspecialidad`),
  KEY `R_61` (`idDistrito`),
  KEY `R_64` (`idUsuario`),
  KEY `R_67` (`idGenero`),
  CONSTRAINT `tb_docente_ibfk_1` FOREIGN KEY (`idEspecialidad`) REFERENCES `tb_especialidad` (`idEspecialidad`),
  CONSTRAINT `tb_docente_ibfk_2` FOREIGN KEY (`idDistrito`) REFERENCES `tb_distrito` (`idDistrito`),
  CONSTRAINT `tb_docente_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`),
  CONSTRAINT `tb_docente_ibfk_4` FOREIGN KEY (`idGenero`) REFERENCES `tb_genero` (`idGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_docente` */

insert  into `tb_docente`(`idEspecialidad`,`observacion`,`estado`,`idDocente`,`idDistrito`,`dni`,`apePat`,`apeMat`,`fecNac`,`fecIng`,`telfMovil`,`direccion`,`telfFijo`,`email`,`idUsuario`,`nombre`,`idGenero`) values (3,'ninguno',1,1,2,'10233775','Rojas','Rojas','1975-07-14','2018-02-20','997130857','Av. RevoluciÃ³n 2312','2870441','grankoki@gmail.com',3,'Jorge',NULL),(3,'Bachiller en educaciÃ³n secundaria',1,2,2,'10101010','Franco','Palacios','1978-01-20','2018-02-15','927130844','Av. El Sol 1811','4937042','lidiafranco@gmail.com',4,'Lidia',NULL),(2,'Prof. de Danza y Educ. FÃ­sica',1,3,2,'20450524','Peralta','Palomino','1978-01-20','2018-02-15','927130844','Av. El Sol 1811','4937042','reynaperalta@gmail.com',5,'Reyna',NULL),(2,'Especialista en Montessori',1,4,1,'26450522','Salazar','Rojas','1985-09-22','2015-02-19','787130861','Jr. Tacna 349','3917141','fabianesaro@gmail.com',6,'Fabiane',NULL),(2,'Especialista en matemÃ¡tica',1,5,1,'21450509','Hinostroza','Amar','1982-11-20','2014-04-15','957130861','Jr. Tacna 705','4691994','nancyhinostroza@gmail.com',7,'Nancy',NULL),(2,'Especialista en ComunicaciÃ³n',1,6,1,'09745059','Cubas','Serrano','1970-06-19','2011-04-11','957130861','Jr. Tacna 705','4691994','luzcubas@gmail.com',30,'Luz',NULL);

/*Table structure for table `tb_especialidad` */

DROP TABLE IF EXISTS `tb_especialidad`;

CREATE TABLE `tb_especialidad` (
  `idEspecialidad` int(11) NOT NULL,
  `desEspecialidad` varchar(20) DEFAULT NULL,
  `estadoEspecialidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEspecialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_especialidad` */

insert  into `tb_especialidad`(`idEspecialidad`,`desEspecialidad`,`estadoEspecialidad`) values (1,'Inicial',1),(2,'Primaria',1),(3,'Secundaria',1),(4,'Auxiliar',1);

/*Table structure for table `tb_estudiante` */

DROP TABLE IF EXISTS `tb_estudiante`;

CREATE TABLE `tb_estudiante` (
  `fotoEstudiante` blob,
  `estadoEstudiante` tinyint(4) DEFAULT NULL,
  `idEstudiante` int(11) NOT NULL,
  `idApoderado` int(11) DEFAULT NULL,
  `dniEstudiante` varchar(8) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `apePat` varchar(30) DEFAULT NULL,
  `apeMat` varchar(30) DEFAULT NULL,
  `idGenero` int(11) DEFAULT NULL,
  `fecIngreso` date DEFAULT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  `fecNac` date DEFAULT NULL,
  PRIMARY KEY (`idEstudiante`),
  KEY `R_52` (`idApoderado`),
  KEY `R_53` (`idUsuario`),
  KEY `R_60` (`idGenero`),
  CONSTRAINT `tb_estudiante_ibfk_1` FOREIGN KEY (`idApoderado`) REFERENCES `tb_apoderado` (`idApoderado`),
  CONSTRAINT `tb_estudiante_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`),
  CONSTRAINT `tb_estudiante_ibfk_3` FOREIGN KEY (`idGenero`) REFERENCES `tb_genero` (`idGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_estudiante` */

insert  into `tb_estudiante`(`fotoEstudiante`,`estadoEstudiante`,`idEstudiante`,`idApoderado`,`dniEstudiante`,`nombre`,`idUsuario`,`apePat`,`apeMat`,`idGenero`,`fecIngreso`,`observacion`,`fecNac`) values (NULL,1,1,1,'20740801','Zoe Isabella',8,'Alejo','Huaranca',2,'2016-03-02','','2009-06-02'),(NULL,1,2,2,'20740802','Mateo Salvador',9,'Aparicio','Rivera',1,'2016-02-25','','2009-03-18'),(NULL,1,3,3,'20740803','Adriano JosÃ©',10,'Berrio','Herrera',1,'2016-02-25','','2009-03-18'),(NULL,1,4,4,'20740804','Domenika',11,'Bravo','Gonzales',2,'2016-02-25','','2009-03-18'),(NULL,1,5,5,'20740805','VÃ­ctor David',12,'Cardenas','Bellido',1,'2016-02-25','','2009-03-18'),(NULL,1,6,6,'20740806','Axel Mathias',13,'Chile','Pajuelo',1,'2016-02-25','','2009-04-18'),(NULL,1,7,7,'20740807','Adriana SofÃ­a',14,'CÃ³rdova','RomÃ¡n',2,'2016-02-25','','2009-05-18'),(NULL,1,8,8,'20740808','Adrian Fabrisio',15,'Curo','Camposano',1,'2016-02-25','','2009-06-18'),(NULL,1,9,9,'20740809','Ariana',16,'Gaona','Durand',2,'2016-02-25','','2009-03-05'),(NULL,1,10,10,'20740810','Alesandro Piero',17,'GarcÃ­a','SebastiÃ¡n',1,'2016-02-25','','2009-03-10'),(NULL,1,11,11,'20740811','Jhair',18,'Gavidia','Alvarez',1,'2016-02-25','','2009-04-11'),(NULL,1,12,12,'20740812','Javier',19,'HuamanÃ±ahui','Abad',1,'2016-02-25','','2009-07-01'),(NULL,1,13,13,'20740813','Camila Valentina',20,'Lago','Contreras',2,'2016-02-25','','2009-06-28'),(NULL,1,14,14,'20740814','Luana',21,'LeÃ³n','Cabezas',2,'2016-02-25','','2009-01-11'),(NULL,1,15,15,'20740815','Ana Paula',22,'Miranda','HuamÃ¡n',2,'2016-02-25','','2009-02-15'),(NULL,1,16,16,'20740816','Andrew',23,'Pianto','Portilla',1,'2016-02-25','','2009-03-01'),(NULL,1,17,17,'20740817','Tatiana',24,'Prado','Franco',2,'2016-02-25','','2009-03-11'),(NULL,1,18,18,'20740818','Roy David Leonardo',25,'Sotomayor','Pirgo',1,'2016-02-25','','2009-03-16'),(NULL,1,19,19,'20740819','Eymi Lee',26,'Villanueva','NuÃ±ez',2,'2016-02-25','','2009-03-22'),(NULL,1,20,20,'20740820','Mayra Ximena',27,'Zapata','Quispe',2,'2016-02-25','','2009-04-19');

/*Table structure for table `tb_evaluacion` */

DROP TABLE IF EXISTS `tb_evaluacion`;

CREATE TABLE `tb_evaluacion` (
  `idEvaluacion` int(11) NOT NULL,
  `idCurso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEvaluacion`),
  KEY `R_25` (`idCurso`),
  CONSTRAINT `tb_evaluacion_ibfk_1` FOREIGN KEY (`idCurso`) REFERENCES `tb_curso` (`idCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_evaluacion` */

/*Table structure for table `tb_genero` */

DROP TABLE IF EXISTS `tb_genero`;

CREATE TABLE `tb_genero` (
  `idGenero` int(11) NOT NULL,
  `desGenero` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_genero` */

insert  into `tb_genero`(`idGenero`,`desGenero`) values (1,'Masculino'),(2,'Femenino');

/*Table structure for table `tb_grado` */

DROP TABLE IF EXISTS `tb_grado`;

CREATE TABLE `tb_grado` (
  `idGrado` int(11) NOT NULL,
  `desGrado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idGrado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_grado` */

insert  into `tb_grado`(`idGrado`,`desGrado`) values (1,'Inicial II'),(2,'Inicial III'),(3,'Inicial IV'),(4,'Inicial V'),(5,'1ro Primaria'),(6,'2do Primaria'),(7,'3er Primaria'),(8,'4to Primaria'),(9,'5to Primaria'),(10,'6to Primaria'),(11,'1ro Secundaria'),(12,'2do Secundaria'),(13,'3ro Secundaria'),(14,'4to Secundaria'),(15,'5to Secundaria');

/*Table structure for table `tb_inf_acad_estudiante` */

DROP TABLE IF EXISTS `tb_inf_acad_estudiante`;

CREATE TABLE `tb_inf_acad_estudiante` (
  `idInforme` int(11) NOT NULL,
  `idEstudiante` int(11) NOT NULL,
  PRIMARY KEY (`idInforme`,`idEstudiante`),
  KEY `R_36` (`idEstudiante`),
  CONSTRAINT `tb_inf_acad_estudiante_ibfk_1` FOREIGN KEY (`idInforme`) REFERENCES `tb_informe_acad` (`idInforme`),
  CONSTRAINT `tb_inf_acad_estudiante_ibfk_2` FOREIGN KEY (`idEstudiante`) REFERENCES `tb_estudiante` (`idEstudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_inf_acad_estudiante` */

/*Table structure for table `tb_inf_psicologico` */

DROP TABLE IF EXISTS `tb_inf_psicologico`;

CREATE TABLE `tb_inf_psicologico` (
  `idInformePsicologico` int(11) NOT NULL,
  `idEstudiante` int(11) DEFAULT NULL,
  `idPsicologo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInformePsicologico`),
  KEY `R_56` (`idEstudiante`),
  KEY `R_55` (`idPsicologo`),
  CONSTRAINT `tb_inf_psicologico_ibfk_1` FOREIGN KEY (`idEstudiante`) REFERENCES `tb_estudiante` (`idEstudiante`),
  CONSTRAINT `tb_inf_psicologico_ibfk_2` FOREIGN KEY (`idPsicologo`) REFERENCES `tb_psicologo` (`idPsicologo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_inf_psicologico` */

/*Table structure for table `tb_informe_acad` */

DROP TABLE IF EXISTS `tb_informe_acad`;

CREATE TABLE `tb_informe_acad` (
  `idInforme` int(11) NOT NULL,
  `idDocente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInforme`),
  KEY `R_35` (`idDocente`),
  CONSTRAINT `tb_informe_acad_ibfk_1` FOREIGN KEY (`idDocente`) REFERENCES `tb_docente` (`idDocente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_informe_acad` */

/*Table structure for table `tb_informe_comport` */

DROP TABLE IF EXISTS `tb_informe_comport`;

CREATE TABLE `tb_informe_comport` (
  `idInformeComport` int(11) NOT NULL,
  `idEstudiante` int(11) DEFAULT NULL,
  `idDocente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInformeComport`),
  KEY `R_40` (`idEstudiante`),
  KEY `R_41` (`idDocente`),
  CONSTRAINT `tb_informe_comport_ibfk_1` FOREIGN KEY (`idEstudiante`) REFERENCES `tb_estudiante` (`idEstudiante`),
  CONSTRAINT `tb_informe_comport_ibfk_2` FOREIGN KEY (`idDocente`) REFERENCES `tb_docente` (`idDocente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_informe_comport` */

/*Table structure for table `tb_material_repaso` */

DROP TABLE IF EXISTS `tb_material_repaso`;

CREATE TABLE `tb_material_repaso` (
  `idRespuesta` int(11) DEFAULT NULL,
  `idMaterialRepaso` int(11) NOT NULL,
  PRIMARY KEY (`idMaterialRepaso`),
  KEY `R_30` (`idRespuesta`),
  CONSTRAINT `tb_material_repaso_ibfk_1` FOREIGN KEY (`idRespuesta`) REFERENCES `tb_respuesta` (`idRespuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_material_repaso` */

/*Table structure for table `tb_pregunta` */

DROP TABLE IF EXISTS `tb_pregunta`;

CREATE TABLE `tb_pregunta` (
  `idPregunta` int(11) NOT NULL,
  `idTema` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPregunta`),
  KEY `R_28` (`idTema`),
  CONSTRAINT `tb_pregunta_ibfk_1` FOREIGN KEY (`idTema`) REFERENCES `tb_tema` (`idTema`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_pregunta` */

/*Table structure for table `tb_pregunta_evaluacion` */

DROP TABLE IF EXISTS `tb_pregunta_evaluacion`;

CREATE TABLE `tb_pregunta_evaluacion` (
  `idEvaluacion` int(11) NOT NULL,
  `idPregunta` int(11) NOT NULL,
  PRIMARY KEY (`idEvaluacion`,`idPregunta`),
  KEY `R_34` (`idPregunta`),
  CONSTRAINT `tb_pregunta_evaluacion_ibfk_1` FOREIGN KEY (`idEvaluacion`) REFERENCES `tb_evaluacion` (`idEvaluacion`),
  CONSTRAINT `tb_pregunta_evaluacion_ibfk_2` FOREIGN KEY (`idPregunta`) REFERENCES `tb_pregunta` (`idPregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_pregunta_evaluacion` */

/*Table structure for table `tb_psicologo` */

DROP TABLE IF EXISTS `tb_psicologo`;

CREATE TABLE `tb_psicologo` (
  `nroColegiatura` varchar(20) DEFAULT NULL,
  `idPsicologo` int(11) NOT NULL,
  `idDistrito` int(11) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `apePat` varchar(30) DEFAULT NULL,
  `apeMat` varchar(30) DEFAULT NULL,
  `fecNac` date DEFAULT NULL,
  `fecIngreso` date DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telfMovil` varchar(40) DEFAULT NULL,
  `telfFijo` varchar(40) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `idGenero` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPsicologo`),
  KEY `R_63` (`idDistrito`),
  KEY `R_66` (`idUsuario`),
  KEY `R_69` (`idGenero`),
  CONSTRAINT `tb_psicologo_ibfk_1` FOREIGN KEY (`idDistrito`) REFERENCES `tb_distrito` (`idDistrito`),
  CONSTRAINT `tb_psicologo_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`),
  CONSTRAINT `tb_psicologo_ibfk_3` FOREIGN KEY (`idGenero`) REFERENCES `tb_genero` (`idGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_psicologo` */

/*Table structure for table `tb_respuesta` */

DROP TABLE IF EXISTS `tb_respuesta`;

CREATE TABLE `tb_respuesta` (
  `idPregunta` int(11) DEFAULT NULL,
  `idRespuesta` int(11) NOT NULL,
  PRIMARY KEY (`idRespuesta`),
  KEY `R_29` (`idPregunta`),
  CONSTRAINT `tb_respuesta_ibfk_1` FOREIGN KEY (`idPregunta`) REFERENCES `tb_pregunta` (`idPregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_respuesta` */

/*Table structure for table `tb_rol` */

DROP TABLE IF EXISTS `tb_rol`;

CREATE TABLE `tb_rol` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(20) DEFAULT NULL,
  `estadoRol` tinyint(4) DEFAULT NULL,
  `slug` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_rol` */

insert  into `tb_rol`(`idRol`,`nombreRol`,`estadoRol`,`slug`) values (1,'Administrador',1,'admin'),(2,'Docente',1,'teacher'),(3,'Coordinador',1,'coach'),(4,'Psicologo',1,'psychologist'),(5,'Psicologo/Docente',1,'teacher-psychologist'),(6,'Estudiante',1,'student'),(7,'Secretaria',1,'secretary');

/*Table structure for table `tb_seccion` */

DROP TABLE IF EXISTS `tb_seccion`;

CREATE TABLE `tb_seccion` (
  `idSeccion` int(11) NOT NULL,
  `idGrado` int(11) DEFAULT NULL,
  `desSeccion` varchar(20) DEFAULT NULL,
  `fechaCreacion` date DEFAULT NULL,
  PRIMARY KEY (`idSeccion`),
  KEY `R_24` (`idGrado`),
  CONSTRAINT `tb_seccion_ibfk_1` FOREIGN KEY (`idGrado`) REFERENCES `tb_grado` (`idGrado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_seccion` */

insert  into `tb_seccion`(`idSeccion`,`idGrado`,`desSeccion`,`fechaCreacion`) values (1,1,'Inicial IIA - 2019','2019-01-15'),(2,2,'Inicial IIIA - 2019','2019-01-15'),(3,2,'Inicial IIIB - 2019','2019-01-15'),(4,3,'Inicial IVA - 2019','2019-01-15'),(5,3,'Inicial IVB - 2019','2019-01-15'),(6,4,'Inicial VA - 2019','2019-01-15'),(7,4,'Inicial VB - 2019','2019-01-15'),(8,5,'1ro A - Prim - 2019','2019-01-15'),(9,6,'2do A - Prim - 2019','2019-01-15'),(10,7,'3ro A - Prim - 2019','2019-01-15'),(11,8,'4to A - Prim - 2019','2019-01-15'),(12,9,'5to A - Prim - 2019','2019-01-15'),(13,10,'6to A - Prim - 2019','2019-01-15'),(14,1,'Inicial IIA - 2020','2020-01-15'),(15,2,'Inicial IIIA - 2020','2020-01-15'),(16,2,'Inicial IIIB - 2020','2020-01-15'),(17,3,'Inicial IVA - 2020','2020-01-15'),(18,3,'Inicial IVB - 2020','2020-01-15'),(19,4,'Inicial VA - 2020','2020-01-15'),(20,4,'Inicial VB - 2020','2020-01-15'),(21,5,'1ro A - Prim - 2020','2020-01-15'),(22,6,'2do A - Prim - 2020','2020-01-15'),(23,7,'3ro A - Prim - 2020','2020-01-15'),(24,8,'4to A - Prim - 2020','2020-01-15'),(25,9,'5to A - Prim - 2020','2020-01-15'),(26,10,'6to A - Prim - 2020','2020-01-15');

/*Table structure for table `tb_tema` */

DROP TABLE IF EXISTS `tb_tema`;

CREATE TABLE `tb_tema` (
  `idTema` int(11) NOT NULL,
  `idUnidad` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idTema`),
  KEY `R_27` (`idUnidad`),
  CONSTRAINT `tb_tema_ibfk_1` FOREIGN KEY (`idUnidad`) REFERENCES `tb_unidad` (`idUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_tema` */

/*Table structure for table `tb_unidad` */

DROP TABLE IF EXISTS `tb_unidad`;

CREATE TABLE `tb_unidad` (
  `idUnidad` int(11) NOT NULL,
  `idCurso` int(11) DEFAULT NULL,
  `idSeccion` int(11) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idUnidad`),
  KEY `R_70` (`idCurso`,`idSeccion`),
  CONSTRAINT `tb_unidad_ibfk_1` FOREIGN KEY (`idCurso`, `idSeccion`) REFERENCES `tb_curso_seccion` (`idCurso`, `idSeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_unidad` */

/*Table structure for table `tb_usuario` */

DROP TABLE IF EXISTS `tb_usuario`;

CREATE TABLE `tb_usuario` (
  `idUsuario` int(11) NOT NULL,
  `nomUsuario` varchar(10) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `estadoUsuario` tinyint(4) DEFAULT NULL,
  `idRol` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `R_3` (`idRol`),
  CONSTRAINT `tb_usuario_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `tb_rol` (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_usuario` */

insert  into `tb_usuario`(`idUsuario`,`nomUsuario`,`password`,`estadoUsuario`,`idRol`) values (1,'SANQUI2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,1),(2,'TERQUI2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,3),(3,'JORROJ2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,2),(4,'LILESQ2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,2),(5,'REYVER2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,2),(6,'FABSAL2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,2),(7,'NANQUI2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,2),(8,'ZOEALE2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(9,'MATAPA2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(10,'ADRBER2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(11,'DOMBRA2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(12,'VICCAR2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(13,'AXECHI2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(14,'ADRCOR2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(15,'ADRCUR2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(16,'ARIGAO2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(17,'ALEGAR2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(18,'JHAALV2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(19,'JAVHUA2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(20,'CAMLAG2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(21,'LUACAB2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(22,'ANAMIR2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(23,'ANDPIA2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(24,'TATPRA2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(25,'ROYSOT2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(26,'EYMVIL2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(27,'MAYZAP2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,6),(28,'EVEBAR2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,7),(29,'ANACAS2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,4),(30,'LUZCUB2019','eyJhbGciOiJIUzI1NiJ9.YWRtaW4.AhJidt6llGS3UClUGT3utGl8M2pti5QVLopFt_qqdkM',1,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
