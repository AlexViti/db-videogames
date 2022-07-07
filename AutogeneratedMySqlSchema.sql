CREATE TABLE `videogame`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `plot` TEXT NULL,
    `release_date` DATE NOT NULL,
    `pegi` TINYINT UNSIGNED NOT NULL
);
CREATE TABLE `platform`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `genre`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `content_descriptor`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);
CREATE TABLE `tournament`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `year` YEAR NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `videogame_id (fk)` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `player`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `surname` VARCHAR(255) NOT NULL,
    `nickname` VARCHAR(255) NOT NULL,
    `city` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `player` ADD UNIQUE `player_nickname_unique`(`nickname`);
CREATE TABLE `review`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `review` TEXT NOT NULL,
    `rating` ENUM('') NOT NULL,
    `videogame_id (fk)` BIGINT UNSIGNED NOT NULL,
    `player_id (fk)` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `award`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `year` YEAR NOT NULL,
    `category` ENUM('') NOT NULL,
    `videogame_id (fk)` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `platform_videogame`(
    `platform_id (fk)` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `videogame_id (fk)` BIGINT NOT NULL
);
CREATE TABLE `genre_videogame`(
    `genre_id (fk)` INT UNSIGNED NOT NULL,
    `videogame_id (fk)` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `content_descriptor_videogame`(
    `content_descriptor_id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `videogame_id` BIGINT NOT NULL
);
CREATE TABLE `player_tournament`(
    `player_id (fk)` BIGINT UNSIGNED NOT NULL,
    `tournament_id (fk)` INT UNSIGNED NOT NULL
);
ALTER TABLE
    `platform_videogame` ADD CONSTRAINT `platform_videogame_platform_id (fk)_foreign` FOREIGN KEY(`platform_id (fk)`) REFERENCES `platform`(`id`);
ALTER TABLE
    `platform_videogame` ADD CONSTRAINT `platform_videogame_videogame_id (fk)_foreign` FOREIGN KEY(`videogame_id (fk)`) REFERENCES `videogame`(`id`);
ALTER TABLE
    `content_descriptor_videogame` ADD CONSTRAINT `content_descriptor_videogame_videogame_id_foreign` FOREIGN KEY(`videogame_id`) REFERENCES `videogame`(`id`);
ALTER TABLE
    `player_tournament` ADD CONSTRAINT `player_tournament_tournament_id (fk)_foreign` FOREIGN KEY(`tournament_id (fk)`) REFERENCES `tournament`(`id`);
ALTER TABLE
    `tournament` ADD CONSTRAINT `tournament_videogame_id (fk)_foreign` FOREIGN KEY(`videogame_id (fk)`) REFERENCES `videogame`(`id`);
ALTER TABLE
    `review` ADD CONSTRAINT `review_player_id (fk)_foreign` FOREIGN KEY(`player_id (fk)`) REFERENCES `player`(`id`);
ALTER TABLE
    `player_tournament` ADD CONSTRAINT `player_tournament_player_id (fk)_foreign` FOREIGN KEY(`player_id (fk)`) REFERENCES `player`(`id`);
ALTER TABLE
    `content_descriptor_videogame` ADD CONSTRAINT `content_descriptor_videogame_content_descriptor_id_foreign` FOREIGN KEY(`content_descriptor_id`) REFERENCES `content_descriptor`(`id`);
ALTER TABLE
    `award` ADD CONSTRAINT `award_videogame_id (fk)_foreign` FOREIGN KEY(`videogame_id (fk)`) REFERENCES `videogame`(`id`);
ALTER TABLE
    `review` ADD CONSTRAINT `review_videogame_id (fk)_foreign` FOREIGN KEY(`videogame_id (fk)`) REFERENCES `videogame`(`id`);
ALTER TABLE
    `genre_videogame` ADD CONSTRAINT `genre_videogame_genre_id (fk)_foreign` FOREIGN KEY(`genre_id (fk)`) REFERENCES `genre`(`id`);
ALTER TABLE
    `genre_videogame` ADD CONSTRAINT `genre_videogame_videogame_id (fk)_foreign` FOREIGN KEY(`videogame_id (fk)`) REFERENCES `videogame`(`id`);