-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 24 août 2021 à 12:20
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `groupomaniap7`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `idcomment` int(55) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `idcom` int(55) DEFAULT NULL,
  PRIMARY KEY (`idcomment`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`idcomment`, `title`, `content`, `image`, `author`, `idcom`) VALUES
(98, 'Nouveau local', 'Première image de notre bureau merci à tous pour les nouveaux projets!', 'http://localhost:3000/images/image_bureau.jpg1629713558330.jpg', 'Gigi', 16),
(100, 'Image du nouveau logo', 'Le logo sera représenté par un éléphant merci à tous!! Morad ', 'http://localhost:3000/images/éléphant.jpg1629715009975.jpg', 'Morad', 19),
(101, 'Nouveau commentaire', 'Commentaire +', 'http://localhost:3000/images/1.png1629761990784.png', 'Morad', 19),
(102, 'J\'ai effacé les commentaires', 'je ne pense pas', 'http://localhost:3000/images/photography-2_Freepik.jpg1629790656724.jpg', 'Gigi', 16),
(103, 'Un nouveau commentaire', 'Encore un autre', 'http://localhost:3000/images/Ketchup.jpg1629803564245.jpg', 'Marthe', 21);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `iduser` int(55) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`iduser`, `first_name`, `name`, `job`, `email`, `password`, `admin`) VALUES
(16, 'Gigi', 'Ramiaramanana', 'Professeur', 'br******@******r', '$2b$10$Y2YvDO5Xi.TlUr4LAigft.n2CVARnsswvFlZ7wi4dcQMeigLN0w4a', 1),
(18, 'Adrienne', 'Rajerinera', 'Chanteur', 'ad***************@*******r', '$2b$10$uXN4pa6pxYEVoy7LXY2GGON1MNr8MqoBenU9XoYEFPCQelSdUmcsC', 0),
(19, 'Morad', 'SASSEM', 'Pilote', 'mo***@********m', '$2b$10$jjA0.D7CgyTDQAkbrTGgXuTc.k6kUN6mJvDtOcV8d5AWROjgZI0ra', 0),
(21, 'Marthe', 'Marthe', 'Commerce', 'ma****@********m', '$2b$10$3GJsWqj59UQrVGOCpvpZBeJllWAIYX.J02V5jNCJwXJNxtJ1izS2e', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
