-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 18, 2018 at 11:34 PM
-- Server version: 5.6.36-82.1-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `austinh6_darksouls`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`austinh6`@`localhost` PROCEDURE `depthControl` (IN `cName` VARCHAR(255), IN `cSpecialty` VARCHAR(255), IN `cCons` VARCHAR(255), OUT `status` VARCHAR(255))  NO SQL
    DETERMINISTIC
begin
  if controlChart(cName) < 7 then
	 insert into Classes (ClassName,Specialty,Cons) Values (cName,cSpecialty,cCons);
     set status = 'ok';
  else
     set status = 'Too many Classes';
  end if;
  commit;
  END$$

--
-- Functions
--
CREATE DEFINER=`austinh6`@`localhost` FUNCTION `controlChart` (`cName` VARCHAR(255)) RETURNS INT(1) READS SQL DATA
    DETERMINISTIC
BEGIN
declare len int(1);
set len = (select count(*) from Classes where ClassName = cName);
return len;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `addBossCheck`
--

CREATE TABLE `addBossCheck` (
  `id` int(11) NOT NULL,
  `BossName` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Weaknesses` varchar(255) NOT NULL,
  `SoulsAwarded` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addBossCheck`
--

INSERT INTO `addBossCheck` (`id`, `BossName`, `Location`, `Weaknesses`, `SoulsAwarded`) VALUES
(1, 'as', '', '', 0),
(2, '123', '', '', 0),
(3, 'agfhkjd', '', '', 0),
(4, 'xyz', 'xyz', 'xyz', 1234);

-- --------------------------------------------------------

--
-- Table structure for table `addClassCheck`
--

CREATE TABLE `addClassCheck` (
  `id` int(11) NOT NULL,
  `ClassName` varchar(255) NOT NULL,
  `Cons` varchar(255) NOT NULL,
  `Specialty` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addClassCheck`
--

INSERT INTO `addClassCheck` (`id`, `ClassName`, `Cons`, `Specialty`) VALUES
(1, 'asdfgh', 'sdfgh', 'sdfgh'),
(2, 'asdfghjkl', 'asdfghjkl', 'asdfghjkl'),
(3, 'asdfghjk', 'sdfghj', 'sdfghjk'),
(4, 'asdfghjkl', 'sdfghjkl', 'asdfghjkl;');

-- --------------------------------------------------------

--
-- Table structure for table `addEnemyCheck`
--

CREATE TABLE `addEnemyCheck` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `AttackStyle` varchar(255) NOT NULL,
  `Weakness` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `addLocationCheck`
--

CREATE TABLE `addLocationCheck` (
  `id` int(11) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `hasBoss` varchar(50) NOT NULL,
  `numBosses` int(11) NOT NULL,
  `numBonfires` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `addNPCCheck`
--

CREATE TABLE `addNPCCheck` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `WeaponChoice` varchar(255) NOT NULL,
  `Merchant` varchar(50) NOT NULL,
  `Hostile` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addNPCCheck`
--

INSERT INTO `addNPCCheck` (`id`, `Name`, `Location`, `WeaponChoice`, `Merchant`, `Hostile`) VALUES
(1, 'asdf', 'asdf', 'asdf', 'asdf', 'asdf');

-- --------------------------------------------------------

--
-- Table structure for table `addShieldsCheck`
--

CREATE TABLE `addShieldsCheck` (
  `id` int(11) NOT NULL,
  `ShieldName` varchar(255) NOT NULL,
  `ShieldType` varchar(255) NOT NULL,
  `Requirement` varchar(255) NOT NULL,
  `RequirementLevels` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `addSpellsCheck`
--

CREATE TABLE `addSpellsCheck` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Requirements` varchar(255) NOT NULL,
  `RequirementLevels` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Bosses`
--

CREATE TABLE `Bosses` (
  `id` int(11) NOT NULL,
  `BossName` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Weaknesses` varchar(255) NOT NULL,
  `SoulsAwarded` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Bosses`
--

INSERT INTO `Bosses` (`id`, `BossName`, `Location`, `Weaknesses`, `SoulsAwarded`) VALUES
(1, 'The Last Giant', 'Forest of Fallen Giants', 'Fire, Lightning', 10000),
(2, 'The Pursuer', 'Forest of Fallen Giants', 'Lightning, Strike', 17000),
(3, 'Executioner\'s Chariot', 'Huntsman\'s Copse', 'Lightning, Poison', 19000),
(4, 'Looking Glass Knight', 'King\'s Passage', 'Dark, Strike, Poison', 25500),
(5, 'The Skeleton Lords', 'Huntsman\'s Copse', 'Alluring Skulls, Yearn & Strike, Strike, Fire/Lightning', 15000),
(6, 'Flexile Sentry', 'No-man\'s Wharf', 'Lightning, Poison', 14000),
(7, 'Lost Sinner', 'Sinner\'s Rise', 'Lightning', 45000),
(8, 'Belfry Gargoyles', 'Belfry Luna', 'Lightning', 25000),
(9, 'Ruin Sentinels', 'Lost Bastille', 'Lightning, Magic, Strike', 33000),
(10, 'Royal Rat Vanguard', 'Grave of Saints', 'Fire', 11000),
(11, 'Royal Rat Authority', 'Doors of Pharros', 'Fire', 14000),
(12, 'Scorpioness Najka', 'Shaded Woods', 'Fire, Dark', 23000),
(13, 'The Duke\'s Dear Freja', 'Brightstone Cove Tseldora', 'Fire', 42000),
(14, 'Mytha, The Baneful Queen', 'Earthen Peak', 'Fire', 16500),
(15, 'The Rotten', 'Black Gulch', 'Thrust', 47000),
(16, 'Old Dragonslayer', 'Heide\'s Tower of Flame', 'Fire, Magic', 20000),
(17, 'Covetous Demon', 'Harvest Valley', 'Magic, Thrust, Fire', 13000),
(18, 'Smelter Demon', 'Iron Keep', 'Lightning, Poison', 32000),
(19, 'Old Iron King', 'Iron Keep', 'Magic, Lightning', 48000),
(20, 'Guardian Dragon', 'Aldia\'s Keep', 'Lightning, Dark, Magic', 38000),
(21, 'Demon of Song', 'Shrine of Amana', 'Magic, Lightning', 26000),
(22, 'Velstadt, The Royal Aegis', 'Undead Crypt', 'Lightning', 50000),
(23, 'Vendrick', 'Undead Crypt', 'Bleed Weapons', 90000),
(24, 'Darklurker', 'Dark Chasm of Old', 'Fire, Lightning', 35000),
(25, 'Dragonrider', 'Heide\'s Tower of Flame', 'Lightning', 12000),
(26, 'Twin Dragonriders', 'Drangleic Castle', 'Fire', 26000),
(27, 'Prowling Magus and Congregation', 'Brightstone Cover Tseldora', 'Lightning', 7000),
(28, 'Giant Lord', 'Memory of Jeigh', 'Fire, Magic', 75000),
(29, 'Ancient Dragon', 'Dragon Shrine', 'Magic, Lightning', 120000),
(30, 'Throne Watcher and Throne Defender', 'Throne of Want', 'Lightning', 68000),
(31, 'Nashandra', 'Throne of Want', 'Lightning, Fire, Magic', 90000),
(32, 'Aldia, Scholar of the First Sin', 'Throne of Want', 'Lightning', 0);

--
-- Triggers `Bosses`
--
DELIMITER $$
CREATE TRIGGER `addBosses` AFTER INSERT ON `Bosses` FOR EACH ROW INSERT INTO addBossCheck (BossName, Location, Weaknesses, SoulsAwarded)
      VALUES (new.BossName, new.Location, new.Weaknesses, new.SoulsAwarded)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delBosses` BEFORE DELETE ON `Bosses` FOR EACH ROW INSERT into delBossCheck(BossName, Location, Weaknesses, SoulsAwarded)
	VALUES(old.BossName, old.Location, old.Weaknesses, old.SoulsAwarded)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `BossesView`
--

CREATE TABLE `BossesView` (
  `id` int(11) NOT NULL,
  `BossName` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Weaknesses` varchar(255) NOT NULL,
  `SoulsAwarded` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `BossesView`
--

INSERT INTO `BossesView` (`id`, `BossName`, `Location`, `Weaknesses`, `SoulsAwarded`) VALUES
(1, 'The Last Giant', 'Forest of Fallen Giants', 'Fire, Lightning', 10000),
(2, 'The Pursuer', 'Forest of Fallen Giants', 'Lightning, Strike', 17000),
(3, 'Executioner\'s Chariot', 'Huntsman\'s Copse', 'Lightning, Poison', 19000),
(4, 'Looking Glass Knight', 'King\'s Passage', 'Dark, Strike, Poison', 25500),
(5, 'The Skeleton Lords', 'Huntsman\'s Copse', 'Alluring Skulls, Yearn & Strike, Strike, Fire/Lightning', 15000),
(6, 'Flexile Sentry', 'No-man\'s Wharf', 'Lightning, Poison', 14000),
(7, 'Lost Sinner', 'Sinner\'s Rise', 'Lightning', 45000),
(8, 'Belfry Gargoyles', 'Belfry Luna', 'Lightning', 25000),
(9, 'Ruin Sentinels', 'Lost Bastille', 'Lightning, Magic, Strike', 33000),
(10, 'Royal Rat Vanguard', 'Grave of Saints', 'Fire', 11000),
(11, 'Royal Rat Authority', 'Doors of Pharros', 'Fire', 14000),
(12, 'Scorpioness Najka', 'Shaded Woods', 'Fire, Dark', 23000),
(13, 'The Duke\'s Dear Freja', 'Brightstone Cove Tseldora', 'Fire', 42000),
(14, 'Mytha, The Baneful Queen', 'Earthen Peak', 'Fire', 16500),
(15, 'The Rotten', 'Black Gulch', 'Thrust', 47000),
(16, 'Old Dragonslayer', 'Heide\'s Tower of Flame', 'Fire, Magic', 20000),
(17, 'Covetous Demon', 'Harvest Valley', 'Magic, Thrust, Fire', 13000),
(18, 'Smelter Demon', 'Iron Keep', 'Lightning, Poison', 32000),
(19, 'Old Iron King', 'Iron Keep', 'Magic, Lightning', 48000),
(20, 'Guardian Dragon', 'Aldia\'s Keep', 'Lightning, Dark, Magic', 38000),
(21, 'Demon of Song', 'Shrine of Amana', 'Magic, Lightning', 26000),
(22, 'Velstadt, The Royal Aegis', 'Undead Crypt', 'Lightning', 50000),
(23, 'Vendrick', 'Undead Crypt', 'Bleed Weapons', 90000),
(24, 'Darklurker', 'Dark Chasm of Old', 'Fire, Lightning', 35000),
(25, 'Dragonrider', 'Heide\'s Tower of Flame', 'Lightning', 12000),
(26, 'Twin Dragonriders', 'Drangleic Castle', 'Fire', 26000),
(27, 'Prowling Magus and Congregation', 'Brightstone Cover Tseldora', 'Lightning', 7000),
(28, 'Giant Lord', 'Memory of Jeigh', 'Fire, Magic', 75000),
(29, 'Ancient Dragon', 'Dragon Shrine', 'Magic, Lightning', 120000),
(30, 'Throne Watcher and Throne Defender', 'Throne of Want', 'Lightning', 68000),
(31, 'Nashandra', 'Throne of Want', 'Lightning, Fire, Magic', 90000),
(32, 'Aldia, Scholar of the First Sin', 'Throne of Want', 'Lightning', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Classes`
--

CREATE TABLE `Classes` (
  `id` int(11) NOT NULL,
  `ClassName` varchar(255) NOT NULL,
  `Specialty` varchar(255) NOT NULL,
  `Cons` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Classes`
--

INSERT INTO `Classes` (`id`, `ClassName`, `Specialty`, `Cons`) VALUES
(1, 'Warrior', 'High Damage Output', 'Low Endurance and Health'),
(2, 'Knight', 'High Health and Easy to Adapt', 'Poor Magic User'),
(3, 'Swordsman', 'Heavy Weapons', 'Low Health'),
(4, 'Bandit', 'Very Dexterous and Skilled with Bow ', 'Very Poor Magic User'),
(5, 'Cleric', 'Faith Spells', 'Low Endurance'),
(6, 'Sorcerer', 'Magic/Hex', 'Low Health, Low Endurance'),
(7, 'Explorer', 'High Adaptability', 'Poor Magic User'),
(8, 'Deprived', 'None', 'None');

--
-- Triggers `Classes`
--
DELIMITER $$
CREATE TRIGGER `addClasses` AFTER INSERT ON `Classes` FOR EACH ROW INSERT INTO addClassCheck (ClassName, Specialty, Cons)
      VALUES (new.ClassName, new.Specialty, new.Cons)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delClass` BEFORE DELETE ON `Classes` FOR EACH ROW INSERT into delClassCheck(ClassName, Specialty, Cons)
	VALUES(old.ClassName, old.Specialty, old.Cons)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `controlChart`
--

CREATE TABLE `controlChart` (
  `id` int(11) NOT NULL,
  `ClassName` varchar(255) NOT NULL,
  `Specialty` varchar(255) NOT NULL,
  `Cons` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `controlChart`
--

INSERT INTO `controlChart` (`id`, `ClassName`, `Specialty`, `Cons`) VALUES
(1, 'Warrior', 'High Damage Output', 'Low Endurance and Health'),
(2, 'Knight', 'High Health and Easy to Adapt', 'Poor Magic User'),
(3, 'Swordsman', 'Heavy Weapons', 'Low Health'),
(4, 'Bandit', 'Very Dexterous and Skilled with Bow ', 'Very Poor Magic User'),
(5, 'Cleric', 'Faith Spells', 'Low Endurance'),
(6, 'Sorcerer', 'Magic/Hex', 'Low Health, Low Endurance'),
(7, 'Explorer', 'High Adaptability', 'Poor Magic User'),
(8, 'Deprived', 'None', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `delBossCheck`
--

CREATE TABLE `delBossCheck` (
  `id` int(11) NOT NULL,
  `BossName` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `Weaknesses` varchar(255) NOT NULL,
  `SoulsAwarded` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delBossCheck`
--

INSERT INTO `delBossCheck` (`id`, `BossName`, `Location`, `Weaknesses`, `SoulsAwarded`) VALUES
(1, 'xyz', 'xyz', 'xyz', 1234);

-- --------------------------------------------------------

--
-- Table structure for table `delClassCheck`
--

CREATE TABLE `delClassCheck` (
  `id` int(11) NOT NULL,
  `ClassName` varchar(255) NOT NULL,
  `Specialty` varchar(255) NOT NULL,
  `Cons` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delClassCheck`
--

INSERT INTO `delClassCheck` (`id`, `ClassName`, `Specialty`, `Cons`) VALUES
(1, 'asdfgh', 'sdfgh', 'sdfgh'),
(2, 'asdfghjkl', 'asdfghjkl', 'asdfghjkl'),
(3, 'asdfghjk', 'sdfghjk', 'sdfghj'),
(4, 'asdfghjkl', 'asdfghjkl;', 'sdfghjkl');

-- --------------------------------------------------------

--
-- Table structure for table `delEnemyCheck`
--

CREATE TABLE `delEnemyCheck` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `AttackStyle` varchar(255) NOT NULL,
  `Weakness` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `delLocationCheck`
--

CREATE TABLE `delLocationCheck` (
  `id` int(11) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `hasBoss` varchar(50) NOT NULL,
  `numBosses` int(11) NOT NULL,
  `numBonfires` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `delNPCCheck`
--

CREATE TABLE `delNPCCheck` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `WeaponChoice` varchar(255) NOT NULL,
  `Merchant` varchar(50) NOT NULL,
  `Hostile` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delNPCCheck`
--

INSERT INTO `delNPCCheck` (`id`, `Name`, `Location`, `WeaponChoice`, `Merchant`, `Hostile`) VALUES
(1, 'asdf', 'asdf', 'asdf', 'asdf', 'asdf');

-- --------------------------------------------------------

--
-- Table structure for table `delShieldsCheck`
--

CREATE TABLE `delShieldsCheck` (
  `id` int(11) NOT NULL,
  `ShieldName` varchar(255) NOT NULL,
  `ShieldType` varchar(255) NOT NULL,
  `Requirement` varchar(255) NOT NULL,
  `RequirementLevels` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `delSpellsCheck`
--

CREATE TABLE `delSpellsCheck` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Requirements` varchar(255) NOT NULL,
  `RequirementLevels` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Enemies`
--

CREATE TABLE `Enemies` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `AttackStyle` varchar(255) NOT NULL,
  `Weakness` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Enemies`
--

INSERT INTO `Enemies` (`id`, `Name`, `Location`, `AttackStyle`, `Weakness`) VALUES
(3, 'Aldia Warlock', 'Shrine of Amana', 'Dark', 'Physical'),
(4, 'Alonne Knight', 'Iron Keep', 'Physical', 'None'),
(5, 'Alonne Knight Captain', 'Iron Keep', 'Physical', 'Physical'),
(6, 'Amana Aberration', 'Shrine of Amana', 'Physical', 'Physical'),
(7, 'Amana Priestess', 'Shrine of Amana', 'Magic', 'None'),
(8, 'Archdrake Pilgrim', 'Shrine of Amana', 'Physical', 'Physical'),
(9, 'Armored Skeleton', 'Undead Crypt', 'Physical', 'Physical'),
(10, 'Basilisk', 'Shaded Woods', 'Petrify', 'Magic'),
(11, 'Mounted Overseer', 'Harvest Valley', 'Dark', 'Magic'),
(12, 'Bell Keeper', 'Belfry Luna', 'All', 'None'),
(13, 'Bell Keeper Mage', 'Belfry Sol', 'Magic', 'None'),
(14, 'Bonewheel Skeleton', 'Huntsmans Copse', 'Physical', 'Fire'),
(15, 'Cragslipper', 'Black Gulch', 'Physical', 'Physical'),
(16, 'Crystal Lizard', 'Things Betwixt', 'None', 'None'),
(17, 'Curse Jar', 'Shaded Woods', 'Curse', 'Breaking'),
(18, 'Darkdweller', 'No Mans Wharf', 'Physical', 'Fire'),
(19, 'Darksucker', 'Black Gulch', 'Physical', 'Fire'),
(20, 'Dark Priestess', 'Dragon Shrine', 'Faith', 'None'),
(21, 'Desert Sorceress', 'Earthen Peak', 'Fire', 'Physical'),
(22, 'Dragon', 'Dragon Aerie', 'Fire and Physical', 'Lightning'),
(23, 'Dragonfang Acolyte', 'Dragon Shrine', 'Enchanted Physical', 'None'),
(24, 'Dragonfang Knight', 'Dragon Shrine', 'Physical', 'None'),
(25, 'Drakekeeper', 'Dragon Shrine', 'Physical', 'Physical'),
(26, 'Ducal Spider', 'Brightstone Cove Tseldora', 'Physical', 'Fire'),
(27, 'Executioner', 'Huntsmans Copse', 'Physical', 'Magic'),
(28, 'Flame Salamander', 'Forest of Fallen Giants', 'Fire', 'None'),
(29, 'Forrest Grotesque', 'Shaded Woods', 'Poison', 'None'),
(30, 'Foreign Wanderer', 'Forest of Fallen Giants', 'Physical', 'None'),
(31, 'Gaoler', 'Lost Bastille', 'Fire', 'Magic'),
(32, 'Great Basilisk', 'Shaded Woods', 'Petrify', 'Magic'),
(33, 'Great Poison Brumer', 'Shrine of Amana', 'Corrosive', 'Physical'),
(34, 'Giant Warrior', 'Memories of the Ancients', 'Physical', 'None'),
(35, 'Greatsword Bell Keeper', 'Belfry Sol', 'Physical', 'None'),
(36, 'Great Giant Warrior', 'Black Gulch', 'Physical', 'None'),
(37, 'Gyrm Warrior', 'Doors of Pharros', 'Physical', 'None'),
(38, 'Gyrm Worker', 'Doors of Pharros', 'Physical', 'Magic'),
(39, 'Hammersmith', 'Harvest Valley', 'Physical', 'Magic'),
(40, 'Heide Knight', 'Things Betwixt', 'Physical', 'None'),
(41, 'Hollow Crawler', 'Brightstone Cove Tseldora', 'Physical', 'None'),
(42, 'Hollow Infantry', 'Forest of Fallen Giants', 'Physical', 'Magic'),
(43, 'Hollow Mage', 'Brightstone Cove Tseldora', 'Dark', 'Physical'),
(44, 'Hollow Rogue', 'Huntsmans Copse', 'Physical', 'Magic'),
(45, 'Hollow Royal Soldier', 'Forest of Fallen Giants', 'Physical', 'Magic'),
(46, 'Hollow Peasant', 'Brightstone Cove Tseldora', 'Physical', 'Magic'),
(47, 'Hollow Priest', 'Brightstone Cove Tseldora', 'Magic', 'None'),
(48, 'Hollow Primal Knight', 'Doors of Pharros', 'Physical', 'None'),
(49, 'Hollow Pyromancer', 'Earthen Peak', 'Fire', 'None'),
(50, 'Hollow Varangian', 'No Mans Wharf', 'Physical', 'Physical'),
(51, 'Hunting Dog', 'Huntsman\'s Copse', 'Physical', 'None'),
(52, 'Hunting Rat', 'Grave of Saints', 'Physical', 'Fire'),
(53, 'Infantry', 'Memories of the Ancients', 'Physical', 'Magic'),
(54, 'Invisible Hollow', 'Things Betwixt', 'Physical', 'None'),
(55, 'Ironclad Soldier', 'Forest of Fallen Giants', 'Physical', 'Lightning'),
(56, 'Iron Warrior', 'Things Betwixt', 'Fire', 'None'),
(57, 'Leydia Pyromancer', 'Undead Crypt', 'Fire', 'Lightning'),
(58, 'Leydia Witch', 'Undead Crypt', 'Dark', 'None'),
(59, 'Lion Clan Warrior', 'Shaded Woods', 'Physical', 'None'),
(60, 'Masked Manikin', 'Earthen Peak', 'Physical', 'Magic'),
(61, 'Mongrel Ray', 'Things Betwixt', 'Physical', 'Fire'),
(62, 'Nimble Shadow', 'No Mans Wharf', 'Physical', 'Magic'),
(63, 'Ogre', 'Things Betwixt', 'Physical', 'Fire'),
(64, 'Old Ironclad Soldier', 'Forest of Fallen Giants', 'Physical', 'Lightning'),
(65, 'Old Knight', 'Heide\'s Tower of Flame', 'Physical', 'Dark'),
(66, 'Parasitized Undead', 'Things Betwixt', 'Physical', 'Fire'),
(67, 'Petrifying Statue Cluster', 'Things Betwixt', 'Petrify', 'Breaking'),
(68, 'Poison Brumer', 'Harvest Valley', 'Corrosive', 'Fire'),
(69, 'Poison Moth', 'Huntsmans Copse', 'Poison', 'Fire'),
(70, 'Primal Knight', 'Doors of Pharros', 'Physical', 'Magic'),
(71, 'Prowler Hound', 'Things Betwixt', 'Physical', 'Magic'),
(72, 'Prowling Magus', 'Things Betwixt', 'Magic', 'Lightning'),
(73, 'Red Crystal Lizard', 'Things Betwixt', 'Explosion', 'Ranged'),
(74, 'Roaming Soul', 'Shaded Woods', 'Physical', 'None'),
(75, 'Rotten Vermin', 'The Gutter', 'Poison', 'Lightning'),
(76, 'Royal Soldier', 'Memories of the Ancients', 'Physical', 'Magic'),
(77, 'Royal Swordsman', 'Lost Bastille', 'Physical', 'Magic'),
(78, 'Rupturing Hollow', 'Lost Bastille', 'Corrosive', 'Magic'),
(79, 'Skeleton', 'Majula', 'Physical', 'Physical'),
(80, 'Stone Knight', 'Kings Passage', 'Physical', 'Dark'),
(81, 'Stone Soldier', 'Drangleic Castle', 'Physical', 'Dark'),
(82, 'Stray Hound', 'No Mans Wharf', 'Physical', 'Fire'),
(83, 'Swollen Mongrel', 'The Gutter', 'Physical', 'Fire'),
(84, 'Syan Soldier', 'Drangleic Castle', 'Physical', 'Physical'),
(85, 'Tseldoran Settler', 'Things Betwixt', 'Faith', 'Magic'),
(86, 'Undead Aberration', 'Sinner\'s Rise', 'Physical', 'Magic'),
(87, 'Undead Crypt Knight', 'Undead Crypt', 'Physical', 'Lightning'),
(88, 'Undead Devourer', 'Majula', 'Physical', 'Fire'),
(89, 'Undead Huntsman', 'Huntsmans Copse', 'Physical', 'Magic'),
(90, 'Undead Laborer', 'Huntsmans Copse', 'Physical', 'Magic'),
(91, 'Wall Spectre', 'Undead Crypt', 'Physical', 'Lightning');

--
-- Triggers `Enemies`
--
DELIMITER $$
CREATE TRIGGER `addEnemy` AFTER INSERT ON `Enemies` FOR EACH ROW INSERT INTO addEnemyCheck (Name, Location, AttackStyle, Weakness)
      VALUES (new.Name, new.Location, new.AttackStyle, new.Weakness)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delEnemy` BEFORE DELETE ON `Enemies` FOR EACH ROW INSERT into delEnemyCheck(Name, Location, AttackStyle, Weakness)
	VALUES(old.Name, old.Location, old.AttackStyle,  old.Weakness)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Locations`
--

CREATE TABLE `Locations` (
  `id` int(11) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `hasBoss` varchar(50) NOT NULL,
  `numBosses` int(11) NOT NULL,
  `numBonfires` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Locations`
--

INSERT INTO `Locations` (`id`, `Location`, `hasBoss`, `numBosses`, `numBonfires`) VALUES
(1, 'Aldia\'s Keep', 'Yes', 1, 2),
(2, 'Belfry Luna', 'Yes', 1, 0),
(3, 'Belfry Sol', 'No', 0, 0),
(4, 'Black Gulch', 'Yes', 1, 2),
(5, 'Brightstone Cover Tseldora', 'Yes', 2, 3),
(6, 'Cathedral of Blue', 'Yes', 1, 1),
(7, 'Dark Chasm of Old', 'Yes', 1, 0),
(8, 'Doors of Pharros', 'Yes', 1, 2),
(9, 'Dragon Aerie', 'No', 0, 1),
(10, 'Dragon Memories', 'No', 0, 0),
(11, 'Dragon Shrine', 'Yes', 1, 1),
(12, 'Drangleic Castle', 'Yes', 1, 4),
(13, 'Earthen Peak', 'Yes', 1, 3),
(14, 'Forest of Fallen Giants', 'Yes', 2, 4),
(15, 'Grave of Saints', 'Yes', 1, 2),
(16, 'Harvest Valley', 'Yes', 1, 2),
(17, 'Heide\'s Tower of Flame', 'Yes', 1, 2),
(18, 'Huntsman\'s Copse', 'Yes', 1, 3),
(19, 'Iron Keep', 'Yes', 2, 3),
(20, 'Lost Bastille', 'Yes', 1, 5),
(21, 'Majula', 'No', 0, 1),
(22, 'Memory of Jeigh', 'Yes', 1, 0),
(23, 'Memory of Orro', 'No', 0, 0),
(24, 'Memory of Vammar', 'No', 0, 0),
(25, 'No-Man\'s Wharf', 'Yes', 1, 1),
(26, 'Shaded Woods', 'Yes', 1, 3),
(27, 'Shrine of Amana', 'Yes', 1, 4),
(28, 'Shrine of Winter', 'No', 0, 0),
(29, 'Sinner\'s Rise', 'Yes', 1, 1),
(30, 'The Gutter', 'No', 0, 2),
(31, 'The Pit', 'No', 0, 0),
(32, 'Things Betwixt', 'No', 0, 1),
(33, 'Throne of Want', 'Yes', 2, 0),
(34, 'Undead Crypt', 'Yes', 2, 2),
(35, 'Undead Purgatory', 'Yes', 1, 1);

--
-- Triggers `Locations`
--
DELIMITER $$
CREATE TRIGGER `addLocations` AFTER INSERT ON `Locations` FOR EACH ROW INSERT INTO addLocationCheck (Location, hasBoss, numBosses, numBonfires)
      VALUES (new.Location, new.hasBoss, new.numBosses, new.numBonfires)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delLocations` BEFORE DELETE ON `Locations` FOR EACH ROW INSERT into delLocationCheck(Location, hasBoss, numBosses, numBonfires)
	VALUES(old.Location, old.hasBoss, old.numBosses, old.numBonfires)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `NPC`
--

CREATE TABLE `NPC` (
  `id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Location` varchar(255) NOT NULL,
  `WeaponChoice` varchar(255) NOT NULL,
  `Merchant` varchar(50) NOT NULL,
  `Hostile` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `NPC`
--

INSERT INTO `NPC` (`id`, `Name`, `Location`, `WeaponChoice`, `Merchant`, `Hostile`) VALUES
(1, 'Milibeth', 'Things Betwixt', 'None', 'No', 'No'),
(2, 'Strowen', 'Things Betwixt', 'None', 'Yes', 'No'),
(3, 'Dyna and Tillo', 'Things Betwixt', 'None', 'Yes', 'No'),
(4, 'Emerald Herald', 'Majula', 'None', 'Yes', 'No'),
(5, 'Blacksmith Lenigrast', 'Majula', 'Blacksmith Hammer', 'Yes', 'No'),
(6, 'Stone Trader Chloanne', 'Harvest Valley', 'None', 'Yes', 'No'),
(7, 'Rosabeth of Melfia', 'Shaded Woods', 'Pyromancy', 'Yes', 'No'),
(8, 'Carhillion of the Fold', 'No-Man\'s Wharf', 'Magic', 'Yes', 'No'),
(9, 'Crestfallen Saulden', 'Majula', 'Sword', 'No', 'No'),
(10, 'Sweet Shalquoir', 'Majula', 'Magic', 'Yes', 'No'),
(11, 'Laddersmith Gilligan', 'Earthen Peak', 'Sword', 'Yes', 'No'),
(12, 'Maughlin the Armourer', 'Majula', 'None', 'Yes', 'No'),
(13, 'Cale the Cartographer', 'Forest of Fallen Giants', 'Katana', 'No', 'No'),
(14, 'Benhart of Jugo', 'Shaded Woods', 'BlueMoon Greatsword', 'No', 'No'),
(15, 'Merchant Hag Melentia', 'Forest of Fallen Giants', 'None', 'Yes', 'No'),
(16, 'Licia of Lindelt', 'Heide\'s Tower of Flame', 'Faith', 'Yes', 'No'),
(17, 'Mild Mannered Pate', 'Forest of Fallen Giants', 'Spear', 'No', 'No'),
(18, 'Royal Sorcerer Navlaan', 'Aldia\'s Keep', 'Magic', 'Yes', 'No'),
(19, 'Blue Sentinel Targray', 'Cathedral of Blue', 'Halberd', 'Yes', 'No'),
(20, 'Gavlan', 'No-Man\'s Wharf', 'Gyrm Greataxe', 'Yes', 'No'),
(21, 'Lucatiel of Mirrah', 'No-Man\'s Wharf', 'sword', 'No', 'No'),
(22, 'Straid of Olaphis', 'Lost Bastille', 'Magic', 'Yes', 'No'),
(23, 'Steady Hand McDuff', 'Lost Bastille', 'Blacksmith Hammer', 'Yes', 'No'),
(24, 'Bell Keeper', 'Belfry Luna', 'Sword', 'No', 'No'),
(25, 'Creighton the Wanderer', 'Huntsman\'s Copse', 'Greatsword', 'No', 'No'),
(26, 'Felkin the Outcast', 'Huntsman\'s Copse', 'Magic', 'Yes', 'No'),
(27, 'Grave Warden Agdayne', 'Undead Crypt', 'Greatsword', 'Yes', 'No'),
(28, 'Titchy Gren', 'Undead Purgatory', 'Scythe', 'Yes', 'No'),
(29, 'Darkdiver Grandahl', 'Shaded Woods', 'Magic', 'Yes', 'No'),
(30, 'Rat King', 'Grave of Saints', 'None', 'Yes', 'No'),
(31, 'Magerold of Lanafir', 'Iron Keep', 'Scythe', 'Yes', 'No'),
(32, 'Head of Vengarl', 'Shaded Woods', 'None', 'Yes', 'No'),
(33, 'Weaponsmith Ornifex', 'Shaded Woods', 'None', 'Yes', 'No'),
(34, 'Captain Drummond', 'Memory of Vammar', 'Greatsword', 'No', 'No'),
(35, 'Manscorpion Tark', 'Shaded Woods', 'None', 'No', 'No'),
(36, 'Cromwell the Pardoner', 'Brightstone Cove Tseldora', 'Faith', 'Yes', 'No'),
(37, 'Chancellor Wellager', 'Drangleic Castle', 'None', 'Yes', 'No'),
(38, 'Nashandra', 'Drangleic Castle', 'Scythe', 'No', 'Yes'),
(39, 'Milfanito', 'Shrine of Amana', 'None', 'No', 'No'),
(40, 'King Vendrick', 'Undead Crypt', 'Ultra Greatsword', 'No', 'No'),
(41, 'Ancient Dragon', 'Dragon Shrine', 'Fire', 'No', 'No'),
(42, 'Masterless Glencour', 'Heide\'s Tower of Flame', 'Ultra Greatsword', 'No', 'No'),
(43, 'Pilgrim Bellclaire', 'Lost Bastille', 'Spells', 'No', 'No'),
(44, 'Jester Thomas', 'Earthen Peak', 'Pyromancy', 'No', 'No'),
(45, 'Felicia the Brave', 'Shrine of Amana', 'Lance', 'No', 'No'),
(46, 'Ashen Knight Boyd', 'Brightstone Cove Tseldora', 'Estoc', 'No', 'No'),
(47, 'Lone Hunter Schmidt', 'Black Gulch', 'Bow', 'No', 'No'),
(48, 'Melinda the Butcher', 'The Gutter', 'Greataxe', 'No', 'Yes'),
(49, 'Nameless Usurper', 'Drangleic Castle', 'Faith', 'No', 'Yes'),
(50, 'Peculiar Kindalur', 'Shrine of Amana', 'Magic', 'No', 'Yes'),
(51, 'Merciless Roenna', 'Huntsman\'s Copse', 'Scythe', 'No', 'Yes'),
(52, 'Bowman Guthry', 'Doors of Pharros', 'Avelyn', 'No', 'Yes'),
(53, 'Aslatiel of Mirrah', 'Aldia\'s Keep', 'Old Mirrah Greatsword', 'No', 'Yes'),
(54, 'Rhoy the Explorer', 'Grave of Saints', 'Sickles', 'No', 'Yes');

--
-- Triggers `NPC`
--
DELIMITER $$
CREATE TRIGGER `addNPC` AFTER INSERT ON `NPC` FOR EACH ROW INSERT INTO addNPCCheck (Name, Location, WeaponChoice, Merchant, Hostile)
      VALUES (new.Name, new.Location, new.WeaponChoice, new.Merchant, new.Hostile)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delNPC` BEFORE DELETE ON `NPC` FOR EACH ROW INSERT into delNPCCheck(Name, Location, WeaponChoice, Merchant, Hostile)
	VALUES(old.Name, old.Location, old.WeaponChoice, old.Merchant, old.Hostile)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Shields`
--

CREATE TABLE `Shields` (
  `id` int(11) NOT NULL,
  `ShieldName` varchar(255) NOT NULL,
  `ShieldType` varchar(255) NOT NULL,
  `Requirement` varchar(255) NOT NULL,
  `RequirementLevels` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Shields`
--

INSERT INTO `Shields` (`id`, `ShieldName`, `ShieldType`, `Requirement`, `RequirementLevels`) VALUES
(1, 'Buckler', 'Small', 'Strength/Dexterity', '7/13'),
(2, 'Small Leather Shield', 'Small', 'Strength', '5'),
(3, 'Target Shield', 'Small', 'Strength/Dexterity', '8/12'),
(4, 'Crimson Parma', 'Small', 'Strength', '6'),
(5, 'Iron Parma', 'Small', 'Strength', '10'),
(6, 'Foot Soldier Shield', 'Small', 'Strength', '6'),
(7, 'Manikin Shield', 'Small', 'Strength/Dexterity', '9/12'),
(8, 'Golden Falcon Shield', 'Small', 'Strength/Dexterity', '7/10'),
(9, 'Benhart\'s Parma', 'Small', 'Strength', '7'),
(10, 'Llewellyn Shield', 'Small', 'Strength/Dexterity', '9/7'),
(11, 'Cleric\'s Parma', 'Small', 'Strength/Dexterity', '7/7'),
(12, 'Cleric\'s Small Shield', 'Small', 'Strength/Dexterity', '8/12'),
(13, 'Magic Shield', 'Small', 'Strength/Dexterity', '8/14'),
(14, 'Cursed Bone Shield', 'Small', 'Strength/Dexterity', '12/12'),
(15, 'Varangian Shield', 'Small', 'Strength/Dexterity', '9/11'),
(16, 'Watcher\'s Shield', 'Small', 'Strength/Dexterity', '8/11'),
(17, 'Phoenix Parma', 'Small', 'Strength/Dexterity', '9/10'),
(18, 'Sunlight Parma', 'Small', 'Strength/Dexterity', '7/11'),
(19, 'Transgressor\'s Leather Shield', 'Small', 'Strength', '7'),
(20, 'Large Leather Shield', 'Standard', 'Strength', '7'),
(21, 'Blue Wooden Shield', 'Standard', 'Strength', '6'),
(22, 'Silver Eagle Kite Shield', 'Standard', 'Strength', '10'),
(23, 'Old Knight\'s Shield', 'Standard', 'Strength', '24'),
(24, 'Lion Clan Shield', 'Standard', 'Strength', '8'),
(25, 'Archdrake Shield', 'Standard', 'Strength', '14'),
(26, 'Mirrah Shield', 'Standard', 'Strength', '12'),
(27, 'Drangleic Shield', 'Standard', 'Strength', '16'),
(28, 'King\'s Shield', 'Standard', 'Strength', '16'),
(29, 'Spirit Tree', 'Standard', 'Strength', '10'),
(30, 'Golden Wing Shield', 'Standard', 'Strength', '12'),
(31, 'Moon Butterfly Shield', 'Standard', 'Strength', '6'),
(32, 'Shield of the Insolent', 'Standard', 'Strength', '10'),
(33, 'Silverblack Shield', 'Standard', 'Strength', '16'),
(34, 'Stone Parma', 'Standard', 'Strength', '18'),
(35, 'Grand Spirit Tree Shield', 'Standard', 'Strength', '10'),
(36, 'Slumbering Dragon Shield', 'Standard', 'Strength', '14'),
(37, 'Chaos Shield', 'Standard', 'Strength', '10'),
(38, 'Wooden Shield', 'Standard', 'Strength', '7'),
(39, 'Hollow Soldier Shield', 'Standard', 'Strength', '8'),
(40, 'Royal Kite Shield', 'Standard', 'Strength', '12'),
(41, 'Bone Shield', 'Standard', 'Strength/Dexterity', '8/8'),
(42, 'Drakekeeper\'s Shield', 'Standard', 'Strength', '17'),
(43, 'Porcine Shield', 'Standard', 'Strength', '9'),
(44, 'Bell Keeper Shield', 'Standard', 'Strength', '7'),
(45, 'Red Rust Shield', 'Standard', 'Strength', '17'),
(46, 'Defender\'s Shield', 'Standard', 'Strength', '15'),
(47, 'Black Dragon Shield', 'Standard', 'Strength', '15'),
(48, 'Watchdragon Parma', 'Standard', 'Strength', '10'),
(49, 'Blossom Kite Shield', 'Standard', 'Strength', '12'),
(50, 'Black Flamestone Parma', 'Standard', 'Strength/Dexterity', '8/10'),
(51, 'Yellow Quartz Shield', 'Standard', 'Strength', '12'),
(52, 'Bound Wooden Shield', 'Standard', 'Strength', '11'),
(53, 'Homunculus Wooden Shield', 'Standard', 'Strength', '8'),
(54, 'Loyce Shield', 'Standard', 'Strength/Dexterity', '12/15'),
(55, 'Twin Dragon Greatshield', 'Greatshield', 'Strength', '20'),
(56, 'Tower Shield', 'Greatshield', 'Strength', '30'),
(57, 'Gyrm Greatshield', 'Greatshield', 'Strength', '32'),
(58, 'Old Knight Greatshield', 'Greatshield', 'Strength', '28'),
(59, 'Greatshield of Glory', 'Greatshield', 'Strength', '35'),
(60, 'Drakekeeper\'s Greatshield', 'Greatshield', 'Strength', '37'),
(61, 'Pate\'s Shield', 'Greatshield', 'Strength', '25'),
(62, 'Mastodon Greatshield', 'Greatshield', 'Strength', '30'),
(63, 'Havel\'s Greatshield', 'Greatshield', 'Strength', '45'),
(64, 'Pursuer\'s Greatshield', 'Greatshield', 'Strength', '38'),
(65, 'Reeve\'s Greatshield', 'Greatshield', 'Strength', '33'),
(66, 'Orma\'s Greatshield', 'Greatshield', 'Strength', '33'),
(67, 'Dragonrider Greatshield', 'Greatshield', 'Strength', '35'),
(68, 'King\'s Mirror', 'Greatshield', 'Strength', '35'),
(69, 'Rebel\'s Greatshield', 'Greatshield', 'Strength', '29'),
(70, 'Wicked Eye Greatshield', 'Greatshield', 'Strength', '31');

--
-- Triggers `Shields`
--
DELIMITER $$
CREATE TRIGGER `addShields` AFTER INSERT ON `Shields` FOR EACH ROW INSERT INTO addShieldsCheck (ShieldName, ShieldType, Requirement, RequirementLevels)
      VALUES (new.ShieldName, new.ShieldType, new.Requirement, new.RequirementLevels)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delShields` BEFORE DELETE ON `Shields` FOR EACH ROW INSERT into delShieldsCheck(ShieldName, ShieldType, Requirement, RequirementLevels)
	VALUES(old.ShieldName, old.ShieldType, old.Requirement, old.RequirementLevels)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Spells`
--

CREATE TABLE `Spells` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Requirements` varchar(255) NOT NULL,
  `RequirementLevels` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Spells`
--

INSERT INTO `Spells` (`id`, `Name`, `Type`, `Requirements`, `RequirementLevels`) VALUES
(1, 'Med Heal', 'Miracle', 'Faith', '18'),
(2, 'Great Heal Excerpt', 'Miracle', 'Faith', '14'),
(3, 'Great Heal', 'Miracle', 'Faith', '28'),
(4, 'Soothing Sunlight', 'Miracle', 'Faith', '52'),
(5, 'Replenishment', 'Miracle', 'Faith', '16'),
(6, 'Resplendent Life', 'Miracle', 'Faith', '25'),
(7, 'Bountiful Sunlight', 'Miracle', 'Faith', '38'),
(8, 'Caressing Prayer', 'Miracle', 'Faith', '15'),
(9, 'Force', 'Miracle', 'Faith', '12'),
(10, 'Heal', 'Miracle', 'Faith', '12'),
(11, 'Wrath of the Gods', 'Miracle', 'Faith', '30'),
(12, 'Emit Force', 'Miracle', 'Faith', '20'),
(13, 'Heavenly Thunder', 'Miracle', 'Faith', '17'),
(14, 'Lightning Spear', 'Miracle', 'Faith', '22'),
(15, 'Great Lightning Spear', 'Miracle', 'Faith', '42'),
(16, 'Sunlight Spear', 'Miracle', 'Faith', '55'),
(17, 'Soul Appease', 'Miracle', 'Faith', '19'),
(18, 'Blinding Bolt', 'Miracle', 'Faith', '65'),
(19, 'Magic Barrier', 'Miracle', 'Faith', '14'),
(20, 'Great Magic Barrier', 'Miracle', 'Faith', '28'),
(21, 'Homeward', 'Miracle', 'Faith', '18'),
(22, 'Guidance', 'Miracle', 'Faith', '12'),
(23, 'Sacred Oath', 'Miracle', 'Faith', '25'),
(24, 'Unveil', 'Miracle', 'Faith', '13'),
(25, 'Perserverance', 'Miracle', 'Faith', '15'),
(26, 'Sunlight Blade', 'Miracle', 'Faith', '36'),
(27, 'Fireball', 'Pyromancy', 'None', '0'),
(28, 'Fire Orb', 'Pyromancy', 'None', '0'),
(29, 'Great Fireball', 'Pyromancy', 'None', '0'),
(30, 'Great Chaos Fireball', 'Pyromancy', 'None', '0'),
(31, 'Firestorm', 'Pyromancy', 'None', '0'),
(32, 'Fire Tempest', 'Pyromancy', 'None', '0'),
(33, 'Chaos Storm', 'Pyromancy', 'None', '0'),
(34, 'Combustion', 'Pyromancy', 'None', '0'),
(35, 'Great Combustion', 'Pyromancy', 'None', '0'),
(36, 'Fire Whip', 'Pyromancy', 'None', '0'),
(37, 'Poison Mist', 'Pyromancy', 'None', '0'),
(38, 'Toxic Mist', 'Pyromancy', 'None', '0'),
(39, 'Acid Surge', 'Pyromancy', 'None', '0'),
(40, 'Lingering Flame', 'Pyromancy', 'None', '0'),
(41, 'Flame Swathe', 'Pyromancy', 'None', '0'),
(42, 'Forbidden Sun', 'Pyromancy', 'None', '0'),
(43, 'Flame Weapon', 'Pyromancy', 'None', '0'),
(44, 'Flash Sweat', 'Pyromancy', 'None', '0'),
(45, 'Iron Flesh', 'Pyromancy', 'None', '0'),
(46, 'Warmth', 'Pyromancy', 'None', '0'),
(47, 'Immolation', 'Pyromancy', 'None', '0'),
(48, 'Soul Arrow', 'Sorcery', 'Intelligence', '10'),
(49, 'Great Soul Arrow', 'Sorcery', 'Intelligence', '14'),
(50, 'Heavy Soul Arrow', 'Sorcery', 'Intelligence', '12'),
(51, 'Great Heavy Soul Arrow', 'Sorcery', 'Intelligence', '16'),
(52, 'Homing Soul Arrow', 'Sorcery', 'Intelligence', '25'),
(53, 'Heavy Homing Soul Arrow', 'Sorcery', 'Intelligence', '35'),
(54, 'Homing Soul Mass', 'Sorcery', 'Intelligence', '24'),
(55, 'Homing Crystal Soul Mass', 'Sorcery', 'Intelligence', '32'),
(56, 'Soul Spear', 'Sorcery', 'Intelligence', '40'),
(57, 'Crystal Soul Spear', 'Sorcery', 'Intelligence', '53'),
(58, 'Shockwave', 'Sorcery', 'Intelligence', '13'),
(59, 'Soul Spear Barrage', 'Sorcery', 'Intelligence', '17'),
(60, 'Soul Shower', 'Sorcery', 'Intelligence', '22'),
(61, 'Soul Greatsword', 'Sorcery', 'Intelligence', '27'),
(62, 'Soul Vortex', 'Sorcery', 'Intelligence', '37'),
(63, 'Soul Bolt', 'Sorcery', 'Intelligence', '45'),
(64, 'Soul Geyser', 'Sorcery', 'Intelligence', '64'),
(65, 'Magic Weapon', 'Sorcery', 'Intelligence', '10'),
(66, 'Great Magic Weapon', 'Sorcery', 'Intelligence', '18'),
(67, 'Crystal Magic Weapon', 'Sorcery', 'Intelligence', '28'),
(68, 'Strong Magic Shield', 'Sorcery', 'Intelligence', '19'),
(69, 'Yearn', 'Sorcery', 'Intelligence', '19'),
(70, 'Hush', 'Sorcery', 'Intelligence', '15'),
(71, 'Fall Control', 'Sorcery', 'Intelligence', '15'),
(72, 'Hidden Weapon', 'Sorcery', 'Intelligence', '14'),
(73, 'Repair', 'Sorcery', 'Intelligence', '15'),
(74, 'Cast Light', 'Sorcery', 'Intelligence', '14'),
(75, 'Chameleon', 'Sorcery', 'Intelligence', '14'),
(76, 'Unleash Magic', 'Sorcery', 'Intelligence', '58'),
(77, 'Dark Orb', 'Hex', 'Intelligence/Faith', '12/20'),
(78, 'Dark Hail', 'Hex', 'Intelligence/Faith', '19/12'),
(79, 'Dark Fog', 'Hex', 'Intelligence/Faith', '25/14'),
(80, 'Affinity', 'Hex', 'Intelligence/Faith', '40/24'),
(81, 'Dead Again', 'Hex', 'Intelligence/Faith', '22/20'),
(82, 'Dark Weapon', 'Hex', 'Intelligence/Faith', '16/14'),
(83, 'Whisper of Despair', 'Hex', 'Intelligence/Faith', '24/18'),
(84, 'Repel', 'Hex', 'Intelligence/Faith', '35/27'),
(85, 'Twisted Barricade', 'Hex', 'Intelligence/Faith', '38/25'),
(86, 'Numbness', 'Hex', 'Intelligence/Faith', '42/30'),
(87, 'Scraps of Life', 'Hex', 'Intelligence/Faith', '8/12'),
(88, 'Darkstorm', 'Hex', 'Intelligence/Faith', '12/21'),
(89, 'Resonant Soul', 'Hex', 'Intelligence/Faith', '10/18'),
(90, 'Great Resonant Soul', 'Hex', 'Intelligence/Faith', '13/26'),
(91, 'Climax', 'Hex', 'Intelligence/Faith', '30/47'),
(92, 'Resonant Flesh', 'Hex', 'Intelligence/Faith', '11/19'),
(93, 'Resonant Weapon', 'Hex', 'Intelligence/Faith', '15/24'),
(94, 'Lifedrain Patch', 'Hex', 'Intelligence/Faith', '20/35'),
(95, 'Profound Still', 'Hex', 'Intelligence/Faith', '20/42');

--
-- Triggers `Spells`
--
DELIMITER $$
CREATE TRIGGER `addSpells` AFTER INSERT ON `Spells` FOR EACH ROW INSERT INTO addSpellsCheck (Name, Type, Requirements, RequirementLevels)
      VALUES (new.Name, new.Type, new.Requirements, new.RequirementLevels)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delSpells` BEFORE DELETE ON `Spells` FOR EACH ROW INSERT into delSpellsCheck(Name, Type, Requirements, RequirementLevels)
	VALUES(old.Name, old.Type, old.Requirements, old.RequirementLevels)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `View`
-- (See below for the actual view)
--
CREATE TABLE `View` (
`id` int(11)
,`BossName` varchar(255)
,`Location` varchar(255)
,`Weaknesses` varchar(255)
,`SoulsAwarded` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `View`
--
DROP TABLE IF EXISTS `View`;

CREATE ALGORITHM=UNDEFINED DEFINER=`austinh6`@`localhost` SQL SECURITY DEFINER VIEW `View`  AS  select `Bosses`.`id` AS `id`,`Bosses`.`BossName` AS `BossName`,`Bosses`.`Location` AS `Location`,`Bosses`.`Weaknesses` AS `Weaknesses`,`Bosses`.`SoulsAwarded` AS `SoulsAwarded` from `Bosses` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addBossCheck`
--
ALTER TABLE `addBossCheck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addClassCheck`
--
ALTER TABLE `addClassCheck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addEnemyCheck`
--
ALTER TABLE `addEnemyCheck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addLocationCheck`
--
ALTER TABLE `addLocationCheck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addNPCCheck`
--
ALTER TABLE `addNPCCheck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addShieldsCheck`
--
ALTER TABLE `addShieldsCheck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addSpellsCheck`
--
ALTER TABLE `addSpellsCheck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Bosses`
--
ALTER TABLE `Bosses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `BossName` (`BossName`);

--
-- Indexes for table `BossesView`
--
ALTER TABLE `BossesView`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Classes`
--
ALTER TABLE `Classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ClassName` (`ClassName`,`Specialty`);

--
-- Indexes for table `controlChart`
--
ALTER TABLE `controlChart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delBossCheck`
--
ALTER TABLE `delBossCheck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delClassCheck`
--
ALTER TABLE `delClassCheck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delEnemyCheck`
--
ALTER TABLE `delEnemyCheck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delLocationCheck`
--
ALTER TABLE `delLocationCheck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delNPCCheck`
--
ALTER TABLE `delNPCCheck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delShieldsCheck`
--
ALTER TABLE `delShieldsCheck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delSpellsCheck`
--
ALTER TABLE `delSpellsCheck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Enemies`
--
ALTER TABLE `Enemies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `Locations`
--
ALTER TABLE `Locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `NPC`
--
ALTER TABLE `NPC`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Shields`
--
ALTER TABLE `Shields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Spells`
--
ALTER TABLE `Spells`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addBossCheck`
--
ALTER TABLE `addBossCheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `addClassCheck`
--
ALTER TABLE `addClassCheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `addEnemyCheck`
--
ALTER TABLE `addEnemyCheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `addLocationCheck`
--
ALTER TABLE `addLocationCheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `addNPCCheck`
--
ALTER TABLE `addNPCCheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `addShieldsCheck`
--
ALTER TABLE `addShieldsCheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `addSpellsCheck`
--
ALTER TABLE `addSpellsCheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Bosses`
--
ALTER TABLE `Bosses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `BossesView`
--
ALTER TABLE `BossesView`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `Classes`
--
ALTER TABLE `Classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `controlChart`
--
ALTER TABLE `controlChart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `delBossCheck`
--
ALTER TABLE `delBossCheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `delClassCheck`
--
ALTER TABLE `delClassCheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `delEnemyCheck`
--
ALTER TABLE `delEnemyCheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `delLocationCheck`
--
ALTER TABLE `delLocationCheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `delNPCCheck`
--
ALTER TABLE `delNPCCheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `delShieldsCheck`
--
ALTER TABLE `delShieldsCheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `delSpellsCheck`
--
ALTER TABLE `delSpellsCheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Enemies`
--
ALTER TABLE `Enemies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `Locations`
--
ALTER TABLE `Locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `NPC`
--
ALTER TABLE `NPC`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `Shields`
--
ALTER TABLE `Shields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `Spells`
--
ALTER TABLE `Spells`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
