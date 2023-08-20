# Proyecto Movies

**Introducción:**

Para ahorrar algunos pasos, preparamos una base de datos de series y películas con el objetivo de que ya contemos con una fuente de datos. 

Podemos descargar el script haciendo clic acá, recordemos que va a ser necesario que lo importemos y ejecutemos en Workbench, similar a lo que realizamos para MUSIMUNDOS.

**Consignas:**

A continuación les planteamos diferentes consultas que debemos realizar sobre la base de datos descargada.

Algunas sugerencias de cómo encarar el ejercicio:
- Realizar una rápida mirada rápida a las tablas y sus campos para tener una idea de dónde buscar la información.
- Recordar que las diferentes partes de un SELECT llevan un orden específico.

Sin más preámbulo, arranquemos con el ejercicio. ¡Buena suerte! 😎👌✨

El Diagrama entidad relación es como se muestra a continuación:

--------
**Consultas:**

**SELECT**

1. Mostrar todos los registros de la tabla de movies.
2. Mostrar el nombre, apellido y rating de todos los actores.
3. Mostrar el título de todas las series. 

**WHERE Y ORDER BY**

4. Mostrar el nombre y apellido de los actores cuyo rating sea mayor a 7,5.
5. Mostrar el título de las películas, el rating y los premios de las películas con un rating mayor a 7,5 y con más de dos premios.
6. Mostrar el título de las películas y el rating ordenadas por rating en forma ascendente.

**BETWEEN y LIKE**

7. Mostrar el título y rating de todas las películas cuyo título incluya Toy Story.
8. Mostrar a todos los actores cuyos nombres empiecen con Sam.
9. Mostrar el título de las películas que salieron entre el ‘2004-01-01’ y
‘2008-12-31’.

**Alias, limit y offset**

1. Mostrar el título de todas las series y usar alias para que el nombre del campo este en español.
2. Traer el título de las películas con el rating mayor a 3, con más de 1 premio y con fecha de lanzamiento entre el año ‘1988-01-01’ al ‘2009-12-31’. Ordenar los resultados por rating descendentemente.
3. Traer el top 3 a partir del registro 10 de la consulta anterior.
4. ¿Cuáles son los 3 peores episodios teniendo en cuenta su rating?
5. Obtener el listado de todos los actores. Quitar las columnas de fechas y película favorita, además traducir los nombres de las columnas.

**Funciones de agregación, GROUP BY y HAVING**

1. ¿Cuántas películas hay?
2. ¿Cuántas películas tienen entre 3 y 7 premios?
3. ¿Cuántas películas tienen entre 3 y 7 premios y un rating mayor a 7?
4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por id. de género.
5. De la consulta anterior, listar sólo aquellos géneros que tengan como suma de premios un número mayor a 5

**Join**

1. Utilizando la base de datos de movies, queremos conocer, por un lado, los títulos y el nombre del género de todas las series de la base de datos.
2. Por otro, necesitamos listar los títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.
3. Para nuestro próximo desafío, necesitamos obtener a todos los actores o
actrices (mostrar nombre y apellido) que han trabajado en cualquier película de la saga de La Guerra de las galaxias.
4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por nombre de género.

**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">