-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema descubierto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema descubierto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `descubierto` DEFAULT CHARACTER SET utf8 ;
USE `descubierto` ;

-- -----------------------------------------------------
-- Table `descubierto`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `descubierto`.`pais` (
  `idpais` INT NOT NULL AUTO_INCREMENT,
  `nombre_pais` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idpais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `descubierto`.`ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `descubierto`.`ciudad` (
  `idciudad` INT NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` VARCHAR(40) NULL,
  `codigo_postal` VARCHAR(10) NULL,
  `pais_idpais` INT NOT NULL,
  PRIMARY KEY (`idciudad`),
  INDEX `fk_ciudad_pais_idx` (`pais_idpais` ASC) VISIBLE,
  CONSTRAINT `fk_ciudad_pais`
    FOREIGN KEY (`pais_idpais`)
    REFERENCES `descubierto`.`pais` (`idpais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `descubierto`.`sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `descubierto`.`sucursal` (
  `idsucursal` INT NOT NULL AUTO_INCREMENT,
  `nombre_sucursal` VARCHAR(30) NULL,
  `ciudad_idciudad` INT NOT NULL,
  PRIMARY KEY (`idsucursal`),
  INDEX `fk_sucursal_ciudad1_idx` (`ciudad_idciudad` ASC) VISIBLE,
  CONSTRAINT `fk_sucursal_ciudad1`
    FOREIGN KEY (`ciudad_idciudad`)
    REFERENCES `descubierto`.`ciudad` (`idciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `descubierto`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `descubierto`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `apellido_cliente` VARCHAR(50) NULL,
  `nombre_cliente` VARCHAR(50) NULL,
  `domicilio_cliente` VARCHAR(80) NULL,
  `email_cliente` VARCHAR(60) NULL,
  `telefono_cliente` CHAR(15) NULL,
  `ciudad_idciudad` INT NOT NULL,
  PRIMARY KEY (`idcliente`),
  INDEX `fk_cliente_ciudad1_idx` (`ciudad_idciudad` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_ciudad1`
    FOREIGN KEY (`ciudad_idciudad`)
    REFERENCES `descubierto`.`ciudad` (`idciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `descubierto`.`tipo_cuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `descubierto`.`tipo_cuenta` (
  `idtipo_cuenta` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(30) NULL,
  PRIMARY KEY (`idtipo_cuenta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `descubierto`.`ejecutivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `descubierto`.`ejecutivo` (
  `idejecutivo` INT NOT NULL AUTO_INCREMENT,
  `nombre_ejecutivo` VARCHAR(50) NULL,
  `apellido_ejecutivo` VARCHAR(50) NULL,
  `direccion` VARCHAR(80) NULL,
  `email` VARCHAR(70) NULL,
  `fecha_alta` DATE NULL,
  `ciudad_idciudad` INT NOT NULL,
  `sucursal_idsucursal` INT NOT NULL,
  PRIMARY KEY (`idejecutivo`),
  INDEX `fk_ejecutivo_ciudad1_idx` (`ciudad_idciudad` ASC) VISIBLE,
  INDEX `fk_ejecutivo_sucursal1_idx` (`sucursal_idsucursal` ASC) VISIBLE,
  CONSTRAINT `fk_ejecutivo_ciudad1`
    FOREIGN KEY (`ciudad_idciudad`)
    REFERENCES `descubierto`.`ciudad` (`idciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ejecutivo_sucursal1`
    FOREIGN KEY (`sucursal_idsucursal`)
    REFERENCES `descubierto`.`sucursal` (`idsucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `descubierto`.`cuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `descubierto`.`cuenta` (
  `idcuenta` INT NOT NULL AUTO_INCREMENT,
  `tipo_cuenta_idtipo_cuenta` INT NOT NULL,
  `numero_cuenta` VARCHAR(30) NULL,
  `activa` TINYINT(1) NULL,
  `saldo_cuenta` FLOAT(15,2) NULL,
  `descubierto_otorgado` FLOAT(15,2) NULL,
  `sucursal_idsucursal` INT NOT NULL,
  `ejecutivo_idejecutivo` INT NOT NULL,
  INDEX `fk_cuenta_tipo_cuenta1_idx` (`tipo_cuenta_idtipo_cuenta` ASC) VISIBLE,
  PRIMARY KEY (`idcuenta`),
  INDEX `fk_cuenta_sucursal1_idx` (`sucursal_idsucursal` ASC) VISIBLE,
  INDEX `fk_cuenta_ejecutivo1_idx` (`ejecutivo_idejecutivo` ASC) VISIBLE,
  CONSTRAINT `fk_cuenta_tipo_cuenta1`
    FOREIGN KEY (`tipo_cuenta_idtipo_cuenta`)
    REFERENCES `descubierto`.`tipo_cuenta` (`idtipo_cuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cuenta_sucursal1`
    FOREIGN KEY (`sucursal_idsucursal`)
    REFERENCES `descubierto`.`sucursal` (`idsucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cuenta_ejecutivo1`
    FOREIGN KEY (`ejecutivo_idejecutivo`)
    REFERENCES `descubierto`.`ejecutivo` (`idejecutivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `descubierto`.`historial_accesos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `descubierto`.`historial_accesos` (
  `idhistorial_accesos` INT NOT NULL AUTO_INCREMENT,
  `cliente_idcliente` INT NOT NULL,
  `cuenta_idcuenta` INT NOT NULL,
  `fecha_hora` DATETIME NULL,
  PRIMARY KEY (`idhistorial_accesos`),
  INDEX `fk_historial_accesos_cliente1_idx` (`cliente_idcliente` ASC) VISIBLE,
  INDEX `fk_historial_accesos_cuenta1_idx` (`cuenta_idcuenta` ASC) VISIBLE,
  CONSTRAINT `fk_historial_accesos_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `descubierto`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_historial_accesos_cuenta1`
    FOREIGN KEY (`cuenta_idcuenta`)
    REFERENCES `descubierto`.`cuenta` (`idcuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `descubierto`.`interes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `descubierto`.`interes` (
  `idinteres` INT NOT NULL AUTO_INCREMENT,
  `descripcion_interes` VARCHAR(30) NULL,
  PRIMARY KEY (`idinteres`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `descubierto`.`prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `descubierto`.`prestamo` (
  `idprestamo` INT NOT NULL AUTO_INCREMENT,
  `cantidad_cuotas` INT NULL,
  `importe_prestamo` FLOAT(15,2) NULL,
  `fecha_prestamo` DATE NULL,
  `sucursal_idsucursal` INT NOT NULL,
  `ejecutivo_idejecutivo` INT NOT NULL,
  `interes_idinteres` INT NOT NULL,
  PRIMARY KEY (`idprestamo`),
  INDEX `fk_prestamo_sucursal1_idx` (`sucursal_idsucursal` ASC) VISIBLE,
  INDEX `fk_prestamo_ejecutivo1_idx` (`ejecutivo_idejecutivo` ASC) VISIBLE,
  INDEX `fk_prestamo_interes1_idx` (`interes_idinteres` ASC) VISIBLE,
  CONSTRAINT `fk_prestamo_sucursal1`
    FOREIGN KEY (`sucursal_idsucursal`)
    REFERENCES `descubierto`.`sucursal` (`idsucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prestamo_ejecutivo1`
    FOREIGN KEY (`ejecutivo_idejecutivo`)
    REFERENCES `descubierto`.`ejecutivo` (`idejecutivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prestamo_interes1`
    FOREIGN KEY (`interes_idinteres`)
    REFERENCES `descubierto`.`interes` (`idinteres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `descubierto`.`pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `descubierto`.`pago` (
  `idpago` INT NOT NULL AUTO_INCREMENT,
  `numero_cuota` INT NULL,
  `importe_a_pagar` FLOAT(15,2) NULL,
  `fecha_pago` DATETIME NULL,
  `prestamo_idprestamo` INT NOT NULL,
  PRIMARY KEY (`idpago`),
  INDEX `fk_pago_prestamo1_idx` (`prestamo_idprestamo` ASC) VISIBLE,
  CONSTRAINT `fk_pago_prestamo1`
    FOREIGN KEY (`prestamo_idprestamo`)
    REFERENCES `descubierto`.`prestamo` (`idprestamo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `descubierto`.`cliente_has_cuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `descubierto`.`cliente_has_cuenta` (
  `id_cliente_has_cuenta` INT NOT NULL AUTO_INCREMENT,
  `cliente_idcliente` INT NOT NULL,
  `cuenta_idcuenta` INT NOT NULL,
  INDEX `fk_cliente_has_cuenta_cuenta1_idx` (`cuenta_idcuenta` ASC) VISIBLE,
  INDEX `fk_cliente_has_cuenta_cliente1_idx` (`cliente_idcliente` ASC) VISIBLE,
  PRIMARY KEY (`id_cliente_has_cuenta`),
  CONSTRAINT `fk_cliente_has_cuenta_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `descubierto`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_cuenta_cuenta1`
    FOREIGN KEY (`cuenta_idcuenta`)
    REFERENCES `descubierto`.`cuenta` (`idcuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `descubierto`.`cliente_has_prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `descubierto`.`cliente_has_prestamo` (
  `id_cliente_has_prestamo` INT NOT NULL AUTO_INCREMENT,
  `cliente_idcliente` INT NOT NULL,
  `prestamo_idprestamo` INT NOT NULL,
  INDEX `fk_cliente_has_prestamo_prestamo1_idx` (`prestamo_idprestamo` ASC) VISIBLE,
  INDEX `fk_cliente_has_prestamo_cliente1_idx` (`cliente_idcliente` ASC) VISIBLE,
  PRIMARY KEY (`id_cliente_has_prestamo`),
  CONSTRAINT `fk_cliente_has_prestamo_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `descubierto`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_prestamo_prestamo1`
    FOREIGN KEY (`prestamo_idprestamo`)
    REFERENCES `descubierto`.`prestamo` (`idprestamo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
