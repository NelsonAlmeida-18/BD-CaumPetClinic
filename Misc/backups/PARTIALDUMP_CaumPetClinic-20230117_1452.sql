-- MySQL dump 10.13  Distrib 8.0.31, for macos13.0 (arm64)
--
-- Host: localhost    Database: CaumPetClinic
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `Pedido`
--

DROP TABLE IF EXISTS `Pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedido` (
  `idPedido` int NOT NULL,
  `dataEstimadaRecolha` date NOT NULL,
  `dataEfetivaRecolha` date DEFAULT NULL,
  `dataEstimadaEntrega` date NOT NULL,
  `dataEfetivaEntrega` date DEFAULT NULL,
  `avaliacao` int DEFAULT NULL,
  `custoFinal` float NOT NULL,
  `Animal_idAnimal` int NOT NULL,
  `Servico_idServico` int NOT NULL,
  `Funcionario_NIF` int NOT NULL,
  `Clinica_idClinica` int NOT NULL,
  PRIMARY KEY (`idPedido`,`Animal_idAnimal`,`Servico_idServico`,`Funcionario_NIF`,`Clinica_idClinica`),
  UNIQUE KEY `idPedido_UNIQUE` (`idPedido`),
  KEY `fk_Pedido_Animal1_idx` (`Animal_idAnimal`),
  KEY `fk_Pedido_Servico1_idx` (`Servico_idServico`),
  KEY `fk_Pedido_Funcionario1_idx` (`Funcionario_NIF`),
  KEY `fk_Pedido_Clinica1_idx` (`Clinica_idClinica`),
  CONSTRAINT `fk_Pedido_Animal1` FOREIGN KEY (`Animal_idAnimal`) REFERENCES `Animal` (`idAnimal`),
  CONSTRAINT `fk_Pedido_Clinica1` FOREIGN KEY (`Clinica_idClinica`) REFERENCES `Clinica` (`idClinica`),
  CONSTRAINT `fk_Pedido_Funcionario1` FOREIGN KEY (`Funcionario_NIF`) REFERENCES `Funcionario` (`NIF`),
  CONSTRAINT `fk_Pedido_Servico1` FOREIGN KEY (`Servico_idServico`) REFERENCES `Servico` (`idServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido`
--

LOCK TABLES `Pedido` WRITE;
/*!40000 ALTER TABLE `Pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `NIF` int NOT NULL,
  `nome` varchar(150) NOT NULL,
  `dataDeNascimento` date NOT NULL,
  `pontos` int NOT NULL,
  `Morada_idMorada` int NOT NULL,
  `Contacto_idContacto` int NOT NULL,
  PRIMARY KEY (`NIF`,`Morada_idMorada`,`Contacto_idContacto`),
  UNIQUE KEY `idCliente_UNIQUE` (`NIF`),
  KEY `fk_Cliente_Morada1_idx` (`Morada_idMorada`),
  KEY `fk_Cliente_Contacto1_idx` (`Contacto_idContacto`),
  CONSTRAINT `fk_Cliente_Contacto1` FOREIGN KEY (`Contacto_idContacto`) REFERENCES `Contacto` (`idContacto`),
  CONSTRAINT `fk_Cliente_Morada1` FOREIGN KEY (`Morada_idMorada`) REFERENCES `Morada` (`idMorada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (24664643,'Manuel Silva Ribeiro Almeida','1986-02-24',33,55,55),(47556494,'Maria Martins Francisco Nunes','2000-02-29',55,51,51),(57696219,'Margarida Gomes Gomes Mendes','1998-07-25',12,53,53),(63500289,'Miguel Francisco','1974-02-17',96,54,54),(82984838,'Benedita Ferreira Santos','1995-11-08',31,56,56),(134637184,'João Pereira Francisco','1974-07-04',40,57,57),(231316574,'Isabel Santos','1993-04-25',48,52,52);
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Animal`
--

DROP TABLE IF EXISTS `Animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Animal` (
  `idAnimal` int NOT NULL,
  `nome` varchar(150) NOT NULL,
  `peso` double NOT NULL,
  `dataDeNascimento` date NOT NULL,
  `especie` varchar(150) NOT NULL,
  `raca` varchar(150) NOT NULL,
  `historico` varchar(150) DEFAULT NULL,
  `Cliente_NIF` int NOT NULL,
  PRIMARY KEY (`idAnimal`,`Cliente_NIF`),
  UNIQUE KEY `idAnimal_UNIQUE` (`idAnimal`),
  KEY `fk_Animal_Cliente_idx` (`Cliente_NIF`),
  CONSTRAINT `fk_Animal_Cliente` FOREIGN KEY (`Cliente_NIF`) REFERENCES `Cliente` (`NIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animal`
--

LOCK TABLES `Animal` WRITE;
/*!40000 ALTER TABLE `Animal` DISABLE KEYS */;
INSERT INTO `Animal` VALUES (0,'Piruças',40,'2010-06-20','C.Lupus','Golden Retriever','Vacinas: Hepatite Canina, Raiva, Tosse de Canil. Animal esterlizado a 2018-02-10.',134637184),(1,'Joaninha',5,'2011-10-24','C.Lupus','Yorkshire Terrier','Vacinas: Hepatite Canina, Raiva, Tosse de Canil.',134637184),(2,'Lucas',32,'2006-02-15','C.Lupus','Pastor Alemão','Vacinas: Hepatite Canina,Raiva, Tosse de Canil, Esgana, Leptospirose. Animal esterlizado a 2010-04-30. Pata partida a 2020-05-14',82984838),(3,'Cumba',6,'2010-01-28','C.Lupus','Europeu Comum','Vacinas: Calicivírus felino, FIV, FELV, Raiva',63500289),(4,'Budha',7,'2014-10-13','Felis Catus','Europeu Comum','Animal esterlizado a 2018-02-10',63500289),(5,'Jão',20,'2018-06-12','C.Lupus','Europeu Comum','Vacinas: Hepatite Canina,Raiva, Tosse de Canil',57696219),(6,'Princesa',3,'2019-12-24','Felis Catus','Siamês','Desparazitada a 2022-02-10',57696219),(7,'Simba',5,'2016-03-08','Felis Catus','Persa','',231316574),(8,'Flash',4,'2018-06-20','Cricetinae','Hamster Chinês','Desparazitada a 2020-08-12',231316574),(9,'Donatello',1,'2010-06-20','Testudines','Tartaruga-ninja','Consultas em dia',24664643),(10,'Michelangelo',1,'2010-06-20','Testudines','Tartaruga-ninja','Consultas em dia',24664643),(11,'Leonardo',1,'2010-06-20','Testudines','Tartaruga-ninja','Consultas em dia',24664643),(12,'Raphael',1,'2010-06-20','Testudines','Tartaruga-ninja','Consultas em dia',24664643),(13,'Splinter',1,'2010-10-24','Cricetinae','Hamster Chinês','Consultas em dia',24664643),(14,'Bolota',4,'2022-12-25','C.Lupus','Yorkshire Terrier','Vacinas: Tosse de Canil',47556494),(15,'Rolha',15,'2010-10-18','C.Lupus','Europeu Comum','Consultas em dia',47556494),(16,'Barreto',6,'2022-12-25','C.Lupus','Pastor Alemao','',47556494);
/*!40000 ALTER TABLE `Animal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-17 14:52:27
