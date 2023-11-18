DROP SCHEMA IF EXISTS servincidentes;
CREATE SCHEMA IF NOT EXISTS servIncidentes;
USE servIncidentes;

CREATE TABLE incidentes (
id_incidente int auto_increment not null,
id_user int not null,
id_cliente int not null,
descript text not null,
fecha_alta datetime,
fecha_cierre datetime,
estado ENUM ("ABIERTO", "EN_PROGRESO", "DEMORADO", "RESUELTO"),
id_servicio int not null,
id_tecnico int,
tiempoResolución int, -- En minutos.
esComplejo boolean,
comentarios text,
emailEnviado boolean,
CONSTRAINT PK_INC PRIMARY KEY (id_incidente)
);

CREATE TABLE clientes (
id_cliente int auto_increment not null,
id_user int not null,
cuit int,
razon_social varchar(120),
email varchar(120),
CONSTRAINT PK_CLI PRIMARY KEY (id_cliente)
);

/*
CREATE TABLE tecnicos (
id_tecnico int auto_increment not null,
is_user int not null,
dni varchar(10),
nombre varchar(80),
apellido varchar(60),
email varchar(80),
celular varchar(80),
CONSTRAINT PK_TEC PRIMARY KEY (id_tecnico)
);
*/

CREATE TABLE usuarios (
id_user int auto_increment not null,
dni varchar(10) not null,
pwd varchar (14) not null,
nombre varchar(80) not null,
apellido varchar(60) not null,
id_rol int not null,
email varchar(80),
CONSTRAINT PK_USER PRIMARY KEY (id_user)
);

CREATE TABLE roles (
id_rol int auto_increment not null,
des_rol varchar(40),
id_permisos int not null,
CONSTRAINT PK_ROL PRIMARY KEY (id_rol)
);

CREATE TABLE competencias (
id_competencia int auto_increment not null,
id_servicio int not null,
id_tecnico int not null,
CONSTRAINT PK_COM PRIMARY KEY (id_competencia)
);

CREATE TABLE permisos (
id_permisos int auto_increment not null,
fullAccess boolean,
rrhhAccess boolean,
tecAccess boolean,
asesorAccess boolean,
comerAccess boolean,
CONSTRAINT PK_PER PRIMARY KEY (id_permisos)
);


CREATE TABLE serv_Contratados (
id_servContratado int auto_increment not null,
id_cliente int not null,
id_servicio int not null,
CONSTRAINT PK_SRVC PRIMARY KEY (id_servContratado)
);


CREATE TABLE servicios (
id_servicio int auto_increment not null,
desc_servicio VARCHAR(200),
CONSTRAINT PK_SRV PRIMARY KEY (id_servicio)
);

CREATE TABLE problemas (
id_problema int auto_increment unique not null,
id_incidente int not null,
desc_problema text not null,
tiempoEsperadoMin int,
tiempoMaximoMin int,
CONSTRAINT PK_PRO PRIMARY KEY (id_problema)
);

ALTER TABLE servincidentes.problemas ADD CONSTRAINT FK_ID_INC FOREIGN KEY FK_ID_PRO (id_incidente)
REFERENCES servincidentes.incidentes (id_incidente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE servIncidentes.clientes  ADD CONSTRAINT FK_ID_USER FOREIGN KEY FK_ID_USER (id_user)
REFERENCES servIncidentes.usuarios  (id_user)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


ALTER TABLE servIncidentes.competencias  ADD CONSTRAINT FK_COMP FOREIGN KEY FK_COMP (id_servicio)
REFERENCES servIncidentes.servicios (id_servicio)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE servIncidentes.competencias  ADD CONSTRAINT FK_COMP1 FOREIGN KEY FK_COMP1 (id_tecnico)
REFERENCES servIncidentes.usuarios (id_user)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE servIncidentes.incidentes  ADD CONSTRAINT FK_INC1 FOREIGN KEY FK_INC1 (id_user)
REFERENCES servIncidentes.usuarios (id_user)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE servIncidentes.incidentes  ADD CONSTRAINT FK_INC2 FOREIGN KEY FK_INC2 (id_cliente)
REFERENCES servIncidentes.clientes (id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE servIncidentes.incidentes  ADD CONSTRAINT FK_INC3 FOREIGN KEY FK_INC3 (id_servicio)
REFERENCES servIncidentes.servicios (id_servicio)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE servIncidentes.incidentes  ADD CONSTRAINT FK_INC4 FOREIGN KEY FK_INC4 (id_tecnico)
REFERENCES servIncidentes.usuarios (id_user)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE servIncidentes.roles  ADD CONSTRAINT FK_ROL FOREIGN KEY FK_ROL (id_permisos)
REFERENCES servIncidentes.permisos (id_permisos)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE servIncidentes.usuarios  ADD CONSTRAINT FK_USR1 FOREIGN KEY FK_USR1 (id_rol)
REFERENCES servIncidentes.roles (id_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE servIncidentes.serv_Contratados  ADD CONSTRAINT FK_ID_SERV FOREIGN KEY FK_ID_SERV (id_servicio)
REFERENCES servIncidentes.servicios  (id_servicio)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE servIncidentes.serv_Contratados  ADD CONSTRAINT FK_ID_CLIE FOREIGN KEY FK_ID_CLIE (id_cliente)
REFERENCES servIncidentes.clientes  (id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

/* Carga de datos ejemplos */

/* Tabla Permisos */

INSERT INTO permisos  (fullAccess, rrhhAccess, tecAccess, asesorAccess, comerAccess) VALUES (true, false, false, false, false); -- Admin
INSERT INTO permisos  (fullAccess, rrhhAccess, tecAccess, asesorAccess, comerAccess) VALUES (false, true, false, false, false); -- RRHH
INSERT INTO permisos  (fullAccess, rrhhAccess, tecAccess, asesorAccess, comerAccess) VALUES (false, false, true, false, false); -- Técnicos
INSERT INTO permisos  (fullAccess, rrhhAccess, tecAccess, asesorAccess, comerAccess) VALUES (false, false, false, true, false); -- Mesa de Ayuda
INSERT INTO permisos  (fullAccess, rrhhAccess, tecAccess, asesorAccess, comerAccess) VALUES (false, false, false, false, true); -- Comercial

/* Tabla roles */

INSERT INTO roles  (des_rol, id_permisos) VALUES ("Administrador", 1);
INSERT INTO roles  (des_rol, id_permisos) VALUES ("Recursos Humanos", 2);
INSERT INTO roles  (des_rol, id_permisos) VALUES ("Técnico", 3);
INSERT INTO roles  (des_rol, id_permisos) VALUES ("Help Desk", 4);
INSERT INTO roles  (des_rol, id_permisos) VALUES ("Asesor Comercial", 5);

/* Tabla Servicios */

INSERT INTO servicios (desc_servicio) VALUES ("WINDOWS");
INSERT INTO servicios (desc_servicio) VALUES ("LINUX");
INSERT INTO servicios (desc_servicio) VALUES ("MACOS");
INSERT INTO servicios (desc_servicio) VALUES ("TANGO");
INSERT INTO servicios (desc_servicio) VALUES ("SAP");
INSERT INTO servicios (desc_servicio) VALUES ("SIAC");
INSERT INTO servicios (desc_servicio) VALUES ("REDES");


/* Tabla usuarios */ /*
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO usuarios  (dni, pwd, nombre, apellido, id_rol, email, celular, interno, domicilio, id_postal)
VALUES ("28652782", "ratata128", "Demostenes", "Acoglanis", 1, "acoglanis.demostenes@gmail.com", "3885049305", "1041", "Tupungato 1300", 1);
INSERT INTO usuarios  (dni, pwd, nombre, apellido, id_rol, email, celular, interno, domicilio, id_postal)
VALUES ("28652783", "ratata129", "Juan", "Perez", 2, "juan.perez.prueba@net.com", "3885554887", "1042", "Uspallata 2538", 2);
INSERT INTO usuarios  (dni, pwd, nombre, apellido, id_rol, email, celular, interno, domicilio, id_postal)
VALUES ("44229318", "ratata130", "Valentina", "Loaiza", 4, "valentina.prueba@net.com", "3884558101", "1045", "La Plata 125", 4);
INSERT INTO usuarios  (dni, pwd, nombre, apellido, id_rol, email, celular, interno, domicilio, id_postal)
VALUES ("46770285", "ratata131", "Pinchilon", "Fonseca", 3, "pfonseca.prueba@net.com", "3515447201", "1043", "El Hornero 1212", 3);
INSERT INTO usuarios  (dni, pwd, nombre, apellido, id_rol, email, celular, interno, domicilio, id_postal)
VALUES ("27727016", "ratata132", "Jorgelina", "Neris", 5, "jorgelina.prueba@net.com", "3885054520", "1050", "Gorriti 1368", 1);
*/
 /*
CREATE VIEW ciudadYProvincias AS 
SELECT  A.id_ciudad, A.id_postal, A.nombreCiudad, B.nombreProvincia FROM ciudades AS A 
INNER JOIN provincias AS B ON B.id_provincia = A.id_provincia;

*/
