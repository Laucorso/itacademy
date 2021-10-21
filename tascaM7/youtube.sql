-- MySQL Workbench Synchronization
-- Generated: 2021-10-21 15:39
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: L

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `Youtube` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `Youtube`.`Usuaris` (
  `idUsuaris` INT(11) NOT NULL AUTO_INCREMENT,
  `Email` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `NomUsuari` VARCHAR(45) NOT NULL,
  `DataNaix` DATETIME NOT NULL,
  `Sexe` VARCHAR(45) NOT NULL,
  `Pais` VARCHAR(45) NOT NULL,
  `Codi` TINYINT(5) NOT NULL,
  `Playlists_idPlaylists` INT(11) NOT NULL,
  `Canals_idCanal` INT(11) NOT NULL,
  PRIMARY KEY (`idUsuaris`, `Playlists_idPlaylists`, `Canals_idCanal`),
  INDEX `fk_Usuaris_Playlists1_idx` (`Playlists_idPlaylists` ASC) VISIBLE,
  INDEX `fk_Usuaris_Canals1_idx` (`Canals_idCanal` ASC) VISIBLE,
  CONSTRAINT `fk_Usuaris_Playlists1`
    FOREIGN KEY (`Playlists_idPlaylists`)
    REFERENCES `Youtube`.`Playlists` (`idPlaylists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuaris_Canals1`
    FOREIGN KEY (`Canals_idCanal`)
    REFERENCES `Youtube`.`Canals` (`idCanal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Videos` (
  `idVideo` INT(11) NOT NULL,
  `Titol` VARCHAR(45) NOT NULL,
  `Descripció` TEXT(150) NOT NULL,
  `Grandària` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Durada` BLOB NOT NULL,
  `Thumbnail` VARCHAR(100) NOT NULL,
  `Reproduccions` VARCHAR(45) NOT NULL,
  `Likes` INT(11) NOT NULL,
  `Dislikes` INT(11) NOT NULL,
  `Estat` ENUM('Public', 'Ocult', 'Privat') NOT NULL,
  `idEtiquetes` INT(11) NOT NULL,
  `idUsuari` INT(11) NOT NULL,
  `DataHora_realització` DATETIME NOT NULL,
  `Etiqueta_idEtiqueta` INT(11) NOT NULL,
  `Comentaris_idComentaris` INT(11) NOT NULL,
  `Usuaris_idUsuaris` INT(11) NOT NULL,
  `Usuaris_Playlists_idPlaylists` INT(11) NOT NULL,
  PRIMARY KEY (`idVideo`, `Etiqueta_idEtiqueta`, `Comentaris_idComentaris`, `Usuaris_idUsuaris`, `Usuaris_Playlists_idPlaylists`),
  INDEX `fk_Videos_Etiqueta1_idx` (`Etiqueta_idEtiqueta` ASC) VISIBLE,
  INDEX `fk_Videos_Comentaris1_idx` (`Comentaris_idComentaris` ASC) VISIBLE,
  INDEX `fk_Videos_Usuaris1_idx` (`Usuaris_idUsuaris` ASC, `Usuaris_Playlists_idPlaylists` ASC) VISIBLE,
  CONSTRAINT `fk_Videos_Etiqueta1`
    FOREIGN KEY (`Etiqueta_idEtiqueta`)
    REFERENCES `Youtube`.`Etiqueta` (`idEtiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Videos_Comentaris1`
    FOREIGN KEY (`Comentaris_idComentaris`)
    REFERENCES `Youtube`.`Comentaris` (`idComentaris`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Videos_Usuaris1`
    FOREIGN KEY (`Usuaris_idUsuaris` , `Usuaris_Playlists_idPlaylists`)
    REFERENCES `Youtube`.`Usuaris` (`idUsuaris` , `Playlists_idPlaylists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Etiqueta` (
  `idEtiqueta` INT(11) NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEtiqueta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Comentaris` (
  `idComentaris` INT(11) NOT NULL AUTO_INCREMENT,
  `Text` TEXT(150) NOT NULL,
  `DataHora` TIME NOT NULL,
  PRIMARY KEY (`idComentaris`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Playlists` (
  `idPlaylists` INT(11) NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `DataCreació` VARCHAR(45) NOT NULL,
  `Estat` ENUM('Public', 'Privat') NOT NULL,
  PRIMARY KEY (`idPlaylists`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Canals` (
  `idCanal` INT(11) NOT NULL AUTO_INCREMENT,
  `idUsuari` INT(11) NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripció` VARCHAR(45) NOT NULL,
  `DataCreació` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCanal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Reaccions` (
  `idUsuari` INT(11) NOT NULL,
  `idVideo` INT(11) NOT NULL,
  `Tipus_Reacció` ENUM('Like', 'Dislike') NOT NULL,
  `Data_Hora` DATETIME NOT NULL,
  `DataNaix` INT(11) NOT NULL AUTO_INCREMENT,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Subscripcions` (
  `Usuaris_idUsuaris` INT(11) NOT NULL,
  `Canals_idCanal` INT(11) NOT NULL,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `Youtube`.`Playlists_has_Videos` (
  `Playlists_idPlaylists` INT(11) NOT NULL,
  `Videos_idVideo` INT(11) NOT NULL,
  `Videos_Etiqueta_idEtiqueta` INT(11) NOT NULL,
  `Videos_Comentaris_idComentaris` INT(11) NOT NULL,
  PRIMARY KEY (`Playlists_idPlaylists`, `Videos_idVideo`, `Videos_Comentaris_idComentaris`, `Videos_Etiqueta_idEtiqueta`),
  INDEX `fk_Playlists_has_Videos_Videos1_idx` (`Videos_idVideo` ASC, `Videos_Etiqueta_idEtiqueta` ASC, `Videos_Comentaris_idComentaris` ASC) VISIBLE,
  INDEX `fk_Playlists_has_Videos_Playlists1_idx` (`Playlists_idPlaylists` ASC) VISIBLE,
  CONSTRAINT `fk_Playlists_has_Videos_Playlists1`
    FOREIGN KEY (`Playlists_idPlaylists`)
    REFERENCES `Youtube`.`Playlists` (`idPlaylists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Playlists_has_Videos_Videos1`
    FOREIGN KEY (`Videos_idVideo` , `Videos_Etiqueta_idEtiqueta` , `Videos_Comentaris_idComentaris`)
    REFERENCES `Youtube`.`Videos` (`idVideo` , `Etiqueta_idEtiqueta` , `Comentaris_idComentaris`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
