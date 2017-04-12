-- MySQL Script generated by MySQL Workbench
-- 04/11/17 22:49:00
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`OBRA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`OBRA` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`OBRA` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `TITULO` NVARCHAR(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`AUTOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`AUTOR` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`AUTOR` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `NOME` NVARCHAR(255) NOT NULL,
  `SOBRENOME` NVARCHAR(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`OBRA_AUTOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`OBRA_AUTOR` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`OBRA_AUTOR` (
  `OBRA_ID` INT UNSIGNED NOT NULL,
  `AUTOR_ID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`OBRA_ID`, `AUTOR_ID`),
  INDEX `fk_OBRA_has_AUTOR_AUTOR1_idx` (`AUTOR_ID` ASC),
  INDEX `fk_OBRA_has_AUTOR_OBRA_idx` (`OBRA_ID` ASC),
  CONSTRAINT `fk_OBRA_has_AUTOR_OBRA`
    FOREIGN KEY (`OBRA_ID`)
    REFERENCES `mydb`.`OBRA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AUTOR_has_AUTOR_OBRA`
    FOREIGN KEY (`AUTOR_ID`)
    REFERENCES `mydb`.`AUTOR` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`EDITORA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EDITORA` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`EDITORA` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `NOME` NVARCHAR(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`EDICAO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EDICAO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`EDICAO` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ANO` DATE NOT NULL,
  `OBRA_ID` INT UNSIGNED NOT NULL,
  `EDITORA_ID` INT UNSIGNED NOT NULL,
  `NUMERO` INT UNSIGNED NOT NULL,
  `IMAGEM_FRONTAL` BLOB NULL,
  `IMAGEM_TRASEIRA` BLOB NULL,
  `SINOPSE` NVARCHAR(1000) NULL,
  `PRECO_ORIGINAL` DOUBLE UNSIGNED NOT NULL,
  `DESCONTO` DECIMAL(3,2) UNSIGNED NOT NULL DEFAULT 0,
  `PESO` DOUBLE UNSIGNED NULL,
  `QUANTIDADE` INT UNSIGNED NOT NULL DEFAULT 0,
  `ALTURA` DOUBLE NULL,
  `LARGURA` DOUBLE NULL,
  `COMPRIMENTO` DOUBLE NULL,
  `NUMERO_PAGINAS` INT NULL,
  PRIMARY KEY (`ID`, `OBRA_ID`, `EDITORA_ID`, `NUMERO`),
  INDEX `fk_OBRA_has_EDITORA_EDITORA1_idx` (`EDITORA_ID` ASC),
  INDEX `fk_OBRA_has_EDITORA_OBRA1_idx` (`OBRA_ID` ASC),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  CONSTRAINT `fk_OBRA_has_EDITORA_OBRA1`
    FOREIGN KEY (`OBRA_ID`)
    REFERENCES `mydb`.`OBRA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OBRA_has_EDITORA_EDITORA1`
    FOREIGN KEY (`EDITORA_ID`)
    REFERENCES `mydb`.`EDITORA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`CATEGORIA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CATEGORIA` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`CATEGORIA` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `NOME` NVARCHAR(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  UNIQUE INDEX `NOME_UNIQUE` (`NOME` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`OBRA_CATEGORIA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`OBRA_CATEGORIA` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`OBRA_CATEGORIA` (
  `OBRA_ID` INT UNSIGNED NOT NULL,
  `CATEGORIA_ID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`OBRA_ID`, `CATEGORIA_ID`),
  INDEX `fk_OBRA_has_CATEGORIA_CATEGORIA1_idx` (`CATEGORIA_ID` ASC),
  INDEX `fk_OBRA_has_CATEGORIA_OBRA1_idx` (`OBRA_ID` ASC),
  CONSTRAINT `fk_OBRA_has_CATEGORIA_OBRA1`
    FOREIGN KEY (`OBRA_ID`)
    REFERENCES `mydb`.`OBRA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OBRA_has_CATEGORIA_CATEGORIA1`
    FOREIGN KEY (`CATEGORIA_ID`)
    REFERENCES `mydb`.`CATEGORIA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`IDIOMA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`IDIOMA` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`IDIOMA` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `NOME` NVARCHAR(255) NOT NULL DEFAULT 'Portug�s',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `NOME_UNIQUE` (`NOME` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`ENCADERNACAO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ENCADERNACAO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`ENCADERNACAO` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `TIPO` NVARCHAR(255) NOT NULL DEFAULT 'CAPA DURA',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  UNIQUE INDEX `TIPO_UNIQUE` (`TIPO` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`EDICAO_ENCADERNACAO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EDICAO_ENCADERNACAO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`EDICAO_ENCADERNACAO` (
  `EDICAO_ID` INT UNSIGNED NOT NULL,
  `ENCADERNACAO_ID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`EDICAO_ID`, `ENCADERNACAO_ID`),
  INDEX `fk_EDICAO_has_ENCADERNACAO_ENCADERNACAO1_idx` (`ENCADERNACAO_ID` ASC),
  INDEX `fk_EDICAO_has_ENCADERNACAO_EDICAO1_idx` (`EDICAO_ID` ASC),
  CONSTRAINT `fk_EDICAO_has_ENCADERNACAO_EDICAO1`
    FOREIGN KEY (`EDICAO_ID`)
    REFERENCES `mydb`.`EDICAO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EDICAO_has_ENCADERNACAO_ENCADERNACAO1`
    FOREIGN KEY (`ENCADERNACAO_ID`)
    REFERENCES `mydb`.`ENCADERNACAO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`TIPO_USUARIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TIPO_USUARIO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`TIPO_USUARIO` (
  `ID` TINYINT(1) NOT NULL AUTO_INCREMENT,
  `TIPO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `TIPO_UNIQUE` (`TIPO` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`USUARIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`USUARIO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`USUARIO` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `NOME` NVARCHAR(255) NOT NULL,
  `SOBRENOME` NVARCHAR(255) NOT NULL,
  `EMAIL` NVARCHAR(255) NOT NULL,
  `SENHA` NVARCHAR(20) NOT NULL,
  `TIPO_USUARIO_ID` TINYINT(1) NOT NULL,
  PRIMARY KEY (`ID`, `TIPO_USUARIO_ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  INDEX `fk_USUARIO_TIPO_USUARIO1_idx` (`TIPO_USUARIO_ID` ASC),
  CONSTRAINT `fk_USUARIO_TIPO_USUARIO1`
    FOREIGN KEY (`TIPO_USUARIO_ID`)
    REFERENCES `mydb`.`TIPO_USUARIO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`SEXO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`SEXO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`SEXO` (
  `ID` TINYINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `TIPO` NVARCHAR(255) NOT NULL DEFAULT 'Masculino',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  UNIQUE INDEX `TIPO_UNIQUE` (`TIPO` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`CLIENTE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CLIENTE` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`CLIENTE` (
  `USUARIO_ID` INT UNSIGNED NOT NULL,
  `CPF` CHAR(11) NOT NULL,
  `DATA_NASCIMENTO` DATE NULL,
  `PONTOS_ACUMULADOS` DOUBLE UNSIGNED NOT NULL DEFAULT 0,
  `SEXO_ID` TINYINT(1) UNSIGNED NOT NULL,
  INDEX `fk_CLIENTE_USUARIO1_idx` (`USUARIO_ID` ASC),
  PRIMARY KEY (`USUARIO_ID`),
  UNIQUE INDEX `USUARIO_ID_UNIQUE` (`USUARIO_ID` ASC),
  INDEX `fk_CLIENTE_SEXO1_idx` (`SEXO_ID` ASC),
  CONSTRAINT `fk_CLIENTE_USUARIO1`
    FOREIGN KEY (`USUARIO_ID`)
    REFERENCES `mydb`.`USUARIO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENTE_SEXO1`
    FOREIGN KEY (`SEXO_ID`)
    REFERENCES `mydb`.`SEXO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`TELEFONE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`TELEFONE` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`TELEFONE` (
  `CLIENTE_USUARIO_ID` INT UNSIGNED NOT NULL,
  `TELEFONE` VARCHAR(45) NULL,
  INDEX `fk_TELEFONE_CLIENTE1_idx` (`CLIENTE_USUARIO_ID` ASC),
  CONSTRAINT `fk_TELEFONE_CLIENTE1`
    FOREIGN KEY (`CLIENTE_USUARIO_ID`)
    REFERENCES `mydb`.`CLIENTE` (`USUARIO_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`LISTA_DESEJO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`LISTA_DESEJO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`LISTA_DESEJO` (
  `CLIENTE_USUARIO_ID` INT UNSIGNED NOT NULL,
  `EDICAO_ID` INT UNSIGNED NOT NULL,
  INDEX `fk_LISTA_DESEJO_CLIENTE1_idx` (`CLIENTE_USUARIO_ID` ASC),
  INDEX `fk_LISTA_DESEJO_EDICAO1_idx` (`EDICAO_ID` ASC),
  CONSTRAINT `fk_LISTA_DESEJO_CLIENTE1`
    FOREIGN KEY (`CLIENTE_USUARIO_ID`)
    REFERENCES `mydb`.`CLIENTE` (`USUARIO_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LISTA_DESEJO_EDICAO1`
    FOREIGN KEY (`EDICAO_ID`)
    REFERENCES `mydb`.`EDICAO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`CARRINHO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`CARRINHO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`CARRINHO` (
  `ID` INT UNSIGNED NOT NULL,
  `CLIENTE_USUARIO_ID` INT UNSIGNED NOT NULL,
  `EDICAO_ID` INT UNSIGNED NOT NULL,
  `QUANTIDADE` INT UNSIGNED NOT NULL DEFAULT 1,
  `VALOR_UNITARIO` DOUBLE UNSIGNED NOT NULL,
  `PONTOS_VALOR_UNITARIO` INT UNSIGNED NOT NULL DEFAULT 1,
  `STATUS` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  INDEX `fk_CARRINHO_CLIENTE1_idx` (`CLIENTE_USUARIO_ID` ASC),
  INDEX `fk_CARRINHO_EDICAO1_idx` (`EDICAO_ID` ASC),
  CONSTRAINT `fk_CARRINHO_CLIENTE1`
    FOREIGN KEY (`CLIENTE_USUARIO_ID`)
    REFERENCES `mydb`.`CLIENTE` (`USUARIO_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CARRINHO_EDICAO1`
    FOREIGN KEY (`EDICAO_ID`)
    REFERENCES `mydb`.`EDICAO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`FORMA_PAGAMENTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`FORMA_PAGAMENTO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`FORMA_PAGAMENTO` (
  `ID` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `TIPO` NVARCHAR(255) NOT NULL DEFAULT 'Boleto',
  `VEZES` INT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  UNIQUE INDEX `TIPO_UNIQUE` (`TIPO` ASC))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`PEDIDO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PEDIDO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`PEDIDO` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `CARRINHO_ID` INT UNSIGNED NOT NULL,
  `VALOR_TOTAL` DOUBLE NOT NULL,
  `DATA_HORA` DATETIME NOT NULL,
  `CEP` CHAR(8) NOT NULL,
  `NUMERO` NVARCHAR(10) NOT NULL,
  `FRETE` DOUBLE NOT NULL DEFAULT 0,
  `FORMA_PAGAMENTO_ID` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  INDEX `fk_PEDIDO_CARRINHO1_idx` (`CARRINHO_ID` ASC),
  INDEX `fk_PEDIDO_FORMA_PAGAMENTO1_idx` (`FORMA_PAGAMENTO_ID` ASC),
  CONSTRAINT `fk_PEDIDO_CARRINHO1`
    FOREIGN KEY (`CARRINHO_ID`)
    REFERENCES `mydb`.`CARRINHO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PEDIDO_FORMA_PAGAMENTO1`
    FOREIGN KEY (`FORMA_PAGAMENTO_ID`)
    REFERENCES `mydb`.`FORMA_PAGAMENTO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`ENDERECO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ENDERECO` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`ENDERECO` (
  `CLIENTE_USUARIO_ID` INT UNSIGNED NOT NULL,
  `CEP` CHAR(8) NOT NULL,
  `NUMERO` NVARCHAR(10) NOT NULL,
  INDEX `fk_ENDERECO_CLIENTE1_idx` (`CLIENTE_USUARIO_ID` ASC),
  PRIMARY KEY (`CLIENTE_USUARIO_ID`, `CEP`, `NUMERO`),
  CONSTRAINT `fk_ENDERECO_CLIENTE1`
    FOREIGN KEY (`CLIENTE_USUARIO_ID`)
    REFERENCES `mydb`.`CLIENTE` (`USUARIO_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mydb`.`EDICAO_has_IDIOMA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`EDICAO_has_IDIOMA` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `mydb`.`EDICAO_has_IDIOMA` (
  `EDICAO_ID` INT UNSIGNED NOT NULL,
  `IDIOMA_ID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`EDICAO_ID`, `IDIOMA_ID`),
  INDEX `fk_EDICAO_has_IDIOMA_IDIOMA1_idx` (`IDIOMA_ID` ASC),
  INDEX `fk_EDICAO_has_IDIOMA_EDICAO1_idx` (`EDICAO_ID` ASC),
  CONSTRAINT `fk_EDICAO_has_IDIOMA_EDICAO1`
    FOREIGN KEY (`EDICAO_ID`)
    REFERENCES `mydb`.`EDICAO` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EDICAO_has_IDIOMA_IDIOMA1`
    FOREIGN KEY (`IDIOMA_ID`)
    REFERENCES `mydb`.`IDIOMA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;