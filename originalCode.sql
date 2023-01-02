CREATE DATABASE `instantklik`;
USE `instantklik`;

CREATE TABLE `profile`
(
	profileID INT(10) PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(20) UNIQUE NOT NULL,
	password VARCHAR(100) NOT NULL,
	displayName VARCHAR(50) NOT NULL,
	avatar VARCHAR(10) DEFAULT NULL,
	banned BOOLEAN NOT NULL DEFAULT 0,
	administrator BOOLEAN NOT NULL DEFAULT 0
);

CREATE TABLE `site`
(
	siteID INT(10) PRIMARY KEY AUTO_INCREMENT,
	siteName VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE `link`
(
	linkID INT(10) PRIMARY KEY AUTO_INCREMENT,
	profileID INT(10) NOT NULL,
	siteID INT(10) NOT NULL,
	content VARCHAR(50) NOT NULL,
	CONSTRAINT FK_link_profile FOREIGN KEY(profileID) REFERENCES profile(profileID) ON DELETE CASCADE,
	CONSTRAINT FK_link_site    FOREIGN KEY(siteID) 	  REFERENCES site(siteID) 		ON DELETE CASCADE
);


INSERT INTO `profile` (username, password, displayName, avatar, administrator) VALUES
('duolingo', '$2y$10$/ZC4AZgvW6rkD6XTFlsr2uvBamZejCJjxO38FkI37qETWkuLtIcue', 'Duolingo', '5978.jpg', 0),
('meta', '$2y$10$/ZC4AZgvW6rkD6XTFlsr2uvBamZejCJjxO38FkI37qETWkuLtIcue', 'Meta', NULL, 0),
('test', '$2y$10$fLfvEg.mTUMCEqtShnwMaeAFJ4rbPePu9Rfgh0C3x4ladCdG2PMiy', 'foobar', NULL, 0),
('admin', '$2y$10$fLfvEg.mTUMCEqtShnwMaeAFJ4rbPePu9Rfgh0C3x4ladCdG2PMiy', 'admin', NULL, 1);

INSERT INTO `site` (siteName) VALUES
('Facebook'), ('Instagram'), ('Twitter'), ('TikTok'), ('LinkedIn'), ('Reddit'), ('YouTube'), ('Twitch'), ('Steam'), ('Spotify'), ('GitHub'), ('PayPal'), ('Other');

INSERT INTO `link` (profileID, siteID, content) VALUES
(1, 2, 'https://www.instagram.com/duolingo'),
(1, 4, 'https://www.tiktok.com/@duolingo'),
(2, 1, 'https://www.facebook.com/Meta'),
(2, 2, 'https://twitter.com/Meta'),
(2, 3, 'https://www.instagram.com/meta/');