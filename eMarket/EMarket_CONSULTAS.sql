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
