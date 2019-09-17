-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mar 17 Septembre 2019 à 15:38
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

--
-- Index pour les tables exportées
--

--
-- Index pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`idConsul`),
  ADD KEY `idPres` (`idPres`),
  ADD KEY `idPay` (`idPay`),
  ADD KEY `idClient` (`idClient`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `idConsul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

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
