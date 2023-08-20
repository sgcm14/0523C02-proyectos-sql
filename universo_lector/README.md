# Proyecto Universo lector

La biblioteca presta sus libros a los socios y socias, que disponen de un código de identificación y además necesitan registrar su dni, dirección, teléfonos de contacto, nombre y apellidos.

Cada libro posee un código interno, su código ISBN, su título, el año que se escribió, nombre del autor, año de edición y el nombre de la editorial.

Además se debe indicar si un volumen (versión impresa de cada libro) se 
encuentra deteriorado o no.

Cada editorial se registra con un identificador, su razón social y teléfono.

Sabemos que una editorial, edita varios libros anualmente y que en este caso todos los libros de la biblioteca tiene un solo autor, pero un autor pudo haber escrito más de un libro.

Se quiere registrar cada préstamo que se realiza a cada socio o socia, 
guardando la fecha, fecha tope para devolver, y la fecha de devolución de 
cada volumen.

Cada préstamo es identificado por un código único y puede incluir uno o más volúmenes.

**Consigna:**

    DER a la base de datos:
    ----------------------
    A partir del DER generado en el ejercicio “Universo lector”, en grupo deberán:
    1. Crear un schema de base de datos llamado “UniversoLector”.
    2. Crear las tablas del modelo relacional.
    3. Por cada tabla, crear las columnas y asignar el tipo de datos más adecuado.
    4. Crear la clave primaria de cada tabla.
    5. Agregar las claves foráneas de relación.
    6. Mediante ingeniería inversa, generar el DER de la base de datos 
    “Universo lector” dentro de Workbench

El Diagrama entidad relación es como se muestra a continuación:

-------------------
**Manipulando datos:**

    INSERT:
    ------
    En la base de datos “UniversoLector” agregar datos en las siguientes tablas:

    ➔ Socio

    ➔ SocioxTelefono

    ➔ Autor

    ➔ Editorial

    ➔ Libro

    ➔ Volumen

    ➔ PrestamoxVolumen

    ➔ Prestamo


    DELETE:
    ------

    Tabla SOCIO
    - Borrar un socio.

    Tabla LIBROS
    - Intentar borrar un libro que tenga asociado un volumen asociado. ¿Qué sucede en ese caso?


    UPDATE:
    ------

    Tabla SOCIO
    - Un socio te pide que actualices su dirección a “Monroe 860”. Selecciona el socio número 3 y actualiza su dirección.

**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">