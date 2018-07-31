/*****************************************************************/
/****************** UNIVERSIDAD DE CARABOBO **********************/
/********* FACULTAD EXPERIMENTAL DE CIENCIAS Y TECNOLOGIA ********/
/*************** DEPARTAMENTO DE COMPUTACIÓN *********************/
/************* BASE DE DATOS - PROYECTO 1-2017 *******************/

/************ SCRIPT DE CREACIÓN DE LA BASE DE DATOS *************/
/************** Y DESCRIPCIÓN DEL DISEÑO FISICO ******************/


/********** Gabriel López    *****/
/********** Gabriel Oliveira *****/
/********** Moisés Mendoza   *****/
/********** Jhon Coello      *****/



/************* CREACION DE LA BASE DE DATOS "proyecto" ***********/

CREATE DATABASE proyecto TEMPLATE template1;

/***************** CONECTANDOSE A LA BASE DE DATOS ***************/
\c proyecto

/********************** CREACION DEL ESQUEMA *********************/
CREATE SCHEMA a;

/*********** ESTABLECIENDO CONFIGURACION DEL TIPO DATE ***********/

SET DATESTYLE TO EUROPEAN, SQL;


/********************** CREACION DE DOMINIOS *********************/

CREATE DOMAIN a.t_usuario VARCHAR(18)
	CHECK (VALUE IN('Cliente', 'Particular', 'Cliente_Particular'));

CREATE DOMAIN a.e_civil VARCHAR(11)
	CHECK (VALUE IN('Soltero', 'Casado', 'Viudo', 'Divorciado', 'Concubinato'));

CREATE DOMAIN a.t_hospedaje VARCHAR(10)
	CHECK (VALUE IN('Hotel', 'Posada', 'Residencia', 'Campamento'));

CREATE DOMAIN a.hosp_clasif VARCHAR(9)
	CHECK (VALUE IN('Economica', 'De_Lujo', 'No_Aplica'))
	DEFAULT 'No_Aplica';

CREATE DOMAIN a.n_estrellas VARCHAR(9)
	CHECK (VALUE IN('1', '2', '3', '4', '5', 'No_Aplica'))
	DEFAULT 'No_Aplica';

CREATE DOMAIN a.t_posada VARCHAR(11)
	CHECK (VALUE IN('Cabaña', 'Casa', 'Apartamento', 'No_Aplica'))
	DEFAULT 'No_Aplica';

CREATE DOMAIN a.t_linea VARCHAR(9)
	CHECK (VALUE IN('Aerolinea', 'Taxi', 'Autobús', 'Ferry', 'Lancha'));

CREATE DOMAIN a.t_descripcion VARCHAR(14)
	CHECK (VALUE IN('Desc_Natural', 'Desc_Historica', 'Anecdota', 'Leyenda'));

CREATE DOMAIN a.cadena_15 VARCHAR(15);

CREATE DOMAIN a.cadena_30 VARCHAR(30);

CREATE DOMAIN a.cadena_60 VARCHAR(60);

CREATE DOMAIN a.cadena_100 VARCHAR(100);

CREATE DOMAIN a.cadena_250 VARCHAR(250);

CREATE DOMAIN a.cadena_500 VARCHAR(500);

CREATE DOMAIN a.cadena_3000 VARCHAR(3000);

CREATE DOMAIN a.dominio_costo NUMERIC
	CHECK (VALUE >= 0.00);

CREATE DOMAIN a.entero_positivo INT
	CHECK (VALUE >= 0);

CREATE DOMAIN a.dominio_tlf VARCHAR(11);

CREATE DOMAIN a.dominio_rif VARCHAR(12);

CREATE DOMAIN a.ced_pasaporte INT
	CHECK (VALUE < 99999999);

/*****************************************************************/
/*********************** CREACION DE TABLAS **********************/
/*---------------------------------------------------------------*/
/*-------------------------- ENTIDADES --------------------------*/
/*---------------------------------------------------------------*/
CREATE TABLE a.Usuario(
	cedula_pasaporte	a.ced_pasaporte 	PRIMARY KEY,
	nombre_usuario		a.cadena_15			NOT NULL  UNIQUE,
	contrasenia			a.cadena_30			NOT NULL,
	correo				a.cadena_60			NOT NULL  UNIQUE,
	nombre				a.cadena_60			NOT NULL,
	edo_civil			a.e_civil,
	pais_origen			a.cadena_30,
	estado				a.cadena_15,
	ciudad				a.cadena_15,
	fecha_nacimiento	DATE,
	nacionalidad		a.cadena_30,

	tipo_usuario		a.t_usuario			NOT NULL
);

CREATE TABLE a.Destino_turistico(
	nombre_destino		a.cadena_60			PRIMARY KEY
);

CREATE TABLE a.Hospedaje(
	direccion			a.cadena_250,
	RIF					a.dominio_rif,
	nombre_destino		a.cadena_60	,
	num_estrellas		a.n_estrellas,
	tipo_habitacion		a.cadena_3000		DEFAULT 'No_Aplica',
	clasificacion		a.hosp_clasif,
	nro_habitacion		a.entero_positivo,
	tipo_posada			a.t_posada,
	costo				a.dominio_costo		NOT NULL,
	tipo_hospedaje		a.t_hospedaje		NOT NULL,

	PRIMARY KEY (direccion, RIF),

	FOREIGN KEY (nombre_destino) REFERENCES a.Destino_turistico
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Programa_turistico(
	nombre_destino	a.cadena_60,
	descripcion		a.cadena_250,
	costo			a.dominio_costo			NOT NULL,

	PRIMARY KEY (nombre_destino, descripcion),

	FOREIGN KEY (nombre_destino) REFERENCES a.Destino_turistico
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Plan_transporte(
	codigo				a.entero_positivo	PRIMARY KEY,
	descripcion_plan	a.cadena_500		NOT NULL,
	costo_plan			a.dominio_costo		NOT NULL
);

CREATE TABLE a.Ruta(
	origen				a.cadena_30,
	destino				a.cadena_30,
	distancia			a.entero_positivo	NOT NULL,
	PRIMARY KEY (origen, destino)
);

CREATE TABLE a.Linea_transporte(
	RIF_linea		a.dominio_rif	PRIMARY KEY,
	nombre_linea	a.cadena_60		NOT NULL,
	tipo_linea		a.t_linea		NOT NULL,
	correo_linea	a.cadena_60		NOT NULL
);

CREATE TABLE a.Contacto_usuario(
	cedula_pasaporte	a.ced_pasaporte,
	telefono_usuario	a.dominio_tlf,

	PRIMARY KEY (cedula_pasaporte, telefono_usuario),

	FOREIGN KEY (cedula_pasaporte) REFERENCES a.Usuario
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Familiar(
	cedula_pasaporte			a.ced_pasaporte,
	nombre						a.cadena_60,
	fecha_nacimiento			DATE,
	cedula_pasaporte_fam		a.ced_pasaporte,

	PRIMARY KEY (cedula_pasaporte, nombre, fecha_nacimiento),

	FOREIGN KEY (cedula_pasaporte) REFERENCES a.Usuario
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Experiencia_hospedaje(
	direccion			a.cadena_250,
	RIF					a.dominio_tlf,
	cedula_pasaporte	a.ced_pasaporte,
	nota_experiencia	a.cadena_250		NOT NULL,

	PRIMARY KEY (direccion, RIF, cedula_pasaporte),

	FOREIGN KEY (direccion, RIF) REFERENCES a.Hospedaje
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	FOREIGN KEY (cedula_pasaporte) REFERENCES a.Usuario
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Experiencia_programa(
	cedula_pasaporte	a.ced_pasaporte,
	descripcion			a.cadena_250,
	nombre_destino		a.cadena_60,
	nota_experiencia	a.cadena_250		NOT NULL,

	PRIMARY KEY (cedula_pasaporte, descripcion, nombre_destino),

	FOREIGN KEY (cedula_pasaporte) REFERENCES a.Usuario
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	FOREIGN KEY (descripcion, nombre_destino) REFERENCES a.Programa_turistico
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Experiencia_transporte(
	cedula_pasaporte	a.ced_pasaporte,
	codigo				a.entero_positivo,
	nota_experiencia	a.cadena_250		NOT NULL,

	PRIMARY KEY (cedula_pasaporte, codigo),

	FOREIGN KEY (cedula_pasaporte) REFERENCES a.Usuario
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	FOREIGN KEY (codigo) REFERENCES a.Plan_transporte
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Contacto_linea(
	RIF_linea		a.dominio_rif,
	telefono_linea	a.dominio_tlf	NOT NULL,

	PRIMARY KEY(RIF_linea,telefono_linea),

	FOREIGN KEY (RIF_linea) REFERENCES a.Linea_transporte
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Descripcion_destino(
	nombre_destino		a.cadena_60,
	tipo_descripcion	a.t_descripcion,
	texto				a.cadena_3000,

	PRIMARY KEY (nombre_destino, tipo_descripcion, texto),

	FOREIGN KEY (nombre_destino) REFERENCES a.Destino_turistico
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Actividad_destino(
	nombre_destino	a.cadena_60,
	actividades		a.cadena_500,

	PRIMARY KEY (nombre_destino, actividades),

	FOREIGN KEY (nombre_destino) REFERENCES a.Destino_turistico
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Local_destino(
	nombre_destino	a.cadena_60,
	locales			a.cadena_500,

	PRIMARY KEY (nombre_destino, locales),

	FOREIGN KEY (nombre_destino) REFERENCES a.Destino_turistico
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Sitios_famosos_destino(
	nombre_destino	a.cadena_60,
	sitios_famosos	a.cadena_100,

	PRIMARY KEY (nombre_destino, sitios_famosos),

	FOREIGN KEY (nombre_destino) REFERENCES a.Destino_turistico
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Ciudad_destino(
	nombre_destino	a.cadena_60,
	ciudades		a.cadena_15,

	PRIMARY KEY (nombre_destino, ciudades),

	FOREIGN KEY (nombre_destino) REFERENCES a.Destino_turistico
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Fotos_destino(
	nombre_destino	a.cadena_60,
	fotos			a.cadena_60,

	PRIMARY KEY (nombre_destino, fotos),

	FOREIGN KEY (nombre_destino) REFERENCES a.Destino_turistico
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Contacto_hospedaje(
	direccion		a.cadena_250,
	RIF				a.dominio_rif,
	telefono_hosp	a.dominio_tlf,

	PRIMARY KEY (direccion, RIF, telefono_hosp),

	FOREIGN KEY (direccion, RIF) REFERENCES a.Hospedaje
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Serv_habitacion(
	direccion				a.cadena_250,
	RIF						a.dominio_rif,
	servicios_habitacion	a.cadena_30,

	PRIMARY KEY (direccion, RIF, servicios_habitacion),

	FOREIGN KEY (direccion, RIF) REFERENCES a.Hospedaje
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Requisito_residencia(
	direccion		a.cadena_250,
	RIF				a.dominio_rif,
	requisitos		a.cadena_100,

	PRIMARY KEY (direccion, RIF, requisitos),

	FOREIGN KEY (direccion, RIF) REFERENCES a.Hospedaje
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Servicio_hospedaje(
	direccion				a.cadena_250,
	RIF						a.dominio_rif,
	servicios_generales		a.cadena_100,

	PRIMARY KEY (direccion, RIF, servicios_generales),

	FOREIGN KEY (direccion, RIF) REFERENCES a.Hospedaje
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

/*---------------------------------------------------------------*/
/*----------------------- INTERRELACIONES -----------------------*/
/*---------------------------------------------------------------*/
CREATE TABLE a.Compra(
	cedula_pasaporte	a.ced_pasaporte,
	nombre_destino		a.cadena_60,
	descripcion			a.cadena_250,
	costo_programa		a.dominio_costo		NOT NULL,

	PRIMARY KEY (cedula_pasaporte, nombre_destino, descripcion),

	FOREIGN KEY (cedula_pasaporte) REFERENCES a.Usuario
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	FOREIGN KEY (nombre_destino, descripcion) REFERENCES a.Programa_turistico
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Viaja_a(
	cedula_pasaporte	a.ced_pasaporte,
	nombre_destino		a.cadena_60,

	FOREIGN KEY (cedula_pasaporte) REFERENCES a.Usuario
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	FOREIGN KEY (nombre_destino) REFERENCES a.Destino_turistico
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Reserva(
	cedula_pasaporte	a.ced_pasaporte,
	direccion			a.cadena_250,
	RIF					a.dominio_rif,
	costo_total			a.dominio_costo		NOT NULL,

	PRIMARY KEY (cedula_pasaporte, direccion, RIF),

	FOREIGN KEY (cedula_pasaporte) REFERENCES a.Usuario
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	FOREIGN KEY (direccion, RIF) REFERENCES a.Hospedaje
		ON UPDATE CASCADE
		ON DELETE CASCADE
);


CREATE TABLE a.Suscribe(
	cedula_pasaporte	a.ced_pasaporte,
	direccion			a.cadena_250,
	RIF					a.dominio_rif,

	PRIMARY KEY (cedula_pasaporte, direccion, RIF),

	FOREIGN KEY (cedula_pasaporte) REFERENCES a.Usuario
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	FOREIGN KEY (direccion, RIF) REFERENCES a.Hospedaje
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Solicita(
	cedula_pasaporte	a.ced_pasaporte,
	codigo				a.entero_positivo,
	fecha_reservacion	DATE				NOT NULL,
	costo_total			a.dominio_costo		NOT NULL,

	PRIMARY KEY (cedula_pasaporte, codigo),

	FOREIGN KEY (cedula_pasaporte) REFERENCES a.Usuario
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	FOREIGN KEY (codigo) REFERENCES a.Plan_transporte
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Dispone_de(
	codigo		a.entero_positivo,
	origen		a.cadena_30,
	destino		a.cadena_30,

	PRIMARY KEY (codigo, origen, destino),

	FOREIGN KEY (codigo) REFERENCES a.Plan_transporte
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	FOREIGN KEY (origen, destino) REFERENCES a.Ruta
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE a.Ofrece(
	origen				a.cadena_30,
	destino				a.cadena_30,
	RIF_linea			a.dominio_rif,
	codigo_viaje		a.entero_positivo	NOT NULL,
	fecha_salida		DATE				NOT NULL,
	hora_salida			TIME				NOT NULL,
	costo_pasaje		a.dominio_costo		NOT NULL,
	cupos_ofrecidos		a.entero_positivo	NOT NULL,
	responsable			a.cadena_60			NOT NULL,
	id_unidad			a.cadena_15			NOT NULL,

	PRIMARY KEY (origen, destino, RIF_linea),

	FOREIGN KEY (origen, destino) REFERENCES a.Ruta
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	FOREIGN KEY (RIF_linea) REFERENCES a.Linea_transporte
		ON UPDATE CASCADE
		ON DELETE CASCADE
);


/*---------------------------------------------------------------*/
/*------------------ CREACION DE ROLES --------------------------*/
/*---------------------------------------------------------------*/

CREATE ROLE admin LOGIN;
CREATE ROLE guest;

/*---------------------------------------------------------------*/
/*------------ OTORGAMIENTO DE PRIVILEGIOS A ROLES --------------*/
/*---------------------------------------------------------------*/


GRANT ALL PRIVILEGES 	ON DATABASE proyecto  	  TO admin;
GRANT ALL PRIVILEGES	ON SCHEMA a 			  TO admin;
GRANT ALL PRIVILEGES 	ON ALL TABLES IN SCHEMA a TO admin;

GRANT ALL 		ON SCHEMA a TO guest;
GRANT SELECT 	ON ALL TABLES IN SCHEMA a TO guest;


/*---------------------------------------------------------------*/
/*----------------- CREACION DE USUARIOS ------------------------*/
/*---------------------------------------------------------------*/

CREATE USER etovar 		IN ROLE admin PASSWORD '123456';
CREATE USER jcohello	IN ROLE admin PASSWORD '123456';
CREATE USER glopez 		IN ROLE admin PASSWORD '123456';
CREATE USER moisesm 	IN ROLE admin PASSWORD '123456';
CREATE USER goliveira 	IN ROLE admin PASSWORD '123456';
CREATE USER perezjuan 	IN ROLE guest PASSWORD '123456';
