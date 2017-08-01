-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema pf
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pf
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pf` DEFAULT CHARACTER SET utf8 ;
USE `pf` ;

-- -----------------------------------------------------
-- Table `pf`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pf`.`endereco` (
  `idendereco` INT NOT NULL AUTO_INCREMENT,
  `endereco` VARCHAR(200) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idendereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pf`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pf`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `login` VARCHAR(10) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `endereco_idendereco` INT NOT NULL,
  PRIMARY KEY (`idusuario`),
  INDEX `fk_usuario_endereco_idx` (`endereco_idendereco` ASC),
  CONSTRAINT `fk_usuario_endereco`
    FOREIGN KEY (`endereco_idendereco`)
    REFERENCES `pf`.`endereco` (`idendereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pf`.`carteira`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pf`.`carteira` (
  `idcarteira` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `saldo` DOUBLE NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`idcarteira`),
  INDEX `fk_carteira_usuario1_idx` (`usuario_idusuario` ASC),
  CONSTRAINT `fk_carteira_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `pf`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pf`.`forma_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pf`.`forma_pagamento` (
  `idforma_pagamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idforma_pagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pf`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pf`.`categoria` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pf`.`conta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pf`.`conta` (
  `idconta` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` DOUBLE NOT NULL,
  `data` DATE NOT NULL,
  `data_venc` VARCHAR(45) NULL,
  `tipo` INT NOT NULL,
  `conta_fixa` TINYINT(1) NOT NULL,
  `carteira_idcarteira` INT NOT NULL,
  `forma_pagamento_idforma_pagamento` INT NOT NULL,
  `usuario_idusuario` INT NOT NULL,
  `categoria_idcategoria` INT NOT NULL,
  PRIMARY KEY (`idconta`),
  INDEX `fk_conta_carteira1_idx` (`carteira_idcarteira` ASC),
  INDEX `fk_conta_forma_pagamento1_idx` (`forma_pagamento_idforma_pagamento` ASC),
  INDEX `fk_conta_usuario1_idx` (`usuario_idusuario` ASC),
  INDEX `fk_conta_categoria1_idx` (`categoria_idcategoria` ASC),
  CONSTRAINT `fk_conta_carteira1`
    FOREIGN KEY (`carteira_idcarteira`)
    REFERENCES `pf`.`carteira` (`idcarteira`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_forma_pagamento1`
    FOREIGN KEY (`forma_pagamento_idforma_pagamento`)
    REFERENCES `pf`.`forma_pagamento` (`idforma_pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `pf`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_categoria1`
    FOREIGN KEY (`categoria_idcategoria`)
    REFERENCES `pf`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pf`.`subcategoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pf`.`subcategoria` (
  `idsubcategoria` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `categoria_idcategoria` INT NOT NULL,
  PRIMARY KEY (`idsubcategoria`),
  INDEX `fk_subcategoria_categoria1_idx` (`categoria_idcategoria` ASC),
  CONSTRAINT `fk_subcategoria_categoria1`
    FOREIGN KEY (`categoria_idcategoria`)
    REFERENCES `pf`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


insert into endereco values(1, 'rua José Alberto Spohr, numero 107','Lajeado','Rio Grande do Sul', 'Brasil');
insert into usuario values (1, 'Willian Valer', 'wav', 'admin', 1);
