-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema seniorproject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema seniorproject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `seniorproject` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `seniorproject` ;

-- -----------------------------------------------------
-- Table `seniorproject`.`conversation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seniorproject`.`conversation` (
  `conversation_id` INT NOT NULL,
  `conversation_Created_time` DATETIME NOT NULL,
  `user_1_id` INT NOT NULL,
  `user_2_id` INT NOT NULL,
  PRIMARY KEY (`conversation_id`),
  UNIQUE INDEX `conversation_id_UNIQUE` (`conversation_id` ASC) VISIBLE,
  UNIQUE INDEX `conversationcol_UNIQUE` (`user_2_id` ASC) VISIBLE,
  UNIQUE INDEX `user_1_id_UNIQUE` (`user_1_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `seniorproject`.`friendship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seniorproject`.`friendship` (
  `friend_id` INT NOT NULL,
  `user_1_id` INT NOT NULL,
  `user_2_id` INT NOT NULL,
  PRIMARY KEY (`friend_id`),
  UNIQUE INDEX `user_1_id_UNIQUE` (`user_1_id` ASC) VISIBLE,
  UNIQUE INDEX `user_2_id_UNIQUE` (`user_2_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `seniorproject`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seniorproject`.`message` (
  `message_id` INT NOT NULL,
  `message_body` BLOB NOT NULL,
  `sender_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `converstation_id` INT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE INDEX `message_id_UNIQUE` (`message_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `seniorproject`.`profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seniorproject`.`profile` (
  `profile_id` INT NOT NULL,
  `bio` VARCHAR(320) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `profile_picture` BLOB NOT NULL,
  PRIMARY KEY (`profile_id`),
  UNIQUE INDEX `profile_id_UNIQUE` (`profile_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `seniorproject`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seniorproject`.`user` (
  `user_id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
