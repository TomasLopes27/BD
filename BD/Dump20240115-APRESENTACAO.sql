CREATE DATABASE  IF NOT EXISTS `gestaoeventos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gestaoeventos`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: gestaoeventos
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `NIF` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Contacto` int NOT NULL,
  `Email` varchar(45) NOT NULL,
  `CodigoPostal` varchar(8) NOT NULL,
  PRIMARY KEY (`NIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (211234567,'António Silva',912345678,'antonio.silva@gmail.com','5678-901'),(214641279,'Pedro Santos',929412711,'pedro.santos@gmail.com','5510-803'),(223456789,'Rodrigo Álvaro',960746827,'ralvaro@gmail.com','4700,760'),(225548731,'Hugo Martins',917654321,'hugo.martins@gmail.com','1234-567'),(231467892,'Rita Pereira',926734567,'rita.pereira@gmail.com','8765-432'),(232509137,'Miguel Vítor',962183167,'miguelpvitor28@gmail,com','4700-472'),(242733844,'Joana Lemos',918336754,'joanalemos14@gmail.com','4761-279'),(242985203,'Ana Silva',913998325,'ana.silva@gmail.com','3741-984'),(261239142,'Tomás Lopes',918275454,'tlopesoliveira@gmail.com','6451-263'),(262014890,'Carlos Oliveira',968506512,'carlos.oliveira@gmail.com','4689-113'),(277731864,'Luisa Ferreira',925876543,'luisa.ferreira@gmail.com','9876-543'),(282189416,'Luís Ribeiro',931674826,'luisrb@gmail.com','8492-548'),(288654321,'João Santos',911987654,'joao.santos@gmail.com','2345-678'),(288888888,'Sofia Santos',926789012,'sofia.santos1@gmail.com','3456-789'),(295429496,'Marta Pereira',938285429,'marta.pereira@gmail.com','6466-607'),(299876543,'Maria Oliveira',917654321,'maria.oliveira@gmail.com','1234-567');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `espaco`
--

DROP TABLE IF EXISTS `espaco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `espaco` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Capacidade` int NOT NULL,
  `Descricao` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `espaco`
--

LOCK TABLES `espaco` WRITE;
/*!40000 ALTER TABLE `espaco` DISABLE KEYS */;
INSERT INTO `espaco` VALUES (1,'Altice Arena Braga',12000,'O Pavilhão Altice Forum Braga é uma sala polivalente e flexível, sendo a 2ª maior sala de espetáculos do país.'),(2,'Super Bock Arena',8500,'Espaço multiusos para todo o tipo de espectáculos, eventos culturais, desportivos, congressos e outras iniciativas empresariais.'),(3,'Multiusos de Guimarães',7000,'O Multiusos de Guimarães tem uma polivalência que lhe permite acolher grandes competições desportivas, concertos, feiras, exposições e congressos.'),(4,'Pavilhao Vermelho',5000,'Um espaço versátil para eventos de médio porte.'),(5,'Centro de Convenções',3000,'Ideal para conferências e apresentações.'),(6,'Salão Nobre',200,'Um ambiente elegante para eventos especiais.'),(7,'Centro de Exposições',1000,'Espaço dedicado a exposições e feiras.'),(8,'Pavilhão Rosa Mota',6500,'Espaço para todo o tipo de eventos'),(9,'Palácio das Artes',500,'Um local culturalmente rico, adequado para concertos, peças teatrais e exposições de arte.'),(10,'Arena do Norte',6000,'Espaço moderno e versátil, ideal para eventos desportivos, concertos e grandes espetáculos.');
/*!40000 ALTER TABLE `espaco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Descricao` varchar(200) NOT NULL,
  `Estado` varchar(15) NOT NULL,
  `DataEvento` date NOT NULL,
  `Lotacao` int NOT NULL,
  `PrecoBilhete` decimal(4,2) DEFAULT NULL,
  `IdadeMinima` int DEFAULT NULL,
  `Cliente_NIF` int NOT NULL,
  `Funcionario_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `nome_evento` (`Nome`),
  KEY `evento_ibfk_1` (`Cliente_NIF`),
  KEY `evento_ibfk_2` (`Funcionario_ID`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`Cliente_NIF`) REFERENCES `cliente` (`NIF`),
  CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`Funcionario_ID`) REFERENCES `funcionario` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Conferência Anual','Evento de grande escala','Ativo','2024-02-01',750,20.00,18,242985203,18),(2,'Workshop de Tecnologia','Aprendizado prático','Ativo','2024-01-15',1200,15.00,21,262014890,12),(3,'Reunião de Negócios','Networking e colaboração','Finalizado','2023-10-20',400,10.00,25,295429496,8),(4,'Feira de Tecnologia','Exibição de novas tecnologias','Ativo','2024-07-25',500,10.00,16,225548731,3),(5,'Concerto Beneficente','Arrecadação de fundos para a caridade','Finalizado','2023-08-10',800,15.00,20,277731864,19),(6,'Lançamento de Produto','Apresentação do novo produto','Finalizado','2023-06-08',670,25.00,21,231467892,16),(7,'Workshop de Arte','Explorando a criatividade','Ativo','2024-05-18',80,12.00,13,288654321,14),(8,'Exposição de Fotografia','Mostra de talentos fotográficos locais','Finalizado','2023-04-05',150,8.00,15,231467892,2),(9,'Concurso de Startups','Apresentação de ideias inovadoras','Ativo','2024-03-12',4000,10.00,18,232509137,7),(10,'Palestra de Sustentabilidade','Discussão sobre práticas sustentáveis','Ativo','2024-09-22',250,5.00,12,242985203,1),(11,'Festival de Comédia','Noite de risadas com comediantes locais','Ativo','2024-06-30',800,18.00,16,214641279,4),(12,'Competição de Dança','Show de talentos em dança','Ativo','2024-11-15',3000,12.00,15,223456789,13),(13,'Conferência de Inovação','Explorando novas fronteiras tecnológicas','Finalizado','2023-01-08',5000,25.00,18,288888888,17),(14,'Festival de Música Local','Destacando artistas musicais da região','Ativo','2025-04-20',2500,20.00,16,277731864,5),(15,'Feira de Gastronomia','Exploração de sabores locais','Finalizado','2023-03-01',1500,15.00,21,299876543,9),(16,'Concerto Acústico','Noite íntima de música acústica','Ativo','2025-02-12',120,22.00,18,211234567,6),(17,'Semana de Moda','Desfiles e tendências de moda','Ativo','2025-05-10',400,30.00,16,225548731,11);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_espaco`
--

DROP TABLE IF EXISTS `evento_espaco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento_espaco` (
  `Evento_ID` int NOT NULL,
  `Espaco_ID` int NOT NULL,
  PRIMARY KEY (`Evento_ID`,`Espaco_ID`),
  KEY `Espaco_ID` (`Espaco_ID`),
  CONSTRAINT `evento_espaco_ibfk_1` FOREIGN KEY (`Evento_ID`) REFERENCES `evento` (`ID`),
  CONSTRAINT `evento_espaco_ibfk_2` FOREIGN KEY (`Espaco_ID`) REFERENCES `espaco` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_espaco`
--

LOCK TABLES `evento_espaco` WRITE;
/*!40000 ALTER TABLE `evento_espaco` DISABLE KEYS */;
INSERT INTO `evento_espaco` VALUES (1,1),(2,2),(4,2),(14,2),(3,3),(15,3),(5,4),(9,4),(11,4),(6,5),(16,6),(10,7),(17,7),(13,8),(7,9),(8,9),(12,10);
/*!40000 ALTER TABLE `evento_espaco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_material`
--

DROP TABLE IF EXISTS `evento_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento_material` (
  `Evento_ID` int NOT NULL,
  `Material_ID` int NOT NULL,
  `Quantidade` int DEFAULT NULL,
  PRIMARY KEY (`Evento_ID`,`Material_ID`),
  KEY `Material_ID` (`Material_ID`),
  CONSTRAINT `evento_material_ibfk_1` FOREIGN KEY (`Evento_ID`) REFERENCES `evento` (`ID`),
  CONSTRAINT `evento_material_ibfk_2` FOREIGN KEY (`Material_ID`) REFERENCES `material` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_material`
--

LOCK TABLES `evento_material` WRITE;
/*!40000 ALTER TABLE `evento_material` DISABLE KEYS */;
INSERT INTO `evento_material` VALUES (1,1,50),(2,1,30),(3,2,300),(4,1,250),(4,2,200),(5,3,10),(5,8,4),(5,9,1),(6,4,15),(6,5,3),(7,10,15),(8,10,15),(8,18,6),(9,9,5),(10,3,5),(11,1,250),(11,3,1),(11,9,1),(11,21,15),(12,20,2),(13,4,20),(13,11,3),(14,20,4),(14,23,1),(15,22,2),(15,31,20),(16,3,10),(16,32,2),(16,33,2),(16,36,2),(17,1,250),(17,13,3);
/*!40000 ALTER TABLE `evento_material` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `atualizar_materiais` AFTER INSERT ON `evento_material` FOR EACH ROW BEGIN
	UPDATE material
	SET Quantidade = Quantidade - NEW.Quantidade
	WHERE ID = NEW.Material_ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `eventos_ativos`
--

DROP TABLE IF EXISTS `eventos_ativos`;
/*!50001 DROP VIEW IF EXISTS `eventos_ativos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `eventos_ativos` AS SELECT 
 1 AS `Nome`,
 1 AS `DataEvento`,
 1 AS `PrecoBilhete`,
 1 AS `IdadeMinima`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `eventos_finalizados`
--

DROP TABLE IF EXISTS `eventos_finalizados`;
/*!50001 DROP VIEW IF EXISTS `eventos_finalizados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `eventos_finalizados` AS SELECT 
 1 AS `Nome`,
 1 AS `DataEvento`,
 1 AS `PrecoBilhete`,
 1 AS `IdadeMinima`,
 1 AS `Media_Idade`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Contacto` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Raul Salgado',962262548),(2,'Celso Borges',911574281),(3,'Alfredo Faria',921599116),(4,'Fernando Gomes',938665544),(5,'Carla Rodrigues',922334455),(6,'Sandra Gomes',917665544),(7,'Paulo Rodrigues',923334455),(8,'Isabel Pires',966112233),(9,'Hugo Costa',918223344),(10,'Marta Almeida',927334455),(11,'António Silva',911223344),(12,'Rosa Pereira',936556677),(13,'Joaquim Oliveira',925443322),(14,'Ana Sousa',919889900),(15,'Pedro Pereira',924889900),(16,'Lúcia Martins',918112233),(17,'Manuel Silva',938112233),(18,'Catarina Sousa',927778899),(19,'Ricardo Martins',912334455),(20,'Beatriz Oliveira',925556677);
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Contacto` int NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Mariana Costa',964179029,'mariana.costa@gmail.com'),(2,'Rui Pereira',931946775,'rui.pereira@gmail.com'),(3,'Isabel Almeida',917290232,'isabel.almeida@gmail.com'),(4,'Andre Silva',966112233,'andre.silva@gmail.com'),(5,'Beatriz Costa',910223344,'beatriz.costa@gmail.com'),(6,'Catarina Martins',968112233,'catarina.martins@gmail.com'),(7,'Diogo Costa',927223344,'diogo.costa@gmail.com'),(8,'Fernanda Oliveira',912345678,'fernanda.oliveira@gmail.com'),(9,'Gonçalo Silva',925678901,'goncalo.silva@gmail.com'),(10,'Helena Santos',938789012,'helena.santos@gmail.com'),(11,'Igor Pereira',914567890,'igor.pereira@gmail.com'),(12,'Joana Costa',923456789,'joana.costa@gmail.com'),(13,'Kiko Almeida',967654321,'kiko.almeida@gmail.com'),(14,'Lara Martins',915432198,'lara.martins@gmail.com'),(15,'Miguel Silva',967890123,'miguel.silva@gmail.com'),(16,'Nádia Almeida',921234567,'nadia.almeida@gmail.com'),(17,'Oscar Costa',966789012,'oscar.costa@gmail.com'),(18,'Paula Martins',918765432,'paula.martins@gmail.com'),(19,'Quim Oliveira',935678901,'quim.oliveira@gmail.com'),(20,'Rita Pereira',964567890,'rita.pereira@gmail.com');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Preco` decimal(6,2) NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'Cadeira',5.00,250),(2,'Copo',0.15,1500),(3,'Microfone',160.00,30),(4,'Mesa',15.00,100),(5,'Projetor',300.00,10),(6,'Panfleto',0.05,5000),(7,'Pulseira',0.25,3500),(8,'Coluna',425.00,40),(9,'Palco',1000.00,5),(10,'Iluminação LED',50.00,15),(11,'Tenda',300.00,8),(12,'Bandeira Personalizada',80.00,10),(13,'Passadeira Vermelha',15.00,3),(14,'Balcão de Registo',120.00,5),(15,'Toalha de Mesa Personalizada',10.00,12),(16,'Bandejas de Serviço',5.00,20),(17,'Ecrã LED',400.00,2),(18,'Porta-Banners',25.00,6),(19,'Barricada',30.00,8),(20,'Sistema de Som',200.00,4),(21,'Cadeira VIP',25.00,15),(22,'Tapete',35.00,3),(23,'Letreiro',180.00,10),(24,'Projetor de Laser',250.00,5),(25,'Sistema de Tradução',150.00,6),(26,'Centro de Mesa Elegante',8.00,20),(27,'Fogos de Artifício',1000.00,2),(28,'Letras Luminosas',75.00,4),(29,'Banners Decorativos',12.00,15),(30,'Kit de Primeiros Socorros',40.00,5),(31,'Baldes de Gelo',3.00,25),(32,'Câmara de Vídeo Profissional',800.00,3),(33,'Máquina de Fumaça',50.00,7),(34,'Púlpito de Palestrante',60.00,3),(35,'Rede de Proteção',20.00,12),(36,'Banners de Patrocinadores',18.00,8);
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_fornecedor`
--

DROP TABLE IF EXISTS `material_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_fornecedor` (
  `Material_ID` int NOT NULL,
  `Fornecedor_ID` int NOT NULL,
  `Quantidade` int NOT NULL,
  PRIMARY KEY (`Material_ID`,`Fornecedor_ID`),
  KEY `Fornecedor_ID` (`Fornecedor_ID`),
  CONSTRAINT `material_fornecedor_ibfk_1` FOREIGN KEY (`Material_ID`) REFERENCES `material` (`ID`),
  CONSTRAINT `material_fornecedor_ibfk_2` FOREIGN KEY (`Fornecedor_ID`) REFERENCES `fornecedor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_fornecedor`
--

LOCK TABLES `material_fornecedor` WRITE;
/*!40000 ALTER TABLE `material_fornecedor` DISABLE KEYS */;
INSERT INTO `material_fornecedor` VALUES (1,1,80),(1,2,20),(1,4,150),(2,2,320),(2,7,1180),(3,1,20),(3,8,10),(4,4,100),(5,3,10),(6,5,1300),(7,10,3500),(8,15,40),(9,12,5),(10,6,15),(11,9,8),(12,14,10),(13,20,3),(14,19,5),(15,17,12),(16,11,20),(17,14,2),(18,5,6),(19,17,8),(20,15,4),(21,13,15),(22,12,3),(23,18,10),(24,3,5),(25,8,6),(26,2,20),(27,1,2),(28,9,4),(29,14,15),(30,19,5),(31,20,25),(32,20,3),(33,1,7),(34,4,3),(35,8,12),(36,9,8);
/*!40000 ALTER TABLE `material_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `material_utilizado`
--

DROP TABLE IF EXISTS `material_utilizado`;
/*!50001 DROP VIEW IF EXISTS `material_utilizado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `material_utilizado` AS SELECT 
 1 AS `Nome`,
 1 AS `Quatidade_Utilizada`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `participante`
--

DROP TABLE IF EXISTS `participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participante` (
  `NIF` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Contacto` int NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Idade` int NOT NULL,
  PRIMARY KEY (`NIF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante`
--

LOCK TABLES `participante` WRITE;
/*!40000 ALTER TABLE `participante` DISABLE KEYS */;
INSERT INTO `participante` VALUES (118901234,'Luís Oliveira',926789012,'luis.oliveira49@gmail.com',24),(200123456,'Miguel Oliveira',936789012,'miguel.oliveira31@gmail.com',27),(201234567,'Rita Pereira',921098765,'rita.pereira32@gmail.com',25),(202345678,'João Sousa',926543210,'joao.sousa33@gmail.com',30),(219012345,'Ana Costa',929012345,'ana.costa50@gmail.com',31),(220123456,'Miguel Oliveira',936789012,'miguel.oliveira51@gmail.com',27),(221234567,'Rita Pereira',921098765,'rita.pereira52@gmail.com',25),(222345678,'João Sousa',926543210,'joao.sousa53@gmail.com',30),(234567890,'Pedro Santos',919876543,'pedro.santos9@gmail.com',25),(246239573,'Sofia Santos',938056151,'sofia.santos2@gmail.com',34),(251737322,'Ricardo Pereira',939360090,'ricardo.pereira3@gmail.com',22),(254321987,'Sara Oliveira',912345678,'sara.oliveira15@gmail.com',26),(254563651,'João Oliveira',914778185,'joao.oliveira1@gmail.com',27),(268975431,'Eduardo Sousa',933445566,'eduardo.sousa5@gmail.com',30),(273849561,'Miguel Silva',919334455,'miguel.silva7@gmail.com',28),(284613597,'Patricia Oliveira',914223344,'patricia.oliveira6@gmail.com',26),(285432109,'Rui Santos',926789012,'rui.santos16@gmail.com',29),(291234567,'Catarina Silva',926543210,'catarina.silva14@gmail.com',30),(292345678,'Carla Martins',932109876,'carla.martins10@gmail.com',29),(292355678,'Gustavo Oliveira',936789012,'gustavo.oliveira19@gmail.com',30),(292876543,'André Pereira',937654321,'andre.pereira13@gmail.com',27),(293456789,'Joana Costa',929012345,'joana.costa24@gmail.com',30),(294567890,'Beatriz Sousa',921098765,'beatriz.sousa20@gmail.com',22),(294568890,'Tiago Oliveira',936789012,'tiago.oliveira25@gmail.com',28),(295678901,'Isabel Sousa',921098765,'isabel.sousa26@gmail.com',26),(296432109,'Hugo Oliveira',919876543,'hugo.oliveira11@gmail.com',23),(296789012,'Pedro Pereira',926543210,'pedro.pereira27@gmail.com',32),(296874123,'Andreia Sousa',935556677,'andreia.sousa8@gmail.com',31),(297114859,'Inês Silva',926169061,'ines.silva4@gmail.com',19),(297654321,'Daniel Pereira',926543210,'daniel.pereira21@gmail.com',28),(297765432,'Luís Silva',921234567,'luis.silva17@gmail.com',31),(297890123,'Catarina Silva',919876543,'catarina.silva28@gmail.com',29),(298765432,'Mariana Costa',928765432,'mariana.costa12@gmail.com',33),(298901234,'Marta Silva',919876543,'marta.silva22@gmail.com',25),(298901334,'Luís Martins',926789012,'luis.martins29@gmail.com',24),(299012335,'Ana Costa',929012345,'ana.costa30@gmail.com',31),(299012345,'André Martins',926789012,'andre.martins23@gmail.com',33),(299876543,'Carolina Martins',929876543,'carolina.martins18@gmail.com',27),(303456789,'Laura Oliveira',919012345,'laura.oliveira34@gmail.com',28),(304567890,'Bruno Martins',936789012,'bruno.martins35@gmail.com',33),(305678901,'Mariana Sousa',921098765,'mariana.sousa36@gmail.com',29),(306789012,'André Pereira',926543210,'andre.pereira37@gmail.com',24),(307890123,'Sofia Silva',919876543,'sofia.silva38@gmail.com',31),(308901234,'Rui Oliveira',926789012,'rui.oliveira39@gmail.com',28),(309012345,'Ana Martins',929012345,'ana.martins40@gmail.com',25),(310123456,'Pedro Oliveira',936789012,'pedro.oliveira41@gmail.com',32),(311234567,'Marta Sousa',921098765,'marta.sousa42@gmail.com',26),(312345678,'João Silva',926543210,'joao.silva43@gmail.com',30),(313456789,'Sara Costa',929012345,'sara.costa44@gmail.com',30),(314567890,'Ricardo Martins',936789012,'ricardo.martins45@gmail.com',28),(315678901,'Beatriz Oliveira',921098765,'beatriz.oliveira46@gmail.com',26),(316789012,'Daniel Sousa',926543210,'daniel.sousa47@gmail.com',32),(317890123,'Carolina Silva',919876543,'carolina.silva48@gmail.com',29),(323456789,'Rui Martins',926543210,'rui.martins54@gmail.com',33),(324567890,'Inês Oliveira',921098765,'ines.oliveira55@gmail.com',29),(325678901,'Miguel Sousa',926789012,'miguel.sousa56@gmail.com',24),(326789012,'Ana Pereira',929012345,'ana.pereira57@gmail.com',31),(327890123,'Pedro Costa',936789012,'pedro.costa58@gmail.com',27),(328901234,'Catarina Martins',921098765,'catarina.martins59@gmail.com',26),(329012345,'Luís Silva',926543210,'luis.silva60@gmail.com',30),(330123456,'Marta Oliveira',936789012,'marta.oliveira61@gmail.com',28),(331234567,'João Sousa',921098765,'joao.sousa62@gmail.com',26),(332345678,'Sofia Pereira',926543210,'sofia.pereira63@gmail.com',32),(333456789,'Ricardo Martins',929012345,'ricardo.martins64@gmail.com',17),(334567890,'Beatriz Oliveira',936789012,'beatriz.oliveira65@gmail.com',18),(335678901,'Daniel Silva',921098765,'daniel.silva66@gmail.com',16),(336789012,'Carolina Sousa',926543210,'carolina.sousa67@gmail.com',22),(337890123,'Luís Oliveira',919876543,'luis.oliveira68@gmail.com',39),(338901234,'Ana Costa',926789012,'ana.costa69@gmail.com',44),(339012345,'Miguel Oliveira',929012345,'miguel.oliveira70@gmail.com',51),(340123456,'Rita Pereira',936789012,'rita.pereira71@gmail.com',17),(341234567,'João Sousa',921098765,'joao.sousa72@gmail.com',55),(342345678,'Sara Oliveira',926543210,'sara.oliveira73@gmail.com',20),(343456789,'Rui Santos',929012345,'rui.santos74@gmail.com',38),(344567890,'Inês Silva',936789012,'ines.silva75@gmail.com',46),(345678901,'Miguel Martins',921098765,'miguel.martins76@gmail.com',32),(346789012,'Ana Pereira',926543210,'ana.pereira77@gmail.com',19),(347890123,'Pedro Costa',929012345,'pedro.costa78@gmail.com',19),(348901234,'Catarina Silva',936789012,'catarina.silva79@gmail.com',41),(349012345,'Luís Oliveira',921098765,'luis.oliveira08@gmail.com',27),(350123456,'Marta Costa',926543210,'marta.costa81@gmail.com',20),(351234567,'João Santos',929012345,'joao.santos82@gmail.com',18),(352345678,'Sofia Pereira',936789012,'sofia.pereira83@gmail.com',46),(353456789,'Ricardo Martins',921098765,'ricardo.martins84@gmail.com',17),(354567890,'Beatriz Oliveira',936789012,'beatriz.oliveira85@gmail.com',19),(355678901,'Daniel Silva',926543210,'daniel.silva86@gmail.com',44),(356789012,'Carolina Sousa',929012345,'carolina.sousa87@gmail.com',51),(357890123,'Luís Oliveira',936789012,'luis.oliveira88@gmail.com',17),(358901234,'Ana Costa',921098765,'ana.costa89@gmail.com',16),(359012345,'Miguel Oliveira',926543210,'miguel.oliveira90@gmail.com',30),(360123456,'Rita Pereira',929012345,'rita.pereira91@gmail.com',18),(361234567,'João Sousa',936789012,'joao.sousa92@gmail.com',36),(362345678,'Sara Oliveira',921098765,'sara.oliveira93@gmail.com',32),(363456789,'Rui Santos',926543210,'rui.santos94@gmail.com',49),(364567890,'Inês Silva',929012345,'ines.silva95@gmail.com',35),(365678901,'Miguel Martins',936789012,'miguel.martins96@gmail.com',51),(366789012,'Ana Pereira',921098765,'ana.pereira97@gmail.com',18),(367890123,'Pedro Costa',926543210,'pedro.costa98@gmail.com',20),(368901234,'Catarina Silva',929012345,'catarina.silva99@gmail.com',26),(369012345,'Luís Oliveira',936789012,'luis.oliveira00@gmail.com',42),(370123456,'Marta Costa',921098765,'marta.costa013@gmail.com',29);
/*!40000 ALTER TABLE `participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participante_evento`
--

DROP TABLE IF EXISTS `participante_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participante_evento` (
  `Participante_NIF` int NOT NULL,
  `Evento_ID` int NOT NULL,
  PRIMARY KEY (`Participante_NIF`,`Evento_ID`),
  KEY `Evento_ID` (`Evento_ID`),
  CONSTRAINT `participante_evento_ibfk_1` FOREIGN KEY (`Participante_NIF`) REFERENCES `participante` (`NIF`),
  CONSTRAINT `participante_evento_ibfk_2` FOREIGN KEY (`Evento_ID`) REFERENCES `evento` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante_evento`
--

LOCK TABLES `participante_evento` WRITE;
/*!40000 ALTER TABLE `participante_evento` DISABLE KEYS */;
INSERT INTO `participante_evento` VALUES (254563651,1),(299876543,1),(316789012,1),(334567890,1),(343456789,1),(344567890,1),(345678901,1),(354567890,1),(369012345,1),(201234567,2),(246239573,2),(254563651,2),(315678901,2),(332345678,2),(336789012,2),(341234567,2),(361234567,2),(254563651,3),(268975431,3),(291234567,3),(296789012,3),(304567890,3),(254563651,4),(284613597,4),(294568890,4),(297765432,4),(333456789,4),(355678901,4),(357890123,4),(358901234,4),(273849561,5),(292876543,5),(299876543,5),(330123456,5),(362345678,5),(370123456,5),(296874123,6),(298901334,6),(299876543,6),(317890123,6),(219012345,7),(292355678,7),(295678901,7),(298765432,7),(299876543,7),(305678901,7),(306789012,7),(329012345,7),(331234567,7),(352345678,7),(369012345,7),(200123456,8),(220123456,8),(292355678,8),(299876543,8),(316789012,8),(326789012,8),(335678901,8),(353456789,8),(369012345,8),(222345678,9),(296432109,9),(297890123,9),(299876543,9),(307890123,9),(316789012,9),(327890123,9),(366789012,9),(367890123,9),(221234567,10),(292345678,10),(292355678,10),(299012335,10),(299876543,10),(308901234,10),(316789012,10),(328901234,10),(336789012,10),(349012345,10),(365678901,10),(368901234,10),(292355678,11),(311234567,11),(316789012,11),(350123456,11),(359012345,11),(118901234,12),(234567890,12),(292355678,12),(299012345,12),(310123456,12),(313456789,12),(316789012,12),(336789012,12),(339012345,12),(347890123,12),(364567890,12),(285432109,13),(298901234,13),(299876543,13),(324567890,13),(334567890,13),(351234567,13),(356789012,13),(359012345,13),(366789012,13),(254321987,14),(297654321,14),(309012345,14),(325678901,14),(334567890,14),(336789012,14),(337890123,14),(343456789,14),(346789012,14),(360123456,14),(366789012,14),(368901234,14),(202345678,15),(294567890,15),(299876543,15),(323456789,15),(343456789,15),(359012345,15),(361234567,15),(366789012,15),(368901234,15),(292355678,16),(293456789,16),(314567890,16),(334567890,16),(340123456,16),(343456789,16),(348901234,16),(361234567,16),(368901234,16),(369012345,16),(292355678,17),(299876543,17),(303456789,17),(312345678,17),(334567890,17),(338901234,17),(342345678,17),(344567890,17),(359012345,17),(361234567,17),(363456789,17);
/*!40000 ALTER TABLE `participante_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `quantidade_eventos_participados`
--

DROP TABLE IF EXISTS `quantidade_eventos_participados`;
/*!50001 DROP VIEW IF EXISTS `quantidade_eventos_participados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `quantidade_eventos_participados` AS SELECT 
 1 AS `Nif`,
 1 AS `Nome`,
 1 AS `idade`,
 1 AS `Eventos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `resumo_evento`
--

DROP TABLE IF EXISTS `resumo_evento`;
/*!50001 DROP VIEW IF EXISTS `resumo_evento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `resumo_evento` AS SELECT 
 1 AS `Nome`,
 1 AS `Descricao`,
 1 AS `Estado`,
 1 AS `DataEvento`,
 1 AS `Lotacao`,
 1 AS `PrecoBilhete`,
 1 AS `Participantes`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'gestaoeventos'
--

--
-- Dumping routines for database 'gestaoeventos'
--
/*!50003 DROP FUNCTION IF EXISTS `CustoTotalDeEvento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CustoTotalDeEvento`(
	IDEvento INT
) RETURNS decimal(6,2)
    READS SQL DATA
BEGIN
    DECLARE custo DECIMAL(6,2);
    SELECT SUM(M.Preco) INTO custo
    FROM Material M
    JOIN evento_material EM ON M.ID = EM.Material_ID
    WHERE EM.Evento_ID = IDEvento;
    RETURN custo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DisponibilidadeDiaEspaco` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `DisponibilidadeDiaEspaco`(
    Dia DATE,
    IDEspaco INT
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE ocupado INT;
    SELECT COUNT(*) INTO ocupado
    FROM evento E
    JOIN evento_espaco EE ON E.ID = EE.Evento_ID
    WHERE E.DataEvento = Dia AND EE.Espaco_ID = IDEspaco;
    IF ocupado > 0 THEN
        RETURN FALSE;
    ELSE
        RETURN TRUE;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `LucroBilhetesEvento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `LucroBilhetesEvento`(
    IDEvento INT
) RETURNS decimal(8,2)
    READS SQL DATA
BEGIN 
    DECLARE Receita DECIMAL(8,2);
    SELECT SUM(E.PrecoBilhete) INTO Receita
    FROM Evento E
    JOIN participante_evento PE ON E.ID = PE.Evento_ID
    WHERE IDEvento = PE.Evento_ID;
    RETURN Receita;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `MediaIdadePorEvento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `MediaIdadePorEvento`(
	IDEvento INT
) RETURNS decimal(8,2)
    READS SQL DATA
BEGIN
    DECLARE media DECIMAL(8, 2);
    SELECT AVG(P.Idade) INTO media
    FROM Participante P
    JOIN Participante_Evento PE ON P.NIF = PE.Participante_NIF
    WHERE PE.Evento_ID = IDEvento;
    RETURN media;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `VerificarMaterialSuficiente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `VerificarMaterialSuficiente`(
    IDMaterial INT,
    quantidadeNecessaria INT
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE quantidadeStock INT;
    SELECT Quantidade INTO quantidadeStock
    FROM Material
    WHERE ID = IDMaterial;
    IF quantidadeStock >= quantidadeNecessaria THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AtualizarEstado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AtualizarEstado`(
	IN IDEvento INT,
	IN novo_estado VARCHAR(15)
)
BEGIN
	UPDATE evento
    SET Estado = novo_estado
    WHERE ID = IDEvento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EventosEntreDatas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EventosEntreDatas`(
	IN data_inicial DATE, 
    IN data_final DATE
)
BEGIN
    SELECT Nome, Descricao, Estado, DataEvento, PrecoBilhete, IdadeMinima
    FROM Evento
    WHERE DataEvento BETWEEN data_inicial AND data_final
    ORDER BY DataEvento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EventosPorNIF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EventosPorNIF`(
	IN NIF INT
)
BEGIN
    SELECT E.Nome
    FROM Evento E
    JOIN participante_evento PE ON E.ID = PE.Evento_ID
    WHERE PE.Participante_NIF = NIF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EventosPorPrecoMaximo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EventosPorPrecoMaximo`(
	IN preco DOUBLE
)
BEGIN
    SELECT Nome, Descricao, Estado, DataEvento, PrecoBilhete, IdadeMinima
    FROM Evento
    WHERE PrecoBilhete <= preco
    ORDER BY PrecoBilhete;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MaterialFornecidoPorEvento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MaterialFornecidoPorEvento`(
	IN IDEvento INT
)
BEGIN
	SELECT E.Nome, F.Nome, M.Nome, MF.Quantidade
	FROM Evento E
	JOIN Evento_Material EM ON E.ID = EM.Evento_ID
	JOIN Material M ON EM.Material_ID = M.ID
	JOIN Material_Fornecedor MF ON M.ID = MF.Material_ID
	JOIN Fornecedor F ON MF.Fornecedor_ID = F.ID
    WHERE E.ID = IDEvento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Top3ParticipantesEntreDatas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Top3ParticipantesEntreDatas`(
	IN data_inicio DATE,
    IN data_fim DATE
)
BEGIN
    SELECT P.NIF, P.Nome, P.Idade, COUNT(*) AS Participacoes
    FROM Participante P
    JOIN Participante_Evento PE ON P.NIF = PE.Participante_NIF
    JOIN Evento E ON PE.Evento_ID = E.ID
    WHERE E.DataEvento BETWEEN data_inicio AND data_fim
    GROUP BY P.NIF
    ORDER BY Participacoes DESC
    LIMIT 3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `eventos_ativos`
--

/*!50001 DROP VIEW IF EXISTS `eventos_ativos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `eventos_ativos` AS select `evento`.`Nome` AS `Nome`,`evento`.`DataEvento` AS `DataEvento`,`evento`.`PrecoBilhete` AS `PrecoBilhete`,`evento`.`IdadeMinima` AS `IdadeMinima` from `evento` where (`evento`.`Estado` = 'Ativo') order by `evento`.`DataEvento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `eventos_finalizados`
--

/*!50001 DROP VIEW IF EXISTS `eventos_finalizados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `eventos_finalizados` AS select `e`.`Nome` AS `Nome`,`e`.`DataEvento` AS `DataEvento`,`e`.`PrecoBilhete` AS `PrecoBilhete`,`e`.`IdadeMinima` AS `IdadeMinima`,round(avg(`p`.`Idade`),2) AS `Media_Idade` from ((`evento` `e` join `participante_evento` `pe` on((`e`.`ID` = `pe`.`Evento_ID`))) join `participante` `p` on((`pe`.`Participante_NIF` = `p`.`NIF`))) where (`e`.`Estado` = 'Finalizado') group by `e`.`ID` order by `e`.`DataEvento` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `material_utilizado`
--

/*!50001 DROP VIEW IF EXISTS `material_utilizado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `material_utilizado` AS select `m`.`Nome` AS `Nome`,sum(`em`.`Quantidade`) AS `Quatidade_Utilizada` from (`material` `m` join `evento_material` `em` on((`m`.`ID` = `em`.`Material_ID`))) group by `m`.`Nome` order by `Quatidade_Utilizada` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `quantidade_eventos_participados`
--

/*!50001 DROP VIEW IF EXISTS `quantidade_eventos_participados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `quantidade_eventos_participados` AS select `p`.`NIF` AS `Nif`,`p`.`Nome` AS `Nome`,`p`.`Idade` AS `idade`,count(`pe`.`Evento_ID`) AS `Eventos` from (`participante` `p` join `participante_evento` `pe` on((`p`.`NIF` = `pe`.`Participante_NIF`))) group by `p`.`NIF` order by `Eventos` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `resumo_evento`
--

/*!50001 DROP VIEW IF EXISTS `resumo_evento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `resumo_evento` AS select `e`.`Nome` AS `Nome`,`e`.`Descricao` AS `Descricao`,`e`.`Estado` AS `Estado`,`e`.`DataEvento` AS `DataEvento`,`e`.`Lotacao` AS `Lotacao`,`e`.`PrecoBilhete` AS `PrecoBilhete`,count(`p`.`NIF`) AS `Participantes` from ((`evento` `e` join `participante_evento` `pe` on((`pe`.`Evento_ID` = `e`.`ID`))) join `participante` `p` on((`p`.`NIF` = `pe`.`Participante_NIF`))) group by `e`.`ID` order by `Participantes` desc */;
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

-- Dump completed on 2024-01-15  0:05:11
