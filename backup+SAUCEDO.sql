-- OBJETOS (SOLAMENTE TABLAS) EN EL BACKUP:
	-- autor, autores_libro, campus, carrera, editorial, estudiante, facultad, formato, genero, grado, inv_libro, libro.
    
-- SELF CONTAINED FILE (SAFE CONTAINED FILE ONLY & CREATE SCHEMA)


CREATE DATABASE  IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `biblioteca`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Wallache','Langhorn'),(2,'Munroe','Baldocci'),(3,'Tildie','Pattullo'),(4,'Rene','Pothergill'),(5,'Husein','Caesman'),(6,'Herold','Lurriman'),(7,'Kessiah','Parfitt'),(8,'Anna-diane','Marston'),(9,'Ardeen','Jerratsch'),(10,'Sherye','Berthelet'),(11,'Enid','Glanders'),(12,'Jorey','Boyles'),(13,'Hillard','Vinick'),(14,'Marcelia','Brolly'),(15,'Marin','Medina'),(16,'Eda','Mobley'),(17,'Florence','Epsly'),(18,'Bernete','Purdie'),(19,'Nikki','Abadam'),(20,'Eydie','Simpkin'),(21,'Cherrita','Heasly'),(22,'Ave','Klehyn'),(23,'May','Bockman'),(24,'Dale','Tuckley'),(25,'Jessica','De Paoli'),(26,'Chet','Grossman'),(27,'Francesca','Durie'),(28,'Jordon','Goldsbury'),(29,'Angelico','Rentoll'),(30,'Maurene','Argile'),(31,'Riannon','Thomton'),(32,'Kori','Regglar'),(33,'Hercules','Borland'),(34,'Rolf','Carcas'),(35,'Cherie','Mallebone'),(36,'Elle','Bittany'),(37,'Rurik','Pittway'),(38,'Byram','Mauger'),(39,'Camella','Martynov'),(40,'Shelbi','Arter'),(41,'Dahlia','Di Franceschi'),(42,'Selia','Gioan'),(43,'Ryley','Taberer'),(44,'Danette','Duignan'),(45,'Joanie','Raiker'),(46,'Gunar','Midgley'),(47,'Eal','Malkin'),(48,'Ferdinand','Volker'),(49,'Thaddeus','Polycote'),(50,'Hanni','Crothers');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `autores_libro`
--

LOCK TABLES `autores_libro` WRITE;
/*!40000 ALTER TABLE `autores_libro` DISABLE KEYS */;
INSERT INTO `autores_libro` VALUES ('015794603-7',1,3),('015794603-7',17,2),('015794603-7',41,1),('015794603-7',48,4),('016133730-9',1,1),('021227150-4',5,1),('051749109-5',6,1),('056456979-8',36,1),('059290692-2',28,1),('095087802-2',10,1),('106395212-3',4,1),('116276221-7',15,1),('116276221-7',50,2),('143204729-9',3,2),('143204729-9',35,1),('154757947-1',37,1),('216680255-9',47,1),('234256998-X',32,1),('241788698-7',3,1),('245742786-X',9,1),('333314525-1',33,1),('338007338-5',18,1),('366044982-2',20,1),('379740938-9',50,1),('412823446-X',12,1),('422954603-3',29,1),('434912049-1',2,1),('434912049-1',48,2),('439777150-2',21,1),('441480480-9',25,1),('460484062-8',24,1),('460484062-8',48,2),('504786802-8',38,2),('504786802-8',48,1),('504801070-1',17,1),('507604456-9',49,1),('580413621-6',14,1),('581077012-6',42,1),('594892597-8',22,1),('619405503-0',34,1),('620305985-4',16,1),('626466582-7',45,1),('643673769-3',40,1),('681631728-9',7,1),('681631728-9',18,2),('681631728-9',33,3),('686847120-3',31,1),('704281565-3',23,1),('808561492-8',44,1),('820698367-8',27,1),('822098574-7',11,1),('831321534-8',30,1),('867218075-5',8,1),('869521514-8',19,2),('869521514-8',46,1),('873824580-9',43,1),('882826461-6',39,1),('902354870-1',13,1),('902354870-1',42,2),('945010905-2',19,1),('971059199-1',38,1),('972805617-6',26,1);
/*!40000 ALTER TABLE `autores_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `campus`
--

LOCK TABLES `campus` WRITE;
/*!40000 ALTER TABLE `campus` DISABLE KEYS */;
INSERT INTO `campus` VALUES (1,'Universidad','San Nicolas'),(2,'Mederos','Monterrey'),(3,'Ciencias de la Salud','Monterrey'),(4,'Ciencias Agropecuarias','General Escobedo');
/*!40000 ALTER TABLE `campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Agronomia',1,1),(2,'Agronegocios',2,1),(3,'Arquitectura',1,2),(4,'Arte Teatral',1,3),(5,'Diseno Grafico',1,4),(6,'Biologia',1,5),(7,'Microbiologia',2,5),(8,'Microbiologia',3,5),(9,'Ciencias de la Comunicacion',1,6),(10,'Mercadotecnia',1,6),(11,'Actuaria',1,7),(12,'Ciencias Computacionales',1,7),(13,'Fisica',1,7),(14,'Matematicas',1,7),(15,'Ciencia de Datos',2,7),(16,'Ingenieria Fisica',3,7),(17,'Ciencias Politicas',1,8),(18,'Relaciones Internacionales',1,8),(19,'Negocios Digitales',2,8),(20,'Ingeniero Industrial Administrador',1,9),(21,'Ingenieria Quimica',1,9),(22,'Administracion',1,10),(23,'Negocios Internacionales',1,10),(24,'Contador Publico',1,10),(25,'Derecho',1,11),(26,'Criminologia',1,11),(27,'Economia',1,12),(28,'Ingenieria Civil',1,13),(29,'Aeronautica',1,14),(30,'Mecatronica',1,14),(31,'Medico Cirujano',1,15),(32,'Veterinaria',1,16),(33,'Odontologia',1,17),(34,'Psicologia',1,18),(35,'Nutricion',1,19);
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES (1,'Tromp, Farrell and Collins'),(2,'Mohr-Kuhn'),(3,'Jacobs-Wiegand'),(4,'Quigley-Sawayn'),(5,'Crist, Feest and Padberg'),(6,'Carter-Labadie'),(7,'Friesen Group'),(8,'Bahringer-Conroy'),(9,'Gerhold-D\'Amore'),(10,'Hamill Inc'),(11,'Connelly Group'),(12,'Farrell, Raynor and Walter'),(13,'Luettgen-Hammes'),(14,'Hammes-Kirlin'),(15,'Hettinger LLC'),(16,'O\'Reilly, Bode and Erdman'),(17,'Auer, Grant and Funk'),(18,'Steuber and Sons'),(19,'Volkman LLC'),(20,'Prosacco Group'),(21,'Mann-Fahey'),(22,'Ward Inc'),(23,'Purdy-Kassulke'),(24,'Koch Inc'),(25,'Ledner-Sporer');
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (1700687,'Rana','Volk',20,34,6,'ranvolk@uanl.edu.mx','M'),(1701090,'Bonnibelle','Hebborne',20,14,10,'bonhebborne@uanl.edu.mx','M'),(1701210,'Therese','Francesc',18,6,4,'thefrancesc@uanl.edu.mx','M'),(1701437,'Nert','MacDonald',18,5,4,'nermacdonald@uanl.edu.mx','M'),(1701695,'Merissa','Hayley',20,4,6,'merhayley@uanl.edu.mx','M'),(1702467,'Emile','Michael',20,21,6,'emimichael@uanl.edu.mx','H'),(1702668,'Francklyn','Elflain',20,32,8,'fraelflain@uanl.edu.mx','H'),(1702873,'Dante','Martina',21,9,9,'danmartina@uanl.edu.mx','H'),(1703180,'Marvin','Donohoe',20,27,7,'mardonohoe@uanl.edu.mx','H'),(1703554,'Neila','McClaren',19,4,4,'neimcclaren@uanl.edu.mx','M'),(1703588,'Merrill','Porrett',19,24,3,'merporrett@uanl.edu.mx','M'),(1704351,'Frans','Kesterton',18,16,1,'frakesterton@uanl.edu.mx','H'),(1705189,'Milo','Remmers',18,26,4,'milremmers@uanl.edu.mx','H'),(1705654,'Wilhelm','Lindenfeld',21,34,5,'willindenfeld@uanl.edu.mx','H'),(1705930,'Alwyn','Haily',18,7,3,'alwhaily@uanl.edu.mx','H'),(1706078,'Cora','Hammond',18,9,2,'corhammond@uanl.edu.mx','M'),(1706917,'Shalne','Thunderchief',18,16,3,'shathunderchief@uanl.edu.mx','M'),(1709158,'Freeman','Das',20,15,10,'fredas@uanl.edu.mx','H'),(1709462,'Cthrine','Alner',20,32,5,'cthalner@uanl.edu.mx','M'),(1710836,'Putnam','Bending',20,1,6,'putbending@uanl.edu.mx','H'),(1711487,'Milzie','Barlow',20,20,10,'milbarlow@uanl.edu.mx','M'),(1711889,'Gib','Jedrych',20,33,10,'gibjedrych@uanl.edu.mx','H'),(1714748,'Harbert','Burtwistle',19,28,3,'harburtwistle@uanl.edu.mx','H'),(1715586,'Yevette','Aberdein',18,5,2,'yevaberdein@uanl.edu.mx','M'),(1717303,'Cristina','Pallin',20,2,10,'cripallin@uanl.edu.mx','M'),(1717645,'Otto','Bohman',19,6,1,'ottbohman@uanl.edu.mx','H'),(1718428,'Efren','Rochford',19,13,2,'efrrochford@uanl.edu.mx','H'),(1719086,'Avrit','Fine',18,12,2,'avrfine@uanl.edu.mx','M'),(1719512,'Misty','Ormshaw',21,1,8,'misormshaw@uanl.edu.mx','M'),(1719960,'Flin','Gambell',19,3,3,'fligambell@uanl.edu.mx','H'),(1720984,'Ninon','Loachhead',21,22,6,'ninloachhead@uanl.edu.mx','M'),(1721724,'Templeton','Brettor',19,7,2,'tembrettor@uanl.edu.mx','H'),(1722764,'Berri','Georgeot',21,21,5,'bergeorgeot@uanl.edu.mx','M'),(1723031,'Eada','Dubarry',18,27,1,'eaddubarry@uanl.edu.mx','M'),(1723116,'Reggis','Pearne',21,15,5,'regpearne@uanl.edu.mx','H'),(1724309,'Daisy','Tedorenko',21,2,9,'daitedorenko@uanl.edu.mx','M'),(1724680,'Drucie','Drinnan',19,4,3,'drudrinnan@uanl.edu.mx','M'),(1726221,'Alleyn','Grinishin',18,24,3,'allgrinishin@uanl.edu.mx','H'),(1726853,'Madonna','Decroix',20,15,6,'maddecroix@uanl.edu.mx','M'),(1728231,'Carolus','Goodayle',21,10,10,'cargoodayle@uanl.edu.mx','H'),(1728614,'Homer','Raubenheim',20,20,7,'homraubenheim@uanl.edu.mx','H'),(1728944,'Oralle','Gull',19,33,4,'oragull@uanl.edu.mx','M'),(1729424,'Claudell','Bloor',21,5,5,'clabloor@uanl.edu.mx','H'),(1733464,'Nicolis','Gulley',18,2,4,'nicgulley@uanl.edu.mx','H'),(1733567,'Bartel','Marsay',18,9,1,'barmarsay@uanl.edu.mx','H'),(1737519,'Errick','Sabatier',18,2,4,'errsabatier@uanl.edu.mx','H'),(1737846,'Brion','Kewley',21,15,7,'brikewley@uanl.edu.mx','H'),(1738610,'Ami','Porteous',19,13,4,'amiporteous@uanl.edu.mx','M'),(1738928,'Reg','Thomasset',19,3,3,'regthomasset@uanl.edu.mx','H'),(1739629,'Darcy','Sidebottom',20,28,7,'darsidebottom@uanl.edu.mx','M'),(1739885,'Iormina','Wressell',19,22,3,'iorwressell@uanl.edu.mx','M'),(1741652,'Dell','Burdfield',19,7,3,'delburdfield@uanl.edu.mx','M'),(1742265,'Artur','Tynan',21,35,6,'arttynan@uanl.edu.mx','H'),(1742847,'Vivian','Sparshutt',19,11,2,'vivsparshutt@uanl.edu.mx','M'),(1743678,'Cully','Kerfod',18,17,2,'culkerfod@uanl.edu.mx','H'),(1743811,'Glendon','Kunert',20,6,9,'glekunert@uanl.edu.mx','H'),(1743846,'Merrill','Knifton',19,32,3,'merknifton@uanl.edu.mx','M'),(1744396,'Blakelee','Lucius',19,24,2,'blalucius@uanl.edu.mx','M'),(1744932,'Elfrieda','Lambdon',21,3,5,'elflambdon@uanl.edu.mx','M'),(1747581,'Pat','Borland',21,22,10,'patborland@uanl.edu.mx','H'),(1750419,'Paige','Valerio',19,10,2,'paivalerio@uanl.edu.mx','M'),(1750511,'Crawford','Laurie',18,23,4,'cralaurie@uanl.edu.mx','H'),(1750791,'Ava','Ewenson',18,29,2,'avaewenson@uanl.edu.mx','M'),(1756966,'Cristobal','Duncanson',19,28,2,'criduncanson@uanl.edu.mx','H'),(1758344,'Isidoro','Popworth',19,35,2,'isipopworth@uanl.edu.mx','H'),(1759522,'Ilario','Senner',19,16,2,'ilasenner@uanl.edu.mx','H'),(1760208,'Cathee','Claricoats',18,18,4,'catclaricoats@uanl.edu.mx','M'),(1761130,'Corabelle','Kinchin',20,33,10,'corkinchin@uanl.edu.mx','M'),(1762504,'Veda','Minshull',20,17,10,'vedminshull@uanl.edu.mx','M'),(1766186,'Rani','Reddoch',20,13,9,'ranreddoch@uanl.edu.mx','M'),(1769282,'Winifield','Yokel',21,6,5,'winyokel@uanl.edu.mx','H'),(1769839,'Lynnell','Heatly',21,9,9,'lynheatly@uanl.edu.mx','M'),(1773451,'Eduino','Buckenham',18,29,1,'edubuckenham@uanl.edu.mx','H'),(1773710,'Eben','Millhouse',18,31,4,'ebemillhouse@uanl.edu.mx','H'),(1774190,'Douglass','Sear',18,14,4,'dousear@uanl.edu.mx','H'),(1775188,'Sal','Moore',19,30,2,'salmoore@uanl.edu.mx','H'),(1775414,'Guillermo','McDyer',20,23,8,'guimcdyer@uanl.edu.mx','H'),(1778762,'Thorstein','Kunc',18,20,1,'thokunc@uanl.edu.mx','H'),(1778942,'Lemmie','Vedmore',19,15,4,'lemvedmore@uanl.edu.mx','H'),(1779003,'Steffen','Iwanicki',21,18,9,'steiwanicki@uanl.edu.mx','H'),(1779471,'Betsey','Latek',19,25,3,'betlatek@uanl.edu.mx','M'),(1780973,'Mylo','Bentjens',19,27,3,'mylbentjens@uanl.edu.mx','H'),(1781905,'Tomlin','De Filippis',19,6,4,'tomde filippis@uanl.edu.mx','H'),(1783093,'Addia','Ramstead',18,17,1,'addramstead@uanl.edu.mx','M'),(1784735,'Tasha','Willmont',20,32,5,'taswillmont@uanl.edu.mx','M'),(1785296,'Tami','Toplis',20,25,10,'tamtoplis@uanl.edu.mx','M'),(1786069,'Mikel','Ingleston',19,23,2,'mikingleston@uanl.edu.mx','H'),(1786154,'Laetitia','Grigsby',21,30,9,'laegrigsby@uanl.edu.mx','M'),(1786259,'Clay','Sterland',20,3,6,'clasterland@uanl.edu.mx','H'),(1786888,'Ailyn','Sherrett',18,17,2,'ailsherrett@uanl.edu.mx','M'),(1787091,'Sid','Margetts',19,31,4,'sidmargetts@uanl.edu.mx','H'),(1788049,'Lanny','Deroche',18,8,4,'landeroche@uanl.edu.mx','H'),(1788425,'Bernadine','Merrett',19,8,4,'bermerrett@uanl.edu.mx','M'),(1789141,'Ferdinande','Radish',20,27,7,'ferradish@uanl.edu.mx','M'),(1791000,'Guinevere','Threadgall',20,26,9,'guithreadgall@uanl.edu.mx','M'),(1791312,'Margret','Levane',21,34,6,'marlevane@uanl.edu.mx','M'),(1791721,'Erik','Baverstock',19,33,2,'eribaverstock@uanl.edu.mx','H'),(1791978,'Victor','Trevains',21,23,10,'victrevains@uanl.edu.mx','H'),(1798007,'Noelani','Wharton',18,19,1,'noewharton@uanl.edu.mx','M'),(1799242,'Cash','Collingdon',20,29,8,'cascollingdon@uanl.edu.mx','H');
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES (1,'FA','Facultad de Agronomia',4),(2,'FARQ','Facultad de Arquitectura',1),(3,'FAE','Facultad de Artes Escenicas',2),(4,'FAV','Facultad de Artes Visuales',2),(5,'FCB','Facultad de Ciencias Biologicas',1),(6,'FCC','Facultad de Ciencias de la Comunicacion',2),(7,'FCFM','Facultad de Ciencias Fisico Matematicas',1),(8,'FCPyRI','Facultad de Ciencias Politicas y Relaciones Internacionales',2),(9,'FCQ','Facultad de Ciencias Quimicas',1),(10,'FACPyA','Facultad de Contaduria Publica y Administracion',1),(11,'FACDyC','Facultad de Derecho y Criminologia',1),(12,'FAECO','Facultad de Economia',2),(13,'FIC','Facultad de Ingenieria Civil',1),(14,'FIME','Facultad de Ingenieria Mecanica y Electrica',1),(15,'FAMED','Facultad de Medicina',3),(16,'FMVZ','Facultad de Medicina Veterinaria y Zootecnia',4),(17,'FAO','Facultad de Odontologia',3),(18,'FAPSI','Facultad de Psicologia',3),(19,'FASPyN','Facultad de Salud Publica y Nutricion',3);
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `formato`
--

LOCK TABLES `formato` WRITE;
/*!40000 ALTER TABLE `formato` DISABLE KEYS */;
INSERT INTO `formato` VALUES (1,'Pasta Blanda'),(2,'Pasta Dura');
/*!40000 ALTER TABLE `formato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Autobiografia'),(2,'Biografia'),(3,'Arte y Fotografia'),(4,'Autoayuda'),(5,'Historia'),(6,'Casos Reales'),(7,'Ensayos'),(8,'Guias/Tutoriales'),(9,'Religion/Espiritualidad'),(10,'Humanidades/Ciencias Sociales'),(11,'Ciencia'),(12,'Tecnologia');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `grado`
--

LOCK TABLES `grado` WRITE;
/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
INSERT INTO `grado` VALUES (1,'Licenciatura'),(2,'Maestria'),(3,'Doctorado');
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `inv_libro`
--

LOCK TABLES `inv_libro` WRITE;
/*!40000 ALTER TABLE `inv_libro` DISABLE KEYS */;
INSERT INTO `inv_libro` VALUES (97,'015794603-7'),(1,'016133730-9'),(2,'016133730-9'),(3,'016133730-9'),(4,'016133730-9'),(11,'021227150-4'),(12,'021227150-4'),(13,'021227150-4'),(14,'021227150-4'),(15,'051749109-5'),(16,'051749109-5'),(17,'051749109-5'),(87,'056456979-8'),(70,'059290692-2'),(71,'059290692-2'),(72,'059290692-2'),(24,'095087802-2'),(25,'095087802-2'),(10,'106395212-3'),(37,'116276221-7'),(38,'116276221-7'),(86,'143204729-9'),(88,'154757947-1'),(89,'154757947-1'),(90,'154757947-1'),(109,'216680255-9'),(110,'216680255-9'),(81,'234256998-X'),(8,'241788698-7'),(9,'241788698-7'),(21,'245742786-X'),(22,'245742786-X'),(23,'245742786-X'),(82,'333314525-1'),(43,'338007338-5'),(44,'338007338-5'),(45,'338007338-5'),(48,'366044982-2'),(49,'366044982-2'),(50,'366044982-2'),(114,'379740938-9'),(28,'412823446-X'),(29,'412823446-X'),(30,'412823446-X'),(31,'412823446-X'),(73,'422954603-3'),(74,'422954603-3'),(5,'434912049-1'),(6,'434912049-1'),(7,'434912049-1'),(51,'439777150-2'),(52,'439777150-2'),(53,'439777150-2'),(54,'439777150-2'),(63,'441480480-9'),(64,'441480480-9'),(65,'441480480-9'),(57,'460484062-8'),(58,'460484062-8'),(59,'460484062-8'),(60,'460484062-8'),(61,'460484062-8'),(62,'460484062-8'),(111,'504786802-8'),(41,'504801070-1'),(42,'504801070-1'),(112,'507604456-9'),(113,'507604456-9'),(34,'580413621-6'),(35,'580413621-6'),(36,'580413621-6'),(98,'581077012-6'),(99,'581077012-6'),(100,'581077012-6'),(55,'594892597-8'),(83,'619405503-0'),(84,'619405503-0'),(85,'619405503-0'),(39,'620305985-4'),(40,'620305985-4'),(105,'626466582-7'),(96,'643673769-3'),(18,'681631728-9'),(19,'681631728-9'),(79,'686847120-3'),(80,'686847120-3'),(56,'704281565-3'),(103,'808561492-8'),(104,'808561492-8'),(68,'820698367-8'),(69,'820698367-8'),(26,'822098574-7'),(27,'822098574-7'),(75,'831321534-8'),(76,'831321534-8'),(77,'831321534-8'),(78,'831321534-8'),(20,'867218075-5'),(106,'869521514-8'),(107,'869521514-8'),(108,'869521514-8'),(101,'873824580-9'),(102,'873824580-9'),(93,'882826461-6'),(94,'882826461-6'),(95,'882826461-6'),(32,'902354870-1'),(33,'902354870-1'),(46,'945010905-2'),(47,'945010905-2'),(91,'971059199-1'),(92,'971059199-1'),(66,'972805617-6'),(67,'972805617-6');
/*!40000 ALTER TABLE `inv_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES ('015794603-7','Haliaeetus leucoryphus',1,1995,5,4,2),('016133730-9','Haliaeetus leucocephalus',4,1991,7,20,2),('021227150-4','Macropus eugenii',2,2002,5,15,1),('051749109-5','Psophia viridis',3,2018,12,8,2),('056456979-8','Platalea leucordia',2,1994,8,18,2),('059290692-2','Stercorarius longicausus',1,2016,5,3,2),('095087802-2','Spermophilus richardsonii',2,1993,6,8,2),('106395212-3','unavailable',4,1997,1,25,1),('111111111-1','Primero',1,2000,4,2,1),('116276221-7','Hyaena hyaena',4,1995,5,8,1),('143204729-9','Bassariscus astutus',3,1991,6,16,1),('154757947-1','Antilope cervicapra',1,2011,1,11,2),('216680255-9','Bison bison',1,1997,4,14,1),('222222222-2','Segundo',1,2001,6,19,1),('234256998-X','Pelecanus conspicillatus',3,2011,5,8,2),('241788698-7','Cacatua tenuirostris',3,2003,7,6,2),('245742786-X','Laniarius ferrugineus',2,2006,6,4,1),('333314525-1','Otaria flavescens',3,1992,11,21,2),('333333333-3','Tercero',3,2002,9,12,1),('338007338-5','Echimys chrysurus',4,1995,7,20,1),('366044982-2','Diomedea irrorata',1,2016,3,18,2),('379740938-9','Tockus erythrorhyncus',4,2015,9,20,1),('412823446-X','Casmerodius albus',1,2002,9,23,2),('422954603-3','Anastomus oscitans',3,2010,10,5,2),('434912049-1','Boa constrictor mexicana',7,2012,11,8,2),('439777150-2','Speotyte cuniculata',1,2003,12,20,2),('441480480-9','Ovis musimon',2,2012,8,2,1),('444444444-4','Cuarto',2,2003,10,5,1),('460484062-8','Calyptorhynchus magnificus',1,1994,4,18,2),('504786802-8','Lamprotornis nitens',4,2006,10,10,2),('504801070-1','Bassariscus astutus',4,2013,12,16,2),('507604456-9','Alopex lagopus',3,2010,6,13,1),('555555555-5','Quinto',4,2004,1,2,2),('580413621-6','Spheniscus magellanicus',3,2012,1,20,1),('581077012-6','Marmota flaviventris',3,2003,11,8,2),('594892597-8','Propithecus verreauxi',4,1997,1,3,1),('619405503-0','Theropithecus gelada',2,2018,3,7,1),('620305985-4','Hystrix cristata',3,2000,8,20,1),('626466582-7','Thamnolaea cinnmomeiventris',2,2006,5,15,2),('643673769-3','Manouria emys',3,1993,11,23,1),('666666666-6','Sexto',6,2005,7,18,2),('681631728-9','Parus atricapillus',4,1995,9,22,2),('686847120-3','Gyps bengalensis',3,1998,10,25,2),('704281565-3','Tragelaphus angasi',2,1995,9,6,2),('777777777-7','Septimo',4,2006,2,2,2),('808561492-8','Vanellus sp.',3,2019,5,2,1),('820698367-8','Oncorhynchus nerka',3,2018,3,12,2),('822098574-7','Bubo sp.',3,2016,3,13,1),('831321534-8','Herpestes javanicus',4,2005,1,13,1),('867218075-5','Ciconia ciconia',1,2017,9,25,2),('869521514-8','Tiliqua scincoides',4,2003,9,15,2),('873824580-9','Geochelone elephantopus',3,2017,3,20,1),('882826461-6','Corvus brachyrhynchos',4,1992,6,18,2),('888888888-8','Octavo',9,2007,10,20,2),('902354870-1','Lamprotornis sp.',3,1992,11,14,1),('945010905-2','Phascolarctos cinereus',3,1990,7,13,2),('971059199-1','Castor canadensis',4,1995,11,20,2),('972805617-6','Francolinus leucoscepus',3,1999,2,16,2);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-01 15:50:58
