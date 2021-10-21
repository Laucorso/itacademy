-- MySQL Workbench Synchronization
-- Generated: 2021-10-06 17:04
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: L

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `optica`.`Proveïdors` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
DROP COLUMN `Telefon`,
ADD COLUMN `Telf` TINYINT(9) NOT NULL AFTER `Adreça`,
ADD COLUMN `Ulleres_idUlleres` INT(11) NOT NULL AFTER `NIF`,
CHANGE COLUMN `Nom` `Nom` INT(11) NOT NULL ,
CHANGE COLUMN `Fax` `Fax` TINYINT(9) NOT NULL ,
CHANGE COLUMN `NIF` `NIF` TINYINT(10) NOT NULL ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`Nom`, `Ulleres_idUlleres`),
ADD INDEX `fk_Proveïdors_Ulleres1_idx` (`Ulleres_idUlleres` ASC) VISIBLE;
;

ALTER TABLE `optica`.`Ulleres` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
DROP COLUMN `Vidre_color`,
DROP COLUMN `Muntura_color`,
DROP COLUMN `Muntura_tipus`,
DROP COLUMN `Graduacio_Vidres`,
ADD COLUMN `idUlleres` INT(11) NOT NULL AUTO_INCREMENT FIRST,
ADD COLUMN `Graduació_Vidres` VARCHAR(45) NOT NULL AFTER `Marca`,
ADD COLUMN `Tipus_Muntura` ENUM('Flotant', 'Pasta', 'Metàllica') NOT NULL AFTER `Graduació_Vidres`,
ADD COLUMN `Color_Vidre` VARCHAR(45) NOT NULL AFTER `Tipus_Muntura`,
CHANGE COLUMN `Preu` `Preu` VARCHAR(45) NOT NULL ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`idUlleres`);
;

CREATE TABLE IF NOT EXISTS `optica`.`Empleats` (
  `idEmpleats` INT(11) NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpleats`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`Clients` (
  `Nom` INT(11) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Telf` VARCHAR(45) NOT NULL,
  `Correu` VARCHAR(45) NOT NULL,
  `Data_Registre` VARCHAR(45) NOT NULL,
  `Botiga Cul d'ampolla_Nom` INT(11) NOT NULL,
  `Recomanat_Client` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Nom`, `Botiga Cul d'ampolla_Nom`),
  INDEX `fk_Clients_Botiga Cul d'ampolla1_idx` (`Botiga Cul d'ampolla_Nom` ASC) VISIBLE,
  INDEX `fk_Clients_Clients1_idx` (`Recomanat_Client` ASC) VISIBLE,
  CONSTRAINT `fk_Clients_Botiga Cul d'ampolla1`
    FOREIGN KEY (`Botiga Cul d'ampolla_Nom`)
    REFERENCES `optica`.`Botiga Cul d'ampolla` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clients_Clients1`
    FOREIGN KEY (`Recomanat_Client`)
    REFERENCES `optica`.`Clients` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`Botiga Cul d'ampolla` (
  `Nom` INT(11) NOT NULL,
  `Empleats_idEmpleats` INT(11) NOT NULL,
  `Ulleres_idUlleres` INT(11) NOT NULL,
  PRIMARY KEY (`Nom`, `Empleats_idEmpleats`, `Ulleres_idUlleres`),
  INDEX `fk_Botiga_Empleats1_idx` (`Empleats_idEmpleats` ASC) VISIBLE,
  INDEX `fk_Botiga_Ulleres1_idx` (`Ulleres_idUlleres` ASC) VISIBLE,
  CONSTRAINT `fk_Botiga_Empleats1`
    FOREIGN KEY (`Empleats_idEmpleats`)
    REFERENCES `optica`.`Empleats` (`idEmpleats`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Botiga_Ulleres1`
    FOREIGN KEY (`Ulleres_idUlleres`)
    REFERENCES `optica`.`Ulleres` (`idUlleres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`Ventas` (
  `idVenta` INT(11) NOT NULL,
  `idEmpleat` INT(11) NOT NULL,
  `idClients` INT(11) NOT NULL,
  `idUlleres` INT(11) NOT NULL,
  INDEX `idEmpleat_idx` (`idEmpleat` ASC) VISIBLE,
  INDEX `idClients_idx` (`idClients` ASC) VISIBLE,
  INDEX `idUlleres_idx` (`idUlleres` ASC) VISIBLE,
  CONSTRAINT `idEmpleat`
    FOREIGN KEY (`idEmpleat`)
    REFERENCES `optica`.`Empleats` (`idEmpleats`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idClients`
    FOREIGN KEY (`idClients`)
    REFERENCES `optica`.`Clients` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUlleres`
    FOREIGN KEY (`idUlleres`)
    REFERENCES `optica`.`Ulleres` (`idUlleres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `optica`.`proveidor_has_ulleres` ;

DROP TABLE IF EXISTS `optica`.`empleat` ;

DROP TABLE IF EXISTS `optica`.`detall_venta` ;

DROP TABLE IF EXISTS `optica`.`client` ;

ALTER TABLE `optica`.`Proveïdors` 
ADD CONSTRAINT `fk_Proveïdors_Ulleres1`
  FOREIGN KEY (`Ulleres_idUlleres`)
  REFERENCES `optica`.`Ulleres` (`idUlleres`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
