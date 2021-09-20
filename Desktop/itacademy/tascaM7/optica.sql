-- MySQL Workbench Synchronization
-- Generated: 2021-09-15 17:40
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: L

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Optica` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `Optica`.`Proveïdors` (
  `Nom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Telefon` TINYINT(15) NOT NULL,
  `Fax` TINYINT(10) NULL DEFAULT NULL,
  `NIF` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`Nom`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`Ulleres` (
  `Marca` VARCHAR(45) NOT NULL,
  `Graduacio_Vidres` DECIMAL NOT NULL,
  `Muntura_tipus` TINYTEXT NOT NULL,
  `Muntura_color` TINYTEXT NOT NULL,
  `Vidre_color` TINYTEXT NOT NULL,
  `Preu` DECIMAL NOT NULL,
  PRIMARY KEY (`Marca`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`Client` (
  `Nom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Telèfon` TINYINT(10) NOT NULL,
  `Correu` VARCHAR(45) NOT NULL,
  `Data_registre` DATETIME NOT NULL,
  `Client_recomenat_per` TEXT(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Nom`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`Empleat` (
  `Nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Nom`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`Proveidor_has_ulleres` (
  `Ulleres_Marca` VARCHAR(45) NOT NULL,
  `Proveïdors_Nom` VARCHAR(45) NOT NULL,
  INDEX `fk_Proveidor_has_ulleres_Ulleres1_idx` (`Ulleres_Marca` ASC) VISIBLE,
  PRIMARY KEY (`Proveïdors_Nom`),
  CONSTRAINT `fk_Proveidor_has_ulleres_Ulleres1`
    FOREIGN KEY (`Ulleres_Marca`)
    REFERENCES `Optica`.`Ulleres` (`Marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proveidor_has_ulleres_Proveïdors1`
    FOREIGN KEY (`Proveïdors_Nom`)
    REFERENCES `Optica`.`Proveïdors` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Optica`.`Detall_Venta` (
  `Client_Nom` VARCHAR(45) NOT NULL,
  `Ulleres_Marca1` VARCHAR(45) NOT NULL,
  `Empleat_Nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Client_Nom`, `Empleat_Nom`),
  INDEX `fk_Client_compra_Ulleres2_idx` (`Ulleres_Marca1` ASC) VISIBLE,
  INDEX `fk_Client_compra_Empleat1_idx` (`Empleat_Nom` ASC) VISIBLE,
  CONSTRAINT `fk_Client_compra_Client1`
    FOREIGN KEY (`Client_Nom`)
    REFERENCES `Optica`.`Client` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_compra_Ulleres2`
    FOREIGN KEY (`Ulleres_Marca1`)
    REFERENCES `Optica`.`Ulleres` (`Marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_compra_Empleat1`
    FOREIGN KEY (`Empleat_Nom`)
    REFERENCES `Optica`.`Empleat` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
