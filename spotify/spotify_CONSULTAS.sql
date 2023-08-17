USE spotify;

INSERT INTO `spotify`.`pais`
(`nombre`)
VALUES
("Argentina");

INSERT INTO `spotify`.`pais`
(`nombre`)
VALUES
("Peru");

INSERT INTO `spotify`.`membresia`
(`nombre`)
VALUES
("premium");

INSERT INTO `spotify`.`membresia`
(`nombre`)
VALUES
("free");

INSERT INTO `spotify`.`usuario`
(`email`,
`fecha_nacimiento`,
`sexo`,
`cp`,
`pais_idpais`,
`membresia_idmembresia`)
VALUES
("email01@gmail.com",
"12/01/1996",
"F",
"1234",
1,
1);

INSERT INTO `spotify`.`usuario`
(`email`,
`fecha_nacimiento`,
`sexo`,
`cp`,
`pais_idpais`,
`membresia_idmembresia`)
VALUES
("email01@gmail.com",
'1996/01/02',
"F",
"1234",
1,
1);

INSERT INTO `spotify`.`usuario`
(`email`,
`fecha_nacimiento`,
`sexo`,
`cp`,
`pais_idpais`,
`membresia_idmembresia`)
VALUES
("email02@gmail.com",
'1992/01/02',
"M",
"1287",
2,
2);

INSERT INTO `spotify`.`usuario`
(`email`,
`fecha_nacimiento`,
`sexo`,
`cp`,
`pais_idpais`,
`membresia_idmembresia`)
VALUES
("email03@gmail.com",
'1990/12/02',
"F",
"9787",
1,
1);

UPDATE `spotify`.`usuario`
SET
`email` = "email@gmail.com",
`fecha_nacimiento` = '1992/07/14'
WHERE `idusuario` = 2;

