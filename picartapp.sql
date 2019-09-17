CREATE TABLE Producto (
  idProducto INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  costo INTEGER NOT NULL DEFAULT 0,
  cantidad INTEGER NULL DEFAULT 0,
  PRIMARY KEY(idProducto)
);

CREATE TABLE Integrante (
  idIntegrante INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  puesto VARCHAR(45) NOT NULL DEFAULT integrante,
  contraseña VARCHAR(255) NOT NULL DEFAULT admin,
  PRIMARY KEY(idIntegrante)
);

CREATE TABLE Cliente (
  idCliente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  telefono NUMERIC NOT NULL,
  correoElectronico VARCHAR(255) NULL,
  PRIMARY KEY(idCliente)
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
  fechaDevolución INTEGER UNSIGNED NULL,
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


