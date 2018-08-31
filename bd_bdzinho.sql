-- MySQL Script generated by MySQL Workbench
-- 06/14/18 22:14:15
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema buildev_db
-- -----------------------------------------------------
-- Banco de dados do jogo BuilDev
-- 
-- Gabriel de Freitas
-- Gabriel Faganelo
-- Rodrigo Vieira
-- Serena Ramos

-- -----------------------------------------------------
-- Schema buildev_db
--
-- Banco de dados do jogo BuilDev
-- 
-- Gabriel de Freitas
-- Gabriel Faganelo
-- Rodrigo Vieira
-- Serena Ramos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `buildev_db` DEFAULT CHARACTER SET utf8 ;
USE `buildev_db` ;

-- -----------------------------------------------------
-- Table `buildev_db`.`jogadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buildev_db`.`jogadores` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Números identificadores dos usuários.',
  `nome` VARCHAR(70) NOT NULL COMMENT 'Nomes dos usuários.',
  `nome_usuario` VARCHAR(20) NOT NULL COMMENT 'Nomes de usuários, utilizados para realizar o login.',
  `senha` CHAR(32) NOT NULL COMMENT 'Senhas dos usuários, utilizadas para realizar o login.',
  `nascimento` DATE NOT NULL COMMENT 'Datas de nascimentos dos usuários.',
  `email` VARCHAR(90) NOT NULL COMMENT 'Endereços de e-mails dos usuários, utilizados na recuperação de senha.',
  `dh_inclusao` DATETIME NOT NULL COMMENT 'Datas de inclusões dos usuários no sistema.',
  `creditos` SMALLINT UNSIGNED NOT NULL COMMENT 'Créditos que os usuários possuem, utilizados na loja para troca de produtos.',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Tabela de dados dos usuários.';


-- -----------------------------------------------------
-- Table `buildev_db`.`logins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buildev_db`.`logins` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Números identificadores dos logins.',
  `dh_entrada` DATETIME NOT NULL COMMENT 'Datas e horas das entradas dos usuários.',
  `dh_saida` DATETIME NOT NULL COMMENT 'Datas e horas das saídas dos usuários.',
  `jogadores_id` INT UNSIGNED NOT NULL COMMENT 'Números identificadores dos usuários.',
  PRIMARY KEY (`id`),
  INDEX `fk_logins_jogadores_idx` (`jogadores_id` ASC),
  CONSTRAINT `fk_logins_jogadores`
    FOREIGN KEY (`jogadores_id`)
    REFERENCES `buildev_db`.`jogadores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabela de longins de entradas e saídas dos usuários.';


-- -----------------------------------------------------
-- Table `buildev_db`.`fases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buildev_db`.`fases` (
  `codigo` TINYINT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'Códigos de identificação das fases.',
  `nome` VARCHAR(45) NOT NULL COMMENT 'Nomes das fases.',
  `dificuldade` TINYINT(1) UNSIGNED NOT NULL COMMENT 'Níveis de dificuldade das fases. 1=fácil, 2=médio, 3=difícil.',
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
COMMENT = 'Tabela de dados das fases.';


-- -----------------------------------------------------
-- Table `buildev_db`.`questoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buildev_db`.`questoes` (
  `id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'Números identificadores das questões.',
  `enunciado` TEXT NOT NULL COMMENT 'Enunciados das questões.',
  `dificuldade` TINYINT(1) UNSIGNED NOT NULL COMMENT 'Níveis de dificuldade das fases. 1=fácil, 2=médio, 3=difícil.',
  `fases_codigo` TINYINT UNSIGNED ZEROFILL NOT NULL COMMENT 'Códigos de identificação das fases.',
  PRIMARY KEY (`id`),
  INDEX `fk_questoes_fases1_idx` (`fases_codigo` ASC),
  CONSTRAINT `fk_questoes_fases1`
    FOREIGN KEY (`fases_codigo`)
    REFERENCES `buildev_db`.`fases` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabela de dados das questões.';


-- -----------------------------------------------------
-- Table `buildev_db`.`alternativas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buildev_db`.`alternativas` (
  `id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'Números identificadores das alternativas.',
  `descricao` TEXT NOT NULL COMMENT 'Descrições das alternativas.',
  `status` TINYINT(1) UNSIGNED NOT NULL COMMENT 'Status das alternativas. Incorreta=0, Correta=1.',
  `questoes_id` INT UNSIGNED ZEROFILL NOT NULL COMMENT 'Números identificadores das questões.',
  PRIMARY KEY (`id`),
  INDEX `fk_alternativas_questoes1_idx` (`questoes_id` ASC),
  CONSTRAINT `fk_alternativas_questoes1`
    FOREIGN KEY (`questoes_id`)
    REFERENCES `buildev_db`.`questoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabela de dados de alternativas das questões.';


-- -----------------------------------------------------
-- Table `buildev_db`.`dicas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buildev_db`.`dicas` (
  `id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'Números identificadores das dicas das questões.',
  `descricao` TEXT NOT NULL COMMENT 'Descrições das dicas.',
  `questoes_id` INT UNSIGNED ZEROFILL NOT NULL COMMENT 'Números identificadores das questões.',
  PRIMARY KEY (`id`),
  INDEX `fk_dicas_questoes1_idx` (`questoes_id` ASC),
  CONSTRAINT `fk_dicas_questoes1`
    FOREIGN KEY (`questoes_id`)
    REFERENCES `buildev_db`.`questoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabela com os dados das dicas das questões.';


-- -----------------------------------------------------
-- Table `buildev_db`.`itens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buildev_db`.`itens` (
  `codigo` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'Códigos de identificação dos itens.',
  `nome` VARCHAR(30) NOT NULL COMMENT 'Nomes dos itens.',
  `valor` SMALLINT UNSIGNED NOT NULL COMMENT 'Valores dos itens.',
  `imagem` VARCHAR(255) NULL COMMENT 'Endereços das imagens dos itens.',
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB
COMMENT = 'Tabela de dados dos itens.';


-- -----------------------------------------------------
-- Table `buildev_db`.`administradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buildev_db`.`administradores` (
  `id` INT UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'Números identificadores dos usuários administradores.',
  `nome_usuario` VARCHAR(20) NOT NULL COMMENT 'Nomes de usuários, utilizados para realizar o login.',
  `senha` CHAR(32) NOT NULL COMMENT 'Senhas dos usuários, utilizadas para realizar o login.',
  `email` VARCHAR(90) NOT NULL COMMENT 'Endereços de e-mails dos usuários, utilizados na recuperação de senha.',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Tabela de dados dos administradores.';


-- -----------------------------------------------------
-- Table `buildev_db`.`jogadores_has_itens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buildev_db`.`jogadores_has_itens` (
  `jogadores_id` INT UNSIGNED NOT NULL COMMENT 'Números identificadores dos usuários.',
  `itens_codigo` INT UNSIGNED ZEROFILL NOT NULL COMMENT 'Códigos de identificação dos itens.',
  `status` TINYINT(1) NOT NULL COMMENT 'Status dos itens. Desativado=0, Ativado=1.',
  PRIMARY KEY (`jogadores_id`, `itens_codigo`),
  INDEX `fk_jogadores_has_itens_itens1_idx` (`itens_codigo` ASC),
  INDEX `fk_jogadores_has_itens_jogadores1_idx` (`jogadores_id` ASC),
  CONSTRAINT `fk_jogadores_has_itens_jogadores1`
    FOREIGN KEY (`jogadores_id`)
    REFERENCES `buildev_db`.`jogadores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jogadores_has_itens_itens1`
    FOREIGN KEY (`itens_codigo`)
    REFERENCES `buildev_db`.`itens` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabela de correlacionamento entre jogadores e itens.';


-- -----------------------------------------------------
-- Table `buildev_db`.`jogadores_has_questoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `buildev_db`.`jogadores_has_questoes` (
  `jogadores_id` INT UNSIGNED NOT NULL COMMENT 'Número identificador dos usuários',
  `questoes_id` INT UNSIGNED ZEROFILL NOT NULL COMMENT 'Números identificadores das questões.',
  `resposta` INT UNSIGNED NOT NULL COMMENT 'Respostas dos jogadores. \'id\' da entidade \'alternativas\'.',
  `pontuacao` MEDIUMINT UNSIGNED NOT NULL COMMENT 'Pontuações das respostas de acordo com a programação e o tempo restante.',
  PRIMARY KEY (`jogadores_id`, `questoes_id`),
  INDEX `fk_jogadores_has_questoes_questoes1_idx` (`questoes_id` ASC),
  INDEX `fk_jogadores_has_questoes_jogadores1_idx` (`jogadores_id` ASC),
  CONSTRAINT `fk_jogadores_has_questoes_jogadores1`
    FOREIGN KEY (`jogadores_id`)
    REFERENCES `buildev_db`.`jogadores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jogadores_has_questoes_questoes1`
    FOREIGN KEY (`questoes_id`)
    REFERENCES `buildev_db`.`questoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabela de respostas dos jogadores.';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;