CREATE SCHEMA `playground`;

CREATE TABLE `playground`.`categorias`(
`idcategoria` INT NOT NULL,
`nombre` VARCHAR(100) NULL,
PRIMARY KEY(`idcategoria`));

CREATE TABLE `playground`.`usuarios`(
`idusuario` INT NOT NULL,
`nombre` VARCHAR(100) NULL,
`apellido` VARCHAR(100) NULL,
`email` VARCHAR(50) NULL,
`categoria` INT NULL,
PRIMARY KEY(`idusuario`),
INDEX `FKcategoria_idx` (`categoria` ASC) VISIBLE,
CONSTRAINT `FKcategoria`
	FOREIGN KEY (`categoria`)
    REFERENCES `playground`.`categorias`(`idcategoria`)
);

CREATE TABLE `playground`.`carrera`(
`idcarrera` INT NOT NULL,
`titulo` VARCHAR(45) NULL,
`descripcion` VARCHAR(100) NULL,
PRIMARY KEY(`idcarrera`));

CREATE TABLE `playground`.`usuarios_carrera`(
`id` INT NOT NULL,
`usuario` INT NULL,
`carrera` INT NULL,
`fechainscripcion`DATE NULL,
PRIMARY KEY(`id`),
INDEX `usuario_idx` (`usuario` ASC) VISIBLE,
INDEX `carrera_idx` (`carrera` ASC) VISIBLE,
CONSTRAINT `usuario`
	FOREIGN KEY (`usuario`)
    REFERENCES `playground`.`usuarios`(`idusuario`),
CONSTRAINT `carrera`
	FOREIGN KEY (`carrera`)
    REFERENCES `playground`.`carrera`(`idcarrera`)
);

