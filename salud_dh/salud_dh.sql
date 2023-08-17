-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema salud_DH
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema salud_DH
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `salud_DH` DEFAULT CHARACTER SET utf8 ;
USE `salud_DH` ;

-- -----------------------------------------------------
-- Table `salud_DH`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_DH`.`paciente` (
  `idpaciente` INT NOT NULL AUTO_INCREMENT,
  `identificacion_salud` BIGINT(10) NULL,
  `nombre` VARCHAR(50) NULL,
  `apellido` VARCHAR(50) NULL,
  PRIMARY KEY (`idpaciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salud_DH`.`especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_DH`.`especialidad` (
  `idespecialidad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(5) NULL,
  PRIMARY KEY (`idespecialidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salud_DH`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_DH`.`medico` (
  `idmedico` INT NOT NULL AUTO_INCREMENT,
  `matricula` BIGINT(10) NULL,
  `nombre` VARCHAR(50) NULL,
  `apellido` VARCHAR(50) NULL,
  `especialidad_idespecialidad` INT NOT NULL,
  PRIMARY KEY (`idmedico`),
  INDEX `fk_medico_especialidad_idx` (`especialidad_idespecialidad` ASC) VISIBLE,
  CONSTRAINT `fk_medico_especialidad`
    FOREIGN KEY (`especialidad_idespecialidad`)
    REFERENCES `salud_DH`.`especialidad` (`idespecialidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `salud_DH`.`turno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salud_DH`.`turno` (
  `medico_idmedico` INT NOT NULL,
  `paciente_idpaciente` INT NOT NULL,
  `fecha` DATETIME NULL,
  INDEX `fk_turno_paciente1_idx` (`paciente_idpaciente` ASC) VISIBLE,
  INDEX `fk_turno_medico1_idx` (`medico_idmedico` ASC) VISIBLE,
  CONSTRAINT `fk_turno_paciente1`
    FOREIGN KEY (`paciente_idpaciente`)
    REFERENCES `salud_DH`.`paciente` (`idpaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turno_medico1`
    FOREIGN KEY (`medico_idmedico`)
    REFERENCES `salud_DH`.`medico` (`idmedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
