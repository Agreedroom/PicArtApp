-- MySQL dump 10.13  Distrib 5.7.26, for osx10.9 (x86_64)
--
-- Host: localhost    Database: picartapp
-- ------------------------------------------------------
-- Server version	5.7.26
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,MSSQL' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table "Cliente"
--

use picartapp;

DROP TABLE IF EXISTS "Cliente";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "Cliente" (
  "idCliente" int NOT NULL,
  "nombre" varchar(100) NOT NULL,
  "telefono" decimal(10,0) NOT NULL,
  "correoElectronico" varchar(100) DEFAULT NULL,
  "matricula" bigint DEFAULT NULL,
  "CURP" varchar(18) DEFAULT NULL,
  "Facebook" varchar(50) DEFAULT NULL,
  "nombreAval" varchar(100) DEFAULT NULL,
  "telefonoAval" decimal(10,0) DEFAULT NULL,
  PRIMARY KEY ("idCliente")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "Devolucion"
--

DROP TABLE IF EXISTS "Devolucion";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "Devolucion" (
  "idDevolucion" int  NOT NULL,
  "fechaDeDevolucion" date DEFAULT NULL,
  "dias_extra" int  DEFAULT NULL,
  "montoCobrado" int  DEFAULT NULL,
  "Observaciones" varchar(255) DEFAULT NULL,
  "Renta_idRenta" int  NOT NULL,
  PRIMARY KEY ("idDevolucion"),
  CONSTRAINT "fk_Devolucion_Renta1" FOREIGN KEY ("Renta_idRenta") REFERENCES "Renta" ("idRenta") ON UPDATE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table "Integrante"
--

DROP TABLE IF EXISTS "Integrante";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "Integrante" (
  "idIntegrante" int NOT NULL,
  "nombre" varchar(100) NOT NULL,
  "contrasena" varchar(30) NOT NULL DEFAULT 'admin',
  "usuario" varchar(14) NOT NULL,
  "Puesto_idPuesto" int NOT NULL,
  PRIMARY KEY ("idIntegrante"),
  CONSTRAINT "fk_Integrante_Puesto1" FOREIGN KEY ("Puesto_idPuesto") REFERENCES "Puesto" ("idPuesto") ON UPDATE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table "Producto"
--

DROP TABLE IF EXISTS "Producto";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "Producto" (
  "idProducto" int  NOT NULL,
  "nombre" varchar(45) NOT NULL,
  "costo_venta" int NOT NULL DEFAULT '0',
  "costo_renta" int DEFAULT '10',
  "cantidad" int DEFAULT '0',
  "rutaDeImagen" varchar(100) DEFAULT NULL,
  "descripcion" varchar(255) DEFAULT 'No se proporcionó una descripción.',
  "categorias_id_categoria" int NOT NULL,
  PRIMARY KEY ("idProducto"),
  CONSTRAINT "fk_Producto_categorias1" FOREIGN KEY ("categorias_id_categoria") REFERENCES "categorias" ("id_categoria") ON UPDATE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table "Puesto"
--

DROP TABLE IF EXISTS "Puesto";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "Puesto" (
  "idPuesto" int NOT NULL,
  "nombrePuesto" varchar(45) NOT NULL,
  PRIMARY KEY ("idPuesto")
);
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table "Renta"
--

DROP TABLE IF EXISTS "Renta";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "Renta" (
  "idRenta" int  NOT NULL,
  "fecha" date NOT NULL,
  "fechaDevolucionAcordada" date NOT NULL,
  "montoAcordado" int  NOT NULL,
  "Integrante_idIntegrante" int NOT NULL,
  "Cliente_idCliente" int NOT NULL,
  PRIMARY KEY ("idRenta"),
  CONSTRAINT "fk_Renta_Cliente1" FOREIGN KEY ("Cliente_idCliente") REFERENCES "Cliente" ("idCliente") ON UPDATE CASCADE,
  CONSTRAINT "fk_Renta_Integrante" FOREIGN KEY ("Integrante_idIntegrante") REFERENCES "Integrante" ("idIntegrante") ON UPDATE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table "RentaDetalle"
--

DROP TABLE IF EXISTS "RentaDetalle";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "RentaDetalle" (
  "idRentaDetalle" int  NOT NULL,
  "cantidad" int  DEFAULT NULL,
  "importe" int DEFAULT NULL,
  "Renta_idRenta" int  NOT NULL,
  "Producto_idProducto" int  NOT NULL,
  PRIMARY KEY ("idRentaDetalle"),
  CONSTRAINT "fk_RentaDetalle_Producto1" FOREIGN KEY ("Producto_idProducto") REFERENCES "Producto" ("idProducto") ON UPDATE CASCADE,
  CONSTRAINT "fk_RentaDetalle_Renta1" FOREIGN KEY ("Renta_idRenta") REFERENCES "Renta" ("idRenta") ON UPDATE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table "Venta"
--

DROP TABLE IF EXISTS "Venta";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "Venta" (
  "idVenta" int  NOT NULL,
  "fecha" date NOT NULL,
  "monto_total" int  NOT NULL DEFAULT '0',
  "Cliente_idCliente" int NOT NULL,
  "Integrante_idIntegrante" int NOT NULL,
  PRIMARY KEY ("idVenta"),
  CONSTRAINT "fk_Venta_Cliente1" FOREIGN KEY ("Cliente_idCliente") REFERENCES "Cliente" ("idCliente") ON UPDATE CASCADE,
  CONSTRAINT "fk_Venta_Integrante1" FOREIGN KEY ("Integrante_idIntegrante") REFERENCES "Integrante" ("idIntegrante") ON UPDATE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table "VentaDetalle"
--

DROP TABLE IF EXISTS "VentaDetalle";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "VentaDetalle" (
  "idVentaDetalle" int  NOT NULL,
  "cantidad" int  NOT NULL,
  "importe" int  DEFAULT NULL,
  "Venta_idVenta" int  NOT NULL,
  "Producto_idProducto" int  NOT NULL,
  PRIMARY KEY ("idVentaDetalle"),
  CONSTRAINT "fk_VentaDetalle_Producto1" FOREIGN KEY ("Producto_idProducto") REFERENCES "Producto" ("idProducto") ON UPDATE CASCADE,
  CONSTRAINT "fk_VentaDetalle_Venta1" FOREIGN KEY ("Venta_idVenta") REFERENCES "Venta" ("idVenta") ON UPDATE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table "categorias"
--

DROP TABLE IF EXISTS "categorias";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "categorias" (
  "id_categoria" int NOT NULL,
  "name" varchar(30) NOT NULL,
  PRIMARY KEY ("id_categoria")
);
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Temporary table structure for view "vistaventasdetalle"
--

/*!50001 CREATE VIEW "vistaventasdetalle" AS SELECT 
 1 AS "Cantidad",
 1 AS "NombreProducto",
 1 AS "ImporteUnitario",
 1 AS "Importe",
 1 AS "Fecha"*/;

--
-- Final view structure for view "vistaventasdetalle"
--

/*!50001 DROP VIEW IF EXISTS "vistaventasdetalle"*/;
/*!50001 CREATE VIEW "vistaventasdetalle" AS select "vd"."cantidad" AS "Cantidad","p"."nombre" AS "NombreProducto","p"."costo_venta" AS "ImporteUnitario","vd"."importe" AS "Importe","v"."fecha" AS "Fecha" from (("producto" "p" join "ventadetalle" "vd") join "venta" "v") where (("vd"."Venta_idVenta" = "v"."idVenta") and ("vd"."Producto_idProducto" = "p"."idProducto")) */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-07 21:18:39
