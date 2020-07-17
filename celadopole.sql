-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  ven. 17 juil. 2020 à 11:47
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `celadopole`
--

-- --------------------------------------------------------

--
-- Structure de la table `equipe_adverse`
--

DROP TABLE IF EXISTS `equipe_adverse`;
CREATE TABLE IF NOT EXISTS `equipe_adverse` (
  `Id_equipe_adverse` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_equipe` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_equipe_adverse`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `equipe_adverse`
--

INSERT INTO `equipe_adverse` (`Id_equipe_adverse`, `Nom_equipe`) VALUES
(11, 'Bayern de monique'),
(12, 'Pierro de la jungle');

-- --------------------------------------------------------

--
-- Structure de la table `gerer`
--

DROP TABLE IF EXISTS `gerer`;
CREATE TABLE IF NOT EXISTS `gerer` (
  `Id_photo` int(11) NOT NULL,
  `Id_utilisateur` int(11) NOT NULL,
  `Annee` date NOT NULL,
  PRIMARY KEY (`Id_photo`,`Id_utilisateur`),
  KEY `Gerer_Utilisateur0_FK` (`Id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `jouer`
--

DROP TABLE IF EXISTS `jouer`;
CREATE TABLE IF NOT EXISTS `jouer` (
  `Id_joueur` int(11) NOT NULL,
  `Id_match` int(11) NOT NULL,
  `Id_equipe_adverse` int(11) NOT NULL,
  `But_marque_par_match` int(11) NOT NULL,
  `Passe_decisive_par_match` int(11) NOT NULL,
  `Poste` varchar(50) NOT NULL,
  `Temps_joue_par_match` time NOT NULL,
  PRIMARY KEY (`Id_joueur`,`Id_match`,`Id_equipe_adverse`),
  KEY `Jouer_Matchs0_FK` (`Id_match`),
  KEY `Jouer_Equipe_adverse1_FK` (`Id_equipe_adverse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `jouer`
--

INSERT INTO `jouer` (`Id_joueur`, `Id_match`, `Id_equipe_adverse`, `But_marque_par_match`, `Passe_decisive_par_match`, `Poste`, `Temps_joue_par_match`) VALUES
(1, 37, 12, 5, 11, 'Milieu', '00:08:00'),
(1, 38, 12, 4, 2, 'Attaquant', '00:12:00'),
(1, 40, 11, 0, 0, 'Gardien', '00:00:00'),
(1, 41, 12, 0, 0, 'Gardien', '00:00:00'),
(1, 42, 11, 3, 2, 'Gardien', '00:05:00'),
(1, 43, 12, 0, 0, 'Gardien', '00:00:00'),
(1, 44, 11, 0, 0, 'Gardien', '00:00:00'),
(25, 37, 12, 4, 2, 'Milieu', '00:44:00'),
(25, 38, 11, 5, 5, 'Attaquant', '00:39:00'),
(26, 37, 12, 5, 4, 'Défenseur', '00:37:00'),
(26, 38, 11, 4, 5, 'Attaquant', '00:21:00'),
(27, 37, 12, 1, 1, 'Défenseur', '00:35:00'),
(27, 38, 11, 5, 6, 'Gardien', '00:29:00'),
(28, 37, 12, 4, 5, 'Milieu', '00:47:00'),
(28, 38, 11, 8, 7, 'Défenseur', '00:22:00'),
(29, 37, 12, 2, 4, 'Gardien', '00:33:00'),
(29, 38, 11, 8, 4, 'Attaquant', '00:26:00'),
(30, 37, 12, 45, 2, 'Attaquant', '00:53:00'),
(30, 38, 12, 6, 5, 'Attaquant', '00:30:00'),
(31, 37, 12, 5, 4, 'Milieu', '00:42:00'),
(31, 38, 11, 2, 0, 'Milieu', '00:19:00'),
(32, 37, 12, 5, 4, 'Milieu', '00:43:00'),
(32, 38, 11, 6, 8, 'Défenseur', '00:53:00'),
(33, 37, 12, 2, 2, 'Défenseur', '00:17:00'),
(33, 38, 11, 4, 5, 'Attaquant', '00:30:00');

-- --------------------------------------------------------

--
-- Structure de la table `joueurs`
--

DROP TABLE IF EXISTS `joueurs`;
CREATE TABLE IF NOT EXISTS `joueurs` (
  `Id_joueur` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Annee_d_arrivee` date DEFAULT NULL,
  `Poste_principal` varchar(50) NOT NULL,
  `Photo` varchar(99) DEFAULT NULL,
  `Numero_de_licence` int(11) DEFAULT NULL,
  `Id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`Id_joueur`),
  KEY `Joueurs_Utilisateur_FK` (`Id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `joueurs`
--

INSERT INTO `joueurs` (`Id_joueur`, `Nom`, `Prenom`, `Annee_d_arrivee`, `Poste_principal`, `Photo`, `Numero_de_licence`, `Id_utilisateur`) VALUES
(1, 'Marquet', 'Pierre', '2020-03-03', 'Gardien', '/TeamRocket/Img/Players/16062020115609.png', 0, 1),
(25, 'Fiorino', 'Thomas', '0000-00-00', 'Milieu', '/TeamRocket/Img/Players/default.jpg', 0, 28),
(26, 'Morrrin', 'Loic', '0000-00-00', 'Défenseur', '/TeamRocket/Img/Players/default.jpg', 0, 29),
(27, 'Fionfion_des_balkans', 'Thomas', '0000-00-00', 'Attaquant', '/TeamRocket/Img/Players/default.jpg', 0, 28),
(28, 'Morénus', 'Florent', '0000-00-00', 'Gardien', '/TeamRocket/Img/Players/default.jpg', 0, 34),
(29, 'Zadick', 'Miguel', '0000-00-00', 'Attaquant', '/TeamRocket/Img/Players/default.jpg', 0, 32),
(30, 'Garandeau', 'Alexis', '0000-00-00', 'Attaquant', '/TeamRocket/Img/Players/default.jpg', 0, 30),
(31, 'Tardivieille', 'Bruno', '0000-00-00', 'Milieu', '/TeamRocket/Img/Players/default.jpg', 0, 31),
(32, 'Jean', 'Michel', '0000-00-00', 'Défenseur', '/TeamRocket/Img/Players/default.jpg', 0, 10),
(33, 'Bernardo', 'Guy', '0000-00-00', 'Défenseur', '/TeamRocket/Img/Players/default.jpg', 0, 12),
(34, 'Garandeau', 'Alexis', '0000-00-00', 'Attaquant', '/TeamRocket/Img/Players/default.jpg', 0, 35);

-- --------------------------------------------------------

--
-- Structure de la table `matchs`
--

DROP TABLE IF EXISTS `matchs`;
CREATE TABLE IF NOT EXISTS `matchs` (
  `Id_match` int(11) NOT NULL AUTO_INCREMENT,
  `Heure` time NOT NULL,
  `Date` date NOT NULL,
  `Saison` varchar(10) NOT NULL,
  `Id_stade` int(11) NOT NULL,
  PRIMARY KEY (`Id_match`),
  KEY `Matchs_Stade_FK` (`Id_stade`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `matchs`
--

INSERT INTO `matchs` (`Id_match`, `Heure`, `Date`, `Saison`, `Id_stade`) VALUES
(37, '21:00:00', '2020-06-11', '2020/2021', 3),
(38, '15:00:00', '2020-07-15', '2020/2021', 4),
(39, '24:00:00', '2020-06-03', '2020/2021', 3),
(40, '19:00:00', '2020-12-10', '2021/2022', 4),
(41, '10:00:00', '2020-07-16', '2020/2021', 3),
(42, '12:00:00', '2020-06-10', '2019/2020', 3),
(43, '12:00:00', '2021-02-11', '2021/2022', 4),
(44, '12:00:00', '2022-02-09', '2021/2022', 3);

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `Id_photo` int(11) NOT NULL AUTO_INCREMENT,
  `Titre` varchar(30) DEFAULT NULL,
  `Url_photo` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_photo`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

DROP TABLE IF EXISTS `posseder`;
CREATE TABLE IF NOT EXISTS `posseder` (
  `Id_stade` int(11) NOT NULL,
  `Id_equipe_adverse` int(11) NOT NULL,
  PRIMARY KEY (`Id_stade`,`Id_equipe_adverse`),
  KEY `Posseder_Equipe_adverse0_FK` (`Id_equipe_adverse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `stade`
--

DROP TABLE IF EXISTS `stade`;
CREATE TABLE IF NOT EXISTS `stade` (
  `Id_stade` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_stade` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Adresse` varchar(200) NOT NULL,
  `Type_de_terrain` varchar(20) NOT NULL,
  `Commentaires` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id_stade`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stade`
--

INSERT INTO `stade` (`Id_stade`, `Nom_stade`, `Adresse`, `Type_de_terrain`, `Commentaires`) VALUES
(3, 'Toulouse', '3 rue des blaireaux aux vents', 'Stabilisé', 'Petits terrain- Parfait pour faire jouer Alex'),
(4, 'Danslcul', 'Chez Thomas', 'Synthétique', '');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `Id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `Pseudo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Mail` varchar(50) NOT NULL,
  `Role` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`Id_utilisateur`, `Pseudo`, `Password`, `Mail`, `Role`) VALUES
(1, 'Sokou', '$2y$10$kN6DTTILGvAkdOJOgeZrmO9y7BJoZEqKbLjlkJatPejHzTc3QnwZe', 'osef@tamere.fr', 'Administrateur'),
(5, 'Moderateur', '$2y$10$kN6DTTILGvAkdOJOgeZrmO9y7BJoZEqKbLjlkJatPejHzTc3QnwZe', 'florian.m31@hotmail.fr', 'Modérateur'),
(10, 'User', '$2y$10$kN6DTTILGvAkdOJOgeZrmO9y7BJoZEqKbLjlkJatPejHzTc3QnwZe', 'denduezndi@gotmail.fr', 'Utilisateur'),
(12, 'khalhas', '', 'zcj@hotmail.fr', 'Utilisateur'),
(28, 'GrosPif', '', 'ofehippa-4097@yopmail.com', 'Utilisateur'),
(29, 'Pumba', '', 'ofehippa-4097@yopmail.com', 'Utilisateur'),
(30, 'Pisse&Love', '', 'egobuxe-5747@yopmail.com', 'Utilisateur'),
(31, 'undercove_Microchauve', '', 'eserahoffu-1058@yopmail.com', 'Utilisateur'),
(32, 'Le Varchar', '', 'afessagy-7092@yopmail.com', 'Utilisateur'),
(33, 'Bendo', '', 'ugehuveqo-4301@yopmail.com', 'Utilisateur'),
(34, 'Le Petit arabe', '', 'urruqoddo-5310@yopmail.com', 'Utilisateur'),
(35, 'Nain', '', 'alexisgarandeau31@gmail.com', 'Utilisateur');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `gerer`
--
ALTER TABLE `gerer`
  ADD CONSTRAINT `Gerer_Photo_FK` FOREIGN KEY (`Id_photo`) REFERENCES `photo` (`Id_photo`),
  ADD CONSTRAINT `Gerer_Utilisateur0_FK` FOREIGN KEY (`Id_utilisateur`) REFERENCES `utilisateur` (`Id_utilisateur`);

--
-- Contraintes pour la table `jouer`
--
ALTER TABLE `jouer`
  ADD CONSTRAINT `Jouer_Equipe_adverse1_FK` FOREIGN KEY (`Id_equipe_adverse`) REFERENCES `equipe_adverse` (`Id_equipe_adverse`),
  ADD CONSTRAINT `Jouer_Joueurs_FK` FOREIGN KEY (`Id_joueur`) REFERENCES `joueurs` (`Id_joueur`),
  ADD CONSTRAINT `Jouer_Matchs0_FK` FOREIGN KEY (`Id_match`) REFERENCES `matchs` (`Id_match`);

--
-- Contraintes pour la table `joueurs`
--
ALTER TABLE `joueurs`
  ADD CONSTRAINT `Joueurs_Utilisateur_FK` FOREIGN KEY (`Id_utilisateur`) REFERENCES `utilisateur` (`Id_utilisateur`);

--
-- Contraintes pour la table `matchs`
--
ALTER TABLE `matchs`
  ADD CONSTRAINT `Matchs_Stade_FK` FOREIGN KEY (`Id_stade`) REFERENCES `stade` (`Id_stade`);

--
-- Contraintes pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD CONSTRAINT `Posseder_Equipe_adverse0_FK` FOREIGN KEY (`Id_equipe_adverse`) REFERENCES `equipe_adverse` (`Id_equipe_adverse`),
  ADD CONSTRAINT `Posseder_Stade_FK` FOREIGN KEY (`Id_stade`) REFERENCES `stade` (`Id_stade`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
