-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ecommerce`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `ecommerce`;

--
-- Table structure for table `cliente_fisico`
--

DROP TABLE IF EXISTS `cliente_fisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_fisico` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` char(11) DEFAULT NULL,
  `edereco` varchar(45) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `id_pedido_cf_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `id_pedido_cf_fk` (`id_pedido_cf_fk`),
  CONSTRAINT `cliente_fisico_ibfk_1` FOREIGN KEY (`id_pedido_cf_fk`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_fisico`
--

LOCK TABLES `cliente_fisico` WRITE;
/*!40000 ALTER TABLE `cliente_fisico` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_fisico` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger deleta_usuario before delete on cliente_fisico
for each row 
begin
	insert into salva_informacoes_usuario(id_cliente, nome, cpf, edereco, data_nascimento, id_pedido_cf_fk)
    values (old.id_cliente, old.nome, old.cpf, old.edereco, old.data_nascimento, old.id_pedido_cf_fk);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cliente_juridico`
--

DROP TABLE IF EXISTS `cliente_juridico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_juridico` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(45) NOT NULL,
  `cnpj` char(14) DEFAULT NULL,
  `edereco` varchar(45) DEFAULT NULL,
  `id_pedido_cf_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `id_pedido_cf_fk` (`id_pedido_cf_fk`),
  CONSTRAINT `cliente_juridico_ibfk_1` FOREIGN KEY (`id_pedido_cf_fk`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_juridico`
--

LOCK TABLES `cliente_juridico` WRITE;
/*!40000 ALTER TABLE `cliente_juridico` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_juridico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibiliza_produto`
--

DROP TABLE IF EXISTS `disponibiliza_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibiliza_produto` (
  `id_fornecedores_dp_fk` int(11) DEFAULT NULL,
  `id_produto_dp_fk` int(11) DEFAULT NULL,
  KEY `id_produto_dp_fk` (`id_produto_dp_fk`),
  CONSTRAINT `disponibiliza_produto_ibfk_1` FOREIGN KEY (`id_produto_dp_fk`) REFERENCES `fornecedores` (`id_fornecedores`),
  CONSTRAINT `disponibiliza_produto_ibfk_2` FOREIGN KEY (`id_produto_dp_fk`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibiliza_produto`
--

LOCK TABLES `disponibiliza_produto` WRITE;
/*!40000 ALTER TABLE `disponibiliza_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `disponibiliza_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id_estoque` int(11) NOT NULL AUTO_INCREMENT,
  `local` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedores` (
  `id_fornecedores` int(11) NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(45) NOT NULL,
  `cnpj` varchar(45) NOT NULL,
  PRIMARY KEY (`id_fornecedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_pagamento` enum('Boleto','Cartão') NOT NULL,
  `status_pagamento` enum('Pago','Pendente') NOT NULL DEFAULT 'Pendente',
  `id_pedido_p_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `id_pedido_p_fk` (`id_pedido_p_fk`),
  CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_pedido_p_fk`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `satus` varchar(10) NOT NULL DEFAULT 'Pendente',
  `descricao` varchar(45) NOT NULL,
  `frete` float NOT NULL,
  `codigo_rastreio` varchar(45) NOT NULL,
  PRIMARY KEY (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'Pendente','nada',130,'11212121'),(2,'Pendente','nada',130,'11212121');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_em_estoque`
--

DROP TABLE IF EXISTS `produto_em_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_em_estoque` (
  `id_produto_pee_fk` int(11) DEFAULT NULL,
  `id_estoque_pee_fk` int(11) DEFAULT NULL,
  KEY `id_produto_pee_fk` (`id_produto_pee_fk`),
  KEY `id_estoque_pee_fk` (`id_estoque_pee_fk`),
  CONSTRAINT `produto_em_estoque_ibfk_1` FOREIGN KEY (`id_produto_pee_fk`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `produto_em_estoque_ibfk_2` FOREIGN KEY (`id_estoque_pee_fk`) REFERENCES `estoque` (`id_estoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_em_estoque`
--

LOCK TABLES `produto_em_estoque` WRITE;
/*!40000 ALTER TABLE `produto_em_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_em_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacao_produto_pedido`
--

DROP TABLE IF EXISTS `relacao_produto_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacao_produto_pedido` (
  `id_pedido_rpp_fk` int(11) DEFAULT NULL,
  `id_produto_rpp_fk` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  KEY `id_produto_rpp_fk` (`id_produto_rpp_fk`),
  KEY `id_pedido_rpp_fk` (`id_pedido_rpp_fk`),
  CONSTRAINT `relacao_produto_pedido_ibfk_1` FOREIGN KEY (`id_produto_rpp_fk`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `relacao_produto_pedido_ibfk_2` FOREIGN KEY (`id_pedido_rpp_fk`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacao_produto_pedido`
--

LOCK TABLES `relacao_produto_pedido` WRITE;
/*!40000 ALTER TABLE `relacao_produto_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacao_produto_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salva_informacoes_usuario`
--

DROP TABLE IF EXISTS `salva_informacoes_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salva_informacoes_usuario` (
  `id_cliente` int(11) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `edereco` varchar(45) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `id_pedido_cf_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salva_informacoes_usuario`
--

LOCK TABLES `salva_informacoes_usuario` WRITE;
/*!40000 ALTER TABLE `salva_informacoes_usuario` DISABLE KEYS */;
INSERT INTO `salva_informacoes_usuario` VALUES (3,'Ray','12345678911','Salto','2004-08-08',1),(4,'Ray','12345678911','Salto','2004-08-08',1);
/*!40000 ALTER TABLE `salva_informacoes_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor_terceiro`
--

DROP TABLE IF EXISTS `vendedor_terceiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor_terceiro` (
  `id_terceiro` int(11) NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(45) NOT NULL,
  PRIMARY KEY (`id_terceiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor_terceiro`
--

LOCK TABLES `vendedor_terceiro` WRITE;
/*!40000 ALTER TABLE `vendedor_terceiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor_terceiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor_vende_produto`
--

DROP TABLE IF EXISTS `vendedor_vende_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor_vende_produto` (
  `id_produto_vvp_fk` int(11) NOT NULL,
  `id_terceiro_vvp_fk` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  KEY `id_produto_vvp_fk` (`id_produto_vvp_fk`),
  KEY `id_terceiro_vvp_fk` (`id_terceiro_vvp_fk`),
  CONSTRAINT `vendedor_vende_produto_ibfk_1` FOREIGN KEY (`id_produto_vvp_fk`) REFERENCES `produto` (`id_produto`),
  CONSTRAINT `vendedor_vende_produto_ibfk_2` FOREIGN KEY (`id_terceiro_vvp_fk`) REFERENCES `vendedor_terceiro` (`id_terceiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor_vende_produto`
--

LOCK TABLES `vendedor_vende_produto` WRITE;
/*!40000 ALTER TABLE `vendedor_vende_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor_vende_produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-17  0:40:23
