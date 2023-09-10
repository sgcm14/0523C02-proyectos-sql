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

/*Stored Procedure
SP: Clientes por País y Ciudad
Tabla: Clientes
1. Crear un stored procedure que solicite como parámetros de entrada el
nombre de un país y una ciudad, y que devuelva como resultado la
información de contacto de todos los clientes de ese país y ciudad.
En el caso que el parámetro de ciudad esté vacío, se debe devolver todos los clientes del país indicado.*/
DELIMITER $$
CREATE PROCEDURE GetClientesPorPaisYCiudad(IN pais_param VARCHAR(255), IN ciudad_param VARCHAR(255))
BEGIN
    -- Verificar si el parámetro de ciudad está vacío
    IF ciudad_param = '' THEN
        -- Si la ciudad está vacía, obtener todos los clientes del país
        SELECT * FROM Clientes WHERE pais = pais_param;
    ELSE
        -- Si se proporciona una ciudad, obtener los clientes del país y ciudad especificados
        SELECT * FROM Clientes WHERE pais = pais_param AND ciudad = ciudad_param;
    END IF;
END $$

/*2. Invocar el procedimiento para obtener la información de los clientes de
Brasilia en Brazil.*/
CALL GetClientesPorPaisYCiudad('Brazil', 'Brasília');

/*3. Invocar el procedimiento para obtener la información de todos los clientes de Brazil.*/
CALL GetClientesPorPaisYCiudad('Brazil', '');

/*SP: Géneros musicales
Tabla: Generos
1. Crear un stored procedure que reciba como parámetro un nombre de
género musical y lo inserte en la tabla de géneros.
Además, el stored procedure debe devolver el id de género que se insertó.
TIP! Para calcular el nuevo id incluir la siguiente línea dentro del bloque 
de código del SP: SET nuevoid = (SELECT MAX(id) FROM generos) + 1;*/
DELIMITER $$
CREATE PROCEDURE InsertarGenero(IN nombreGenero VARCHAR(255), OUT nuevoId INT)
BEGIN
    DECLARE nuevoid INT;
    
    -- Calcular el nuevo ID
    SET nuevoid = (SELECT MAX(id) FROM Generos) + 1;
    
    -- Insertar el nuevo género
    INSERT INTO Generos (id, nombre) VALUES (nuevoid, nombreGenero);
    
    -- Devolver el nuevo ID
    SET nuevoId = nuevoid;
END $$

/*2. Invocar el stored procedure creado para insertar el género Funk. ¿Qué id devolvió el 
SP ? Consultar la tabla de géneros para ver los cambios.*/
-- Declarar una variable para almacenar el ID devuelto por el SP
SET @idFunk = NULL;

-- Invocar el SP para insertar "Funk"
CALL InsertarGenero('Funk', @idFunk);

-- Mostrar el ID devuelto por el SP
SELECT @idFunk;

SELECT * FROM generos;


/*3. Repetir el paso anterior insertando esta vez el género Tango.*/
-- Declarar una variable para almacenar el ID devuelto por el SP
SET @idTango = NULL;

-- Invocar el SP para insertar "Tango"
CALL InsertarGenero('Tango', @idTango);

-- Mostrar el ID devuelto por el SP
SELECT @idTango;
