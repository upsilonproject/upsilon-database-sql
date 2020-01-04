CREATE TABLE `acceptable_downtime_sla` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`content` longtext,
	`title` varchar(32) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `apiClients` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`identifier` varchar(32) DEFAULT NULL,
	`user` int(11) NOT NULL,
	`anonymousLogin` tinyint(4) DEFAULT NULL,
	`drawHeader` tinyint(4) DEFAULT '1',
	`drawNavigation` tinyint(4) NOT NULL,
	`drawBigClock` tinyint(4) NOT NULL,
	`redirect` varchar(32) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `class_instance_parents` (
	`parent` int(11) NOT NULL,
	`instance` int(11) DEFAULT NULL,
	`id` int(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `class_instances` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`title` varchar(64) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `class_service_assignments` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`instance` int(11) DEFAULT NULL,
	`service` varchar(128) DEFAULT NULL,
	`requirement` int(11) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `class_service_requirements` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`title` varchar(32) DEFAULT NULL,
	`class` int(11) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `classes` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`title` varchar(32) DEFAULT NULL,
	`l` int(11) DEFAULT NULL,
	`r` int(11) DEFAULT NULL,
	`icon` varchar(255) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `command_metadata` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`commandIdentifier` varchar(128) DEFAULT NULL,
	`icon` varchar(255) DEFAULT NULL,
	`executable` longtext,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `dashboard` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`title` varchar(32) DEFAULT NULL,
	`servicesGrouped` tinyint(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `group_memberships` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`user` int(11) DEFAULT '0',
	`group` varchar(128) DEFAULT NULL,
	`service` varchar(128) DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `group` (`group`,`service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `groups` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`description` varchar(255) NOT NULL,
	`title` varchar(128) DEFAULT NULL,
	`name` varchar(128) DEFAULT NULL,
	`parent` varchar(255) DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `name` (`title`),
	UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `nodes` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`serviceType` varchar(32) DEFAULT NULL,
	`identifier` varchar(128) NOT NULL,
	`alias` varchar(128) DEFAULT NULL,
	`serviceCount` int(11) DEFAULT NULL,
	`lastUpdated` datetime DEFAULT NULL,
	`instanceApplicationVersion` varchar(32) DEFAULT NULL,
	`configs` longtext DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `peers` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`child` int(11) NOT NULL,
	`parent` int(11) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `permissions` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`key` varchar(32) DEFAULT NULL,
	`description` longtext,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `privileges_g` (
	`permission` int(11) DEFAULT NULL,
	`group` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `privileges_u` (
	`permission` int(11) DEFAULT NULL,
	`user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `remote_config_allocated_commands` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`command` int(11) NOT NULL,
	`config` int(11) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `remote_config_allocated_nodes` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`config` int(11) NOT NULL,
	`node` varchar(128) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `remote_config_allocated_services` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`service` int(11) NOT NULL,
	`config` int(11) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `remote_config_command_arguments` (
	`command` int(11) NOT NULL,
	`name` varchar(128) DEFAULT NULL,
	`datatype` varchar(32) DEFAULT NULL,
	`id` int(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `remote_config_commands` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`identifier` varchar(128) DEFAULT NULL,
	`command_line` varchar(1024) DEFAULT NULL,
	`metadata` int(11) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `remote_config_service_arg_values` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`service` int(11) DEFAULT NULL,
	`argument` int(11) NOT NULL,
	`value` varchar(512) DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `service` (`service`,`argument`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `remote_config_services` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(128) NOT NULL,
	`parent` varchar(128) DEFAULT NULL,
	`command` int(11) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `identifier` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `remote_configs` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(128) DEFAULT NULL,
	`mtime` datetime DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `rooms` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`filename` varchar(128) DEFAULT NULL,
	`title` varchar(255) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `service_check_results` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`service` varchar(128) DEFAULT NULL,
	`checked` datetime DEFAULT NULL,
	`karma` varchar(32) DEFAULT NULL,
	`output` longtext,
	PRIMARY KEY (`id`),
	KEY `ix_service` (`service`),
	KEY `checked` (`checked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `service_group_memberships` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`group` varchar(128) DEFAULT NULL,
	`service` varchar(128) DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `group` (`group`,`service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `service_groups` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`description` varchar(255) NOT NULL,
	`title` varchar(128) DEFAULT NULL,
	`name` varchar(128) DEFAULT NULL,
	`parent` varchar(255) DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `name` (`title`),
	UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `service_metadata` (
	`service` varchar(128) DEFAULT NULL,
	`actions` longtext,
	`metrics` longtext,
	`icon` varchar(128) DEFAULT NULL,
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`defaultMetric` varchar(64) NOT NULL,
	`hasTasks` tinyint(4) NOT NULL,
	`room` int(10) unsigned DEFAULT NULL,
	`roomPositionX` int(10) unsigned DEFAULT NULL,
	`roomPositionY` int(10) unsigned DEFAULT NULL,
	`alias` varchar(64) DEFAULT NULL,
	`goodCast` varchar(32) DEFAULT NULL,
	`criticalCast` varchar(32) DEFAULT NULL,
	`acceptableDowntime` varchar(2048) DEFAULT NULL,
	`hasEvents` tinyint(4) NOT NULL DEFAULT '0',
	`acceptableDowntimeSla` int(11) DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `service` (`service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `services` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`identifier` varchar(128) DEFAULT NULL,
	`alias` varchar(128) DEFAULT NULL,
	`description` varchar(128) NOT NULL,
	`karma` varchar(64) DEFAULT NULL,
	`secondsRemaining` int(10) DEFAULT '0',
	`output` longtext,
	`commandLine` longtext,
	`lastUpdated` datetime DEFAULT NULL,
	`lastChanged` datetime DEFAULT NULL,
	`consecutiveCount` int(11) NOT NULL DEFAULT '0',
	`executable` varchar(255) DEFAULT NULL,
	`estimatedNextCheck` datetime DEFAULT NULL,
	`isLocal` tinyint(4) DEFAULT NULL,
	`node` varchar(128) DEFAULT NULL,
	`commandIdentifier` varchar(255) DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `unq_sid` (`identifier`, `node`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `settings` (
	`key` varchar(32) NOT NULL,
	`value` longtext,
	PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `srevice_groups` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`description` varchar(255) NOT NULL,
	`title` varchar(128) DEFAULT NULL,
	`name` varchar(128) DEFAULT NULL,
	`parent` varchar(255) DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `name` (`title`),
	UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `subresults` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`service` int(11) DEFAULT NULL,
	`name` varchar(32) DEFAULT NULL,
	`metadata` varchar(45) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `users` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`username` varchar(32) DEFAULT NULL,
	`password` varchar(64) DEFAULT NULL,
	`group` int(11) DEFAULT NULL,
	`lastLogin` datetime DEFAULT NULL,
	`daytimeBegin` int(11) DEFAULT '0',
	`daytimeEnd` int(11) DEFAULT '24',
	`metadata` varchar(128) DEFAULT NULL,
	`promptBeforeDeletions` tinyint(4) NOT NULL DEFAULT '1',
	`oldServiceThreshold` int(11) DEFAULT '3600',
	`tutorialMode` int(11) DEFAULT '1',
	`enableDebug` tinyint(4) DEFAULT '0',
	`experimentalFeatures` tinyint(1) DEFAULT '0',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `widget_instance_arguments` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(32) DEFAULT NULL,
	`value` longtext,
	`instance` int(11) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `instance` (`instance`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `widget_instances` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`widget` int(11) DEFAULT NULL,
	`dashboard` int(11) DEFAULT NULL,
	`options` longtext,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `widgets` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`class` varchar(32) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
