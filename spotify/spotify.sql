-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spotify` DEFAULT CHARACTER SET utf8 ;
USE `spotify` ;

-- -----------------------------------------------------
-- Table `spotify`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`pais` (
  `idpais` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  PRIMARY KEY (`idpais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`membresia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`membresia` (
  `idmembresia` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idmembresia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(70) NULL,
  `fecha_nacimiento` DATE NULL,
  `sexo` CHAR(1) NULL,
  `cp` VARCHAR(10) NULL,
  `pais_idpais` INT NOT NULL,
  `membresia_idmembresia` INT NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_pais1_idx` (`pais_idpais` ASC) VISIBLE,
  INDEX `fk_usuario_membresia1_idx` (`membresia_idmembresia` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_pais1`
    FOREIGN KEY (`pais_idpais`)
    REFERENCES `spotify`.`pais` (`idpais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_membresia1`
    FOREIGN KEY (`membresia_idmembresia`)
    REFERENCES `spotify`.`membresia` (`idmembresia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`historial_password`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`historial_password` (
  `idhistorial_password` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(45) NULL,
  `fecha_modificacion` DATE NULL,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`idhistorial_password`),
  INDEX `fk_historial_password_usuario_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_historial_password_usuario`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `spotify`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist` (
  `idplaylist` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL,
  `cantidad_canciones` INT NULL,
  `fecha_creacion` DATE NULL,
  `usuario_idusuario` INT NOT NULL,
  `activa` TINYINT(1) NULL,
  `fecha_eliminacion` DATE NULL,
  PRIMARY KEY (`idplaylist`),
  INDEX `fk_playlist_usuario1_idx` (`usuario_idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `spotify`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`discografica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`discografica` (
  `iddiscografica` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(15) NULL,
  `imagen` VARCHAR(45) NULL,
  `pais_idpais` INT NOT NULL,
  PRIMARY KEY (`iddiscografica`),
  INDEX `fk_discografica_pais1_idx` (`pais_idpais` ASC) VISIBLE,
  CONSTRAINT `fk_discografica_pais1`
    FOREIGN KEY (`pais_idpais`)
    REFERENCES `spotify`.`pais` (`idpais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`artista` (
  `idartista` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `imagen` VARCHAR(70) NULL,
  PRIMARY KEY (`idartista`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`album` (
  `idalbum` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(70) NULL,
  `anio_publicacion` YEAR(4) NULL,
  `imagen` VARCHAR(70) NULL,
  `discografica_iddiscografica` INT NOT NULL,
  `artista_idartista` INT NOT NULL,
  PRIMARY KEY (`idalbum`),
  INDEX `fk_album_discografica1_idx` (`discografica_iddiscografica` ASC) VISIBLE,
  INDEX `fk_album_artista1_idx` (`artista_idartista` ASC) VISIBLE,
  CONSTRAINT `fk_album_discografica1`
    FOREIGN KEY (`discografica_iddiscografica`)
    REFERENCES `spotify`.`discografica` (`iddiscografica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_album_artista1`
    FOREIGN KEY (`artista_idartista`)
    REFERENCES `spotify`.`artista` (`idartista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`canciones` (
  `idcanciones` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL,
  `cantidad_reproduccion` INT NULL,
  `duracion` FLOAT(5,2) NULL,
  `cantidad_likes` INT NULL,
  `album_idalbum` INT NOT NULL,
  PRIMARY KEY (`idcanciones`),
  INDEX `fk_canciones_album1_idx` (`album_idalbum` ASC) VISIBLE,
  CONSTRAINT `fk_canciones_album1`
    FOREIGN KEY (`album_idalbum`)
    REFERENCES `spotify`.`album` (`idalbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`genero` (
  `idgenero` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idgenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`genero_has_canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`genero_has_canciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `genero_idgenero` INT NOT NULL,
  `canciones_idcanciones` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_genero_has_canciones_canciones1_idx` (`canciones_idcanciones` ASC) VISIBLE,
  INDEX `fk_genero_has_canciones_genero1_idx` (`genero_idgenero` ASC) VISIBLE,
  CONSTRAINT `fk_genero_has_canciones_genero1`
    FOREIGN KEY (`genero_idgenero`)
    REFERENCES `spotify`.`genero` (`idgenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_genero_has_canciones_canciones1`
    FOREIGN KEY (`canciones_idcanciones`)
    REFERENCES `spotify`.`canciones` (`idcanciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`playlist_has_canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist_has_canciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `playlist_idplaylist` INT NOT NULL,
  `canciones_idcanciones` INT NOT NULL,
  INDEX `fk_playlist_has_canciones_canciones1_idx` (`canciones_idcanciones` ASC) VISIBLE,
  INDEX `fk_playlist_has_canciones_playlist1_idx` (`playlist_idplaylist` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_playlist_has_canciones_playlist1`
    FOREIGN KEY (`playlist_idplaylist`)
    REFERENCES `spotify`.`playlist` (`idplaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_has_canciones_canciones1`
    FOREIGN KEY (`canciones_idcanciones`)
    REFERENCES `spotify`.`canciones` (`idcanciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
