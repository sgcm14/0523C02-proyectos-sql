USE twitter_db;

/*Insertando datos a usuarios*/
INSERT INTO users(user_handle, email_address, first_name, last_name, phonenumber)
VALUES
('martaB15','marthaB15@gmail.com','Marta','Garcia','666666678'),
('itziar','itzi@msn.com','Itzi','Ar','666444433'),
('pheralb','pheralb@gmail.com','Pablo','Hdz','700085458'),
('astrak3','astraluegobaby@msn.com','Ivan','Jesus','123459851');

/**consultas*/
SELECT follower_id, following_id FROM followers;
SELECT follower_id FROM followers WHERE following_id= 1;
SELECT COUNT(follower_id) AS followers FROM followers WHERE following_id = 1;

/*Top 3 usuarios con mayor número de seguidores*/
SELECT following_id, COUNT(follower_id) AS followers
FROM followers
GROUP BY following_id
ORDER BY followers desc
LIMIT 3;

/*Top 3 usuarios pero haciendo JOIN*/
SELECT users.user_id, users.user_handle, users.first_name, following_id, COUNT(follower_id) AS followers
FROM followers
INNER JOIN users ON users.user_id = followers.following_id
GROUP BY following_id
ORDER BY followers desc
LIMIT 3;

/*Insertando datos a tweets*/
INSERT INTO tweets(user_id, tweet_text)
VALUES
(1, "Hola!, ¿Qué tal?"),
(2, "Entrando en Twitter. ¡Qué genial!"),
(3, "HTML es un lenguaje de programación"),
(4, "Sígueme en......."),
(1, "Me encanta la música");

SELECT * FROM tweets;

/*Cuántos tweets ha hecho un usuario*/
SELECT user_id, COUNT(tweet_id) 
FROM tweets
GROUP BY user_id;

/*Obtener los tweets de los usuarios que tienen más de 2 seguidores*/
SELECT tweet_id, tweet_text, user_id
FROM tweets
WHERE user_id IN (
	SELECT following_id
    FROM followers
    GROUP BY following_id
    HAVING COUNT(*)>2
);

/*Eliminando tweets*/
DELETE FROM tweets WHERE tweet_id = 1;
DELETE FROM tweets WHERE user_id = 1;

DELETE FROM tweets WHERE tweet_text LIKE "%Elon Musk%";

/*actualizar*/
UPDATE tweets SET num_comments = num_comments + 1 WHERE tweet_id = 2;

/**Reemplazar texto*/
UPDATE tweets SET tweet_text = REPLACE(tweet_text, "...", "twitter")
WHERE tweet_text LIKE "%...%";

INSERT INTO tweet_likes (user_id, tweet_id)
VALUES
(2,3),(2,4),(4,2),(2,2),(3,2);

SELECT * FROM tweet_likes;

/*Obtener el número de likes para cada tweet*/
SELECT tweet_id, COUNT(*) 
FROM tweet_likes
GROUP BY tweet_id;

/*Insertando datos a seguidores*/
INSERT INTO followers(follower_id, following_id)
VALUES
(1,2),
(2,1),
(3,1),
(4,1),
(2,3);

SELECT * FROM users;