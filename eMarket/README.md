# Proyecto e-Market
e-Market es un e-commerce de venta de productos “deli” a través de Internet.

Para un mejor entendimiento de la base te proporcionamos una referencia de
qué contiene cada tabla:

Existen 13 tablas:

    ● Categorías: categorías de productos.

    ● Clientes: maestro de clientes.

    ● ClientesDemo

    ● ClientesDemografia

    ● Correos: empresas transportistas.

    ● Empleados: empleado responsable de la venta.

    ● EmpleadosUbicaciones

    ● FacturaDetalle: detalle de qué se compró en cada factura. 

    ● Facturas: encabezado de la factura.

    ● Productos: maestro de productos que se venden en la empresa.

    ● Proveedores: maestro de proveedores que proporcionan los productos
    para la venta.

    ● Regiones: regiones de las ubicaciones.

    ● Ubicaciones: maestro geográfico de ubicaciones.

El Diagrama entidad relación es como se muestra a continuación:

![](https://raw.githubusercontent.com/sgcm14/proyectos-sql/main/eMarket/eMarket.png)


## Consultas queries ML - Parte I

Vamos a practicar sobre consultas SELECT, enfocándonos en SELECT,
WHERE, operadores de condición como AND, OR, BETWEEN, LIKE, IN, entre
otros.

Tips:

- Cada enunciado se corresponde con una consulta SELECT.
- Recordá ir guardando las consultas SQL.

**Consignas:**

    Categorías y productos:
    ----------------------
    1. Queremos tener un listado de todas las categorías.
    2. Cómo las categorías no tienen imágenes, solamente interesa obtener un listado de CategoriaNombre y Descripcion.
    3. Obtener un listado de los productos.
    4. ¿Existen productos discontinuados? (Discontinuado = 1).
    5. Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son los que nos provee?
    6. Queremos conocer todos los productos cuyo precio unitario se encuentre entre 10 y 22.
    7. Se define que un producto hay que solicitarlo al proveedor si sus unidades en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?
    8. Se quiere conocer todos los productos del listado anterior, pero que unidades pedidas sea igual a cero.


    Clientes:
    --------
    1. Obtener un listado de todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.
    2. Queremos conocer a todos los clientes que tengan un título “Owner”.
    3. El operador telefónico que atendió a un cliente no recuerda su nombre.
    Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con todos los contactos que inician con la letra “C”?


    Facturas:
    --------
    1. Obtener un listado de todas las facturas, ordenado por fecha de factura ascendente.
    2. Ahora se requiere un listado de las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3.
    3. ¿El cliente 'GOURL' realizó algún pedido?
    4. Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.


## Consultas queries ML - Parte II

En esta segunda parte vamos a intensificar la práctica de consultas
SELECT, añadiendo ALIAS, LIMIT y OFFSET.

    Productos:
    ---------
    1. Obtener el listado de todos los productos ordenados
    descendentemente por precio unitario.
    2. Obtener el listado de top 5 de productos cuyo precio unitario es  el más caro.
    3. Obtener un top 10 de los productos con más unidades en stock.


    FacturaDetalle:
    --------------
    1. Obtener un listado de FacturaID, Producto, Cantidad.
    2. Ordenar el listado anterior por cantidad descendentemente.
    3. Filtrar el listado solo para aquellos productos donde la cantidad  se encuentre entre 50 y 100.
    4. En otro listado nuevo, obtener un listado con los siguientes
    nombres de columnas: NroFactura (FacturaID), Producto (ProductoID), Total (PrecioUnitario*Cantidad).

------------------------
**¡Extras!**

¿Te sobró tiempo? ¿Querés seguir practicando?

Te dejamos unos ejercicios extras a partir de la misma base:

    1. Obtener un listado de todos los clientes que viven en “Brazil" o “Mexico”, o que tengan un título que empiece con “Sales”.
    2. Obtener un listado de todos los clientes que pertenecen a una compañía que empiece con la letra "A".
    3. Obtener un listado con los datos: Ciudad, Contacto y renombrarlo   como Apellido y Nombre, Titulo y renombrarlo como Puesto, de todos los clientes que sean de la ciudad "Madrid".
    4. Obtener un listado de todas las facturas con ID entre 10000 y 10500
    5. Obtener un listado de todas las facturas con ID entre 10000 y 10500 o de los clientes con ID que empiecen con la letra “B”.
    6. ¿Existen facturas que la ciudad de envío sea “Vancouver” o que
    utilicen el correo 3?
    7. ¿Cuál es el ID de empleado de “Buchanan”?
    8. ¿Existen facturas con EmpleadoID del empleado del ejercicio anterior? (No relacionar, sino verificar que existan facturas).

## Consultas queries XL parte I - GROUP BY
Vamos a practicar sobre consultas SELECT, enfocándonos en group by, having y distinct.

Tips:
- Cada enunciado se corresponde con una consulta SELECT.
- Recordá ir guardando las consultas. SQL.

**Consignas:**

    Clientes:
    --------
    1) ¿Cuántos clientes existen?
    2) ¿Cuántos clientes hay por ciudad?

    Facturas:
    --------
    1) ¿Cuál es el total de transporte?
    2) ¿Cuál es el total de transporte por EnvioVia (empresa de envío)?
    3) Calcular la cantidad de facturas por cliente. Ordenar descendentemente por cantidad de facturas.
    4) Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.
    5) ¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?
    6) Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado realizó más operaciones de ventas?

    Factura detalle:
    ---------------
    1) ¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?
    2) ¿Cuál es el total facturado? Considerar que el total facturado es la suma de
    cantidad por precio unitario.
    3) ¿Cuál es el total facturado para los productos ID entre 30 y 50?
    4) ¿Cuál es el precio unitario promedio de cada producto?
    5) ¿Cuál es el precio unitario máximo?

## Consultas queries XL parte II - JOIN

En esta segunda parte vamos a intensificar la práctica de consultas con JOIN.

    1) Generar un listado de todas las facturas del empleado 'Buchanan'.
    2) Generar un listado con todos los campos de las facturas del correo 'Speedy Express'.
    3) Generar un listado de todas las facturas con el nombre y apellido de los empleados.
    4) Mostrar un listado de las facturas de todos los clientes “Owner” y país de envío “USA”.
    5) Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” o que incluyan el producto id = “42”.
    6) Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” y que incluya los producto id = “80” o ”42”.
    7) Generar un listado con los cinco mejores clientes, según sus importes de compras total (PrecioUnitario * Cantidad).
    8) Generar un listado de facturas, con los campos id, nombre y apellido del cliente, fecha de factura, país de envío, Total, ordenado de manera descendente por fecha de factura y limitado a 10 filas.

## Consultas queries XXL parte I - Repasamos INNER JOIN

Realizar una consulta de la facturación de e-market. Incluir la siguiente información:
- Id de la factura
- fecha de la factura
- nombre de la empresa de correo
- nombre del cliente
- categoría del producto vendido
- nombre del producto
- precio unitario
- cantidad

## Consultas queries XXL parte II - INNER, LEFT Y RIGHT JOIN

1. Listar todas las categorías junto con información de sus productos. Incluir todas
las categorías aunque no tengan productos.
2. Listar la información de contacto de los clientes que no hayan comprado nunca
en emarket.
3. Realizar un listado de productos. Para cada uno indicar su nombre, categoría, y
la información de contacto de su proveedor. Tener en cuenta que puede haber
productos para los cuales no se indicó quién es el proveedor.
4. Para cada categoría listar el promedio del precio unitario de sus productos.
5. Para cada cliente, indicar la última factura de compra. Incluir a los clientes que
nunca hayan comprado en e-market.
6. Todas las facturas tienen una empresa de correo asociada (enviovia). Generar un
listado con todas las empresas de correo, y la cantidad de facturas
correspondientes. Realizar la consulta utilizando RIGHT JOIN.


## Vistas - Parte I
    Clientes:
    ---------

    1. Crear una vista con los siguientes datos de los clientes: ID, contacto, y el Fax. En caso de que no tenga Fax, colocar el teléfono, pero aclarándolo. Por
    ejemplo: “TEL: (01) 123-4567”.
    2. Se necesita listar los números de teléfono de los clientes que no tengan fax. Hacerlo de dos formas distintas:
        a. Consultando la tabla de clientes.
        b. Consultando la vista de clientes.

    Proveedores:
    -----------

    1. Crear una vista con los siguientes datos de los proveedores: ID,  contacto, compañía y dirección. Para la dirección tomar la dirección, ciudad, código postal y país.
    2. Listar los proveedores que vivan en la calle Americanas en Brasil. Hacerlo de dos formas distintas:
        a. Consultando la tabla de proveedores.
        b. Consultando la vista de proveedores.
## Vistas - Parte II

    1. Crear una vista de productos que se usará para control de stock. Incluir el ID
    y nombre del producto, el precio unitario redondeado sin decimales, las
    unidades en stock y las unidades pedidas. Incluir además una nueva
    columna PRIORIDAD con los siguientes valores:

        ■ BAJA: si las unidades pedidas son cero.

        ■ MEDIA: si las unidades pedidas son menores que las unidades
        en stock.

        ■ URGENTE: si las unidades pedidas no duplican el número de
        unidades.

        ■ SUPER URGENTE: si las unidades pedidas duplican el número
        de unidades en caso contrario.

    2. Se necesita un reporte de productos para identificar problemas de stock.
    Para cada prioridad indicar cuántos productos hay y su precio promedio.
    No incluir las prioridades para las que haya menos de 5 productos.

## Stored procedures

Vamos a practicar stored procedures, enfocándonos en las sentencias DML.

Tips:
- Recordar ir guardando todo en un script .sql.

**Consignas:**
1) Empleados

    a) Crear un SP que liste los apellidos y nombres de los empleados ordenados alfabéticamente.

    b) Invocar el SP para verificar el resultado.

2) Empleados por ciudad

    a) Crear un SP que reciba el nombre de una ciudad y liste los empleados de esa ciudad.

    b) Invocar al SP para listar los empleados de Seattle.

3) Clientes por país

    a) Crear un SP que reciba el nombre de un país y devuelva la cantidad de clientes en ese país.

    b) Invocar el SP para consultar la cantidad de clientes en Portugal.

4) Productos sin stock

    a) Crear un SP que reciba un número y liste los productos cuyo stock está por debajo de ese número. El resultado debe mostrar el nombre del producto, el stock actual y el nombre de la categoría a la que pertenece el producto.

    b) Listar los productos con menos de 10 unidades en stock.

    c) Listar los productos sin stock.

5) Ventas con descuento

    a) Crear un SP que reciba un porcentaje y liste los nombres de los productos que hayan sido vendidos con un descuento igual o superior al valor indicado, indicando además el nombre del cliente al que se lo vendió.

    b) Listar la información de los productos que hayan sido vendidos con un descuento mayor al 10%.

**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">