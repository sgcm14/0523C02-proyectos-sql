# Proyecto MUSIMUNDOS

Para instalar la base de datos MUSIMUNDOS necesitamos:

- Tener instalado el My SQL Workbench. 

- Descargar el script Database Musimundos.sql.

Instalación paso a paso:

    1. Ejecutar el MySQL Workbench.

    2. Abrir el script Database Musimundos.sql

    3. Ejecutar el script Database Musimundos.sql

    4. Refrescar la lista de bases de datos

El Diagrama entidad relación es como se muestra a continuación:

![](https://raw.githubusercontent.com/sgcm14/proyectos-sql/main/musimundos/musimundos.png)


## Consigna

Realizar una consulta sobre la tabla canciones con la siguiente información:

- Solo los 10 primeros caracteres del nombre de la canción en mayúscula.
- Los años de antigüedad que tiene cada canción desde su publicación. Ej: 25 años. 
- El peso en KBytes en número entero (sin decimales, 1024 Bytes = 1 KB)
- El precio formateado con 3 decimales, Ej: $100.123
- El primer compositor de la canción (notar que si hay más de uno, estos se separan por coma)

![](https://raw.githubusercontent.com/sgcm14/proyectos-sql/main/musimundos/ejemplo.PNG)


## Stored Procedure

**SP: Clientes por País y Ciudad**

Tabla: Clientes
1. Crear un stored procedure que solicite como parámetros de entrada el
nombre de un país y una ciudad, y que devuelva como resultado la
información de contacto de todos los clientes de ese país y ciudad.
En el caso que el parámetro de ciudad esté vacío, se debe devolver todos los clientes del país indicado.
2. Invocar el procedimiento para obtener la información de los clientes de
Brasilia en Brazil.
3. Invocar el procedimiento para obtener la información de todos los clientes de Brazil.


**SP: Géneros musicales**

Tabla: Generos
1. Crear un stored procedure que reciba como parámetro un nombre de
género musical y lo inserte en la tabla de géneros.
Además, el stored procedure debe devolver el id de género que se insertó.
TIP! Para calcular el nuevo id incluir la siguiente línea dentro del bloque de código del SP: SET nuevoid = (SELECT MAX(id) FROM generos) + 1;
2. Invocar el stored procedure creado para insertar el género Funk. ¿Qué id devolvió el SP ? Consultar la tabla de géneros para ver los cambios.
3. Repetir el paso anterior insertando esta vez el género Tango.

**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">