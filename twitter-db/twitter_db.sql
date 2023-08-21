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
follower_count INT NOT NULL DEFAULT 0,
created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
PRIMARY KEY(user_id)
);

DROP TABLE IF EXISTS  followers;

CREATE TABLE followers (
	follower_id INT NOT NULL,
    following_id INT NOT NULL,
    FOREIGN KEY(follower_id) REFERENCES users(user_id),
    FOREIGN KEY(following_id) REFERENCES users(user_id),
    PRIMARY KEY(follower_id, following_id)
);

ALTER TABLE followers
ADD CONSTRAINT check_follower_id
CHECK (follower_id <> following_id);

DROP TABLE IF EXISTS  tweets;

CREATE TABLE tweets(
	tweet_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    tweet_text VARCHAR(280) NOT NULL,
    num_likes INT DEFAULT 0,
    num_retweets INT DEFAULT 0,
    num_comments INT DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    PRIMARY KEY (tweet_id)
);

CREATE TABLE tweet_likes(
user_id INT NOT NULL,
tweet_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (tweet_id) REFERENCES tweets(tweet_id),
PRIMARY KEY (user_id, tweet_id)
);

/*triggers*/

DROP TRIGGER IF EXISTS increase_follower_count;

DELIMITER $$

CREATE TRIGGER increase_follower_count
	AFTER INSERT ON followers
    FOR EACH ROW
    BEGIN
		UPDATE users SET follower_count = follower_count +1
        WHERE user_id = NEW.following_id;
	END $$
DELIMITER ;
