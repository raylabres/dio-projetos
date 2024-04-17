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

--
-- Dumping events for database 'ecommerce'
--

--
-- Dumping routines for database 'ecommerce'
--

--
-- Current Database: `company_constraints`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `company_constraints` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `company_constraints`;

--
-- Table structure for table `departament`
--

DROP TABLE IF EXISTS `departament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departament` (
  `Dname` varchar(15) NOT NULL,
  `Dnumber` int(11) NOT NULL,
  `Mgr_ssn` char(9) DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  `Dept_create_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `unique_name_dept` (`Dnumber`),
  KEY `fk_departament` (`Mgr_ssn`),
  KEY `index_departament` (`Dnumber`),
  CONSTRAINT `fk_departament` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`) ON UPDATE CASCADE,
  CONSTRAINT `chk_date_dept` CHECK (`Dept_create_date` < `Mgr_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departament`
--

LOCK TABLES `departament` WRITE;
/*!40000 ALTER TABLE `departament` DISABLE KEYS */;
INSERT INTO `departament` VALUES ('Departamento A',0,'123456789','2023-01-01','2022-12-31'),('Headquarters',1,'222333111','2010-11-08','2005-08-15'),('Administration',4,'987456123','2024-01-01','2000-01-01'),('Research',5,'123456789','1988-05-22','1980-01-01'),('Departamento A',1111,'123456789','2023-01-01','2022-12-31');
/*!40000 ALTER TABLE `departament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `Essn` char(9) NOT NULL,
  `Dependent_name` varchar(15) NOT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES ('123456789','Angelina','F','1965-05-09','Spouse'),('123456789','Joyce','F','2010-10-10','Daughter'),('123456789','Pedro','M','2008-08-01','Son'),('222333111','Andressa','F','2010-10-10','Daughter'),('555667888','Jessica','F','2015-06-27','Daughter');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_locations` (
  `Dnumber` int(11) NOT NULL,
  `Dlocation` varchar(15) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  KEY `index_numero_departamento_localizacao` (`Dnumber`),
  CONSTRAINT `fk_dpt_locations` FOREIGN KEY (`Dnumber`) REFERENCES `departament` (`Dnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
INSERT INTO `dept_locations` VALUES (1,'Salto'),(4,'Salto'),(5,'Houston'),(5,'Salto');
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `fname` varchar(15) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `Ssn` char(9) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(9) DEFAULT NULL,
  `Dno` int(11) NOT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `index_employee` (`Ssn`),
  KEY `index_manager` (`Super_ssn`),
  CONSTRAINT `fk_employe` FOREIGN KEY (`Super_ssn`) REFERENCES `employee` (`Ssn`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chk_salary_employee` CHECK (`Salary` > 2000.0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('Fulaninho','B','Smith','123123555','1964-01-01','Salto Jardim São João','M',10000.00,'123456789',5),('Maria','B','Smith','123321123','1965-08-10','Salto Jardim São João','M',5000.00,'987456123',5),('Jonh','J','Math','123456789','1965-01-09','Salto Jardim São João','M',5000.00,NULL,4),('Helio','H','Labres','222333111','1984-02-11','Salto Jardim São João','M',5000.00,'123456789',4),('Michael','J','Johnson','234567890','1988-12-10','Salto Jardim São João','M',5000.00,'123456789',5),('Emily','E','Rizo','444555667','2005-10-21','Salto Jardim São João','M',5000.00,'123456789',4),('João','S','Silva','555222111','2000-05-15','Rua Principal, 123','M',3000.00,'987456123',4),('Pedro','P','Silva','555555555','2000-10-10','Salto Jardim São João','M',10000.00,'123456789',5),('Rubiana','R','Souza','555667888','1984-03-15','Salto Jardim São João','M',5000.00,'987456123',4),('Ryan','R','Labres','556611223','2010-10-27','Salto Jardim São João','M',5000.00,NULL,4),('Joana','J','Silva','717171711','1990-08-10','Salto Jardim São João','M',5000.00,'987456123',1),('Beltrano','B','Smith','773123555','1964-01-01','Salto Jardim São João','M',5000.00,'123456789',5),('Raissa','R','Labres','888991222','2007-10-19','Salto Jardim São João','M',5000.00,'222333111',4),('Amanda','A','Oliveira','901122338','2000-08-10','Salto Jardim São João','M',5000.00,'987456123',4),('Maria','B','Smith','919191919','1965-08-10','Salto Jardim São João','M',5000.00,'987456123',5),('Ray','R','Labres','987456123','2004-08-08','Salto Jardim São João','M',5000.00,'123456789',4);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger mgr_dept_check before insert on employee
for each row
	begin
		case new.Dno
			when 1 then set new.Super_ssn = '222333111';
            when 2 then set new.Super_ssn = null;
            when 3 then set new.Super_ssn = null;
            when 4 then set new.Super_ssn = '987456123';
            when 5 then set new.Super_ssn = '123456789';
		end case;
	end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger null_value_check after insert on employee
for each row
	begin
		if (new.Address is null) then 
			insert into usuarios_mensagens (mensagem, ssn) values ('Update your addres, please', new.ssn);
		end if;
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger atualiza_salario before update on employee
for each row
begin
    set new.salary = 10000.00;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `employee_salary_view`
--

DROP TABLE IF EXISTS `employee_salary_view`;
/*!50001 DROP VIEW IF EXISTS `employee_salary_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_salary_view` AS SELECT 
 1 AS `Nome`,
 1 AS `Salary`,
 1 AS `Dept_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `gerente_dependente`
--

DROP TABLE IF EXISTS `gerente_dependente`;
/*!50001 DROP VIEW IF EXISTS `gerente_dependente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gerente_dependente` AS SELECT 
 1 AS `Nome_gerente`,
 1 AS `Nome_dependent`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lista_dept_gerentes`
--

DROP TABLE IF EXISTS `lista_dept_gerentes`;
/*!50001 DROP VIEW IF EXISTS `lista_dept_gerentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lista_dept_gerentes` AS SELECT 
 1 AS `Gerente`,
 1 AS `Nome_departamento`,
 1 AS `Numero_departamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `n_funcionario_dept_localidade`
--

DROP TABLE IF EXISTS `n_funcionario_dept_localidade`;
/*!50001 DROP VIEW IF EXISTS `n_funcionario_dept_localidade`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `n_funcionario_dept_localidade` AS SELECT 
 1 AS `Numero_funcionario`,
 1 AS `Departamento`,
 1 AS `Localizacao`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderNumbers` int(11) NOT NULL,
  `orderDate` date DEFAULT NULL,
  `requiredDate` date DEFAULT NULL,
  `shippedDate` date DEFAULT NULL,
  `orderStatus` enum('DESPACHADO','EM PROGRESSO','ENTREGUE') DEFAULT NULL,
  `customer` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderNumbers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Pname` varchar(15) NOT NULL,
  `Pnumber` int(11) NOT NULL,
  `Plocation` varchar(15) DEFAULT NULL,
  `Dnum` int(11) NOT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `unique_project` (`Pname`),
  KEY `fk_project` (`Dnum`),
  CONSTRAINT `fk_project` FOREIGN KEY (`Dnum`) REFERENCES `departament` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('ProductX',1,'Houston',5),('ProductY',2,'Salto',4),('ProductZ',3,'Salto',1),('Computerization',8,'Salto',4),('Inovation',10,'Salto',1),('Reorganization',20,'Salto',5);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `projeto_departamento_gerentes`
--

DROP TABLE IF EXISTS `projeto_departamento_gerentes`;
/*!50001 DROP VIEW IF EXISTS `projeto_departamento_gerentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `projeto_departamento_gerentes` AS SELECT 
 1 AS `Gerente`,
 1 AS `Nome_departamento`,
 1 AS `pname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `projeto_maior_numero_funcionario`
--

DROP TABLE IF EXISTS `projeto_maior_numero_funcionario`;
/*!50001 DROP VIEW IF EXISTS `projeto_maior_numero_funcionario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `projeto_maior_numero_funcionario` AS SELECT 
 1 AS `nome_projeto`,
 1 AS `Numero_empregado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `relacao_employees_salary_8000_view`
--

DROP TABLE IF EXISTS `relacao_employees_salary_8000_view`;
/*!50001 DROP VIEW IF EXISTS `relacao_employees_salary_8000_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `relacao_employees_salary_8000_view` AS SELECT 
 1 AS `Nome`,
 1 AS `Salary`,
 1 AS `Dept_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Ray','ray@gmail.com','25f9e794323b453885f5181f1b624d0b','2024-04-08 07:45:39'),(2,'João','joao@gmail.com','25f9e794323b453885f5181f1b624d0b','2024-04-08 07:46:27'),(3,'João','joao@gmail.com','25f9e794323b453885f5181f1b624d0b','2024-04-08 07:46:54'),(4,'João','joao@gmail.com','25f9e794323b453885f5181f1b624d0b','2024-04-08 07:47:31');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_mensagens`
--

DROP TABLE IF EXISTS `usuarios_mensagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_mensagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mensagem` varchar(100) DEFAULT NULL,
  `ssn` char(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ssn_messages` (`ssn`),
  CONSTRAINT `fk_ssn_messages` FOREIGN KEY (`ssn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_mensagens`
--

LOCK TABLES `usuarios_mensagens` WRITE;
/*!40000 ALTER TABLE `usuarios_mensagens` DISABLE KEYS */;
INSERT INTO `usuarios_mensagens` VALUES (1,'Update your addres, please','773123555'),(2,'Update your addres, please','234567890');
/*!40000 ALTER TABLE `usuarios_mensagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `Essn` char(9) NOT NULL,
  `Pno` int(11) NOT NULL,
  `Hours` decimal(3,1) NOT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `fk_works_on_project` (`Pno`),
  CONSTRAINT `fk_works_on_employee` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `fk_works_on_project` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES ('123456789',1,10.0),('123456789',3,7.5),('123456789',10,50.0),('123456789',20,10.0),('222333111',20,40.0),('444555667',1,17.0),('444555667',2,25.0),('555667888',2,23.0),('556611223',1,45.9),('888991222',3,28.8),('987456123',1,10.0),('987456123',2,10.0),('987456123',3,10.0);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'company_constraints'
--

--
-- Dumping routines for database 'company_constraints'
--
/*!50003 DROP PROCEDURE IF EXISTS `info_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `info_employee`()
begin 
	select * from employee inner join departament on Ssn = Mgr_ssn;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_dados_departament` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_dados_departament`(
	in dname_p varchar(15),
    in dnumber_p int,
    in mgr_ssn_p char(9),
    in mgr_start_date_p date,
    in depte_create_date_p date
)
begin
	declare exit handler for sqlexception
    begin
		select 'Erro ao inserir dados' as mensagem;
		rollback;
        resignal;
	end;
    start transaction;
    INSERT INTO departament (Dname, Dnumber, Mgr_ssn, Mgr_start_date, Dept_create_date) 
    VALUES (dname_p, dnumber_p, mgr_ssn_p, mgr_start_date_p, depte_create_date_p);
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_into_employee_proc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_into_employee_proc`(
	in fname_p varchar(15), 
    in minit_p char(1), 
    in lname_p varchar(15), 
    in ssn_p char(9), 
    in bdate_p date, 
    in address_p varchar(30), 
    in sex_p char(1), 
    in salary_p decimal(10, 2), 
    in super_ssn_p char(9), 
    in dno_p int
)
begin
    insert into employee (fname, minit, lname, ssn, bdate, address, sex, salary, super_ssn, dno)
    -- values ('Maria', 'B', 'Smith', '91919191911', '1965-08-10', 'Fondren-Houston-TX', 'F', '35000.00', '987456123', '5');
    values (fname_p, minit_p, lname_p, ssn_p, bdate_p, address_p, sex_p, salary_p, super_ssn_p, dno_p);
	
    select * from employee where ssn = ssn_p;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manipulacao_dados_employee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manipulacao_dados_employee`(
	opcao_p int ,
	fname_p varchar(15),
	minit_p char(1),
	lname_p varchar(15),
	ssn_p	char(9),
	bdate_p date,
	address_p varchar(30),
	sex_p char(1),
	salary_p decimal(10,2),
	super_ssn_p char(9),
	dno_p int(11)
)
begin
    -- Definir valores padrão para os parâmetros se forem NULL
	if opcao_p = 1 then
		select * from employee;
	elseif opcao_p = 2 then
		insert into employee (fname, minit, lname, ssn, bdate, sex, salary, super_ssn, dno) values (fname_p, minit_p, lname_p, ssn_p, bdate_p, sex_p, salary_p, super_ssn_p, dno_p);
	elseif opcao_p = 3 then
		update employee set sex = sex_p, address = address_p, salary = salary_p;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_insert`(
    nome_p varchar(20), 
    email_p varchar(20),
    senha_p varchar(20)
)
begin
	if (length(senha_p) < 10 and length(senha_p) > 7) then
		insert into usuario(nome, email, senha, data_cadastro) 
		values (nome_p, email_p, md5(senha_p), now());
		select * from usuario where email_p = email;
	else
		select 'Forneça uma senha mais forte!' as message_error;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `ecommerce`
--

USE `ecommerce`;

--
-- Current Database: `company_constraints`
--

USE `company_constraints`;

--
-- Final view structure for view `employee_salary_view`
--

/*!50001 DROP VIEW IF EXISTS `employee_salary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_salary_view` AS select concat(`e`.`fname`,' ',`e`.`Lname`) AS `Nome`,`e`.`Salary` AS `Salary`,`e`.`Dno` AS `Dept_number` from (`employee` `e` join `dependent` `d`) where `d`.`Essn` = `e`.`Ssn` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `gerente_dependente`
--

/*!50001 DROP VIEW IF EXISTS `gerente_dependente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gerente_dependente` AS select concat(`e`.`fname`,' ',`e`.`Lname`) AS `Nome_gerente`,`d`.`Dependent_name` AS `Nome_dependent` from ((`employee` `e` join `dependent` `d` on(`e`.`Ssn` = `d`.`Essn`)) join `departament` `dp` on(`e`.`Ssn` = `dp`.`Mgr_ssn`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lista_dept_gerentes`
--

/*!50001 DROP VIEW IF EXISTS `lista_dept_gerentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lista_dept_gerentes` AS select concat(`e`.`fname`,' ',`e`.`Lname`) AS `Gerente`,`d`.`Dname` AS `Nome_departamento`,`d`.`Dnumber` AS `Numero_departamento` from (`departament` `d` join `employee` `e` on(`d`.`Mgr_ssn` = `e`.`Ssn`)) group by `d`.`Mgr_ssn` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `n_funcionario_dept_localidade`
--

/*!50001 DROP VIEW IF EXISTS `n_funcionario_dept_localidade`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `n_funcionario_dept_localidade` AS select count(0) AS `Numero_funcionario`,`d`.`Dname` AS `Departamento`,`dl`.`Dlocation` AS `Localizacao` from ((`employee` `e` join `departament` `d` on(`e`.`Dno` = `d`.`Dnumber`)) join `dept_locations` `dl` on(`d`.`Dnumber` = `dl`.`Dnumber`)) group by `d`.`Dname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `projeto_departamento_gerentes`
--

/*!50001 DROP VIEW IF EXISTS `projeto_departamento_gerentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `projeto_departamento_gerentes` AS select concat(`e`.`fname`,' ',`e`.`Lname`) AS `Gerente`,`d`.`Dname` AS `Nome_departamento`,`pj`.`Pname` AS `pname` from ((`departament` `d` join `employee` `e` on(`d`.`Mgr_ssn` = `e`.`Ssn`)) join `project` `pj` on(`pj`.`Dnum` = `d`.`Dnumber`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `projeto_maior_numero_funcionario`
--

/*!50001 DROP VIEW IF EXISTS `projeto_maior_numero_funcionario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `projeto_maior_numero_funcionario` AS select `p`.`Pname` AS `nome_projeto`,count(0) AS `Numero_empregado` from (`project` `p` join `employee` `e` on(`p`.`Dnum` = `e`.`Dno`)) group by `p`.`Pname` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `relacao_employees_salary_8000_view`
--

/*!50001 DROP VIEW IF EXISTS `relacao_employees_salary_8000_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `relacao_employees_salary_8000_view` AS select concat(`employee`.`fname`,' ',`employee`.`Lname`) AS `Nome`,`employee`.`Salary` AS `Salary`,`employee`.`Dno` AS `Dept_number` from `employee` where `employee`.`Salary` > 8000 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-17  0:45:52
