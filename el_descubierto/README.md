# Proyecto EL DESCUBIERTO

Este es un proyecto integrador súper desafiante y lo vamos a desarrollar en tres partes. Hoy, comenzamos por la primera parte y antes de arrancar con el modelado, ¿leamos lo que nos explica la institución respecto de sus datos?

## Checkpoint #1

**Enunciado:**

La institución bancaria EL DESCUBIERTO, desea diseñar una base de
datos para su administración. El mismo, dispone de 22 sucursales que
se ubican en diferentes ciudades de Latinoamérica y se identifican por
un número de sucursal. Para cada ciudad, se almacena el nombre,
código postal y el país.

Los clientes del banco se identifican mediante un identificador. La instituciónalmacena de cada cliente el apellido, nombre, domicilio, ciudad, país, email y solo suteléfono móvil. Estos, pueden tener cuentas y/o préstamos. Un cliente puede tener sucuenta asociada a un ejecutivo de cuenta particular, que actúa como responsable estratégico de la cuenta.

El banco ofrece dos tipos de cuentas: cajas de ahorro y cuentas corrientes (debe existir la posibilidad de agregar nuevos tipos de cuenta). Las cuentas pueden asociarse a más de un cliente y un cliente puede tener más de una cuenta. Cada cuenta pertenece a una única sucursal, posee un único número de cuenta y puede estar activa o no. El banco mantiene el saldo de cada cuenta y el historial de accesos por el cliente, utilizando la fecha y hora. Además, las cajas de ahorro tienen
un tipo de interés, por ejemplo, interés fijo, interés variable, entre otros. Para cada cuenta corriente se debe almacenar el descubierto otorgado.

Un préstamo tiene lugar en una sucursal particular y puede estar asociado a uno o más clientes. Un préstamo se identifica mediante un único número de préstamo. Para cada préstamo, el banco mantiene la fecha de otorgamiento, el importe del préstamo, la cantidad de cuotas y sus respectivos pagos. Cada pago, se identifica por un número
de pago, el número de la cuota, la fecha-hora y el importe pagado.

Los empleados trabajan para una sucursal en particular. La administración del banco, identifica a cada empleado por un número de legajo. Además, almacena el apellido, nombre, domicilio, ciudad, país, email, solo un número de teléfono móvil y la fecha de alta del contrato laboral. También debemos registrar en la aplicación, que empleado en específico es el encargado de registrar el préstamo y en el caso de las cuentas, quién es el ejecutivo de cuenta.

Una vez creada la base de datos, necesitamos cargar información dentro de la misma.

- Debemos cargar los 3 tipos de intereses (Interés Fijo, Interés Variable y Otros Intereses).

- Debemos cargar los 3 tipos de cuentas (C.A., C.C. y Otras).

- Desde el banco, nos informan que las descripciones cargadas en el punto
anterior, no logran entenderse y hay que modificarlas. El tipo de cuenta
C.A., hay que renombrarla a CAJA DE AHORRO. El tipo C.C., renombrarla a
CUENTA CORRIENTE.

- También nos informan que el tipo de cuenta “Otras”, no debería existir
porque puede llegar a traer problemas, así que debemos eliminar la
opción de la base de datos.

-----------------------

**Se solicita**

- Confeccionar el DER correspondiente con las entidades, atributos, tipos de datos, claves primarias, claves foráneas y relaciones.

- Agregar todo lo que se considere necesario para una mejor implementación.

- Entregar una imagen del DER y el script completo de la creación de la base dedatos.

- Recordar que la base de datos es relacional.

El Diagrama entidad relación que resulta de este **checkpoint1** es como se muestra a continuación:

![](https://raw.githubusercontent.com/sgcm14/proyectos-sql/main/el_descubierto/checkpoint1_db.png)


## Checkpoint #2

Nos encontramos en el segundo punto de encuentro dentro del proyecto
integrador. Nos reunimos con la institución y junto con ellos cerramos el modelo de la base de datos. Para continuar con el desarrollo del proyecto, vamos a descargar desde aquí el script de la base de datos.

El Diagrama entidad relación es como se muestra a continuación:

![](https://raw.githubusercontent.com/sgcm14/proyectos-sql/main/el_descubierto/el_descubierto.png)


**Enunciado**

La institución bancaria EL DESCUBIERTO, nos pidió una segunda
reunión. Para este hito, se nos solicita presentar una serie de reportes
sobre los datos almacenados en la base de datos que hemos
construido. En base a lo solicitado, vamos a trabajar en la producción de
los siguientes reportes.

**Consigna - CheckPoint II**

1. Listar todos los clientes cuyo nombre comience con la letra "A". Se debe mostrar
id como "Número de cliente", apellido y nombre.
2. Mostrar el número de la sucursal con domicilio "Ramón Freire Serrano 7410".
3. Se requiere saber cuál es el mayor importe prestado
4. Listar los pagos realizados con números 10, 14, 27, 45.
5. Calcular el total de los pagos realizados para el préstamo número cuarenta. El
reporte debe tener dos columnas denominadas "Número de préstamo" y el
"Total pagado".
6. Listar los empleados que no pertenezcan a la sucursal dos y que la fecha de alta
del contrato sea mayor que 5/09/21 o igual a 25/06/21. Ordenar por alta de
contrato.
7. Listar los pagos realizados con importe entre $1030,25 a $1666,66 (ordenarlos
por el importe pagado de mayor a menor).
8. Mostrar el quinto pago realizado con menor importe.
9. Mostrar el préstamo con mayor importe. Este reporte debe contener el número
del préstamo, la fecha de otorgamiento y el importe.
10. Mostrar las diez cuentas bancarias con menor saldo. Este reporte debe contener
el número de cuenta, saldo y el código del tipo de cuenta.
11. Listar los préstamos otorgados entre 10/07/21 al 10/08/21 (ordenarlos por fecha
de otorgamiento)
12. Listar en forma ordenada las cuentas bancarias que tengan un descubierto
otorgado superior o igual a $8999,80.
13. Listar todos los empleados cuyo apellido termine con los caracteres "do". Se
debe mostrar el legajo, apellido, nombre y email.
14. Se desea conocer cuál es el promedio de los saldos de las cajas de ahorro
15. Mostrar el tercer préstamo con mayor importe.
16. Calcular la cantidad de cuentas que tiene la sucursal número cinco. El reporte
debe tener dos columnas denominadas "Sucursal" y el "Cantidad de Cuentas".
17. Mostrar todas las ciudades que contengan una palabra de cinco caracteres, pero
el tercer carácter debe ser igual a "n".
18. Modificar el tipo de cuenta bancaria "Cuenta Corriente" a "Cuenta Especial"
19. En la fecha de hoy, agregar en la sucursal número nueve al empleado Quinteros
Arias Raúl Alejandro con domicilio en Av. 25 de mayo 7410 - Pilar - Buenos Aires,
mail: quiteros2021bs@gmail.com, teléfono móvil: '+5491154000745'.
20. Eliminar el registro del préstamo número cuarenta y cinco.
21. Mostrar el importe total prestado por el banco a sus clientes.
22. Mostrar la cantidad total de cuentas activas que están registradas en el banco.
23. Mostrar el apellido y la cantidad de clientes que poseen el mismo apellido.
24. Mostrar el id del país y la cantidad de ciudades que posee cada uno de ellos.
25. Necesitamos saber la cantidad de préstamos por sucursal y día otorgado. ¿Hay
sucursales que hayan realizado más de un préstamo el mismo día?

-----------------------

**Se solicita**

- Generar una consulta SQL por cada uno de los puntos de la consigna.
- Armar un solo documento (.sql) que contenga todos los puntos de la consigna y las correspondientes consultas SQL. El mismo deberá:
    - Tener como nombre de archivo: CheckPointII_Numero_Grupo
    - En el inicio de la primera hoja del documento deberá incluir el código de la camada, número de grupo y los nombres de todos los integrantes.
    - Debajo de cada consulta SQL, se debe escribir de forma comentada el
    número de la cantidad de registros que devuelve.

**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">