mysql -h picart.cwxh9dtxcwx7.us-east-2.rds.amazonaws.com --ssl-ca=rds-ca-2015-root.pem --ssl-mode=VERIFY_IDENTITY -p

use picartapp;
-- creando los puestos --
insert into puesto values (0,'administrador');
INSERT INTO puesto VALUES (1,'integrante');

-- creando integrantes --
INSERT INTO integrante (idIntegrante, nombre, contrasena, usuario, Puesto_idPuesto) values (0, 'Javier Sanchez', 'xtrs84zk', 'Jav', 1);
INSERT INTO integrante (idIntegrante, nombre, contrasena, usuario, Puesto_idPuesto) values (1, 'Abel Monsivais', 'agreedac', 'Abl', 0);
INSERT INTO integrante (idIntegrante, nombre, contrasena, usuario, Puesto_idPuesto) values (2, 'Raul Barron', 'acjsac', 'Rul', 0);

-- creando clientes --
INSERT INTO `Cliente` (`idCliente`, `nombre`, `telefono`, `correoElectronico`, `matricula`, `CURP`, `Facebook`, `nombreAval`, `telefonoAval`)
VALUES ('0', 'Ernesto López', '8441245562', 'ahhajkn@gmail.com', '15211221', 'ELPO129012ACJN05', 'Ernesto Lópesz', 'Sarah Connor', '8443256894');

INSERT INTO `Cliente` (`idCliente`, `nombre`, `telefono`, `correoElectronico`, `matricula`, `CURP`, `Facebook`, `nombreAval`, `telefonoAval`)
VALUES ('1', 'Pancho Villa', '8443265451', 'njkcs@cnjak.org', '45678945', 'CSNJ456213CSN05', 'Pancho Villa', 'Ernesto López', '8441245562');

-- creando categorias --
INSERT INTO `categorias` (`id_categoria`, `name`) VALUES ('0', 'sensores');

-- creando productos --
