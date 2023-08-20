# Proyecto EL DESCUBIERTO

Este es un proyecto integrador súper desafiante y lo vamos a desarrollar en tres partes. Hoy, comenzamos por la primera parte y antes de arrancar con el modelado, ¿leamos lo que nos explica la institución respecto de sus datos?

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

El Diagrama entidad relación es como se muestra a continuación:


**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">