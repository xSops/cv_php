-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 15 jan. 2018 à 22:34
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bddcv`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `collection`, `title`, `contenu`) VALUES
(22, 'Vetements', 'Streetwear', 'Ses racines se situent à New York dans un mélange résumé entre le skateboard, les surfeurs californiens, la mode hip-hop et rasta1. Les Beastie Boys en sont l\'incarnation en 1986, date de sortie de leur album Licensed to Ill1. De la même façon, les membres de Run DMC incarnent quelques tendances du streetwear par leur rejet de la mode hip-hop trop extravagante2. Ce mouvement apparait en réaction aux tendances ostentatoires, couteuses et voyantes, ainsi qu\'à l\'omniprésence de la mode et de la créativité lors des années 19801 ; loin du luxe décliné sur les podiums, le streetwear regroupe alors les jeunes autour de goûts communs comme le graffiti, le snowboard ou la musique1. Certains créateurs se font alors connaitre, à l\'image de Erik Brunetti (en) et sa marque FUCT (en), l\'influent Hiroshi Fujiwara (en), la marque californienne X-Large (en), ou encore le surfeur-précurseur Shawn Stussy (en) et sa marque Stüssy (en) fondée dès 19801.\r\n\r\nCe style, pratique et sportswear, consiste en grande partie à porter des jeans amples, de grosses chaussures ainsi que des t-shirts plus ou moins larges, mais qui peuvent aussi être moulants. Il n\'offre pas de différence de composition entre le matin et le soir, jusqu\'à devenir un uniforme standardisé des villes1. Il a su faire évoluer ses origines faites de skate et de rap, ou plus généralement de sports et de musique, en y ajoutant les influences des surplus militaires et des vêtements de travail.'),
(23, 'eSport', 'l\'eSport', 'Le sport électronique (en anglais : esport ou e-sport pour « electronic sport ») désigne la pratique sur Internet ou en LAN-party d\'un jeu vidéo seul ou en équipe, par le biais d\'un ordinateur ou d\'une console de jeux vidéo.\r\n\r\nL\'essor de l\'e-sport commence à la fin des années 1980 avec les premiers jeux en réseau multijoueurs et sur internet ; les meilleurs acteurs mondiaux du sport électronique se rencontrent lors de tournois tels que l\'Electronic Sports World Cup (ESWC), la Major League Gaming (MLG), la Cyberathlete Professional League (CPL) ou encore l\'Evolution Championship Series (EVO).\r\n\r\nLe sport électronique à haut niveau est souvent financé par les sponsors et par les revenus générés par la diffusion en streaming.');

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
CREATE TABLE IF NOT EXISTS `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`) VALUES
(1, 'test', 'test', 'thomas.bichon@ynov.com', 'thomas.bichon@ynov.com', 1, NULL, '$2y$13$DpDCysVL/EqstYu0WKrQvui6ls6qN4LfVjg90meFpeGlRVor7FW8u', '2018-01-15 22:05:30', NULL, NULL, 'a:2:{i:0;s:5:\"ADMIN\";i:1;s:10:\"ROLE_ADMIN\";}');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
