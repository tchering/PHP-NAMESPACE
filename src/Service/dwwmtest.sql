-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dwwm
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numArticle` varchar(20) NOT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `prixUnitaire` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numArticle` (`numArticle`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'BB0001','Biere castel 350ml',2.50),(2,'BB0002','Biere phoenix',1.50),(3,'BV0015','Vin listel gris 75cl++',4.50),(4,'XA0012','Riz Basmati 20kg  +++++++++++++',22.50),(5,'XA0028','Fromage 250g',4.25),(11,'XX0128','Article divers 1',1.00),(13,'XZ0128','Article divers 1+++++++',1.00);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numClient` varchar(20) NOT NULL,
  `nomClient` varchar(250) DEFAULT NULL,
  `adresseClient` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numClient` (`numClient`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'CLT1011','Ratondrabetsimary','Antananarivo'),(2,'CLT1022','Randrianarivony','Paris'),(3,'CLT1023','Dupont','Marseille'),(4,'CT10654','Marie','Niort'),(5,'CLT1255','Bernard','Rennes'),(6,'CLT1256','Paul','Paris'),(7,'CLT1267','Brigitte','Angers'),(8,'CLT1268','Richard','Castre'),(9,'CLT1269','Georges','Albi'),(10,'CLT879644','Marie Brigitte','Marseille');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collaborateur`
--

DROP TABLE IF EXISTS `collaborateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collaborateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `civilite` enum('madame','monsieur') NOT NULL DEFAULT 'madame',
  `nom` varchar(250) DEFAULT NULL,
  `prenom` varchar(250) DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `lieuNaissance` varchar(250) DEFAULT NULL,
  `numSecu` varchar(100) DEFAULT NULL,
  `mailPro` varchar(150) DEFAULT NULL,
  `mailPerso` varchar(150) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `telFixe` varchar(50) DEFAULT NULL,
  `rue` varchar(100) DEFAULT NULL,
  `complementAdresse` varchar(250) DEFAULT NULL,
  `codePostal` varchar(250) DEFAULT NULL,
  `ville` varchar(250) DEFAULT NULL,
  `departement` varchar(250) DEFAULT NULL,
  `region` varchar(250) DEFAULT NULL,
  `pays` varchar(250) DEFAULT NULL,
  `nationalite` varchar(150) DEFAULT NULL,
  `typeCollaborateur` enum('cdd','cdi','independant','stagiaire') DEFAULT 'cdd',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collaborateur`
--

LOCK TABLES `collaborateur` WRITE;
/*!40000 ALTER TABLE `collaborateur` DISABLE KEYS */;
INSERT INTO `collaborateur` VALUES (1,'monsieur','DUPONT','Claude',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cdd'),(2,'monsieur','PASCAL','Paul',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cdd'),(3,'madame','MARIE','Brigitte',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cdd'),(4,'monsieur','GEORGES','R?n?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cdd');
/*!40000 ALTER TABLE `collaborateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numCommande` varchar(20) NOT NULL,
  `dateCommande` datetime DEFAULT current_timestamp(),
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numCommande` (`numCommande`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,'CDE00155','2023-11-10 10:04:01',1),(4,'CDE00020','2023-01-10 00:00:00',1),(5,'CDE00321','2023-02-20 00:00:00',2),(6,'CDE00527','2023-03-15 00:00:00',3),(7,'CDE00530','2021-02-10 00:00:00',3),(8,'CDE00570','2022-04-20 00:00:00',1),(9,'CDE00580','2023-05-18 00:00:00',4);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournisseur` (
  `id` int(11) NOT NULL DEFAULT 0,
  `numClient` varchar(20) NOT NULL,
  `nomFournisseur` varchar(250) DEFAULT NULL,
  `adresseClient` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numClient` (`numClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur`
--

LOCK TABLES `fournisseur` WRITE;
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
INSERT INTO `fournisseur` VALUES (1,'CLT1011','Ratondrabetsimary','Antananarivo'),(2,'CLT1022','Randrianarivony','Paris'),(3,'CLT1023','Dupont','Marseille'),(4,'CT10654','Marie','Niort'),(5,'CLT1255','Bernard','Rennes'),(6,'CLT1256','Paul','Paris'),(7,'CLT1267','Brigitte','Angers'),(8,'CLT1268','Richard','Castre'),(9,'CLT1269','Georges','Albi');
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lignecommande`
--

DROP TABLE IF EXISTS `lignecommande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lignecommande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commande_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `quantite` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `commande_id` (`commande_id`),
  KEY `article_id` (`article_id`),
  CONSTRAINT `lignecommande_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`),
  CONSTRAINT `lignecommande_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lignecommande`
--

LOCK TABLES `lignecommande` WRITE;
/*!40000 ALTER TABLE `lignecommande` DISABLE KEYS */;
INSERT INTO `lignecommande` VALUES (1,1,1,24.00),(2,1,2,240.00),(3,1,3,25.00),(4,1,4,300.00),(5,4,1,30.00),(6,4,2,50.00),(7,4,1,40.00),(8,5,1,100.00),(9,5,2,200.00),(10,6,1,300.00),(11,7,1,125.00),(12,7,2,25.00),(13,7,4,12.00),(14,8,5,225.00),(15,8,1,325.00),(16,8,2,25.00),(17,9,1,25.00),(18,9,2,40.00),(19,9,3,50.00);
/*!40000 ALTER TABLE `lignecommande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL DEFAULT 0,
  `numArticle` varchar(20) NOT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `prixUnitaire` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'BB0001','Biere castel 350ml',2.50),(2,'BB0002','Biere phoenix',1.50),(3,'BV0015','Vin listel gris 75cl++',4.50),(4,'XA0012','Riz Basmati 20kg  +++++++++++++',22.50),(5,'XA0028','Fromage 250g',4.25),(11,'XX0128','Article divers 1',1.00),(13,'XZ0128','Article divers 1+++++++',1.00);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit` (
  `id` int(11) NOT NULL DEFAULT 0,
  `numArticle` varchar(20) NOT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `prixUnitaire` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,'BB0001','Biere castel 350ml',2.50),(2,'BB0002','Biere phoenix',1.50),(3,'BV0015','Vin listel gris 75cl++',4.50),(4,'XA0012','Riz Basmati 20kg  +++++++++++++',22.50),(5,'XA0028','Fromage 250g',4.25),(11,'XX0128','Article divers 1',1.00),(13,'XZ0128','Article divers 1+++++++',1.00);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rang` varchar(20) DEFAULT NULL,
  `libelle` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'001','ROLE_ADMIN'),(2,'002','ROLE_ASSISTANT'),(3,'003','ROLE_DEV'),(4,'004','ROLE_USER'),(5,'003','ROLE_DEPOT'),(6,'003','ROLE_CAISSE');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `dateCreation` datetime DEFAULT current_timestamp(),
  `dateModification` datetime DEFAULT current_timestamp(),
  `dateDerniereConnexion` datetime DEFAULT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`roles`)),
  `photo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'maries','marie@localhost.com','6e1b1f20acc26e074ef1f250f0b3f1ba27c1c29d','2024-01-18 09:17:39','2024-01-18 09:17:39',NULL,'[\"ROLE_USER\",\"ROLE_CAISSE\"]','femme4.jpg'),(4,'admin','admin@localhost.com++++','6e1b1f20acc26e074ef1f250f0b3f1ba27c1c29d','2024-01-18 09:21:54','2024-01-18 09:21:54',NULL,'[\"ROLE_ADMIN\",\"ROLE_ASSISTANT\",\"ROLE_DEV\",\"ROLE_USER\",\"ROLE_DEPOT\",\"ROLE_CAISSE\"]','femme1.jpg'),(8,'sherpa','sonam.sherpa.lama1@gmail.com','6e1b1f20acc26e074ef1f250f0b3f1ba27c1c29d','2024-02-08 08:14:29','2024-02-08 08:14:29',NULL,'[\"ROLE_ADMIN\",\"ROLE_ASSISTANT\",\"ROLE_USER\"]',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_cde_client_02`
--

DROP TABLE IF EXISTS `v_cde_client_02`;
/*!50001 DROP VIEW IF EXISTS `v_cde_client_02`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_cde_client_02` AS SELECT
 1 AS `numCommande`,
  1 AS `dateCommande`,
  1 AS `nomClient`,
  1 AS `adresseClient` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_cde_client_final`
--

DROP TABLE IF EXISTS `v_cde_client_final`;
/*!50001 DROP VIEW IF EXISTS `v_cde_client_final`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_cde_client_final` AS SELECT
 1 AS `numCommande`,
  1 AS `dateCommande`,
  1 AS `nomClient`,
  1 AS `adresseClient` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_client_id_achat`
--

DROP TABLE IF EXISTS `v_client_id_achat`;
/*!50001 DROP VIEW IF EXISTS `v_client_id_achat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_client_id_achat` AS SELECT
 1 AS `client_id`,
  1 AS `Achat` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_commande_article`
--

DROP TABLE IF EXISTS `v_commande_article`;
/*!50001 DROP VIEW IF EXISTS `v_commande_article`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_commande_article` AS SELECT
 1 AS `numCommande`,
  1 AS `dateCommande`,
  1 AS `numArticle`,
  1 AS `designation`,
  1 AS `pu`,
  1 AS `qte`,
  1 AS `montant` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_commande_client`
--

DROP TABLE IF EXISTS `v_commande_client`;
/*!50001 DROP VIEW IF EXISTS `v_commande_client`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_commande_client` AS SELECT
 1 AS `numCommande`,
  1 AS `dateCommande`,
  1 AS `numClient`,
  1 AS `nomClient`,
  1 AS `adresseClient` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_stat_client`
--

DROP TABLE IF EXISTS `v_stat_client`;
/*!50001 DROP VIEW IF EXISTS `v_stat_client`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_stat_client` AS SELECT
 1 AS `ANNEE`,
  1 AS `client_id`,
  1 AS `CA_CLIENT` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vf_01`
--

DROP TABLE IF EXISTS `vf_01`;
/*!50001 DROP VIEW IF EXISTS `vf_01`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vf_01` AS SELECT
 1 AS `numCommande`,
  1 AS `dateCommande`,
  1 AS `nomClient`,
  1 AS `adresseClient` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vf_stat_article`
--

DROP TABLE IF EXISTS `vf_stat_article`;
/*!50001 DROP VIEW IF EXISTS `vf_stat_article`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vf_stat_article` AS SELECT
 1 AS `annee`,
  1 AS `numArticle`,
  1 AS `designation`,
  1 AS `prixUnitaire`,
  1 AS `Janvier`,
  1 AS `Fevrier`,
  1 AS `Mars`,
  1 AS `Autre`,
  1 AS `Total` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vi_02`
--

DROP TABLE IF EXISTS `vi_02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vi_02` (
  `id` int(11) DEFAULT NULL,
  `valeur` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vi_02`
--

LOCK TABLES `vi_02` WRITE;
/*!40000 ALTER TABLE `vi_02` DISABLE KEYS */;
/*!40000 ALTER TABLE `vi_02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vi_ca_art`
--

DROP TABLE IF EXISTS `vi_ca_art`;
/*!50001 DROP VIEW IF EXISTS `vi_ca_art`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vi_ca_art` AS SELECT
 1 AS `article_id`,
  1 AS `ca` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vi_stat_annuel`
--

DROP TABLE IF EXISTS `vi_stat_annuel`;
/*!50001 DROP VIEW IF EXISTS `vi_stat_annuel`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vi_stat_annuel` AS SELECT
 1 AS `client_id`,
  1 AS `2021`,
  1 AS `2022`,
  1 AS `2023` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vi_stat_article`
--

DROP TABLE IF EXISTS `vi_stat_article`;
/*!50001 DROP VIEW IF EXISTS `vi_stat_article`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vi_stat_article` AS SELECT
 1 AS `annee`,
  1 AS `article_id`,
  1 AS `Janvier`,
  1 AS `Fevrier`,
  1 AS `Mars`,
  1 AS `Autre`,
  1 AS `Total` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vi_stat_boisson`
--

DROP TABLE IF EXISTS `vi_stat_boisson`;
/*!50001 DROP VIEW IF EXISTS `vi_stat_boisson`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vi_stat_boisson` AS SELECT
 1 AS `Annee`,
  1 AS `article_id`,
  1 AS `Biere`,
  1 AS `Vin`,
  1 AS `Jus`,
  1 AS `Autre` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vi_stat_total`
--

DROP TABLE IF EXISTS `vi_stat_total`;
/*!50001 DROP VIEW IF EXISTS `vi_stat_total`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vi_stat_total` AS SELECT
 1 AS `ANNEE`,
  1 AS `CA_TOTAL` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_cde_client_02`
--

/*!50001 DROP VIEW IF EXISTS `v_cde_client_02`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_cde_client_02` AS select `commande`.`numCommande` AS `numCommande`,`commande`.`dateCommande` AS `dateCommande`,`client`.`nomClient` AS `nomClient`,`client`.`adresseClient` AS `adresseClient` from (`commande` join `client`) where `commande`.`client_id` = `client`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_cde_client_final`
--

/*!50001 DROP VIEW IF EXISTS `v_cde_client_final`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_cde_client_final` AS select `v`.`numCommande` AS `numCommande`,`v`.`dateCommande` AS `dateCommande`,`c`.`nomClient` AS `nomClient`,`c`.`adresseClient` AS `adresseClient` from (`client` `c` left join `v_cde_client_02` `v` on(`c`.`nomClient` = `v`.`nomClient`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_client_id_achat`
--

/*!50001 DROP VIEW IF EXISTS `v_client_id_achat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_client_id_achat` AS select `c`.`client_id` AS `client_id`,sum(`l`.`quantite` * `a`.`prixUnitaire`) AS `Achat` from ((`commande` `c` join `lignecommande` `l`) join `article` `a`) where `l`.`commande_id` = `c`.`id` and `l`.`article_id` = `a`.`id` group by `c`.`client_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_commande_article`
--

/*!50001 DROP VIEW IF EXISTS `v_commande_article`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_commande_article` AS select `commande`.`numCommande` AS `numCommande`,`commande`.`dateCommande` AS `dateCommande`,`article`.`numArticle` AS `numArticle`,`article`.`designation` AS `designation`,`article`.`prixUnitaire` AS `pu`,`lignecommande`.`quantite` AS `qte`,`article`.`prixUnitaire` * `lignecommande`.`quantite` AS `montant` from ((`commande` join `lignecommande`) join `article`) where `lignecommande`.`commande_id` = `commande`.`id` and `lignecommande`.`article_id` = `article`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_commande_client`
--

/*!50001 DROP VIEW IF EXISTS `v_commande_client`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_commande_client` AS select `commande`.`numCommande` AS `numCommande`,`commande`.`dateCommande` AS `dateCommande`,`client`.`numClient` AS `numClient`,`client`.`nomClient` AS `nomClient`,`client`.`adresseClient` AS `adresseClient` from (`commande` join `client`) where `commande`.`client_id` = `client`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_stat_client`
--

/*!50001 DROP VIEW IF EXISTS `v_stat_client`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_stat_client` AS select year(`cde`.`dateCommande`) AS `ANNEE`,`cde`.`client_id` AS `client_id`,sum(`art`.`prixUnitaire` * `lcde`.`quantite`) AS `CA_CLIENT` from (((`client` `clt` join `commande` `cde`) join `lignecommande` `lcde`) join `article` `art`) where `clt`.`id` = `cde`.`client_id` and `cde`.`id` = `lcde`.`commande_id` and `art`.`id` = `lcde`.`article_id` group by year(`cde`.`dateCommande`),`cde`.`client_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vf_01`
--

/*!50001 DROP VIEW IF EXISTS `vf_01`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vf_01` AS select `v`.`numCommande` AS `numCommande`,`v`.`dateCommande` AS `dateCommande`,`c`.`nomClient` AS `nomClient`,`c`.`adresseClient` AS `adresseClient` from (`client` `c` left join (select `commande`.`numCommande` AS `numCommande`,`commande`.`dateCommande` AS `dateCommande`,`client`.`nomClient` AS `nomClient`,`client`.`adresseClient` AS `adresseClient` from (`commande` join `client`) where `commande`.`client_id` = `client`.`id`) `v` on(`c`.`nomClient` = `v`.`nomClient`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vf_stat_article`
--

/*!50001 DROP VIEW IF EXISTS `vf_stat_article`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vf_stat_article` AS select coalesce(`v`.`annee`,'...') AS `annee`,`a`.`numArticle` AS `numArticle`,`a`.`designation` AS `designation`,coalesce(`a`.`prixUnitaire`,0) AS `prixUnitaire`,coalesce(`v`.`Janvier`,0) AS `Janvier`,coalesce(`v`.`Fevrier`,0) AS `Fevrier`,coalesce(`v`.`Mars`,0) AS `Mars`,coalesce(`v`.`Autre`,0) AS `Autre`,coalesce(`v`.`Total`,0) AS `Total` from (`article` `a` left join (select year(`c`.`dateCommande`) AS `annee`,`l`.`article_id` AS `article_id`,sum(if(month(`c`.`dateCommande`) = 1,`l`.`quantite`,0)) AS `Janvier`,sum(if(month(`c`.`dateCommande`) = 2,`l`.`quantite`,0)) AS `Fevrier`,sum(if(month(`c`.`dateCommande`) = 3,`l`.`quantite`,0)) AS `Mars`,sum(if(month(`c`.`dateCommande`) > 3,`l`.`quantite`,0)) AS `Autre`,sum(`l`.`quantite`) AS `Total` from (`commande` `c` join `lignecommande` `l`) where `c`.`id` = `l`.`commande_id` group by year(`c`.`dateCommande`),`l`.`article_id`) `v` on(`a`.`id` = `v`.`article_id`)) order by coalesce(`v`.`annee`,'...'),`a`.`numArticle` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vi_ca_art`
--

/*!50001 DROP VIEW IF EXISTS `vi_ca_art`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vi_ca_art` AS select `l`.`article_id` AS `article_id`,sum(`l`.`quantite` * `a`.`prixUnitaire`) AS `ca` from (`lignecommande` `l` join `article` `a`) where `l`.`article_id` = `a`.`id` group by `l`.`article_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vi_stat_annuel`
--

/*!50001 DROP VIEW IF EXISTS `vi_stat_annuel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vi_stat_annuel` AS select `c`.`client_id` AS `client_id`,`l`.`quantite` * `a`.`prixUnitaire` AS `2021`,0 AS `2022`,0 AS `2023` from ((`commande` `c` join `lignecommande` `l`) join `article` `a`) where `l`.`commande_id` = `c`.`id` and `l`.`article_id` = `a`.`id` and year(`c`.`dateCommande`) = 2021 union all select `c`.`client_id` AS `client_id`,0 AS `2021`,`l`.`quantite` * `a`.`prixUnitaire` AS `2022`,0 AS `2023` from ((`commande` `c` join `lignecommande` `l`) join `article` `a`) where `l`.`commande_id` = `c`.`id` and `l`.`article_id` = `a`.`id` and year(`c`.`dateCommande`) = 2022 union all select `c`.`client_id` AS `client_id`,0 AS `2021`,0 AS `2022`,`l`.`quantite` * `a`.`prixUnitaire` AS `2023` from ((`commande` `c` join `lignecommande` `l`) join `article` `a`) where `l`.`commande_id` = `c`.`id` and `l`.`article_id` = `a`.`id` and year(`c`.`dateCommande`) = 2023 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vi_stat_article`
--

/*!50001 DROP VIEW IF EXISTS `vi_stat_article`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vi_stat_article` AS select year(`c`.`dateCommande`) AS `annee`,`l`.`article_id` AS `article_id`,sum(if(month(`c`.`dateCommande`) = 1,`l`.`quantite`,0)) AS `Janvier`,sum(if(month(`c`.`dateCommande`) = 2,`l`.`quantite`,0)) AS `Fevrier`,sum(if(month(`c`.`dateCommande`) = 3,`l`.`quantite`,0)) AS `Mars`,sum(if(month(`c`.`dateCommande`) > 3,`l`.`quantite`,0)) AS `Autre`,sum(`l`.`quantite`) AS `Total` from (`commande` `c` join `lignecommande` `l`) where `c`.`id` = `l`.`commande_id` group by year(`c`.`dateCommande`),`l`.`article_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vi_stat_boisson`
--

/*!50001 DROP VIEW IF EXISTS `vi_stat_boisson`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vi_stat_boisson` AS select year(`c`.`dateCommande`) AS `Annee`,`l`.`article_id` AS `article_id`,`l`.`quantite` AS `Biere`,0 AS `Vin`,0 AS `Jus`,0 AS `Autre` from ((`commande` `c` join `article` `a`) join `lignecommande` `l`) where `l`.`commande_id` = `c`.`id` and `l`.`article_id` = `a`.`id` and left(`a`.`numArticle`,2) = 'BB' union all select year(`c`.`dateCommande`) AS `Annee`,`l`.`article_id` AS `article_id`,0 AS `Biere`,`l`.`quantite` AS `Vin`,0 AS `Jus`,0 AS `Autre` from ((`commande` `c` join `article` `a`) join `lignecommande` `l`) where `l`.`commande_id` = `c`.`id` and `l`.`article_id` = `a`.`id` and left(`a`.`numArticle`,2) = 'BV' union all select year(`c`.`dateCommande`) AS `Annee`,`l`.`article_id` AS `article_id`,0 AS `Biere`,0 AS `Vin`,`l`.`quantite` AS `Jus`,0 AS `Autre` from ((`commande` `c` join `article` `a`) join `lignecommande` `l`) where `l`.`commande_id` = `c`.`id` and `l`.`article_id` = `a`.`id` and left(`a`.`numArticle`,2) = 'BJ' union all select year(`c`.`dateCommande`) AS `Annee`,`l`.`article_id` AS `article_id`,0 AS `Biere`,0 AS `Vin`,0 AS `Jus`,`l`.`quantite` AS `Autre` from ((`commande` `c` join `article` `a`) join `lignecommande` `l`) where `l`.`commande_id` = `c`.`id` and `l`.`article_id` = `a`.`id` and left(`a`.`numArticle`,2) not in ('BB','BV','BJ') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vi_stat_total`
--

/*!50001 DROP VIEW IF EXISTS `vi_stat_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vi_stat_total` AS select year(`c`.`dateCommande`) AS `ANNEE`,sum(`a`.`prixUnitaire` * `l`.`quantite`) AS `CA_TOTAL` from ((`commande` `c` join `lignecommande` `l`) join `article` `a`) where `c`.`id` = `l`.`commande_id` and `a`.`id` = `l`.`article_id` group by year(`c`.`dateCommande`) */;
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

-- Dump completed on 2024-02-08 17:23:25
