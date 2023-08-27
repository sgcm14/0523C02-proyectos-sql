USE extra_joins;

/*Reportes - JOINS
1. Obtener los artistas que han actuado en una o más películas.*/
SELECT artista.id, artista.apellido, artista.nombre, COUNT(artista_x_pelicula.pelicula_id) AS peliculas
FROM artista
INNER JOIN artista_x_pelicula ON artista.id = artista_x_pelicula.artista_id
GROUP BY artista.id
HAVING peliculas >= 1;

/*2. Obtener las películas donde han participado más de un artista según nuestra base de datos.*/
SELECT artista_x_pelicula.pelicula_id, COUNT(artista_id) AS artistas
FROM artista
INNER JOIN artista_x_pelicula ON artista.id = artista_x_pelicula.artista_id
GROUP BY artista_x_pelicula.pelicula_id
HAVING artistas>1;

/*3. Obtener aquellos artistas que han actuado en alguna película, incluso
aquellos que aún no lo han hecho, según nuestra base de datos.*/
SELECT *
FROM artista;

/*4. Obtener las películas que no se le han asignado artistas en nuestra base de datos.*/
SELECT *
FROM pelicula
LEFT JOIN artista_x_pelicula ON pelicula.id = artista_x_pelicula.pelicula_id
WHERE artista_x_pelicula.artista_id IS NULL;

/*5. Obtener aquellos artistas que no han actuado en alguna película, según
nuestra base de datos.*/
SELECT *
FROM artista
LEFT JOIN artista_x_pelicula ON artista.id = artista_x_pelicula.artista_id
WHERE artista_x_pelicula.artista_id IS NULL;

/*6. Obtener aquellos artistas que han actuado en dos o más películas según
nuestra base de datos.*/
SELECT artista.id, artista.apellido, artista.nombre, COUNT(artista_x_pelicula.pelicula_id) AS peliculas
FROM artista
INNER JOIN artista_x_pelicula ON artista.id = artista_x_pelicula.artista_id
GROUP BY artista.id
HAVING peliculas >= 2;

/*7. Obtener aquellas películas que tengan asignado uno o más artistas, incluso aquellas que aún no 
le han asignado un artista en nuestra base de datos.*/
SELECT pelicula.id, pelicula.titulo, COUNT(artista_x_pelicula.artista_id) AS cantidad_artistas
FROM pelicula
LEFT JOIN artista_x_pelicula ON pelicula.id = artista_x_pelicula.pelicula_id
GROUP BY pelicula.id, pelicula.titulo
