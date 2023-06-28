-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: omdb
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `ActoresPersonajes`
--

DROP TABLE IF EXISTS `ActoresPersonajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ActoresPersonajes` (
  `id_Participacion` int NOT NULL,
  `Personaje` varchar(50) NOT NULL DEFAULT '-',
  `id_Tipo` int NOT NULL DEFAULT '0',
  KEY `id_Participacion` (`id_Participacion`),
  KEY `id_Tipo` (`id_Tipo`),
  CONSTRAINT `ActoresPersonajes_ibfk_1` FOREIGN KEY (`id_Participacion`) REFERENCES `Participacion` (`ID`),
  CONSTRAINT `ActoresPersonajes_ibfk_2` FOREIGN KEY (`id_Tipo`) REFERENCES `TiposPersonajes` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ActoresPersonajes`
--

LOCK TABLES `ActoresPersonajes` WRITE;
/*!40000 ALTER TABLE `ActoresPersonajes` DISABLE KEYS */;
INSERT INTO `ActoresPersonajes` VALUES (2,'Marty McFly',1),(3,'Dr. Emmett Brown',1),(4,'Lorraine Baines McFly',2),(5,'George McFly',2),(15,'Rose DeWitt Bukater',1),(16,'Jack',1),(17,'Ruth Dewitt Bukaterv',2),(18,'Caledon \'Cal\' Hockley ',2),(20,'Luke Skywalker',1),(21,'Han Solo',1),(22,'Chihiro',1),(24,'Haru',1),(25,'Joy',1),(26,'Sadness',1),(27,'Fear',1),(29,'William Wallace',1),(32,'Forrest Gump',1),(33,'Jenny',2),(34,'Detective',1),(35,'Roger Rabbit',1),(37,'Indiana Jones',1),(39,'Henry Jones',1),(40,'Alan',0),(42,'Sarah',2),(43,'Javier',1),(44,'Analista',2),(10,'Marty McFly',1),(11,'Dr. Emmett Brown',1),(12,'Marty McFly',1),(13,'Dr. Emmett Brown',1),(49,'\'X\'',1),(50,'\'H\'',1),(51,'\'Z\'',1),(52,'John Lennon',1),(53,'Paul McCartney',1),(54,'George Harrison',1),(55,'Ringo Starr',1),(55,'Narrator',2),(55,'Blue Meanie',2),(56,'Young/Old Fred',2),(61,'Gaturro',1),(63,'Indiana Jones',1),(64,'Indiana Jones',1);
/*!40000 ALTER TABLE `ActoresPersonajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Generos`
--

DROP TABLE IF EXISTS `Generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Generos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) NOT NULL DEFAULT '-',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Generos`
--

LOCK TABLES `Generos` WRITE;
/*!40000 ALTER TABLE `Generos` DISABLE KEYS */;
INSERT INTO `Generos` VALUES (1,'Indefinido'),(2,'Accion'),(3,'Aventura'),(4,'Suspenso'),(5,'Thriller'),(6,'Terror'),(7,'Drama'),(8,'Romance'),(9,'Ciencia Ficcion'),(10,'Animacion 2D'),(11,'Animacion 3D'),(12,'Infantil'),(13,'Comedia'),(14,'Musical');
/*!40000 ALTER TABLE `Generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GenerosPorPelicula`
--

DROP TABLE IF EXISTS `GenerosPorPelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GenerosPorPelicula` (
  `id_Pelicula` int NOT NULL DEFAULT '0',
  `id_genero` int NOT NULL DEFAULT '1',
  KEY `id_pelicula` (`id_Pelicula`),
  KEY `id_genero` (`id_genero`),
  CONSTRAINT `GenerosPorPelicula_ibfk_1` FOREIGN KEY (`id_Pelicula`) REFERENCES `Peliculas` (`ID`),
  CONSTRAINT `GenerosPorPelicula_ibfk_2` FOREIGN KEY (`id_genero`) REFERENCES `Generos` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GenerosPorPelicula`
--

LOCK TABLES `GenerosPorPelicula` WRITE;
/*!40000 ALTER TABLE `GenerosPorPelicula` DISABLE KEYS */;
INSERT INTO `GenerosPorPelicula` VALUES (1,3),(2,3),(5,3),(1,9),(2,9),(5,9),(4,7),(4,8),(5,9),(5,2),(5,3),(6,10),(6,3),(7,12),(7,3),(7,11),(8,2),(8,7),(9,3),(9,7),(9,8),(9,13),(10,3),(10,13),(10,10),(11,2),(11,3),(11,8),(17,2),(17,3),(17,8),(18,2),(18,3),(18,8),(12,13),(12,12),(12,3),(13,13),(13,8),(13,7),(14,3),(14,4),(14,5),(14,7),(15,10),(15,12),(15,13),(15,3),(15,14),(16,12),(16,14),(16,8),(16,3),(16,10);
/*!40000 ALTER TABLE `GenerosPorPelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Idiomas`
--

DROP TABLE IF EXISTS `Idiomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Idiomas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) NOT NULL DEFAULT '-',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Idiomas`
--

LOCK TABLES `Idiomas` WRITE;
/*!40000 ALTER TABLE `Idiomas` DISABLE KEYS */;
INSERT INTO `Idiomas` VALUES (1,'Indefinido'),(2,'Español'),(3,'Inglés'),(4,'Frances'),(5,'Aleman'),(6,'Italiano'),(7,'Catalan'),(8,'Tagalo'),(9,'Japonés');
/*!40000 ALTER TABLE `Idiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nominaciones`
--

DROP TABLE IF EXISTS `Nominaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Nominaciones` (
  `id_Pelicula` int NOT NULL DEFAULT '0',
  `id_premio` int NOT NULL DEFAULT '1',
  `Ganadora` tinyint(1) NOT NULL,
  `Observaciones` varchar(100) NOT NULL DEFAULT '-',
  KEY `id_pelicula` (`id_Pelicula`),
  KEY `id_premio` (`id_premio`),
  CONSTRAINT `Nominaciones_ibfk_1` FOREIGN KEY (`id_Pelicula`) REFERENCES `Peliculas` (`ID`),
  CONSTRAINT `Nominaciones_ibfk_2` FOREIGN KEY (`id_premio`) REFERENCES `Premios` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nominaciones`
--

LOCK TABLES `Nominaciones` WRITE;
/*!40000 ALTER TABLE `Nominaciones` DISABLE KEYS */;
INSERT INTO `Nominaciones` VALUES (4,2,1,'Mejor Pelicula'),(4,2,1,'Mejor Director'),(4,2,1,'Mejor Direccion de Arte'),(4,2,1,'Mejor Fotografia'),(4,2,1,'Mejor Diseño de Vestuario'),(4,2,1,'Mejores Efectos Visuales'),(4,2,1,'Mejor Montaje'),(4,2,1,'Mejor Sonido'),(4,2,1,'Mejor Banda Sonora'),(4,2,1,'Mejor Cancion Original'),(4,2,1,'Mejor Edicion de Sonido'),(4,2,0,'Mejor Actriz'),(4,2,0,'Mejor Actriz de Reparto'),(4,2,0,'Mejor Maquillaje'),(4,3,1,'Mejor Director'),(4,3,1,'Mejor Pelicula Dramática'),(4,3,0,'Mejor Actor - Drama'),(5,2,0,'Mejor Película'),(5,2,0,'Mejores Efectos Visuales'),(5,5,1,'Mejor banda sonora escrita para una película '),(5,6,1,'Premio a la trayectoria '),(6,2,1,'Mejor Pelicula de Animación'),(7,2,1,'Mejor Pelicula de Animación'),(7,2,0,'Mejor Guión Original'),(8,2,1,'Mejor Película'),(8,2,0,'Mejor Sonido'),(8,2,1,'Mejor Director'),(1,2,1,'Mejor Edicion de Sonido'),(9,2,1,'Mejor Pelicula'),(10,2,1,'Mejor Edicion de Sonido'),(10,2,1,'Mejores Efectos Visuales'),(10,2,0,'Mejor Dirección de Arte'),(10,2,1,'Mejor Edición'),(9,2,1,'Mejor Director'),(9,2,1,'Mejor Actor'),(9,2,1,'Mejor Actor de Reparto'),(9,2,0,'Mejor Banda Sonora'),(9,2,1,'Mejor Montaje'),(9,2,1,'Mejores Efectos Visuales'),(11,2,1,'Mejor Edición de Sonido'),(11,2,0,'Mejor Banda Sonora Original'),(14,7,1,'Premio del Público'),(14,7,1,'Premio Especial Del Jurado'),(17,2,1,'Mejor Dirección de Arte'),(17,2,1,'Mejor Sonido'),(17,2,1,'Mejores Efectos Visuales'),(17,2,0,'Mejor Pelicula'),(17,2,0,'Mejor Director');
/*!40000 ALTER TABLE `Nominaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Participacion`
--

DROP TABLE IF EXISTS `Participacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Participacion` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `id_Pelicula` int NOT NULL DEFAULT '0',
  `id_Persona` int NOT NULL DEFAULT '1',
  `id_Rol` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `id_Pelicula` (`id_Pelicula`),
  KEY `id_Persona` (`id_Persona`),
  KEY `id_Rol` (`id_Rol`),
  CONSTRAINT `Participacion_ibfk_1` FOREIGN KEY (`id_Pelicula`) REFERENCES `Peliculas` (`ID`),
  CONSTRAINT `Participacion_ibfk_2` FOREIGN KEY (`id_Persona`) REFERENCES `Personas` (`ID`),
  CONSTRAINT `Participacion_ibfk_3` FOREIGN KEY (`id_Rol`) REFERENCES `Roles` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Participacion`
--

LOCK TABLES `Participacion` WRITE;
/*!40000 ALTER TABLE `Participacion` DISABLE KEYS */;
INSERT INTO `Participacion` VALUES (1,1,2,1),(2,1,3,4),(3,1,4,4),(4,1,5,4),(5,1,6,4),(6,1,2,6),(7,1,7,6),(8,1,7,2),(9,1,8,3),(10,2,3,4),(11,2,4,4),(12,3,3,4),(13,3,4,4),(14,4,13,1),(15,4,9,4),(16,4,10,4),(17,4,11,4),(18,4,12,4),(19,5,19,1),(20,5,14,4),(21,5,15,4),(22,6,17,5),(23,6,18,1),(24,6,16,5),(25,7,20,5),(26,7,21,5),(27,7,22,5),(28,7,23,1),(29,8,24,4),(30,8,24,1),(31,9,2,1),(32,9,25,4),(33,9,26,4),(34,10,27,5),(35,10,28,5),(36,10,2,1),(37,11,15,4),(38,11,29,1),(39,11,30,4),(40,12,31,4),(41,12,32,1),(42,12,33,4),(43,13,34,4),(44,13,35,4),(45,13,37,1),(46,2,2,1),(47,3,2,1),(48,14,38,1),(49,14,38,4),(50,14,39,4),(51,14,40,4),(52,15,41,5),(53,15,42,5),(54,15,43,5),(55,15,44,5),(56,15,45,5),(57,15,46,1),(58,15,47,7),(59,16,48,1),(60,16,49,6),(61,16,50,5),(62,17,29,1),(63,17,15,4),(64,18,15,4),(65,18,51,1);
/*!40000 ALTER TABLE `Participacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Peliculas`
--

DROP TABLE IF EXISTS `Peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Peliculas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `id_idiomaOriginal` int NOT NULL DEFAULT '1',
  `AnioPublicacion` date NOT NULL DEFAULT '1800-01-01',
  `Duracion` int NOT NULL DEFAULT '0',
  `Presupuesto` int unsigned NOT NULL DEFAULT '0',
  `RecaudacionTaquilla` int NOT NULL DEFAULT '0',
  `Rating` varchar(5) NOT NULL DEFAULT 'S/C',
  `Resumen` text,
  PRIMARY KEY (`ID`),
  KEY `id_idiomaOriginal` (`id_idiomaOriginal`),
  CONSTRAINT `Peliculas_ibfk_1` FOREIGN KEY (`id_idiomaOriginal`) REFERENCES `Idiomas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Peliculas`
--

LOCK TABLES `Peliculas` WRITE;
/*!40000 ALTER TABLE `Peliculas` DISABLE KEYS */;
INSERT INTO `Peliculas` VALUES (0,1,'1900-01-01',0,0,0,'S/C','indefinido'),(1,3,'1985-07-03',111,19000000,381109762,'PG13','The first film of the trilogy as teenager Marty Mcfly travels back in time with help from his friend and time machine inventor Dr. Brown. Marty travels from 1985 back to 1955 running into people he knows like his parents. When it’s time to go back to the future Marty runs into a few unforeseen problems and time is running out.'),(2,3,'1989-11-22',108,40000000,332000000,'PG13','Back to the Future 2 is the second and most complicated film of the series. The film has alternate dimensions, time-traveling mishaps, and a disrupted future caused by Marty Mcfly’s accidental alteration of past evens. An exhilarating story with exciting special affect make this a fun movie to watch.'),(3,3,'1990-05-25',118,40000000,400000000,'PG13','The final installment of amusing time-traveling trilogy Back to the Future sends Marty and his scientist friend Doc Brown back in time to the Old West in the year 1885. Things are rosy until Marty must somehow travel in time to prevent Doc from being shot dead.'),(4,3,'1997-12-18',194,200000000,2100000000,'PG16','Titanic is the blockbuster film from James Cameron starring Leonardo DiCaprio and Kate Winslet as the young lovers on the doomed maiden voyage of the Titanic across the Atlantic Ocean. Commercially the film became the most successful movie of all time.'),(5,3,'1977-05-25',121,11000000,775000000,'PG13','A New Hope was the first Star Wars film from the director, screenwriter, and producer George Lucas, although it is the fourth episode in the series of six. Luke Skywalker, Princes Leia, Darth Vader, C3PO, R2D2 and many other characters from the film are now house-hold-names from one of the most successful film projects of all time.'),(6,9,'2001-07-20',125,0,277000000,'ALL','Spirited Away is an Oscar winning Japanese animated film about a ten year old girl who wonders away from her parents along a path that leads to a world ruled by strange and unusual monster-like animals. Her parents have been changed into pigs along with others inside a bathhouse full of these creatures. Will she ever see the world how it once was?'),(7,3,'2015-05-18',102,175000000,857000000,'ALL','The young girl Riley has to move to a new town with her parents. Her personified emotions try to help her to cope with the new situation.'),(8,3,'1995-05-24',177,72000000,210000000,'PG13','Braveheart is the lavish Hollywood production of an English occupied Scottish Highlands in the 13th century. Mel Gibson plays the roll of a historical freedom fighter and national hero named William Wallace. The brave Wallace must inspire his people to fight for their freedom against great odds. The film became the most successful film at the Oscars in 1995.'),(9,3,'1994-06-23',142,55000000,679000000,'PG13','This film tells the many unbelievable life adventures of a small town not-so-intelligent man named Forrest Gump. Throughout his life Forrest Gump influences popular culture, meets many famous people, and is witness to many historical events most of which he is unaware of their significance. '),(10,3,'1988-06-21',103,70000000,329000000,'ALL','In the 1940’s Hollywood there are not only people but cartoon characters starring in films. Roger Rabbit, one of the biggest stars, is thought to have killed someone and the private detective Eddie Valiant must help the wanted Toonstar. A groundbreaking comedy where actors and cartoons are woven perfectly together.'),(11,3,'1989-05-24',127,48000000,474000000,'PG13','The last crusade is the third film in the Indiana Jones film series. This time Sean Connery plays as Indy\'s father on his adventure to find the Holy Grail.'),(12,3,'1995-12-15',101,65000000,262000000,'ALL','When two kids play an old magic board-game they found, they release a man trapped for decades in it and a host of dangers that can only be stopped by finishing the game.'),(13,2,'2004-10-28',105,0,3125254,'PG13','Javier, a depressed surgeon, desperately seeks a new love after his wife leaves him.'),(14,2,'2008-04-01',245,30000,0,'S/C','Historias extraordinarias es una película argentina de 2008 escrita y dirigida por Mariano Llinás y protagonizada por Walter Jakob, Agustín Mendilaharzu y Llinás. La cinta tiene una duración de 245 minutos y está dividida en tres actos, que se dividen en un total de 18 capítulos a través de los cuales se cuentan tres historias paralelas e independientes entre sí.1​3​ Las tres historias están protagonizadas por «X», «H» y «Z», tres hombres comunes. El primero presencia un asesinato y decide esconderse en un hotel. El segundo está a cargo de una misión que no termina de comprender. Mientras que el último comienza a investigar de modo obsesivo la vida de un hombre que acaba de morir y que él reemplazó en su nuevo puesto de trabajo. '),(15,3,'1968-07-17',89,250000,0,'S/C','Yellow Submarine (also known as The Beatles: Yellow Submarine) is a 1968 animated jukebox musical fantasy comedy adventure film inspired by the music of the Beatles, directed by animation producer George Dunning, and produced by United Artists and King Features Syndicate. Initial press reports stated that the Beatles themselves would provide their own character voices.[5] However, aside from composing and performing the songs, the real Beatles participated only in the closing scene of the film, while their animated counterparts were voiced by other actors.\n\nThe film received widespread acclaim from critics and audiences alike, in contrast to the Beatles\' previous film venture Magical Mystery Tour. Pixar co-founder and former chief creative officer John Lasseter has credited the film with generating wider interest in animation as a serious art form, it having been generally considered a children\'s medium at the time.[6] Time commented that it \"turned into a smash hit, delighting adolescents and aesthetes alike\". Half a century after its release, it is still regarded as a landmark of animation.'),(16,2,'2010-09-09',86,3500000,8475773,'ALL','Gaturro: la película es una película animada Argentina en 3D, basada en el personaje de Nik'),(17,3,'1981-06-12',115,20000000,350000000,'PG13','Raiders of the Lost Ark is a 1981 American action-adventure film directed by Steven Spielberg and written by Lawrence Kasdan, based on a story by George Lucas and Philip Kaufman. Set in 1936, the film stars Harrison Ford as Indiana Jones, a globetrotting archaeologist vying with Nazi German forces to recover the long-lost Ark of the Covenant which is said to make an army invincible. Teaming up with his tough former romantic interest Marion Ravenwood (Karen Allen), Jones races to stop rival archaeologist Dr. René Belloq (Paul Freeman) from guiding the Nazis to the Ark and its power. '),(18,3,'2023-05-18',130,295000000,0,'PG13','Archaeologist Indiana Jones races against time to retrieve a legendary artifact that can change the course of history.');
/*!40000 ALTER TABLE `Peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PeliculasEnSagas`
--

DROP TABLE IF EXISTS `PeliculasEnSagas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PeliculasEnSagas` (
  `id_Pelicula` int NOT NULL DEFAULT '0',
  `id_Saga` int NOT NULL DEFAULT '1',
  `Orden` int NOT NULL,
  KEY `id_Pelicula` (`id_Pelicula`),
  KEY `id_Saga` (`id_Saga`),
  CONSTRAINT `PeliculasEnSagas_ibfk_1` FOREIGN KEY (`id_Pelicula`) REFERENCES `Peliculas` (`ID`),
  CONSTRAINT `PeliculasEnSagas_ibfk_2` FOREIGN KEY (`id_Saga`) REFERENCES `Sagas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PeliculasEnSagas`
--

LOCK TABLES `PeliculasEnSagas` WRITE;
/*!40000 ALTER TABLE `PeliculasEnSagas` DISABLE KEYS */;
INSERT INTO `PeliculasEnSagas` VALUES (1,4,1),(2,4,2),(3,4,3),(5,3,4),(17,2,1),(18,2,5),(11,2,3);
/*!40000 ALTER TABLE `PeliculasEnSagas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Personas`
--

DROP TABLE IF EXISTS `Personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Personas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL DEFAULT '',
  `Apellido` varchar(255) NOT NULL DEFAULT '',
  `FechaDeNacimiento` date NOT NULL DEFAULT '1800-01-01',
  `Genero` varchar(15) NOT NULL DEFAULT 'N/E',
  `LugarDeNacimiento` varchar(255) NOT NULL DEFAULT 'N/E',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personas`
--

LOCK TABLES `Personas` WRITE;
/*!40000 ALTER TABLE `Personas` DISABLE KEYS */;
INSERT INTO `Personas` VALUES (1,'N/E','-','1800-01-01','N/E','N/E'),(2,'Robert','Zemeckis','1952-05-14','Masculino','Chicago,Illinois,EEUU'),(3,'Michael','Fox','1961-06-09','Masculino','Edmonton, Canada'),(4,'Christopher','Lloyd','1938-10-22','Masculino','Sramford, Connecticut, Estados Unidos'),(5,'Lea','Thompson','1961-05-31','Femenino','Rochester, Minnesota, Estados Unidos'),(6,'Crispin','Glover','1964-04-20','Masculino','Nueva York, Nueva York, Estados Unidos'),(7,'Bob','Gale','1951-05-25','Masculino','University City, Misuri, Estados Unidos'),(8,'Harry','Keramidas','1940-08-31','Masculino','Detroit, Michigan, Estados Unidos'),(9,'Kate Elizabeth','Winslet','1975-10-05','Femenino','Reading, Berkshire, England '),(10,'Leonardo','DiCaprio','1974-11-11','Masculino','Hollywood, California, USA '),(11,'Frances ','Fisher','1952-05-11','Femenino','Milford-on-the-sea, Hampshire, England, UK '),(12,'Billy ','Zane','1966-02-24','Masculino','Chicago, Illinois, USA '),(13,'James','Cameron','1954-08-16','Masculino','Kapuskasing, Ontario, Canada '),(14,'Mark','Hamill','1951-09-25','Masculino','Oakland, California, USA '),(15,'Harrison','Ford','1942-07-13','Masculino','Chicago, Illinois, USA'),(16,'Rumi','Hiragi','1800-01-01','Femenino','N/E'),(17,'Miyu','Irino','1800-01-01','Masculino','N/E'),(18,'Hayao','Miyazaki','1941-01-05','Masculino','Tokio, Japan '),(19,'George','Lucas','1944-05-14','Masculino','Modesto, Kalifornien, USA'),(20,'Amy','Poehler','1800-01-01','Femenino','N/E'),(21,'Phyllis','Smith','1800-01-01','Femenino','N/E'),(22,'Bill','Hader','1800-01-01','Masculino','N/E'),(23,'Pete','Docter','1800-01-01','Masculino','N/E'),(24,'Mel','Gibson','1956-01-03','Masculino','Peekskill, New York, United States of America '),(25,'Tom','Hanks','1800-01-01','Masculino','N/E'),(26,'Robin','Wright','1800-01-01','Femenino','N/E'),(27,'Bob','Hoskins','1800-01-01','Masculino','N/E'),(28,'Charles','Fleischer','1800-01-01','Masculino','N/E'),(29,'Steven','Spielberg','1946-12-18','Masculino','N/E'),(30,'Sean','Connery','1930-08-25','Masculino','Edinburgh, Scotland'),(31,'Robin McLaurim','Williams','1951-07-21','Masculino','Chicago, Illinois, USA'),(32,'Joe','Johnston','1800-01-01','Femenino','N/E'),(33,'Bonnie','Hunt','1800-01-01','Femenino','N/E'),(34,'Diego','Peretti','1800-01-01','Masculino','N/E'),(35,'Marcos','Mundstock','1800-01-01','Masculino','N/E'),(36,'Guillermo','Francella','1800-01-01','bigotito','N/E'),(37,'Juan','Taratuto','1800-01-01','Masculino','N/E'),(38,'Mariano','Lilnás','1800-01-01','Masculino','Argentina'),(39,'Agustín','Mendilaharzu','1800-01-01','Masculino','Argentina'),(40,'Walter','Jakob','1800-01-01','Masculino','Argentina'),(41,'John','Clive','1800-01-01','N/E','N/E'),(42,'Geoffrey','Hughes','1800-01-01','N/E','N/E'),(43,'Peter','Batten','1800-01-01','N/E','N/E'),(44,'Paul','Angelis','1800-01-01','N/E','N/E'),(45,'Lance','Percival','1800-01-01','N/E','N/E'),(46,'George','Dunning','1800-01-01','N/E','N/E'),(47,'Robert','Blaster','1800-01-01','N/E','N/E'),(48,'Gustavo','Coda','1800-01-01','N/E','N/E'),(49,'Cristian \"Nik\"','Dzwonik','1800-01-01','N/E','N/E'),(50,'Mariano','Chiesa','1800-01-01','N/E','N/E'),(51,'James','Mangold','1800-01-01','N/E','N/E');
/*!40000 ALTER TABLE `Personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Premios`
--

DROP TABLE IF EXISTS `Premios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Premios` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) NOT NULL DEFAULT '-',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Premios`
--

LOCK TABLES `Premios` WRITE;
/*!40000 ALTER TABLE `Premios` DISABLE KEYS */;
INSERT INTO `Premios` VALUES (1,'Indefinido'),(2,'Oscar'),(3,'Globo de Oro'),(4,'Martín Fierro'),(5,'Bafta'),(6,'MTV Movie Awards'),(7,'BAFICI');
/*!40000 ALTER TABLE `Premios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Roles` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(65) NOT NULL DEFAULT '-',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (0,'Indefinido'),(1,'Director'),(2,'Productor'),(3,'Editor'),(4,'Actor'),(5,'Voz'),(6,'Autor'),(7,'Animador');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sagas`
--

DROP TABLE IF EXISTS `Sagas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sagas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(255) NOT NULL DEFAULT '-',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sagas`
--

LOCK TABLES `Sagas` WRITE;
/*!40000 ALTER TABLE `Sagas` DISABLE KEYS */;
INSERT INTO `Sagas` VALUES (1,'Indefinido'),(2,'Indiana Jones'),(3,'Star Wars'),(4,'Back to the future');
/*!40000 ALTER TABLE `Sagas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TiposPersonajes`
--

DROP TABLE IF EXISTS `TiposPersonajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TiposPersonajes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(25) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TiposPersonajes`
--

LOCK TABLES `TiposPersonajes` WRITE;
/*!40000 ALTER TABLE `TiposPersonajes` DISABLE KEYS */;
INSERT INTO `TiposPersonajes` VALUES (0,'Indefinido'),(1,'Principal'),(2,'Secundario'),(3,'Extra');
/*!40000 ALTER TABLE `TiposPersonajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Titulos`
--

DROP TABLE IF EXISTS `Titulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Titulos` (
  `Titulo` varchar(255) NOT NULL DEFAULT '-',
  `id_idioma` int NOT NULL DEFAULT '1',
  `id_pelicula` int NOT NULL DEFAULT '1',
  KEY `id_idioma` (`id_idioma`),
  KEY `id_pelicula` (`id_pelicula`),
  CONSTRAINT `Titulos_ibfk_1` FOREIGN KEY (`id_idioma`) REFERENCES `Idiomas` (`ID`),
  CONSTRAINT `Titulos_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `Peliculas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Titulos`
--

LOCK TABLES `Titulos` WRITE;
/*!40000 ALTER TABLE `Titulos` DISABLE KEYS */;
INSERT INTO `Titulos` VALUES ('Volver al futuro I',2,1),('Back to the Future',3,1),('De retour vers le futur',4,1),('Back to the future II',3,2),('Volver al futuro II',2,2),('Back to the Future III',3,3),('Titanic',3,4),('Star Wars: Episode IV – A New Hope',3,5),('千と千尋の神隠し',9,6),('Spirited Away',3,6),('El Viaje de Chihiro',2,6),('Inside Out',3,7),('Intensa-mente',2,7),('Braveheart',3,8),('Forrest Gump',3,9),('Who Framed Roger Rabbit?',3,10),('Indiana Jones and the Last Crusade',3,11),('Indiana Jones y la Última Cruzada',2,11),('Jumanji',3,12),('No sos vos, soy yo',2,13),('It\'s not you, it\'s me',3,13),('Historias Extraordinarias',2,14),('Jumanji',2,12),('Titanic',2,4),('Corazón Valiente',2,8),('Forrest Gump',2,9),('¿Quién engañó a Roger Rabbit?',2,10),('Extraordinary Stories',3,14),('Star Wars: Episodio IV – Una Nueva Esperanza ',2,5),('Yellow Submarine',3,15),('Submarino Amarillo',2,15),('Gaturro: La Película',2,16),('Gaturro: The Movie',3,16),('Indiana Jones y los Cazadores del Arca Perdida',2,17),('Indiana Jones and the Raiders of the Lost Ark',3,17),('Indiana Jones and the Dial of Destiny',3,18),('Indiana Jones y el Dial del Destino',2,18);
/*!40000 ALTER TABLE `Titulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TitulosSagas`
--

DROP TABLE IF EXISTS `TitulosSagas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TitulosSagas` (
  `Titulo` varchar(255) NOT NULL DEFAULT '-',
  `id_idioma` int NOT NULL DEFAULT '1',
  `id_saga` int NOT NULL DEFAULT '1',
  KEY `id_idioma` (`id_idioma`),
  KEY `id_saga` (`id_saga`),
  CONSTRAINT `TitulosSagas_ibfk_1` FOREIGN KEY (`id_idioma`) REFERENCES `Idiomas` (`ID`),
  CONSTRAINT `TitulosSagas_ibfk_2` FOREIGN KEY (`id_saga`) REFERENCES `Sagas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TitulosSagas`
--

LOCK TABLES `TitulosSagas` WRITE;
/*!40000 ALTER TABLE `TitulosSagas` DISABLE KEYS */;
INSERT INTO `TitulosSagas` VALUES ('Volver al futuro',2,4),('Back to the Future',3,4),('Indiana Jones',2,2),('Indiana Jones',3,2),('Star Wars',3,3),('La Guerra de las Galaxias',2,3);
/*!40000 ALTER TABLE `TitulosSagas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-28  1:00:25
