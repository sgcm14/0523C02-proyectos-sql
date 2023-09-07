USE `proyecto_spotify`;

/*Consultas Group by - Insert - Update - Delete*/
-- 1) Mostrar la cantidad de usuarios hay free, standard, y usuario premium.
SELECT t.TipoUsuario, COUNT(*) AS cantidad
FROM usuario u
INNER JOIN tipousuario t ON u.IdTipoUsuario = t.idTipoUsuario
GROUP BY t.TipoUsuario;

-- 2) Cantidad de álbumes x discográfica
SELECT d.nombre, COUNT(*) AS cantidad
FROM album a
INNER JOIN discografica d ON a.iddiscografica = d.idDiscografica
GROUP BY d.nombre;

-- 3) Cantidad de cancion x usuario y promedio
SELECT u.idUsuario, SUM(p.cantcanciones) AS suma, FLOOR(AVG(p.cantcanciones)) AS promedio
FROM usuario u
INNER JOIN playlist p ON u.idUsuario = p.idusuario
GROUP BY u.idUsuario;

-- 4) Mostrar el la playlist que tiene mas canciones
SELECT MAX(cantcanciones) AS cantidad
FROM playlist
GROUP BY idPlaylist
ORDER BY cantidad DESC
LIMIT 1;

-- 5) Listar los 10 usuarios mas nuevos en el sistemas
SELECT *
FROM usuario
ORDER BY idUsuario DESC
LIMIT 10;

-- 6) Listar los 10 usuarios más antiguos.
SELECT *
FROM usuario
ORDER BY idUsuario ASC
LIMIT 10;

-- 7) Artista con más likes
SELECT ar.Nombre, SUM(c.cantlikes) AS cantidad
FROM cancion c
INNER JOIN album al ON c.IdAlbum = al.idAlbum
INNER JOIN artista ar ON al.idArtista = ar.idArtista
GROUP BY ar.Nombre
ORDER BY cantidad DESC
LIMIT 1;

-- 8) Artista con más canciones
SELECT ar.Nombre, COUNT(c.idCancion) AS cantidad
FROM cancion c
INNER JOIN album al ON c.IdAlbum = al.idAlbum
INNER JOIN artista ar ON al.idArtista = ar.idArtista
GROUP BY ar.Nombre
ORDER BY cantidad DESC
LIMIT 1;

-- 9) Mostrar cantidad total de pagos por medio de pago x mes .
SELECT t.TipoFormaPago AS "medio de pago", SUM(p.Importe) AS total, MONTH(p.fechaPago) AS Mes
FROM pagos p
INNER JOIN datospagoxusuario d ON p.IdDatosPagoxUsuario = d.idDatosPagoxUsuario
INNER JOIN tipoformapago t ON d.idTipoFormaPago = t.idTipoFormaPago
GROUP BY t.TipoFormaPago, MONTH(p.fechaPago)
ORDER BY Mes;

-- 10) Listar cantidad de usuarios del mismo país
SELECT p.Pais, COUNT(u.idUsuario)
FROM usuario u
INNER JOIN pais p ON u.Pais_idPais = p.idPais
GROUP BY p.Pais;

-- 11) Listar la última fecha de creación de una playlist de los usuarios de Argentina.
SELECT MAX(Fechacreacion)
FROM playlist pl
INNER JOIN usuario u ON pl.idusuario = u.idUsuario
INNER JOIN pais p ON u.Pais_idPais = p.idPais
GROUP BY p.Pais
HAVING p.Pais="Argentina";

-- 12) Listar las passwords más utilizadas y cuantas veces se utilizaron, cual fue la primera fecha que se utilizó y la última.
SELECT Password, COUNT(Password) AS VecesUtilizada, MIN(Fecha) AS PrimeraFechaUtilización, MAX(Fecha) AS ÚltimaFechaUtilización
FROM passwordxusuario
GROUP BY Password
ORDER BY VecesUtilizada DESC;

/*Relaciones (Inner Joins)*/
/*1) Mostrar el nombre de usuario y contar la cantidad de playlist que tiene.*/
SELECT u.nombreusuario, COUNT(p.idPlaylist)
FROM usuario u
INNER JOIN playlist p ON u.idUsuario = p.idusuario
GROUP BY u.nombreusuario;

/*2) Mostrar los nombres de los géneros con la cantidad de temas que tienen
asignadas a ellas.*/
SELECT g.Genero, COUNT(IdCancion)
FROM genero g
INNER JOIN generoxcancion gc ON g.idGenero = gc.IdGenero
GROUP BY g.Genero;

/*3) Mostrar las canciones que comienzan con Z y el nombre del álbum al que
pertenece y la banda respectiva.*/
SELECT c.titulo, al.titulo, a.Nombre
FROM cancion c
INNER JOIN album al ON c.IdAlbum = al.idAlbum
INNER JOIN artista a ON al.idArtista = a.idArtista
WHERE c.titulo LIKE "Z%";

/*4) Mostrar el la playlist más se reprodujo y el nombre del usuario que la creó.*/
SELECT p.titulo AS playlist, u.nombreusuario AS creador
FROM playlist p
INNER JOIN usuario u ON p.idUsuario = u.idUsuario
WHERE p.cantcanciones = (
    SELECT MAX(cantcanciones)
    FROM playlist
);

/*5) Listar todos los usuarios que tienen la password vencida o pròxima a vencer
(5 días)*/
SELECT DISTINCT u.nombreusuario, p.Fecha
FROM usuario u
INNER JOIN passwordxusuario p ON u.idUsuario = p.idUsuario
WHERE p.Fecha <= DATE_ADD(CURRENT_DATE(), INTERVAL 5 DAY);

/*Relaciones avanzadas ( Left/ Right)*/
/*1. Listar todos los usuarios que no hayan generado una playlist*/
SELECT u.nombreusuario
FROM usuario u
LEFT JOIN playlist p ON u.idUsuario = p.idusuario
WHERE p.idPlaylist IS NULL;

/*2. Listar todas las canciones hayan o no recibido likes en el último mes (
cuántos) y qué si han sido reproducidas*/
SELECT *
FROM cancion;

/*3. Listar todas los artistas , y la cantidad de seguidores tengan o no.*/
SELECT *
FROM artista;

/*Extras*/
/*1. Mostrar el nombre de usuario y contar la cantidad de playlist que tiene.*/
SELECT u.nombreusuario, COUNT(p.idPlaylist)
FROM usuario u
INNER JOIN playlist p ON u.idUsuario = p.idusuario
GROUP BY u.nombreusuario;

/*2. Generar un reporte, donde se muestre el método de pago , la cantidad
de operaciones que se realizaron con cada uno y el importe total .*/
SELECT t.TipoFormaPago, COUNT(d.idDatosPagoxUsuario), SUM(p.Importe)
FROM tipoformapago t
INNER JOIN datospagoxusuario d ON t.idTipoFormaPago = d.idTipoFormaPago
INNER JOIN pagos p ON d.idDatosPagoxUsuario = p.IdDatosPagoxUsuario
GROUP BY t.TipoFormaPago;

/*3. Listar las canciones que tienen los artistas cuyo nombre contiene la
letra “r” y el pertenecen al código de género 20.*/
SELECT c.titulo, a.Nombre 
FROM cancion c
INNER JOIN album al ON c.IdAlbum = al.idAlbum
INNER JOIN artista a ON al.idArtista = a.idArtista
INNER JOIN generoxcancion gc ON c.idCancion = gc.IdCancion
INNER JOIN genero g ON gc.IdGenero = g.idGenero
WHERE a.Nombre LIKE '%r%' AND g.idGenero=20;

/*4. Listar todos los usuarios que que pagaron con efectivo y la fecha de
pago sea del 2020*/
SELECT U.nombreusuario, fechaPago
FROM usuario u
INNER JOIN datospagoxusuario dp ON u.idUsuario = dp.idusuario
INNER JOIN tipoformapago tp ON dp.idTipoFormaPago = tp.idTipoFormaPago
INNER JOIN pagos p ON dp.idDatosPagoxUsuario = p.IdDatosPagoxUsuario
WHERE TipoFormaPago= "Efectivo" AND YEAR(fechaPago) = 2020;

/*5. Generar un reporte de todas las canciones, cuyo álbum no posee
imagen de portada.*/
SELECT c.titulo 
FROM cancion c
RIGHT JOIN album a ON c.IdAlbum = a.idAlbum
WHERE imagenportada IS NULL;

/*6. Genera un reporte por género e informar la cantidad de canciones que
posee. Si una canción tiene más de un género, debe ser incluida en la
cuenta de cada uno de esos géneros.*/
SELECT g.Genero, COUNT(*)
FROM cancion c
INNER JOIN generoxcancion gc ON c.idCancion = gc.IdCancion
INNER JOIN genero g ON gc.IdGenero = g.idGenero
GROUP BY g.Genero;

/*7. Listar todos las playlist que no están en estado activo y a que usuario
pertenecen , ordenado por la fecha de eliminación.*/
SELECT p.titulo, u.nombreusuario, p.Fechaeliminada
FROM playlist p
INNER JOIN estadoplaylist ep ON p.idestado  = ep.idEstadoPlaylist
INNER JOIN usuario u ON p.idusuario = u.idUsuario
WHERE EP.descripcion!= "activa"
ORDER BY p.Fechaeliminada;

/*8. Generar un reporte que muestre por tipo de usuario, la cantidad de
usuarios que posee.*/
SELECT t.TipoUsuario, COUNT(u.idUsuario)
FROM usuario u
INNER JOIN tipousuario t ON u.idTipoUsuario = t.idTipoUsuario
GROUP BY  t.TipoUsuario;

/*9. Listar la suma total obtenida por cada tipo de suscripción, en el periodo
del 01-01-2020 al 31-12-2020*/
SELECT t.TipoUsuario, COUNT(s.idSuscripcion)
 FROM suscripcion s
 INNER JOIN tipousuario t ON s.IdTipoUsuario = t.idTipoUsuario
 WHERE s.FechaInicio >= '2020-01-01' AND s.FechaInicio <= '2020-12-31'
GROUP BY t.TipoUsuario;

/*10.Listar el álbum y la discográfica que posea la canción con más
reproducciones.*/
SELECT a.*, d.*
FROM cancion c
INNER JOIN album a ON c.IdAlbum  = a.idAlbum
INNER JOIN discografica d ON a.IdDiscografica = d.IdDiscografica
WHERE c.cantlikes = (SELECT MAX(cantlikes) FROM cancion);

/*11. Listar todos los usuarios que no hayan generado una playlist*/
SELECT u.* 
FROM usuario u
LEFT JOIN playlist p ON u.idUsuario  = p.idusuario
WHERE p.idPlaylist IS NULL;

/*12. Listar todas las canciones hayan o no recibido likes (cuántos) y
aclarar si han sido reproducidas o no. Listar las 15 primeras ordenadas
como si fueran un Ranking*/
SELECT titulo, cantlikes, CASE WHEN cantreproduccion > 0 THEN 'Reproducida' ELSE 'No reproducida' END AS EstadoReproduccion
FROM cancion
ORDER BY cantlikes DESC
LIMIT 15;

/*13.Generar un reporte con el nombre del artista y el nombre de la canción
que no pertenecen a ninguna lista.*/
SELECT a.Nombre, c.titulo
FROM playlistxcancion p
RIGHT JOIN cancion c on p.Idcancion  = c.idCancion
INNER JOIN album al ON c.IdAlbum = al.idAlbum
INNER JOIN artista a ON al.idArtista = a.idArtista
WHERE idPlaylistxCancion IS NULL
GROUP BY c.idCancion;

/*SELECT a.Nombre AS NombreArtista, c.titulo AS NombreCancion
FROM cancion c
INNER JOIN album al ON c.IdAlbum = al.idAlbum
INNER JOIN artista a ON al.idArtista = a.idArtista
LEFT JOIN playlistxcancion p ON c.idCancion = p.Idcancion
WHERE p.idPlaylistxCancion IS NULL;*/

/*14.Listar todas las canciones, el nombre del artista, la razón social de la
discográfica y la cantidad de veces que fue reproducida.*/
SELECT c.titulo, a.Nombre AS Artista, d.nombre AS Discografica, c.cantreproduccion
FROM cancion c
INNER JOIN album al ON c.IdAlbum = al.idAlbum
INNER JOIN artista a ON al.idArtista  = a.idArtista
INNER JOIN discografica d ON al.iddiscografica  = d.idDiscografica
GROUP BY c.idCancion;

/*15.Listar todas las discográficas, que pertenezcan a Inglaterra y la
cantidad de álbumes que hayan editado.*/
SELECT d.nombre, COUNT(a.idAlbum)
FROM discografica d
INNER JOIN album a ON d.idDiscografica  = a.iddiscografica
INNER JOIN pais p ON d.idPais = p.idPais
WHERE p.Pais = "Inglaterra"
GROUP BY d.nombre;

/*16.Listar a todos los artistas que no poseen ningún álbum.*/
SELECT a.Nombre
FROM artista a
LEFT JOIN album al ON a.idArtista = al.idArtista
WHERE al.idAlbum IS NULL;

/*17.Listar todos los álbumes que tengan alguna canción que posea más de
un género*/
SELECT al.titulo
FROM album al
INNER JOIN cancion c ON al.idAlbum = c.IdAlbum
WHERE c.idCancion IN(
SELECT gc.IdCancion
FROM cancion c
INNER JOIN generoxcancion gc ON c.idCancion = gc.IdCancion
GROUP BY gc.IdCancion
HAVING COUNT(gc.IdGenero) > 1
)
GROUP BY al.titulo;

/*18.Generar un reporte por usuario , listando las suscripciones que tiene o
tuvo, el importe que abonó y los datos de las formas de pago con que
lo realizó.*/
SELECT u.nombreusuario, t.TipoUsuario, p.Importe
FROM usuario u
INNER JOIN suscripcion s ON u.idUsuario = s.idusuario
INNER JOIN tipousuario t ON u.IdTipoUsuario = t.idTipoUsuario
INNER JOIN pagos p ON s.idpagos = p.idPagos
GROUP BY u.nombreusuario, t.TipoUsuario, p.Importe;

-- Agrupa en una celda por usuario 
SELECT u.nombreusuario, t.TipoUsuario,
       GROUP_CONCAT('Importe: ', p.Importe) AS Suscripciones
FROM usuario u
INNER JOIN suscripcion s ON u.idUsuario = s.idusuario
INNER JOIN tipousuario t ON u.IdTipoUsuario = t.IdTipoUsuario
INNER JOIN pagos p ON s.idpagos = p.idPagos
GROUP BY u.nombreusuario, t.TipoUsuario;

/*1. Mostrar la cantidad de canciones que pertenecen a ambos géneros pop y rock
cuyo nombre contiene la letra “m”.*/
SELECT COUNT(*)
FROM cancion c
INNER JOIN generoxcancion gc ON c.idCancion = gc.IdCancion
INNER JOIN genero g ON gc.IdGenero  = g.idGenero
WHERE titulo LIKE "%m%" AND (Genero = "Rock" OR Genero = "Pop");

/*2. Listar todas las canciones que pertenezcan a más de una playlist. Incluir en el
listado el nombre de la canción, el código y a cuántas playlists pertenecen.*/
SELECT titulo, c.idCancion, COUNT(p.IdPlaylist) AS CantidadPlaylists
FROM cancion c
INNER JOIN playlistxcancion p ON c.idCancion = p.Idcancion
GROUP BY titulo, c.idCancion
HAVING CantidadPlaylists > 1;

/*3. Generar un reporte con el nombre del artista y el nombre de la canción que no
pertenecen a ninguna lista, ordenados alfabéticamente por el nombre del
artista.*/
SELECT a.Nombre, c.titulo
FROM artista a
INNER JOIN album al ON a.IdArtista = al.IdArtista
INNER JOIN cancion c ON al.IdAlbum = c.IdAlbum
LEFT JOIN (
    SELECT DISTINCT IdCancion
    FROM playlistxcancion
    WHERE IdCancion IS NOT NULL
) p ON c.IdCancion = p.IdCancion
WHERE p.IdCancion IS NULL
ORDER BY a.Nombre;

/*4. Modificar el país de todos los usuarios con el código postal “7600” a “Argentina”.*/
-- crea una tabla temporal que almacene los IDs de los usuarios que cumplen con la condición del código postal "7600":
CREATE TEMPORARY TABLE TempUsersToUpdate AS
SELECT idUsuario
FROM usuario
WHERE CP = '7600';

 -- Luego, realiza la actualización utilizando la tabla temporal:
UPDATE usuario AS u
JOIN TempUsersToUpdate AS t ON u.idUsuario = t.idUsuario
SET u.Pais_idPais = (SELECT idPais FROM Pais WHERE Pais = 'Argentina');

--  elimina la tabla temporal
DROP TEMPORARY TABLE IF EXISTS TempUsersToUpdate;

/*5. Listar todos los álbumes que tengan alguna canción que posea más de un
género.*/
SELECT a.idAlbum, a.titulo AS nombre_album
FROM album a
INNER JOIN cancion c ON a.idAlbum = c.idAlbum
INNER JOIN generoxcancion gc ON c.idCancion = gc.idCancion
INNER JOIN genero g ON gc.idGenero = g.idGenero
GROUP BY a.idAlbum, a.titulo
HAVING COUNT(DISTINCT g.idGenero) > 1;


/*6. Crear un índice agrupado para las canciones cuyo identificador sea el ID.*/
-- Crear el índice agrupado (PRIMARY KEY)
ALTER TABLE cancion
ADD PRIMARY KEY (idCancion);
