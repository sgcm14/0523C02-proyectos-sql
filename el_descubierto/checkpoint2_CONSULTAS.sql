USE el_descubierto;

/* 1. Listar todos los clientes cuyo nombre comience con la letra "A". Se debe mostrar
   id como "Número de cliente", apellido y nombre.*/
SELECT id AS "Número de cliente", apellido, nombre 
FROM cliente
WHERE nombre LIKE 'A%';	
-- 5 row(s) returned

/* 2. Mostrar el número de la sucursal con domicilio "Ramón Freire Serrano 7410".*/
SELECT numero 
FROM sucursal
WHERE domicilio = 'Ramón Freire Serrano 7410';
-- 1 row(s) returned (10)

/* 3. Se requiere saber cuál es el mayor importe prestado*/
SELECT max(importe) 
FROM prestamo;
-- 1 row(s) returned (49362.69)

/*4. Listar los pagos realizados con números 10, 14, 27, 45.*/
SELECT * 
FROM pago
/* WHERE prestamo_id=10 or prestamo_id=14 or prestamo_id=27 or prestamo_id=45;*/
WHERE prestamo_id IN (10, 14, 27, 45);
-- 10 row(s) returned

/*5. Calcular el total de los pagos realizados para el préstamo número cuarenta. El
reporte debe tener dos columnas denominadas "Número de préstamo" y el
"Total pagado".*/
SELECT prestamo_id AS 'Número de préstamo',SUM(importe) AS 'Total pagado' 
FROM pago
WHERE prestamo_id = 40;
-- 1 row(s) returned  ('40', '1757.70')

/*6. Listar los empleados que no pertenezcan a la sucursal dos y que la fecha de alta
del contrato sea mayor que 5/09/21 o igual a 25/06/21. Ordenar por alta de
contrato.*/
SELECT * 
FROM empleado
WHERE sucursal_numero <> 2 AND (alta_contrato_laboral >= '2021-09-05' OR alta_contrato_laboral = '2021-06-25')
ORDER BY alta_contrato_laboral ASC;
-- 2 row(s) returned

/*7. Listar los pagos realizados con importe entre $1030,25 a $1666,66 (ordenarlos
por el importe pagado de mayor a menor).*/
SELECT * 
FROM pago 
WHERE importe BETWEEN 1030.25 AND 1666.66
ORDER BY importe DESC;
-- 14 row(s) returned

/*8. Mostrar el quinto pago realizado con menor importe.*/
SELECT * 
FROM pago 
ORDER BY importe ASC
LIMIT 1 OFFSET 4;
-- 1 row(s) returned  (6	35	1	2021-10-27 12:01:00	252.47)

/*9. Mostrar el préstamo con mayor importe. Este reporte debe contener el número
del préstamo, la fecha de otorgamiento y el importe.*/
/*SELECT prestamo_id AS 'Número del préstamo', fecha AS 'Fecha de otorgamiento', MAX(importe) AS 'Importe' 
FROM pago
GROUP BY importe, prestamo_id, fecha
ORDER BY importe DESC
LIMIT 1;*/
SELECT prestamo_id AS 'Número del préstamo', fecha AS 'Fecha de otorgamiento', importe AS 'Importe' 
FROM pago
ORDER BY importe DESC
LIMIT 1;
-- 1 row(s) returned

/* 10 Mostrar las diez cuentas bancarias con menor saldo. Este reporte debe contener
el número de cuenta, saldo y el código del tipo de cuenta. */
SELECT numero  AS 'NUMERO DE CUENTA', saldo AS 'SALDO', cuenta_tipo_id AS 'CODIGO TIPO DE CUENTA'
FROM cuenta
ORDER BY saldo ASC
LIMIT 10;
-- 10 row(s) returned

/* 11 Listar los préstamos otorgados entre 10/07/21 al 10/08/21 (ordenarlos por fecha
de otorgamiento) */
SELECT * 
FROM prestamo
WHERE fecha_otorgado BETWEEN '2021-07-10' AND '2021-08-10'
ORDER BY fecha_otorgado;
-- 10 row(s) returned

/* 12 Listar en forma ordenada las cuentas bancarias que tengan un descubierto
otorgado superior o igual a $8999,80. */
SELECT * 
FROM cuenta
WHERE descubierto_otorgado >= 8999.80
ORDER BY descubierto_otorgado ASC;
-- 10 row(s) returned

/* 13. Listar todos los empleados cuyo apellido termine con los caracteres "do". Se
 debe mostrar el legajo, apellido, nombre y email.*/
SELECT legajo, apellido, nombre, email 
FROM empleado
WHERE apellido LIKE '%do';
-- 4 row(s) returned

/* 14. Se desea conocer cuál es el promedio de los saldos de las cajas de ahorro*/
SELECT ROUND(AVG(saldo),2) 
FROM cuenta
WHERE cuenta_tipo_id = 1;
-- 1 row(s) returned ('8274.07')

/* 15. Mostrar el tercer préstamo con mayor importe.*/
SELECT * FROM prestamo
ORDER BY importe DESC
LIMIT 1 OFFSET 2;
-- 1 row(s) returned

/*16. Calcular la cantidad de cuentas que tiene la sucursal número cinco. El reporte
debe tener dos columnas denominadas "Sucursal" y el "Cantidad de Cuentas".*/
SELECT sucursal_numero AS Sucursal, COUNT(*) AS "Cantidad de Cuentas" 
FROM cuenta
WHERE sucursal_numero = 5;
-- 1 row(s) returned

/*17. Mostrar todas las ciudades que contengan una palabra de cinco caracteres, pero
el tercer carácter debe ser igual a "n".*/
SELECT nombre
FROM ciudad
WHERE nombre LIKE '__n__';
-- 0 row(s) returned

/*18. Modificar el tipo de cuenta bancaria "Cuenta Corriente" a "Cuenta Especial"*/
UPDATE cuenta_tipo
SET tipo = 'CUENTA ESPECIAL'
WHERE tipo = 'CUENTA CORRIENTE'
AND id > 0;
-- 1 row(s) returned

/*19. En la fecha de hoy, agregar en la sucursal número nueve al empleado Quinteros
Arias Raúl Alejandro con domicilio en Av. 25 de mayo 7410 - Pilar - Buenos Aires,
mail: quiteros2021bs@gmail.com, teléfono móvil: '+5491154000745'.*/
INSERT INTO `empleado`
(`legajo`,
`sucursal_numero`,
`apellido`,
`nombre`,
`domicilio`,
`ciudad_id`,
`email`,
`telefono_movil`,
`alta_contrato_laboral`)
VALUES
(default,
9,
"Quinteros Arias",
"Raúl Alejandro",
"Av. 25 de mayo 7410",
14,
"quiteros2021bs@gmail.com",
"+5491154000745",
'2023-08-22');
-- 1 row(s) affected

/*20. Eliminar el registro del préstamo número cuarenta y cinco.*/
DELETE FROM `prestamo`
WHERE id=45;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`el_descubierto`.`cliente_x_prestamo`, CONSTRAINT `fk_cliente_has_prestamo_prestamo1` FOREIGN KEY (`prestamo_id`) REFERENCES `prestamo` (`id`))

/*21. Mostrar el importe total prestado por el banco a sus clientes.*/
SELECT SUM(importe)
FROM prestamo;
-- 1 row(s) returned

/* 22. Mostrar la cantidad total de cuentas activas que están registradas en el banco.*/
SELECT count(activa) 
FROM cuenta
WHERE activa = 1;
-- 1 row(s) returned (58)

/* 23. Mostrar el apellido y la cantidad de clientes que poseen el mismo apellido.*/
SELECT apellido, count(*) 
FROM cliente
GROUP BY apellido;
-- 42 row(s) returned

/* 24. Mostrar el id del país y la cantidad de ciudades que posee cada uno de ellos.*/
SELECT pais_id, count(*) FROM ciudad
GROUP BY pais_id;
-- 5 row(s) returned

/* 25. Necesitamos saber la cantidad de préstamos por sucursal y día otorgado. ¿Hay
sucursales que hayan realizado más de un préstamo el mismo día?*/
SELECT sucursal_numero, fecha_otorgado 
FROM prestamo
GROUP BY sucursal_numero, fecha_otorgado
ORDER BY sucursal_numero, fecha_otorgado;
-- 47 row(s) returned

SELECT sucursal_numero, fecha_otorgado 
FROM prestamo
GROUP BY sucursal_numero, fecha_otorgado
HAVING count(*)>1
ORDER BY sucursal_numero, fecha_otorgado;
-- 0 row(s) returned
-- No hay sucursales que hayan realizado mas de un prestamo el mismo dia
