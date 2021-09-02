-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 02 sep. 2021 à 15:08
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
  PRIMARY KEY (`idcomment`),
  KEY `iduserCom` (`idcom`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`idcomment`, `title`, `content`, `image`, `author`, `idcom`) VALUES
(108, 'Chef d\'équipe', 'Ceci est un chef d\'équipe compétent', 'http://localhost:3000/images/mv.jpg1630595189578.jpg', 'Moradine', 19);

-- --------------------------------------------------------

--
-- Structure de la table `react`
--

DROP TABLE IF EXISTS `react`;
CREATE TABLE IF NOT EXISTS `react` (
  `idreact` int(55) NOT NULL AUTO_INCREMENT,
  `postReact` varchar(255) DEFAULT NULL,
  `userReact` varchar(255) DEFAULT NULL,
  `iduserReact` int(11) DEFAULT NULL,
  `idReactComment` int(55) DEFAULT NULL,
  PRIMARY KEY (`idreact`),
  KEY `reactcomment` (`idReactComment`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `react`
--

INSERT INTO `react` (`idreact`, `postReact`, `userReact`, `iduserReact`, `idReactComment`) VALUES
(145, 'Notre chef à tous!!', 'Moradine', 19, 108);

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`iduser`, `first_name`, `name`, `job`, `email`, `password`, `admin`) VALUES
(16, 'Gigi', 'Ramiaramanana', 'Professeur', 'br******@******r', '$2b$10$Y2YvDO5Xi.TlUr4LAigft.n2CVARnsswvFlZ7wi4dcQMeigLN0w4a', 1),
(18, 'Adrienne', 'Rajerinera', 'Chanteur', 'ad***************@*******r', '$2b$10$uXN4pa6pxYEVoy7LXY2GGON1MNr8MqoBenU9XoYEFPCQelSdUmcsC', 0),
(19, 'Moradine', 'Sassi', 'Pilote', 'mo***@********m', '$2b$10$jjA0.D7CgyTDQAkbrTGgXuTc.k6kUN6mJvDtOcV8d5AWROjgZI0ra', 0),
(21, 'Marthe', 'Marthe', 'Commerce', 'ma****@********m', '$2b$10$3GJsWqj59UQrVGOCpvpZBeJllWAIYX.J02V5jNCJwXJNxtJ1izS2e', 0),
(22, 'Marinne', 'marth', 'marin', 'Ma****@********m', '$2b$10$o6fnAi0qbVy4qbt0V4ZREu9TBPyxFg8RQX4gfDJBLWeJG0DDBzNAS', 0),
(23, 'Matha', 'mathis', 'marin', 'ma**@********m', '$2b$10$g53EJizjV361yDzdKzumpeM2sVZg6tYuKpz4CUJpxhXgJJEzMc8gy', 0),
(24, 'Mercon', 'Johan', 'Medecin', 'me****@********m', '$2b$10$GvjOR3x/pqgsEBKB49TEAuRTco0q67AWONtP74Z79aLP7nsCvkY9u', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `iduserCom` FOREIGN KEY (`idcom`) REFERENCES `user` (`iduser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `react`
--
ALTER TABLE `react`
  ADD CONSTRAINT `reactcomment` FOREIGN KEY (`idReactComment`) REFERENCES `comment` (`idcomment`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
