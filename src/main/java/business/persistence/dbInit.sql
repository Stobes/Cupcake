-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cupcake
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cupcake` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `cupcake`;

-- -----------------------------------------------------
-- Table `cupcake`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`users`
(
    `id`       INT         NOT NULL AUTO_INCREMENT,
    `email`    VARCHAR(90) NOT NULL,
    `password` VARCHAR(45) NOT NULL,
    `role`     VARCHAR(20) NOT NULL DEFAULT 'customer',
    `balance`  DECIMAL     NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE
)
    ENGINE = InnoDB
    AUTO_INCREMENT = 4
    DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cupcake`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`order`
(
    `order_id` INT NOT NULL AUTO_INCREMENT,
    `users_id` INT NOT NULL,
    PRIMARY KEY (`order_id`),
    INDEX `fk_order_users1_idx` (`users_id` ASC) VISIBLE,
    CONSTRAINT `fk_order_users1`
        FOREIGN KEY (`users_id`)
            REFERENCES `cupcake`.`users` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake`.`bottom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`bottom`
(
    `bottom_id`          INT         NOT NULL AUTO_INCREMENT,
    `bottom_description` VARCHAR(45) NOT NULL,
    `price`              INT         NOT NULL,
    PRIMARY KEY (`bottom_id`),
    UNIQUE INDEX `bottom_description_UNIQUE` (`bottom_description` ASC) VISIBLE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake`.`topping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`topping`
(
    `topping_id`          INT         NOT NULL AUTO_INCREMENT,
    `topping_discription` VARCHAR(45) NOT NULL,
    `price`               INT         NOT NULL,
    PRIMARY KEY (`topping_id`),
    UNIQUE INDEX `topping_discription_UNIQUE` (`topping_discription` ASC) VISIBLE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcake`.`cupcake`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcake`.`cupcake`
(
    `cupcake_id`         INT NOT NULL AUTO_INCREMENT,
    `bottom_bottom_id`   INT NOT NULL,
    `topping_topping_id` INT NOT NULL,
    `order_order_id`     INT NOT NULL,
    PRIMARY KEY (`cupcake_id`),
    INDEX `fk_cupcake_bottom_idx` (`bottom_bottom_id` ASC) VISIBLE,
    INDEX `fk_cupcake_topping1_idx` (`topping_topping_id` ASC) VISIBLE,
    INDEX `fk_cupcake_order1_idx` (`order_order_id` ASC) VISIBLE,
    CONSTRAINT `fk_cupcake_bottom`
        FOREIGN KEY (`bottom_bottom_id`)
            REFERENCES `cupcake`.`bottom` (`bottom_id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_cupcake_topping1`
        FOREIGN KEY (`topping_topping_id`)
            REFERENCES `cupcake`.`topping` (`topping_id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `fk_cupcake_order1`
        FOREIGN KEY (`order_order_id`)
            REFERENCES `cupcake`.`order` (`order_id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;
SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;

USE `cupcake`;
INSERT INTO `topping`
VALUES (1, 'Chocolate', 5),
       (2, 'Blueberry', 5),
       (3, 'Raspberry', 5),
       (4, 'Crispy', 6),
       (5, 'Strawberry', 6),
       (6, 'Rum/Rasin', 7),
       (7, 'Orange', 8),
       (8, 'Lemon', 8),
       (9, 'Blue Cheese', 9);
USE `cupcake`;
INSERT INTO `bottom`
VALUES (1, 'Chocolate', 5),
       (2, 'Vanilla', 5),
       (3, 'Nutmeg', 5),
       (4, 'Pistacio', 6),
       (5, 'Almond', 7);

