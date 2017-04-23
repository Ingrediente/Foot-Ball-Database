CREATE TABLE `manager` (
  `manager_id` INTEGER PRIMARY KEY,
  `fname` VARCHAR(255) NOT NULL,
  `lname` VARCHAR(255) NOT NULL,
  `country` VARCHAR(255) NOT NULL,
  `age` INTEGER NOT NULL,
  `salary` INTEGER NOT NULL,
  `team_name` VARCHAR(255)
);

CREATE TABLE `points_table` (
  `team_name` TEXT NOT NULL,
  `position` INTEGER PRIMARY KEY ,
  `games_played` INTEGER,
  `won` INTEGER,
  `losses` INTEGER,
  `draw` INTEGER,
  `goals_scored` INTEGER,
  `goals_against` INTEGER,
  `points` INTEGER
);

CREATE TABLE `sponser` (
  `sponser_id` INTEGER PRIMARY KEY ,
  `s_name` VARCHAR(255) NOT NULL
);

CREATE TABLE `team` (
  `team_name` VARCHAR(255) PRIMARY KEY,
  `year_estd` DATE NOT NULL,
  `no_of_trophies` INTEGER NOT NULL,
  `manager_id` INTEGER NOT NULL,
  `position` INTEGER NOT NULL
);

CREATE INDEX `idx_team__manager_id` ON `team` (`manager_id`);

CREATE INDEX `idx_team__position` ON `team` (`position`);

ALTER TABLE `team` ADD CONSTRAINT `fk_team__manager_id` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `team` ADD CONSTRAINT `fk_team__position` FOREIGN KEY (`position`) REFERENCES `points_table` (`position`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `owner` (
  `owner_id` INTEGER PRIMARY KEY ,
  `owner_fname` VARCHAR(255) NOT NULL,
  `owner_lname` VARCHAR(255) NOT NULL,
  `team_name` VARCHAR(255) NOT NULL
);

CREATE INDEX `idx_owner__team_name` ON `owner` (`team_name`);

ALTER TABLE `owner` ADD CONSTRAINT `fk_owner__team_name` FOREIGN KEY (`team_name`) REFERENCES `team` (`team_name`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `player` (
  `player_id` INTEGER PRIMARY KEY ,
  `fname` VARCHAR(255) NOT NULL,
  `lname` VARCHAR(255) NOT NULL,
  `age` INTEGER NOT NULL,
  `country` VARCHAR(255) NOT NULL,
  `salary` INTEGER NOT NULL,
  `position` INTEGER NOT NULL,
  `team_name` VARCHAR(255) NOT NULL
);

CREATE INDEX `idx_player__team_name` ON `player` (`team_name`);

ALTER TABLE `player` ADD CONSTRAINT `fk_player__team_name` FOREIGN KEY (`team_name`) REFERENCES `team` (`team_name`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `player_sponser` (
  `player` INTEGER NOT NULL,
  `sponser` INTEGER NOT NULL,
  PRIMARY KEY (`player`, `sponser`)
);

CREATE INDEX `idx_player_sponser` ON `player_sponser` (`sponser`);

ALTER TABLE `player_sponser` ADD CONSTRAINT `fk_player_sponser__player` FOREIGN KEY (`player`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `player_sponser` ADD CONSTRAINT `fk_player_sponser__sponser` FOREIGN KEY (`sponser`) REFERENCES `sponser` (`sponser_id`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `sponser_team` (
  `sponser` INTEGER NOT NULL,
  `team` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`sponser`, `team`)
);

CREATE INDEX `idx_sponser_team` ON `sponser_team` (`team`);

ALTER TABLE `sponser_team` ADD CONSTRAINT `fk_sponser_team__sponser` FOREIGN KEY (`sponser`) REFERENCES `sponser` (`sponser_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `sponser_team` ADD CONSTRAINT `fk_sponser_team__team` FOREIGN KEY (`team`) REFERENCES `team` (`team_name`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `stadium` (
  `stadium_name` VARCHAR(255) PRIMARY KEY ,
  `capacity` INTEGER NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `year_estd` DATE NOT NULL,
  `team_name` VARCHAR(255) NOT NULL
);

CREATE INDEX `idx_stadium__team_name` ON `stadium` (`team_name`);

ALTER TABLE `stadium` ADD CONSTRAINT `fk_stadium__team_name` FOREIGN KEY (`team_name`) REFERENCES `team` (`team_name`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE `matches` (
  `matches_id` INTEGER PRIMARY KEY ,
  `date` DATE NOT NULL,
  `team1` TEXT NOT NULL,
  `team2` TEXT NOT NULL,
  `result` TEXT NOT NULL,
  `stadium_name` VARCHAR(255) NOT NULL
);

CREATE INDEX `idx_matches__stadium_name` ON `matches` (`stadium_name`);

ALTER TABLE `matches` ADD CONSTRAINT `fk_matches__stadium_name` FOREIGN KEY (`stadium_name`) REFERENCES `stadium` (`stadium_name`) ON DELETE CASCADE ON UPDATE CASCADE;


