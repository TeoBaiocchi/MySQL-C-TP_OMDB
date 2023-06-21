-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: omdb
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

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
  `id_participacion` int NOT NULL DEFAULT '1',
  `personaje` varchar(50) NOT NULL DEFAULT '-',
  `Tipo` varchar(20) NOT NULL DEFAULT 'N/E',
  KEY `id_participacion` (`id_participacion`),
  CONSTRAINT `ActoresPersonajes_ibfk_1` FOREIGN KEY (`id_participacion`) REFERENCES `Participacion` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ActoresPersonajes`
--

LOCK TABLES `ActoresPersonajes` WRITE;
/*!40000 ALTER TABLE `ActoresPersonajes` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Generos`
--

LOCK TABLES `Generos` WRITE;
/*!40000 ALTER TABLE `Generos` DISABLE KEYS */;
INSERT INTO `Generos` VALUES (1,'Indefinido'),(2,'Accion'),(3,'Aventura'),(4,'Suspenso'),(5,'Thriller'),(6,'Terror'),(7,'Drama'),(8,'Romance'),(9,'Ciencia Ficcion');
/*!40000 ALTER TABLE `Generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GenerosPorPelicula`
--

DROP TABLE IF EXISTS `GenerosPorPelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GenerosPorPelicula` (
  `id_pelicula` int NOT NULL DEFAULT '1',
  `id_genero` int NOT NULL DEFAULT '1',
  KEY `id_pelicula` (`id_pelicula`),
  KEY `id_genero` (`id_genero`),
  CONSTRAINT `GenerosPorPelicula_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `Peliculas` (`ID`),
  CONSTRAINT `GenerosPorPelicula_ibfk_2` FOREIGN KEY (`id_genero`) REFERENCES `Generos` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GenerosPorPelicula`
--

LOCK TABLES `GenerosPorPelicula` WRITE;
/*!40000 ALTER TABLE `GenerosPorPelicula` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Idiomas`
--

LOCK TABLES `Idiomas` WRITE;
/*!40000 ALTER TABLE `Idiomas` DISABLE KEYS */;
INSERT INTO `Idiomas` VALUES (1,'Indefinido'),(2,'Español'),(3,'Inglés'),(4,'Frances'),(5,'Aleman'),(6,'Italiano'),(7,'Catalan'),(8,'Tagalo');
/*!40000 ALTER TABLE `Idiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nominaciones`
--

DROP TABLE IF EXISTS `Nominaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Nominaciones` (
  `id_pelicula` int NOT NULL DEFAULT '1',
  `id_premio` int NOT NULL DEFAULT '1',
  KEY `id_pelicula` (`id_pelicula`),
  KEY `id_premio` (`id_premio`),
  CONSTRAINT `Nominaciones_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `Peliculas` (`ID`),
  CONSTRAINT `Nominaciones_ibfk_2` FOREIGN KEY (`id_premio`) REFERENCES `Premios` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nominaciones`
--

LOCK TABLES `Nominaciones` WRITE;
/*!40000 ALTER TABLE `Nominaciones` DISABLE KEYS */;
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
  `id_Pelicula` int NOT NULL DEFAULT '1',
  `id_Persona` int NOT NULL DEFAULT '1',
  `id_Rol` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `id_Pelicula` (`id_Pelicula`),
  KEY `id_Persona` (`id_Persona`),
  KEY `id_Rol` (`id_Rol`),
  CONSTRAINT `Participacion_ibfk_1` FOREIGN KEY (`id_Pelicula`) REFERENCES `Peliculas` (`ID`),
  CONSTRAINT `Participacion_ibfk_2` FOREIGN KEY (`id_Persona`) REFERENCES `Personas` (`ID`),
  CONSTRAINT `Participacion_ibfk_3` FOREIGN KEY (`id_Rol`) REFERENCES `Roles` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Participacion`
--

LOCK TABLES `Participacion` WRITE;
/*!40000 ALTER TABLE `Participacion` DISABLE KEYS */;
INSERT INTO `Participacion` VALUES (1,1,2,1);
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
  `AnioPublicacion` date NOT NULL DEFAULT '1900-01-01',
  `Duracion` int NOT NULL DEFAULT '0',
  `Presupuesto` int NOT NULL DEFAULT '0',
  `RecaudacionTaquilla` int NOT NULL DEFAULT '0',
  `Rating` varchar(5) NOT NULL DEFAULT 'S/C',
  `Resumen` text,
  PRIMARY KEY (`ID`),
  KEY `id_idiomaOriginal` (`id_idiomaOriginal`),
  CONSTRAINT `Peliculas_ibfk_1` FOREIGN KEY (`id_idiomaOriginal`) REFERENCES `Idiomas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Peliculas`
--

LOCK TABLES `Peliculas` WRITE;
/*!40000 ALTER TABLE `Peliculas` DISABLE KEYS */;
INSERT INTO `Peliculas` VALUES (1,3,'1985-07-03',111,19000000,381109762,'****','The first film of the trilogy as teenager Marty Mcfly travels back in time with help from his friend and time machine inventor Dr. Brown. Marty travels from 1985 back to 1955 running into people he knows like his parents. When it’s time to go back to the future Marty runs into a few unforeseen problems and time is running out.');
/*!40000 ALTER TABLE `Peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PeliculasEnSagas`
--

DROP TABLE IF EXISTS `PeliculasEnSagas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PeliculasEnSagas` (
  `id_Pelicula` int NOT NULL DEFAULT '1',
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
INSERT INTO `PeliculasEnSagas` VALUES (1,4,1);
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
  `FechaDeNacimiento` date NOT NULL DEFAULT '1900-01-01',
  `Genero` varchar(15) NOT NULL DEFAULT 'N/E',
  `LugarDeNacimiento` varchar(255) NOT NULL DEFAULT 'N/E',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personas`
--

LOCK TABLES `Personas` WRITE;
/*!40000 ALTER TABLE `Personas` DISABLE KEYS */;
INSERT INTO `Personas` VALUES (1,'N/E','-','1900-01-01','N/E','N/E'),(2,'Robert','Zemeckis','1952-05-14','Masculino','Chicago,Illinois,EEUU');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Premios`
--

LOCK TABLES `Premios` WRITE;
/*!40000 ALTER TABLE `Premios` DISABLE KEYS */;
INSERT INTO `Premios` VALUES (1,'Indefinido'),(3,'Oscar'),(4,'Globo de Oro'),(5,'Martín Fierro');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (1,'Director'),(2,'Productor'),(3,'Editor'),(4,'Actor'),(5,'Voz');
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
INSERT INTO `Titulos` VALUES ('Volver al futuro 1',2,1),('Back to the future',3,1),('De retour vers le futur',4,1);
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
INSERT INTO `TitulosSagas` VALUES ('Volver al futuro',2,4);
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

-- Dump completed on 2023-06-20 20:44:39
