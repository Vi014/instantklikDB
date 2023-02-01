CREATE DATABASE `instantklik`;
USE `instantklik`;

CREATE TABLE `user`
(
	userID INT(10) PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(20) UNIQUE NOT NULL,
	password VARCHAR(100) NOT NULL,
	displayName VARCHAR(50) NOT NULL,
	avatar VARCHAR(10) DEFAULT NULL,
	banned BOOLEAN NOT NULL DEFAULT 0,
	administrator BOOLEAN NOT NULL DEFAULT 0
);

CREATE TABLE `type`
(
	typeID INT(10) PRIMARY KEY AUTO_INCREMENT,
	typeName VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE `account`
(
	accountID INT(10) PRIMARY KEY AUTO_INCREMENT,
	userID INT(10) NOT NULL,
	typeID INT(10) NOT NULL,
	link VARCHAR(50) NOT NULL,
	CONSTRAINT FK_account_user FOREIGN KEY(userID) REFERENCES user(userID) ON DELETE CASCADE,
	CONSTRAINT FK_account_type FOREIGN KEY(typeID) REFERENCES type(typeID) ON DELETE CASCADE
);


INSERT INTO `user` (username, password, displayName, avatar, administrator) VALUES
('duolingo', '$2y$10$fLfvEg.mTUMCEqtShnwMaeAFJ4rbPePu9Rfgh0C3x4ladCdG2PMiy', 'Duolingo', '5978.jpg', 0),
('meta', '$2y$10$fLfvEg.mTUMCEqtShnwMaeAFJ4rbPePu9Rfgh0C3x4ladCdG2PMiy', 'Meta', NULL, 0),
('test', '$2y$10$fLfvEg.mTUMCEqtShnwMaeAFJ4rbPePu9Rfgh0C3x4ladCdG2PMiy', 'foobar', NULL, 0),
('admin', '$2y$10$fLfvEg.mTUMCEqtShnwMaeAFJ4rbPePu9Rfgh0C3x4ladCdG2PMiy', 'admin', NULL, 1);

INSERT INTO `type` (typeName) VALUES
('Facebook'), ('Instagram'), ('Twitter'), ('TikTok'), ('LinkedIn'), ('Reddit'), ('YouTube'), ('Twitch'), ('Steam'), ('Spotify'), ('GitHub'), ('PayPal'), ('Other');

INSERT INTO `account` (userID, typeID, link) VALUES
(1, 2, 'https://www.instagram.com/duolingo'),
(1, 4, 'https://www.tiktok.com/@duolingo'),
(2, 1, 'https://www.facebook.com/Meta'),
(2, 2, 'https://twitter.com/Meta'),
(2, 3, 'https://www.instagram.com/meta/');