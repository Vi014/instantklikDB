-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Feb 01, 2023 at 10:39 AM
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
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `accountID` int(10) NOT NULL,
  `userID` int(10) NOT NULL,
  `typeID` int(10) NOT NULL,
  `link` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`accountID`, `userID`, `typeID`, `link`) VALUES
(1, 1, 2, 'https://www.instagram.com/duolingo'),
(2, 1, 4, 'https://www.tiktok.com/@duolingo'),
(3, 2, 1, 'https://www.facebook.com/Meta'),
(4, 2, 2, 'https://twitter.com/Meta'),
(5, 2, 3, 'https://www.instagram.com/meta/');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `typeID` int(10) NOT NULL,
  `typeName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`typeID`, `typeName`) VALUES
(1, 'Facebook'),
(11, 'GitHub'),
(2, 'Instagram'),
(5, 'LinkedIn'),
(13, 'Other'),
(12, 'PayPal'),
(6, 'Reddit'),
(10, 'Spotify'),
(9, 'Steam'),
(4, 'TikTok'),
(8, 'Twitch'),
(3, 'Twitter'),
(7, 'YouTube');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `displayName` varchar(50) NOT NULL,
  `avatar` varchar(10) DEFAULT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  `administrator` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `password`, `displayName`, `avatar`, `banned`, `administrator`) VALUES
(1, 'duolingo', '$2y$10$fLfvEg.mTUMCEqtShnwMaeAFJ4rbPePu9Rfgh0C3x4ladCdG2PMiy', 'Duolingo', '5978.jpg', 0, 0),
(2, 'meta', '$2y$10$fLfvEg.mTUMCEqtShnwMaeAFJ4rbPePu9Rfgh0C3x4ladCdG2PMiy', 'Meta', NULL, 0, 0),
(3, 'test', '$2y$10$fLfvEg.mTUMCEqtShnwMaeAFJ4rbPePu9Rfgh0C3x4ladCdG2PMiy', 'foobar', NULL, 0, 0),
(4, 'admin', '$2y$10$fLfvEg.mTUMCEqtShnwMaeAFJ4rbPePu9Rfgh0C3x4ladCdG2PMiy', 'admin', NULL, 0, 1),
(6, 'gus', '$2y$10$3KsIA9sEMCmC.NpGJCumxuFt9bk2JXk1WmDS/IeAOW9pJYfeVdTA.', 'gus fring', NULL, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`accountID`),
  ADD KEY `FK_account_user` (`userID`),
  ADD KEY `FK_account_type` (`typeID`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`typeID`),
  ADD UNIQUE KEY `typeName` (`typeName`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `accountID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `typeID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `FK_account_type` FOREIGN KEY (`typeID`) REFERENCES `type` (`typeID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_account_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
