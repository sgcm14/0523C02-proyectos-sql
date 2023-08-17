use universo_lector;

/*En la base de datos “UniversoLector” agregar datos en las siguientes tablas*/
/*Localidad*/
INSERT INTO `universo_lector`.`localidad`
(`nombre_localidad`)
VALUES
("QLD");
INSERT INTO `universo_lector`.`localidad`
(`nombre_localidad`)
VALUES
("ALBERTA");
INSERT INTO `universo_lector`.`localidad`
(`nombre_localidad`)
VALUES
("NOTHWEST BORDER PROV");
INSERT INTO `universo_lector`.`localidad`
(`nombre_localidad`)
VALUES
("DHAKA");
/**************************************************/
/*Socio*/
INSERT INTO `universo_lector`.`socio`
(`dni`,
`nombre`,
`apellido`,
`direccion`,
`localidad_id_localidad`)
VALUES
("3000000",
"PATRICIA",
"JOHNSON",
"28 MySQL Boulevard",
1);

INSERT INTO `universo_lector`.`socio`
(`dni`,
`nombre`,
`apellido`,
`direccion`,
`localidad_id_localidad`)
VALUES
("2988800",
"LINDA",
"WILLIAMS",
"23 Workhaven Lane",
2);

INSERT INTO `universo_lector`.`socio`
(`dni`,
`nombre`,
`apellido`,
`direccion`,
`localidad_id_localidad`)
VALUES
("2500000",
"BARBARA",
"JONES",
"1411 Lillydale Drive",
1);

INSERT INTO `universo_lector`.`socio`
(`dni`,
`nombre`,
`apellido`,
`direccion`,
`localidad_id_localidad`)
VALUES
("32980002",
"LOIS",
"BUTLER",
"1688 Okara Way",
3);

INSERT INTO `universo_lector`.`socio`
(`dni`,
`nombre`,
`apellido`,
`direccion`,
`localidad_id_localidad`)
VALUES
("2313909",
"ROBIN",
"HAYES",
"262 A Corua (La Corua) Parkway",
4);
/**************************************************/
/*Socio- Telefono*/
INSERT INTO `universo_lector`.`socio_telefono`
(`socio_id_socio`,
`numero_socio_telefono`)
VALUES
(1,
"54911-45636453");

INSERT INTO `universo_lector`.`socio_telefono`
(`socio_id_socio`,
`numero_socio_telefono`)
VALUES
(2,
"54-11-47867654");

INSERT INTO `universo_lector`.`socio_telefono`
(`socio_id_socio`,
`numero_socio_telefono`)
VALUES
(3,
"11498-2173");

INSERT INTO `universo_lector`.`socio_telefono`
(`socio_id_socio`,
`numero_socio_telefono`)
VALUES
(4,
"11684736");

INSERT INTO `universo_lector`.`socio_telefono`
(`socio_id_socio`,
`numero_socio_telefono`)
VALUES
(5,
"2645887755");
/**************************************************/
/*Autor*/
INSERT INTO `universo_lector`.`autor`
(`nombre_autor`,
`apellidos_autor`)
VALUES
("J. K. ",
"Rowling");
/**************************************************/
/*Editorial*/
INSERT INTO `universo_lector`.`editorial`
(`razon_social`)
VALUES
("Bloomsbury Publishing");

INSERT INTO `universo_lector`.`editorial`
(`razon_social`)
VALUES
("Scholastic");

INSERT INTO `universo_lector`.`editorial`
(`razon_social`)
VALUES
("Pottermore Limited");

INSERT INTO `universo_lector`.`editorial`
(`razon_social`)
VALUES
("Editorial Salamandra ");
/**************************************************/
/*Editorial-Telefono*/
INSERT INTO `universo_lector`.`editorial_telefono`
(`editorial_id_editorial`,
`numero_editorial_telefono`)
VALUES
(1,
"54911564874");

INSERT INTO `universo_lector`.`editorial_telefono`
(`editorial_id_editorial`,
`numero_editorial_telefono`)
VALUES
(2,
"223483646");

INSERT INTO `universo_lector`.`editorial_telefono`
(`editorial_id_editorial`,
`numero_editorial_telefono`)
VALUES
(3,
"5694839582");

INSERT INTO `universo_lector`.`editorial_telefono`
(`editorial_id_editorial`,
`numero_editorial_telefono`)
VALUES
(4,
"011-239-2343");
/**************************************************/
/*Libro*/
INSERT INTO `universo_lector`.`libro`
(`autor_id_autor`,
`editorial_id_editorial`,
`isbn`,
`titulo`,
`anio_escrito`,
`anio_edicion`)
VALUES
(1,
4,
"9781907545009",
"Harry Potter y la piedra filosofal",
1997,
1997);

INSERT INTO `universo_lector`.`libro`
(`autor_id_autor`,
`editorial_id_editorial`,
`isbn`,
`titulo`,
`anio_escrito`,
`anio_edicion`)
VALUES
(1,
4,
"9789878000114",
"Harry Potter Y La Camara Secreta ",
2020,
2020);

/**************************************************/
/*Copia*/
INSERT INTO `universo_lector`.`copia`
(`libros_id_libros`,
`deteriorado`)
VALUES
(1,
0);

INSERT INTO `universo_lector`.`copia`
(`libros_id_libros`,
`deteriorado`)
VALUES
(2,
0);
/**************************************************/
/*Prestamo*/
INSERT INTO `universo_lector`.`prestamo`
(`socio_id_socio`,
`fecha_retiro`,
`fecha_tope`,
`fecha_devolucion`)
VALUES
(1,
'2020-01-01',
'2020-01-07',
'2020-01-07');

INSERT INTO `universo_lector`.`prestamo`
(`socio_id_socio`,
`fecha_retiro`,
`fecha_tope`,
`fecha_devolucion`)
VALUES
(1,
'2020-01-07',
'2020-01-14',
'2020-01-15');

INSERT INTO `universo_lector`.`prestamo`
(`socio_id_socio`,
`fecha_retiro`,
`fecha_tope`,
`fecha_devolucion`)
VALUES
(2,
'2020-03-04',
'2020-03-11',
'2020-03-08');
/**************************************************/
/*Prestamo_x_copia*/
INSERT INTO `universo_lector`.`copia_has_prestamo`
(`copia_id_copia`,
`prestamo_id_prestamo`)
VALUES
(1,
1);

INSERT INTO `universo_lector`.`copia_has_prestamo`
(`copia_id_copia`,
`prestamo_id_prestamo`)
VALUES
(2,
2);

INSERT INTO `universo_lector`.`copia_has_prestamo`
(`copia_id_copia`,
`prestamo_id_prestamo`)
VALUES
(3,
1);

INSERT INTO `universo_lector`.`copia_has_prestamo`
(`copia_id_copia`,
`prestamo_id_prestamo`)
VALUES
(3,
3);
/**************************************************/

/*SOCIO
Un socio te pide que actualices su dirección a “Monroe 860”. Selecciona el socio número 3 y actualiza su dirección.*/
UPDATE `universo_lector`.`socio`
SET
`direccion` = "Monroe 860"
WHERE `id_socio` = 3;

/*El socio número 3,  solicitó también que se agregue su nuevo numero de telefono 011-5263-7400*/
UPDATE `universo_lector`.`socio_telefono`
SET
`numero_socio_telefono` = "011-5263-7400"
WHERE `socio_id_socio` = 3;


/*EDITORIAL
La editorial Salamandra ha cambiado su número de teléfono a 011-5415-2575*/
SELECT * FROM universo_lector.editorial where razon_social="Salamandra"
/*No hay resultados asi que no se puede cambiar el telefono*/

/*Tabla SOCIO
Borrar un socio.*/
DELETE FROM `universo_lector`.`socio_telefono`
WHERE socio_id_socio = 5;

DELETE FROM `universo_lector`.`socio`
WHERE id_socio = 5;


/*Tabla LIBROS
Intentar borrar un libro que tenga una o más copias asociadas. ¿Qué sucede en ese caso?*/
DELETE FROM `universo_lector`.`libro`
WHERE id_libro=1;
/*No se va poder hasta eliminar los campos relacionados con este registro*/