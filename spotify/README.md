# Proyecto Spotify

Empecemos con el primer paso del proyecto integrador. En esta oportunidad
vamos a trabajar sobre el caso de Spotify.

Es un proyecto súper desafiante que lo vamos a ir realizando por partes.
Antes de arrancar con el modelado, ¿leemos lo que nos explica la empresa
respecto de sus datos?

**Enunciado:**

La empresa Spotify desea generar una base de datos para almacenar
toda la información de su producto homónimo. La aplicación es utilizada para la reproducción de música vía streaming, posee un modelo de negocio premium y un servicio free básico con publicidad.

Al registrarse, cada usuario escribe su email, contraseña, fecha de nacimiento, sexo, código postal y país. Existe una validación de seguridad de las contraseñas y también se guarda la fecha de modificación de la misma, ya que por política de seguridad las contraseñas tienen una vigencia de 90 días.

El servicio de Spotify permite la creación de varias playlists por usuario. De cada playlist guardamos un título, el número de canciones que contiene, un identificador único y una fecha de creación.

Las canciones se identifican con un ID único, un título, una duración, también es importante guardar el número de veces que ha sido reproducida por los usuarios de Spotify y la cantidad de likes que le han dado los usuarios.

**Aclaraciones importantes:**

    ● Un usuario puede crear muchas playlists. De cada playlist guardamos un
    título, el número de canciones que contiene, un identificador único y una
    fecha de creación.

    ● Cuando un usuario borra una playlist, no se borra del sistema, sino que se marca como que ha sido eliminada. De este modo, el usuario puede
    volver a recuperar sus playlists en caso de que las haya eliminado por
    error. Es necesario almacenar la fecha en la que una playlist ha sido
    marcada como eliminada.

    ● Podemos decir que existen dos tipos de playlists: activas y borradas.

    ● Una canción solo puede pertenecer a un único álbum. Una canción puede
    tener más de un género. Un álbum puede contener muchas canciones.
    Un álbum ha sido publicado por un único artista. Un artista puede haber
    publicado muchos álbumes.

    ● De cada álbum guardamos un ID único, título, año de publicación,
    discográfica que lo editó y una imagen con la portada.

    ● Una discográfica puede haber editado más de un álbum. De la
    discográfica nos interesa guardar un identificador, nombre y país.

    ● De cada artista guardamos un identificador único, nombre y una imagen
    del artista.

El Diagrama entidad relación es como se muestra a continuación:

![](https://raw.githubusercontent.com/sgcm14/proyectos-sql/main/spotify/spotify.png)

Para realizar consultas el Diagrama entidad relación es como se muestra a continuación:

![](https://raw.githubusercontent.com/sgcm14/proyectos-sql/main/spotify/proyecto_spotify.png)


## Consultas Group by - Insert - Update - Delete

1) Mostrar la cantidad de usuarios hay free, standard, y usuario premium.
2) Cantidad de álbumes x discográfica
3) Cantidad de cancion x usuario y promedio
4) Mostrar el la playlist que tiene mas canciones
5) Listar los 10 usuarios mas nuevos en el sistemas
6) Listar los 10 usuarios más antiguos.
7) Artista con más likes
8) Artista con más canciones
9) Mostrar cantidad total de pagos por medio de pago x mes .
10) Listar cantidad de usuarios del mismo país
11) Listar la última fecha de creación de una playlist de los usuarios de
Argentina.
12) Listar las passwords más utilizadas y cuantas veces se utilizaron, cual fue la primera fecha que se utilizó y la última.

## Relaciones (Inner Joins)
1) Mostrar el nombre de usuario y contar la cantidad de playlist que tiene.
2) Mostrar los nombres de los géneros con la cantidad de temas que tienen
asignadas a ellas.
3) Mostrar las canciones que comienzan con Z y el nombre del álbum al que
pertenece y la banda respectiva.
4) Mostrar el la playlist más se reprodujo y el nombre del usuario que la creó.
5) Listar todos los usuarios que tienen la password vencida o pròxima a vencer (5 días)

## Relaciones avanzadas ( Left/ Right)
1. Listar todos los usuarios que no hayan generado una playlist
2. Listar todas las canciones hayan o no recibido likes en el último mes (
cuántos) y qué si han sido reproducidas
3. Listar todas los artistas , y la cantidad de seguidores tengan o no.

## Extras
1. Mostrar el nombre de usuario y contar la cantidad de playlist que tiene.
2. Generar un reporte, donde se muestre el método de pago , la cantidad
de operaciones que se realizaron con cada uno y el importe total .
3. Listar las canciones que tienen los artistas cuyo nombre contiene la
letra “r” y el pertenecen al código de género 20.
4. Listar todos los usuarios que que pagaron con efectivo y la fecha de
pago sea del 2020
5. Generar un reporte de todas las canciones, cuyo álbum no posee
imagen de portada.
6. Genera un reporte por género e informar la cantidad de canciones que
posee. Si una canción tiene más de un género, debe ser incluida en la
cuenta de cada uno de esos géneros.
7. Listar todos las playlist que no están en estado activo y a que usuario
pertenecen , ordenado por la fecha de eliminación.
8. Generar un reporte que muestre por tipo de usuario, la cantidad de
usuarios que posee.
9. Listar la suma total obtenida por cada tipo de suscripción, en el periodo
del 01-01-2020 al 31-12-2020
10. Listar el álbum y la discográfica que posea la canción con más
reproducciones.
11. Listar todos los usuarios que no hayan generado una playlist
12. Listar todas las canciones hayan o no recibido likes (cuántos) y
aclarar si han sido reproducidas o no. Listar las 15 primeras ordenadas
como si fueran un Ranking
13. Generar un reporte con el nombre del artista y el nombre de la canción
que no pertenecen a ninguna lista.
14. Listar todas las canciones, el nombre del artista, la razón social de la discográfica y la cantidad de veces que fue reproducida.
15. Listar todas las discográficas, que pertenezcan a Inglaterra y la
cantidad de álbumes que hayan editado.
16. Listar a todos los artistas que no poseen ningún álbum.
17. Listar todos los álbumes que tengan alguna canción que posea más de
un género
18. Generar un reporte por usuario , listando las suscripciones que tiene o tuvo, el importe que abonó y los datos de las formas de pago con que
lo realizó.


**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">