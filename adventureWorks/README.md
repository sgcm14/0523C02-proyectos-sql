# AdventureWorks 2019

Desde aquí puedes descargar la nueva versión de la base de datos
AdventureWorks2019.
¡Manos a la Obra!



El Diagrama entidad relación es como se muestra a continuación:

![](https://raw.githubusercontent.com/sgcm14/proyectos-sql/main/adventureWorks/adventureWorks.png)


**Consignas:**

A continuación encontrarás una serie de ejercicios para practicar:

WHERE
1. Mostrar las personas que la segunda letra de su apellido es una s.

        Tablas: person
        Campos: LastName

2. Mostrar el nombre concatenado con el apellido de las personas cuyo apellido tenga terminación (ez).

        Tablas: person

3. Mostrar los nombres de los productos que terminan en un número.

        Tablas: product
        Campos: Name

4. Mostrar las personas cuyo nombre tenga una "c" como primer carácter, cualquier otro como segundo carácter, ni d, e, f, g como tercer carácter, cualquiera entre j y r o entre s y w como cuarto carácter y el resto sin restricciones.

        Tablas: person
        Campos: FirstName

BETWEEN
1. Mostrar todos los productos cuyo precio de lista esté entre 240 y 305.

        Tablas: product
        Campos: ListPrice

2. Mostrar todos los empleados que nacieron entre 1977 y 1981.

        Tablas: employee
        Campos: BirthDate

OPERADORES
1. Mostrar el código, fecha de ingreso y horas de vacaciones de los empleados que ingresaron a partir del año 2010.

        Tablas: employee
        Campos: BusinessEntityID, HireDate, VacationHours

2. Mostrar el nombre, número de producto, precio de lista y el precio de lista incrementado en un 10% de los productos cuya fecha de fin de venta sea anterior al día de hoy.

        Tablas: product
        Campos: Name, ProductNumber, ListPrice, SellEndDate

CONSULTAS CON "NULL"
1. Mostrar los representantes de ventas (vendedores) que no tienen definido el número de territorio.

        Tablas: salesperson
        Campos: TerritoryID, BusinessEntityID

2. Mostrar el peso de todos los artículos. Si el peso no estuviese definido, reemplazar por cero.

        Tablas: product
        Campos: Weight

FUNCIONES DE AGREGACIÓN

1. Mostrar solamente la fecha de nacimiento del empleado más joven.

        Tablas: employee
        Campos: BirthDate

2. Mostrar el promedio de la lista de precios de productos con 2 dígitos después de la coma.
Además, agregar el signo $.

        Tablas: product
        Campos: ListPrice

GROUP BY
1. Mostrar los productos y la suma total vendida de cada uno de ellos, ordenados ascendentemente por el total vendido. Redondear el total para abajo.

        Tablas: salesorderdetail
        Campos: ProductID, LineTotal

2. Mostrar el promedio vendido por factura.

        Tablas: salesorderdetail
        Campos: SalesOrderID, LineTotal

HAVING
1. Mostrar las subcategorías de los productos que tienen cuatro o más productos que cuestan menos de $150.

        Tablas: product
        Campos: ProductSubcategoryID, ListPrice

2. Mostrar todos los códigos de subcategorías existentes junto con la cantidad de productos cuyo precio de lista sea mayor a $70 y el precio promedio sea mayor a $700.

        Tablas: product
        Campos: ProductSubcategoryID, ListPrice

JOINS
1. Mostrar los precios de venta de aquellos productos donde el precio de venta sea inferior al precio de lista recomendado para ese producto ordenados por nombre de producto.

        Tablas: salesorderdetail, product
        Campos: ProductID, Name, ListPrice, UnitPrice

2. Mostrar todos los productos que tengan el mismo precio (precio de venta y precio de lista) y que tengan un color asignado (no nulo). Se deben mostrar de a pares, código y nombre de cada uno de los dos productos y el precio de ambos.

    Ordenar por precio de venta en forma descendente.

        Tablas: product, salesorderdetail
        Campos: ProductID, Name, ListPrice, UnitPrice, Color

3. Mostrar el nombre de los productos y el nombre de los proveedores cuya subcategoría es 15.

        Tablas: product, productVendor, vendor
        Campos: Name, ProductID, BusinessEntityID, ProductSubcategoryID

4. Mostrar todas las personas (nombre y apellido) y en el caso que sean empleados mostrar también el login id. Además, mostrar solo aquellos que tienen un ID de territorio 1, 4, 7 y 10.

        Tablas: employee, person, salesperson
        Campos: FirstName, LastName, LoginID, BusinessEntityID, TerritoryID

**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">