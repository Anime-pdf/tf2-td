PRAGMA synchronous = OFF;
PRAGMA journal_mode = MEMORY;
BEGIN TRANSACTION;
CREATE TABLE `achievement` (
  `achievement_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `name` integer NOT NULL
,  `description` integer NOT NULL
,  `experience` integer NOT NULL
,  `image` integer NOT NULL
);
CREATE TABLE `config` (
  `config_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `variable` varchar(128) NOT NULL
,  `value` varchar(128) NOT NULL
);
CREATE TABLE `map` (
  `map_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `name` varchar(128) NOT NULL
,  `teleport_ground` varchar(128) NOT NULL
,  `teleport_air` varchar(128) NOT NULL
,  `teleport_tower` varchar(128) NOT NULL
,  `respawn_wave_time` integer NOT NULL
,  `player_limit` integer NOT NULL DEFAULT 6
,  `wave_start` integer NOT NULL
,  `wave_end` integer NOT NULL
,  UNIQUE (`name`)
,  CONSTRAINT `fk_map_wave_end` FOREIGN KEY (`wave_end`) REFERENCES `wave` (`wave_id`) ON DELETE CASCADE ON UPDATE CASCADE
,  CONSTRAINT `fk_map_wave_start` FOREIGN KEY (`wave_start`) REFERENCES `wave` (`wave_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `map` VALUES (1,'td_firstone_v11','560 -1795 -78 0 90 0','560 -1795 131 0 90 0','666 -626 -2 0 0 0',30,4,66,130);
INSERT INTO `map` VALUES (2,'td_firstone_v11b','560 -1795 -78 0 90 0','560 -1795 131 0 90 0','666 -626 -2 0 0 0',30,4,66,130);
INSERT INTO `map` VALUES (3,'td_rampant_v2d','165 1665 35 0 180 0','165 1665 35 0 180 0','-400 1083 155 0 90 0',30,4,1,65);
INSERT INTO `map` VALUES (4,'td_cavern_v4a','-1145 1514 -340 0 -90 0','-1145 1514 -340 0 -90 0','250 400 130 0 0 0',30,4,1,65);
INSERT INTO `map` VALUES (5,'td_swampy_a6','-1470 900 -442 0 -90 0','-1470 900 -442 0 -90 0','-61 1015 -350 0 90 0',30,4,1,65);
CREATE TABLE `metalpack` (
  `metalpack_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `map_id` integer NOT NULL
,  `metalpacktype_id` integer NOT NULL
,  `metal` integer NOT NULL
,  `location` varchar(128) NOT NULL
,  CONSTRAINT `fk_metalpack_map` FOREIGN KEY (`map_id`) REFERENCES `map` (`map_id`) ON DELETE CASCADE ON UPDATE CASCADE
,  CONSTRAINT `fk_metalpack_metalpacktype` FOREIGN KEY (`metalpacktype_id`) REFERENCES `metalpacktype` (`metalpacktype_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `metalpack` VALUES (1,1,1,400,'1100 -1200 -90');
INSERT INTO `metalpack` VALUES (2,1,1,400,'1370 -640 -85');
INSERT INTO `metalpack` VALUES (3,1,1,400,'860 -70 -80');
INSERT INTO `metalpack` VALUES (4,1,1,400,'-400 -920 -108');
INSERT INTO `metalpack` VALUES (5,1,2,400,'120 -5 -80');
INSERT INTO `metalpack` VALUES (6,2,1,400,'1100 -1200 -90');
INSERT INTO `metalpack` VALUES (7,2,1,400,'1370 -640 -85');
INSERT INTO `metalpack` VALUES (8,2,1,400,'860 -70 -80');
INSERT INTO `metalpack` VALUES (9,2,1,400,'-400 -920 -108');
INSERT INTO `metalpack` VALUES (10,2,2,400,'120 -5 -80');
INSERT INTO `metalpack` VALUES (11,3,1,400,'-1377 1891 45');
INSERT INTO `metalpack` VALUES (12,3,1,400,'-2370 2369 269');
INSERT INTO `metalpack` VALUES (13,3,1,400,'831 1821 525');
INSERT INTO `metalpack` VALUES (14,3,1,400,'192 448 269');
INSERT INTO `metalpack` VALUES (15,3,2,400,'192 448 269');
INSERT INTO `metalpack` VALUES (16,4,1,400,'-220 660 -145');
INSERT INTO `metalpack` VALUES (17,4,1,400,'1435 1220 -275');
INSERT INTO `metalpack` VALUES (18,4,1,400,'-740 1100 -405');
INSERT INTO `metalpack` VALUES (19,4,1,400,'-2100 1313 -150');
INSERT INTO `metalpack` VALUES (20,4,2,400,'2660 1130 170');
INSERT INTO `metalpack` VALUES (21,5,1,400,'-70 1018 -350');
INSERT INTO `metalpack` VALUES (22,5,1,400,'658 1241 -390');
INSERT INTO `metalpack` VALUES (23,5,1,400,'1223 -1225 -430');
INSERT INTO `metalpack` VALUES (24,5,1,400,'-67 -571 -460');
INSERT INTO `metalpack` VALUES (25,5,2,400,'-67 -571 -460');
CREATE TABLE `metalpacktype` (
  `metalpacktype_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `type` varchar(64) NOT NULL
,  UNIQUE (`type`)
);
INSERT INTO `metalpacktype` VALUES (2,'boss');
INSERT INTO `metalpacktype` VALUES (1,'start');
CREATE TABLE `multiplier` (
  `map_id` integer NOT NULL
,  `multipliertype_id` integer NOT NULL
,  `price` integer NOT NULL
,  `increase` integer NOT NULL
,  PRIMARY KEY (`map_id`,`multipliertype_id`)
,  CONSTRAINT `fk_multiplier_map` FOREIGN KEY (`map_id`) REFERENCES `map` (`map_id`) ON DELETE CASCADE ON UPDATE CASCADE
,  CONSTRAINT `fk_multiplier_multipliertype` FOREIGN KEY (`multipliertype_id`) REFERENCES `multipliertype` (`multipliertype_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `multiplier` VALUES (1,1,2000,1000);
INSERT INTO `multiplier` VALUES (1,2,2000,1000);
INSERT INTO `multiplier` VALUES (1,3,2000,1000);
INSERT INTO `multiplier` VALUES (1,4,2000,1000);
INSERT INTO `multiplier` VALUES (1,5,2000,1000);
INSERT INTO `multiplier` VALUES (2,1,2000,1000);
INSERT INTO `multiplier` VALUES (2,2,2000,1000);
INSERT INTO `multiplier` VALUES (2,3,2000,1000);
INSERT INTO `multiplier` VALUES (2,4,2000,1000);
INSERT INTO `multiplier` VALUES (2,5,2000,1000);
INSERT INTO `multiplier` VALUES (3,1,2000,1000);
INSERT INTO `multiplier` VALUES (3,2,2000,1000);
INSERT INTO `multiplier` VALUES (3,3,2000,1000);
INSERT INTO `multiplier` VALUES (3,4,2000,1000);
INSERT INTO `multiplier` VALUES (3,5,2000,1000);
INSERT INTO `multiplier` VALUES (4,1,2000,1000);
INSERT INTO `multiplier` VALUES (4,2,2000,1000);
INSERT INTO `multiplier` VALUES (4,3,2000,1000);
INSERT INTO `multiplier` VALUES (4,4,2000,1000);
INSERT INTO `multiplier` VALUES (4,5,2000,1000);
INSERT INTO `multiplier` VALUES (5,1,2000,1000);
INSERT INTO `multiplier` VALUES (5,2,2000,1000);
INSERT INTO `multiplier` VALUES (5,3,2000,1000);
INSERT INTO `multiplier` VALUES (5,4,2000,1000);
INSERT INTO `multiplier` VALUES (5,5,2000,1000);
CREATE TABLE `multipliertype` (
  `multipliertype_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `type` varchar(64) NOT NULL
,  UNIQUE (`type`)
);
INSERT INTO `multipliertype` VALUES (1,'bullet');
INSERT INTO `multipliertype` VALUES (5,'crit');
INSERT INTO `multipliertype` VALUES (3,'explosion');
INSERT INTO `multipliertype` VALUES (2,'fire');
INSERT INTO `multipliertype` VALUES (4,'sentry');
CREATE TABLE `player` (
  `player_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `name` varchar(64) NOT NULL
,  `steamid64` varchar(32) NOT NULL
,  `ip` varchar(32) NOT NULL
,  `first_server` integer NOT NULL
,  `last_server` integer DEFAULT NULL
,  `current_server` integer DEFAULT NULL
,  `experience` integer NOT NULL DEFAULT 0
,  `level` integer NOT NULL DEFAULT 0
,  UNIQUE (`steamid64`)
,  CONSTRAINT `fk_player_server_current` FOREIGN KEY (`current_server`) REFERENCES `server` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE
,  CONSTRAINT `fk_player_server_first` FOREIGN KEY (`first_server`) REFERENCES `server` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE
,  CONSTRAINT `fk_player_server_last` FOREIGN KEY (`last_server`) REFERENCES `server` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE `player_achievement` (
  `player_id` integer NOT NULL
,  `achievement_id` integer NOT NULL
,  PRIMARY KEY (`player_id`,`achievement_id`)
,  CONSTRAINT `fk_player_achievement_achievement` FOREIGN KEY (`achievement_id`) REFERENCES `achievement` (`achievement_id`) ON DELETE CASCADE ON UPDATE CASCADE
,  CONSTRAINT `fk_player_achievement_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE `player_ban` (
  `player_ban_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `player_id` integer NOT NULL
,  `banner` varchar(32) NOT NULL
,  `reason` varchar(160) NOT NULL
,  `time` datetime NOT NULL
,  `expire` datetime NOT NULL
,  `active` text  NOT NULL DEFAULT 'active'
,  CONSTRAINT `fk_player_ban_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE `player_config` (
  `player_id` integer NOT NULL
,  PRIMARY KEY (`player_id`)
,  CONSTRAINT `fk_player_config_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE `player_immunity` (
  `player_id` integer NOT NULL
,  `immunity` integer NOT NULL DEFAULT 0
,  PRIMARY KEY (`player_id`)
,  CONSTRAINT `fk_player_immunity_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE `player_stats` (
  `player_id` integer NOT NULL
,  `map_id` integer NOT NULL
,  `kills` integer  NOT NULL DEFAULT 0
,  `assists` integer  NOT NULL DEFAULT 0
,  `deaths` integer  NOT NULL DEFAULT 0
,  `damage` integer  NOT NULL DEFAULT 0
,  `objects_built` integer  NOT NULL DEFAULT 0
,  `towers_bought` integer  NOT NULL DEFAULT 0
,  `metal_pick` integer  NOT NULL DEFAULT 0
,  `metal_drop` integer  NOT NULL DEFAULT 0
,  `waves_played` integer  NOT NULL DEFAULT 0
,  `wave_reached` integer  NOT NULL DEFAULT 0
,  `rounds_played` integer  NOT NULL DEFAULT 0
,  `rounds_won` integer  NOT NULL DEFAULT 0
,  `playtime` integer  NOT NULL DEFAULT 0
,  `first_connect` datetime NOT NULL
,  `last_connect` datetime NOT NULL
,  `last_disconnect` datetime NOT NULL
,  PRIMARY KEY (`player_id`,`map_id`)
,  CONSTRAINT `fk_player_stats_map` FOREIGN KEY (`map_id`) REFERENCES `map` (`map_id`) ON DELETE CASCADE ON UPDATE CASCADE
,  CONSTRAINT `fk_player_stats_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE `server` (
  `server_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `name` varchar(128) DEFAULT NULL
,  `ip` varchar(32) NOT NULL
,  `port` integer  NOT NULL
,  `version` varchar(32) DEFAULT NULL
,  `password` varchar(32) DEFAULT NULL
,  `players` integer  NOT NULL DEFAULT 0
,  `map_id` integer DEFAULT NULL
,  `server_settings_id` integer DEFAULT NULL
,  `reload_map` text  NOT NULL DEFAULT 'no reload'
,  `created` datetime NOT NULL
,  `updated` datetime NOT NULL
,  UNIQUE (`ip`,`port`)
,  CONSTRAINT `fk_server_map` FOREIGN KEY (`map_id`) REFERENCES `map` (`map_id`) ON DELETE CASCADE ON UPDATE CASCADE
,  CONSTRAINT `fk_server_server_settings` FOREIGN KEY (`server_settings_id`) REFERENCES `server_settings` (`server_settings_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE `server_settings` (
  `server_settings_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `config_start` integer DEFAULT NULL
,  `config_end` integer DEFAULT NULL
,  `lockable` text  NOT NULL DEFAULT 'lockable'
,  `loglevel` text  NOT NULL DEFAULT 'Info'
,  `logtype` text  NOT NULL DEFAULT 'File and console'
,  CONSTRAINT `fk_server_config_config_end` FOREIGN KEY (`config_end`) REFERENCES `config` (`config_id`) ON DELETE CASCADE ON UPDATE CASCADE
,  CONSTRAINT `fk_server_config_config_start` FOREIGN KEY (`config_start`) REFERENCES `config` (`config_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE `server_stats` (
  `server_id` integer NOT NULL
,  `connections` integer NOT NULL DEFAULT 0
,  `rounds_played` integer NOT NULL DEFAULT 0
,  `rounds_won` integer NOT NULL DEFAULT 0
,  `playtime` integer NOT NULL DEFAULT 0
,  PRIMARY KEY (`server_id`)
,  CONSTRAINT `fk_server_stats_server` FOREIGN KEY (`server_id`) REFERENCES `server` (`server_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE `tower` (
  `tower_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `name` varchar(64) NOT NULL
,  `class` text  NOT NULL
,  `price` integer  NOT NULL
,  `damagetype` text  NOT NULL
,  `description` varchar(1024) DEFAULT NULL
,  UNIQUE (`name`)
);
INSERT INTO `tower` VALUES (1,'EngineerTower','Engineer',3000,'Melee','Will repair/upgrade any building. It has infinite metal supply.');
INSERT INTO `tower` VALUES (2,'SniperTower','Sniper',1750,'Bullet','Deals medium damage with rapid shots and inifinite range. Can be tricky to place.');
INSERT INTO `tower` VALUES (3,'MedicTower','Medic',1800,'AoE','Heals you if you get hurt. Dying is a major source of failure.');
INSERT INTO `tower` VALUES (4,'GrenadeTower','Demoman',2500,'Explosion','Has a low rate of fire but deals very high damage within a radius.');
INSERT INTO `tower` VALUES (5,'PyroTower','Pyro',1500,'Fire','Deals high damage. Enemies will begin to burn after passing it''s flames.');
INSERT INTO `tower` VALUES (6,'JarateTower','Sniper',2350,'None','Throws jarate to enemies. Any damage deal mini-crits to affected enemies.');
INSERT INTO `tower` VALUES (7,'AntiAirRocketTower','Soldier',1600,'Explosion','Fires rapid succession of rockets in the air.');
INSERT INTO `tower` VALUES (8,'AntiAirFlareTower','Pyro',1500,'Fire','Fires rapid succession of flares in the air.');
INSERT INTO `tower` VALUES (9,'CrossbowTower','Medic',2750,'Bullet','Fires rapid successions of bolts which will heal you and damage enemies.');
INSERT INTO `tower` VALUES (10,'FlareTower','Pyro',2200,'Fire','Has a slow rate of fire deals high damage (mini-crit if target is on fire) and eventually knockbacks.');
INSERT INTO `tower` VALUES (11,'HeavyTower','Heavy',2500,'Bullet','Has a high rate of fire and deals medium to high damage.');
INSERT INTO `tower` VALUES (12,'ShotgunTower','Scout',1700,'Bullet','Deals decent damage with a high rate of fire.');
INSERT INTO `tower` VALUES (13,'KnockbackTower','Scout',2350,'Bullet','Knocks enemies back, especially when near them. Can be very powerful.');
INSERT INTO `tower` VALUES (14,'RocketTower','Soldier',2500,'Explosion','Has a medium rate of fire and deals medium damage within a radius.');
INSERT INTO `tower` VALUES (15,'RapidFlareTower','Pyro',1950,'Fire','Fire flares which will damage and knock enemies a bit in the air.');
INSERT INTO `tower` VALUES (16,'BackburnerTower','Pyro',2250,'Fire',NULL);
INSERT INTO `tower` VALUES (17,'LochNLoadTower','Demoman',2150,'Explosion',NULL);
INSERT INTO `tower` VALUES (18,'MachinaTower','Sniper',1550,'Bullet',NULL);
INSERT INTO `tower` VALUES (19,'LibertyTower','Soldier',2750,'Explosion',NULL);
INSERT INTO `tower` VALUES (20,'JuggleTower','Soldier',3200,'Explosion',NULL);
INSERT INTO `tower` VALUES (21,'BushwackaTower','Sniper',1250,'Melee',NULL);
INSERT INTO `tower` VALUES (22,'NataschaTower','Heavy',2450,'Bullet',NULL);
INSERT INTO `tower` VALUES (23,'GuillotineTower','Scout',1450,'None',NULL);
INSERT INTO `tower` VALUES (24,'HomewreckerTower','Pyro',1200,'Melee',NULL);
INSERT INTO `tower` VALUES (25,'AirblastTower','Pyro',2400,'None',NULL);
INSERT INTO `tower` VALUES (26,'AoEEngineerTower','Engineer',3450,'AoE',NULL);
INSERT INTO `tower` VALUES (27,'KritzkriegTower','Medic',2000,'AoE',NULL);
INSERT INTO `tower` VALUES (28,'SlownessTower','Spy',2300,'AoE',NULL);
CREATE TABLE `towerlevel` (
  `tower_id` integer NOT NULL
,  `level` integer  NOT NULL
,  `metal` integer  NOT NULL DEFAULT 1000
,  `weapon_id` integer NOT NULL
,  `attack` text  NOT NULL
,  `rotate` text  NOT NULL DEFAULT 'no rotate'
,  `pitch` float NOT NULL DEFAULT 0
,  `damage` float NOT NULL DEFAULT 1
,  `attackspeed` float NOT NULL DEFAULT 1
,  `area` float NOT NULL DEFAULT 1
,  PRIMARY KEY (`tower_id`,`level`)
,  CONSTRAINT `fk_towerlevel_tower` FOREIGN KEY (`tower_id`) REFERENCES `tower` (`tower_id`) ON DELETE CASCADE ON UPDATE CASCADE
,  CONSTRAINT `fk_towerlevel_weapon` FOREIGN KEY (`weapon_id`) REFERENCES `weapon` (`weapon_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO `towerlevel` VALUES (1,1,1500,1,'Primary','',45,1,0.25,1);
INSERT INTO `towerlevel` VALUES (1,2,2000,22,'Primary','',45,1,0.5,1);
INSERT INTO `towerlevel` VALUES (1,3,3300,23,'Primary','',45,1,0.75,1);
INSERT INTO `towerlevel` VALUES (1,4,6000,24,'Primary','',45,1,1,1);
INSERT INTO `towerlevel` VALUES (1,5,8000,25,'Primary','',45,1,2,1);
INSERT INTO `towerlevel` VALUES (2,1,500,2,'Primary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (2,2,800,26,'Primary','',0,1.25,1,1);
INSERT INTO `towerlevel` VALUES (2,3,1200,27,'Primary','',0,1.5,1.25,1);
INSERT INTO `towerlevel` VALUES (2,4,2500,28,'Primary','no rotate',0,1.5,1.5,1);
INSERT INTO `towerlevel` VALUES (3,1,500,30,'None','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (3,2,750,29,'None','',0,1,1,1.5);
INSERT INTO `towerlevel` VALUES (3,3,1000,3,'None','',0,1,1,2);
INSERT INTO `towerlevel` VALUES (4,1,900,4,'Primary','',0,1.5,1,1);
INSERT INTO `towerlevel` VALUES (4,2,1400,4,'Primary','',0,1.5,1,1);
INSERT INTO `towerlevel` VALUES (4,3,2000,4,'Primary','',0,2,1,1);
INSERT INTO `towerlevel` VALUES (5,1,1650,5,'Primary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (5,2,1950,33,'Primary','',0,1.25,1,1);
INSERT INTO `towerlevel` VALUES (5,3,2500,34,'Primary','no rotate',0,1.3,1,1);
INSERT INTO `towerlevel` VALUES (6,1,2550,6,'Primary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (6,2,1550,35,'Primary','',0,1,1.7,1);
INSERT INTO `towerlevel` VALUES (7,1,1350,7,'Primary','',-60,1,1,1);
INSERT INTO `towerlevel` VALUES (7,2,2150,36,'Primary','',-60,1.25,1.25,1);
INSERT INTO `towerlevel` VALUES (7,3,3750,37,'Primary','',-60,1.5,1.5,1);
INSERT INTO `towerlevel` VALUES (7,4,5000,38,'Primary','',-60,2,2,1);
INSERT INTO `towerlevel` VALUES (8,1,1150,8,'Primary','',-60,1,1,1);
INSERT INTO `towerlevel` VALUES (8,2,1750,39,'Primary','',-60,1,1.5,1);
INSERT INTO `towerlevel` VALUES (8,3,2350,40,'Primary','',-60,1.1,2,1);
INSERT INTO `towerlevel` VALUES (9,1,1450,9,'Primary','',0,1,0.25,1);
INSERT INTO `towerlevel` VALUES (9,2,2500,9,'Primary','',0,1.1,0.5,1);
INSERT INTO `towerlevel` VALUES (9,3,3350,41,'Primary','',0,1.3,0.8,1);
INSERT INTO `towerlevel` VALUES (10,1,1250,8,'Primary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (10,2,2450,39,'Primary','',0,1,1.5,1);
INSERT INTO `towerlevel` VALUES (10,3,3650,40,'Primary','',0,1.35,2,1);
INSERT INTO `towerlevel` VALUES (11,1,1650,10,'Primary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (11,2,3250,42,'Primary','',0,1.2,1.3,1);
INSERT INTO `towerlevel` VALUES (11,3,5000,43,'Primary','',0,1.5,1.5,1);
INSERT INTO `towerlevel` VALUES (11,4,5000,43,'Primary','',0,1.75,1.5,1);
INSERT INTO `towerlevel` VALUES (12,1,1550,11,'Primary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (12,2,2150,45,'Primary','',0,1,1.6,1);
INSERT INTO `towerlevel` VALUES (12,3,2850,46,'Primary','',0,1.4,1.6,1);
INSERT INTO `towerlevel` VALUES (12,4,2850,47,'Primary','no rotate',0,1.5,1.6,1);
INSERT INTO `towerlevel` VALUES (13,1,4250,12,'Primary','',0,1,0.5,1);
INSERT INTO `towerlevel` VALUES (13,2,6000,12,'Primary','',0,1.15,0.75,1);
INSERT INTO `towerlevel` VALUES (13,3,8000,48,'Primary','',0,2,1,1);
INSERT INTO `towerlevel` VALUES (14,1,1250,7,'Primary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (14,2,1850,36,'Primary','',0,1.2,1.2,1);
INSERT INTO `towerlevel` VALUES (14,3,2250,37,'Primary','',0,1.35,1.3,1);
INSERT INTO `towerlevel` VALUES (14,4,2850,38,'Primary','',0,1.5,1.6,1);
INSERT INTO `towerlevel` VALUES (15,1,500,8,'Primary','',0,1,2,1);
INSERT INTO `towerlevel` VALUES (15,2,1150,39,'Primary','',0,1,2.5,1);
INSERT INTO `towerlevel` VALUES (15,3,2250,39,'Primary','',0,1,3,1);
INSERT INTO `towerlevel` VALUES (15,4,3150,40,'Primary','',0,1.5,3.5,1);
INSERT INTO `towerlevel` VALUES (16,1,750,13,'Primary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (16,2,1300,13,'Primary','',0,1.2,1,1);
INSERT INTO `towerlevel` VALUES (16,3,1800,13,'Primary','',0,1.5,1,1);
INSERT INTO `towerlevel` VALUES (17,1,1000,14,'Primary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (17,2,1300,14,'Primary','',0,1.2,1.1,1);
INSERT INTO `towerlevel` VALUES (17,3,2100,14,'Primary','',0,1.4,1.35,1);
INSERT INTO `towerlevel` VALUES (18,1,5000,15,'Primary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (18,2,8250,15,'Primary','no rotate',0,2,2,1);
INSERT INTO `towerlevel` VALUES (19,1,250,16,'Primary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (19,2,750,16,'Primary','',0,1,1.1,1);
INSERT INTO `towerlevel` VALUES (19,3,1800,16,'Primary','',0,1,1.45,1);
INSERT INTO `towerlevel` VALUES (20,1,1000,7,'Primary','',45,1,1,1);
INSERT INTO `towerlevel` VALUES (21,1,1000,17,'Primary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (21,2,1500,17,'Primary','',0,1,1.35,1);
INSERT INTO `towerlevel` VALUES (21,3,2100,17,'Primary','',0,1,2,1);
INSERT INTO `towerlevel` VALUES (22,1,2300,18,'Primary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (22,2,3200,18,'Primary','',0,1.15,2,1);
INSERT INTO `towerlevel` VALUES (23,1,1000,19,'Primary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (24,1,1000,20,'Primary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (25,1,1000,5,'Secondary','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (26,1,2000,1,'None','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (26,2,3000,22,'None','',0,1,1,1.25);
INSERT INTO `towerlevel` VALUES (26,3,4000,23,'None','',0,1,1,1.5);
INSERT INTO `towerlevel` VALUES (26,4,5000,24,'None','',0,1,1,1.75);
INSERT INTO `towerlevel` VALUES (26,5,6000,25,'None','',0,1,1,2);
INSERT INTO `towerlevel` VALUES (27,1,1000,21,'None','',0,1,1,1);
INSERT INTO `towerlevel` VALUES (28,1,1000,49,'None','',0,1,1,1);
CREATE TABLE `wave` (
  `wave_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `wavetype` integer NOT NULL
,  `name` varchar(64) NOT NULL
,  `class` text  NOT NULL
,  `quantity` integer  NOT NULL
,  `health` integer NOT NULL
);
INSERT INTO `wave` VALUES (1,0,'WeakSniper','Sniper',8,100);
INSERT INTO `wave` VALUES (2,2,'WeakSoldier','Soldier',8,125);
INSERT INTO `wave` VALUES (3,0,'WeakHeavy','Heavy',8,275);
INSERT INTO `wave` VALUES (4,0,'WeakEngineer','Engineer',10,300);
INSERT INTO `wave` VALUES (5,0,'WeakHeavy','Heavy',9,425);
INSERT INTO `wave` VALUES (6,4,'WeakSoldier','Soldier',9,375);
INSERT INTO `wave` VALUES (7,0,'WeakHeavy','Heavy',11,475);
INSERT INTO `wave` VALUES (8,8,'WeakSpy','Spy',9,395);
INSERT INTO `wave` VALUES (9,2,'WeakScout','Scout',10,475);
INSERT INTO `wave` VALUES (10,0,'WeakHeavy','Heavy',10,700);
INSERT INTO `wave` VALUES (11,1,'TheDemoman','Demoman',4,2000);
INSERT INTO `wave` VALUES (12,0,'LamePyro','Pyro',9,850);
INSERT INTO `wave` VALUES (13,0,'LameSniper','Sniper',10,825);
INSERT INTO `wave` VALUES (14,0,'LameDemoman','Demoman',10,850);
INSERT INTO `wave` VALUES (15,0,'LamePyro','Pyro',11,850);
INSERT INTO `wave` VALUES (16,0,'LameSniper','Sniper',13,700);
INSERT INTO `wave` VALUES (17,4,'LameHeavy','Heavy',14,625);
INSERT INTO `wave` VALUES (18,8,'LameSpy','Spy',10,725);
INSERT INTO `wave` VALUES (19,2,'LameScout','Scout',12,575);
INSERT INTO `wave` VALUES (20,0,'LameSniper','Sniper',13,850);
INSERT INTO `wave` VALUES (21,0,'LamePyro','Pyro',13,875);
INSERT INTO `wave` VALUES (22,1,'TheEngineer','Engineer',4,5975);
INSERT INTO `wave` VALUES (23,0,'BadMedic','Medic',8,1975);
INSERT INTO `wave` VALUES (24,0,'BadEngineer','Engineer',9,1675);
INSERT INTO `wave` VALUES (25,0,'BadSoldier','Soldier',10,1575);
INSERT INTO `wave` VALUES (26,0,'BadMedic','Medic',10,1675);
INSERT INTO `wave` VALUES (27,0,'BadEngineer','Engineer',12,1325);
INSERT INTO `wave` VALUES (28,0,'BadSoldier','Soldier',13,1225);
INSERT INTO `wave` VALUES (29,0,'BadMedic','Medic',10,1875);
INSERT INTO `wave` VALUES (30,8,'BadSpy','Spy',9,1575);
INSERT INTO `wave` VALUES (31,2,'BadScout','Scout',12,1375);
INSERT INTO `wave` VALUES (32,0,'BadSoldier','Soldier',15,1425);
INSERT INTO `wave` VALUES (33,1,'TheSniper','Sniper',4,19975);
INSERT INTO `wave` VALUES (34,0,'NewbieSniper','Sniper',9,2775);
INSERT INTO `wave` VALUES (35,0,'NewbiePyro','Pyro',8,3375);
INSERT INTO `wave` VALUES (36,0,'NewbieDemoman','Demoman',10,2775);
INSERT INTO `wave` VALUES (37,0,'NewbieSniper','Sniper',11,2975);
INSERT INTO `wave` VALUES (38,0,'NewbiePyro','Pyro',11,3175);
INSERT INTO `wave` VALUES (39,0,'NewbieDemoman','Demoman',13,2775);
INSERT INTO `wave` VALUES (40,0,'NewbieSniper','Sniper',8,5975);
INSERT INTO `wave` VALUES (41,8,'NewbieHeavy','Heavy',12,3475);
INSERT INTO `wave` VALUES (42,2,'NewbieScout','Scout',12,2975);
INSERT INTO `wave` VALUES (43,0,'NewbiePyro','Pyro',15,3475);
INSERT INTO `wave` VALUES (44,1,'TheMedic','Medic',4,33975);
INSERT INTO `wave` VALUES (45,0,'AverageEngineer','Engineer',9,6975);
INSERT INTO `wave` VALUES (46,0,'AverageSoldier','Soldier',9,7175);
INSERT INTO `wave` VALUES (47,0,'AverageMedic','Medic',10,6975);
INSERT INTO `wave` VALUES (48,0,'AverageEngineer','Engineer',11,6275);
INSERT INTO `wave` VALUES (49,0,'AverageSoldier','Soldier',11,6475);
INSERT INTO `wave` VALUES (50,0,'AverageMedic','Medic',12,5975);
INSERT INTO `wave` VALUES (51,2,'AverageScout','Scout',9,6975);
INSERT INTO `wave` VALUES (52,8,'AverageHeavy','Heavy',9,6975);
INSERT INTO `wave` VALUES (53,4,'AverageSpy','Spy',10,7725);
INSERT INTO `wave` VALUES (54,0,'AverageMedic','Medic',12,7475);
INSERT INTO `wave` VALUES (55,1,'TheScout','Scout',4,44975);
INSERT INTO `wave` VALUES (56,0,'GoodMedic','Medic',9,10975);
INSERT INTO `wave` VALUES (57,8,'GoodSpy','Spy',8,8975);
INSERT INTO `wave` VALUES (58,8,'GoodHeavy','Heavy',8,10975);
INSERT INTO `wave` VALUES (59,0,'GoodScout','Scout',9,13475);
INSERT INTO `wave` VALUES (60,0,'GoodSniper','Sniper',10,13975);
INSERT INTO `wave` VALUES (61,0,'GoodHeavy','Heavy',9,16475);
INSERT INTO `wave` VALUES (62,0,'fatboy','Engineer',9,16725);
INSERT INTO `wave` VALUES (63,4,'berry','Scout',8,17975);
INSERT INTO `wave` VALUES (64,0,'mani','Spy',8,18975);
INSERT INTO `wave` VALUES (65,8,'floube','Soldier',7,17975);
INSERT INTO `wave` VALUES (66,0,'WeakScout','Scout',8,125);
INSERT INTO `wave` VALUES (67,0,'WeakSoldier','Soldier',9,175);
INSERT INTO `wave` VALUES (68,2,'WeakMedic','Medic',10,275);
INSERT INTO `wave` VALUES (69,0,'WeakHeavy','Heavy',10,325);
INSERT INTO `wave` VALUES (70,4,'WeakDemoman','Demoman',11,300);
INSERT INTO `wave` VALUES (71,0,'WeakPyro','Pyro',9,425);
INSERT INTO `wave` VALUES (72,32,'WeakScout','Scout',10,475);
INSERT INTO `wave` VALUES (73,12,'WeakSniper','Sniper',6,575);
INSERT INTO `wave` VALUES (74,16,'WeakSpy','Spy',7,650);
INSERT INTO `wave` VALUES (75,1,'TheDoctor','Medic',1,3000);
INSERT INTO `wave` VALUES (76,0,'LameScout','Scout',8,775);
INSERT INTO `wave` VALUES (77,0,'LameSoldier','Soldier',8,825);
INSERT INTO `wave` VALUES (78,16,'LameSpy','Spy',7,775);
INSERT INTO `wave` VALUES (79,0,'LameHeavy','Heavy',9,925);
INSERT INTO `wave` VALUES (80,32,'LamePyro','Pyro',9,925);
INSERT INTO `wave` VALUES (81,2,'LameMedic','Medic',7,975);
INSERT INTO `wave` VALUES (82,8,'LameDemoman','Demoman',7,1075);
INSERT INTO `wave` VALUES (83,0,'LameSniper','Sniper',10,1425);
INSERT INTO `wave` VALUES (84,4,'LameScout','Scout',8,1475);
INSERT INTO `wave` VALUES (85,1,'TheSharpshooter','Sniper',1,7500);
INSERT INTO `wave` VALUES (86,0,'BadSoldier','Soldier',9,1475);
INSERT INTO `wave` VALUES (87,0,'BadSpy','Spy',10,1525);
INSERT INTO `wave` VALUES (88,8,'BadDemoman','Demoman',7,1225);
INSERT INTO `wave` VALUES (89,0,'BadHeavy','Heavy',9,1725);
INSERT INTO `wave` VALUES (90,4,'BadMedic','Medic',7,1675);
INSERT INTO `wave` VALUES (91,0,'BadEngineer','Engineer',11,1875);
INSERT INTO `wave` VALUES (92,32,'BadScout','Scout',7,1725);
INSERT INTO `wave` VALUES (93,0,'BadDemoman','Demoman',9,1975);
INSERT INTO `wave` VALUES (94,32,'BadMedic','Medic',8,1975);
INSERT INTO `wave` VALUES (95,1,'TheEngineer','Engineer',1,1975);
INSERT INTO `wave` VALUES (96,0,'AverageSoldier','Soldier',11,2275);
INSERT INTO `wave` VALUES (97,44,'AverageSpy','Spy',7,2175);
INSERT INTO `wave` VALUES (98,0,'AverageDemoman','Demoman',8,2975);
INSERT INTO `wave` VALUES (99,0,'AverageHeavy','Heavy',9,3375);
INSERT INTO `wave` VALUES (100,12,'AverageMedic','Medic',7,2875);
INSERT INTO `wave` VALUES (101,0,'AverageEngineer','Engineer',9,3775);
INSERT INTO `wave` VALUES (102,32,'AverageScout','Scout',11,3775);
INSERT INTO `wave` VALUES (103,32,'AveragePyro','Pyro',10,3975);
INSERT INTO `wave` VALUES (104,0,'AverageMedic','Medic',10,4475);
INSERT INTO `wave` VALUES (105,1,'TheSpy','Spy',1,17500);
INSERT INTO `wave` VALUES (106,34,'GoodScout','Scout',7,4475);
INSERT INTO `wave` VALUES (107,16,'GoodSpy','Spy',9,4475);
INSERT INTO `wave` VALUES (108,0,'GoodDemoman','Demoman',11,5225);
INSERT INTO `wave` VALUES (109,0,'GoodEngineer','Engineer',10,5475);
INSERT INTO `wave` VALUES (110,0,'GoodMedic','Medic',8,5725);
INSERT INTO `wave` VALUES (111,36,'GoodPyro','Pyro',9,5475);
INSERT INTO `wave` VALUES (112,32,'GoodSoldier','Soldier',8,5975);
INSERT INTO `wave` VALUES (113,4,'GoodMedic','Medic',10,6225);
INSERT INTO `wave` VALUES (114,0,'GoodSpy','Spy',9,6975);
INSERT INTO `wave` VALUES (115,1,'TheNoob','Scout',1,30000);
INSERT INTO `wave` VALUES (116,8,'PremiumScout','Scout',9,5775);
INSERT INTO `wave` VALUES (117,12,'PremiumSpy','Spy',10,5975);
INSERT INTO `wave` VALUES (118,0,'PremiumDemoman','Demoman',10,7975);
INSERT INTO `wave` VALUES (119,2,'PremiumEngineer','Engineer',10,7225);
INSERT INTO `wave` VALUES (120,40,'PremiumMedic','Medic',7,6975);
INSERT INTO `wave` VALUES (121,0,'PremiumPyro','Pyro',8,8975);
INSERT INTO `wave` VALUES (122,0,'PremiumSoldier','Soldier',8,9225);
INSERT INTO `wave` VALUES (123,34,'PremiumMedic','Medic',9,8475);
INSERT INTO `wave` VALUES (124,0,'PremiumSpy','Spy',7,9975);
INSERT INTO `wave` VALUES (125,33,'TheBeast','Soldier',1,49975);
INSERT INTO `wave` VALUES (126,6,'OverpoweredScout','Scout',8,9975);
INSERT INTO `wave` VALUES (127,36,'OverpoweredMedic','Medic',8,10975);
INSERT INTO `wave` VALUES (128,8,'floube','Engineer',9,9975);
INSERT INTO `wave` VALUES (129,8,'mani','Soldier',10,9975);
INSERT INTO `wave` VALUES (130,37,'benedevil','Heavy',4,60000);
INSERT INTO `wave` VALUES (131,7,'dragonisser','Medic',12,8000);
CREATE TABLE `wavetype` (
  `wavetype_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `type` varchar(64) NOT NULL
,  `bit_value` integer NOT NULL
,  UNIQUE (`type`)
,  UNIQUE (`bit_value`)
);
INSERT INTO `wavetype` VALUES (1,'none',0);
INSERT INTO `wavetype` VALUES (2,'boss',1);
INSERT INTO `wavetype` VALUES (3,'rapid',2);
INSERT INTO `wavetype` VALUES (4,'regen',4);
INSERT INTO `wavetype` VALUES (5,'knockbackImmune',8);
INSERT INTO `wavetype` VALUES (6,'air',16);
INSERT INTO `wavetype` VALUES (7,'jarateImmune',32);
CREATE TABLE `weapon` (
  `weapon_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `name` varchar(96) NOT NULL
,  `index` integer  NOT NULL
,  `slot` text  NOT NULL
,  `level` integer  NOT NULL DEFAULT 1
,  `quality` text  NOT NULL DEFAULT 'Normal'
,  `classname` varchar(64) NOT NULL
,  `attributes` varchar(512) NOT NULL
,  `preserve_attributes` text  NOT NULL DEFAULT 'preserve'
);
INSERT INTO `weapon` VALUES (1,'Wrench',7,'Melee',1,'Normal','tf_weapon_wrench','','preserve');
INSERT INTO `weapon` VALUES (2,'Sniper Rifle',14,'Primary',1,'Normal','tf_weapon_sniperrifle','','preserve');
INSERT INTO `weapon` VALUES (3,'Medigun',29,'Secondary',1,'Normal','tf_weapon_medigun','','preserve');
INSERT INTO `weapon` VALUES (4,'Grenade Launcher ',19,'Primary',1,'Normal','tf_weapon_grenadelauncher','','preserve');
INSERT INTO `weapon` VALUES (5,'Flamethrower',21,'Primary',1,'Normal','tf_weapon_flamethrower','','preserve');
INSERT INTO `weapon` VALUES (6,'Jarate',58,'Secondary',1,'Normal','tf_weapon_jar','','preserve');
INSERT INTO `weapon` VALUES (7,'Rocket Launcher ',18,'Primary',1,'Normal','tf_weapon_rocketlauncher','','preserve');
INSERT INTO `weapon` VALUES (8,'The Flare Gun ',39,'Secondary',1,'Normal','tf_weapon_flaregun','','preserve');
INSERT INTO `weapon` VALUES (9,'Crusaders Crossbow',305,'Primary',1,'Normal','tf_weapon_crossbow','','preserve');
INSERT INTO `weapon` VALUES (10,'Minigun',15,'Primary',1,'Normal','tf_weapon_minigun','','preserve');
INSERT INTO `weapon` VALUES (11,'Scattergun',13,'Primary',1,'Normal','tf_weapon_scattergun','','preserve');
INSERT INTO `weapon` VALUES (12,'Force-A-Nature',45,'Primary',1,'Normal','tf_weapon_scattergun','','preserve');
INSERT INTO `weapon` VALUES (13,'The Backburner ',40,'Primary',1,'Normal','tf_weapon_flamethrower','','preserve');
INSERT INTO `weapon` VALUES (14,'The Loch-n-Load',308,'Primary',1,'Normal','tf_weapon_grenadelauncher','','preserve');
INSERT INTO `weapon` VALUES (15,'The Machina ',526,'Primary',1,'Normal','tf_weapon_sniperrifle','','preserve');
INSERT INTO `weapon` VALUES (16,'The Liberty Launcher ',414,'Primary',1,'Normal','tf_weapon_rocketlauncher','','preserve');
INSERT INTO `weapon` VALUES (17,'The Bushwacka ',232,'Melee',1,'Normal','tf_weapon_club','','preserve');
INSERT INTO `weapon` VALUES (18,'Natascha',41,'Primary',1,'Normal','tf_weapon_minigun','','preserve');
INSERT INTO `weapon` VALUES (19,'The Flying Guillotine ',812,'Secondary',1,'Normal','tf_weapon_cleaver','','preserve');
INSERT INTO `weapon` VALUES (20,'Homewrecker ',153,'Melee',1,'Normal','tf_weapon_fireaxe','','preserve');
INSERT INTO `weapon` VALUES (21,'The Kritzkrieg',35,'Secondary',1,'Normal','tf_weapon_medigun','','preserve');
INSERT INTO `weapon` VALUES (22,'Festive Wrench',329,'Melee',1,'Normal','tf_weapon_wrench','','preserve');
INSERT INTO `weapon` VALUES (23,'Silver Botkiller Wrench Mk.I',795,'Melee',1,'Normal','tf_weapon_wrench','','preserve');
INSERT INTO `weapon` VALUES (24,'Gold Botkiller Wrench Mk.I',804,'Melee',1,'Normal','tf_weapon_wrench','','preserve');
INSERT INTO `weapon` VALUES (25,'Golden Wrench',169,'Melee',1,'Normal','tf_weapon_wrench','','preserve');
INSERT INTO `weapon` VALUES (26,'Festive Sniper Rifle',664,'Primary',1,'Normal','tf_weapon_sniperrifle','','preserve');
INSERT INTO `weapon` VALUES (27,'Silver Botkiller Sniper Rifle Mk.I',792,'Primary',1,'Normal','tf_weapon_sniperrifle','','preserve');
INSERT INTO `weapon` VALUES (28,'Gold Botkiller Sniper Rifle Mk.II',966,'Primary',1,'Normal','tf_weapon_sniperrifle','','preserve');
INSERT INTO `weapon` VALUES (29,'Rust Botkiller Medigun Mk.I',885,'Secondary',1,'Normal','tf_weapon_medigun','','preserve');
INSERT INTO `weapon` VALUES (30,'Carbonado Botkiller Medigun Mk.I',903,'Secondary',1,'Normal','tf_weapon_medigun','','preserve');
INSERT INTO `weapon` VALUES (31,'Festive Grenade Launcher',1007,'Primary',1,'Normal','tf_weapon_grenadelauncher','','preserve');
INSERT INTO `weapon` VALUES (32,'The Loose Cannon',996,'Primary',1,'Normal','tf_weapon_cannon','','preserve');
INSERT INTO `weapon` VALUES (33,'The Backburner',40,'Primary',1,'Normal','tf_weapon_flamethrower','','preserve');
INSERT INTO `weapon` VALUES (34,'Festive Backburner',1146,'Primary',1,'Normal','tf_weapon_flamethrower','','preserve');
INSERT INTO `weapon` VALUES (35,'Festive Jarate',1083,'Secondary',1,'Normal','tf_weapon_jar','','preserve');
INSERT INTO `weapon` VALUES (36,'Blood Botkiller Rocket Launcher Mk.I',898,'Primary',1,'Normal','tf_weapon_rocketlauncher','','preserve');
INSERT INTO `weapon` VALUES (37,'Carbonado Botkiller Rocket Launcher Mk.I',907,'Primary',1,'Normal','tf_weapon_rocketlauncher','','preserve');
INSERT INTO `weapon` VALUES (38,'Diamond Botkiller Rocket Launcher Mk.I',916,'Primary',1,'Normal','tf_weapon_rocketlauncher','','preserve');
INSERT INTO `weapon` VALUES (39,'The Detonator',351,'Secondary',1,'Normal','tf_weapon_flaregun','','preserve');
INSERT INTO `weapon` VALUES (40,'Festive Flare Gun',1081,'Secondary',1,'Normal','tf_weapon_flaregun','','preserve');
INSERT INTO `weapon` VALUES (41,'Festive Crusader''s Crossbow',1079,'Primary',1,'Normal','tf_weapon_crossbow','','preserve');
INSERT INTO `weapon` VALUES (42,'Natascha',41,'Primary',1,'Normal','tf_weapon_minigun','','preserve');
INSERT INTO `weapon` VALUES (43,'Iron Curtain',298,'Primary',1,'Normal','tf_weapon_minigun','','preserve');
INSERT INTO `weapon` VALUES (44,'The Huo Long Heatmaker',811,'Primary',1,'Normal','tf_weapon_minigun','','preserve');
INSERT INTO `weapon` VALUES (45,'Silver Botkiller Scattergun Mk.I',799,'Primary',1,'Normal','tf_weapon_scattergun','','preserve');
INSERT INTO `weapon` VALUES (46,'Gold Botkiller Scattergun Mk.I',808,'Primary',1,'Normal','tf_weapon_scattergun','','preserve');
INSERT INTO `weapon` VALUES (47,'	Diamond Botkiller Scattergun Mk.I',915,'Primary',1,'Normal','tf_weapon_scattergun','','preserve');
INSERT INTO `weapon` VALUES (48,'Festive Force-A-Nature',1078,'Primary',1,'Normal','tf_weapon_scattergun','','preserve');
INSERT INTO `weapon` VALUES (49,'Knife',4,'Melee',1,'Normal','tf_weapon_knife','','preserve');
CREATE INDEX "idx_player_fk_player_server_first_idx" ON "player" (`first_server`);
CREATE INDEX "idx_player_fk_player_server_last_idx" ON "player" (`last_server`);
CREATE INDEX "idx_player_fk_player_server_current_idx" ON "player" (`current_server`);
CREATE INDEX "idx_server_settings_fk_server_config_config_idx" ON "server_settings" (`config_start`);
CREATE INDEX "idx_server_settings_fk_server_config_config_end_idx" ON "server_settings" (`config_end`);
CREATE INDEX "idx_player_ban_fk_player_ban_player_idx" ON "player_ban" (`player_id`);
CREATE INDEX "idx_towerlevel_fk_tower_idx" ON "towerlevel" (`tower_id`);
CREATE INDEX "idx_towerlevel_fk_weapon_idx" ON "towerlevel" (`weapon_id`);
CREATE INDEX "idx_server_fk_server_map_idx" ON "server" (`map_id`);
CREATE INDEX "idx_server_fk_server_server_config_idx" ON "server" (`server_settings_id`);
CREATE INDEX "idx_player_stats_fk_map_id_idx" ON "player_stats" (`map_id`);
CREATE INDEX "idx_multiplier_fk_multiplier_multipliertype_idx" ON "multiplier" (`multipliertype_id`);
CREATE INDEX "idx_metalpack_fk_metalpack_map_idx" ON "metalpack" (`map_id`);
CREATE INDEX "idx_metalpack_fk_metalpack_metalpacktype_idx" ON "metalpack" (`metalpacktype_id`);
CREATE INDEX "idx_player_achievement_fk_player_achievement_achievement_idx" ON "player_achievement" (`achievement_id`);
CREATE INDEX "idx_map_fk_map_wave_start_idx" ON "map" (`wave_start`);
CREATE INDEX "idx_map_fk_map_wave_end_idx" ON "map" (`wave_end`);
END TRANSACTION;
