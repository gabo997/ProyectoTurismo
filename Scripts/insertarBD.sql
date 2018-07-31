/*****************************************************************/
/****************** UNIVERSIDAD DE CARABOBO **********************/
/********* FACULTAD EXPERIMENTAL DE CIENCIAS Y TECNOLOGIA ********/
/*************** DEPARTAMENTO DE COMPUTACIÓN *********************/
/************* BASE DE DATOS - PROYECTO 1-2017 *******************/

/************ SCRIPT DE INSERCIÓN DE LA BASE DE DATOS ************/

/********** Gabriel López    *****/
/********** Gabriel Oliveira *****/
/********** Moisés Mendoza   *****/
/********** Jhon Coello      *****/



/* Inserción de los D.T con los que la empresa trabajara inicialmente y sus ciudades*/

insert into a.Destino_turistico values ('Margarita');
insert into a.Destino_turistico values ('Los Roques');
insert into a.Destino_turistico values ('Canaima');
insert into a.Destino_turistico values ('Los Andes');

insert into a.Ciudad_destino values ('Los Andes', 'Merida');
insert into a.Ciudad_destino values ('Los Andes', 'Tachira');
insert into a.Ciudad_destino values ('Los Andes', 'Trujillo');
insert into a.Ciudad_destino values ('Los Andes', 'Barinas');

---*Insercion de Usuarios clientes*

insert into a.Usuario values ('1111111', 'aaa1', '12345','aaa1@gmail.com','Angely Blanco', 'Casado', 'Colombia', 'Carabobo', 'Valencia', now(), 'Venezolana', 'Cliente');
insert into a.Usuario values ('2222222', 'aaa2', '12345','aaa2@gmail.com','Karla Tovar', 'Casado', 'Venezuela', 'Carabobo', 'Valencia', now(), 'Venezolana', 'Cliente');
insert into a.Usuario values ('3333333', 'aaa3', '12345','aaa3@gmail.com','Maria Tovar', 'Casado', 'Venezuela', 'Carabobo', 'Valencia', now(), 'Venezolana', 'Cliente');
insert into a.Usuario values ('4444444', 'aaa4', '12345','aaa4@gmail.com','Eugenia Tovar', 'Casado', 'Venezuela', 'Carabobo', 'Valencia', now(), 'Venezolana', 'Cliente');
insert into a.Usuario values ('5555555', 'aaa5', '12345','aaa5@gmail.com','Ana Tovar', 'Casado', 'Venezuela', 'Carabobo', 'Valencia', now(), 'Venezolana', 'Cliente');

--Insercion de particulares

insert into a.Usuario(cedula_pasaporte, nombre, nombre_usuario, contrasenia, correo, tipo_usuario) values ('9000000', 'Massiel Almeida', 'mavdq', '12345', 'ma@gmail.com','Particular');
insert into a.Usuario(cedula_pasaporte, nombre, nombre_usuario, contrasenia, correo,tipo_usuario) values ('9000001', 'Fabiola Alvarado','favdq', '12345',  'fa@gmail.com','Particular');
insert into a.Usuario(cedula_pasaporte, nombre, nombre_usuario, contrasenia, correo,tipo_usuario) values ('9000002', 'Genesis Pacheco', 'gpvdq', '12345', 'gp@gmail.com','Particular');
insert into a.Usuario(cedula_pasaporte, nombre, nombre_usuario, contrasenia, correo,tipo_usuario) values ('9000003', 'Maria Mosqueda', 'mmvdq', '12345', 'mm@gmail.com','Particular');
insert into a.Usuario(cedula_pasaporte, nombre, nombre_usuario, contrasenia, correo, tipo_usuario) values ('9000004', 'Gabriela Montenegro', 'gmvdq', '12345', 'gm@gmail.com','Particular'); 


--*Lineas de transporte*

insert into a.Linea_transporte values('V500000000','Conviasa', 'Aerolinea', 'conv@gmail.com');
insert into a.Linea_transporte values('V500000001', 'Global taxi', 'Taxi','globaltx@gmail.com');
insert into a.Linea_transporte values('V500000002','Primera Plus', 'Autobús', 'pplus@gmail.com');
insert into a.Linea_transporte values('V500000003','Navibus', 'Ferry', 'navbus@gmail.com');
insert into a.Linea_transporte values('V500000004','Lanchas Vzla', 'Lancha', 'lanchgmail.com');

--*Rutas*
insert into a.Ruta values ('Valencia','Porlamar', 1000);
insert into a.Ruta values ('Big Low','terminal Oriente Pto La Cruz', 900);
insert into a.Ruta values ('terminal Oriente Pto La Cruz', 'terminal Conferri Margarita', 50);
insert into a.Ruta values ('Valencia', 'Cumana', 1000);
insert into a.Ruta values ('Cumana','Margarita', 300);
insert into a.Ruta values ('Valencia','terminal Caracas', 500);
insert into a.Ruta values ('terminal Caracas', 'Los Roques', 100);
insert into a.Ruta values ('Valencia','terminal Bolivar', 2000);
insert into a.Ruta values ('terminal Bolivar', 'Canaima', 200);
insert into a.Ruta values ('Valencia', 'Merida', 1000);



--*Inserción de Hospedajes*

--*Hoteles*

insert into a.Hospedaje(direccion, RIF, nombre_destino, num_estrellas, tipo_habitacion, costo, tipo_hospedaje) values ('Valle de Pedro Gonzalez',
'V000000001', 'Margarita', '5', 'Doble Deluxe', 1000000, 'Hotel');
insert into a.Hospedaje(direccion, RIF, nombre_destino, num_estrellas, tipo_habitacion, costo, tipo_hospedaje) values ('El Vigia',
'V000000002', 'Los Andes', '4', 'Simple', 400000, 'Hotel');
insert into a.Hospedaje(direccion, RIF, nombre_destino, num_estrellas, tipo_habitacion, costo, tipo_hospedaje) values ('Sabaneta',
'V000000003', 'Los Andes', '1', 'Simple', 100000, 'Hotel');
insert into a.Hospedaje(direccion, RIF, nombre_destino, num_estrellas, tipo_habitacion, costo, tipo_hospedaje) values ('El Gran Roque',
'V000000004', 'Los Roques', '5', 'Suite', 900000, 'Hotel');

--*Servicios y contactos de  Hoteles*

insert into a.Serv_habitacion values ('Valle de Pedro Gonzalez', 'V000000001', '1 cama doble grande');
insert into a.Contacto_hospedaje values ('Valle de Pedro Gonzalez', 'V000000001', '02410000001');
insert into a.Servicio_hospedaje values ('Valle de Pedro Gonzalez', 'V000000001', 'Bar');

insert into a.Serv_habitacion values ('El Vigia', 'V000000002', 'baño');
insert into a.Contacto_hospedaje values ('El Vigia', 'V000000002', '02410000002');
insert into a.Servicio_hospedaje values ('El Vigia', 'V000000002', 'Alimentos y bebidas');
insert into a.Serv_habitacion values ('Sabaneta','V000000003', 'cama');
insert into a.Contacto_hospedaje values ('Sabaneta', 'V000000003', '02410000003');
insert into a.Servicio_hospedaje values ('Sabaneta', 'V000000003', 'baño');

insert into a.Serv_habitacion values ('El Gran Roque','V000000004', 'TV');
insert into a.Contacto_hospedaje values ('El Gran Roque', 'V000000004', '02410000004');
insert into a.Servicio_hospedaje values ('El Gran Roque', 'V000000004', 'Spa');


-- *Residencias*

--Insercion de residencias	
insert into a.Hospedaje(direccion, RIF, nombre_destino,costo, tipo_hospedaje) values ('Conjunto resdencial Canaima', 'V000000010', 'Canaima', 200000, 'Residencia');
insert into a.Hospedaje(direccion, RIF, nombre_destino,costo, tipo_hospedaje) values ('Avenida Marcano, Porlamar 6301 Nueva Esparta', 'V000000020', 'Margarita', 200000, 'Residencia');
insert into a.Hospedaje(direccion, RIF, nombre_destino,costo, tipo_hospedaje) values ('Porlamar, Nueva Esparta', 'V000000020', 'Margarita', 200000, 'Residencia');
insert into a.Hospedaje(direccion, RIF, nombre_destino,costo, tipo_hospedaje) values ('Las Trinitarias, Porlamar 6301, Nueva Esparta', 'V000000020', 'Margarita',300000, 'Residencia');
insert into a.Hospedaje(direccion, RIF, nombre_destino,costo, tipo_hospedaje) values ('Las Acacias, Porlamar 6301, Nueva Esparta', 'V000000020', 'Margarita', 300000, 'Residencia');
insert into a.Hospedaje(direccion, RIF, nombre_destino,costo, tipo_hospedaje) values ('Via Playa El Agua, a solo 3 minutos de Playa Parguito, Isla de Margarita, Edo. Nueva Esparta', 'V000000020', 'Margarita', 300000, 'Residencia');
insert into a.Hospedaje(direccion, RIF, nombre_destino,costo, tipo_hospedaje) values ('Pampatar 6316, Nueva Esparta', 'V000000020', 'Margarita', 400000, 'Residencia');
insert into a.Hospedaje(direccion, RIF, nombre_destino,costo, tipo_hospedaje) values ('Calle Suiza, Barinas 5201, Barinas', 'V000000030', 'Los Andes',400000, 'Residencia');
insert into a.Hospedaje(direccion, RIF, nombre_destino,costo, tipo_hospedaje) values ('Calle Kloster 5A, Barinas 5201, Barinas', 'V000000030', 'Los Andes',400000, 'Residencia');
insert into a.Hospedaje(direccion, RIF, nombre_destino,costo, tipo_hospedaje) values ('Conjunto Residencial Caroni, 133 Calle 4, Barinas 5201, Barinas', 'V000000030','Los Andes',500000, 'Residencia');
insert into a.Hospedaje(direccion, RIF, nombre_destino,costo, tipo_hospedaje) values ('Barinas 5201, Barinas', 'V000000040', 'Los Andes',350000, 'Residencia');
insert into a.Hospedaje(direccion, RIF, nombre_destino,costo, tipo_hospedaje) values ('Barinas 5301, Barinas', 'V000000040', 'Los Andes',350000, 'Residencia');

--Insercion en la correspondiente tabla Suscribe

insert into a.Suscribe values ('9000000', 'Conjunto resdencial Canaima', 'V000000010');
insert into a.Suscribe values ('9000001', 'Avenida Marcano, Porlamar 6301 Nueva Esparta' , 'V000000020');
insert into a.Suscribe values ('9000001', 'Porlamar, Nueva Esparta', 'V000000020');
insert into a.Suscribe values ('9000001', 'Las Trinitarias, Porlamar 6301, Nueva Esparta' , 'V000000020');
insert into a.Suscribe values ('9000001', 'Las Acacias, Porlamar 6301, Nueva Esparta', 'V000000020');
insert into a.Suscribe values ('9000001', 'Via Playa El Agua, a solo 3 minutos de Playa Parguito, Isla de Margarita, Edo. Nueva Esparta' , 'V000000020');
insert into a.Suscribe values ('9000001', 'Pampatar 6316, Nueva Esparta', 'V000000020');
insert into a.Suscribe values ('9000002', 'Calle Suiza, Barinas 5201, Barinas', 'V000000030');
insert into a.Suscribe values ('9000002', 'Calle Kloster 5A, Barinas 5201, Barinas', 'V000000030');
insert into a.Suscribe values ('9000002', 'Conjunto Residencial Caroni, 133 Calle 4, Barinas 5201, Barinas', 'V000000030');
insert into a.Suscribe values ('9000003', 'Barinas 5201, Barinas', 'V000000040');
insert into a.Suscribe values ('9000003', 'Barinas 5301, Barinas', 'V000000040');


--Inserción de los requisitos de la residencias

insert into a.Requisito_residencia values ('Conjunto resdencial Canaima', 'V000000010','solo para mujeres');
insert into a.Requisito_residencia values ('Avenida Marcano, Porlamar 6301 Nueva Esparta' , 'V000000020','solo para mujeres');
insert into a.Requisito_residencia values ('Porlamar, Nueva Esparta', 'V000000020','solo para mujeres');
insert into a.Requisito_residencia values ('Las Trinitarias, Porlamar 6301, Nueva Esparta' , 'V000000020','solo para mujeres');
insert into a.Requisito_residencia values ('Las Acacias, Porlamar 6301, Nueva Esparta', 'V000000020','solo para mujeres');
insert into a.Requisito_residencia values ('Via Playa El Agua, a solo 3 minutos de Playa Parguito, Isla de Margarita, Edo. Nueva Esparta' , 'V000000020','no se admiten mascotas');
insert into a.Requisito_residencia values ('Pampatar 6316, Nueva Esparta', 'V000000020',' no se admiten mascotas');
insert into a.Requisito_residencia values ('Calle Suiza, Barinas 5201, Barinas', 'V000000030', 'no se admiten mascotas');
insert into a.Requisito_residencia values ('Calle Kloster 5A, Barinas 5201, Barinas', 'V000000030','no se admiten mascotas');
insert into a.Requisito_residencia values ('Conjunto Residencial Caroni, 133 Calle 4, Barinas 5201, Barinas', 'V000000030','no se admiten mascotas');
insert into a.Requisito_residencia values ('Barinas 5201, Barinas', 'V000000040','no se admiten mascotas');
insert into a.Requisito_residencia values ('Barinas 5301, Barinas', 'V000000040','no se admiten mascotas');

--Inserción del contacto de las residencias

insert into a.Contacto_hospedaje values ('Conjunto resdencial Canaima', 'V000000010', '02410000005');
insert into a.Contacto_hospedaje values ('Avenida Marcano, Porlamar 6301 Nueva Esparta' , 'V000000020', '02410000006');
insert into a.Contacto_hospedaje values ('Porlamar, Nueva Esparta', 'V000000020', '02410000007');
insert into a.Contacto_hospedaje values ('Las Trinitarias, Porlamar 6301, Nueva Esparta' , 'V000000020', '02410000008');
insert into a.Contacto_hospedaje values ('Las Acacias, Porlamar 6301, Nueva Esparta', 'V000000020', '02410000009');
insert into a.Contacto_hospedaje values ('Via Playa El Agua, a solo 3 minutos de Playa Parguito, Isla de Margarita, Edo. Nueva Esparta' , 'V000000020', '02410000010');
insert into a.Contacto_hospedaje values ('Pampatar 6316, Nueva Esparta', 'V000000020', '02410000011');
insert into a.Contacto_hospedaje values ('Calle Suiza, Barinas 5201, Barinas', 'V000000030', '02410000012');
insert into a.Contacto_hospedaje values ('Calle Kloster 5A, Barinas 5201, Barinas', 'V000000030', '02410000013');
insert into a.Contacto_hospedaje values ('Conjunto Residencial Caroni, 133 Calle 4, Barinas 5201, Barinas', 'V000000030', '02410000014');
insert into a.Contacto_hospedaje values ('Barinas 5201, Barinas', 'V000000040','02410000015');
insert into a.Contacto_hospedaje values ('Barinas 5301, Barinas', 'V000000040','02410000016');

--Insercion de los servicios de las residencias

insert into a.Servicio_hospedaje values ('Conjunto resdencial Canaima', 'V000000010', 'Cocina');
insert into a.Servicio_hospedaje values ('Avenida Marcano, Porlamar 6301 Nueva Esparta' , 'V000000020', 'Cocina');
insert into a.Servicio_hospedaje values ('Porlamar, Nueva Esparta', 'V000000020', 'Cocina');
insert into a.Servicio_hospedaje values ('Las Trinitarias, Porlamar 6301, Nueva Esparta' , 'V000000020', 'Cocina');
insert into a.Servicio_hospedaje values ('Las Acacias, Porlamar 6301, Nueva Esparta', 'V000000020', 'Cocina');
insert into a.Servicio_hospedaje values ('Via Playa El Agua, a solo 3 minutos de Playa Parguito, Isla de Margarita, Edo. Nueva Esparta' , 'V000000020', 'Cocina');
insert into a.Servicio_hospedaje values ('Pampatar 6316, Nueva Esparta', 'V000000020', 'Cocina');
insert into a.Servicio_hospedaje values ('Calle Suiza, Barinas 5201, Barinas', 'V000000030', 'Cocina');
insert into a.Servicio_hospedaje values ('Calle Kloster 5A, Barinas 5201, Barinas', 'V000000030', 'Cocina');
insert into a.Servicio_hospedaje values ('Conjunto Residencial Caroni, 133 Calle 4, Barinas 5201, Barinas', 'V000000030', 'Cocina');
insert into a.Servicio_hospedaje values ('Barinas 5201, Barinas', 'V000000040', 'Cocina');
insert into a.Servicio_hospedaje values ('Barinas 5301, Barinas', 'V000000040', 'Cocina');


--*Que lineas cubren que rutas*
insert into a.Ofrece values ('Valencia','Porlamar', 'V500000001', 20, now(), '06:38:00', 100000, 20,'Juan A', '123450');
insert into a.Ofrece values ('Big Low','terminal Oriente Pto La Cruz', 'V500000001', 20, now(), '06:38:00', 100000, 21,'Juan F', '123451');
insert into a.Ofrece values ('terminal Oriente Pto La Cruz', 'terminal Conferri Margarita', 'V500000001', 22, now(), '06:38:00', 100000, 20,'Juan V', '123452');
insert into a.Ofrece values ('Valencia', 'Cumana', 'V500000001', 20, now(), '06:38:00', 100000, 23,'Juan B', '123453');
insert into a.Ofrece values ('Cumana','Margarita', 'V500000001', 20, now(), '06:38:00', 100000, 24,'Juan C', '123454');
insert into a.Ofrece values ('Valencia', 'Merida', 'V500000001', 20, now(), '06:38:00', 100000, 25,'Juan D', '123455');
insert into a.Ofrece values ('Valencia','terminal Caracas', 'V500000002', 30, now(), '7:30:00', 50000, 30,'Maria A', '123410');
insert into a.Ofrece values ('terminal Caracas', 'Los Roques', 'V500000002', 31, now(), '7:30:00', 50000, 31,'Maria A', '123411');
insert into a.Ofrece values ('Valencia','terminal Bolivar', 'V500000002',32, now(), '7:30:00', 50000, 32,'Maria A', '123412');
insert into a.Ofrece values ('terminal Bolivar', 'Canaima', 'V500000002',33, now(), '7:30:00', 50000, 33,'Maria A', '123413');
insert into a.Ofrece values ('Valencia','Porlamar', 'V500000000', 40, now(), '8:30:00', 3000000, 40,'Gabiel O', '123420');
insert into a.Ofrece values ('Cumana','Margarita', 'V500000003', 50, now(), '9:30:00', 4000000, 50,'Moises M', '123430');
insert into a.Ofrece values ('Cumana','Margarita', 'V500000004',  50, now(), '9:30:00', 500000, 6,'John C', '123440');

--*A cuales destinos turisticos viajan los clientes*
insert into a.Viaja_a values('1111111', 'Los Andes');
insert into a.Viaja_a values('2222222', 'Los Andes');
insert into a.Viaja_a values('3333333', 'Los Andes');
insert into a.Viaja_a values('4444444', 'Los Andes');
insert into a.Viaja_a values('5555555', 'Canaima');
insert into a.Viaja_a values('5555555', 'Los Roques');
insert into a.Viaja_a values('5555555', 'Margarita');
insert into a.Viaja_a values('5555555', 'Los Andes');	

