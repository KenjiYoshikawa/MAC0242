-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: projetoBD
-- ------------------------------------------------------
-- Server version	5.5.31-0+wheezy1
-- Autor: André Meneghelli Vale

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
CREATE TABLE `cidade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_estado` int(10) unsigned NOT NULL,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_estado` (`id_estado`),
  CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1591 DEFAULT CHARSET=utf8;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE `estado` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sigla` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Table structure for table `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
CREATE TABLE `fabricante` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `homepage` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE `fornecedor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cidade` int(10) unsigned NOT NULL,
  `nome` varchar(255) NOT NULL,
  `homepage` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `numero` int(11) NOT NULL,
  `cep` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cidade` (`id_cidade`),
  CONSTRAINT `fornecedor_ibfk_1` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_projeto` int(10) unsigned NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_projeto` (`id_projeto`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_projeto`) REFERENCES `projeto` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Table structure for table `produto_acesso`
--

DROP TABLE IF EXISTS `produto_acesso`;
CREATE TABLE `produto_acesso` (
  `id_produto` int(10) unsigned NOT NULL,
  `data` datetime NOT NULL,
  `url_origem` varchar(255) NOT NULL,
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `produto_acesso_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `produto_comentario`
--

DROP TABLE IF EXISTS `produto_comentario`;
CREATE TABLE 'produto_comentario' (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_produto` int(10) unsigned NOT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  `data` datetime NOT NULL,
  `comentario` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_projeto` (`id_produto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `produto_comentario_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `produto_comentario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Table structure for table `produto_fabricante`
--

DROP TABLE IF EXISTS `produto_fabricante`;
CREATE TABLE `produto_fabricante` (
  `id_produto` int(10) unsigned NOT NULL,
  `id_fabricante` int(10) unsigned NOT NULL,
  KEY `id_produto` (`id_produto`),
  KEY `id_fabricante` (`id_fabricante`),
  CONSTRAINT `produto_fabricante_ibfk_3` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produto_fabricante_ibfk_4` FOREIGN KEY (`id_fabricante`) REFERENCES `fabricante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `produto_fornecedor`
--

DROP TABLE IF EXISTS `produto_fornecedor`;
CREATE TABLE `produto_fornecedor` (
  `id_produto` int(10) unsigned NOT NULL,
  `id_fornecedor` int(10) unsigned NOT NULL,
  KEY `id_produto` (`id_produto`),
  KEY `id_fornecedor` (`id_fornecedor`),
  CONSTRAINT `produto_fornecedor_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produto_fornecedor_ibfk_2` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
CREATE TABLE `projeto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) unsigned NOT NULL,
  `id_cidade` int(10) unsigned NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_cidade` (`id_cidade`),
  CONSTRAINT `projeto_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `projeto_ibfk_2` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Table structure for table `projeto_acesso`
--

DROP TABLE IF EXISTS `projeto_acesso`;
CREATE TABLE `projeto_acesso` (
  `id_projeto` int(10) unsigned NOT NULL,
  `data` datetime NOT NULL,
  `url_origem` varchar(255) NOT NULL,
  KEY `id_projeto` (`id_projeto`),
  CONSTRAINT `projeto_acesso_ibfk_1` FOREIGN KEY (`id_projeto`) REFERENCES `projeto` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `projeto_comentario`
--

DROP TABLE IF EXISTS `projeto_comentario`;
CREATE TABLE `projeto_comentario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_projeto` int(10) unsigned NOT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  `data` datetime NOT NULL,
  `comentario` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_projeto` (`id_projeto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `projeto_comentario_ibfk_1` FOREIGN KEY (`id_projeto`) REFERENCES `projeto` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `projeto_comentario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
CREATE TABLE `registro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `registro_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identificador único para cada usuário cadastrado do sistema.',
  `tipo` enum('arquiteto','comum','administrador') NOT NULL DEFAULT 'comum' COMMENT 'Tipos de usuários que acessam o sistema.',
  `senha` char(32) NOT NULL COMMENT 'Senha de acesso deste usuário',
  `semente` char(3) NOT NULL COMMENT 'Semente para povoar o gerador do código MD5 da senha junto com a senha original do usuário.',
  `email` varchar(255) NOT NULL COMMENT 'Email deste usuário, será utilizado para recuperar senhas, envio de informações e também como método de login.',
  `nome` varchar(255) NOT NULL COMMENT 'Nome do usuário.',
  `homepage` varchar(255) NOT NULL COMMENT 'Homepage do usuário, usado para linkar os comentários do usuário a uma página de sua escolha.',
  `CREA` varchar(255) NOT NULL COMMENT 'Número do CREA quando o usuário for um arquiteto.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

