-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2017 at 02:35 PM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `football`
--

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE IF NOT EXISTS `manager` (
  `manager_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `salary` int(11) NOT NULL,
  `team_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`manager_id`, `fname`, `lname`, `country`, `age`, `salary`, `team_name`) VALUES
(1, 'Jose', 'Mourinho', 'Portugal', 53, 12200000, 'Chelsea'),
(2, 'Manuel', 'Pellegrini', 'Chile', 62, 4150000, 'Manchester City'),
(3, 'Arsene', 'Wenger', 'France', 67, 7200000, 'Arsenal'),
(4, 'Louis', 'Gaal', 'Netherlands', 64, 7300000, 'Manchester United'),
(5, 'Mauricio', 'Pochettino', 'Argentina', 64, 2000000, 'Tottenham Hotspur'),
(6, 'Jurgen', 'Klopp', 'Germany', 48, 7000000, 'Liverpool');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE IF NOT EXISTS `matches` (
  `matches_id` int(11) NOT NULL,
  `date` text NOT NULL,
  `team1` text NOT NULL,
  `team2` text NOT NULL,
  `result` text NOT NULL,
  `stadium_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`matches_id`, `date`, `team1`, `team2`, `result`, `stadium_name`) VALUES
(101, '8-8-2015', 'Manchester United', 'Tottenham Hotspur', 'Tottenham Hotspur won', 'Old Trafford'),
(102, '15-8-2015', 'Manchester City', 'Chelsea', 'Chelsea won', 'Etihad Stadium'),
(103, '22-8-2015', 'Arsenal', 'Liverpool', 'Arsenal won', 'Anfield'),
(104, '14-9-2015', 'Tottenham Hotspur', 'Arsenal', 'Tottenham Hotspur won', 'Emirates stadium'),
(105, '29-8-2015', 'Chelsea ', 'Manchester United', 'Manchester United won', 'Stamford Bridge'),
(106, '4-9-2015', 'Liverpool', 'Manchester City', 'Liverpool won', 'White Hart Lane'),
(107, '8-9-2015', 'Tottenham Hotspur', 'Arsenal', 'Arsenal won', 'Old Trafford'),
(108, '8-9-2015', 'Liverpool', 'Manchester United', 'Manchester United won', 'Anfield'),
(109, '13-9-2015', 'Tottenham Hotspur', 'Chelsea', 'Chelsea won', 'Stamford Bridge'),
(110, '16-9-2015', 'Chelsea', 'Liverpool', 'Chelsea won', 'White Hart Lane'),
(111, '17-9-2015', 'Tottenham Hotspur', 'Chelsea', 'Chelsea won', 'Stamford Bridge'),
(112, '19-9-2015', 'Chelsea', 'Arsenal', 'Chelsea won', 'Emirates Stadium'),
(113, '22-9-2015', 'Manchester City', 'Tottenham Hotspur', 'Draw', 'Etihad Stadium'),
(114, '24-9-2015', 'Manchester City', 'Manchester United', 'Manchester City won', 'Old Trafford'),
(115, '27-9-2015', 'Arsenal', 'Manchester City', 'Arsenal won', 'Anfield'),
(116, '29-9-2015', 'Manchester United', 'Manchester City', 'Draw', 'White Hart Lane'),
(117, '2-10-2015', 'Liverpool', 'Manchester City', 'Manchester City won', 'Anfield'),
(118, '5-9-2015', 'Manchester United', 'Arsenal', 'Arsenal won', 'Emirates Stadium');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE IF NOT EXISTS `owner` (
  `owner_id` int(11) NOT NULL,
  `owner_fname` varchar(255) NOT NULL,
  `owner_lname` varchar(255) NOT NULL,
  `team_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`owner_id`, `owner_fname`, `owner_lname`, `team_name`) VALUES
(1, 'Roman', 'Abramovich', 'Chelsea'),
(2, 'Mansour', 'Zayed', 'Manchester City'),
(3, 'Stan', 'Kroenke', 'Arsenal'),
(4, 'Malcolm', 'Glazer', 'Manchester United'),
(5, 'Daniel', 'Levy', 'Tottenham Hotspur'),
(6, 'John', 'Henry', 'Liverpool');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE IF NOT EXISTS `player` (
  `player_id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `salary` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `team_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`player_id`, `fname`, `lname`, `age`, `country`, `salary`, `position`, `team_name`) VALUES
(1, 'Asmir', 'Begovic', 29, 'Bosnia-Herzegovina', 2310000, 'Goal-keeper', 'Chelsea'),
(1, 'Joe', 'Hart', 29, 'England', 9000000, 'Goal-keeper', 'Manchester City'),
(1, 'De', 'Gea', 26, 'Spain', 4500000, 'Goal-keeper', 'Manchester United'),
(1, 'Hugo', 'Lloris', 30, 'France', 5000000, 'Goal-keeper', 'Tottenham Hotspur'),
(2, 'Branislav', 'Ivanovic', 32, 'Serbia', 1240000, 'Defender', 'Chelsea'),
(2, 'Kyle', 'Walker', 26, 'England', 6300000, 'Defender', 'Tottenham Hotspur'),
(3, 'Keiran', 'Gibbs', 27, 'England', 3200000, 'Defender', 'Arsenal'),
(3, 'Backary', 'Sagna', 33, 'France', 7800000, 'Defender', 'Manchester City'),
(3, 'Danny', 'Rose', 26, 'England', 5200000, 'Defender', 'Tottenham Hotspur'),
(4, 'Per', 'Mertesacker', 32, 'Germany', 2500000, 'Defender', 'Arsenal'),
(4, 'Cese', 'Fabregas', 29, 'Spain', 4560000, 'Mid-field', 'Chelsea'),
(4, 'Phil', 'Jones', 24, 'England', 5600000, 'Defender', 'Manchester United'),
(4, 'Toby', 'Alderweireld', 27, 'Belgium', 4500000, 'Defender', 'Tottenham Hotspur'),
(5, 'Kurt', 'Zouma', 22, 'France', 6500000, 'Defender', 'Chelsea'),
(6, 'Dejan', 'Loveren', 27, 'Croatia', 2250000, 'Defender', 'Liverpool'),
(7, 'James', 'Milner', 30, 'England', 4450000, 'Mid-field', 'Liverpool'),
(7, 'Memphis', 'Depay', 22, 'Netherlands', 5890000, 'Forward', 'Manchester United'),
(8, 'Juan', 'Mata', 28, 'Spain', 7000000, 'Mid-field', 'Manchester United'),
(9, 'Radamei', 'Falcao', 30, 'Colombia', 6500000, 'Forward', 'Chelsea'),
(9, 'Christian', 'Benteke', 26, 'Belgium', 3200000, 'Forward', 'Liverpool'),
(10, 'Jack', 'Wilshere', 24, 'England', 3000000, 'Mid-field', 'Arsenal'),
(10, 'Eden', 'Hazard', 25, 'Belgium', 8000000, 'Mid-field', 'Chelsea'),
(10, 'Sergio', 'Aguero', 28, 'Argentina', 8900000, 'Forward', 'Manchester City'),
(10, 'Wayne', 'Rooney', 31, 'England', 9130000, 'Forward', 'Manchester United'),
(10, 'Harry', 'Kane', 23, 'England', 7600000, 'Forward', 'Tottenham Hotspur'),
(11, 'Mesut', 'Ozil', 28, 'Germany', 12000000, 'Mid-field', 'Arsenal'),
(11, 'Alexandre', 'Pato', 27, 'Brazil', 5000000, 'Forward', 'Chelsea'),
(11, 'Aleksander', 'Kolarov', 31, 'Serbia', 6600000, 'Defender', 'Manchester City'),
(11, 'Erik', 'Lamella', 24, 'Argentina', 7300000, 'Mid-field', 'Tottenham Hotspur'),
(12, 'Olivier', 'Giroud', 30, 'France', 8000000, 'Forward', 'Arsenal'),
(12, 'Joe', 'Gomez', 19, 'England', 3250000, 'Defender', 'Liverpool'),
(14, 'Wilfried', 'Dony', 28, 'Ivory Coast', 3200000, 'Forward', 'Manchester City'),
(15, 'Daniel', 'Sturridge', 27, 'England', 5120000, 'Forward', 'Liverpool'),
(16, 'Aaron', 'Ramsi', 26, 'Wales', 12000000, 'Mid-field', 'Arsenal'),
(17, 'Alexis', 'Sanchez', 28, 'Chile', 11500000, 'Forward', 'Arsenal'),
(17, 'Deley', 'Blind', 26, 'Netherlands', 32500000, 'Defender', 'Manchester United'),
(19, 'Santi', 'Cazorla', 32, 'Spain', 7000000, 'Mid-field', 'Arsenal'),
(19, 'Diego', 'Costa', 28, 'Spain', 6200000, 'Forward', 'Chelsea'),
(19, 'Mousa', 'Dembele', 29, 'Belgium', 7000000, 'Mid-field', 'Tottenham Hotspur'),
(21, 'Lucas', 'Leiva', 29, 'Brazil', 6000000, 'Mid-field', 'Liverpool'),
(21, 'David', 'Silva', 30, 'Spain', 7000000, 'Mid-field', 'Manchester City'),
(22, 'Simon', 'Mignolet', 28, 'Belgium', 2250000, 'Goal-keeper', 'Liverpool'),
(22, 'Nacer', 'Chadli', 27, 'Belgium', 4900000, 'Forward', 'Tottenham Hotspur'),
(23, 'Emere', 'Can', 22, 'Germany', 5000000, 'Mid-field', 'Liverpool'),
(23, 'Christian', 'Eriksen', 24, 'Denmark', 8000000, 'Mid-field', 'Tottenham Hotspur'),
(24, 'Hector', 'Bellerin', 21, 'Spain', 1250000, 'Defender', 'Arsenal'),
(24, 'Gary', 'Cahill', 31, 'England', 3210000, 'Defender', 'Chelsea'),
(24, 'Joe', 'Allen', 26, 'Wales', 2000000, 'Mid-field', 'Liverpool'),
(25, 'Antonio', 'Valencia', 31, 'Ecuador', 4520000, 'Mid-field', 'Manchester United'),
(25, 'Joshua', 'Onomah', 19, 'England', 3100000, 'Forward', 'Tottenham Hotspur'),
(26, 'John', 'Terry', 36, 'Engalnd', 7800000, 'Defender', 'Chelsea'),
(26, 'Martin', 'Demichelis', 36, 'Argentina', 5400000, 'Defender', 'Manchester City'),
(27, 'Kevin', 'Vimmer', 24, 'Austria', 2500000, 'Defender', 'Tottenham Hotspur'),
(31, 'Bastian', 'Sehweinsteiger', 32, 'Germany', 6650000, 'Mid-field', 'Manchester United'),
(33, 'Peter', 'Cech', 34, 'Czech Republic', 5000000, 'Goal-keeper', 'Arsenal'),
(35, 'Jesse', 'Lingard', 24, 'England', 7200000, 'Mid-field', 'Manchester United'),
(39, 'Marcus', 'Rashford', 19, 'Engalnd', 3450000, 'Forward', 'Manchester United'),
(40, 'Ryan', 'Kent', 20, 'England', 4420000, 'Forward', 'Liverpool'),
(41, 'Charlie', 'Colkett', 20, 'England', 5420000, 'Mid-field', 'Chelsea'),
(42, 'Yaya', 'Toure', 33, 'Ivory Coast', 4420000, 'Mid-field', 'Manchester City'),
(43, 'Cameron', 'Jackson', 19, 'England', 6000000, 'Defender', 'Manchester United'),
(45, 'Alex', 'Iwobi', 20, 'England', 8000000, 'Forward', 'Arsenal'),
(51, 'David', 'Faupala', 19, 'France', 2600000, 'Forward', 'Manchester City'),
(56, 'Connor', 'Randall', 21, 'England', 6100000, 'Defender', 'Liverpool'),
(62, 'Brandon', 'Barker', 20, 'England', 5250000, 'Mid-field', 'Manchester City'),
(77, 'Cameron', 'Humphreys', 18, 'England', 7200000, 'Defender', 'Manchester City');

-- --------------------------------------------------------

--
-- Table structure for table `points_table`
--

CREATE TABLE IF NOT EXISTS `points_table` (
  `team_name` text NOT NULL,
  `position` int(11) NOT NULL,
  `games_played` int(11) DEFAULT NULL,
  `won` int(11) DEFAULT NULL,
  `losses` int(11) DEFAULT NULL,
  `draw` int(11) DEFAULT NULL,
  `goals_scored` int(11) DEFAULT NULL,
  `goals_against` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `points_table`
--

INSERT INTO `points_table` (`team_name`, `position`, `games_played`, `won`, `losses`, `draw`, `goals_scored`, `goals_against`, `points`) VALUES
('Chelsea', 1, 7, 5, 2, 0, 15, 6, 10),
('Manchester City', 2, 6, 4, 1, 1, 10, 7, 9),
('Arsenal', 3, 6, 4, 2, 0, 8, 6, 8),
('Manchester United', 4, 6, 3, 2, 1, 6, 8, 7),
('Tottenham Hotspur', 5, 6, 2, 3, 1, 6, 10, 5),
('Liverpool', 6, 5, 1, 4, 0, 5, 13, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sponser`
--

CREATE TABLE IF NOT EXISTS `sponser` (
  `sponser_id` int(11) NOT NULL,
  `s_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sponser`
--

INSERT INTO `sponser` (`sponser_id`, `s_name`) VALUES
(1, 'Samsung'),
(2, 'Etihad'),
(3, 'Emirates'),
(4, 'Adidas'),
(5, 'AIA Group Ltd'),
(6, 'Standard Chartered');

-- --------------------------------------------------------

--
-- Table structure for table `sponser_team`
--

CREATE TABLE IF NOT EXISTS `sponser_team` (
  `sponser` int(11) NOT NULL,
  `team` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sponser_team`
--

INSERT INTO `sponser_team` (`sponser`, `team`) VALUES
(3, 'Arsenal'),
(1, 'Chelsea'),
(6, 'Liverpool'),
(2, 'Manchester City'),
(4, 'Manchester United'),
(5, 'Tottenham Hotspur');

-- --------------------------------------------------------

--
-- Table structure for table `stadium`
--

CREATE TABLE IF NOT EXISTS `stadium` (
  `stadium_name` varchar(255) NOT NULL,
  `capacity` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `year_estd` year(4) NOT NULL,
  `team_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stadium`
--

INSERT INTO `stadium` (`stadium_name`, `capacity`, `location`, `year_estd`, `team_name`) VALUES
('Anfield', 45276, 'Liverpool,Merseyside,England', 1901, 'Liverpool'),
('Emirates stadium', 38419, 'Highbury,London,England', 1932, 'Arsenal'),
('Etihad Stadium', 54693, 'Etihad Campus Manchester,England', 1999, 'Manchester City'),
('Old Trafford', 75635, 'Greater Manchester,England', 1909, 'Manchester United'),
('Stamford Bridge', 41663, 'Fulham,Landon', 1905, 'Chelsea'),
('White Hart Lane', 36284, '748 High road,Tottenham,London', 1902, 'Tottenham Hotspur');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `team_name` varchar(255) NOT NULL,
  `year_estd` int(4) NOT NULL,
  `no_of_trophies` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_name`, `year_estd`, `no_of_trophies`, `manager_id`, `position`) VALUES
('Arsenal', 1886, 12, 3, 3),
('Chelsea', 1905, 7, 1, 1),
('Liverpool', 1892, 15, 6, 6),
('Manchester City', 1887, 5, 2, 2),
('Manchester United', 1878, 11, 4, 4),
('Tottenham Hotspur', 1882, 3, 5, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`manager_id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`matches_id`),
  ADD KEY `idx_matches__stadium_name` (`stadium_name`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`owner_id`),
  ADD KEY `idx_owner__team_name` (`team_name`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`player_id`,`team_name`),
  ADD KEY `idx_player__team_name` (`team_name`);

--
-- Indexes for table `points_table`
--
ALTER TABLE `points_table`
  ADD PRIMARY KEY (`position`);

--
-- Indexes for table `sponser`
--
ALTER TABLE `sponser`
  ADD PRIMARY KEY (`sponser_id`);

--
-- Indexes for table `sponser_team`
--
ALTER TABLE `sponser_team`
  ADD PRIMARY KEY (`sponser`,`team`),
  ADD KEY `idx_sponser_team` (`team`);

--
-- Indexes for table `stadium`
--
ALTER TABLE `stadium`
  ADD PRIMARY KEY (`stadium_name`),
  ADD KEY `idx_stadium__team_name` (`team_name`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_name`),
  ADD KEY `idx_team__manager_id` (`manager_id`),
  ADD KEY `idx_team__position` (`position`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `fk_matches__stadium_name` FOREIGN KEY (`stadium_name`) REFERENCES `stadium` (`stadium_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `owner`
--
ALTER TABLE `owner`
  ADD CONSTRAINT `fk_owner__team_name` FOREIGN KEY (`team_name`) REFERENCES `team` (`team_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `fk_player__team_name` FOREIGN KEY (`team_name`) REFERENCES `team` (`team_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sponser_team`
--
ALTER TABLE `sponser_team`
  ADD CONSTRAINT `fk_sponser_team__sponser` FOREIGN KEY (`sponser`) REFERENCES `sponser` (`sponser_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sponser_team__team` FOREIGN KEY (`team`) REFERENCES `team` (`team_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stadium`
--
ALTER TABLE `stadium`
  ADD CONSTRAINT `fk_stadium__team_name` FOREIGN KEY (`team_name`) REFERENCES `team` (`team_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `fk_team__manager_id` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_team__position` FOREIGN KEY (`position`) REFERENCES `points_table` (`position`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
