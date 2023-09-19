USE `adventureworks`;

/*WHERE
1. Mostrar las personas que la segunda letra de su apellido es una s.
Tablas: person
Campos: LastName*/
SELECT *
FROM contact 
WHERE LastName LIKE '_s%';

/*2. Mostrar el nombre concatenado con el apellido de las personas cuyo apellido tenga terminación (ez).
Tablas: person*/
SELECT CONCAT(FirstName,' ', MiddleName,' ', LastName) AS Full_Name
FROM contact 
WHERE LastName LIKE '%ez';

/*3. Mostrar los nombres de los productos que terminan en un número.
Tablas: product
Campos: Name*/
SELECT Name 
FROM product
WHERE Name REGEXP '[0-9]$';

/*4. Mostrar las personas cuyo nombre tenga una "c" como primer carácter, cualquier otro como segundo carácter, 
ni d, e, f, g como tercer carácter, cualquiera entre j y r o entre s y w como cuarto carácter y el resto sin restricciones.
Tablas: person
Campos: FirstName*/
SELECT *
FROM contact 
WHERE FirstName REGEXP '^c[^defg][j-rs-w]';

/*BETWEEN
1. Mostrar todos los productos cuyo precio de lista esté entre 240 y 305.
Tablas: product
Campos: ListPrice*/
SELECT *
FROM product
WHERE ListPrice BETWEEN 240 AND 305;
-- WHERE ListPrice>=240 AND ListPrice<=305;

/*2. Mostrar todos los empleados que nacieron entre 1977 y 1981.
Tablas: employee
Campos: BirthDate*/
SELECT *
FROM employee
WHERE BirthDate BETWEEN '1977-01-01' AND '1981-12-31';

/*OPERADORES
1. Mostrar el código, fecha de ingreso y horas de vacaciones de los empleados que ingresaron a partir del año 2010.
Tablas: employee
Campos: BusinessEntityID, HireDate, VacationHours*/
SELECT EmployeeID, HireDate, VacationHours
FROM employee
WHERE HireDate >= '2010-01-01';

/*2. Mostrar el nombre, número de producto, precio de lista y el precio de lista incrementado en un 10% de los productos 
cuya fecha de fin de venta sea anterior al día de hoy.
Tablas: product
Campos: Name, ProductNumber, ListPrice, SellEndDate*/
SELECT Name, ProductNumber, ListPrice, ListPrice*1.1 AS ListPriceWith10PercentIncrease
FROM product
WHERE SellEndDate < CURRENT_DATE;

/*CONSULTAS CON "NULL"
1. Mostrar los representantes de ventas (vendedores) que no tienen definido el número de territorio.
Tablas: salesperson
Campos: TerritoryID, BusinessEntityID*/
SELECT SalesPersonID, TerritoryID
FROM salesperson
WHERE TerritoryID is NULL;

/*2. Mostrar el peso de todos los artículos. Si el peso no estuviese definido, reemplazar por cero.
Tablas: product
Campos: Weight*/
SELECT Name,  COALESCE(Weight, 0) AS Weight
FROM product;

/*FUNCIONES DE AGREGACIÓN
1. Mostrar solamente la fecha de nacimiento del empleado más joven.
Tablas: employee
Campos: BirthDate*/
SELECT MIN(BirthDate) AS FechaNacimientoMasJoven
FROM employee;

/*2. Mostrar el promedio de la lista de precios de productos con 2 dígitos después de la coma.
Además, agregar el signo $.
Tablas: product
Campos: ListPrice*/
SELECT CONCAT('$', FORMAT(AVG(ListPrice), 2)) AS PromedioPrecio
FROM product;

/*GROUP BY
1. Mostrar los productos y la suma total vendida de cada uno de ellos, ordenados ascendentemente por el total vendido. Redondear el total para abajo.
Tablas: salesorderdetail
Campos: ProductID, LineTotal*/
SELECT ProductID, FLOOR(SUM(LineTotal)) AS TotalVendido
FROM salesorderdetail
GROUP BY ProductID
ORDER BY TotalVendido ASC;

/*2. Mostrar el promedio vendido por factura.
Tablas: salesorderdetail
Campos: SalesOrderID, LineTotal*/
SELECT SalesOrderID, AVG(LineTotal) AS PromedioVendidoPorFactura
FROM salesorderdetail
GROUP BY SalesOrderID;

/*HAVING
1. Mostrar las subcategorías de los productos que tienen cuatro o más productos que cuestan menos de $150.
Tablas: product
Campos: ProductSubcategoryID, ListPrice*/
SELECT p.ProductSubcategoryID, COUNT(*) AS CantidadProductos
FROM product AS p
WHERE p.ListPrice < 150
GROUP BY p.ProductSubcategoryID
HAVING COUNT(*) >= 4;

/*2. Mostrar todos los códigos de subcategorías existentes junto con la cantidad de productos cuyo precio de 
lista sea mayor a $70 y el precio promedio sea mayor a $700.
Tablas: product
Campos: ProductSubcategoryID, ListPrice*/
SELECT p.ProductSubcategoryID, COUNT(*) AS CantidadProductos
FROM product AS p
WHERE p.ListPrice > 70
GROUP BY p.ProductSubcategoryID
HAVING AVG(p.ListPrice) > 700;


/*JOINS
1. Mostrar los precios de venta de aquellos productos donde el precio de venta sea inferior al precio de 
lista recomendado para ese producto ordenados por nombre de producto.
Tablas: salesorderdetail, product
Campos: ProductID, Name, ListPrice, UnitPrice*/
SELECT p.Name, s.UnitPrice
FROM product AS p
INNER JOIN salesorderdetail AS s
ON p.ProductID = s.ProductID
WHERE s.UnitPrice < p.ListPrice
ORDER BY p.Name;

/*2. Mostrar todos los productos que tengan el mismo precio (precio de venta y precio de lista) y que 
tengan un color asignado (no nulo). Se deben mostrar de a pares, código y nombre de cada uno de los dos productos y el precio de ambos.
Ordenar por precio de venta en forma descendente.
Tablas: product, salesorderdetail
Campos: ProductID, Name, ListPrice, UnitPrice, Color*/  
 SELECT
    p1.ProductID AS ProductID1,
    p1.Name AS Name1,
    s1.UnitPrice AS Price1,
    p2.ProductID AS ProductID2,
    p2.Name AS Name2,
    s2.UnitPrice AS Price2
FROM
    product AS p1
INNER JOIN
    salesorderdetail AS s1 ON p1.ProductID = s1.ProductID
INNER JOIN
    product AS p2 ON p1.ProductID < p2.ProductID
INNER JOIN
    salesorderdetail AS s2 ON p2.ProductID = s2.ProductID
WHERE
    p1.Color IS NOT NULL AND p2.Color IS NOT NULL
    AND s1.UnitPrice = s2.UnitPrice
-- ORDER BY s1.UnitPrice DESC;

/*3. Mostrar el nombre de los productos y el nombre de los proveedores cuya subcategoría es 15.
Tablas: product, productVendor, vendor
Campos: Name, ProductID, BusinessEntityID, ProductSubcategoryID*/
SELECT p.Name AS ProductName, v.Name AS VendorName
FROM product AS p
INNER JOIN productVendor AS pv ON p.ProductID = pv.ProductID
INNER JOIN vendor AS v ON pv.VendorID = v.VendorID
WHERE p.ProductSubcategoryID = 15;

/*4. Mostrar todas las personas (nombre y apellido) y en el caso que sean empleados mostrar también 
el login id. Además, mostrar solo aquellos que tienen un ID de territorio 1, 4, 7 y 10.
Tablas: employee, person, salesperson
Campos: FirstName, LastName, LoginID, BusinessEntityID, TerritoryID*/