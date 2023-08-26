# Volver al futuro: Sakila

**Introducción**

Les damos la bienvenida a esta clase asincrónica llamada “Volver al futuro”. ¿Por qué ese nombre? Porque vamos a analizar los 
datos de una base de datos de un videoclub. 

Nos imaginamos que a esta altura te estarás preguntando... ¿Qué es eso? Los videoclubs fueron los antecesores de Netflix, Amazon, Disney+ o cualquier plataforma de streaming. La gran diferencia era que uno tenía que ir presencialmente a buscar la película que deseaba visualizar. ¿Por qué contamos esto? Para poner en contexto el tipo de bases de datos con el que vamos a trabajar. Dado que nos pidieron una serie de informes a partir de esas bases de datos. 


**¿Empezamos?**

Para iniciar, necesitamos que descargues la base de datos Sakila. Esta base se encuentra en un archivo .sql que se debe importar desde MySQL Workbench. Asegurate de haber abierto la conexión y que estés dentro del panel “Navigator”. 

Luego, desde la pestaña “File->Open SQL Script”, buscá y abrí el Sakila_DB.sql que descargaste. Por último, ejecutá el script desde el ícono del rayo. 
Cumplidos todos estos pasos, vamos a ver qué reportes nos solicitan. ¡Buena suerte! ✨ 


El Diagrama entidad relación es como se muestra a continuación:

![](https://raw.githubusercontent.com/sgcm14/proyectos-sql/main/sakila/sakila_db.png)

**Reportes:** 

### Parte 1: 
1. Obtener el nombre y apellido de los primeros 5 actores disponibles. Utilizar alias para mostrar los nombres de las columnas en español. 

2. Obtener un listado que incluya nombre, apellido y correo electrónico de los clientes (customers) inactivos. Utilizar alias para mostrar los nombres de las columnas en español. 

3. Obtener un listado de films incluyendo título, año y descripción de los films que tienen un rental_duration mayor a cinco. Ordenar por rental_duration de mayor a menor. Utilizar alias para mostrar los nombres de las columnas en español. 

4. Obtener un listado de alquileres (rentals) que se hicieron durante el mes de mayo de 2005, incluir en el resultado todas las columnas disponibles. 


### Parte 2: Sumemos complejidad 
Si llegamos hasta acá, tenemos en claro la estructura básica de un SELECT. En los siguientes reportes vamos a sumar complejidad. 
**¿Probamos?**

1. Obtener la cantidad TOTAL de alquileres (rentals). Utilizar un alias para mostrarlo en una columna llamada “cantidad”. 

2. Obtener la suma TOTAL de todos los pagos (payments). Utilizar un alias para mostrarlo en una columna llamada “total”, junto a una columna con la cantidad de alquileres con el alias “Cantidad” y una columna que indique el “Importe promedio” por alquiler. 

3. Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes que más dinero gastan y en cuántos alquileres lo hacen? 

4. Generar un reporte que indique: ID de cliente, cantidad de alquileres y monto total para todos los clientes que hayan gastado más de 150 dólares en alquileres. 

5. Generar un reporte que muestre por mes de alquiler (rental_date de tabla rental), la cantidad de alquileres y la suma total pagada (amount de tabla payment) para el año de alquiler 2005 (rental_date de tabla rental). 

6. Generar un reporte que responda a la pregunta: ¿cuáles son los 5 inventarios más alquilados? (columna inventory_id en la tabla rental). Para cada una de ellas indicar la cantidad de alquileres. 



**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">