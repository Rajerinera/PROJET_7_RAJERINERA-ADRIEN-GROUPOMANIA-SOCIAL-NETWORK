-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 01 sep. 2021 à 17:14
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
(102, 'Nouveau commentaire', 'commentaire', 'http://localhost:3000/images/barbecue-sauce.png1630501694017.png', 'Matha', 23),
(103, 'Un éléphant', 'Un putain d\'éléphant', 'http://localhost:3000/images/éléphant.jpg1630505670530.jpg', 'Morad', 19);

-- --------------------------------------------------------

--
-- Structure de la table `react`
--

DROP TABLE IF EXISTS `react`;
CREATE TABLE IF NOT EXISTS `react` (
  `idreact` int(55) NOT NULL AUTO_INCREMENT,
  `postReact` varchar(255) DEFAULT NULL,
  `userReact` varchar(255) DEFAULT NULL,
  `iduserReact` int(11) NOT NULL,
  `idReactComment` int(55) DEFAULT NULL,
  PRIMARY KEY (`idreact`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `react`
--

INSERT INTO `react` (`idreact`, `postReact`, `userReact`, `iduserReact`, `idReactComment`) VALUES
(125, 'Ce commentaire là', 'Morad', 19, 103),
(132, 'Post à mettre en oeuvre\n', 'Morad', 19, NULL),
(133, 'Poste à mettre en oeuvre ', 'Morad', 19, 103),
(134, 'Abcdefgh', 'Morad', 19, 103),
(135, 'Une très belle soupe', 'Morad', 19, 102);

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`iduser`, `first_name`, `name`, `job`, `email`, `password`, `admin`) VALUES
(16, 'Gigi', 'Ramiaramanana', 'Professeur', 'br******@******r', '$2b$10$Y2YvDO5Xi.TlUr4LAigft.n2CVARnsswvFlZ7wi4dcQMeigLN0w4a', 1),
(18, 'Adrienne', 'Rajerinera', 'Chanteur', 'ad***************@*******r', '$2b$10$uXN4pa6pxYEVoy7LXY2GGON1MNr8MqoBenU9XoYEFPCQelSdUmcsC', 0),
(19, 'Morad', 'SASSEM', 'Pilote', 'mo***@********m', '$2b$10$jjA0.D7CgyTDQAkbrTGgXuTc.k6kUN6mJvDtOcV8d5AWROjgZI0ra', 0),
(21, 'Marthe', 'Marthe', 'Commerce', 'ma****@********m', '$2b$10$3GJsWqj59UQrVGOCpvpZBeJllWAIYX.J02V5jNCJwXJNxtJ1izS2e', 0),
(22, 'Marinne', 'marth', 'marin', 'Ma****@********m', '$2b$10$o6fnAi0qbVy4qbt0V4ZREu9TBPyxFg8RQX4gfDJBLWeJG0DDBzNAS', 0),
(23, 'Matha', 'mathis', 'marin', 'ma**@********m', '$2b$10$g53EJizjV361yDzdKzumpeM2sVZg6tYuKpz4CUJpxhXgJJEzMc8gy', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
