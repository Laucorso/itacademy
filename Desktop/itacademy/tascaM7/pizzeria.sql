-- MySQL Workbench Synchronization
-- Generated: 2021-10-06 17:03
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: L

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `pizzeria`.`Clients` 
DROP FOREIGN KEY `fk_Clients_Comanda1`,
DROP FOREIGN KEY `fk_Clients_Localitat1`,
DROP FOREIGN KEY `fk_Clients_Provincia1`;

ALTER TABLE `pizzeria`.`Provincia` 
DROP FOREIGN KEY `fk_Provincia_Localitat`;

ALTER TABLE `pizzeria`.`Botiga` 
DROP FOREIGN KEY `fk_Botiga_Comanda1`,
DROP FOREIGN KEY `fk_Botiga_Empleats1`;

ALTER TABLE `pizzeria`.`Clients` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `pizzeria`.`Localitat` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `pizzeria`.`Provincia` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `pizzeria`.`Botiga` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `Codi` `Codi` TINYINT(5) NOT NULL ;

ALTER TABLE `pizzeria`.`Empleats` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `Telf` `Telf` TINYINT(9) NOT NULL ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`Pizzes` (
  `idPizzes` INT(11) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripció` TEXT(100) NOT NULL,
  `Imatge` VARCHAR(45) NOT NULL,
  `Preu` DECIMAL(2,2) NOT NULL,
  PRIMARY KEY (`idPizzes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`Begudes` (
  `idBegudes` INT(11) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripció` TEXT(100) NOT NULL,
  `Imatge` VARCHAR(45) NOT NULL,
  `Preu` DECIMAL(2,2) NOT NULL,
  PRIMARY KEY (`idBegudes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`Hamburgueses` (
  `idHamburgueses` INT(11) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripció` TEXT(100) NOT NULL,
  `Imatge` VARCHAR(45) NOT NULL,
  `Preu` DECIMAL(2,2) NOT NULL,
  PRIMARY KEY (`idHamburgueses`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `pizzeria`.`Clients` 
ADD CONSTRAINT `fk_Clients_Comanda1`
  FOREIGN KEY (`Comanda_idComanda`)
  REFERENCES `pizzeria`.`Comanda` (`idComanda`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Clients_Localitat1`
  FOREIGN KEY (`Localitat_idLocalitat`)
  REFERENCES `pizzeria`.`Localitat` (`idLocalitat`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Clients_Provincia1`
  FOREIGN KEY (`Provincia_idProvincia`)
  REFERENCES `pizzeria`.`Provincia` (`idProvincia`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `pizzeria`.`Provincia` 
ADD CONSTRAINT `fk_Provincia_Localitat`
  FOREIGN KEY (`Localitat_idLocalitat`)
  REFERENCES `pizzeria`.`Localitat` (`idLocalitat`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `pizzeria`.`Botiga` 
ADD CONSTRAINT `fk_Botiga_Comanda1`
  FOREIGN KEY (`Comanda_idComanda`)
  REFERENCES `pizzeria`.`Comanda` (`idComanda`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Botiga_Empleats1`
  FOREIGN KEY (`Empleats_idEmpleats`)
  REFERENCES `pizzeria`.`Empleats` (`idEmpleats`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
