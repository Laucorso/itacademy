-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Youtube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Youtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Youtube` DEFAULT CHARACTER SET utf8 ;
USE `Youtube` ;

-- -----------------------------------------------------
-- Table `Youtube`.`Etiqueta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Etiqueta` (
  `idEtiqueta` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEtiqueta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Youtube`.`Comentaris`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Comentaris` (
  `idComentaris` INT NOT NULL AUTO_INCREMENT,
  `Text` TEXT(150) NOT NULL,
  `DataHora` TIME NOT NULL,
  PRIMARY KEY (`idComentaris`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Youtube`.`Videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Videos` (
  `idVideo` INT NOT NULL,
  `Titol` VARCHAR(45) NOT NULL,
  `Descripció` TEXT(150) NOT NULL,
  `Grandària` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Durada` BLOB NOT NULL,
  `Thumbnail` VARCHAR(100) NOT NULL,
  `Reproduccions` VARCHAR(45) NOT NULL,
  `Likes` INT NOT NULL,
  `Dislikes` INT NOT NULL,
  `Estat` ENUM('Public', 'Ocult', 'Privat') NOT NULL,
  `idEtiquetes` INT NOT NULL,
  `idUsuari` INT NOT NULL,
  `DataHora_realització` DATETIME(4) NOT NULL,
  `Etiqueta_idEtiqueta` INT NOT NULL,
  `Comentaris_idComentaris` INT NOT NULL,
  PRIMARY KEY (`idVideo`, `Etiqueta_idEtiqueta`, `Comentaris_idComentaris`),
  INDEX `fk_Videos_Etiqueta1_idx` (`Etiqueta_idEtiqueta` ASC) VISIBLE,
  INDEX `fk_Videos_Comentaris1_idx` (`Comentaris_idComentaris` ASC) VISIBLE,
  CONSTRAINT `fk_Videos_Etiqueta1`
    FOREIGN KEY (`Etiqueta_idEtiqueta`)
    REFERENCES `Youtube`.`Etiqueta` (`idEtiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Videos_Comentaris1`
    FOREIGN KEY (`Comentaris_idComentaris`)
    REFERENCES `Youtube`.`Comentaris` (`idComentaris`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Youtube`.`Playlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Playlists` (
  `idPlaylists` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `DataCreació` VARCHAR(45) NOT NULL,
  `Estat` ENUM('Public', 'Privat') NOT NULL,
  PRIMARY KEY (`idPlaylists`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Youtube`.`Usuaris`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Usuaris` (
  `idUsuaris` INT NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `NomUsuari` VARCHAR(45) NOT NULL,
  `DataNaix` DATETIME(6) NOT NULL,
  `Sexe` VARCHAR(45) NOT NULL,
  `Pais` VARCHAR(45) NOT NULL,
  `Codi` TINYINT(5) NOT NULL,
  `Video_idVideo` INT NOT NULL,
  `Playlists_idPlaylists` INT NOT NULL,
  PRIMARY KEY (`idUsuaris`, `Video_idVideo`, `Playlists_idPlaylists`),
  INDEX `fk_Usuaris_Video1_idx` (`Video_idVideo` ASC) VISIBLE,
  INDEX `fk_Usuaris_Playlists1_idx` (`Playlists_idPlaylists` ASC) VISIBLE,
  CONSTRAINT `fk_Usuaris_Video1`
    FOREIGN KEY (`Video_idVideo`)
    REFERENCES `Youtube`.`Videos` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuaris_Playlists1`
    FOREIGN KEY (`Playlists_idPlaylists`)
    REFERENCES `Youtube`.`Playlists` (`idPlaylists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Youtube`.`Canals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Canals` (
  `idCanal` INT NOT NULL AUTO_INCREMENT,
  `idUsuari` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripció` VARCHAR(45) NOT NULL,
  `DataCreació` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCanal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Youtube`.`Reaccions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Reaccions` (
  `idUsuari` INT NOT NULL,
  `idVideo` INT NOT NULL,
  `Tipus_Reacció` ENUM('Like', 'Dislike') NOT NULL,
  `Data_Hora` DATETIME(6) NOT NULL,
  `DataNaix` INT NOT NULL AUTO_INCREMENT,
  INDEX `idUsuari_idx` (`idUsuari` ASC) VISIBLE,
  INDEX `idVideo_idx` (`idVideo` ASC) VISIBLE,
  INDEX `idComentaris_idx` (`DataNaix` ASC) VISIBLE,
  CONSTRAINT `idUsuari`
    FOREIGN KEY (`idUsuari`)
    REFERENCES `Youtube`.`Usuaris` (`idUsuaris`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idVideo`
    FOREIGN KEY (`idVideo`)
    REFERENCES `Youtube`.`Videos` (`idVideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idComentaris`
    FOREIGN KEY (`DataNaix`)
    REFERENCES `Youtube`.`Comentaris` (`idComentaris`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Youtube`.`Subscripcions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Youtube`.`Subscripcions` (
  `Usuaris_idUsuaris` INT NOT NULL,
  `Canals_idCanal` INT NOT NULL,
  PRIMARY KEY (`Usuaris_idUsuaris`, `Canals_idCanal`),
  INDEX `fk_Usuaris_has_Canals_Canals1_idx` (`Canals_idCanal` ASC) VISIBLE,
  INDEX `fk_Usuaris_has_Canals_Usuaris1_idx` (`Usuaris_idUsuaris` ASC) VISIBLE,
  CONSTRAINT `fk_Usuaris_has_Canals_Usuaris1`
    FOREIGN KEY (`Usuaris_idUsuaris`)
    REFERENCES `Youtube`.`Usuaris` (`idUsuaris`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuaris_has_Canals_Canals1`
    FOREIGN KEY (`Canals_idCanal`)
    REFERENCES `Youtube`.`Canals` (`idCanal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
