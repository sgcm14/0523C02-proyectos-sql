USE movies_db;

/*SELECT*/
/*1. Mostrar todos los registros de la tabla de movies.*/
SELECT * FROM movies;

/*2. Mostrar el nombre, apellido y rating de todos los actores.*/
SELECT first_name, last_name, rating FROM actors;

/*3. Mostrar el título de todas las series.*/
SELECT title FROM series;

/*WHERE Y ORDER BY*/
/*4. Mostrar el nombre y apellido de los actores cuyo rating sea mayor a 7,5.*/
SELECT first_name, last_name FROM actors
WHERE rating>7.5;

/*5. Mostrar el título de las películas, el rating y los premios de las películas con un rating mayor a 7,5 y con más de dos premios.*/
SELECT title, rating, awards FROM movies
WHERE rating>7.5 AND awards>2;

/*6. Mostrar el título de las películas y el rating ordenadas por rating en forma ascendente.*/
SELECT title, rating FROM movies 
ORDER BY rating ASC;

/*BETWEEN y LIKE*/
/*7. Mostrar el título y rating de todas las películas cuyo título incluya Toy Story.*/
SELECT title, rating FROM movies
WHERE title LIKE 'Toy Story%';

/*8. Mostrar a todos los actores cuyos nombres empiecen con Sam.*/
SELECT * FROM actors
WHERE first_name LIKE 'Sam%';

/*9. Mostrar el título de las películas que salieron entre el ‘2004-01-01’ y ‘2008-12-31’.*/
SELECT title FROM movies
WHERE release_date BETWEEN '2004-01-01' AND '2008-12-31';


/*Alias, limit y offset*/
/*1. Mostrar el título de todas las series y usar alias para que el nombre del campo este en español.*/
SELECT title AS titulo FROM movies;

/*2. Traer el título de las películas con el rating mayor a 3, con más de 1 premio y con fecha de lanzamiento entre 
el año ‘1988-01-01’ al ‘2009-12-31’. Ordenar los resultados por rating descendentemente.*/
SELECT title FROM movies
WHERE rating>3 AND 
	  awards>1 AND 
      release_date BETWEEN '1988-01-01' AND '2009-12-31'
ORDER BY rating DESC;

/*3. Traer el top 3 a partir del registro 10 de la consulta anterior.*/
SELECT title FROM movies
WHERE rating>3 AND 
	  awards>1 AND 
      release_date BETWEEN '1988-01-01' AND '2009-12-31'
ORDER BY rating DESC
LIMIT 3;

/*4. ¿Cuáles son los 3 peores episodios teniendo en cuenta su rating?*/
SELECT * FROM episodes
ORDER BY rating ASC
LIMIT 3;

/*5. Obtener el listado de todos los actores. Quitar las columnas de fechas y película favorita, además traducir los nombres de las columnas.*/
SELECT first_name AS nombre, last_name AS apellido, rating AS clasificación FROM actors;

/*Funciones de agregación, GROUP BY y HAVING*/
/*1. ¿Cuántas películas hay?*/
SELECT COUNT(title) FROM movies;

/*2. ¿Cuántas películas tienen entre 3 y 7 premios?*/
SELECT COUNT(*) FROM movies
WHERE awards BETWEEN 3 AND 7;

/*3. ¿Cuántas películas tienen entre 3 y 7 premios y un rating mayor a 7?*/
SELECT COUNT(*) FROM movies
WHERE (awards BETWEEN 3 AND 7) AND rating>7;

/*4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
cantidad de películas por id. de género.*/
SELECT genre_id, COUNT(genre_id) FROM movies
GROUP BY genre_id;

/*5. De la consulta anterior, listar sólo aquellos géneros que tengan como suma
de premios un número mayor a 5.*/
SELECT genre_id, COUNT(genre_id)
FROM movies
GROUP BY genre_id
HAVING SUM(awards) > 5;

/*Join
1. Utilizando la base de datos de movies, queremos conocer, por un lado, los
títulos y el nombre del género de todas las series de la base de datos.*/
SELECT title, name 
FROM series
INNER JOIN genres ON genre_id = genres.id;

/*2. Por otro, necesitamos listar los títulos de los episodios junto con el nombre y
apellido de los actores que trabajan en cada uno de ellos.*/
SELECT episodes.title, actors.first_name, actors.last_name
FROM episodes
INNER JOIN actor_episode ON episodes.id = actor_episode.episode_id
INNER JOIN actors ON actor_episode.actor_id = actors.id;

/*3. Para nuestro próximo desafío, necesitamos obtener a todos los actores o
actrices (mostrar nombre y apellido) que han trabajado en cualquier película
de la saga de La Guerra de las galaxias.*/
SELECT movies.title, actors.first_name, actors.last_name
FROM movies
INNER JOIN actor_movie ON movies.id = actor_movie.movie_id
INNER JOIN actors ON actor_movie.actor_id = actors.id
WHERE movies.title LIKE 'La Guerra de las galaxias%';

/*4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
cantidad de películas por nombre de género.*/
SELECT genres.name,COUNT(movies.genre_id) AS cantidad
FROM movies
INNER JOIN genres ON genre_id = genres.id
GROUP BY genres.name;
