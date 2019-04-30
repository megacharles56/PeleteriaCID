-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema peleteriacid
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `peleteriacid` ;

-- -----------------------------------------------------
-- Schema peleteriacid
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `peleteriacid` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `peleteriacid` ;

-- -----------------------------------------------------
-- Table `peleteriacid`.`cortecaja_dias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peleteriacid`.`cortecaja_dias` (
  `CORTEDIA_FECHA` DATE NOT NULL,
  `CORTEDIA_INGRESOS` DOUBLE NULL DEFAULT NULL,
  `CORTEDIA_EGRESOS` DOUBLE NULL DEFAULT NULL,
  `CORTEDIA_MONTOTOTAL` DOUBLE NULL DEFAULT NULL,
  `CORTEDIA_REALIZO` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`CORTEDIA_FECHA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `peleteriacid`.`gastos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peleteriacid`.`gastos` (
  `GASTOS_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `GASTOS_CONCEPTO` VARCHAR(45) NULL DEFAULT NULL,
  `GASTOS_TIPO` VARCHAR(45) NULL DEFAULT NULL,
  `GASTOS_MONTO` DOUBLE NULL DEFAULT NULL,
  `GASTOS_DESCRIPCION` VARCHAR(150) NULL DEFAULT NULL,
  `GASTO_IVA` DOUBLE NULL DEFAULT NULL,
  `GASTO_FECHA` DATE NULL DEFAULT NULL,
  `GASTO_TOTAL` DOUBLE NULL DEFAULT NULL,
  `GASTO_METODO` VARCHAR(45) NULL DEFAULT NULL,
  `GASTO_PAGADO` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`GASTOS_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `peleteriacid`.`cortecaja_dias_has_gastos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peleteriacid`.`cortecaja_dias_has_gastos` (
  `CORTEDIA_FECHA` DATE NOT NULL,
  `GASTOS_ID` INT(11) NOT NULL,
  PRIMARY KEY (`CORTEDIA_FECHA`, `GASTOS_ID`),
  INDEX `fk_CORTECAJA_DIAS_has_GASTOS_GASTOS1` (`GASTOS_ID` ASC) VISIBLE,
  CONSTRAINT `fk_CORTECAJA_DIAS_has_GASTOS_CORTECAJA_DIAS1`
    FOREIGN KEY (`CORTEDIA_FECHA`)
    REFERENCES `peleteriacid`.`cortecaja_dias` (`CORTEDIA_FECHA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CORTECAJA_DIAS_has_GASTOS_GASTOS1`
    FOREIGN KEY (`GASTOS_ID`)
    REFERENCES `peleteriacid`.`gastos` (`GASTOS_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `peleteriacid`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peleteriacid`.`facturas` (
  `FACTURA_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `FACTURA_FECHA` DATE NULL DEFAULT NULL,
  `FACTURA_UBICACION` VARCHAR(45) NULL DEFAULT NULL,
  `FACTURA_NUMERO` VARCHAR(45) NULL DEFAULT NULL,
  `FACTURA_SUBTOTAL` DOUBLE NULL DEFAULT NULL,
  `FACTURA_DESCUENTO` DOUBLE NULL DEFAULT NULL,
  `FACTURA_TOTAL` DOUBLE NULL DEFAULT NULL,
  `FACTURA_FECHADEPAGO` DATE NULL DEFAULT NULL,
  `FACTURA_NOTAS` VARCHAR(100) NULL DEFAULT NULL,
  `FACTURA_IVA` DOUBLE NULL DEFAULT NULL,
  `FACTURA_PROVEEDOR` VARCHAR(70) NULL DEFAULT NULL,
  `FACTURA_METODO` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`FACTURA_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `peleteriacid`.`materiales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peleteriacid`.`materiales` (
  `MATERIA_SKU` VARCHAR(11) NULL DEFAULT NULL,
  `MATERIA_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `MATERIA_TIPO` VARCHAR(45) NULL DEFAULT NULL,
  `MATERIA_MODELO` VARCHAR(45) NULL DEFAULT NULL,
  `MATERIA_MEDIDA_LARGO` FLOAT NULL DEFAULT NULL,
  `MATERIA_COLOR` VARCHAR(45) NULL DEFAULT NULL,
  `MATERIA_CANTIDAD` INT(11) NULL DEFAULT NULL,
  `MATERIA_PRECIO` DOUBLE NULL DEFAULT NULL,
  `MATERIA_MEDIDA_ANCHO` FLOAT NULL DEFAULT NULL,
  `MATERIA_MEDIDA_ESPESOR` FLOAT NULL DEFAULT NULL,
  `MATERIA_COSTO` DOUBLE NULL DEFAULT NULL,
  `MATERIA_MARCA` VARCHAR(50) NULL DEFAULT NULL,
  `MATERIA_NOTAS` VARCHAR(120) NULL DEFAULT NULL,
  PRIMARY KEY (`MATERIA_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `peleteriacid`.`materiales_has_facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peleteriacid`.`materiales_has_facturas` (
  `MATERIA_ID` INT(11) NOT NULL,
  `FACTURA_ID` INT(11) NOT NULL,
  `MATERIA_CANTIDAD` INT NULL,
  `MATERIA_COSTO` DOUBLE NULL,
  PRIMARY KEY (`MATERIA_ID`, `FACTURA_ID`),
  INDEX `fk_MATERIALES_has_FACTURAS_FACTURAS1` (`FACTURA_ID` ASC) VISIBLE,
  CONSTRAINT `fk_MATERIALES_has_FACTURAS_FACTURAS1`
    FOREIGN KEY (`FACTURA_ID`)
    REFERENCES `peleteriacid`.`facturas` (`FACTURA_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MATERIALES_has_FACTURAS_MATERIALES1`
    FOREIGN KEY (`MATERIA_ID`)
    REFERENCES `peleteriacid`.`materiales` (`MATERIA_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `peleteriacid`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peleteriacid`.`pedidos` (
  `PEDIDO_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `PEDIDO_TOTAL` DOUBLE NULL DEFAULT NULL,
  `PEDIDO_FECHA` DATE NULL DEFAULT NULL,
  `PEDIDO_METODODEPEGO` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`PEDIDO_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `peleteriacid`.`materiales_has_pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peleteriacid`.`materiales_has_pedidos` (
  `PEDIDO_ID` INT(11) NOT NULL,
  `MATERIA_ID` INT(11) NOT NULL,
  `CANTIDAD` INT(11) NULL DEFAULT NULL,
  `TOTAL` DOUBLE NULL DEFAULT NULL,
  `GANANCIA` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`PEDIDO_ID`, `MATERIA_ID`),
  INDEX `fk_MATERIALES_has_PEDIDOS_MATERIALES1` (`MATERIA_ID` ASC) VISIBLE,
  CONSTRAINT `fk_MATERIALES_has_PEDIDOS_MATERIALES1`
    FOREIGN KEY (`MATERIA_ID`)
    REFERENCES `peleteriacid`.`materiales` (`MATERIA_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MATERIALES_has_PEDIDOS_PEDIDOS1`
    FOREIGN KEY (`PEDIDO_ID`)
    REFERENCES `peleteriacid`.`pedidos` (`PEDIDO_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `peleteriacid`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peleteriacid`.`proveedores` (
  `PROV_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `PROV_NOMBRE` VARCHAR(45) NULL DEFAULT NULL,
  `PROV_TELEFONO` VARCHAR(11) NULL DEFAULT NULL,
  `PROV_CORREO` VARCHAR(70) NULL DEFAULT NULL,
  `PROV_NOTAS` VARCHAR(100) NULL DEFAULT NULL,
  `PROV_CELULAR` VARCHAR(45) NULL DEFAULT NULL,
  `PROV_TIPO` VARCHAR(45) NULL,
  PRIMARY KEY (`PROV_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `peleteriacid`.`materiales_has_proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peleteriacid`.`materiales_has_proveedores` (
  `MATERIA_ID` INT(11) NOT NULL,
  `PROV_ID` INT(11) NOT NULL,
  PRIMARY KEY (`MATERIA_ID`, `PROV_ID`),
  INDEX `fk_MATERIALES_has_PROVEEDORES_PROVEEDORES1` (`PROV_ID` ASC) VISIBLE,
  CONSTRAINT `fk_MATERIALES_has_PROVEEDORES_MATERIALES1`
    FOREIGN KEY (`MATERIA_ID`)
    REFERENCES `peleteriacid`.`materiales` (`MATERIA_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MATERIALES_has_PROVEEDORES_PROVEEDORES1`
    FOREIGN KEY (`PROV_ID`)
    REFERENCES `peleteriacid`.`proveedores` (`PROV_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `peleteriacid`.`pedidos_has_cortecaja_dias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peleteriacid`.`pedidos_has_cortecaja_dias` (
  `PEDIDO_ID` INT(11) NOT NULL,
  `CORTEDIA_FECHA` DATE NOT NULL,
  PRIMARY KEY (`PEDIDO_ID`, `CORTEDIA_FECHA`),
  INDEX `fk_PEDIDOS_has_CORTECAJA_DIAS_CORTECAJA_DIAS1` (`CORTEDIA_FECHA` ASC) VISIBLE,
  CONSTRAINT `fk_PEDIDOS_has_CORTECAJA_DIAS_CORTECAJA_DIAS1`
    FOREIGN KEY (`CORTEDIA_FECHA`)
    REFERENCES `peleteriacid`.`cortecaja_dias` (`CORTEDIA_FECHA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PEDIDOS_has_CORTECAJA_DIAS_PEDIDOS1`
    FOREIGN KEY (`PEDIDO_ID`)
    REFERENCES `peleteriacid`.`pedidos` (`PEDIDO_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `peleteriacid`.`gastos_has_proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peleteriacid`.`gastos_has_proveedores` (
  `PROV_ID` INT(11) NOT NULL,
  `GASTOS_ID` INT(11) NOT NULL,
  PRIMARY KEY (`PROV_ID`, `GASTOS_ID`),
  INDEX `fk_proveedores_has_gastos_gastos1_idx` (`GASTOS_ID` ASC) VISIBLE,
  INDEX `fk_proveedores_has_gastos_proveedores1_idx` (`PROV_ID` ASC) VISIBLE,
  CONSTRAINT `fk_proveedores_has_gastos_proveedores1`
    FOREIGN KEY (`PROV_ID`)
    REFERENCES `peleteriacid`.`proveedores` (`PROV_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedores_has_gastos_gastos1`
    FOREIGN KEY (`GASTOS_ID`)
    REFERENCES `peleteriacid`.`gastos` (`GASTOS_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
