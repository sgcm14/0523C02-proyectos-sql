USE el_descubierto;

/* 1. Listar todos los clientes que tengan tres o más cuentas bancarias. Mostrar el
número de cliente, apellido y nombre separado por un espacio dentro de una
misma columna denominada "Cliente" y, la cantidad de cuentas que posee. */
SELECT  CONCAT(cliente.id, ' ', cliente.apellido, ' ', cliente.nombre) AS Cliente, 
        COUNT(cliente_x_cuenta.cliente_id) AS CantidadCuentas
FROM cliente
JOIN  cliente_x_cuenta ON cliente.id = cliente_x_cuenta.cliente_id
GROUP BY  cliente.id, cliente.apellido, cliente.nombre
HAVING COUNT(cliente_x_cuenta.cliente_id) >= 3;
-- 6row(s)

/* 2. Listar todos los clientes que no tengan una cuenta bancaria. Mostrar el número
de cliente, apellido y nombre en mayúsculas dentro de una misma columna
denominada "Cliente sin cuenta bancaria". */
SELECT CONCAT(cliente.id, ' ', UPPER(cliente.apellido), ' ', UPPER(cliente.nombre)) AS "Cliente sin cuenta bancaria"
FROM cliente
LEFT JOIN cliente_x_cuenta ON cliente.id = cliente_x_cuenta.cliente_id
WHERE   cliente_x_cuenta.cliente_id IS NULL;
-- 8 rows

/* 3. Listar todos los clientes que tengan al menos un préstamo que corresponda a la
sucursal de la ciudad de "Pilar - Buenos Aires". Se debe mostrar el número de
cliente, apellido, nombre, número de préstamo, número de sucursal, nombre de
la ciudad y país de dicha sucursal.*/
SELECT   cliente.id AS "Número de Cliente",
        cliente.apellido AS Apellido,
        cliente.nombre AS Nombre,
        prestamo.id AS "Número de Préstamo",
        sucursal.numero AS "Número de Sucursal",
        ciudad.nombre AS "Nombre de Ciudad",
        pais.nombre AS "Nombre de País"
FROM cliente
JOIN cliente_x_prestamo ON cliente.id = cliente_x_prestamo.cliente_id
JOIN prestamo ON cliente_x_prestamo.prestamo_id = prestamo.id
JOIN sucursal ON prestamo.sucursal_numero = sucursal.numero
JOIN ciudad ON sucursal.Ciudad_id = ciudad.id
JOIN pais ON ciudad.pais_id = pais.id
WHERE ciudad.nombre = 'Pilar - Buenos Aires';
-- 3 rows

/* 4. Listar los clientes que tengan una o más cajas de ahorro y que en la segunda
letra de su apellido contenga una "e".*/
SELECT  cliente.id AS "Número de Cliente",
        cliente.apellido AS Apellido,
        cliente.nombre AS Nombre
FROM cliente
JOIN cliente_x_cuenta ON cliente.id = cliente_x_cuenta.cliente_id
JOIN cuenta ON cliente_x_cuenta.cuenta_numero = cuenta.numero
JOIN  cuenta_tipo ON cuenta.cuenta_tipo_id = cuenta_tipo.id
WHERE  cuenta_tipo.tipo = 'CAJA DE AHORRO'
      AND SUBSTRING(LOWER(cliente.apellido), 2, 1) = 'e';
-- 5 rows

/*5. Listar absolutamente todos los países y la cantidad de clientes que tengan.*/
SELECT pais.nombre, COUNT(cliente.id) AS contador
FROM pais
LEFT JOIN ciudad ON pais.id = ciudad.pais_id
LEFT JOIN cliente ON ciudad.id = cliente.ciudad_id
GROUP BY pais.nombre
ORDER BY contador DESC;
-- 20 row(s) returned

/*6. Calcular el importe total y la cantidad de préstamos otorgados en el mes de
agosto por cada cliente. Mostrar el número de cliente, importe total y cantidad
de préstamos.*/
SELECT  cliente_x_prestamo.cliente_id as 'ID cliente', 
        SUM(prestamo.importe) as 'Importe total préstamos',  
        COUNT(cliente_x_prestamo.cliente_id) as 'Cantidad de préstamos'
FROM cliente_x_prestamo
JOIN prestamo ON cliente_x_prestamo.prestamo_id = prestamo.id
where month(fecha_otorgado) = 08
group by cliente_x_prestamo.cliente_id, prestamo.importe, cliente_x_prestamo.cliente_id
Order by cliente_x_prestamo.cliente_id;
-- Devuelve 10 registros

/*7. Calcular el importe total y la cantidad de cuotas pagadas para el préstamo
número cuarenta.*/
SELECT  prestamo.id , SUM(pago.importe) as 'Importe total pagado', 
        COUNT(pago.prestamo_id) as 'Total cuotas pagadas'
FROM prestamo
JOIN pago ON prestamo.id = pago.prestamo_id
where prestamo.id=40;
-- Devuelve 1 solo registro

/*8. Determinar el importe restante que falta por pagar para el préstamo número 45.*/
SELECT  prestamo.id ,prestamo.importe as 'Importe Prestado', 
        SUM(pago.importe) as 'Importe Total Pagado',  
        (prestamo.importe - SUM(pago.importe)) AS 'Importe Falta pagar'
FROM prestamo
JOIN pago ON prestamo.id = pago.prestamo_id
where prestamo.id=45;
/* Devuelve 1 solo registro 
12621.41 - (1051.78*2) = 10.517,85 */

/*9. Listar los préstamos de la sucursal número cuatro. Mostrar el número de cliente,
apellido, nombre y el número de préstamo.*/
SELECT  b.cliente_id,
        c.apellido,
        c.nombre,
        b.prestamo_id
FROM prestamo a
INNER JOIN cliente_x_prestamo b ON a.id = b.prestamo_id
INNER JOIN cliente c ON b.cliente_id = c.id
WHERE a.sucursal_numero = '4';
-- 6 row(s) returned

/*10. Reportar el número del préstamo y la cantidad de cuotas pagadas por cada uno
préstamo. Se debe formatear el dato de la cantidad de cuotas pagadas, por
ejemplo, si se ha pagado una cuota, sería "1 cuota paga"; si se han pagado dos o
más cuotas, sería en plural "2 cuotas pagas" y "Ninguna cuota paga" para los
préstamos que aún no han recibido un pago.*/
SELECT a.id,
  CASE
    WHEN COUNT(b.cuota_nro) = 1 THEN '1 cuota paga'
    WHEN COUNT(b.cuota_nro) > 1 THEN CONCAT(COUNT(b.cuota_nro), ' cuotas pagas')
  ELSE 'Ninguna cuota paga'
    END AS 'cuotas pagadas'
FROM prestamo a 
LEFT JOIN pago b ON a.id = b.prestamo_id
GROUP BY a.id;
-- 47 row(s) returned

/*11. Listar absolutamente todos los empleados y las cuentas bancarias que tengan
asociada. Mostrar en una sola columna el apellido y la letra inicial del nombre del
empleado (Ej. Tello Aguilera C.), en otra columna, el número de cuenta y el tipo
(Ej. 10560 - CAJA DE AHORRO). Los campos nulos deben figurar con la leyenda
"-Sin asignación-".*/
SELECT  CONCAT(a.apellido, ' ', LEFT(a.nombre,1), '.') AS 'Empleado',
  CASE
	  WHEN b.numero IS NULL THEN '-Sin asignación-'
  ELSE CONCAT(b.numero, ' - ', c.tipo)
    END AS 'Número de cuenta'
FROM empleado a 
LEFT JOIN cuenta b ON a.legajo = b.ejecutivo_cuenta
LEFT JOIN cuenta_tipo c ON b.cuenta_tipo_id = c.id;
-- 60 row(s) returned

/*12. Reportar todos los datos de los clientes y los números de cuenta que tienen.*/
SELECT *
FROM cliente a INNER JOIN cliente_x_cuenta b ON a.id = b.cliente_id;
-- 64 row(s) returned

/*13. Listar los clientes con residencia en las ciudades de "Las Heras - Mendoza", "Viña
del Mar - Valparaíso", "Córdoba - Córdoba" y "Monroe - Buenos Aires". Se debe
mostrar el apellido, nombre del cliente y todos los datos referidos a la ciudad*/
SELECT cliente.apellido AS Apellido,
        cliente.nombre AS Nombre,
        ciudad.nombre AS "Nombre de Ciudad",
        ciudad.codigo_postal AS "Código Postal",
        pais.nombre AS "Nombre de País"
FROM cliente
JOIN ciudad ON cliente.ciudad_id = ciudad.id
JOIN pais ON ciudad.pais_id = pais.id
WHERE ciudad.nombre IN ('Las Heras - Mendoza', 'Viña del Mar - Valparaíso', 'Córdoba - Córdoba', 'Monroe - Buenos Aires'); 
-- 6rows
    
/*14. Listar los clientes que tienen préstamos otorgados entre 15/08/21 al 5/09/21
(ordenarlos por fecha de otorgamiento). Mostrar sólo el email del cliente,
teléfono móvil y todos los datos referidos al préstamo.*/
SELECT  cliente.email AS "Email del Cliente",
        cliente.telefono_movil AS "Teléfono Móvil del Cliente",
        prestamo.id AS "Número de Préstamo",
        prestamo.fecha_otorgado AS "Fecha de Otorgamiento",
        prestamo.importe AS "Importe del Préstamo",
        prestamo.cantidad_cuota AS "Cantidad de Cuotas"
FROM cliente
JOIN cliente_x_prestamo ON cliente.id = cliente_x_prestamo.cliente_id
JOIN prestamo ON cliente_x_prestamo.prestamo_id = prestamo.id
WHERE prestamo.fecha_otorgado BETWEEN '2021-08-15' AND '2021-09-05'
ORDER BY  prestamo.fecha_otorgado;
-- 4 row(s) returned

/*15. Listar de manera ordenada, los empleados que no pertenezcan a la sucursal de
la ciudad "Monroe - Buenos Aires" y que la fecha de alta del contrato se halle
dentro del rango 2016 al 2018. Mostrar el email del empleado, número de
sucursal y el nombre de la ciudad*/
SELECT  empleado.email AS "Email del Empleado",
        empleado.sucursal_numero AS "Número de Sucursal",
        ciudad.nombre AS "Nombre de Ciudad"
FROM empleado
JOIN ciudad ON empleado.ciudad_id = ciudad.id
WHERE  empleado.sucursal_numero NOT IN (
      SELECT numero
        FROM sucursal
        WHERE ciudad_id = (
            SELECT id
            FROM ciudad
            WHERE nombre = 'Monroe - Buenos Aires'
        )
)
AND YEAR(empleado.alta_contrato_laboral) BETWEEN 2016 AND 2018
ORDER BY  empleado.apellido, empleado.nombre;
-- 21 row(s) returned

/*16 Listar las cuentas bancarias que tienen dos titulares. Mostrar sólo el número de
cuenta y la cantidad de titulares*/
SELECT cuenta_numero, COUNT(cliente_id) AS Cantidad_Titulares
FROM el_descubierto.cliente_x_cuenta
GROUP BY cuenta_numero
HAVING COUNT(cliente_id) > 1;
-- 3 row(s) returned

/*17. Se desea conocer el segundo pago con mayor importe efectuado en las
sucursales de Chile. Mostrar el número y hora de pago, importe pagado y el
nombre del país.*/
SELECT  p.id AS "Número de Pago",
        p.fecha AS "Hora de Pago",
        p.importe AS "Importe Pagado",
        pais.nombre AS "Nombre del País"
FROM pago p
JOIN prestamo pr ON p.prestamo_id = pr.id
JOIN sucursal s ON pr.sucursal_numero = s.numero
JOIN ciudad c ON s.ciudad_id = c.id
JOIN pais ON c.pais_id = pais.id
WHERE pais.nombre = 'Chile'
ORDER BY p.importe DESC
LIMIT 1 OFFSET 1;
-- 1 row(s) returned

/*18. Listar los clientes que no tienen préstamos. Mostrar el apellido, nombre y email
del cliente.*/
select nombre , apellido, email
from cliente
left join cliente_x_prestamo on cliente.id = cliente_x_prestamo.cliente_id
where cliente_x_prestamo.cliente_id is null; 
-- 20 rows

/*19. Se desea conocer el mes y año en que se terminaría de pagar el préstamo
número treinta a partir de la fecha de otorgamiento. Se debe mostrar el email
del cliente, número de préstamo, fecha de otorgamiento, importe prestado, mes
y año que correspondería a la última cuota (Ej. "agosto de 2021").*/
SELECT  C.email,
        CP.prestamo_id as numero_de_prestamo,
        P.fecha_otorgado,
        P.importe,
        DATE_FORMAT(DATE_ADD(P.fecha_otorgado, INTERVAL (P.importe / 30) DAY), '%M de %Y') AS ultima_cuota
FROM cliente_x_prestamo CP
INNER JOIN  prestamo P ON CP.prestamo_id = P.id
INNER JOIN  cliente C ON CP.cliente_id = C.id
WHERE CP.prestamo_id = 30;
-- 'maria.luciana@gmail.com', '30', '2021-08-04', '31193.38', 'June de 2024'

/*20. Listar las ciudades (sin repetir) que tengan entre dos a cuatro cuentas bancarias.
Se debe mostrar el país, ciudad y la cantidad de cuentas. Además, se debe
ordenar por país y ciudad.*/ 
SELECT  P.nombre AS pais,
        C.nombre AS ciudad,
        COUNT(CU.sucursal_numero) AS cantidad_de_cuentas
FROM Ciudad C
INNER JOIN Pais P ON C.pais_id = P.id
INNER JOIN Sucursal S ON C.id = S.Ciudad_id
INNER JOIN Cuenta CU ON S.numero = CU.sucursal_numero
GROUP BY  P.nombre, C.nombre
HAVING  COUNT(CU.sucursal_numero) BETWEEN 2 AND 4
ORDER BY P.nombre, C.nombre;
-- 15 row(s) returned

/*21. Mostrar el nombre, apellido, número de cuenta de todos los clientes que poseen
una cuenta tipo "CAJA DE AHORRO", cuyo saldo es mayor que $ 15000*/
SELECT  C.nombre,
        C.apellido,
        CU.numero AS numero_de_cuenta,
        CU.saldo
FROM cliente C
INNER JOIN cliente_x_cuenta CC ON C.id = CC.cliente_id
INNER JOIN cuenta CU ON CC.cuenta_numero = CU.numero
INNER JOIN cuenta_tipo CT ON CU.cuenta_tipo_id = CT.id
WHERE CT.tipo = 'CAJA DE AHORRO'
AND CU.saldo > 15000;
-- 9 rows

/*22. Por cada sucursal, contar la cantidad de clientes y el saldo promedio de sus
cuentas.*/
SELECT  t1.domicilio,
        COUNT(*) cantidad_cliente,
        AVG(t4.saldo) promedio_saldo
FROM sucursal t1
INNER JOIN cliente t2 ON t2.ciudad_id = t1.Ciudad_id
INNER JOIN cliente_x_cuenta t3 ON t3.cliente_id = t2.id
INNER JOIN cuenta t4 ON t4.numero = t3.cuenta_numero
GROUP BY t1.numero;
-- 21 row(s) returned

/*23. Listar todos aquellos clientes que teniendo un saldo negativo en la cuenta,
tengan un descubierto otorgado mayor a cero. Mostrar el apellido, nombre,
saldo y descubierto otorgado.*/
SELECT apellido, nombre, saldo, descubierto_otorgado
FROM cliente c
INNER JOIN cliente_x_cuenta cc ON c.id  = cc.cliente_id
INNER JOIN cuenta cu ON cc.cuenta_numero = cu.numero
WHERE saldo < 0 AND descubierto_otorgado > 0;
-- 7 row(s) returned

/*24. Se desea conocer el último acceso de cada cliente al sistema. Mostrar el nombre,
apellido y última fecha de acceso.*/
SELECT nombre, apellido, MAX(acceso) AS ultima_fecha_acceso
FROM cliente c
LEFT JOIN historial_acceso h ON c.id = h.cliente_id
GROUP BY c.id, nombre, apellido;
-- 45 row(s) returned

/*25. Listar el apellido y nombre de todos los empleados del banco. Si poseen cuentas
a cargo, mostrar cuántas. Ordenar por apellido y nombre.*/
SELECT apellido, nombre, COUNT(numero) AS cuentas_a_Cargo
FROM empleado e
INNER JOIN cuenta c ON e.legajo = c.ejecutivo_cuenta
GROUP BY legajo
ORDER BY apellido, nombre;
-- 24 row(s) returned