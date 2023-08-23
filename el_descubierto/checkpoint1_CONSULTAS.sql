USE descubierto;

INSERT INTO `descubierto`.`interes`
VALUES
(default,"Interes fijo"),
(default,"Interes variable"),
(default,"Otros intereses");

INSERT INTO `tipo_cuenta`
VALUES
(default,"C.A"),
(default,"C.C"),
(default,"C.Otras");

SELECT * FROM `tipo_cuenta`;

UPDATE `tipo_cuenta`
SET
`descripcion` = "CAJA DE AHORRO"
WHERE `idtipo_cuenta` = 01;

UPDATE `tipo_cuenta`
SET
`descripcion` = "CUENTA CORRIENTE"
WHERE `idtipo_cuenta` = 02;

DELETE FROM `tipo_cuenta`
WHERE `idtipo_cuenta` = 03;
SELECT * FROM `tipo_cuenta`;