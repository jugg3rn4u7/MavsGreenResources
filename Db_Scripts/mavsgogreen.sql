-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mavsgogreen
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mavsgogreen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mavsgogreen` DEFAULT CHARACTER SET utf8 ;
USE `mavsgogreen` ;

-- -----------------------------------------------------
-- Table `mavsgogreen`.`access`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mavsgogreen`.`access` (
  `accessId` INT(11) NOT NULL,
  `accessDesc` CHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`accessId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mavsgogreen`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mavsgogreen`.`users` (
  `userId` INT(11) NOT NULL,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mavsgogreen`.`emailinformation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mavsgogreen`.`emailinformation` (
  `userId` INT(11) NOT NULL,
  `emailId` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `Primary` INT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`, `emailId`),
  CONSTRAINT `FK1_userId_emailInformation`
    FOREIGN KEY (`userId`)
    REFERENCES `mavsgogreen`.`users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mavsgogreen`.`multipleacess`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mavsgogreen`.`multipleacess` (
  `userId` INT(11) NULL DEFAULT NULL,
  `accessId` INT(11) NULL DEFAULT NULL,
  INDEX `FK1_mulacc_userId_idx` (`userId` ASC),
  INDEX `FK2_mulacc_accessId_idx` (`accessId` ASC),
  CONSTRAINT `FK1_mulacc_userId`
    FOREIGN KEY (`userId`)
    REFERENCES `mavsgogreen`.`users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK2_mulacc_accessId`
    FOREIGN KEY (`accessId`)
    REFERENCES `mavsgogreen`.`access` (`accessId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mavsgogreen`.`permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mavsgogreen`.`permission` (
  `permissionID` INT(11) NOT NULL,
  `permissionDesc` VARCHAR(8) NULL DEFAULT NULL,
  `permissionDescDetail` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`permissionID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mavsgogreen`.`rights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mavsgogreen`.`rights` (
  `accessId` INT(11) NULL DEFAULT NULL,
  `permissionId` INT(11) NULL DEFAULT NULL,
  INDEX `FK1_rights_accessId_idx` (`accessId` ASC),
  INDEX `FK2_rights_permissionId_idx` (`permissionId` ASC),
  CONSTRAINT `FK1_rights_accessId`
    FOREIGN KEY (`accessId`)
    REFERENCES `mavsgogreen`.`access` (`accessId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK2_rights_permissionId`
    FOREIGN KEY (`permissionId`)
    REFERENCES `mavsgogreen`.`permission` (`permissionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
