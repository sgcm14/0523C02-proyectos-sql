USE emarket
/*Categorías y productos*/
/*1. Queremos tener un listado de todas las categorías.*/
SELECT * FROM categorias;

/*2. Cómo las categorías no tienen imágenes, solamente interesa obtener un
listado de CategoriaNombre y Descripcion.*/
SELECT CategoriaNombre,Descripcion FROM categorias;

/*3. Obtener un listado de los productos.*/
SELECT * FROM productos;

/*4. ¿Existen productos discontinuados? (Discontinuado = 1).*/
SELECT * FROM productos
WHERE Discontinuado =1;

/*5. Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son
los que nos provee?*/
SELECT * FROM productos
WHERE ProveedorID = 8;

/*6. Queremos conocer todos los productos cuyo precio unitario se encuentre
entre 10 y 22.*/
SELECT * FROM productos
WHERE PrecioUnitario BETWEEN 10 AND 22;

/*7. Se define que un producto hay que solicitarlo al proveedor si sus unidades
en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?*/
SELECT * FROM productos
WHERE UnidadesStock < NivelReorden

/*8. Se quiere conocer todos los productos del listado anterior, pero que
unidades pedidas sea igual a cero.*/
SELECT * FROM productos
WHERE UnidadesStock < NivelReorden AND UnidadesPedidas = 0;

/*Clientes*/
/*1. Obtener un listado de todos los clientes con Contacto, Compania, Título,
País. Ordenar el listado por País.*/
SELECT Contacto, Compania, Titulo, Pais FROM clientes 
ORDER BY Pais;

/*2. Queremos conocer a todos los clientes que tengan un título “Owner”.*/
SELECT Contacto, Titulo FROM clientes 
WHERE Titulo = 'Owner';

/*3. El operador telefónico que atendió a un cliente no recuerda su nombre.
Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con
todos los contactos que inician con la letra “C”?*/
SELECT Contacto FROM clientes 
WHERE Contacto LIKE 'C%';

/*Facturas*/
/*1. Obtener un listado de todas las facturas, ordenado por fecha de factura
ascendente.*/
SELECT * FROM facturas
ORDER BY FechaFactura;

/*2. Ahora se requiere un listado de las facturas con el país de envío “USA” y
que su correo (EnvioVia) sea distinto de 3.*/
SELECT * FROM facturas
WHERE PaisEnvio="USA" AND EnvioVia != 3;

/*3. ¿El cliente 'GOURL' realizó algún pedido?*/
SELECT * FROM facturas
WHERE ClienteID="GOURL";

/*4. Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.*/
SELECT * FROM facturas
WHERE EmpleadoID IN (2, 3, 5, 8, 9);

/*Consultas queries ML - Parte II
En esta segunda parte vamos a intensificar la práctica de consultas
SELECT, añadiendo ALIAS, LIMIT y OFFSET.
Productos*/
/*1. Obtener el listado de todos los productos ordenados
descendentemente por precio unitario.*/
SELECT * FROM productos
ORDER BY PrecioUnitario DESC;

/*2. Obtener el listado de top 5 de productos cuyo precio unitario es
el más caro.*/
SELECT * FROM productos
ORDER BY PrecioUnitario DESC
LIMIT 5;

/*3. Obtener un top 10 de los productos con más unidades en stock.*/
SELECT * FROM productos
ORDER BY UnidadesStock DESC
LIMIT 10;

/*FacturaDetalle*/
/*1. Obtener un listado de FacturaID, Producto, Cantidad.*/
SELECT FacturaID, ProductoID, Cantidad FROM facturadetalle;

/*2. Ordenar el listado anterior por cantidad descendentemente.*/
SELECT FacturaID, ProductoID, Cantidad FROM facturadetalle
ORDER BY Cantidad DESC;

/*3. Filtrar el listado solo para aquellos productos donde la cantidad
se encuentre entre 50 y 100.*/
SELECT * FROM facturadetalle
WHERE Cantidad BETWEEN 50 AND 100;

/*4. En otro listado nuevo, obtener un listado con los siguientes
nombres de columnas: NroFactura (FacturaID), Producto
(ProductoID), Total (PrecioUnitario*Cantidad).*/
SELECT  FacturaID AS NroFactura, ProductoID AS Producto, PrecioUnitario * Cantidad AS Total FROM facturadetalle;

/*¡Extras!
¿Te sobró tiempo? ¿Querés seguir practicando?
Te dejamos unos ejercicios extras a partir de la misma base:*/
/*1. Obtener un listado de todos los clientes que viven en “Brazil" o “Mexico”,
o que tengan un título que empiece con “Sales”.*/
SELECT * FROM clientes
WHERE Pais='Brazil' OR Pais='Mexico' OR Titulo LIKE "Sales%";

/*2. Obtener un listado de todos los clientes que pertenecen a una compañía
que empiece con la letra "A".*/
SELECT * FROM clientes
WHERE Compania LIKE "A%";

/*3. Obtener un listado con los datos: Ciudad, Contacto y renombrarlo
como Apellido y Nombre, Titulo y renombrarlo como Puesto, de todos
los clientes que sean de la ciudad "Madrid".*/
SELECT Ciudad AS Apellido, Contacto AS Nombre, Titulo AS Puesto FROM clientes
WHERE Ciudad="Madrid";

/*4. Obtener un listado de todas las facturas con ID entre 10000 y 10500*/
SELECT * FROM facturas
WHERE FacturaID BETWEEN 10000 AND 10500;

/*5. Obtener un listado de todas las facturas con ID entre 10000 y 10500 o de
los clientes con ID que empiecen con la letra “B”.*/
SELECT * FROM facturas
WHERE FacturaID BETWEEN 10000 AND 10500 OR ClienteID LIKE "B%";

/*6. ¿Existen facturas que la ciudad de envío sea “Vancouver” o que
utilicen el correo 3?*/
SELECT * FROM facturas
WHERE CiudadEnvio="Vancouver";

/*7. ¿Cuál es el ID de empleado de “Buchanan”?*/
SELECT * FROM empleados
WHERE Apellido="Buchanan";

/*8. ¿Existen facturas con EmpleadoID del empleado del ejercicio anterior?
(No relacionar, sino verificar que existan facturas)*/
SELECT COUNT(*) AS NumFacturas FROM facturas
WHERE EmpleadoID = (SELECT EmpleadoID FROM empleados WHERE Apellido = "Buchanan");

/*Consultas queries XL parte I - GROUP BY
Vamos a practicar sobre consultas SELECT, enfocándonos en group by, having y distinct.
 Clientes:*/
/*1) ¿Cuántos clientes existen?*/
SELECT COUNT(*)
FROM clientes;

/*2) ¿Cuántos clientes hay por ciudad?*/
SELECT Ciudad, COUNT(*)
FROM clientes
GROUP BY Ciudad;

/*Facturas:*/
/*1) ¿Cuál es el total de transporte?*/
SELECT SUM(Transporte)
FROM facturas;

/*2) ¿Cuál es el total de transporte por EnvioVia (empresa de envío)?*/
SELECT  EnvioVia, SUM(Transporte)
FROM facturas
GROUP BY EnvioVia;

/*3) Calcular la cantidad de facturas por cliente. Ordenar descendentemente por cantidad de facturas.*/
SELECT ClienteID, COUNT(*) AS CantidadFacturas
FROM facturas
GROUP BY ClienteID
ORDER BY CantidadFacturas DESC;

/*4) Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.*/
SELECT ClienteID, COUNT(*) AS CantidadFacturas
FROM facturas
GROUP BY ClienteID
ORDER BY CantidadFacturas DESC
LIMIT 5;

/*5) ¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?*/
SELECT PaisEnvio, COUNT(*) AS CantidadFacturas
FROM facturas
GROUP BY PaisEnvio
ORDER BY CantidadFacturas
LIMIT 1;

/*6) Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado realizó más operaciones de ventas?*/
SELECT EmpleadoID, COUNT(*) AS Ventas
FROM facturas
GROUP BY EmpleadoID
ORDER BY Ventas DESC
LIMIT 1;

/*Factura detalle*/
/*1) ¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?*/
SELECT ProductoID , COUNT(*) AS cantidad
FROM facturadetalle
GROUP BY ProductoID
ORDER BY  cantidad DESC
LIMIT 1;

/*2) ¿Cuál es el total facturado? Considerar que el total facturado es la suma de
cantidad por precio unitario.*/
SELECT SUM(PrecioUnitario * Cantidad) 
FROM facturadetalle;

/*3) ¿Cuál es el total facturado para los productos ID entre 30 y 50?*/
SELECT SUM(PrecioUnitario * Cantidad) AS total_facturado
FROM facturadetalle
WHERE ProductoID BETWEEN 30 AND 50;

/*SELECT ProductoID, SUM(PrecioUnitario * Cantidad) 
FROM facturadetalle
WHERE ProductoID IN (30, 50)
GROUP BY ProductoID;*/ -- LA SUMA DE CADA PRODUCTO POR SEPARADO

/*4) ¿Cuál es el precio unitario promedio de cada producto?*/
SELECT ProductoID, AVG(PrecioUnitario) 
FROM facturadetalle
GROUP BY ProductoID;

/*5) ¿Cuál es el precio unitario máximo?*/
SELECT MAX(PrecioUnitario) 
FROM facturadetalle;

/*Consultas queries XL parte II - JOIN
En esta segunda parte vamos a intensificar la práctica de consultas con JOIN.*/
/*1) Generar un listado de todas las facturas del empleado 'Buchanan'.*/
SELECT * 
FROM facturas
INNER JOIN empleados ON facturas.EmpleadoID = empleados.EmpleadoID
WHERE empleados.apellido = 'Buchanan';

/*2) Generar un listado con todos los campos de las facturas del correo 'Speedy Express'.*/
SELECT * 
FROM facturas
INNER JOIN correos ON facturas.EnvioVia = correos.CorreoID
WHERE correos.Compania = 'Speedy Express';

/*3) Generar un listado de todas las facturas con el nombre y apellido de los empleados.*/
SELECT facturas.* , empleados.Nombre, empleados.Apellido
FROM facturas
INNER JOIN empleados ON facturas.EmpleadoID = empleados.EmpleadoID;

/*4) Mostrar un listado de las facturas de todos los clientes “Owner” y país de envío “USA”.*/
SELECT * 
FROM facturas
INNER JOIN clientes ON facturas.ClienteID = clientes.ClienteID
WHERE clientes.Titulo= "Owner" AND clientes.Pais="USA";

/*5) Mostrar todos los campos de las facturas del empleado cuyo apellido sea
“Leverling” o que incluyan el producto id = “42”.*/
SELECT *
FROM facturas
INNER JOIN empleados ON facturas.EmpleadoID = empleados.EmpleadoID
INNER JOIN facturadetalle ON facturas.facturaID = facturadetalle.facturaID
WHERE empleados.Apellido="Leverling" OR facturadetalle.ProductoID= 42;

/*6) Mostrar todos los campos de las facturas del empleado cuyo apellido sea
“Leverling” y que incluya los producto id = “80” o ”42”.*/
SELECT *
FROM facturas
INNER JOIN empleados ON facturas.EmpleadoID = empleados.EmpleadoID
INNER JOIN facturadetalle ON facturas.facturaID = facturadetalle.facturaID
WHERE empleados.Apellido="Leverling" AND facturadetalle.ProductoID IN (80, 42);

/*7) Generar un listado con los cinco mejores clientes, según sus importes de compras total (PrecioUnitario * Cantidad).*/
SELECT  clientes.ClienteID, SUM(facturadetalle.PrecioUnitario * facturadetalle.Cantidad) AS total_facturado
FROM facturas
INNER JOIN clientes ON facturas.ClienteID = clientes.ClienteID
INNER JOIN facturadetalle ON facturas.facturaID = facturadetalle.facturaID
GROUP BY clientes.ClienteID
ORDER BY total_facturado DESC
LIMIT 5;

/*8) Generar un listado de facturas, con los campos id, nombre y apellido del cliente, fecha de factura, país de envío,
 Total, ordenado de manera descendente por fecha de factura y limitado a 10 filas.*/
SELECT facturas.FacturaID, clientes.ClienteID, clientes.Contacto, facturas.FechaFactura, facturas.PaisEnvio,  SUM(facturadetalle.PrecioUnitario * facturadetalle.Cantidad) AS total_facturado
FROM facturas
INNER JOIN clientes ON facturas.ClienteID = clientes.ClienteID
INNER JOIN facturadetalle ON facturas.facturaID = facturadetalle.facturaID
GROUP BY facturas.FacturaID, clientes.Contacto, facturas.FechaFactura, facturas.PaisEnvio
ORDER BY facturas.FechaFactura DESC
LIMIT 10;
