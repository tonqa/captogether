CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `participants` int(11) NOT NULL DEFAULT '1',
  `country` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `streetnr` int(11) DEFAULT NULL,
  `zipcode` varchar(5) DEFAULT NULL,
  `date` varchar(11) NOT NULL,
  `city` varchar(45) DEFAULT NULL,
  `geolocation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`title`,`date`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `key_UNIQUE` (`title`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
