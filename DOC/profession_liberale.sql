-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 17, 2019 at 08:49 AM
-- Server version: 10.1.26-MariaDB-0+deb9u1
-- PHP Version: 7.0.19-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `profession_liberale`
--

-- --------------------------------------------------------

--
-- Table structure for table `activite`
--

CREATE TABLE `activite` (
  `idAct` int(11) NOT NULL,
  `nomAct` varchar(256) NOT NULL,
  `descAct` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activite`
--

INSERT INTO `activite` (`idAct`, `nomAct`, `descAct`) VALUES
(1, '(yr(tyrt', 'ytryrty'),
(2, 'rytr', 'yrtyryrysrytry');

-- --------------------------------------------------------

--
-- Table structure for table `avoir`
--

CREATE TABLE `avoir` (
  `idAct` int(11) NOT NULL,
  `idMat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `idCli` int(11) NOT NULL,
  `nomCli` varchar(256) NOT NULL,
  `prenomCli` varchar(256) NOT NULL,
  `dateNaissCli` date NOT NULL,
  `adressCli` varchar(256) NOT NULL,
  `numCli` varchar(256) NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`idCli`, `nomCli`, `prenomCli`, `dateNaissCli`, `adressCli`, `numCli`, `photo`) VALUES
(1, 'trhyrty', 'tytyyr', '2019-09-11', 'eryrtyrty', 'rydtryh', NULL),
(2, 'rytryr', 'tryttrh', '2019-09-12', 'hyhserhy', 'hrshyyrth', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comporter`
--

CREATE TABLE `comporter` (
  `idPres` int(11) NOT NULL,
  `idAct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comporter`
--

INSERT INTO `comporter` (`idPres`, `idAct`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `consultation`
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
-- Dumping data for table `consultation`
--

INSERT INTO `consultation` (`idConsul`, `datePres`, `heurePres`, `montantPay`, `idClient`, `idPres`, `idPay`) VALUES
(1, '2019-09-10', 'yy(-y', 50, 1, 1, 1),
(2, '2019-09-28', 'ykyiy', 12, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `materiel`
--

CREATE TABLE `materiel` (
  `idMat` int(11) NOT NULL,
  `nomMat` varchar(256) NOT NULL,
  `comMat` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paiement`
--

CREATE TABLE `paiement` (
  `idPay` int(11) NOT NULL,
  `libellePay` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paiement`
--

INSERT INTO `paiement` (`idPay`, `libellePay`) VALUES
(1, 'gujkuity'),
(2, 'ererger');

-- --------------------------------------------------------

--
-- Table structure for table `prestation`
--

CREATE TABLE `prestation` (
  `idPres` int(11) NOT NULL,
  `libellePres` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prestation`
--

INSERT INTO `prestation` (`idPres`, `libellePres`) VALUES
(1, 'rtytr'),
(2, '(y-uyt');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`idAct`);

--
-- Indexes for table `avoir`
--
ALTER TABLE `avoir`
  ADD KEY `idAct` (`idAct`),
  ADD KEY `idMat` (`idMat`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idCli`);

--
-- Indexes for table `comporter`
--
ALTER TABLE `comporter`
  ADD KEY `idAct` (`idAct`),
  ADD KEY `comporter_ibfk_1` (`idPres`);

--
-- Indexes for table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`idConsul`),
  ADD KEY `idPres` (`idPres`),
  ADD KEY `idPay` (`idPay`),
  ADD KEY `idClient` (`idClient`);

--
-- Indexes for table `materiel`
--
ALTER TABLE `materiel`
  ADD PRIMARY KEY (`idMat`);

--
-- Indexes for table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`idPay`);

--
-- Indexes for table `prestation`
--
ALTER TABLE `prestation`
  ADD PRIMARY KEY (`idPres`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activite`
--
ALTER TABLE `activite`
  MODIFY `idAct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `idCli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `idConsul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `materiel`
--
ALTER TABLE `materiel`
  MODIFY `idMat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `idPay` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `prestation`
--
ALTER TABLE `prestation`
  MODIFY `idPres` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `avoir`
--
ALTER TABLE `avoir`
  ADD CONSTRAINT `avoir_ibfk_1` FOREIGN KEY (`idAct`) REFERENCES `activite` (`idAct`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `avoir_ibfk_2` FOREIGN KEY (`idMat`) REFERENCES `materiel` (`idMat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comporter`
--
ALTER TABLE `comporter`
  ADD CONSTRAINT `comporter_ibfk_1` FOREIGN KEY (`idPres`) REFERENCES `prestation` (`idPres`),
  ADD CONSTRAINT `comporter_ibfk_2` FOREIGN KEY (`idAct`) REFERENCES `activite` (`idAct`);

--
-- Constraints for table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`idPres`) REFERENCES `prestation` (`idPres`),
  ADD CONSTRAINT `consultation_ibfk_2` FOREIGN KEY (`idPay`) REFERENCES `paiement` (`idPay`),
  ADD CONSTRAINT `consultation_ibfk_3` FOREIGN KEY (`idClient`) REFERENCES `client` (`idCli`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
