-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 30, 2022 at 11:47 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `instantklik`
--

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `KorisnikID` int(10) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`KorisnikID`, `Username`, `password`, `avatar`) VALUES
(1, 'duolingo', '$2y$10$/ZC4AZgvW6rkD6XTFlsr2uvBamZejCJjxO38FkI37qETWkuLtIcue', NULL),
(2, 'meta', '$2y$10$/ZC4AZgvW6rkD6XTFlsr2uvBamZejCJjxO38FkI37qETWkuLtIcue', NULL),
(25, 'test', '$2y$10$fLfvEg.mTUMCEqtShnwMaeAFJ4rbPePu9Rfgh0C3x4ladCdG2PMiy', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nalog`
--

CREATE TABLE `nalog` (
  `KorisnikID` int(10) NOT NULL,
  `TipID` int(10) NOT NULL,
  `Link` varchar(50) NOT NULL,
  `NalogID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nalog`
--

INSERT INTO `nalog` (`KorisnikID`, `TipID`, `Link`, `NalogID`) VALUES
(1, 3, 'https://www.instagram.com/duolingo', 3),
(1, 4, 'https://www.tiktok.com/@duolingo', 4),
(2, 1, 'https://www.facebook.com/Meta', 5),
(2, 2, 'https://twitter.com/Meta', 6),
(2, 3, 'https://www.instagram.com/meta/', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tipnaloga`
--

CREATE TABLE `tipnaloga` (
  `TipID` int(10) NOT NULL,
  `ImeTipa` varchar(20) NOT NULL,
  `Slika` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tipnaloga`
--

INSERT INTO `tipnaloga` (`TipID`, `ImeTipa`, `Slika`) VALUES
(1, 'facebook', 'images/sites/facebook.png'),
(2, 'twitter', 'images/sites/twitter.png'),
(3, 'instagram', 'images/sites/instagram.png'),
(4, 'tiktok', 'images/sites/tiktok.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`KorisnikID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `nalog`
--
ALTER TABLE `nalog`
  ADD PRIMARY KEY (`NalogID`),
  ADD KEY `nalog_korisnik_fk` (`KorisnikID`),
  ADD KEY `nalog_tip_fk` (`TipID`);

--
-- Indexes for table `tipnaloga`
--
ALTER TABLE `tipnaloga`
  ADD PRIMARY KEY (`TipID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `KorisnikID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `nalog`
--
ALTER TABLE `nalog`
  MODIFY `NalogID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `tipnaloga`
--
ALTER TABLE `tipnaloga`
  MODIFY `TipID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nalog`
--
ALTER TABLE `nalog`
  ADD CONSTRAINT `nalog_korisnik_fk` FOREIGN KEY (`KorisnikID`) REFERENCES `korisnik` (`KorisnikID`) ON DELETE CASCADE,
  ADD CONSTRAINT `nalog_tip_fk` FOREIGN KEY (`TipID`) REFERENCES `tipnaloga` (`TipID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
