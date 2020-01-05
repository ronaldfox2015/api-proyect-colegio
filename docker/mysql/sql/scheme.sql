-- MySQL Workbench Forward Engineering
-- drop database bd_iepmae;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
-- --------------------------------------
-- indexado de tablas
-- CREATE UNIQUE INDEX idx_apoderado_dni ON tb_apoderado(dniApoderado ASC);
-- ---------------------------------------
-- CREATE SCHEMA IF NOT EXISTS `bd_iepmae` DEFAULT CHARACTER SET utf8 ;
USE `bd_iepmae` ;



CREATE TABLE tb_accesoUsuario
(
	idAccesoUsuario      INTEGER NOT NULL,
	fechaAcceso          DATE NULL,
	idUsuario            INTEGER NULL
);



ALTER TABLE tb_accesoUsuario
ADD PRIMARY KEY (idAccesoUsuario);



CREATE TABLE tb_administrativo
(
	dni                  VARCHAR(08) NULL,
	nombre               VARCHAR(30) NULL,
	apePat               VARCHAR(30) NULL,
	apeMat               VARCHAR(30) NULL,
	fecNac               DATE NULL,
	fecIngreso           DATE NULL,
	direccion            VARCHAR(80) NULL,
	telfMovil            VARCHAR(50) NULL,
	telfFijo             VARCHAR(50) NULL,
	email                VARCHAR(50) NULL,
	estado               TINYINT NULL,
	idGenero             INTEGER NULL,
	idDistrito           INTEGER NULL,
	idAdministrativo     INTEGER NOT NULL,
	idCargo              INTEGER NULL,
	idUsuario            INTEGER NULL
);



ALTER TABLE tb_administrativo
ADD PRIMARY KEY (idAdministrativo);



CREATE TABLE tb_apoderado
(
	observacion          VARCHAR(100) NULL,
	idApoderado          INTEGER NOT NULL,
	dni                  VARCHAR(08) NULL,
	nombre               VARCHAR(30) NULL,
	apePat               VARCHAR(30) NULL,
	apeMat               VARCHAR(30) NULL,
	fecNac               DATE NULL,
	fecIngreso           DATE NULL,
	direccion            VARCHAR(150) NULL,
	telfMovil            VARCHAR(40) NULL,
	telfFijo             VARCHAR(40) NULL,
	email                VARCHAR(120) NULL,
	estado               INTEGER NULL,
	idDistrito           INTEGER NULL,
	idGenero             INTEGER NULL
);



ALTER TABLE tb_apoderado
ADD PRIMARY KEY (idApoderado);



CREATE TABLE tb_cargo
(
	idCargo              INTEGER NOT NULL,
	desCargo             VARCHAR(20) NULL,
	estadoCargo          TINYINT NULL
);



ALTER TABLE tb_cargo
ADD PRIMARY KEY (idCargo);



CREATE TABLE tb_curso
(
	idCurso              INTEGER NOT NULL,
	descripcion          VARCHAR(30) NULL,
	estado               INTEGER NULL
);



ALTER TABLE tb_curso
ADD PRIMARY KEY (idCurso);



CREATE TABLE tb_curso_seccion
(
	idCurso              INTEGER NOT NULL,
	idSeccion            INTEGER NOT NULL,
	idDocente            INTEGER NULL,
	fechaCurso           DATE NULL
);



ALTER TABLE tb_curso_seccion
ADD PRIMARY KEY (idCurso,idSeccion);



CREATE TABLE tb_desarrollo_respuesta
(
	idRespuesta          INTEGER NULL,
	idDesarrolloRespuesta INTEGER NOT NULL
);



ALTER TABLE tb_desarrollo_respuesta
ADD PRIMARY KEY (idDesarrolloRespuesta);



CREATE TABLE tb_distrito
(
	idDistrito           INTEGER NOT NULL,
	desDistrito          VARCHAR(40) NULL,
	codigoPostal         VARCHAR(20) NULL
);



ALTER TABLE tb_distrito
ADD PRIMARY KEY (idDistrito);



CREATE TABLE tb_docente
(
	idEspecialidad       INTEGER NULL,
	observacion          VARCHAR(100) NULL,
	estado               TINYINT NULL,
	idDocente            INTEGER NOT NULL,
	idDistrito           INTEGER NULL,
	dni                  VARCHAR(08) NULL,
	apePat               VARCHAR(30) NULL,
	apeMat               VARCHAR(30) NULL,
	fecNac               DATE NULL,
	fecIng               DATE NULL,
	telfMovil            VARCHAR(40) NULL,
	direccion            VARCHAR(150) NULL,
	telfFijo             VARCHAR(40) NULL,
	email                VARCHAR(120) NULL,
	idUsuario            INTEGER NULL,
	nombre               VARCHAR(30) NULL,
	idGenero             INTEGER NULL
);



ALTER TABLE tb_docente
ADD PRIMARY KEY (idDocente);



CREATE TABLE tb_especialidad
(
	idEspecialidad       INTEGER NOT NULL,
	desEspecialidad      VARCHAR(20) NULL,
	estadoEspecialidad   INTEGER NULL
);



ALTER TABLE tb_especialidad
ADD PRIMARY KEY (idEspecialidad);



CREATE TABLE tb_estudiante
(
	fotoEstudiante       BLOB NULL,
	estadoEstudiante     TINYINT NULL,
	idEstudiante         INTEGER NOT NULL,
	idApoderado          INTEGER NULL,
	dniEstudiante        VARCHAR(08) NULL,
	nombre               VARCHAR(30) NULL,
	idUsuario            INTEGER NULL,
	apePat               VARCHAR(30) NULL,
	apeMat               VARCHAR(30) NULL,
	idGenero             INTEGER NULL,
	fecIngreso           DATE NULL,
	observacion          VARCHAR(200) NULL,
	fecNac               DATE NULL
);



ALTER TABLE tb_estudiante
ADD PRIMARY KEY (idEstudiante);



CREATE TABLE tb_evaluacion
(
	idEvaluacion         INTEGER NOT NULL,
	idCurso              INTEGER NULL
);



ALTER TABLE tb_evaluacion
ADD PRIMARY KEY (idEvaluacion);



CREATE TABLE tb_genero
(
	idGenero             INTEGER NOT NULL,
	desGenero            VARCHAR(20) NULL
);



ALTER TABLE tb_genero
ADD PRIMARY KEY (idGenero);



CREATE TABLE tb_grado
(
	idGrado              INTEGER NOT NULL,
	desGrado             VARCHAR(20) NULL
);



ALTER TABLE tb_grado
ADD PRIMARY KEY (idGrado);



CREATE TABLE tb_inf_acad_estudiante
(
	idInforme            INTEGER NOT NULL,
	idEstudiante         INTEGER NOT NULL
);



ALTER TABLE tb_inf_acad_estudiante
ADD PRIMARY KEY (idInforme,idEstudiante);



CREATE TABLE tb_inf_psicologico
(
	idInformePsicologico INTEGER NOT NULL,
	idEstudiante         INTEGER NULL,
	idPsicologo          INTEGER NULL
);



ALTER TABLE tb_inf_psicologico
ADD PRIMARY KEY (idInformePsicologico);



CREATE TABLE tb_informe_acad
(
	idInforme            INTEGER NOT NULL,
	idDocente            INTEGER NULL
);



ALTER TABLE tb_informe_acad
ADD PRIMARY KEY (idInforme);



CREATE TABLE tb_informe_comport
(
	idInformeComport     INTEGER NOT NULL,
	idEstudiante         INTEGER NULL,
	idDocente            INTEGER NULL
);



ALTER TABLE tb_informe_comport
ADD PRIMARY KEY (idInformeComport);



CREATE TABLE tb_material_repaso
(
	idRespuesta          INTEGER NULL,
	idMaterialRepaso     INTEGER NOT NULL
);



ALTER TABLE tb_material_repaso
ADD PRIMARY KEY (idMaterialRepaso);



CREATE TABLE tb_Matricula
(
	idSeccion            INTEGER NOT NULL,
	fecMatricula         DATE NULL,
	idEstudiante         INTEGER NOT NULL
);



ALTER TABLE tb_Matricula
ADD PRIMARY KEY (idSeccion,idEstudiante);



CREATE TABLE tb_pregunta
(
	idPregunta           INTEGER NOT NULL,
	idTema               INTEGER NULL
);



ALTER TABLE tb_pregunta
ADD PRIMARY KEY (idPregunta);



CREATE TABLE tb_pregunta_evaluacion
(
	idEvaluacion         INTEGER NOT NULL,
	idPregunta           INTEGER NOT NULL
);



ALTER TABLE tb_pregunta_evaluacion
ADD PRIMARY KEY (idEvaluacion,idPregunta);



CREATE TABLE tb_psicologo
(
	nroColegiatura       VARCHAR(20) NULL,
	idPsicologo          INTEGER NOT NULL,
	idDistrito           INTEGER NULL,
	dni                  VARCHAR(08) NULL,
	apePat               VARCHAR(30) NULL,
	apeMat               VARCHAR(30) NULL,
	fecNac               DATE NULL,
	fecIngreso           DATE NULL,
	direccion            VARCHAR(150) NULL,
	telfMovil            VARCHAR(40) NULL,
	telfFijo             VARCHAR(40) NULL,
	email                VARCHAR(120) NULL,
	estado               INTEGER NULL,
	idUsuario            INTEGER NULL,
	nombre               VARCHAR(30) NULL,
	idGenero             INTEGER NULL
);



ALTER TABLE tb_psicologo
ADD PRIMARY KEY (idPsicologo);



CREATE TABLE tb_respuesta
(
	idPregunta           INTEGER NULL,
	idRespuesta          INTEGER NOT NULL
);



ALTER TABLE tb_respuesta
ADD PRIMARY KEY (idRespuesta);



CREATE TABLE tb_rol
(
	idRol                INTEGER NOT NULL,
	nombreRol            VARCHAR(20) NULL,
	estadoRol            TINYINT NULL,
	slug                 VARCHAR(20) NULL
);



ALTER TABLE tb_rol
ADD PRIMARY KEY (idRol);



CREATE TABLE tb_seccion
(
	idSeccion            INTEGER NOT NULL,
	idGrado              INTEGER NULL,
	desSeccion           VARCHAR(20) NULL,
	fechaCreacion        DATE NULL
);



ALTER TABLE tb_seccion
ADD PRIMARY KEY (idSeccion);



CREATE TABLE tb_tema
(
	idTema               INTEGER NOT NULL,
	idUnidad             INTEGER NULL,
	descripcion          VARCHAR(200) NULL
);



ALTER TABLE tb_tema
ADD PRIMARY KEY (idTema);



CREATE TABLE tb_unidad
(
	idUnidad             INTEGER NOT NULL,
	idCurso              INTEGER NULL,
	idSeccion            INTEGER NULL,
	descripcion          VARCHAR(50) NULL
);



ALTER TABLE tb_unidad
ADD PRIMARY KEY (idUnidad);



CREATE TABLE tb_usuario
(
	idUsuario            INTEGER NOT NULL,
	nomUsuario           VARCHAR(10) NULL,
	password             VARCHAR(20) NULL,
	estadoUsuario        TINYINT NULL,
	idRol                INTEGER NULL
);



ALTER TABLE tb_usuario
ADD PRIMARY KEY (idUsuario);



ALTER TABLE tb_accesoUsuario
ADD FOREIGN KEY R_4 (idUsuario) REFERENCES tb_usuario (idUsuario);



ALTER TABLE tb_administrativo
ADD FOREIGN KEY R_15 (idGenero) REFERENCES tb_genero (idGenero);



ALTER TABLE tb_administrativo
ADD FOREIGN KEY R_16 (idDistrito) REFERENCES tb_distrito (idDistrito);



ALTER TABLE tb_administrativo
ADD FOREIGN KEY R_58 (idCargo) REFERENCES tb_cargo (idCargo);



ALTER TABLE tb_administrativo
ADD FOREIGN KEY R_65 (idUsuario) REFERENCES tb_usuario (idUsuario);



ALTER TABLE tb_apoderado
ADD FOREIGN KEY R_57 (idDistrito) REFERENCES tb_distrito (idDistrito);



ALTER TABLE tb_apoderado
ADD FOREIGN KEY R_59 (idGenero) REFERENCES tb_genero (idGenero);



ALTER TABLE tb_curso_seccion
ADD FOREIGN KEY R_20 (idCurso) REFERENCES tb_curso (idCurso);



ALTER TABLE tb_curso_seccion
ADD FOREIGN KEY R_22 (idSeccion) REFERENCES tb_seccion (idSeccion);



ALTER TABLE tb_curso_seccion
ADD FOREIGN KEY R_23 (idDocente) REFERENCES tb_docente (idDocente);



ALTER TABLE tb_desarrollo_respuesta
ADD FOREIGN KEY R_31 (idRespuesta) REFERENCES tb_respuesta (idRespuesta);



ALTER TABLE tb_docente
ADD FOREIGN KEY R_14 (idEspecialidad) REFERENCES tb_especialidad (idEspecialidad);



ALTER TABLE tb_docente
ADD FOREIGN KEY R_61 (idDistrito) REFERENCES tb_distrito (idDistrito);



ALTER TABLE tb_docente
ADD FOREIGN KEY R_64 (idUsuario) REFERENCES tb_usuario (idUsuario);



ALTER TABLE tb_docente
ADD FOREIGN KEY R_67 (idGenero) REFERENCES tb_genero (idGenero);



ALTER TABLE tb_estudiante
ADD FOREIGN KEY R_52 (idApoderado) REFERENCES tb_apoderado (idApoderado);



ALTER TABLE tb_estudiante
ADD FOREIGN KEY R_53 (idUsuario) REFERENCES tb_usuario (idUsuario);



ALTER TABLE tb_estudiante
ADD FOREIGN KEY R_60 (idGenero) REFERENCES tb_genero (idGenero);



ALTER TABLE tb_evaluacion
ADD FOREIGN KEY R_25 (idCurso) REFERENCES tb_curso (idCurso);



ALTER TABLE tb_inf_acad_estudiante
ADD FOREIGN KEY R_38 (idInforme) REFERENCES tb_informe_acad (idInforme);



ALTER TABLE tb_inf_acad_estudiante
ADD FOREIGN KEY R_36 (idEstudiante) REFERENCES tb_estudiante (idEstudiante);



ALTER TABLE tb_inf_psicologico
ADD FOREIGN KEY R_56 (idEstudiante) REFERENCES tb_estudiante (idEstudiante);



ALTER TABLE tb_inf_psicologico
ADD FOREIGN KEY R_55 (idPsicologo) REFERENCES tb_psicologo (idPsicologo);



ALTER TABLE tb_informe_acad
ADD FOREIGN KEY R_35 (idDocente) REFERENCES tb_docente (idDocente);



ALTER TABLE tb_informe_comport
ADD FOREIGN KEY R_40 (idEstudiante) REFERENCES tb_estudiante (idEstudiante);



ALTER TABLE tb_informe_comport
ADD FOREIGN KEY R_41 (idDocente) REFERENCES tb_docente (idDocente);



ALTER TABLE tb_material_repaso
ADD FOREIGN KEY R_30 (idRespuesta) REFERENCES tb_respuesta (idRespuesta);



ALTER TABLE tb_Matricula
ADD FOREIGN KEY R_17 (idSeccion) REFERENCES tb_seccion (idSeccion);



ALTER TABLE tb_Matricula
ADD FOREIGN KEY R_19 (idEstudiante) REFERENCES tb_estudiante (idEstudiante);



ALTER TABLE tb_pregunta
ADD FOREIGN KEY R_28 (idTema) REFERENCES tb_tema (idTema);



ALTER TABLE tb_pregunta_evaluacion
ADD FOREIGN KEY R_32 (idEvaluacion) REFERENCES tb_evaluacion (idEvaluacion);



ALTER TABLE tb_pregunta_evaluacion
ADD FOREIGN KEY R_34 (idPregunta) REFERENCES tb_pregunta (idPregunta);



ALTER TABLE tb_psicologo
ADD FOREIGN KEY R_63 (idDistrito) REFERENCES tb_distrito (idDistrito);



ALTER TABLE tb_psicologo
ADD FOREIGN KEY R_66 (idUsuario) REFERENCES tb_usuario (idUsuario);



ALTER TABLE tb_psicologo
ADD FOREIGN KEY R_69 (idGenero) REFERENCES tb_genero (idGenero);

ALTER TABLE tb_respuesta
ADD FOREIGN KEY R_29 (idPregunta) REFERENCES tb_pregunta (idPregunta);



ALTER TABLE tb_seccion
ADD FOREIGN KEY R_24 (idGrado) REFERENCES tb_grado (idGrado);



ALTER TABLE tb_tema
ADD FOREIGN KEY R_27 (idUnidad) REFERENCES tb_unidad (idUnidad);



ALTER TABLE tb_unidad
ADD FOREIGN KEY R_70 (idCurso, idSeccion) REFERENCES tb_curso_seccion (idCurso, idSeccion);



ALTER TABLE tb_usuario
ADD FOREIGN KEY R_3 (idRol) REFERENCES tb_rol (idRol);


use bd_iepmae;
show tables;
show databases;
select * from tb_distrito;
select * from tb_rol;
select * from tb_genero;
select * from tb_cargo;
select * from tb_especialidad;
select * from tb_usuario;
select idUsuario,nomUsuario,password,estadousuario,tb_rol.nombreRol from tb_usuario
					inner join tb_rol on tb_usuario.idRol=tb_rol.idRol;

select * from tb_docente;
select * from tb_apoderado;
select * from tb_estudiante;
-- -----------------------------
-- REGISTRO DE DATOS;
-- ----------------------------

-- ---------------------------------------------------
-- tb_distrito;
-- ---------------------------------------------------
insert into tb_distrito values (1,'Villa María del Triunfo','LIMA35');
insert into tb_distrito values (2,'Villa El Salvador','LIMA42');
insert into tb_distrito values (3,'San Juan de Miraflores','LIMA29');
insert into tb_distrito values (4,'Chorrillos','LIMA09');
-- ---------------------------------------------------
-- tb_rol;
select * from tb_rol;
-- ---------------------------------------------------
insert into tb_rol values (1,'Administrador',1,'admin');
insert into tb_rol values (2,'Docente',1,'teacher');
insert into tb_rol values (3,'Coordinador',1,'coach');
insert into tb_rol values (4,'Psicologo',1,'psychologist');
insert into tb_rol values (5,'Psicologo/Docente',1,'teacher-psychologist');
insert into tb_rol values (6,'Estudiante',1,'student');
insert into tb_rol values (7,'Secretaria',1,'secretary');
-- ---------------------------------------------------
-- tb_genero;
-- ---------------------------------------------------
insert into tb_genero values (1,'Masculino');
insert into tb_genero values (2,'Femenino');
-- ---------------------------------------------------
-- tb_especialidad;
-- ---------------------------------------------------
insert into tb_especialidad values (1,'Inicial',1);
insert into tb_especialidad values (2,'Primaria',1);
insert into tb_especialidad values (3,'Secundaria',1);
insert into tb_especialidad values (4,'Auxiliar',1);
-- ---------------------------------------------------
-- tb_cargo;
select * from tb_cargo;
-- ---------------------------------------------------
insert into tb_cargo values (1,'Director',1);
insert into tb_cargo values (2,'Sub-Director',1);
insert into tb_cargo values (3,'Coordinador',1);
insert into tb_cargo values (4,'Secretaria',1);
-- ---------------------------------------------------
-- tb_usuario;
select * from tb_usuario;
-- ---------------------------------------------------
insert into tb_usuario values (1,'SANQUI2019','admin',1,1);		-- administrador "1"
insert into tb_usuario values (2,'TERQUI2019','mae2019',1,3);	-- coordinador "3"
-- ---- Docentes;
insert into tb_usuario values (3,'JORROJ2019','mae2019',1,2);	-- docente "2"
insert into tb_usuario values (4,'LILESQ2019','mae2019',1,2);
insert into tb_usuario values (5,'REYVER2019','mae2019',1,2);
insert into tb_usuario values (6,'FABSAL2019','mae2019',1,2);
insert into tb_usuario values (7,'NANQUI2019','mae2019',1,2);

-- ----- Alumnos;
insert into tb_usuario values ( 8,'ZOEALE2019','mae2019',1,6);  -- estudiante "6"
insert into tb_usuario values ( 9,'MATAPA2019','mae2019',1,6);
insert into tb_usuario values (10,'ADRBER2019','mae2019',1,6);
insert into tb_usuario values (11,'DOMBRA2019','mae2019',1,6);
insert into tb_usuario values (12,'VICCAR2019','mae2019',1,6);
insert into tb_usuario values (13,'AXECHI2019','mae2019',1,6);
insert into tb_usuario values (14,'ADRCOR2019','mae2019',1,6);
insert into tb_usuario values (15,'ADRCUR2019','mae2019',1,6);
insert into tb_usuario values (16,'ARIGAO2019','mae2019',1,6);
insert into tb_usuario values (17,'ALEGAR2019','mae2019',1,6);
insert into tb_usuario values (18,'JHAALV2019','mae2019',1,6);
insert into tb_usuario values (19,'JAVHUA2019','mae2019',1,6);
insert into tb_usuario values (20,'CAMLAG2019','mae2019',1,6);
insert into tb_usuario values (21,'LUACAB2019','mae2019',1,6);
insert into tb_usuario values (22,'ANAMIR2019','mae2019',1,6);
insert into tb_usuario values (23,'ANDPIA2019','mae2019',1,6);
insert into tb_usuario values (24,'TATPRA2019','mae2019',1,6);
insert into tb_usuario values (25,'ROYSOT2019','mae2019',1,6);
insert into tb_usuario values (26,'EYMVIL2019','mae2019',1,6);
insert into tb_usuario values (27,'MAYZAP2019','mae2019',1,6);
-- ----- Administrativo;
insert into tb_usuario values (28,'EVEBAR2019','mae2019',1,7);	-- secretaria "7"
insert into tb_usuario values (29,'ANACAS2019','mae2019',1,4);	-- psicologo "4"

insert into tb_usuario values (30,'LUZCUB2019','mae2019',1,2);	-- docente "2"
-- ---------------------------------------------------
-- tb_docente;
-- ---------------------------------------------------
select * from tb_docente;
-- -------------------------------
insert into tb_docente(idDocente,idUsuario,idEspecialidad,dni,nombre,apePat,apeMat,idDistrito,fecNac,
				fecIng,direccion,telfMovil,telfFijo,email,observacion,estado)
	values (1,3,3,'10233775','Jorge','Rojas','Rojas',2,'1975/7/14','2018/2/20','Av. Revolución 2312',
	 					'997130857','2870441','grankoki@gmail.com','ninguno',1);
insert into tb_docente(idDocente,idUsuario,idEspecialidad,dni,nombre,apePat,apeMat,idDistrito,fecNac,
				fecIng,direccion,telfMovil,telfFijo,email,observacion,estado)
	values (2,4,3,'10101010','Lidia','Franco','Palacios',2,'1978/1/20','2018/2/15','Av. El Sol 1811',
	 					'927130844','4937042','lidiafranco@gmail.com','Bachiller en educación secundaria',1);
insert into tb_docente(idDocente,idUsuario,idEspecialidad,dni,nombre,apePat,apeMat,idDistrito,fecNac,
				fecIng,direccion,telfMovil,telfFijo,email,observacion,estado)
	values (3,5,2,'20450524','Reyna','Peralta','Palomino',2,'1978/1/20','2018/2/15','Av. El Sol 1811',
	 					'927130844','4937042','reynaperalta@gmail.com','Prof. de Danza y Educ. Física',1);
insert into tb_docente(idDocente,idUsuario,idEspecialidad,dni,nombre,apePat,apeMat,idDistrito,fecNac,
				fecIng,direccion,telfMovil,telfFijo,email,observacion,estado)
	values (4,6,2,'26450522','Fabiane','Salazar','Rojas',1,'1985/9/22','2015/2/19','Jr. Tacna 349',
	 					'787130861','3917141','fabianesaro@gmail.com','Especialista en Montessori',1);
insert into tb_docente(idDocente,idUsuario,idEspecialidad,dni,nombre,apePat,apeMat,idDistrito,fecNac,
				fecIng,direccion,telfMovil,telfFijo,email,observacion,estado)
	values (5,7,2,'21450509','Nancy','Hinostroza','Amar',1,'1982/11/20','2014/4/15','Jr. Tacna 705',
	 					'957130861','4691994','nancyhinostroza@gmail.com','Especialista en matemática',1);
insert into tb_docente(idDocente,idUsuario,idEspecialidad,dni,nombre,apePat,apeMat,idDistrito,fecNac,
				fecIng,direccion,telfMovil,telfFijo,email,observacion,estado)
	values (6,30,2,'09745059','Luz','Cubas','Serrano',1,'1970/06/19','2011/4/11','Jr. Tacna 705',
	 					'957130861','4691994','luzcubas@gmail.com','Especialista en Comunicación',1);
select * from tb_cargo;
select * from tb_administrativo;
-- ----------------- COORDINADORA ----
insert into tb_administrativo (idAdministrativo,idCargo,idGenero,idDistrito,dni,nombre,apePat,apeMat,
									fecNac,fecIngreso,direccion,telfMovil,telfFijo,email,estado,idUsuario)
			values (1,2,2,1,'09450506','María Teresa','Quispe','Amar',
										'1970/5/17','2009/02/15','Jr. Tacna 311',
									'923130877','4017166','techiquam@gmail.com',1,2);
insert into tb_administrativo (idAdministrativo,idCargo,idGenero,idDistrito,dni,nombre,apePat,apeMat,
									fecNac,fecIngreso,direccion,telfMovil,telfFijo,email,estado,idUsuario)
			values (2,1,2,1,'09489511','Sandra','Quispe','Amar',
										'1973/6/25','2008/01/19','Jr. Tacna 311',
									'943130277','4017166','sandraq@gmail.com',1,1);
-- ---------------------------------------------------
-- tb_apoderado;
select * from tb_apoderado;
-- ---------------------------------------------------

 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
					values (1,1,2,'11059943','Margarita','Huaranca','Rojas','1970/09/25',
							'2014/02/19','Jr. Amazonas 422','980230119','4508221','margaritahuro@gmail.com',
                            'religión mormón',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (2,1,2,'14059933','Roxana','Rivera','Huaman','1978/09/25',
							'2010/03/11','Jr. Amazonas 122','980230119','4508221','roxanarihu@gmail.com',
                            'exagera las situaciones al hablar',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (3,1,2,'13099941','Gladys','Herrera','Zapata','1977/11/25',
							'2011/02/23','Jr. Tacna 333','980230119','4508221','gladysheza@gmail.com',
                            'se compromete a donar cada fin de año una caja de panetones',1);
  insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (4,1,2,'16059443','Katherine','Gonzales','Vargas','1983/04/11',
							'2012/03/10','Jr. Amazonas 611','980230119','4508221','katherinegova@gmail.com','',1);
  insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (5,1,1,'16041143','Mateo','Cardenas','Rivera','1972/06/25',
							'2014/02/16','Jr. Loreto 402','980230119','4508224','mateocari@gmail.com','',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (6,2,2,'11775743','Rosa','Pajuelo','Zuñiga','1979/02/21',
							'2015/03/13','Jr. Amazonas 122','980230119','4508221','rosapazu@gmail.com','',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (7,1,2,'10885711','Elvira','Román','Chipana','1979/01/21',
						'2016/02/27','Jr. Huanuco 409','980230119','4508221','elviraroch@gmail.com','',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (8,1,2,'20045701','Flor','Camposano','Rosales','1980/03/12',
						'2016/02/27','Jr. Tacna 109','980230119','4508221','florcaro@gmail.com','',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (9,2,2,'13045113','Mercedes','Durand','Bautista','1977/08/20',
						'2016/02/27','Jr. Amazonas 417','980230119','4508221','mercedesduba@gmail.com','',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (10,2,2,'19041143','Angela','Sebastian','Gonzales','1985/02/12',
						'2016/02/27','Jr. Amazonas 199','980230119','4508221','angelasego@gmail.com','',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (11,1,2,'13455743','Sandra','Alvarez','Quispe','1976/08/08',
						'2016/02/27','Jr. Loreto 177','980230119','4508221','sandraalqu@gmail.com','',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (12,1,2,'16045747','Angélica','Abad','Carbajal','1986/12/25',
						'2016/02/27','Jr. Apurimac 422','980230119','4508221','angelicaabca@gmail.com','',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (13,2,2,'10849743','Camila','Contreras','Zapata','1982/09/01',
						'2016/02/27','Jr. Amazonas 347','980230119','4508221','camilacoza@gmail.com','',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (14,2,2,'13149743','Adriana','Cabezas','Salgado','1982/11/01',
						'2016/02/27','Jr. Amazonas 197','980230119','4508221','adrianacasa@gmail.com','',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (15,2,2,'10867741','Daniela','Huaman','Salcedo','1982/03/03',
						'2016/02/27','Jr. Amazonas 677','980230119','4508221','danielahusa@gmail.com','',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (16,1,2,'10841640','Cecilia','Portilla','Tamariz','1974/01/19',
						'2016/02/27','Jr. Tacna 347','980230119','4508221','ceciliapota@gmail.com','',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (17,2,2,'13844143','Carla','Franco','Contreras','1985/09/07',
						'2016/02/27','Jr. Amazonas 687','980230119','4508221','carlafrco@gmail.com','',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (18,2,2,'19249740','Ana María','Pirco','Pacheco','1980/09/04',
						'2016/02/27','Jr. Amazonas 874','980230119','4508221','anapipa@gmail.com','',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (19,2,2,'14879783','Elena','Nuñez','Vargas','1982/03/11',
						'2016/02/27','Jr. Amazonas 680','980230119','4508221','elenanuva@gmail.com','',1);
 insert into tb_apoderado(idApoderado,idDistrito,idGenero,dni,nombre,apePat,apeMat,fecNac,
							fecIngreso,direccion,telfMovil,telfFijo,email,observacion,estado)
                            values (20,1,2,'10808797','Susana','Quispe','Barreto','1980/09/01',
						'2016/02/27','Jr. Ica 347','980230119','4508221','susanaquba@gmail.com','',1);
-- --------------------------------------------------
-- tb_estudiante;
select * from tb_estudiante;
-- ---------------------------------------------------
-- -- Ingresar a los estudiantes
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
						values (01, 1, 8,2,'20740801','Zoe Isabella','Alejo','Huaranca',null,'2016/03/02','2009/6/02','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (02, 2, 9,1,'20740802','Mateo Salvador','Aparicio','Rivera',null,'2016/02/25','2009/03/18','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (03, 3,10,1,'20740803','Adriano José','Berrio','Herrera',null,'2016/02/25','2009/03/18','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (04, 4,11,2,'20740804','Domenika','Bravo','Gonzales',null,'2016/02/25','2009/03/18','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (05, 5,12,1,'20740805','Víctor David','Cardenas','Bellido',null,'2016/02/25','2009/03/18','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (06, 6,13,1,'20740806','Axel Mathias','Chile','Pajuelo',null,'2016/02/25','2009/04/18','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (07, 7,14,2,'20740807','Adriana Sofía','Córdova','Román',null,'2016/02/25','2009/05/18','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (08, 8,15,1,'20740808','Adrian Fabrisio','Curo','Camposano',null,'2016/02/25','2009/06/18','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (09, 9,16,2,'20740809','Ariana','Gaona','Durand',null,'2016/02/25','2009/03/05','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (10,10,17,1,'20740810','Alesandro Piero','García','Sebastián',null,'2016/02/25','2009/03/10','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (11,11,18,1,'20740811','Jhair','Gavidia','Alvarez',null,'2016/02/25','2009/04/11','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (12,12,19,1,'20740812','Javier','Huamanñahui','Abad',null,'2016/02/25','2009/07/01','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (13,13,20,2,'20740813','Camila Valentina','Lago','Contreras',null,'2016/02/25','2009/06/28','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (14,14,21,2,'20740814','Luana','León','Cabezas',null,'2016/02/25','2009/01/11','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (15,15,22,2,'20740815','Ana Paula','Miranda','Huamán',null,'2016/02/25','2009/02/15','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (16,16,23,1,'20740816','Andrew','Pianto','Portilla',null,'2016/02/25','2009/03/01','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (17,17,24,2,'20740817','Tatiana','Prado','Franco',null,'2016/02/25','2009/03/11','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (18,18,25,1,'20740818','Roy David Leonardo','Sotomayor','Pirgo',null,'2016/02/25','2009/03/16','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (19,19,26,2,'20740819','Eymi Lee','Villanueva','Nuñez',null,'2016/02/25','2009/03/22','',1);
insert into tb_estudiante (idEstudiante,idApoderado,idUsuario,idGenero,dniEstudiante,nombre,
							apePat,apeMat,fotoEstudiante,fecIngreso,fecNac,observacion,estadoEstudiante)
                            values (20,20,27,2,'20740820','Mayra Ximena','Zapata','Quispe',null,'2016/02/25','2009/04/19','',1);
-- ------------------------------------------------------
-- tb_grado;
select * from tb_grado;
-- ---------------------------------------------------
-- ingresar a los grados
insert into tb_grado values ( 1,"Inicial II");
insert into tb_grado values ( 2,"Inicial III");
insert into tb_grado values ( 3,"Inicial IV");
insert into tb_grado values ( 4,"Inicial V");
insert into tb_grado values ( 5,"1ro Primaria");
insert into tb_grado values ( 6,"2do Primaria");
insert into tb_grado values ( 7,"3er Primaria");
insert into tb_grado values ( 8,"4to Primaria");
insert into tb_grado values ( 9,"5to Primaria");
insert into tb_grado values (10,"6to Primaria");
insert into tb_grado values (11,"1ro Secundaria");
insert into tb_grado values (12,"2do Secundaria");
insert into tb_grado values (13,"3ro Secundaria");
insert into tb_grado values (14,"4to Secundaria");
insert into tb_grado values (15,"5to Secundaria");
-- ------------------------------------------------------
-- tb_sección;
select * from tb_seccion;
-- ---------------------------------------------------
-- ingresar las secciones
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values ( 1, 1,'2019/01/15',"Inicial IIA - 2019");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values ( 2, 2,'2019/01/15',"Inicial IIIA - 2019");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values ( 3, 2,'2019/01/15',"Inicial IIIB - 2019");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values ( 4, 3,'2019/01/15',"Inicial IVA - 2019");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values ( 5, 3,'2019/01/15',"Inicial IVB - 2019");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values ( 6, 4,'2019/01/15',"Inicial VA - 2019");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values ( 7, 4,'2019/01/15',"Inicial VB - 2019");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values ( 8, 5,'2019/01/15',"1ro A - Prim - 2019");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values ( 9, 6,'2019/01/15',"2do A - Prim - 2019");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (10, 7,'2019/01/15',"3ro A - Prim - 2019");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (11, 8,'2019/01/15',"4to A - Prim - 2019");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (12, 9,'2019/01/15',"5to A - Prim - 2019");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (13,10,'2019/01/15',"6to A - Prim - 2019");
-- ingresar las 2020
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (14, 1,'2020/01/15',"Inicial IIA - 2020");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (15, 2,'2020/01/15',"Inicial IIIA - 2020");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (16, 2,'2020/01/15',"Inicial IIIB - 2020");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (17, 3,'2020/01/15',"Inicial IVA - 2020");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (18, 3,'2020/01/15',"Inicial IVB - 2020");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (19, 4,'2020/01/15',"Inicial VA - 2020");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (20, 4,'2020/01/15',"Inicial VB - 2020");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (21, 5,'2020/01/15',"1ro A - Prim - 2020");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion)values (22, 6,'2020/01/15',"2do A - Prim - 2020");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (23, 7,'2020/01/15',"3ro A - Prim - 2020");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (24, 8,'2020/01/15',"4to A - Prim - 2020");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (25, 9,'2020/01/15',"5to A - Prim - 2020");
insert into tb_seccion (idSeccion,idGrado,fechaCreacion,desSeccion) values (26,10,'2020/01/15',"6to A - Prim - 2020");
-- ------------------------------------------------------
-- tb_curso;
select * from tb_curso;
-- ---------------------------------------------------
insert into tb_curso values (1,"Comunicación",1);
insert into tb_curso values (2,"Matemática",1);
insert into tb_curso values (3,"Personal Social",1);
insert into tb_curso values (4,"Ciencia y Tecnología",1);
insert into tb_curso values (5,"Inglés",1);
insert into tb_curso values (6,"Computación",1);
insert into tb_curso values (7,"Educación Religiosa",1);
insert into tb_curso values (8,"Arte y Cultura",1);
insert into tb_curso values (9,"Educación Física",1);
-- ------------------------------------------------------
-- tb_curso;
select * from tb_curso_seccion;
select idCurso,idSeccion,idDocente from tb_curso_seccion;
select tb_seccion.desSeccion,tb_curso.descripcion,tb_docente.nombre,tb_docente.apepat from tb_curso_seccion
			inner join tb_seccion on tb_curso_seccion.idSeccion = tb_seccion.idSeccion
            inner join tb_curso on tb_curso_seccion.idCurso = tb_curso.idCurso
            inner join tb_docente on tb_curso_seccion.idDocente = tb_docente.idDocente
            where tb_docente.idDocente=6;
-- ---------------------------------------------------
insert into tb_curso_seccion values (1,10,6,'2019/01/15');
insert into tb_curso_seccion values (2,10,5,'2019/01/15');
insert into tb_curso_seccion values (3,10,5,'2019/01/15');
insert into tb_curso_seccion values (4,10,5,'2019/01/15');
insert into tb_curso_seccion values (5,10,5,'2019/01/15');
insert into tb_curso_seccion values (6,10,1,'2019/01/15');
insert into tb_curso_seccion values (7,10,5,'2019/01/15');
insert into tb_curso_seccion values (8,10,5,'2019/01/15');
insert into tb_curso_seccion values (9,10,3,'2019/01/15');
-- -----
insert into tb_curso_seccion values (1,11,6,'2019/01/15');
insert into tb_curso_seccion values (2,11,6,'2019/01/15');
insert into tb_curso_seccion values (3,11,6,'2019/01/15');
insert into tb_curso_seccion values (4,11,6,'2019/01/15');
insert into tb_curso_seccion values (5,11,6,'2019/01/15');
insert into tb_curso_seccion values (6,11,1,'2019/01/15');
insert into tb_curso_seccion values (7,11,6,'2019/01/15');
insert into tb_curso_seccion values (8,11,6,'2019/01/15');
insert into tb_curso_seccion values (9,11,3,'2019/01/15');

-- ------------------------------------------------------
-- tb_matricula;
select * from tb_matricula;
select tb_seccion.desSeccion,concat(tb_estudiante.nombre,' ',tb_estudiante.apePat) as 'Estudiante',fecMatricula from tb_matricula
			inner join tb_seccion on tb_seccion.idSeccion = tb_matricula.idSeccion
            inner join tb_estudiante on tb_estudiante.idEstudiante = tb_matricula.idEstudiante
            where tb_seccion.idSeccion = 24;
-- ---------------------------------------------------
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10, 1,'2019/2/11');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10, 2,'2019/2/11');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10, 3,'2019/2/12');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10, 4,'2019/2/13');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10, 5,'2019/2/13');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10, 6,'2019/2/14');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10, 7,'2019/2/14');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10, 8,'2019/2/14');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10, 9,'2019/2/15');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10,10,'2019/2/15');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10,11,'2019/2/18');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10,12,'2019/2/18');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10,13,'2019/2/18');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10,14,'2019/2/19');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10,15,'2019/2/21');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10,16,'2019/2/21');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10,17,'2019/2/21');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10,18,'2019/2/24');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10,19,'2019/2/25');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (10,20,'2019/2/26');

insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (24, 1,'2020/1/11');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (24, 2,'2020/1/11');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (24, 3,'2020/1/12');
insert into tb_matricula (idSeccion,idEstudiante,fecMatricula) values (24, 4,'2020/1/13');
-- insert into tb_matricula values (24, 5,'2020/2/13');
-- insert into tb_matricula values (24, 6,'2020/2/14');
-- insert into tb_matricula values (24, 7,'2020/2/14');
-- insert into tb_matricula values (24, 8,'2020/2/14');
-- insert into tb_matricula values (24, 9,'2020/2/15');
-- insert into tb_matricula values (24,10,'2020/2/15');
-- insert into tb_matricula values (24,11,'2020/2/18');
-- insert into tb_matricula values (24,12,'2020/2/18');
-- insert into tb_matricula values (24,13,'2020/2/18');
-- insert into tb_matricula values (24,14,'2020/2/19');
-- insert into tb_matricula values (24,15,'2020/2/21');
-- insert into tb_matricula values (24,16,'2020/2/21');
-- insert into tb_matricula values (24,17,'2020/2/21');

-- ------------------------------------------------------
-- tb_unidad;

