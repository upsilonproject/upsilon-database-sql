CREATE TABLE `subresults` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`service` int(11) DEFAULT NULL,
	`name` varchar(32) DEFAULT NULL,
	`metadata` varchar(45) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

