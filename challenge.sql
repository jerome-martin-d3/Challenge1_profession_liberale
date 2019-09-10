-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 03 Septembre 2019 à 12:58
-- Version du serveur: 5.5.37-0ubuntu0.13.10.1
-- Version de PHP: 5.5.3-1ubuntu2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `challenge`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE IF NOT EXISTS `activite` (
  `idAct` int(11) NOT NULL AUTO_INCREMENT,
  `nomAct` varchar(256) NOT NULL,
  `descAct` varchar(256) NOT NULL,
  PRIMARY KEY (`idAct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `idCli` int(11) NOT NULL AUTO_INCREMENT,
  `nomCli` varchar(256) NOT NULL,
  `prenomCli` varchar(256) NOT NULL,
  `dateNaissCli` date NOT NULL,
  `adressCli` varchar(256) NOT NULL,
  `numCli` varchar(256) NOT NULL,
  PRIMARY KEY (`idCli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

CREATE TABLE IF NOT EXISTS `consultation` (
  `idConsul` int(11) NOT NULL AUTO_INCREMENT,
  `datePres` date NOT NULL,
  `heurePres` varchar(256) NOT NULL,
  `montantPay` int(11) NOT NULL,
  PRIMARY KEY (`idConsul`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

CREATE TABLE IF NOT EXISTS `materiel` (
  `idMat` int(11) NOT NULL AUTO_INCREMENT,
  `nomMat` varchar(256) NOT NULL,
  `comMat` varchar(256) NOT NULL,
  PRIMARY KEY (`idMat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE IF NOT EXISTS `paiement` (
  `idPay` int(11) NOT NULL AUTO_INCREMENT,
  `libellePay` varchar(256) NOT NULL,
  PRIMARY KEY (`idPay`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `prestation`
--

CREATE TABLE IF NOT EXISTS `prestation` (
  `idPres` int(11) NOT NULL AUTO_INCREMENT,
  `libellePres` varchar(256) NOT NULL,
  PRIMARY KEY (`idPres`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
