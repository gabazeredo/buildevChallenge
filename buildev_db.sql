-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/09/2018 às 03:11
-- Versão do servidor: 5.7.11-log
-- Versão do PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `buildev_db`
--
CREATE DATABASE IF NOT EXISTS `buildev_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `buildev_db`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `administradores`
--

CREATE TABLE `administradores` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'Números identificadores dos usuários administradores.',
  `nome_usuario` varchar(20) NOT NULL COMMENT 'Nomes de usuários, utilizados para realizar o login.',
  `senha` char(32) NOT NULL COMMENT 'Senhas dos usuários, utilizadas para realizar o login.',
  `email` varchar(90) NOT NULL COMMENT 'Endereços de e-mails dos usuários, utilizados na recuperação de senha.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de dados dos administradores.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `alternativas`
--

CREATE TABLE `alternativas` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'Números identificadores das alternativas.',
  `descricao` text NOT NULL COMMENT 'Descrições das alternativas.',
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT 'Status das alternativas. Incorreta=0, Correta=1.',
  `questoes_id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'Números identificadores das questões.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de dados de alternativas das questões.';

--
-- Fazendo dump de dados para tabela `alternativas`
--

INSERT INTO `alternativas` (`id`, `descricao`, `status`, `questoes_id`) VALUES
(0000000001, 'FOR', 0, 0000000001),
(0000000002, 'WHILE', 0, 0000000001),
(0000000003, 'REPEAT', 0, 0000000001),
(0000000004, 'IF', 1, 0000000001),
(0000000005, 'PostgreSQL', 0, 0000000002),
(0000000006, 'phpMyAmin', 1, 0000000002),
(0000000007, 'MySQL', 0, 0000000002),
(0000000008, 'MongoDB', 0, 0000000002),
(0000000009, '<ul> e <li> ', 1, 0000000003),
(0000000010, '<ul> e <th>', 0, 0000000003),
(0000000011, '<title> e <li>', 0, 0000000003),
(0000000012, '<tr> e <th>', 0, 0000000003),
(0000000013, 'MONITOR', 0, 0000000004),
(0000000014, 'TECLADO', 1, 0000000004),
(0000000015, 'IMPRESSORA', 0, 0000000004),
(0000000016, 'CAIXA DE SOM', 0, 0000000004),
(0000000017, 'console.log()', 1, 0000000005),
(0000000018, 'console.submit()', 0, 0000000005),
(0000000019, 'console.var()', 0, 0000000005),
(0000000020, 'console.data()', 0, 0000000005),
(0000000021, 'HTML', 1, 0000000006),
(0000000022, 'JAVA', 0, 0000000006),
(0000000023, 'PHP', 0, 0000000006),
(0000000024, 'PYTHON', 0, 0000000006);

-- --------------------------------------------------------

--
-- Estrutura para tabela `dicas`
--

CREATE TABLE `dicas` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'Números identificadores das dicas das questões.',
  `descricao` text NOT NULL COMMENT 'Descrições das dicas.',
  `questoes_id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'Números identificadores das questões.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela com os dados das dicas das questões.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `fases`
--

CREATE TABLE `fases` (
  `codigo` tinyint(3) UNSIGNED ZEROFILL NOT NULL COMMENT 'Códigos de identificação das fases.',
  `nome` varchar(45) NOT NULL COMMENT 'Nomes das fases.',
  `dificuldade` tinyint(1) UNSIGNED NOT NULL COMMENT 'Níveis de dificuldade das fases. 1=fácil, 2=médio, 3=difícil.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de dados das fases.';

--
-- Fazendo dump de dados para tabela `fases`
--

INSERT INTO `fases` (`codigo`, `nome`, `dificuldade`) VALUES
(001, '1', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens`
--

CREATE TABLE `itens` (
  `codigo` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'Códigos de identificação dos itens.',
  `nome` varchar(30) NOT NULL COMMENT 'Nomes dos itens.',
  `valor` smallint(5) UNSIGNED NOT NULL COMMENT 'Valores dos itens.',
  `imagem` varchar(255) DEFAULT NULL COMMENT 'Endereços das imagens dos itens.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de dados dos itens.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogadores`
--

CREATE TABLE `jogadores` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Números identificadores dos usuários.',
  `nome` varchar(70) NOT NULL COMMENT 'Nomes dos usuários.',
  `nome_usuario` varchar(20) NOT NULL COMMENT 'Nomes de usuários, utilizados para realizar o login.',
  `senha` char(32) NOT NULL COMMENT 'Senhas dos usuários, utilizadas para realizar o login.',
  `nascimento` date NOT NULL COMMENT 'Datas de nascimentos dos usuários.',
  `email` varchar(90) NOT NULL COMMENT 'Endereços de e-mails dos usuários, utilizados na recuperação de senha.',
  `dh_inclusao` datetime NOT NULL COMMENT 'Datas de inclusões dos usuários no sistema.',
  `creditos` smallint(5) UNSIGNED NOT NULL COMMENT 'Créditos que os usuários possuem, utilizados na loja para troca de produtos.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de dados dos usuários.';

--
-- Fazendo dump de dados para tabela `jogadores`
--

INSERT INTO `jogadores` (`id`, `nome`, `nome_usuario`, `senha`, `nascimento`, `email`, `dh_inclusao`, `creditos`) VALUES
(1, 'gabriel', 'gabriel', '123', '2001-03-08', 'g@gmail.com', '2018-09-24 07:08:33', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogadores_has_itens`
--

CREATE TABLE `jogadores_has_itens` (
  `jogadores_id` int(10) UNSIGNED NOT NULL COMMENT 'Números identificadores dos usuários.',
  `itens_codigo` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'Códigos de identificação dos itens.',
  `status` tinyint(1) NOT NULL COMMENT 'Status dos itens. Desativado=0, Ativado=1.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de correlacionamento entre jogadores e itens.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogadores_has_questoes`
--

CREATE TABLE `jogadores_has_questoes` (
  `jogadores_id` int(10) UNSIGNED NOT NULL COMMENT 'Número identificador dos usuários',
  `questoes_id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'Números identificadores das questões.',
  `resposta` int(10) UNSIGNED NOT NULL COMMENT 'Respostas dos jogadores. ''id'' da entidade ''alternativas''.',
  `pontuacao` mediumint(8) UNSIGNED NOT NULL COMMENT 'Pontuações das respostas de acordo com a programação e o tempo restante.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de respostas dos jogadores.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `logins`
--

CREATE TABLE `logins` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Números identificadores dos logins.',
  `dh_entrada` datetime NOT NULL COMMENT 'Datas e horas das entradas dos usuários.',
  `dh_saida` datetime NOT NULL COMMENT 'Datas e horas das saídas dos usuários.',
  `jogadores_id` int(10) UNSIGNED NOT NULL COMMENT 'Números identificadores dos usuários.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de longins de entradas e saídas dos usuários.';

-- --------------------------------------------------------

--
-- Estrutura para tabela `questoes`
--

CREATE TABLE `questoes` (
  `id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'Números identificadores das questões.',
  `enunciado` text NOT NULL COMMENT 'Enunciados das questões.',
  `dificuldade` tinyint(1) UNSIGNED NOT NULL COMMENT 'Níveis de dificuldade das fases. 1=fácil, 2=médio, 3=difícil.',
  `fases_codigo` tinyint(3) UNSIGNED ZEROFILL NOT NULL COMMENT 'Códigos de identificação das fases.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela de dados das questões.';

--
-- Fazendo dump de dados para tabela `questoes`
--

INSERT INTO `questoes` (`id`, `enunciado`, `dificuldade`, `fases_codigo`) VALUES
(0000000001, ' São estruturas de repetição, exceto:', 1, 001),
(0000000002, 'São exemplos de SGBD, exceto:', 1, 001),
(0000000003, 'Tags utilizadas para fazer listas ordenadas:', 1, 001),
(0000000004, 'Qual dos periféricos abaixo é um periférico de entrada de dados?', 1, 001),
(0000000005, 'Método que permite o envio de dados para o console em JavaScript:', 1, 001),
(0000000006, 'São linguagens de programação que podem ser usadas na WEB, exceto:', 1, 001);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `alternativas`
--
ALTER TABLE `alternativas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_alternativas_questoes1_idx` (`questoes_id`);

--
-- Índices de tabela `dicas`
--
ALTER TABLE `dicas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dicas_questoes1_idx` (`questoes_id`);

--
-- Índices de tabela `fases`
--
ALTER TABLE `fases`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `jogadores`
--
ALTER TABLE `jogadores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `jogadores_has_itens`
--
ALTER TABLE `jogadores_has_itens`
  ADD PRIMARY KEY (`jogadores_id`,`itens_codigo`),
  ADD KEY `fk_jogadores_has_itens_itens1_idx` (`itens_codigo`),
  ADD KEY `fk_jogadores_has_itens_jogadores1_idx` (`jogadores_id`);

--
-- Índices de tabela `jogadores_has_questoes`
--
ALTER TABLE `jogadores_has_questoes`
  ADD PRIMARY KEY (`jogadores_id`,`questoes_id`),
  ADD KEY `fk_jogadores_has_questoes_questoes1_idx` (`questoes_id`),
  ADD KEY `fk_jogadores_has_questoes_jogadores1_idx` (`jogadores_id`);

--
-- Índices de tabela `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_logins_jogadores_idx` (`jogadores_id`);

--
-- Índices de tabela `questoes`
--
ALTER TABLE `questoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_questoes_fases1_idx` (`fases_codigo`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'Números identificadores dos usuários administradores.';
--
-- AUTO_INCREMENT de tabela `alternativas`
--
ALTER TABLE `alternativas`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'Números identificadores das alternativas.', AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de tabela `dicas`
--
ALTER TABLE `dicas`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'Números identificadores das dicas das questões.';
--
-- AUTO_INCREMENT de tabela `fases`
--
ALTER TABLE `fases`
  MODIFY `codigo` tinyint(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'Códigos de identificação das fases.', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `itens`
--
ALTER TABLE `itens`
  MODIFY `codigo` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'Códigos de identificação dos itens.';
--
-- AUTO_INCREMENT de tabela `jogadores`
--
ALTER TABLE `jogadores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Números identificadores dos usuários.', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de tabela `logins`
--
ALTER TABLE `logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Números identificadores dos logins.';
--
-- AUTO_INCREMENT de tabela `questoes`
--
ALTER TABLE `questoes`
  MODIFY `id` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'Números identificadores das questões.', AUTO_INCREMENT=7;
--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `alternativas`
--
ALTER TABLE `alternativas`
  ADD CONSTRAINT `fk_alternativas_questoes1` FOREIGN KEY (`questoes_id`) REFERENCES `questoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `dicas`
--
ALTER TABLE `dicas`
  ADD CONSTRAINT `fk_dicas_questoes1` FOREIGN KEY (`questoes_id`) REFERENCES `questoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `jogadores_has_itens`
--
ALTER TABLE `jogadores_has_itens`
  ADD CONSTRAINT `fk_jogadores_has_itens_itens1` FOREIGN KEY (`itens_codigo`) REFERENCES `itens` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_jogadores_has_itens_jogadores1` FOREIGN KEY (`jogadores_id`) REFERENCES `jogadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `jogadores_has_questoes`
--
ALTER TABLE `jogadores_has_questoes`
  ADD CONSTRAINT `fk_jogadores_has_questoes_jogadores1` FOREIGN KEY (`jogadores_id`) REFERENCES `jogadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_jogadores_has_questoes_questoes1` FOREIGN KEY (`questoes_id`) REFERENCES `questoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `logins`
--
ALTER TABLE `logins`
  ADD CONSTRAINT `fk_logins_jogadores` FOREIGN KEY (`jogadores_id`) REFERENCES `jogadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `questoes`
--
ALTER TABLE `questoes`
  ADD CONSTRAINT `fk_questoes_fases1` FOREIGN KEY (`fases_codigo`) REFERENCES `fases` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
