-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: belajar_mysql
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Kelvin','Gilbert'),(2,'Eden','Hazard'),(4,'Hakim','Ziyech');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('C0001','Makanan'),('C0002','Minuman'),('C0003','Lain-lain'),('C0004','Oleh-oleh'),('C0005','Gadget');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'kelvin@gmail.com','kelvin','gilbert'),(3,'gilbert@gmail.com','kelvin','gilbert');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbook`
--

DROP TABLE IF EXISTS `guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbook` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook`
--

LOCK TABLES `guestbook` WRITE;
/*!40000 ALTER TABLE `guestbook` DISABLE KEYS */;
INSERT INTO `guestbook` VALUES (1,'guest1@gmail.com','Hello','Hello'),(2,'guest2@gmail.com','Hello','Hello'),(3,'guest3@gmail.com','Hello','Hello'),(4,'kelvin@gmail.com','Hello','Hello'),(5,'kelvin@gmail.com','Hello','Hello'),(6,'kelvin@gmail.com','Hello','Hello'),(10,'contoh@gmail.com','Contoh','Contoh'),(11,'contoh2@gmail.com','Contoh','Contoh'),(12,'contoh3@gmail.com','Diubah oleh User 2','Contoh'),(13,'contoh123@gmail.com','Contoh','Contoh');
/*!40000 ALTER TABLE `guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numbers`
--

DROP TABLE IF EXISTS `numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numbers` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numbers`
--

LOCK TABLES `numbers` WRITE;
/*!40000 ALTER TABLE `numbers` DISABLE KEYS */;
INSERT INTO `numbers` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id_product` varchar(10) NOT NULL,
  `id_order` int NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id_product`,`id_order`),
  KEY `fk_order_detail_orders` (`id_order`),
  CONSTRAINT `fk_order_detail_orders` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_order_detail_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES ('P0001',1,25000,1),('P0001',2,25000,1),('P0002',1,25000,1),('P0003',2,25000,1),('P0003',3,25000,1),('P0004',3,25000,1);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total` int NOT NULL,
  `order_data` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,50000,'2022-11-04 20:11:14'),(2,50000,'2022-11-04 20:11:16'),(3,50000,'2022-11-04 20:11:17');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `price` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_categories` varchar(10) DEFAULT NULL,
  `sample` text,
  PRIMARY KEY (`id`),
  KEY `fk_product_categories` (`id_categories`),
  FULLTEXT KEY `product_fulltext` (`name`,`description`),
  CONSTRAINT `fk_product_categories` FOREIGN KEY (`id_categories`) REFERENCES `categories` (`id`),
  CONSTRAINT `price_check` CHECK ((`price` >= 1000))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('P0001','Mie Ayam Original',NULL,15000,100,'2022-10-28 14:11:39','C0001',NULL),('P0002','Mie Ayam Bakso','Mie Ayam Original + Bakso',20000,100,'2022-10-28 14:13:42','C0001',NULL),('P0003','Mie Ayam Ceker','Mie Ayam Original + Ceker',20000,100,'2022-10-28 14:18:05','C0001',NULL),('P0004','Mie Ayam Spesial',NULL,25000,100,'2022-10-28 14:18:05','C0001',NULL),('P0005','Mie Ayam Yamin',NULL,20000,100,'2022-10-28 14:18:05','C0001',NULL),('P0006','Bakso Rusuk',NULL,25000,200,'2022-11-02 00:31:04','C0001',NULL),('P0007','Es Jeruk',NULL,10000,300,'2022-11-02 00:31:04','C0002',NULL),('P0008','Es Campur',NULL,15000,500,'2022-11-02 00:31:04','C0002',NULL),('P0009','Es Teh Manis',NULL,5000,400,'2022-11-02 00:31:04','C0002',NULL),('P0010','Kerupuk',NULL,2500,1000,'2022-11-02 00:31:04','C0003',NULL),('P0011','Keripik Udang',NULL,10000,300,'2022-11-02 00:31:04','C0003',NULL),('P0012','Es Krim',NULL,5000,200,'2022-11-02 00:31:04','C0003',NULL),('P0013','Mie Ayam Jamur',NULL,20000,50,'2022-11-02 00:31:04','C0001',NULL),('P0014','Bakso Telor',NULL,20000,150,'2022-11-02 00:31:04','C0001',NULL),('P0015','Bakso Jando',NULL,25000,300,'2022-11-02 00:31:04','C0001',NULL),('P0016','Permen',NULL,1000,1000,'2022-11-02 07:50:36','C0003',NULL),('X0001','X satu',NULL,25000,200,'2022-11-04 12:55:04',NULL,NULL),('X0002','X dua',NULL,10000,300,'2022-11-04 12:55:04',NULL,NULL),('X0003','X tiga',NULL,1000000,500,'2022-11-04 12:55:04',NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `name2` varchar(100) DEFAULT NULL,
  `name3` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `name2_index` (`name2`),
  KEY `name3_index` (`name3`),
  KEY `name_name2_name3_index` (`name`,`name2`,`name3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_customer` int NOT NULL,
  `balance` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id_customer` (`id_customer`),
  CONSTRAINT `fk_wallet_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES (1,1,0),(2,3,0);
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` varchar(10) NOT NULL,
  `id_customer` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `fk_wishlist_product` (`id_product`),
  KEY `fk_wishlist_customer` (`id_customer`),
  CONSTRAINT `fk_wishlist_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_wishlist_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,'P0001',1,'Makanan Kesukaan');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-10 11:43:46
