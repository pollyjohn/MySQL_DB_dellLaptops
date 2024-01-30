-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dellLaptops
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dellLaptops
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dellLaptops1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `dellLaptops1` ;

-- -----------------------------------------------------
-- Table `dellLaptops`.`Color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dellLaptops1`.`Color` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `color_UNIQUE` (`color` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dellLaptops`.`Resolution`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dellLaptops1`.`Resolution` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `resolution` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `resolution_UNIQUE` (`resolution` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dellLaptops`.`graphic_cards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dellLaptops1`.`graphic_cards` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `graphic_card_model` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `graphic_card_model_UNIQUE` (`graphic_card_model` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dellLaptops`.`memory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dellLaptops1`.`memory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `memory_size` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `dellLaptops`.`processor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dellLaptops1`.`processor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `processor_gen_platform` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `processor_UNIQUE` (`processor_gen_platform` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dellLaptops`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dellLaptops1`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `product_name_UNIQUE` (`product_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `dellLaptops`.`product_has_color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dellLaptops1`.`product_has_color` (
  `products_id` INT NOT NULL,
  `Color_id` INT NOT NULL,
  PRIMARY KEY (`products_id`, `Color_id`),
  -- INDEX `fk_product_has_Color1_idx` (`Color_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_Color1`
    FOREIGN KEY (`Color_id`)
    REFERENCES `dellLaptops1`.`Color` (`id`),
  CONSTRAINT `fk_product_has_products`
    FOREIGN KEY (`products_id`)
    REFERENCES `dellLaptops1`.`products` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dellLaptops`.`product_has_graphic_card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dellLaptops1`.`product_has_graphic_card` (
  `products_id` INT NOT NULL,
  `graphic_card_id` INT NOT NULL,
  UNIQUE INDEX `unique_products_graphic_card` (`products_id` ASC, `graphic_card_id` ASC) VISIBLE,
  INDEX `fk_product_has_graphic_card_graphic_cards` (`graphic_card_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_graphic_card_graphic_cards`
    FOREIGN KEY (`graphic_card_id`)
    REFERENCES `dellLaptops1`.`graphic_cards` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_has_graphic_card_products`
    FOREIGN KEY (`products_id`)
    REFERENCES `dellLaptops1`.`products` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dellLaptops`.`product_has_memory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dellLaptops1`.`product_has_memory` (
  `products_id` INT NOT NULL,
  `memory_id` INT NOT NULL,
  PRIMARY KEY (`products_id`, `memory_id`),
  INDEX `fk_product_has_memory_memory1_idx` (`memory_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_memory_memory1`
    FOREIGN KEY (`memory_id`)
    REFERENCES `dellLaptops1`.`memory` (`id`),
  CONSTRAINT `fk_product_has_memory_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `dellLaptops1`.`products` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dellLaptops`.`product_has_processor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dellLaptops1`.`product_has_processor` (
  `processor_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  PRIMARY KEY (`processor_id`, `products_id`),
  INDEX `fk_product_has_processor_products1_idx` (`products_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_processor_processor1`
    FOREIGN KEY (`processor_id`)
    REFERENCES `dellLaptops1`.`processor` (`id`),
  CONSTRAINT `fk_product_has_processor_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `dellLaptops1`.`products` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dellLaptops`.`product_has_resolution`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dellLaptops1`.`product_has_resolution` (
  `Resolution_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  PRIMARY KEY (`Resolution_id`, `products_id`),
  INDEX `fk_product_has_resolution_products1_idx` (`products_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_resolution_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `dellLaptops1`.`products` (`id`),
  CONSTRAINT `fk_product_has_resolution_Resolution1`
    FOREIGN KEY (`Resolution_id`)
    REFERENCES `dellLaptops1`.`Resolution` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dellLaptops`.`screen_size`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dellLaptops1`.`screen_size` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `size` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `size_UNIQUE` (`size` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dellLaptops`.`product_has_screen_size`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dellLaptops1`.`product_has_screen_size` (
  `product_id` INT NOT NULL,
  `screen_size_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `screen_size_id`),
  INDEX `fk_product_screen_size_screen_size` (`screen_size_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_screen_size_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `dellLaptops1`.`products` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_screen_size_screen_size`
    FOREIGN KEY (`screen_size_id`)
    REFERENCES `dellLaptops1`.`screen_size` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dellLaptops`.`storage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dellLaptops1`.`storage` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `storage_size` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `storage_size_UNIQUE` (`storage_size` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dellLaptops`.`product_has_storage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dellLaptops1`.`product_has_storage` (
  `products_id` INT NOT NULL,
  `storage_id` INT NOT NULL,
  PRIMARY KEY (`products_id`, `storage_id`),
  INDEX `fk_product_has_storage_storage1_idx` (`storage_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_has_storage_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `dellLaptops1`.`products` (`id`),
  CONSTRAINT `fk_product_has_storage_storage1`
    FOREIGN KEY (`storage_id`)
    REFERENCES `dellLaptops1`.`storage` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `dellLaptops`.`Orders`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `dellLaptops1`.`Orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(75) NOT NULL,
  `graphic_card_model` INT NOT NULL,
  `processor_gen_platform` INT NOT NULL,
  `memory_size` INT NOT NULL,
  `storage_size` INT NOT NULL,
  `screen_size` INT NOT NULL,
  `resolution` INT NOT NULL,
  `color` INT NOT NULL,
  PRIMARY KEY (`id`),
  -- Foreign Keys
  CONSTRAINT `fk_orders_product_has_graphic_card` FOREIGN KEY (`graphic_card_model`) REFERENCES `dellLaptops1`.`product_has_graphic_card` (`graphic_card_id`),
  CONSTRAINT `fk_orders_product_has_processor` FOREIGN KEY (`processor_gen_platform`) REFERENCES `dellLaptops1`.`product_has_processor` (`processor_id`),
  CONSTRAINT `fk_orders_product_has_memory` FOREIGN KEY (`memory_size`) REFERENCES `dellLaptops1`.`product_has_memory` (`memory_id`),
  CONSTRAINT `fk_orders_product_has_storage` FOREIGN KEY (`storage_size`) REFERENCES `dellLaptops1`.`product_has_storage` (`storage_id`),
  CONSTRAINT `fk_orders_product_has_screen_size` FOREIGN KEY (`screen_size`) REFERENCES `dellLaptops1`.`product_has_screen_size` (`screen_size_id`),
  CONSTRAINT `fk_orders_product_has_resolution` FOREIGN KEY (`resolution`) REFERENCES `dellLaptops1`.`product_has_resolution` (`Resolution_id`),
  CONSTRAINT `fk_orders_product_has_color` FOREIGN KEY (`color`) REFERENCES `dellLaptops1`.`product_has_color` (`Color_id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
