INSERT INTO `playground`.`categorias`
(`idcategoria`,
`nombre`)
VALUES
(1,
"Alumno"),
(2,
"Docente"),
(3,
"Editor"),
(4,
"Administrador");

INSERT INTO `playground`.`usuarios`
(`idusuario`,
`nombre`,
`apellido`,
`email`,
`categoria`)
VALUES
(1,
"Juan",
"Perez",
"jperez@gmail.com",
1);

INSERT INTO `playground`.`carrera`
(`idcarrera`,
`titulo`,
`descripcion`)
VALUES
(1,
"Certified Tech Developer",
"Carrera de programación y desarrollo de productos digitales");

INSERT INTO `playground`.`usuarios_carrera`
(`id`,
`usuario`,
`carrera`,
`fechainscripcion`)
VALUES
(1,
1,
1,
'2021-03-01');

DELETE FROM `playground`.`categorias`
WHERE nombre="Editor";
/*23:43:09	DELETE FROM `playground`.`categorias` WHERE nombre="Editor"	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec
*/



