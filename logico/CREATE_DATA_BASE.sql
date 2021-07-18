-- MySQL Script generated by MySQL Workbench
-- Sat Jul 17 21:57:43 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema DB_SUCOS_VENDA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DB_SUCOS_VENDA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DB_SUCOS_VENDA` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema sucos_vendas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sucos_vendas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sucos_vendas` DEFAULT CHARACTER SET latin1 ;
USE `DB_SUCOS_VENDA` ;

-- -----------------------------------------------------
-- Table `DB_SUCOS_VENDA`.`TB_VENDEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_SUCOS_VENDA`.`TB_VENDEDOR` (
  `ID` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'CODIGO DO VENDEDOR',
  `MATRICULA` VARCHAR(5) NOT NULL,
  `NOME` VARCHAR(45) NOT NULL,
  `BAIRRO` VARCHAR(45) NULL,
  `COMISSAO` FLOAT NULL,
  `DT_ADMISSAO` DATE NOT NULL,
  `DE_FERIAS` BIT(1) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_SUCOS_VENDA`.`TB_CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_SUCOS_VENDA`.`TB_CLIENTE` (
  `ID` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'CODIGO DO CLIENTE',
  `CPF` VARCHAR(11) NOT NULL COMMENT '11122233377',
  `NOME` VARCHAR(45) NOT NULL,
  `ENDERECO` VARCHAR(45) NULL,
  `BAIRRO` VARCHAR(45) NULL,
  `CIDADE` VARCHAR(45) NULL,
  `ESTADO` VARCHAR(45) NULL,
  `CEP` VARCHAR(45) NULL,
  `DT_NASCIMENTO` DATE NULL,
  `IDADE` INT NULL,
  `SEXO` VARCHAR(1) NULL,
  `LIMITE_CREDITO` FLOAT NULL,
  `VOLUME_COMPRA` FLOAT NULL,
  `PRIMEIRA_COMPRA` BIT(1) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_SUCOS_VENDA`.`TB_PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_SUCOS_VENDA`.`TB_PRODUTO` (
  `ID` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'CODIGO DO PRODUTO',
  `NOME` VARCHAR(45) NULL,
  `EMBALAGEM` VARCHAR(45) NULL,
  `TAMANHO` VARCHAR(45) NULL,
  `SABOR` VARCHAR(45) NULL,
  `PRECO` FLOAT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_SUCOS_VENDA`.`TB_NOTA_FISCAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_SUCOS_VENDA`.`TB_NOTA_FISCAL` (
  `ID` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'NUMERO DA NOTA FISCAL',
  `ID_VENDEDOR` BIGINT NOT NULL,
  `TB_CLIENTE_ID` BIGINT NOT NULL,
  `DT_VENDA` DATE NOT NULL,
  `IMPOSTO` FLOAT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_TB_NOTA_FISCAL_TB_VENDEDOR_IDX` (`ID_VENDEDOR` ASC),
  INDEX `FK_TB_NOTA_FISCAL_TB_CLIENTE_IDX` (`TB_CLIENTE_ID` ASC),
  CONSTRAINT `FK_TB_NOTA_FISCAL_TB_VENDEDOR`
    FOREIGN KEY (`ID_VENDEDOR`)
    REFERENCES `DB_SUCOS_VENDA`.`TB_VENDEDOR` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TB_NOTA_FISCAL_TB_CLIENTE`
    FOREIGN KEY (`TB_CLIENTE_ID`)
    REFERENCES `DB_SUCOS_VENDA`.`TB_CLIENTE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_SUCOS_VENDA`.`TB_ITEM_NOTA_FISCAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_SUCOS_VENDA`.`TB_ITEM_NOTA_FISCAL` (
  `ID` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'NUMERO DA NOTA FISCAL\n',
  `ID_PRODUTO` BIGINT NOT NULL COMMENT 'CODIGO DO PRODUTO',
  `ID_NOTA_FISCAL` BIGINT NOT NULL COMMENT 'NUMERO DA NOTA FISCAL',
  `QUANTIDADE` INT NULL,
  `PRECO_UNITARIO` FLOAT NULL,
  `PRECO_TOTAL` FLOAT NULL,
  PRIMARY KEY (`ID`),
  INDEX `FK_TB_ITEM_NOTA_FISCAL_TB_PRODUTO_IDX` (`ID_PRODUTO` ASC),
  INDEX `FK_TB_ITEM_NOTA_FISCAL_TB_NOTA_FISCAL_IDX` (`ID_NOTA_FISCAL` ASC),
  CONSTRAINT `FK_TB_ITEM_NOTA_FISCAL_TB_PRODUTO`
    FOREIGN KEY (`ID_PRODUTO`)
    REFERENCES `DB_SUCOS_VENDA`.`TB_PRODUTO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TB_ITEM_NOTA_FISCAL_TB_NOTA_FISCAL`
    FOREIGN KEY (`ID_NOTA_FISCAL`)
    REFERENCES `DB_SUCOS_VENDA`.`TB_NOTA_FISCAL` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `sucos_vendas` ;

-- -----------------------------------------------------
-- Table `sucos_vendas`.`TB_ITEM_NOTA_FISCAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sucos_vendas`.`TB_ITEM_NOTA_FISCAL` (
  `NUMERO` INT(11) NOT NULL,
  `QUANTIDADE` INT(11) NOT NULL,
  `PRECO_UNITARIO` FLOAT NOT NULL,
  `PRECO_TOTAL` FLOAT NOT NULL,
  PRIMARY KEY (`NUMERO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sucos_vendas`.`TB_NOTA_FISCAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sucos_vendas`.`TB_NOTA_FISCAL` (
  `NUMERO` INT(11) NOT NULL,
  `DT_VENDA` DATE NULL DEFAULT NULL,
  `IMPOSTO` FLOAT NOT NULL,
  PRIMARY KEY (`NUMERO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sucos_vendas`.`TB_CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sucos_vendas`.`TB_CLIENTE` (
  `CPF` VARCHAR(11) NOT NULL,
  `NOME` VARCHAR(100) NULL DEFAULT NULL,
  `ENDERECO` VARCHAR(150) NULL DEFAULT NULL,
  `BAIRRO` VARCHAR(50) NULL DEFAULT NULL,
  `CIDADE` VARCHAR(50) NULL DEFAULT NULL,
  `ESTADO` VARCHAR(2) NULL DEFAULT NULL,
  `CEP` VARCHAR(8) NULL DEFAULT NULL,
  `DT_NASCIMENTO` DATE NOT NULL,
  `IDADE` SMALLINT(6) NULL DEFAULT NULL,
  `SEXO` VARCHAR(1) NULL DEFAULT NULL,
  `LIMITE_DE_CREDITO` FLOAT NULL DEFAULT NULL,
  `VOLUME_DE_COMPRA` FLOAT NULL DEFAULT NULL,
  `PRIMEIRA_COMPRA` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`CPF`, `DT_NASCIMENTO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sucos_vendas`.`TB_PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sucos_vendas`.`TB_PRODUTO` (
  `CODIGO` VARCHAR(10) NOT NULL,
  `NOME` VARCHAR(50) NOT NULL,
  `EMBALAGEM` VARCHAR(20) NOT NULL,
  `TAMANHO` VARCHAR(10) NOT NULL,
  `SABOR` VARCHAR(20) NOT NULL,
  `PRECO` REAL NOT NULL,
  PRIMARY KEY (`CODIGO`),
  UNIQUE INDEX `CODIGO_UNIQUE` (`CODIGO` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sucos_vendas`.`TB_VENDEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sucos_vendas`.`TB_VENDEDOR` (
  `MATRICULA` VARCHAR(5) NOT NULL,
  `NOME` VARCHAR(100) NULL DEFAULT NULL,
  `BAIRRO` VARCHAR(50) NULL DEFAULT NULL,
  `COMISSAO` FLOAT NULL DEFAULT NULL,
  `DT_ADMISSAO` DATE NULL DEFAULT NULL,
  `DE_FERIAS` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MATRICULA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;