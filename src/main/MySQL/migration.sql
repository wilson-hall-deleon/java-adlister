CREATE DATABASE IF NOT EXISTS adlister_db;
USE adlister_db;

DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email    VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (username, email)
);

CREATE TABLE ads
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id     INT UNSIGNED NOT NULL,
    title       VARCHAR(240) NOT NULL,
    description TEXT         NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `category_name` varchar(45) NOT NULL,
                            PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS ad_category;
CREATE TABLE `ad_category` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `ad_id` int NOT NULL,
                               `category_id` int NOT NULL,
                               PRIMARY KEY (`id`),
                               KEY `ad_id_idx` (`ad_id`),
                               KEY `category_id_idx` (`category_id`),
                               CONSTRAINT `ad_id` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`),
                               CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
)

