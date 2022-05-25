-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.52-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cloth_shop
--

CREATE DATABASE IF NOT EXISTS cloth_shop;
USE cloth_shop;

--
-- Definition of table `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` (`id`,`name`) VALUES 
 (1,'MAS'),
 (2,'AWS'),
 (3,'Cortloads'),
 (4,'QAS'),
 (5,'SDR');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;


--
-- Definition of table `cacel_item`
--

DROP TABLE IF EXISTS `cacel_item`;
CREATE TABLE `cacel_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `return` int(2) NOT NULL DEFAULT '0',
  `reason` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `transaction_id` int(11) NOT NULL DEFAULT '0',
  `employee_id` int(11) NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_cacel_item_transaction` (`transaction_id`),
  KEY `FK_cacel_item_employee` (`employee_id`),
  CONSTRAINT `FK_cacel_item_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_cacel_item_transaction` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cacel_item`
--

/*!40000 ALTER TABLE `cacel_item` DISABLE KEYS */;
INSERT INTO `cacel_item` (`id`,`return`,`reason`,`date`,`transaction_id`,`employee_id`,`status`) VALUES 
 (3,1,'232323','2020-04-11 20:50:50',5,1,'Canceled'),
 (4,1,'wrong iteam','2020-04-11 23:57:57',6,1,'Canceled'),
 (5,1,'wrong iteam','2020-04-12 00:05:34',5,1,'Canceled'),
 (6,1,'wrong iteam','2020-04-12 00:07:59',6,1,'Canceled'),
 (7,1,'wrong','2020-04-13 20:53:17',40,1,'Canceled'),
 (8,1,'wrong ireams','2020-04-13 20:53:42',7,1,'Canceled');
/*!40000 ALTER TABLE `cacel_item` ENABLE KEYS */;


--
-- Definition of table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `contact` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `uname` varchar(25) DEFAULT NULL,
  `pw` varchar(25) DEFAULT NULL,
  `position_id` int(11) NOT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_position` (`position_id`),
  CONSTRAINT `fk_employee_position` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`id`,`name`,`contact`,`email`,`uname`,`pw`,`position_id`,`status`) VALUES 
 (1,'Abhishek Dananjaya','0718807480','AbhishekDananjaya1@yahoo.com11','abhi','123',1,1),
 (2,'peiris','0718807480','abhishekpeiris9@gmail.com223','danu','123',2,1),
 (3,'AAAAweqwqw','0786734234qw','2222','22','22',3,1),
 (4,'qqqq2232','0786734234','22','7822','22',1,1),
 (5,'1111','1111','232','32232','111',2,1),
 (6,'peiris','0718807480','abhishekpeiris9@gmail.com11','peiris',NULL,1,1),
 (7,'wee','wewe','wewe','wew',NULL,3,1),
 (9,'abhishek dananjaya','0715208128','abhishekpeiris9@gmail.com22','abhishek','123456',3,1),
 (12,'2222','222','abhishekpeiris9@gmail.com12','23232','81adf108',1,1),
 (13,'23232','23232','abhishekpeiris9@gmail.com21','2232','e26574a0',3,1),
 (14,'ewew','wewe','abhishekpeiris9@gmail.com','abhiya','155ca8c9',1,1),
 (15,'wewe','wewe','abhishekpeiris9@gmail.com','abhiya','a10689d8',1,1),
 (16,'23222','222','abhishekpeiris9@gmail.com','1212121','fac9b575',1,1),
 (17,'thikshana harichchandra','0776753424','AbhishekDananjaya1@yahoo.com','dananjaya','7f3afc78',1,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


--
-- Definition of table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` double(11,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_employee1` (`employee_id`),
  CONSTRAINT `fk_invoice_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` (`id`,`total`,`date`,`employee_id`) VALUES 
 (1,12.00,'2020-04-10 08:41:59',1),
 (2,1212.00,'2020-04-13 10:37:35',1),
 (3,1212.00,'2020-04-11 10:37:37',1),
 (4,1212.00,'2020-04-11 11:00:36',1),
 (5,13332.00,'2020-05-11 11:01:29',1),
 (6,1212.00,'2020-04-11 11:03:58',1),
 (7,2424.00,'2020-04-11 11:06:18',1),
 (8,1212.00,'2020-04-11 21:19:42',1),
 (9,46422.00,'2020-04-08 22:54:00',1),
 (10,1212.00,'2020-04-11 21:27:06',1),
 (11,1212.00,'2020-04-11 21:29:49',1),
 (12,1233.00,'2020-04-11 12:38:10',1),
 (13,1212.00,'2020-06-12 12:39:26',1),
 (14,1212.00,'2020-04-12 12:41:10',1),
 (15,1212.00,'2020-04-12 12:50:26',1),
 (16,1212.00,'2020-04-12 12:51:44',1),
 (17,1212.00,'2020-04-12 12:56:49',1),
 (18,1212.00,'2020-04-12 12:57:58',1),
 (19,1212.00,'2020-02-12 13:00:04',1),
 (20,1212.00,'2020-04-12 13:18:32',1),
 (21,1212.00,'2020-04-12 13:19:45',1),
 (22,1212.00,'2020-04-12 13:22:28',1),
 (23,1212.00,'2020-04-12 13:29:16',1),
 (24,1212.00,'2020-04-12 13:36:43',1),
 (25,1212.00,'2020-04-12 13:53:40',1),
 (26,1212.00,'2020-04-12 14:05:48',1),
 (27,1212.00,'2020-04-12 22:44:05',1),
 (28,1880.00,'2020-04-13 18:52:38',1),
 (29,2800.00,'2020-04-13 18:55:25',1),
 (30,800.00,'2020-04-13 19:01:34',1),
 (31,800.00,'2020-04-13 19:01:37',1),
 (32,600.00,'2020-04-13 19:02:51',1),
 (33,600.00,'2020-04-13 19:02:54',1),
 (34,600.00,'2020-04-13 19:04:27',1),
 (35,600.00,'2020-04-13 19:07:44',1),
 (36,600.00,'2020-04-13 19:08:33',1),
 (37,600.00,'2020-04-13 19:58:26',1),
 (38,600.00,'2020-04-13 20:02:39',1),
 (39,840.00,'2020-04-13 20:39:16',1),
 (40,1400.00,'2020-04-13 20:42:42',1),
 (41,800.00,'2020-04-13 20:48:14',1),
 (42,3600.00,'2020-04-13 20:48:37',1),
 (43,1080.00,'2020-04-13 20:50:14',1),
 (44,3800.00,'2020-04-13 22:33:01',1),
 (45,760.00,'2020-04-13 22:36:00',1),
 (46,5360.00,'2020-04-13 23:08:55',1);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;


--
-- Definition of table `invoice_product`
--

DROP TABLE IF EXISTS `invoice_product`;
CREATE TABLE `invoice_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qty` int(11) DEFAULT NULL,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_product_invoice1` (`invoice_id`),
  KEY `FK_invoice_product_product` (`product_id`),
  CONSTRAINT `fk_invoice_product_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_invoice_product_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_product`
--

/*!40000 ALTER TABLE `invoice_product` DISABLE KEYS */;
INSERT INTO `invoice_product` (`id`,`qty`,`invoice_id`,`product_id`) VALUES 
 (2,1,2,27),
 (3,1,2,27),
 (4,1,4,27),
 (5,10,5,27),
 (6,1,6,27),
 (7,1,7,27),
 (8,1,8,27),
 (9,2,9,25),
 (10,1,10,27),
 (11,1,11,27),
 (12,1,12,27),
 (13,1,12,26),
 (14,1,13,27),
 (15,1,14,27),
 (16,1,15,27),
 (17,1,16,27),
 (18,1,17,27),
 (19,1,18,27),
 (20,1,19,27),
 (21,1,20,27),
 (22,1,21,27),
 (23,1,22,27),
 (24,1,23,27),
 (25,1,24,27),
 (26,1,25,27),
 (27,1,26,27),
 (28,1,29,28),
 (29,1,30,27),
 (30,1,31,27),
 (31,1,32,25),
 (32,1,33,25),
 (33,1,34,25),
 (34,1,35,25),
 (35,1,36,25),
 (36,1,37,25),
 (37,1,38,25),
 (38,1,39,25),
 (39,3,39,23),
 (40,1,40,25),
 (41,10,40,23),
 (42,10,41,23),
 (43,1,43,31),
 (44,1,44,27),
 (45,1,44,26),
 (46,1,44,30),
 (47,1,45,23),
 (48,1,45,23),
 (49,1,45,25),
 (50,1,46,23),
 (51,1,46,27),
 (52,1,46,33),
 (53,1,46,25),
 (54,1,46,26);
/*!40000 ALTER TABLE `invoice_product` ENABLE KEYS */;


--
-- Definition of table `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position`
--

/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` (`id`,`position`) VALUES 
 (1,'Admin'),
 (2,'Super Admin'),
 (3,'Cashier');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `barcode` varchar(25) DEFAULT NULL,
  `desc` text,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_brand1` (`brand_id`),
  CONSTRAINT `fk_product_brand1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`,`brand_id`,`barcode`,`desc`,`status`) VALUES 
 (23,3,'56565656','white glouse',1),
 (24,2,'ww','ww',1),
 (25,1,'45454545','normal skirt',1),
 (26,3,'12121212','night dress',1),
 (27,1,'23232323','red hat',1),
 (28,2,'12345678','black shirt\n',1),
 (29,1,'12312312','',1),
 (30,4,'12345678','Lenin trouser',1),
 (31,3,'12341234','Black Skiny(Woman)',1),
 (32,1,'11223344','Long Frock\n',1),
 (33,3,'22119089','Pigama Short',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qty` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `unit` varchar(20) NOT NULL DEFAULT '',
  `u_price` double(11,2) NOT NULL DEFAULT '0.00',
  `discount` double(11,2) NOT NULL DEFAULT '0.00',
  `price` double(11,2) NOT NULL DEFAULT '0.00',
  `critical` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_stock_product1` (`product_id`),
  CONSTRAINT `fk_stock_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` (`id`,`qty`,`date`,`product_id`,`unit`,`u_price`,`discount`,`price`,`critical`,`status`) VALUES 
 (3,25,'2020-04-13 07:07:41',23,'pair',80.00,0.00,80.00,5,1),
 (4,5,'2020-04-13 07:05:21',25,'pcs',600.00,0.00,600.00,2,1),
 (5,7,'2020-04-13 07:04:07',26,'pcs',1200.00,0.00,1200.00,5,1),
 (6,17,'2020-04-13 07:03:49',27,'pcs',800.00,0.00,800.00,2,1),
 (7,42,'2020-04-13 07:04:00',28,'psc',2800.00,0.00,2800.00,2,1),
 (8,27,'2020-04-13 14:23:10',30,'pcs',1800.00,0.00,1800.00,2,1),
 (9,53,'2020-04-13 15:38:25',31,'pcs',1200.00,10.00,1080.00,2,1),
 (10,10,'2020-04-13 23:01:41',32,'pcs',3850.00,20.00,3080.00,2,1),
 (11,9,'2020-04-13 23:04:05',33,'pcs',800.00,5.00,760.00,2,1);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;


--
-- Definition of table `stock_adj`
--

DROP TABLE IF EXISTS `stock_adj`;
CREATE TABLE `stock_adj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qty` int(11) DEFAULT NULL,
  `action` varchar(15) DEFAULT NULL,
  `reason` text,
  `date` datetime DEFAULT NULL,
  `stock_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_adj_stock1` (`stock_id`),
  KEY `fk_stock_adj_employee1` (`employee_id`),
  CONSTRAINT `fk_stock_adj_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_adj_stock1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_adj`
--

/*!40000 ALTER TABLE `stock_adj` DISABLE KEYS */;
INSERT INTO `stock_adj` (`id`,`qty`,`action`,`reason`,`date`,`stock_id`,`employee_id`) VALUES 
 (1,11,'11','11','2020-04-10 00:00:00',4,1),
 (4,1,'Remove','1','2020-04-10 00:00:00',4,2),
 (5,2,'Remove','damaged','2020-04-10 16:28:43',4,2),
 (6,10,'Add','return new stock','2020-04-10 16:33:09',5,2),
 (7,5,'Remove','Damaged','2020-04-13 15:48:45',5,2);
/*!40000 ALTER TABLE `stock_adj` ENABLE KEYS */;


--
-- Definition of table `stock_in`
--

DROP TABLE IF EXISTS `stock_in`;
CREATE TABLE `stock_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `totQty` int(11) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `total` double(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_in_supplier1` (`supplier_id`),
  KEY `fk_stock_in_employee1` (`employee_id`),
  CONSTRAINT `fk_stock_in_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_in_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_in`
--

/*!40000 ALTER TABLE `stock_in` DISABLE KEYS */;
INSERT INTO `stock_in` (`id`,`date`,`totQty`,`supplier_id`,`employee_id`,`total`) VALUES 
 (18,'2020-04-10 13:01:25',32,1,2,NULL),
 (19,'2020-04-10 13:02:36',44,2,2,NULL),
 (20,'2020-04-10 13:29:24',22,1,2,NULL),
 (21,'2020-04-10 13:34:11',10,1,2,NULL),
 (23,'2020-04-13 08:19:36',5,1,2,NULL),
 (24,'2020-04-13 08:36:20',20,2,2,NULL),
 (25,'2020-04-13 08:41:22',30,2,2,NULL),
 (27,'2020-04-13 17:38:06',24,3,2,34560.00),
 (28,'2020-04-13 17:47:07',24,3,2,13920.00),
 (29,'2020-04-13 18:03:13',12,3,2,12960.00),
 (30,'2020-04-13 18:03:54',14,3,2,16560.00),
 (31,'2020-04-13 18:05:07',2,3,2,2160.00),
 (32,'2020-04-13 18:37:46',1,3,2,1200.00),
 (33,'2020-04-13 18:41:29',1,3,2,2800.00),
 (34,'2020-04-13 18:42:25',3,3,2,6400.00),
 (35,'2020-04-13 18:42:58',1,3,2,1200.00),
 (36,'2020-04-13 18:44:43',1,3,2,1080.00),
 (37,'2020-04-13 18:46:00',1,3,2,80.00),
 (38,'2020-04-13 19:10:03',8,3,2,13760.00),
 (39,'2020-04-13 19:30:24',4,3,2,2840.00),
 (40,'2020-04-13 19:47:46',12,3,2,960.00);
/*!40000 ALTER TABLE `stock_in` ENABLE KEYS */;


--
-- Definition of table `stock_in_product`
--

DROP TABLE IF EXISTS `stock_in_product`;
CREATE TABLE `stock_in_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_in_id` int(11) NOT NULL DEFAULT '0',
  `qty` int(11) NOT NULL DEFAULT '0',
  `stock_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_stock_in_product_stock_in` (`stock_in_id`),
  KEY `FK_stock_in_product_stock` (`stock_id`),
  CONSTRAINT `FK_stock_in_product_stock` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`),
  CONSTRAINT `FK_stock_in_product_stock_in` FOREIGN KEY (`stock_in_id`) REFERENCES `stock_in` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_in_product`
--

/*!40000 ALTER TABLE `stock_in_product` DISABLE KEYS */;
INSERT INTO `stock_in_product` (`id`,`stock_in_id`,`qty`,`stock_id`) VALUES 
 (16,18,10,4),
 (17,18,12,5),
 (18,18,10,6),
 (19,19,12,5),
 (20,19,20,6),
 (21,19,12,4),
 (22,20,10,5),
 (23,20,12,6),
 (24,21,10,4),
 (25,23,5,3),
 (26,24,5,3),
 (27,24,5,4),
 (28,24,10,6),
 (29,25,30,7),
 (30,27,12,9),
 (31,27,12,8),
 (32,28,12,3),
 (33,28,12,9),
 (34,29,12,9),
 (35,30,2,8),
 (36,31,2,9),
 (37,32,1,5),
 (38,33,1,7),
 (39,34,2,8),
 (40,35,1,5),
 (41,36,1,9),
 (42,37,1,3),
 (43,38,2,9),
 (44,38,2,8),
 (45,38,2,7),
 (46,38,2,5),
 (47,39,1,3),
 (48,39,2,9),
 (49,39,1,4),
 (50,40,12,3);
/*!40000 ALTER TABLE `stock_in_product` ENABLE KEYS */;


--
-- Definition of table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` text,
  `address` text,
  `contact_person` varchar(45) DEFAULT NULL,
  `mobile` varchar(15) NOT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`id`,`company`,`address`,`contact_person`,`mobile`,`tel`,`status`) VALUES 
 (1,'Seema Cut Pieces','No 789, Colombo Road Dalupatha','Nimashi Perera','0773456789','0312234765',1),
 (2,'MBA Cut Piece Center','No 89, Maharagama Pamunuwa','Santha Peiris','0786754342','0312245789',1),
 (3,'DFG(PVt) LTD','No 89,Colombo Road, Ja ela ','Rangith Perera','0723467890','0112345789',1),
 (4,'Sudu Duwa(Katana)','No 90,Mirigama Road, Katana','Sapumali Rangika','0876754673','0314328789',1),
 (5,'SWR(PVT) LTD','No 349, Colombo Road, Negombo','Dinusha ','0786745345','0112343234',1),
 (6,'Ajith Cut Piece enter','No 89,Colombo Road,Seeduwa','Ajith Fernando','0712378965','0112234780',1),
 (7,'Rathna Textiles','No 89, Kadana road','Madurnga peiris','0765478253','0112345654',1);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;


--
-- Definition of table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double(11,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_transaction_employee1` (`employee_id`),
  KEY `fk_transaction_invoice1` (`invoice_id`),
  CONSTRAINT `fk_transaction_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transaction_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` (`id`,`amount`,`date`,`employee_id`,`invoice_id`,`status`) VALUES 
 (1,11.00,'2020-04-11 10:30:59',1,1,'Paid'),
 (2,1300.00,'2020-04-11 10:37:35',1,2,'Paid'),
 (3,1300.00,'2020-04-11 10:37:38',3,3,'Paid'),
 (4,1300.00,'2020-04-11 11:00:36',1,4,'Returned'),
 (5,15000.00,'2020-04-11 11:01:29',7,5,'Returned'),
 (6,1500.00,'2020-04-11 11:03:58',1,6,'Returned'),
 (7,2500.00,'2020-04-11 11:06:18',1,7,'Returned'),
 (8,1300.00,'2020-04-11 21:19:42',1,8,'Paid'),
 (9,50000.00,'2020-04-11 21:22:54',1,9,'Paid'),
 (10,1500.00,'2020-04-11 21:27:06',7,10,'Paid'),
 (11,1500.00,'2020-04-11 21:29:49',1,11,'Paid'),
 (12,1500.00,'2020-04-12 12:38:12',1,12,'Paid'),
 (13,1500.00,'2020-04-12 12:39:27',7,13,'Paid'),
 (14,1500.00,'2020-04-12 12:41:10',1,14,'Paid'),
 (15,1500.00,'2020-04-12 12:50:26',7,15,'Paid'),
 (16,1500.00,'2020-04-12 12:51:44',1,16,'Paid'),
 (17,1500.00,'2020-04-12 12:56:49',7,17,'Paid'),
 (18,1500.00,'2020-04-12 12:57:58',1,18,'Paid'),
 (19,1500.00,'2020-04-12 13:00:04',1,19,'Paid'),
 (20,1500.00,'2020-04-12 13:18:32',7,20,'Paid'),
 (21,1500.00,'2020-04-12 13:19:45',1,21,'Paid'),
 (22,1500.00,'2020-04-12 13:22:28',1,22,'Paid'),
 (23,1500.00,'2020-04-12 13:29:16',7,23,'Paid'),
 (24,15000.00,'2020-04-12 13:36:43',1,24,'Paid'),
 (25,1500.00,'2020-04-12 13:53:40',1,25,'Paid'),
 (26,15000.00,'2020-04-12 14:05:48',1,26,'Paid'),
 (27,3000.00,'2020-04-13 18:55:25',1,29,'Paid'),
 (28,1000.00,'2020-04-13 19:01:34',1,30,'Paid'),
 (29,1000.00,'2020-04-13 19:01:37',1,31,'Paid'),
 (30,1000.00,'2020-04-13 19:02:51',1,32,'Paid'),
 (31,1000.00,'2020-04-13 19:02:54',1,33,'Paid'),
 (32,1000.00,'2020-04-13 19:04:27',1,34,'Paid'),
 (33,1000.00,'2020-04-13 19:07:44',1,35,'Paid'),
 (34,1000.00,'2020-04-13 19:08:33',1,36,'Paid'),
 (35,1000.00,'2020-04-13 19:58:26',1,37,'Paid'),
 (36,1000.00,'2020-04-13 20:02:39',1,38,'Paid'),
 (37,1000.00,'2020-04-13 20:39:16',1,39,'Paid'),
 (38,1500.00,'2020-04-13 20:42:42',1,40,'Paid'),
 (39,1000.00,'2020-04-13 20:48:14',1,41,'Paid'),
 (40,1100.00,'2020-04-13 20:50:14',1,43,'Returned'),
 (41,4000.00,'2020-04-13 22:33:01',1,44,'Paid'),
 (42,1000.00,'2020-04-13 22:36:00',1,45,'Cancelled'),
 (43,5500.00,'2020-04-13 23:08:55',1,46,'Paid');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;


--
-- Definition of table `user_logs`
--

DROP TABLE IF EXISTS `user_logs`;
CREATE TABLE `user_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log` datetime DEFAULT NULL,
  `log_out` datetime DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_logs_employee` (`employee_id`),
  CONSTRAINT `FK_user_logs_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_logs`
--

/*!40000 ALTER TABLE `user_logs` DISABLE KEYS */;
INSERT INTO `user_logs` (`id`,`log`,`log_out`,`employee_id`) VALUES 
 (1,'2020-04-12 10:17:18','2020-04-12 10:17:19',5),
 (2,'2020-04-12 10:18:06','2020-04-12 10:29:11',3),
 (3,'2020-04-12 10:27:58',NULL,1),
 (4,'2020-04-12 10:30:41','2020-04-12 10:29:11',2),
 (5,'2020-04-12 10:31:16',NULL,2),
 (6,'2020-04-12 10:32:09','2020-04-12 10:32:15',2),
 (7,'2020-04-12 12:37:21',NULL,1),
 (8,'2020-04-12 12:39:13',NULL,1),
 (9,'2020-04-12 12:40:56',NULL,1),
 (10,'2020-04-12 12:50:11',NULL,1),
 (11,'2020-04-12 12:51:29',NULL,1),
 (12,'2020-04-12 12:56:36',NULL,1),
 (13,'2020-04-12 12:57:44',NULL,1),
 (14,'2020-04-12 12:59:51',NULL,1),
 (15,'2020-04-12 13:18:19',NULL,1),
 (16,'2020-04-12 13:19:35',NULL,1),
 (17,'2020-04-12 13:22:08',NULL,1),
 (18,'2020-04-12 13:29:03',NULL,1),
 (19,'2020-04-12 13:36:30',NULL,1),
 (20,'2020-04-12 13:53:28',NULL,1),
 (21,'2020-04-12 14:05:21',NULL,1),
 (22,'2020-04-12 22:33:44',NULL,2),
 (23,'2020-04-12 22:34:43',NULL,2),
 (24,'2020-04-12 22:43:50',NULL,1),
 (25,'2020-04-13 06:52:25',NULL,1),
 (26,'2020-04-13 06:53:30',NULL,2),
 (27,'2020-04-13 08:17:39',NULL,2),
 (28,'2020-04-13 08:34:33',NULL,2),
 (29,'2020-04-13 08:39:57',NULL,2),
 (30,'2020-04-13 10:21:10','2020-04-13 10:23:54',2),
 (31,'2020-04-13 10:26:31',NULL,2),
 (32,'2020-04-13 10:31:44',NULL,9),
 (33,'2020-04-13 11:50:05',NULL,2),
 (34,'2020-04-13 13:48:58','2020-04-13 13:49:09',1),
 (35,'2020-04-13 13:49:13','2020-04-13 13:49:17',2),
 (36,'2020-04-13 13:49:39',NULL,2),
 (37,'2020-04-13 13:58:15',NULL,2),
 (38,'2020-04-13 14:21:53',NULL,2),
 (39,'2020-04-13 15:36:55',NULL,2),
 (40,'2020-04-13 15:42:19',NULL,2),
 (41,'2020-04-13 15:50:35',NULL,2),
 (42,'2020-04-13 15:53:33',NULL,2),
 (43,'2020-04-13 15:59:53',NULL,2),
 (44,'2020-04-13 16:00:44',NULL,2),
 (45,'2020-04-13 16:08:19','2020-04-13 16:09:07',2),
 (46,'2020-04-13 16:09:47',NULL,1),
 (47,'2020-04-13 17:09:34',NULL,2),
 (48,'2020-04-13 17:35:12',NULL,2),
 (49,'2020-04-13 17:37:46',NULL,2),
 (50,'2020-04-13 17:46:36',NULL,2),
 (51,'2020-04-13 18:02:48',NULL,2),
 (52,'2020-04-13 18:04:51',NULL,2),
 (53,'2020-04-13 18:37:25',NULL,2),
 (54,'2020-04-13 18:41:01',NULL,2),
 (55,'2020-04-13 18:42:39',NULL,2),
 (56,'2020-04-13 18:44:25',NULL,2),
 (57,'2020-04-13 18:45:47',NULL,2),
 (58,'2020-04-13 18:52:16',NULL,1),
 (59,'2020-04-13 18:55:13',NULL,1),
 (60,'2020-04-13 19:01:22',NULL,1),
 (61,'2020-04-13 19:02:27',NULL,1),
 (62,'2020-04-13 19:04:11',NULL,1),
 (63,'2020-04-13 19:07:28',NULL,1),
 (64,'2020-04-13 19:08:21',NULL,1),
 (65,'2020-04-13 19:09:30',NULL,2),
 (66,'2020-04-13 19:19:26',NULL,2),
 (67,'2020-04-13 19:29:52',NULL,2),
 (68,'2020-04-13 19:47:19',NULL,2),
 (69,'2020-04-13 19:58:14',NULL,1),
 (70,'2020-04-13 20:02:26',NULL,1),
 (71,'2020-04-13 20:38:38',NULL,1),
 (72,'2020-04-13 20:42:13',NULL,1),
 (73,'2020-04-13 20:47:57',NULL,1),
 (74,'2020-04-13 20:49:44',NULL,1),
 (75,'2020-04-13 20:52:37',NULL,1),
 (76,'2020-04-13 21:10:43',NULL,1),
 (77,'2020-04-13 21:12:51',NULL,1),
 (78,'2020-04-13 21:42:15',NULL,2),
 (79,'2020-04-13 21:44:00',NULL,2),
 (80,'2020-04-13 22:06:49',NULL,2),
 (81,'2020-04-13 22:07:55',NULL,2),
 (82,'2020-04-13 22:09:22',NULL,2),
 (83,'2020-04-13 22:22:15',NULL,2),
 (84,'2020-04-13 22:24:24',NULL,2),
 (85,'2020-04-13 22:25:56','2020-04-13 22:27:27',2),
 (86,'2020-04-13 22:28:02',NULL,1),
 (87,'2020-04-13 22:29:13',NULL,1),
 (88,'2020-04-13 22:29:47',NULL,1),
 (89,'2020-04-13 22:32:33',NULL,1),
 (90,'2020-04-13 22:35:08','2020-04-13 22:35:25',2),
 (91,'2020-04-13 22:35:29',NULL,1),
 (92,'2020-04-13 22:42:17',NULL,2),
 (93,'2020-04-13 22:59:31',NULL,2),
 (94,'2020-04-13 23:03:15','2020-04-13 23:07:30',2),
 (95,'2020-04-13 23:07:52','2020-04-13 23:10:23',1),
 (96,'2020-04-13 23:10:40',NULL,17),
 (97,'2020-04-13 23:35:02',NULL,1);
/*!40000 ALTER TABLE `user_logs` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
