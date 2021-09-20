-- MySQL Workbench Synchronization
-- Generated: 2021-09-20 17:12
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: L

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Pizzeria2` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `Pizzeria2`.`Clients` (
  `idClients` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(100) NOT NULL,
  `Codi_postal` TINYINT(5) NOT NULL,
  `Localitat` INT(11) NOT NULL,
  `Provincia` INT(11) NOT NULL,
  `Telefon` TINYINT(9) NOT NULL,
  PRIMARY KEY (`idClients`),
  INDEX `Localitat_idx` (`Localitat` ASC) VISIBLE,
  INDEX `Provincia_idx` (`Provincia` ASC) VISIBLE,
  CONSTRAINT `Localitat`
    FOREIGN KEY (`Localitat`)
    REFERENCES `Pizzeria2`.`Localitat` (`idLocalitat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Provincia`
    FOREIGN KEY (`Provincia`)
    REFERENCES `Pizzeria2`.`Provincia` (`idProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria2`.`Provincia` (
  `idProvincia` INT(11) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `Localitat_idLocalitat` INT(11) NOT NULL,
  PRIMARY KEY (`idProvincia`, `Localitat_idLocalitat`),
  INDEX `fk_Provincia_Localitat1_idx` (`Localitat_idLocalitat` ASC) VISIBLE,
  CONSTRAINT `fk_Provincia_Localitat1`
    FOREIGN KEY (`Localitat_idLocalitat`)
    REFERENCES `Pizzeria2`.`Localitat` (`idLocalitat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria2`.`Localitat` (
  `idLocalitat` INT(11) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `idProvincia` INT(11) NOT NULL,
  PRIMARY KEY (`idLocalitat`),
  INDEX `idProvincia_idx` (`idProvincia` ASC) VISIBLE,
  CONSTRAINT `idProvincia`
    FOREIGN KEY (`idProvincia`)
    REFERENCES `Pizzeria2`.`Provincia` (`idProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria2`.`Comanda` (
  `idComanda` INT(11) NOT NULL,
  `Data_hora` TIMESTAMP NOT NULL,
  `Tipus_Comanda` ENUM('Domicili', 'Recollir') NOT NULL,
  `Quant_Productes` ENUM('Pizzes', 'Hamburgueses', 'Begudes') NOT NULL,
  `Preu` DECIMAL(4,2) NOT NULL,
  `idClient` INT(11) NOT NULL,
  `Pizzes_idPizzes` INT(11) NOT NULL,
  `Burgers_idBurgers` INT(11) NOT NULL,
  `Begudes_idBegudes` INT(11) NOT NULL,
  `idBotiga` INT(11) NOT NULL,
  PRIMARY KEY (`idComanda`, `Pizzes_idPizzes`, `Burgers_idBurgers`, `Begudes_idBegudes`),
  INDEX `idClient_idx` (`idClient` ASC) VISIBLE,
  INDEX `fk_Comanda_Pizzes1_idx` (`Pizzes_idPizzes` ASC) VISIBLE,
  INDEX `fk_Comanda_Burgers1_idx` (`Burgers_idBurgers` ASC) VISIBLE,
  INDEX `fk_Comanda_Begudes1_idx` (`Begudes_idBegudes` ASC) VISIBLE,
  INDEX `idBotiga_idx` (`idBotiga` ASC) VISIBLE,
  CONSTRAINT `idClient`
    FOREIGN KEY (`idClient`)
    REFERENCES `Pizzeria2`.`Clients` (`idClients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comanda_Pizzes1`
    FOREIGN KEY (`Pizzes_idPizzes`)
    REFERENCES `Pizzeria2`.`Pizzes` (`idPizzes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comanda_Burgers1`
    FOREIGN KEY (`Burgers_idBurgers`)
    REFERENCES `Pizzeria2`.`Burgers` (`idBurgers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comanda_Begudes1`
    FOREIGN KEY (`Begudes_idBegudes`)
    REFERENCES `Pizzeria2`.`Begudes` (`idBegudes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idBotiga`
    FOREIGN KEY (`idBotiga`)
    REFERENCES `Pizzeria2`.`Botiga` (`idBotiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria2`.`Pizzes` (
  `idPizzes` INT(11) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripció` TEXT(100) NOT NULL,
  `Imatge` VARCHAR(45) NOT NULL,
  `Preu` DECIMAL(2,2) NOT NULL,
  `IdCat` INT(11) NOT NULL,
  PRIMARY KEY (`idPizzes`),
  INDEX `IdCat_idx` (`IdCat` ASC) VISIBLE,
  CONSTRAINT `IdCat`
    FOREIGN KEY (`IdCat`)
    REFERENCES `Pizzeria2`.`Categories_Pizzes` (`idCategories_Pizzes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria2`.`Burgers` (
  `idBurgers` INT(11) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripcio` TEXT(100) NOT NULL,
  `Imatge` VARCHAR(45) NOT NULL,
  `Preu` DECIMAL(2,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idBurgers`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria2`.`Begudes` (
  `idBegudes` INT(11) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripcio` TEXT(100) NOT NULL,
  `Imatge` VARCHAR(45) NOT NULL,
  `Preu` DECIMAL(2,2) NOT NULL,
  PRIMARY KEY (`idBegudes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria2`.`Botiga` (
  `idBotiga` INT(11) NOT NULL,
  `idComanda` INT(11) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `idLocalitat` INT(11) NOT NULL,
  `idProvincia` INT(11) NOT NULL,
  `idEmpleats` INT(11) NOT NULL,
  PRIMARY KEY (`idBotiga`),
  INDEX `idComanda_idx` (`idComanda` ASC) VISIBLE,
  INDEX `idLocalitat_idx` (`idLocalitat` ASC) VISIBLE,
  INDEX `idProvincia_idx` (`idProvincia` ASC) VISIBLE,
  INDEX `idEmpleats_idx` (`idEmpleats` ASC) VISIBLE,
  CONSTRAINT `idComanda`
    FOREIGN KEY (`idComanda`)
    REFERENCES `Pizzeria2`.`Comanda` (`idComanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idLocalitat`
    FOREIGN KEY (`idLocalitat`)
    REFERENCES `Pizzeria2`.`Localitat` (`idLocalitat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idProvincia`
    FOREIGN KEY (`idProvincia`)
    REFERENCES `Pizzeria2`.`Provincia` (`idProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEmpleats`
    FOREIGN KEY (`idEmpleats`)
    REFERENCES `Pizzeria2`.`Empleats` (`idEmpleats`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria2`.`Empleats` (
  `idEmpleats` INT(11) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(9) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  `idBotiga` INT(11) NOT NULL,
  `Tipus_Treballador` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpleats`),
  INDEX `idBotiga_idx` (`idBotiga` ASC) VISIBLE,
  CONSTRAINT `idBotiga`
    FOREIGN KEY (`idBotiga`)
    REFERENCES `Pizzeria2`.`Botiga` (`idBotiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria2`.`A domicili` (
  `idEmpleat` INT(11) NOT NULL,
  `idComanda` INT(11) NOT NULL,
  `Hora_Lliurament` TIMESTAMP NOT NULL,
  PRIMARY KEY (`idEmpleat`),
  INDEX `idComanda_idx` (`idComanda` ASC) VISIBLE,
  CONSTRAINT `idComanda`
    FOREIGN KEY (`idComanda`)
    REFERENCES `Pizzeria2`.`Comanda` (`idComanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idEmpleat`
    FOREIGN KEY (`idEmpleat`)
    REFERENCES `Pizzeria2`.`Empleats` (`idEmpleats`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Pizzeria2`.`Categories_Pizzes` (
  `idCategories_Pizzes` INT(11) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `idPizzes` INT(11) NOT NULL,
  PRIMARY KEY (`idCategories_Pizzes`),
  INDEX `idPizzes_idx` (`idPizzes` ASC) VISIBLE,
  CONSTRAINT `idPizzes`
    FOREIGN KEY (`idPizzes`)
    REFERENCES `Pizzeria2`.`Pizzes` (`idPizzes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
