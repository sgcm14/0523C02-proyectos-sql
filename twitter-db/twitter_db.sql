show databases;

DROP DATABASE IF EXISTS twitter_db;

CREATE DATABASE twitter_db;

USE twitter_db;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
user_id INT NOT NULL AUTO_INCREMENT,
user_handle VARCHAR(50) NOT NULL UNIQUE,
email_address VARCHAR(50) NOT NULL UNIQUE,
first_name VARCHAR(100) NOT NULL,
last_name 	VARCHAR(100) NOT NULL,
phonenumber CHAR(10) UNIQUE,
created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
PRIMARY KEY(user_id)
);

INSERT INTO users(user_handle, email_address, first_name, last_name, phonenumber)
VALUES
('martaB15','marthaB15@gmail.com','Marta','Garcia','666666678'),
('itziar','itzi@msn.com','Itzi','Ar','666444433'),
('pheralb','pheralb@gmail.com','Pablo','Hdz','700085458'),
('astrak3','astraluegobaby@msn.com','Ivan','Jesus','123459851');

DROP TABLE IF EXISTS  followers;

CREATE TABLE followers (
	follower_id INT NOT NULL,
    following_id INT NOT NULL,
    FOREIGN KEY(follower_id) REFERENCES users(user_id),
    FOREIGN KEY(following_id) REFERENCES users(user_id),
    PRIMARY KEY(follower_id, following_id)
);




