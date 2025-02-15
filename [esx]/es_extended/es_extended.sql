CREATE DATABASE IF NOT EXISTS `es_extended`;
USE `es_extended`;

ALTER DATABASE `es_extended`
	DEFAULT CHARACTER SET UTF8MB4;
	
ALTER DATABASE `es_extended`
	DEFAULT COLLATE UTF8MB4_UNICODE_CI;

CREATE TABLE `users` (
	`identifier` VARCHAR(60) NOT NULL,
	`accounts` LONGTEXT NULL DEFAULT NULL,
	`group` VARCHAR(50) NULL DEFAULT 'user',
	`inventory` LONGTEXT NULL DEFAULT NULL,
	`job` VARCHAR(20) NULL DEFAULT 'unemployed',
	`job_grade` INT NULL DEFAULT 0,
	`loadout` LONGTEXT NULL DEFAULT NULL,
	`position` VARCHAR(255) NULL DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',

	PRIMARY KEY (`identifier`)
) ENGINE=InnoDB;


CREATE TABLE `items` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`weight` INT NOT NULL DEFAULT 1,
	`rare` TINYINT NOT NULL DEFAULT 0,
	`can_remove` TINYINT NOT NULL DEFAULT 1,

	PRIMARY KEY (`name`)
) ENGINE=InnoDB;


CREATE TABLE `job_grades` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`job_name` VARCHAR(50) DEFAULT NULL,
	`grade` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`salary` INT NOT NULL,
	`skin_male` LONGTEXT NOT NULL,
	`skin_female` LONGTEXT NOT NULL,

	PRIMARY KEY (`id`)
) ENGINE=InnoDB;


INSERT INTO `job_grades` VALUES (1,'unemployed',0,'unemployed','Unemployed',200,'{}','{}');

CREATE TABLE `jobs` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) DEFAULT NULL,

	PRIMARY KEY (`name`)
) ENGINE=InnoDB;


INSERT INTO `jobs` VALUES ('unemployed','Unemployed');

-----------
-- Gangs --
-----------

ALTER TABLE `users` ADD `gang` text COLLATE utf8mb3_bin NOT NULL DEFAULT 'nogang' AFTER `job_grade`;
ALTER TABLE `users` ADD `gang_grade` int(11) NOT NULL DEFAULT 0 AFTER `gang`;

CREATE TABLE `gangs` (
  `name` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
	PRIMARY KEY (`name`)
) ENGINE=InnoDB;

INSERT INTO `gangs` (`name`, `label`) VALUES ('nogang', 'Not a gang member');

CREATE TABLE `gang_grades` (
  `id` int(11) NOT NULL,
  `gang_name` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `gang_grades` (`id`, `gang_name`, `grade`, `name`, `label`) VALUES
(1, 'nogang', 0, 'nogang', 'Not a gang member');

-- gang stashes ( WIP )
--CREATE TABLE `gang_stash` (
--  `gang` varchar(255) NOT NULL,
--  `stash` longtext NOT NULL DEFAULT '{}',
--	PRIMARY KEY (`gang`)
--) ENGINE=InnoDB;
