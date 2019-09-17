-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mar 17 Septembre 2019 à 16:04
-- Version du serveur :  10.1.38-MariaDB-0+deb9u1
-- Version de PHP :  7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `prcronfalt`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `idAct` int(11) NOT NULL,
  `nomAct` varchar(256) NOT NULL,
  `descAct` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `activite`
--

INSERT INTO `activite` (`idAct`, `nomAct`, `descAct`) VALUES
(1, '(yr(tyrt', 'ytryrty'),
(2, 'rytr', 'yrtyryrysrytry');

-- --------------------------------------------------------

--
-- Structure de la table `avoir`
--

CREATE TABLE `avoir` (
  `idAct` int(11) NOT NULL,
  `idMat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `avoir`
--

INSERT INTO `avoir` (`idAct`, `idMat`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idCli` int(11) NOT NULL,
  `nomCli` varchar(256) NOT NULL,
  `prenomCli` varchar(256) NOT NULL,
  `dateNaissCli` date NOT NULL,
  `adressCli` varchar(256) NOT NULL,
  `numCli` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`idCli`, `nomCli`, `prenomCli`, `dateNaissCli`, `adressCli`, `numCli`) VALUES
(1, 'trhyrty', 'tytyyr', '2019-09-11', 'eryrtyrty', 'rydtryh'),
(2, 'rytryr', 'tryttrh', '2019-09-12', 'hyhserhy', 'hrshyyrth'),
(3, 're', 're', '2019-09-05', 're', '01');

-- --------------------------------------------------------

--
-- Structure de la table `comporter`
--

CREATE TABLE `comporter` (
  `idPres` int(11) NOT NULL,
  `idAct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `comporter`
--

INSERT INTO `comporter` (`idPres`, `idAct`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

CREATE TABLE `consultation` (
  `idConsul` int(11) NOT NULL,
  `datePres` date NOT NULL,
  `heurePres` varchar(256) NOT NULL,
  `montantPay` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  `idPres` int(11) NOT NULL,
  `idPay` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `consultation`
--

INSERT INTO `consultation` (`idConsul`, `datePres`, `heurePres`, `montantPay`, `idClient`, `idPres`, `idPay`) VALUES
(1, '2019-09-10', 'yy(-y', 50, 1, 1, 1),
(2, '2019-09-28', 'ykyiy', 12, 2, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

CREATE TABLE `materiel` (
  `idMat` int(11) NOT NULL,
  `nomMat` varchar(256) NOT NULL,
  `comMat` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `materiel`
--

INSERT INTO `materiel` (`idMat`, `nomMat`, `comMat`) VALUES
(1, '(yiyt', 'tyuyg'),
(2, 'tyugftyu', 'tuyt');

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `idPay` int(11) NOT NULL,
  `libellePay` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `paiement`
--

INSERT INTO `paiement` (`idPay`, `libellePay`) VALUES
(1, 'gujkuity'),
(2, 'ererger');

-- --------------------------------------------------------

--
-- Structure de la table `prestation`
--

CREATE TABLE `prestation` (
  `idPres` int(11) NOT NULL,
  `libellePres` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `prestation`
--

INSERT INTO `prestation` (`idPres`, `libellePres`) VALUES
(1, 'rtytr'),
(2, '(y-uyt');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`idAct`);

--
-- Index pour la table `avoir`
--
ALTER TABLE `avoir`
  ADD KEY `idAct` (`idAct`),
  ADD KEY `idMat` (`idMat`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idCli`);

--
-- Index pour la table `comporter`
--
ALTER TABLE `comporter`
  ADD KEY `idAct` (`idAct`),
  ADD KEY `comporter_ibfk_1` (`idPres`);

--
-- Index pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`idConsul`),
  ADD KEY `idPres` (`idPres`),
  ADD KEY `idPay` (`idPay`),
  ADD KEY `idClient` (`idClient`);

--
-- Index pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD PRIMARY KEY (`idMat`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`idPay`);

--
-- Index pour la table `prestation`
--
ALTER TABLE `prestation`
  ADD PRIMARY KEY (`idPres`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `activite`
--
ALTER TABLE `activite`
  MODIFY `idAct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idCli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `idConsul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `materiel`
--
ALTER TABLE `materiel`
  MODIFY `idMat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `idPay` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `prestation`
--
ALTER TABLE `prestation`
  MODIFY `idPres` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `avoir`
--
ALTER TABLE `avoir`
  ADD CONSTRAINT `avoir_ibfk_1` FOREIGN KEY (`idAct`) REFERENCES `activite` (`idAct`),
  ADD CONSTRAINT `avoir_ibfk_2` FOREIGN KEY (`idMat`) REFERENCES `materiel` (`idMat`);

--
-- Contraintes pour la table `comporter`
--
ALTER TABLE `comporter`
  ADD CONSTRAINT `comporter_ibfk_1` FOREIGN KEY (`idPres`) REFERENCES `prestation` (`idPres`),
  ADD CONSTRAINT `comporter_ibfk_2` FOREIGN KEY (`idAct`) REFERENCES `activite` (`idAct`);

--
-- Contraintes pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`idPres`) REFERENCES `prestation` (`idPres`),
  ADD CONSTRAINT `consultation_ibfk_2` FOREIGN KEY (`idPay`) REFERENCES `paiement` (`idPay`),
  ADD CONSTRAINT `consultation_ibfk_3` FOREIGN KEY (`idClient`) REFERENCES `client` (`idCli`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
