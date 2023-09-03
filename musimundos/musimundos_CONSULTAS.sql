USE musimundos;

SELECT * FROM clientes
WHERE pais LIKE "USA";

/*El área de estrategia de Musimundos está analizando cómo implementar una acción de marketing, en la cual tiene que
 destinar un presupuesto acorde a la cantidad de clientes que tenga cada país. Por esto te piden que los ayudemos
 a identificar la cantidad de clientes que son de Brazil. Seleccioná el número que obtuviste.*/
 
SELECT COUNT(*) FROM clientes
 WHERE pais = "Brazil";
 
 /* En Musimundos estamos muy atentos a que nuestros usuarios encuentren una cantidad apropiada de canciones del estilo 
que quieran escuchar. Es por eso que en esta oportunidad nos están solicitando una lista de cuantas canciones tenemos
 por género. Para esto, hacé una consulta a la base de datos que traiga el id del género y la cantidad de canciones 
 que posee. Seleccioná el número que te dio como resultado de la cantidad de canciones del género con id = 6.*/
 
SELECT id_genero, COUNT(*) FROM canciones
GROUP BY id_genero;

/* Es época de balances, y en Musimundos queremos saber cuánto dinero llevan gastados los clientes en nuestra empresa. 
Seleccioná el número que obtuviste. */
SELECT SUM(total) FROM facturas;

/* En el sitio web de Musimundos, queremos informar la duración promedio en milisegundos de cada álbum. Obtiene una 
lista de todos los álbumes y su duración (milisegundos) promedio. Inserta el número del promedio que obtuviste para el álbum  */
SELECT id_album, AVG(milisegundos) FROM canciones
GROUP BY id_album;

/*En el equipo de desarrollo están mudando de servidor a nuestra aplicación, y quieren saber cuál es el peso (bytes) de cada 
archivo de canciones para buscar un servidor adecuado con capacidad suficiente. Hace una consulta a la base de datos para 
saber cuál es el archivo con menor peso en bytes. Seleccioná el número que obtuviste.*/
SELECT bytes FROM canciones
GROUP BY bytes
ORDER BY bytes;

/*En el salón de Musimundos, estamos ofreciendo un descuento para todos aquellos clientes que tengan un total de facturación
 mayor a 45. Hacé una consulta a la base de datos que nos traiga por id_cliente la suma total de sus facturas. Filtra aquellos 
 que la suma del total sea &gt;45. ¿Cuál es la suma total del cliente con id = 6? Por último, seleccioná el número que obtuviste.*/
SELECT id_cliente, SUM(total) AS suma_total
FROM facturas
GROUP BY id_cliente
HAVING suma_total > 45;

/*En el salón de Musimundos tenemos un cliente fanático de Willie Dixon, quiere comprar toda la colección de sus temas, pero NO
 le interesan los temas que sean de su etapa en el rock.
Hagamos una consulta en la base de datos donde muestre todos los registros que contengan canciones con sus géneros, Y que el
 compositor sea Willie Dixon, Y que tengan el género Blues.
Ingresá el nombre de la segunda canción que obtuviste.*/
SELECT * FROM canciones, generos
WHERE canciones.id_genero = generos.id AND compositor = 'Willie Dixon';

/*
Realizar una consulta sobre la tabla canciones con la siguiente información:

- Solo los 10 primeros caracteres del nombre de la canción en mayúscula.
- Los años de antigüedad que tiene cada canción desde su publicación. Ej: 25 años. 
- El peso en KBytes en número entero (sin decimales, 1024 Bytes = 1 KB)
- El precio formateado con 3 decimales, Ej: $100.123
- El primer compositor de la canción (notar que si hay más de uno, estos 
se separan por coma)
*/
SELECT UPPER(LEFT(nombre, 10)) AS nombre_abreviado,  
FLOOR(bytes / 1024) AS peso_KBytes,
CONCAT('$', FORMAT(precio_unitario, 3)) AS precio_formateado,
SUBSTRING_INDEX(compositor, ',', 1) AS primer_compositor
FROM canciones;