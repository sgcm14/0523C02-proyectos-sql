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

**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">