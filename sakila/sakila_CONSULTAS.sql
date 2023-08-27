USE sakila;

/*### Parte 1: 
1. Obtener el nombre y apellido de los primeros 5 actores disponibles. Utilizar alias para mostrar los nombres de las columnas en español. */
SELECT first_name AS Nombre , last_name AS Apellido FROM actor
LIMIT 5;

/*2. Obtener un listado que incluya nombre, apellido y correo electrónico de los clientes (customers) inactivos. 
Utilizar alias para mostrar los nombres de las columnas en español. */
SELECT first_name  AS Nombre, last_name AS Apellido, email AS correo 
FROM customer
WHERE active=0;

/*3. Obtener un listado de films incluyendo título, año y descripción de los films que tienen un rental_duration mayor a cinco.
 Ordenar por rental_duration de mayor a menor. Utilizar alias para mostrar los nombres de las columnas en español. */
SELECT title AS titulo, release_year AS "año",  description AS descripción
FROM film
WHERE rental_duration > 5
ORDER BY rental_duration DESC;

/*4. Obtener un listado de alquileres (rentals) que se hicieron durante el mes de mayo de 2005, incluir en el resultado 
todas las columnas disponibles. */
SELECT * 
FROM rental
WHERE rental_date >= '2005-05-01' AND rental_date <= '2005-05-31';

/*### Parte 2: Sumemos complejidad 
Si llegamos hasta acá, tenemos en claro la estructura básica de un SELECT. En los siguientes reportes vamos a sumar complejidad. 
**¿Probamos?**
1. Obtener la cantidad TOTAL de alquileres (rentals). Utilizar un alias para mostrarlo en una columna llamada “cantidad”. */
SELECT COUNT(*) AS cantidad
FROM rental;

/*2. Obtener la suma TOTAL de todos los pagos (payments). Utilizar un alias para mostrarlo en una columna llamada “total”, 
junto a una columna con la cantidad de alquileres con el alias “Cantidad” y una columna que indique el “Importe promedio” por alquiler. */
SELECT SUM(amount) AS total, COUNT(*) AS Cantidad, AVG(amount) AS "Importe promedio"
FROM payment;

/*3. Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes que más dinero gastan y en cuántos alquileres lo hacen? */
SELECT customer.customer_id, SUM(amount) AS total, COUNT(rental_id)
FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
LIMIT 10;

SELECT customer.first_name, customer.last_name, customer.customer_id, SUM(payment.amount) AS total, COUNT(payment.rental_id) AS rental_count
FROM customer
INNER JOIN (
    SELECT customer_id, COUNT(rental_id) AS rental_count
    FROM rental
    GROUP BY customer_id
) AS rental_counts ON customer.customer_id = rental_counts.customer_id
INNER JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
LIMIT 10; -- con nombres, tener cuidado porque puedes duplicar datos si no agrupas adecuadamente


/*4. Generar un reporte que indique: ID de cliente, cantidad de alquileres y monto total para todos los clientes que hayan 
gastado más de 150 dólares en alquileres. */
SELECT customer.customer_id, COUNT(*) AS cantidad, SUM(amount) AS total
FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
HAVING total > 150;

/*5. Generar un reporte que muestre por mes de alquiler (rental_date de tabla rental), la cantidad de alquileres y la suma 
total pagada (amount de tabla payment) para el año de alquiler 2005 (rental_date de tabla rental). */
SELECT EXTRACT(month FROM rental.rental_date), COUNT(*), SUM(payment.amount)
FROM rental
INNER JOIN payment ON rental.rental_id = payment.rental_id
WHERE EXTRACT(year FROM rental.rental_date) = 2005
GROUP BY  EXTRACT(month FROM rental.rental_date);

/*6. Generar un reporte que responda a la pregunta: ¿cuáles son los 5 inventarios más alquilados? 
(columna inventory_id en la tabla rental). Para cada una de ellas indicar la cantidad de alquileres. */
SELECT inventory_id, COUNT(*) AS total
FROM rental
GROUP BY inventory_id
ORDER BY total DESC
LIMIT 5;
