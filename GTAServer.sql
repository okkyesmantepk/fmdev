-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6536
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for nopixel
CREATE DATABASE IF NOT EXISTS `nopixel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `nopixel`;

-- Dumping structure for table nopixel.adminlogs
CREATE TABLE IF NOT EXISTS `adminlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerName` varchar(50) NOT NULL,
  `PlayerHex` varchar(100) NOT NULL,
  `Module` varchar(100) NOT NULL,
  `Title` text NOT NULL,
  `MetaData` text DEFAULT NULL,
  `DTInserted` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.bank_transactions
CREATE TABLE IF NOT EXISTS `bank_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) NOT NULL,
  `sender` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL DEFAULT '',
  `amount` int(11) NOT NULL,
  `iden` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT 'income',
  `date` varchar(50) DEFAULT NULL,
  `business_id` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.banlisthistory
CREATE TABLE IF NOT EXISTS `banlisthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `identifier` varchar(25) DEFAULT NULL,
  `liveid` varchar(21) DEFAULT NULL,
  `xblid` varchar(21) DEFAULT NULL,
  `discord` varchar(30) DEFAULT NULL,
  `playerip` varchar(25) DEFAULT NULL,
  `targetplayername` varchar(32) DEFAULT NULL,
  `sourceplayername` varchar(32) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `timeat` int(11) NOT NULL,
  `added` varchar(40) NOT NULL,
  `expiration` int(11) NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expire` int(11) NOT NULL DEFAULT 0,
  `banid` varchar(50) NOT NULL DEFAULT '0',
  `steam` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `license` varchar(50) NOT NULL DEFAULT '0',
  `license2` varchar(50) NOT NULL DEFAULT '0',
  `reason` varchar(50) NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL DEFAULT '0',
  `xbox` varchar(50) NOT NULL DEFAULT '0',
  `live` varchar(50) NOT NULL DEFAULT '0',
  `discord` varchar(50) NOT NULL DEFAULT '0',
  `cfx` varchar(50) NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '0',
  `token` varchar(50) NOT NULL DEFAULT '0',
  `bannedon` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.boosting
CREATE TABLE IF NOT EXISTS `boosting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `vehicle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `expires` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `units` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ExtraVin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `coords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.boosting_gne
CREATE TABLE IF NOT EXISTS `boosting_gne` (
  `gne` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.boosting_users
CREATE TABLE IF NOT EXISTS `boosting_users` (
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `gne` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cooldown` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.boost_queue
CREATE TABLE IF NOT EXISTS `boost_queue` (
  `identifier` varchar(60) NOT NULL,
  `pSrc` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.bulletclub_leaderboard
CREATE TABLE IF NOT EXISTS `bulletclub_leaderboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `difficulty` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `score` int(255) DEFAULT NULL,
  `cid` int(255) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.businesses
CREATE TABLE IF NOT EXISTS `businesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` varchar(255) NOT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `employees` longtext DEFAULT NULL,
  `roles` longtext DEFAULT NULL,
  `bank` int(255) DEFAULT 0,
  `bank_id` int(8) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL DEFAULT 'John',
  `last_name` varchar(50) NOT NULL DEFAULT 'Doe',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dob` varchar(50) DEFAULT 'NULL',
  `cash` int(9) DEFAULT 500,
  `bank` int(9) NOT NULL DEFAULT 25000,
  `phone_number` varchar(15) DEFAULT NULL,
  `story` text NOT NULL,
  `new` int(1) NOT NULL DEFAULT 1,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `gender` int(1) NOT NULL DEFAULT 0,
  `job` varchar(50) DEFAULT 'unemployed',
  `jail_time` int(11) NOT NULL DEFAULT 0,
  `dirty_money` int(11) NOT NULL DEFAULT 0,
  `gang_type` int(11) NOT NULL DEFAULT 0,
  `jail_time_mobster` int(11) unsigned zerofill NOT NULL DEFAULT 00000000000,
  `judge_type` int(11) NOT NULL DEFAULT 0,
  `iswjob` int(11) NOT NULL DEFAULT 0,
  `metaData` varchar(1520) DEFAULT '{}',
  `stress_level` int(11) DEFAULT 0,
  `bones` mediumtext DEFAULT '{}',
  `emotes` varchar(4160) DEFAULT '{}',
  `paycheck` int(11) DEFAULT 0,
  `stocks` mediumtext DEFAULT NULL,
  `rehab` int(12) DEFAULT 0,
  `meta` text DEFAULT 'move_m@casual@d',
  `dna` text DEFAULT '{}',
  `contacts` longtext DEFAULT NULL,
  `messages` longtext DEFAULT NULL,
  `accounts` longtext DEFAULT NULL,
  `gallery` longtext DEFAULT NULL,
  `wallpaper` longtext DEFAULT NULL,
  `ammo` longtext DEFAULT NULL,
  `licenses` longtext NOT NULL DEFAULT '[{"license":"Weapon","issuedDate":"","issuedBy":"","issued":0},{"license":"Hunting","issuedDate":"","issuedBy":"","issued":0},{"license":"Business","issuedDate":"","issuedBy":"","issued":0},{"license":"Drivers","issuedDate":"","issuedBy":"","issued":1},{"license":"Fishing","issuedDate":"","issuedBy":"","issued":0},{"license":"Bar","issuedDate":"","issuedBy":"","issued":0},{"license":"Pilot","issuedDate":"","issuedBy":"","issued":0}]',
  `Shungite` longtext NOT NULL DEFAULT '0',
  `tgb` longtext NOT NULL DEFAULT '0',
  `dvd` longtext NOT NULL DEFAULT '0',
  `chips` tinytext NOT NULL DEFAULT '0',
  `bank_id` int(8) DEFAULT NULL,
  `profilepic` varchar(255) DEFAULT NULL,
  `information` longtext DEFAULT NULL,
  `alias` longtext DEFAULT NULL,
  `jail` varchar(50) DEFAULT 'new',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.characters_cars
CREATE TABLE IF NOT EXISTS `characters_cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character_name` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `purchase_price` float DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `data` text NOT NULL,
  `wheelfitment` longtext NOT NULL DEFAULT '{"fr":0.71801799535751, "fl":-0.72000002861023, "width":1.0, "rl":-0.71801799535751, "rr":0.71801799535751}',
  `vehicle_state` text DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `name` varchar(50) DEFAULT NULL,
  `engine_damage` bigint(19) DEFAULT 1000,
  `body_damage` bigint(20) DEFAULT 1000,
  `degredation` longtext DEFAULT '100,100,100,100,100,100,100,100',
  `current_garage` varchar(50) DEFAULT NULL,
  `server_number` varchar(50) DEFAULT NULL,
  `vin` varchar(50) DEFAULT '0',
  `financed` int(11) DEFAULT 0,
  `isfinanced` int(11) DEFAULT 0,
  `isTuner` int(11) DEFAULT 0,
  `last_payment` int(11) DEFAULT 0,
  `phone_number` text DEFAULT NULL,
  `coords` varchar(255) DEFAULT NULL,
  `license_plate` varchar(255) NOT NULL DEFAULT '',
  `harness` varchar(50) DEFAULT '0',
  `nitrous` varchar(50) DEFAULT '0',
  `payments_left` int(3) DEFAULT 0,
  `StrikeTime` int(3) DEFAULT 0,
  `strikes` int(3) DEFAULT 0,
  `vehiclepic` varchar(255) DEFAULT NULL,
  `information` longtext DEFAULT NULL,
  `current_model` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.characters_clothes
CREATE TABLE IF NOT EXISTS `characters_clothes` (
  `cid` int(11) DEFAULT NULL,
  `assExist` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.characters_gangs
CREATE TABLE IF NOT EXISTS `characters_gangs` (
  `owner` varchar(50) NOT NULL,
  `cid` int(11) NOT NULL,
  `gang` varchar(50) DEFAULT 'none',
  `rank` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.characters_houses
CREATE TABLE IF NOT EXISTS `characters_houses` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT '[]',
  `name` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` int(11) DEFAULT NULL,
  `owned` varchar(50) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `hasgarage` varchar(50) DEFAULT 'false',
  `garage` varchar(200) DEFAULT '[]',
  `keyholders` text DEFAULT NULL,
  `decorations` longtext DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.characters_house_plants
CREATE TABLE IF NOT EXISTS `characters_house_plants` (
  `id` int(11) NOT NULL,
  `houseid` varchar(50) DEFAULT '11111',
  `plants` varchar(65000) DEFAULT '[]'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.characters_weapons
CREATE TABLE IF NOT EXISTS `characters_weapons` (
  `id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `ammo` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.character_carkeys
CREATE TABLE IF NOT EXISTS `character_carkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `plate` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.character_current
CREATE TABLE IF NOT EXISTS `character_current` (
  `cid` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `drawables` mediumtext DEFAULT NULL,
  `props` mediumtext DEFAULT NULL,
  `drawtextures` mediumtext DEFAULT NULL,
  `proptextures` mediumtext DEFAULT NULL,
  `assExists` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.character_face
CREATE TABLE IF NOT EXISTS `character_face` (
  `cid` int(11) DEFAULT NULL,
  `hairColor` mediumtext DEFAULT NULL,
  `headBlend` mediumtext DEFAULT NULL,
  `headOverlay` mediumtext DEFAULT NULL,
  `headStructure` mediumtext DEFAULT NULL,
  `headFade` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.character_hospital_patients
CREATE TABLE IF NOT EXISTS `character_hospital_patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `illness` varchar(50) NOT NULL DEFAULT 'none',
  `level` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.character_housing
CREATE TABLE IF NOT EXISTS `character_housing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `housing_id` int(11) NOT NULL,
  `Street` text NOT NULL,
  `assigned` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.character_housing_keys
CREATE TABLE IF NOT EXISTS `character_housing_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `housing_id` int(11) NOT NULL,
  `giver` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.character_motel
CREATE TABLE IF NOT EXISTS `character_motel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `building_type` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.character_outfits
CREATE TABLE IF NOT EXISTS `character_outfits` (
  `cid` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  `drawables` text DEFAULT '{}',
  `props` text DEFAULT '{}',
  `drawtextures` text DEFAULT '{}',
  `proptextures` text DEFAULT '{}',
  `hairColor` text DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.character_passes
CREATE TABLE IF NOT EXISTS `character_passes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `rank` int(11) NOT NULL DEFAULT 1,
  `name` text NOT NULL,
  `giver` text NOT NULL,
  `pass_type` text NOT NULL,
  `business_name` text NOT NULL,
  `bank` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.character_presets
CREATE TABLE IF NOT EXISTS `character_presets` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `drawables` mediumtext DEFAULT NULL,
  `props` mediumtext DEFAULT NULL,
  `drawtextures` mediumtext DEFAULT NULL,
  `proptextures` mediumtext DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.character_tattoos
CREATE TABLE IF NOT EXISTS `character_tattoos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT 0,
  `tattoos` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.debt_logs
CREATE TABLE IF NOT EXISTS `debt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT 0,
  `biller` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `number` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.driving_tests
CREATE TABLE IF NOT EXISTS `driving_tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `icid` int(11) DEFAULT NULL,
  `instructor` varchar(255) DEFAULT NULL,
  `timestamp` text DEFAULT NULL,
  `points` varchar(255) DEFAULT '0',
  `passed` varchar(255) DEFAULT 'false',
  `results` text DEFAULT '{}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.general_variables
CREATE TABLE IF NOT EXISTS `general_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` text DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.group_banking
CREATE TABLE IF NOT EXISTS `group_banking` (
  `group_type` mediumtext DEFAULT NULL,
  `bank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.hospital_patients
CREATE TABLE IF NOT EXISTS `hospital_patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `illness` text NOT NULL DEFAULT '',
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.houses
CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(11) NOT NULL DEFAULT 0,
  `cid` int(11) NOT NULL DEFAULT 0,
  `model` text DEFAULT '',
  `data` text DEFAULT '{}',
  `furniture` text DEFAULT '{}',
  `mykeys` text NOT NULL DEFAULT '{}',
  `house_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.housing
CREATE TABLE IF NOT EXISTS `housing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hid` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `information` text DEFAULT NULL,
  `objects` text DEFAULT NULL,
  `last_payment` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Lock',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.housing_keys
CREATE TABLE IF NOT EXISTS `housing_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hid` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.housing_price
CREATE TABLE IF NOT EXISTS `housing_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hid` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.jobs_whitelist
CREATE TABLE IF NOT EXISTS `jobs_whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `job` varchar(50) DEFAULT 'unemployed',
  `rank` int(11) DEFAULT 0,
  `callsign` varchar(255) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `dept` varchar(50) NOT NULL DEFAULT 'police',
  `badgeImage` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `Type` text DEFAULT NULL,
  `Steam` varchar(255) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT current_timestamp(),
  `Log` text DEFAULT NULL,
  `Cid` varchar(50) DEFAULT NULL,
  `Data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.mdw_charges
CREATE TABLE IF NOT EXISTS `mdw_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.mdw_evidence
CREATE TABLE IF NOT EXISTS `mdw_evidence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `identifier` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `cid` int(255) DEFAULT NULL,
  `incidentId` int(255) DEFAULT NULL,
  `tags` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.mdw_incidents
CREATE TABLE IF NOT EXISTS `mdw_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `unix` varchar(255) DEFAULT NULL,
  `info` longtext DEFAULT NULL,
  `evidence` longtext DEFAULT NULL,
  `officers` longtext DEFAULT NULL,
  `persons` longtext DEFAULT NULL,
  `tags` longtext DEFAULT NULL,
  `vehicles` longtext DEFAULT NULL,
  `criminals` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=837 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.mdw_incidents_ems
CREATE TABLE IF NOT EXISTS `mdw_incidents_ems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `unix` varchar(255) DEFAULT NULL,
  `info` longtext DEFAULT NULL,
  `ems` longtext DEFAULT NULL,
  `persons` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.mdw_warrants
CREATE TABLE IF NOT EXISTS `mdw_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(255) DEFAULT 0,
  `incidentid` int(255) DEFAULT 0,
  `expiry` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.phone_yp
CREATE TABLE IF NOT EXISTS `phone_yp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `job` varchar(500) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.playerstattoos
CREATE TABLE IF NOT EXISTS `playerstattoos` (
  `identifier` int(11) DEFAULT NULL,
  `tattoos` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.player_logs
CREATE TABLE IF NOT EXISTS `player_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `steamid` varchar(255) DEFAULT NULL,
  `log` longtext DEFAULT NULL,
  `date` longtext DEFAULT NULL,
  `cid` int(255) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.player_prio
CREATE TABLE IF NOT EXISTS `player_prio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam_id` varchar(50) DEFAULT NULL,
  `prioType` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.racing_races
CREATE TABLE IF NOT EXISTS `racing_races` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `creator` varchar(255) NOT NULL,
  `distance` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `checkpoints` longtext NOT NULL,
  `fastest_time` int(11) DEFAULT 0,
  `fastest_name` varchar(255) DEFAULT 'N/A',
  `races` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.racing_tracks
CREATE TABLE IF NOT EXISTS `racing_tracks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkpoints` text DEFAULT NULL,
  `track_name` text DEFAULT NULL,
  `creator` text DEFAULT NULL,
  `distance` text DEFAULT NULL,
  `races` text DEFAULT NULL,
  `fastest_car` text DEFAULT NULL,
  `fastest_name` text DEFAULT NULL,
  `fastest_lap` int(11) DEFAULT NULL,
  `fastest_sprint` int(11) DEFAULT NULL,
  `fastest_sprint_name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.sprays
CREATE TABLE IF NOT EXISTS `sprays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float(8,4) NOT NULL,
  `y` float(8,4) NOT NULL,
  `z` float(8,4) NOT NULL,
  `rx` float(8,4) NOT NULL,
  `ry` float(8,4) NOT NULL,
  `rz` float(8,4) NOT NULL,
  `scale` float(8,4) NOT NULL,
  `text` varchar(32) NOT NULL,
  `font` varchar(32) NOT NULL,
  `color` int(3) NOT NULL,
  `interior` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.stash
CREATE TABLE IF NOT EXISTS `stash` (
  `owner_cid` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `x` int(122) DEFAULT NULL,
  `y` int(122) DEFAULT NULL,
  `z` int(122) DEFAULT NULL,
  `g_x` int(122) DEFAULT NULL,
  `g_y` int(122) DEFAULT NULL,
  `g_z` int(122) DEFAULT NULL,
  `owner_pin` int(11) DEFAULT NULL,
  `guest_pin` int(11) DEFAULT NULL,
  `useGarage` int(11) DEFAULT NULL,
  `tier` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.stocks
CREATE TABLE IF NOT EXISTS `stocks` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `change` decimal(10,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.stocks_characters
CREATE TABLE IF NOT EXISTS `stocks_characters` (
  `cid` int(11) NOT NULL,
  `SHUNG` decimal(10,2) NOT NULL DEFAULT 0.00,
  `STRAMM` decimal(10,2) DEFAULT 0.00,
  `STRLSC` decimal(10,2) DEFAULT 0.00,
  `STR711` decimal(10,2) DEFAULT 0.00,
  `STRBOA` decimal(10,2) DEFAULT 0.00,
  `STRCLS` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cid` (`cid`),
  CONSTRAINT `cid_stocks_characters_fk` FOREIGN KEY (`cid`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.storage_units
CREATE TABLE IF NOT EXISTS `storage_units` (
  `id` longtext DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `given_access` varchar(50) DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.tablet_queue
CREATE TABLE IF NOT EXISTS `tablet_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT 0,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.transaction_history
CREATE TABLE IF NOT EXISTS `transaction_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` text NOT NULL,
  `trans_id` int(11) NOT NULL,
  `account` text NOT NULL,
  `amount` int(11) NOT NULL,
  `trans_type` text NOT NULL,
  `receiver` text NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.tweets
CREATE TABLE IF NOT EXISTS `tweets` (
  `handle` longtext NOT NULL,
  `message` varchar(500) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `attachment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hex_id` varchar(100) DEFAULT NULL,
  `steam_id` varchar(50) DEFAULT NULL,
  `community_id` varchar(100) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'Uknown',
  `ip` varchar(50) NOT NULL DEFAULT 'Uknown',
  `rank` varchar(50) NOT NULL DEFAULT 'owner',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `controls` text DEFAULT '{}',
  `settings` text DEFAULT '{}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.user_apartment
CREATE TABLE IF NOT EXISTS `user_apartment` (
  `room` int(11) NOT NULL AUTO_INCREMENT,
  `roomType` int(1) DEFAULT NULL,
  `cid` mediumtext NOT NULL,
  `mykeys` varchar(50) NOT NULL DEFAULT '[]',
  `ilness` mediumtext NOT NULL DEFAULT 'Alive',
  `isImprisoned` mediumtext NOT NULL DEFAULT '0',
  `isClothesSpawn` mediumtext NOT NULL DEFAULT 'true',
  `cash` int(11) DEFAULT 0,
  PRIMARY KEY (`room`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.user_bans
CREATE TABLE IF NOT EXISTS `user_bans` (
  `name` longtext NOT NULL DEFAULT '',
  `license` longtext NOT NULL DEFAULT '',
  `discord` longtext NOT NULL DEFAULT '',
  `ip` longtext NOT NULL DEFAULT '',
  `reason` longtext NOT NULL,
  `expire` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bannedby` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.user_boat
CREATE TABLE IF NOT EXISTS `user_boat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) DEFAULT '{}',
  `boat_name` varchar(255) DEFAULT '{}',
  `boat_model` varchar(255) DEFAULT '{}',
  `boat_price` varchar(255) DEFAULT '{}',
  `boat_plate` varchar(255) DEFAULT '{}',
  `boat_state` varchar(255) DEFAULT '{}',
  `boat_colorprimary` varchar(255) DEFAULT '{}',
  `boat_colorsecondary` varchar(255) DEFAULT '{}',
  `boat_pearlescentcolor` varchar(255) DEFAULT '{}',
  `boat_wheelcolor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.user_contacts
CREATE TABLE IF NOT EXISTS `user_contacts` (
  `identifier` varchar(40) NOT NULL,
  `name` longtext NOT NULL,
  `number` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.user_inventory2
CREATE TABLE IF NOT EXISTS `user_inventory2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `item_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `quality` int(11) NOT NULL DEFAULT 100,
  `information` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `slot` int(11) NOT NULL,
  `dropped` tinyint(4) NOT NULL DEFAULT 0,
  `creationDate` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1738 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `cid` longtext NOT NULL,
  `type` longtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.user_messages
CREATE TABLE IF NOT EXISTS `user_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.user_priors
CREATE TABLE IF NOT EXISTS `user_priors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(255) NOT NULL,
  `charge` varchar(255) DEFAULT NULL,
  `times` int(255) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.user_settings
CREATE TABLE IF NOT EXISTS `user_settings` (
  `hex_id` varchar(255) NOT NULL DEFAULT '',
  `settings` varchar(255) DEFAULT '{}',
  PRIMARY KEY (`hex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.variables
CREATE TABLE IF NOT EXISTS `variables` (
  `name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.vehicle_display
CREATE TABLE IF NOT EXISTS `vehicle_display` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `commission` int(11) NOT NULL DEFAULT 10,
  `baseprice` int(11) NOT NULL DEFAULT 25,
  `price` int(11) DEFAULT 25000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.vehicle_mdt
CREATE TABLE IF NOT EXISTS `vehicle_mdt` (
  `dbid` int(11) NOT NULL,
  `plate` varchar(255) DEFAULT NULL,
  `notes` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'https://cdn.discordapp.com/attachments/832371566859124821/881624386317201498/Screenshot_1607.png',
  `code` int(11) DEFAULT 0,
  `stolen` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.vip_list
CREATE TABLE IF NOT EXISTS `vip_list` (
  `id` int(11) DEFAULT NULL,
  `steamid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.weed
CREATE TABLE IF NOT EXISTS `weed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` int(11) NOT NULL,
  `coords` varchar(255) NOT NULL,
  `strain` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `last_harvest` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.weed_plants
CREATE TABLE IF NOT EXISTS `weed_plants` (
  `id` int(11) DEFAULT 0,
  `coords` varchar(500) DEFAULT '',
  `seed` varchar(255) DEFAULT NULL,
  `growth` varchar(50) DEFAULT '0',
  `owner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.wenmo_logs
CREATE TABLE IF NOT EXISTS `wenmo_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT 0,
  `numfrom` varchar(10) DEFAULT '0',
  `numto` varchar(10) DEFAULT '0',
  `amount` int(11) DEFAULT 0,
  `comment` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel._business_logs
CREATE TABLE IF NOT EXISTS `_business_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `data_type` varchar(50) DEFAULT NULL,
  `data_info` varchar(50) DEFAULT NULL,
  `business_id` varchar(50) DEFAULT NULL,
  `data_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel._cameras
CREATE TABLE IF NOT EXISTS `_cameras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `coords` longtext DEFAULT NULL,
  `rotation` varchar(50) DEFAULT NULL,
  `cid` longtext DEFAULT NULL,
  `ownerCid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel._character_crypto_wallet
CREATE TABLE IF NOT EXISTS `_character_crypto_wallet` (
  `id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel._phone_contact
CREATE TABLE IF NOT EXISTS `_phone_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character_id` int(10) unsigned NOT NULL,
  `name` varchar(70) DEFAULT NULL,
  `number` char(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel._phone_message
CREATE TABLE IF NOT EXISTS `_phone_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number_from` char(50) NOT NULL DEFAULT '0',
  `number_to` char(50) NOT NULL DEFAULT '0',
  `message` varchar(255) DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel._scenes
CREATE TABLE IF NOT EXISTS `_scenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` varchar(1020) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `distance` float NOT NULL,
  `font` varchar(50) NOT NULL,
  `caret` varchar(50) NOT NULL,
  `solid` varchar(50) NOT NULL,
  `background` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel._transaction_log
CREATE TABLE IF NOT EXISTS `_transaction_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(36) NOT NULL DEFAULT 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxx',
  `payee_account_id` int(11) DEFAULT NULL,
  `receiver_account_id` int(11) DEFAULT NULL,
  `change` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `triggered_by` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT unix_timestamp(),
  `tax_level` int(11) NOT NULL,
  `tax_category` int(11) NOT NULL,
  `transaction_type` enum('deposit','withdraw','transfer','payslip','venmo','purchase','forfeiture','grant') NOT NULL DEFAULT 'deposit',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `transaction_id` (`transaction_id`) USING BTREE,
  KEY `transaction_log_ibfk_3` (`payee_account_id`) USING BTREE,
  KEY `transaction_log_ibfk_2` (`payee_account_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel._twats
CREATE TABLE IF NOT EXISTS `_twats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `text` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel._weed
CREATE TABLE IF NOT EXISTS `_weed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` varchar(1020) NOT NULL,
  `strain` varchar(50) NOT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT 0,
  `last_harvest` int(11) NOT NULL DEFAULT 0,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table nopixel._yellowpages
CREATE TABLE IF NOT EXISTS `_yellowpages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `text` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.__banking_logs
CREATE TABLE IF NOT EXISTS `__banking_logs` (
  `cid` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `reason` longtext NOT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `business` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.__diamondsports
CREATE TABLE IF NOT EXISTS `__diamondsports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(50) NOT NULL DEFAULT '0',
  `date` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `location` varchar(50) NOT NULL DEFAULT '0',
  `timezoneAbbreviation` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.__documents
CREATE TABLE IF NOT EXISTS `__documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) NOT NULL DEFAULT '0',
  `text` longtext NOT NULL DEFAULT '',
  `type` varchar(50) DEFAULT 'Notes',
  `authorized` longtext DEFAULT NULL,
  `temporary` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.__housedata
CREATE TABLE IF NOT EXISTS `__housedata` (
  `cid` int(11) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `house_model` int(11) DEFAULT NULL,
  `data` longtext NOT NULL DEFAULT '{}',
  `upfront` int(11) DEFAULT NULL,
  `housename` longtext DEFAULT NULL,
  `garages` longtext NOT NULL DEFAULT '{}',
  `furniture` longtext NOT NULL DEFAULT '{}',
  `status` mediumtext NOT NULL DEFAULT 'locked',
  `force_locked` mediumtext NOT NULL DEFAULT 'unlocked',
  `due` int(11) DEFAULT NULL,
  `overall` int(11) DEFAULT NULL,
  `payments` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `can_pay` mediumtext NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;


-- Dumping data for table qpixel.businesses: ~32 rows (approximately)
INSERT INTO `businesses` (`id`, `business_id`, `business_name`, `employees`, `roles`, `bank`, `bank_id`) VALUES
	(4, 'tuner_shop', 'Tuner Shop', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 3913, 19379317),
	(5, 'hayes_autos', 'Hayes Autos', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 68304454),
	(6, 'harmony_repairs', 'Harmony Repairs', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 182, 93626194),
	(7, 'ottos_autos', 'Ottos Autos', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 82826893),
	(8, 'uwu_cafe', 'Uwu Cafe', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 2578, 20562480),
	(9, 'pdm', 'Premium Deluxe Autos', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 53648, 23167245),
	(10, 'jacksons_autos', 'Jacksons Autos', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 128340, 85397904),
	(11, 'maldinis', 'Maldinis', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 2080, 10392069),
	(12, 'gallery', 'Art Gallery', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 54021356),
	(13, 'white_widow', 'White Widow', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 6939634),
	(17, 'burger_shot', 'burgershot', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 6, 35350753),
	(18, 'winery', 'winery', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 34735735),
	(19, 'rooster', 'Rooster', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 458678645),
	(20, 'fastlane', 'Fastlane', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 21474836),
	(21, 'state', 'state', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 45453453),
	(22, 'police', 'Police', '[{"role":"Owner","cid":"19","rank":5},{"role":"Owner","cid":"20","rank":5},{"role":"Owner","cid":"16","rank":5}]', '[{"role_manage":false,"can_hire":false,"role_create":true,"name":"Owner","can_fire":false,"logs_access":false,"charge_access":false,"craft_access":false,"key_access":false,"stash_access":false,"bank_access":false},{"role_manage":false,"can_hire":false,"role_create":false,"name":"Employee","can_fire":false,"charge_access":false,"craft_access":true,"key_access":true,"stash_access":true,"bank_access":false}]', 0, 7831234),
	(23, 'red_circle', 'Red Circle', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 4534893),
	(24, 'cosmic_cannabis', 'Cosmic Cannabis', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 6969420),
	(25, 'casino', 'Casino', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 45637986),
	(26, 'bennys', 'Bennys', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 68786786),
	(27, 'car_shop', 'Car Shop', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 97856454),
	(28, 'hydra_incorporation', 'Hydra Inc', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 4586786),
	(29, 'doc', 'Doctor', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 67394545),
	(30, 'warriors_table', 'Warriors Table', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 7984651),
	(31, 'skybar', 'Skybar', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 4253698),
	(32, 'mandem', 'Mandem', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 78789789),
	(33, 'tavern', 'Tavern', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 3365214),
	(34, 'recycle_center', 'Recycle Center', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 45864534),
	(35, 'high_table', 'High Table', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 89673453),
	(36, 'mtf', 'MTF', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 6697984),
	(37, 'ace_industries', 'Ace Industries', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 6697984),
	(38, 'the_diamond', 'thediamond', '[{"cid":"19","role":"Owner","rank":5}]', '[{"name":"Owner","charge_access":true,"bank_access":true,"role_manage":true,"role_create":true,"key_access":true,"stash_access":true,"craft_access":true,"can_hire":true,"can_fire":true},{"name":"Employee","charge_access":false,"bank_access":false,"role_manage":false,"role_create":false,"key_access":true,"stash_access":true,"craft_access":true,"can_hire":false,"can_fire":false}]', 0, 37055546),
	(39, 'JewelDragon', 'Jewel Dragon', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 2095, 68546541),
	(40, 'saints', 'Saints', '[{"cid":"19","rank":5,"role":"Owner"},{"cid":"16","rank":5,"role":"Owner"},{"cid":"20","rank":5,"role":"Owner"}]', '[{"name":"Owner","charge_access":true,"stash_access":true,"logs_access":true,"can_hire":true,"role_create":true,"bank_access":true,"role_manage":true,"can_fire":true,"craft_access":true,"key_access":true},{"name":"Employee","charge_access":false,"stash_access":true,"can_hire":false,"role_create":false,"bank_access":false,"role_manage":false,"can_fire":false,"craft_access":true,"key_access":true}]', 0, 3573573);

-- Dumping structure for table qpixel.characters
-- Dumping structure for table nopixel.__housekeys
CREATE TABLE IF NOT EXISTS `__housekeys` (
  `cid` int(11) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `house_model` int(11) DEFAULT NULL,
  `housename` longtext DEFAULT NULL,
  `name` mediumtext NOT NULL,
  `garages` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.__objects
CREATE TABLE IF NOT EXISTS `__objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) NOT NULL,
  `coordinates` longtext DEFAULT NULL,
  `metaData` longtext DEFAULT NULL,
  `randomId` int(255) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.__scenes
CREATE TABLE IF NOT EXISTS `__scenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `distance` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `caret` varchar(255) DEFAULT NULL,
  `font` varchar(255) DEFAULT NULL,
  `solid` varchar(255) DEFAULT NULL,
  `background` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table nopixel.__vehiclemods
CREATE TABLE IF NOT EXISTS `__vehiclemods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `durability` int(11) DEFAULT NULL,
  `license_plate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
