# Proyecto Playground

**Objetivo:**

Ya aprendimos a detectar entidades. Luego aprendimos a detallar los atributos, los tipos de datos e imaginarnos qué datos se guardarán en cada columna.

En este desafío te proponemos armar el diagrama de entidad relación del caso “Playground” que vimos en la definición de entidades y tipos de datos.

    Los usuarios:
    ------------

    Los usuarios tendrán:Nombre, apellido, email, contraseña y categoría.

    ● Podrán tener categoría de estudiantes, docentes, editores o administradores.

    ● Un usuario está asociado a una carrera que tiene un nombre, una fecha de inicio y una fecha de finalización.

    ● Una carrera tiene materias.


    Las materias:
    ------------

    Las materias que tendrán: Un título, una descripción, una imagen, una fecha de inicio, una fecha de finalización y un cupo máximo.

    ● Módulos (unidades temáticas para organizar el contenido) que tendrán un título, una descripción y una fecha de inicio.

    Los contenidos:

    Adicionalmente a los usuarios y materias, le gustaría almacenar información relativa al contenido a publicar.
    Es por esto que decidió organizar las unidades en distintas clases que también tendrán un título, una descripción, una fecha de inicio, y una marca de visibilidad (si el bloque está visible o no).

    Las clases pueden ser “virtuales” o “en vivo”.
    Todas las clases contendrán bloques. 
    Los bloques tendrán un título y una marca de visibilidad. Los bloques podrán ser de diferente tipo: texto, vídeo, presentación, PDF o archivo.

-----------------------------

**¡Empecemos!**

Tomando como base el ejercicio de DER Playground realizado, vamos a 
realizar el paso a paso para crear una parte de la base de datos:
    
    CREATE SCHEMA `playground` ;

    CREATE TABLE `playground`.`categorias` (
    `idcategoria` INT NOT NULL,
    `nombre` VARCHAR(100) NULL,
    PRIMARY KEY (`idcategoria`));

    CREATE TABLE `playground`.`usuarios` (
    `idusuario` INT NOT NULL,
    `nombre` VARCHAR(100) NULL,
    `apellido` VARCHAR(100) NULL,
    `email` VARCHAR(50) NULL,
    `categoria` INT NULL,
    PRIMARY KEY (`idusuario`),
    INDEX `FKcategoria_idx` (`categoria` ASC) VISIBLE,
    CONSTRAINT `FKcategoria`
    FOREIGN KEY (`categoria`)
    REFERENCES `playground`.`categorias` (`idcategoria`)
    );

    CREATE TABLE `playground`.`carrera` (
    `idcarrera` INT NOT NULL,
    `titulo` VARCHAR(45) NULL,
    `descripcion` VARCHAR(100) NULL,
    PRIMARY KEY (`idcarrera`));

    CREATE TABLE `playground`.`usuarios_carrera` (
    `id` INT NOT NULL,
    `usuario` INT NULL,
    `carrera` INT NULL,
    `fechainscripcion` DATE NULL,
    PRIMARY KEY (`id`),
    INDEX `usuario_idx` (`usuario` ASC) VISIBLE, SQL
    INDEX `carrera_idx` (`carrera` ASC) VISIBLE,
    CONSTRAINT `usuario`
    FOREIGN KEY (`usuario`)
    REFERENCES `playground`.`usuarios` (`idusuario`),
    CONSTRAINT `carrera`
    FOREIGN KEY (`carrera`)
    REFERENCES `playground`.`carrera` (`idcarrera`));

----------------------

**Validar el modelo creado:**

 Continuamos con las tablas de **carrera** y de **Usuarios_Carrera**
con las claves foráneas a las tablas de usuarios y carrera.

Luego, podemos realizar ingeniería inversa para controlar 
que el modelo relacional es el correcto.

El Diagrama entidad relación es como se muestra a continuación:

![](https://raw.githubusercontent.com/sgcm14/proyectos-sql/main/playground/playground.png)

-----------------------
**Insertar datos:**

Vamos a insertar datos en las tablas:

● Categorías: “Alumno”, “Docente”, “Editor” y “Administrador”.

● Usuario: “Juan Perez, jperez@gmail.com, categoria: alumno”.

● Carrera: “Certified Tech Developer, Carrera de programación y 
desarrollo de productos digitales”.

● Juan se inscribió el 1/3/2021 a CTD.

    INSERT INTO `playground`.`categorias`
    (`idcategoria`, `nombre`)
    VALUES
    (1, "Alumno"),
    (2, "Docente"),
    (3, "Editor"),
    (4, "Administrador");

Desde la parte de administración nos avisan que no existe más la categoría “Editor”. ¿Qué tenemos que hacer?

    DELETE FROM `playground`.`categorias`
    WHERE nombre = "Editor";

Ahora, ¿Qué sucede si intentamos eliminar la categoría “Alumno”?

    DELETE FROM `playground`.`categorias`
    WHERE nombre = "Alumno";

**Realizado por :** Sammy Gigi Cantoral Montejo (sgcm14)

<img src ="https://raw.githubusercontent.com/sgcm14/sgcm14/main/sammy.jpg" width="200">