-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dhTube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dhTube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dhTube` DEFAULT CHARACTER SET utf8 ;
USE `dhTube` ;

-- -----------------------------------------------------
-- Table `dhTube`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dhTube`.`pais` (
  `id_pais` INT NOT NULL AUTO_INCREMENT,
  `nombre_pais` VARCHAR(100) NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dhTube`.`avatar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dhTube`.`avatar` (
  `id_avatar` INT NOT NULL AUTO_INCREMENT,
  `nombre_avatar` VARCHAR(45) NULL,
  `url_imagen_avatar` VARCHAR(100) NULL,
  PRIMARY KEY (`id_avatar`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dhTube`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dhTube`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre_usuario` VARCHAR(45) NULL,
  `email_usuario` VARCHAR(45) NULL,
  `password_usuario` VARCHAR(45) NULL,
  `fecha_nacimiento` DATETIME NULL,
  `codigo_postal` VARCHAR(45) NULL,
  `pais_id_pais` INT NOT NULL,
  `avatar_id_avatar` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_usuario_pais1_idx` (`pais_id_pais` ASC) VISIBLE,
  INDEX `fk_usuario_avatar1_idx` (`avatar_id_avatar` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_pais1`
    FOREIGN KEY (`pais_id_pais`)
    REFERENCES `dhTube`.`pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_avatar1`
    FOREIGN KEY (`avatar_id_avatar`)
    REFERENCES `dhTube`.`avatar` (`id_avatar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dhTube`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dhTube`.`playlist` (
  `id_playlist` INT NOT NULL AUTO_INCREMENT,
  `nombre_playlist` VARCHAR(45) NULL,
  `fecha_creacion` DATETIME NULL,
  `privado` SMALLINT NULL,
  `usuario_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_playlist`),
  INDEX `fk_playlist_usuario1_idx` (`usuario_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `dhTube`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dhTube`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dhTube`.`video` (
  `id_video` INT NOT NULL AUTO_INCREMENT,
  `titulo_video` VARCHAR(100) NULL,
  `descripcion_video` TEXT NULL,
  `tamanio_video` DOUBLE NULL,
  `nombre_archivo` VARCHAR(100) NULL,
  `duracion_video` DOUBLE NULL,
  `imagen_video` VARCHAR(100) NULL,
  `cantidad_reproducciones` INT NULL,
  `cantidad_likes` INT NULL,
  `cantidad_dislikes` INT NULL,
  `privado` SMALLINT NULL,
  `fecha_publicacion` DATETIME NULL,
  `usuario_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_video`),
  INDEX `fk_video_usuario1_idx` (`usuario_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_video_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `dhTube`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dhTube`.`etiqueta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dhTube`.`etiqueta` (
  `id_etiqueta` INT NOT NULL AUTO_INCREMENT,
  `nombre_etiqueta` VARCHAR(45) NULL,
  PRIMARY KEY (`id_etiqueta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dhTube`.`tipo_reaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dhTube`.`tipo_reaccion` (
  `id_tipo_reaccion` INT NOT NULL AUTO_INCREMENT,
  `nombre_tipo_reaccion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_reaccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dhTube`.`video_has_playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dhTube`.`video_has_playlist` (
  `id_video_has_playlist` INT NOT NULL AUTO_INCREMENT,
  `video_id_video` INT NOT NULL,
  `playlist_id_playlist` INT NOT NULL,
  INDEX `fk_video_has_playlist_playlist1_idx` (`playlist_id_playlist` ASC) VISIBLE,
  INDEX `fk_video_has_playlist_video_idx` (`video_id_video` ASC) VISIBLE,
  PRIMARY KEY (`id_video_has_playlist`),
  CONSTRAINT `fk_video_has_playlist_video`
    FOREIGN KEY (`video_id_video`)
    REFERENCES `dhTube`.`video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_has_playlist_playlist1`
    FOREIGN KEY (`playlist_id_playlist`)
    REFERENCES `dhTube`.`playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dhTube`.`video_has_etiqueta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dhTube`.`video_has_etiqueta` (
  `id_video_has_etiqueta` INT NOT NULL AUTO_INCREMENT,
  `video_id_video` INT NOT NULL,
  `etiqueta_id_etiqueta` INT NOT NULL,
  INDEX `fk_video_has_etiqueta_etiqueta1_idx` (`etiqueta_id_etiqueta` ASC) VISIBLE,
  INDEX `fk_video_has_etiqueta_video1_idx` (`video_id_video` ASC) VISIBLE,
  PRIMARY KEY (`id_video_has_etiqueta`),
  CONSTRAINT `fk_video_has_etiqueta_video1`
    FOREIGN KEY (`video_id_video`)
    REFERENCES `dhTube`.`video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_has_etiqueta_etiqueta1`
    FOREIGN KEY (`etiqueta_id_etiqueta`)
    REFERENCES `dhTube`.`etiqueta` (`id_etiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dhTube`.`canal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dhTube`.`canal` (
  `id_canal` INT NOT NULL AUTO_INCREMENT,
  `nombre_canal` VARCHAR(45) NULL,
  `descripcion_canal` TEXT NULL,
  `fecha_creacion_canal` DATETIME NULL,
  `usuario_id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_canal`),
  INDEX `fk_canal_usuario1_idx` (`usuario_id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_canal_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `dhTube`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dhTube`.`reaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dhTube`.`reaccion` (
  `id_reaccion` INT NOT NULL AUTO_INCREMENT,
  `usuario_id_usuario` INT NOT NULL,
  `tipo_reaccion_id_tipo_reaccion` INT NOT NULL,
  `fecha_reaccion` DATETIME NULL,
  `video_id_video` INT NOT NULL,
  INDEX `fk_usuario_has_tipo_reaccion_tipo_reaccion1_idx` (`tipo_reaccion_id_tipo_reaccion` ASC) VISIBLE,
  INDEX `fk_usuario_has_tipo_reaccion_usuario1_idx` (`usuario_id_usuario` ASC) VISIBLE,
  PRIMARY KEY (`id_reaccion`),
  INDEX `fk_reaccion_video1_idx` (`video_id_video` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_tipo_reaccion_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `dhTube`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_tipo_reaccion_tipo_reaccion1`
    FOREIGN KEY (`tipo_reaccion_id_tipo_reaccion`)
    REFERENCES `dhTube`.`tipo_reaccion` (`id_tipo_reaccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reaccion_video1`
    FOREIGN KEY (`video_id_video`)
    REFERENCES `dhTube`.`video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
