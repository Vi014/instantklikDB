-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jan 02, 2023 at 10:31 PM
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
-- Table structure for table `link`
--

CREATE TABLE `link` (
  `linkID` int(10) NOT NULL,
  `profileID` int(10) NOT NULL,
  `siteID` int(10) NOT NULL,
  `content` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `link`
--

INSERT INTO `link` (`linkID`, `profileID`, `siteID`, `content`) VALUES
(1, 1, 2, 'https://www.instagram.com/duolingo'),
(2, 1, 4, 'https://www.tiktok.com/@duolingo'),
(3, 2, 1, 'https://www.facebook.com/Meta'),
(4, 2, 2, 'https://twitter.com/Meta'),
(5, 2, 3, 'https://www.instagram.com/meta/');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `profileID` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `displayName` varchar(50) NOT NULL,
  `avatar` varchar(10) DEFAULT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  `administrator` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`profileID`, `username`, `password`, `displayName`, `avatar`, `banned`, `administrator`) VALUES
(1, 'duolingo', '$2y$10$/ZC4AZgvW6rkD6XTFlsr2uvBamZejCJjxO38FkI37qETWkuLtIcue', 'Duolingo', '5978.jpg', 0, 0),
(2, 'meta', '$2y$10$/ZC4AZgvW6rkD6XTFlsr2uvBamZejCJjxO38FkI37qETWkuLtIcue', 'Meta', NULL, 0, 0),
(3, 'test', '$2y$10$fLfvEg.mTUMCEqtShnwMaeAFJ4rbPePu9Rfgh0C3x4ladCdG2PMiy', 'foobar', NULL, 0, 0),
(4, 'admin', '$2y$10$fLfvEg.mTUMCEqtShnwMaeAFJ4rbPePu9Rfgh0C3x4ladCdG2PMiy', 'admin', NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `siteID` int(10) NOT NULL,
  `siteName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`siteID`, `siteName`) VALUES
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `link`
--
ALTER TABLE `link`
  ADD PRIMARY KEY (`linkID`),
  ADD KEY `FK_link_profile` (`profileID`),
  ADD KEY `FK_link_site` (`siteID`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profileID`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`siteID`),
  ADD UNIQUE KEY `siteName` (`siteName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `link`
--
ALTER TABLE `link`
  MODIFY `linkID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `profileID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `siteID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `link`
--
ALTER TABLE `link`
  ADD CONSTRAINT `FK_link_profile` FOREIGN KEY (`profileID`) REFERENCES `profile` (`profileID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_link_site` FOREIGN KEY (`siteID`) REFERENCES `site` (`siteID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
