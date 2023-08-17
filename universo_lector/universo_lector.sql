-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema universo_lector
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema universo_lector
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `universo_lector` DEFAULT CHARACTER SET utf8 ;
USE `universo_lector` ;

-- -----------------------------------------------------
-- Table `universo_lector`.`localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universo_lector`.`localidad` (
  `id_localidad` INT NOT NULL AUTO_INCREMENT,
  `nombre_localidad` VARCHAR(45) NULL,
  PRIMARY KEY (`id_localidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universo_lector`.`socio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universo_lector`.`socio` (
  `id_socio` INT NOT NULL AUTO_INCREMENT,
  `dni` CHAR(8) NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `direccion` VARCHAR(70) NULL,
  `localidad_id_localidad` INT NOT NULL,
  PRIMARY KEY (`id_socio`),
  INDEX `fk_socio_localidad1_idx` (`localidad_id_localidad` ASC) VISIBLE,
  CONSTRAINT `fk_socio_localidad1`
    FOREIGN KEY (`localidad_id_localidad`)
    REFERENCES `universo_lector`.`localidad` (`id_localidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universo_lector`.`editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universo_lector`.`editorial` (
  `id_editorial` INT NOT NULL AUTO_INCREMENT,
  `razon_social` VARCHAR(50) NULL,
  PRIMARY KEY (`id_editorial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universo_lector`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universo_lector`.`autor` (
  `id_autor` INT NOT NULL AUTO_INCREMENT,
  `nombre_autor` VARCHAR(30) NULL,
  `apellidos_autor` VARCHAR(30) NULL,
  PRIMARY KEY (`id_autor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universo_lector`.`libro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universo_lector`.`libro` (
  `id_libro` INT NOT NULL AUTO_INCREMENT,
  `autor_id_autor` INT NOT NULL,
  `editorial_id_editorial` INT NOT NULL,
  `isbn` CHAR(13) NULL,
  `titulo` VARCHAR(50) NULL,
  `anio_escrito` SMALLINT(4) NULL,
  `anio_edicion` SMALLINT(4) NULL,
  PRIMARY KEY (`id_libro`),
  UNIQUE INDEX `ISBN_UNIQUE` (`isbn` ASC) VISIBLE,
  INDEX `fk_libros_editorial_idx` (`editorial_id_editorial` ASC) VISIBLE,
  INDEX `fk_libros_autor1_idx` (`autor_id_autor` ASC) VISIBLE,
  CONSTRAINT `fk_libros_editorial`
    FOREIGN KEY (`editorial_id_editorial`)
    REFERENCES `universo_lector`.`editorial` (`id_editorial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_libros_autor1`
    FOREIGN KEY (`autor_id_autor`)
    REFERENCES `universo_lector`.`autor` (`id_autor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universo_lector`.`prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universo_lector`.`prestamo` (
  `id_prestamo` INT NOT NULL AUTO_INCREMENT,
  `socio_id_socio` INT NOT NULL,
  `fecha_retiro` DATE NULL,
  `fecha_tope` DATE NULL,
  `fecha_devolucion` DATE NULL,
  PRIMARY KEY (`id_prestamo`),
  INDEX `fk_prestamo_socio1_idx` (`socio_id_socio` ASC) VISIBLE,
  CONSTRAINT `fk_prestamo_socio1`
    FOREIGN KEY (`socio_id_socio`)
    REFERENCES `universo_lector`.`socio` (`id_socio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universo_lector`.`copia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universo_lector`.`copia` (
  `id_copia` INT NOT NULL AUTO_INCREMENT,
  `libros_id_libros` INT NOT NULL,
  `deteriorado` TINYINT(1) NULL,
  PRIMARY KEY (`id_copia`),
  INDEX `fk_copia_libros1_idx` (`libros_id_libros` ASC) VISIBLE,
  CONSTRAINT `fk_copia_libros1`
    FOREIGN KEY (`libros_id_libros`)
    REFERENCES `universo_lector`.`libro` (`id_libro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universo_lector`.`copia_has_prestamo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universo_lector`.`copia_has_prestamo` (
  `copia_id_copia` INT NOT NULL,
  `prestamo_id_prestamo` INT NOT NULL,
  PRIMARY KEY (`copia_id_copia`, `prestamo_id_prestamo`),
  INDEX `fk_copia_has_prestamo_prestamo1_idx` (`prestamo_id_prestamo` ASC) VISIBLE,
  INDEX `fk_copia_has_prestamo_copia1_idx` (`copia_id_copia` ASC) VISIBLE,
  CONSTRAINT `fk_copia_has_prestamo_copia1`
    FOREIGN KEY (`copia_id_copia`)
    REFERENCES `universo_lector`.`copia` (`id_copia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_copia_has_prestamo_prestamo1`
    FOREIGN KEY (`prestamo_id_prestamo`)
    REFERENCES `universo_lector`.`prestamo` (`id_prestamo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universo_lector`.`socio_telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universo_lector`.`socio_telefono` (
  `id_socio_telefono` INT NOT NULL AUTO_INCREMENT,
  `socio_id_socio` INT NOT NULL,
  `numero_socio_telefono` CHAR(15) NULL,
  PRIMARY KEY (`id_socio_telefono`),
  INDEX `fk_socio_telefono_socio1_idx` (`socio_id_socio` ASC) VISIBLE,
  CONSTRAINT `fk_socio_telefono_socio1`
    FOREIGN KEY (`socio_id_socio`)
    REFERENCES `universo_lector`.`socio` (`id_socio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universo_lector`.`editorial_telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universo_lector`.`editorial_telefono` (
  `id_editorial_telefono` INT NOT NULL AUTO_INCREMENT,
  `editorial_id_editorial` INT NOT NULL,
  `numero_editorial_telefono` CHAR(15) NULL,
  PRIMARY KEY (`id_editorial_telefono`),
  INDEX `fk_editorial_telefono_editorial1_idx` (`editorial_id_editorial` ASC) VISIBLE,
  CONSTRAINT `fk_editorial_telefono_editorial1`
    FOREIGN KEY (`editorial_id_editorial`)
    REFERENCES `universo_lector`.`editorial` (`id_editorial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
