<<<<<<< HEAD
CREATE TABLE Producto (
  idProducto INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  costo INTEGER NOT NULL DEFAULT 0,
  cantidad INTEGER NULL DEFAULT 0,
  descripcion varchar(255),
  PRIMARY KEY(idProducto)
);

CREATE TABLE Puesto (
  idPuesto INTEGER(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(30),
  descripcion VARCHAR(50),
  PRIMARY KEY(idPuesto)
);

CREATE TABLE Cliente (
  idCliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  telefono NUMERIC NOT NULL,
  correoElectronico VARCHAR(100) NULL,
  matricula BIGINT NULL,
  CURP VARCHAR(18) NULL,
  Facebook VARCHAR(50) NULL,
  nombreAval VARCHAR(100) NULL,
  telefonoAval NUMERIC NULL,
  PRIMARY KEY(idCliente)
);

CREATE TABLE Integrante (
  idIntegrante INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPuesto INTEGER(1) UNSIGNED NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  contraseña VARCHAR(30) NOT NULL DEFAULT 'admin',
  usuario VARCHAR(14) NOT NULL,
  PRIMARY KEY(idIntegrante),
  FOREIGN KEY(idPuesto)
    REFERENCES Puesto(idPuesto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Venta (
  idVenta INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idCliente INTEGER UNSIGNED NOT NULL,
  idIntegrante INTEGER UNSIGNED NOT NULL,
  fecha DATE NOT NULL default CURRENT_TIMESTAMP,
  monto_total INTEGER UNSIGNED NOT NULL default 0,
  PRIMARY KEY(idVenta),
  INDEX Venta_FKIndex1(idIntegrante),
  INDEX Venta_FKIndex2(idCliente),
  FOREIGN KEY(idIntegrante)
    REFERENCES Integrante(idIntegrante)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(idCliente)
    REFERENCES Cliente(idCliente)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
);

CREATE TABLE VentaDetalle (
  idVentaDetalle INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idVenta INTEGER UNSIGNED NOT NULL,
  idProducto INTEGER UNSIGNED NOT NULL,
  cantidad INTEGER UNSIGNED NOT NULL,
  importe INTEGER UNSIGNED NULL,
  PRIMARY KEY(idVentaDetalle),
  INDEX VentaDetalle_FKIndex1(idVenta),
  INDEX VentaDetalle_FKIndex2(idProducto),
  FOREIGN KEY(idVenta)
    REFERENCES Venta(idVenta)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(idProducto)
    REFERENCES Producto(idProducto)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
);

CREATE TABLE Renta (
  idRenta INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idCliente INTEGER UNSIGNED NOT NULL,
  idIntegrante INTEGER UNSIGNED NOT NULL,
  fecha DATE NOT NULL,
  fechaDevoluciónAcordada DATE NOT NULL,
  montoAcordado INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idRenta),
  INDEX Renta_FKIndex1(idIntegrante),
  INDEX Renta_FKIndex2(idCliente),
  FOREIGN KEY(idIntegrante)
    REFERENCES Integrante(idIntegrante)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idCliente)
    REFERENCES Cliente(idCliente)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
);

CREATE TABLE RentaDetalle (
  idRentaDetalle INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idRenta INTEGER UNSIGNED NOT NULL,
  idProducto INTEGER UNSIGNED NOT NULL,
  cantidad INTEGER UNSIGNED NULL,
  importe INTEGER UNSIGNED NULL,
  PRIMARY KEY(idRentaDetalle),
  INDEX RentaDetalle_FKIndex1(idProducto),
  INDEX RentaDetalle_FKIndex2(idRenta),
  FOREIGN KEY(idProducto)
    REFERENCES Producto(idProducto)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(idRenta)
    REFERENCES Renta(idRenta)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE Devolucion (
  idDevolucion INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Renta_idRenta INTEGER UNSIGNED NOT NULL,
  fechaDeDevolucion DATE NULL,
  dias_extra INTEGER(2) UNSIGNED NULL,
  montoCobrado INTEGER UNSIGNED NULL,
  PRIMARY KEY(idDevolucion),
  INDEX Devolucion_FKIndex1(Renta_idRenta),
  FOREIGN KEY(Renta_idRenta)
    REFERENCES Renta(idRenta)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE VIEW VistaVentasDetalle AS
SELECT vd.cantidad as Cantidad,
	P.nombre as NombreProducto, 
	p.costo as ImporteUnitario, 
	vd.importe as Importe, 
	v.fecha as Fecha 
	FROM Producto P, VentaDetalle vd, venta v
	WHERE (vd.idVenta = v.idVenta) and 
	(vd.idProducto = p.idProducto);

CREATE VIEW VistaRentasDetalle AS
	SELECT
=======
CREATE TABLE Producto (
  idProducto INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  costo INTEGER NOT NULL DEFAULT 0,
  cantidad INTEGER NULL DEFAULT 0,
  categoría VARCHAR(25) NULL,
  rutaDeImagen VARCHAR(100) NULL,
  PRIMARY KEY(idProducto)
);

CREATE TABLE Puesto (
  idPuesto INTEGER(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR NULL,
  descripcion VARCHAR NULL,
  PRIMARY KEY(idPuesto)
);

CREATE TABLE Cliente (
  idCliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  telefono NUMERIC NOT NULL,
  correoElectronico VARCHAR(100) NULL,
  matricula BIGINT NULL,
  CURP VARCHAR(18) NULL,
  Facebook VARCHAR(50) NULL,
  nombreAval VARCHAR(100) NULL,
  telefonoAval NUMERIC NULL,
  PRIMARY KEY(idCliente)
);

CREATE TABLE Devolucion (
  idDevolucion INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  fechaDeDevolucion DATE NULL,
  dias_extra INTEGER(2) UNSIGNED NULL,
  montoCobrado INTEGER UNSIGNED NULL,
  PRIMARY KEY(idDevolucion)
);

CREATE TABLE Integrante (
  idIntegrante INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idPuesto INTEGER(1) UNSIGNED NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  contraseña VARCHAR(30) NOT NULL DEFAULT admin,
  usuario VARCHAR(14) NOT NULL,
  PRIMARY KEY(idIntegrante),
  INDEX Integrante_FKIndex1(idPuesto),
  FOREIGN KEY(idPuesto)
    REFERENCES Puesto(idPuesto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Venta (
  idVenta INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idCliente INTEGER UNSIGNED NOT NULL,
  idIntegrante INTEGER UNSIGNED NOT NULL,
  fecha DATE NOT NULL,
  monto total INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idVenta),
  INDEX Venta_FKIndex1(idIntegrante),
  INDEX Venta_FKIndex2(idCliente),
  FOREIGN KEY(idIntegrante)
    REFERENCES Integrante(idIntegrante)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(idCliente)
    REFERENCES Cliente(idCliente)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
);

CREATE TABLE VentaDetalle (
  idVentaDetalle INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idVenta INTEGER UNSIGNED NOT NULL,
  idProducto INTEGER UNSIGNED NOT NULL,
  cantidad INTEGER UNSIGNED NOT NULL,
  importe INTEGER UNSIGNED NULL,
  PRIMARY KEY(idVentaDetalle),
  INDEX VentaDetalle_FKIndex1(idVenta),
  INDEX VentaDetalle_FKIndex2(idProducto),
  FOREIGN KEY(idVenta)
    REFERENCES Venta(idVenta)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(idProducto)
    REFERENCES Producto(idProducto)
      ON DELETE RESTRICT
      ON UPDATE CASCADE
);

CREATE TABLE Renta (
  idRenta INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Devolucion_idDevolucion INTEGER UNSIGNED NOT NULL,
  idCliente INTEGER UNSIGNED NOT NULL,
  idIntegrante INTEGER UNSIGNED NOT NULL,
  fecha DATE NOT NULL,
  fechaDevoluciónAcordada DATE NOT NULL,
  montoAcordado INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idRenta),
  INDEX Renta_FKIndex1(idIntegrante),
  INDEX Renta_FKIndex2(idCliente),
  INDEX Renta_FKIndex3(Devolucion_idDevolucion),
  FOREIGN KEY(idIntegrante)
    REFERENCES Integrante(idIntegrante)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(idCliente)
    REFERENCES Cliente(idCliente)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(Devolucion_idDevolucion)
    REFERENCES Devolucion(idDevolucion)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE RentaDetalle (
  idRentaDetalle INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  idRenta INTEGER UNSIGNED NOT NULL,
  idProducto INTEGER UNSIGNED NOT NULL,
  cantidad INTEGER UNSIGNED NULL,
  importe INTEGER UNSIGNED NULL,
  PRIMARY KEY(idRentaDetalle),
  INDEX RentaDetalle_FKIndex1(idProducto),
  INDEX RentaDetalle_FKIndex2(idRenta),
  FOREIGN KEY(idProducto)
    REFERENCES Producto(idProducto)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(idRenta)
    REFERENCES Renta(idRenta)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);


>>>>>>> ae3b4f775cd17bc3e105aace0fe7723b215c9763
