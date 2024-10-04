SQL Script generated by MySQL Workbench
-- Thu Oct  3 22:25:12 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ecommerce_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ecommerce_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommerce_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ecommerce_db` ;

-- -----------------------------------------------------
-- Table `ecommerce_db`.`carritodecompras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce_db`.`carritodecompras` ;

CREATE TABLE IF NOT EXISTS `ecommerce_db`.`carritodecompras` (
  `cartId` INT NOT NULL AUTO_INCREMENT,
  `productId` INT NULL DEFAULT NULL,
  `cantidad` INT NULL DEFAULT NULL,
  PRIMARY KEY (`cartId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommerce_db`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce_db`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `ecommerce_db`.`Cliente` (
  `clienteId` INT NOT NULL AUTO_INCREMENT,
  `billingAddress` VARCHAR(255) NULL DEFAULT NULL,
  `shippingAddress` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`clienteId`),
  CONSTRAINT `clienteid`
    FOREIGN KEY ()
    REFERENCES `ecommerce_db`.`carritodecompras` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommerce_db`.`Pedidos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce_db`.`Pedidos` ;

CREATE TABLE IF NOT EXISTS `ecommerce_db`.`Pedidos` (
  `pedidoId` INT NOT NULL AUTO_INCREMENT,
  `clienteId` INT NULL DEFAULT NULL,
  `orderDate` DATE NULL DEFAULT NULL,
  `status` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`pedidoId`),
  INDEX `clienteId` (`clienteId` ASC) VISIBLE,
  CONSTRAINT `pedidos_ibfk_1`
    FOREIGN KEY (`clienteId`)
    REFERENCES `ecommerce_db`.`Cliente` (`clienteId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommerce_db`.`DetallesPedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce_db`.`DetallesPedido` ;

CREATE TABLE IF NOT EXISTS `ecommerce_db`.`DetallesPedido` (
  `detalleId` INT NOT NULL AUTO_INCREMENT,
  `pedidoId` INT NULL DEFAULT NULL,
  `productId` INT NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `price` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`detalleId`),
  INDEX `pedidoId` (`pedidoId` ASC) VISIBLE,
  CONSTRAINT `detallespedido_ibfk_1`
    FOREIGN KEY (`pedidoId`)
    REFERENCES `ecommerce_db`.`Pedidos` (`pedidoId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ecommerce_db`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce_db`.`usuario` ;

CREATE TABLE IF NOT EXISTS `ecommerce_db`.`usuario` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `contrasena` VARCHAR(255) NULL DEFAULT NULL,
  `direccion` VARCHAR(255) NULL DEFAULT NULL,
  `telefono` VARCHAR(255) NULL DEFAULT NULL,
  `` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  CONSTRAINT `id BIGINT`
    FOREIGN KEY ()
    REFERENCES `ecommerce_db`.`Cliente` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
