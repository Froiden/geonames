
CREATE TABLE IF NOT EXISTS`geo_admin1` (
	`code` VARCHAR(12) NOT NULL DEFAULT '',
	`name` TEXT NULL,
	`nameAscii` TEXT NULL,
	`geonameid` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`code`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `errors` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `error` varchar(400) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE IF NOT EXISTS `geo_alternatename` (
  `alternatenameId` int(11) NOT NULL,
  `geonameid` int(11) DEFAULT NULL,
  `isoLanguage` varchar(7) DEFAULT NULL,
  `alternateName` varchar(200) DEFAULT NULL,
  `isPreferredName` tinyint(1) DEFAULT NULL,
  `isShortName` tinyint(1) DEFAULT NULL,
  `isColloquial` tinyint(1) DEFAULT NULL,
  `isHistoric` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`alternatenameId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





CREATE TABLE IF NOT EXISTS `geo_continent` (
  `code` char(2) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `geonameid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





CREATE TABLE IF NOT EXISTS `geo_country` (
  `iso_alpha2` char(2) NOT NULL DEFAULT '',
  `iso_alpha3` char(3) DEFAULT NULL,
  `iso_numeric` int(11) DEFAULT NULL,
  `fips_code` varchar(3) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `capital` varchar(200) DEFAULT NULL,
  `areainsqkm` double DEFAULT NULL,
  `population` int(11) DEFAULT NULL,
  `continent` char(2) DEFAULT NULL,
  `tld` char(3) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currencyName` char(20) DEFAULT NULL,
  `Phone` char(10) DEFAULT NULL,
  `postalCodeFormat` char(20) DEFAULT NULL,
  `postalCodeRegex` char(90) DEFAULT NULL,
  `geonameId` int(11) DEFAULT NULL,
  `languages` varchar(200) DEFAULT NULL,
  `neighbours` char(20) DEFAULT NULL,
  `equivalentFipsCode` char(10) DEFAULT NULL,
  PRIMARY KEY (`iso_alpha2`),
  KEY `iso_alpha3` (`iso_alpha3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





CREATE TABLE IF NOT EXISTS `geo_featurecodes` (
  `code` char(7) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





CREATE TABLE IF NOT EXISTS `geo_languagecodes` (
  `iso_639_3` char(4) DEFAULT NULL,
  `iso_639_2` varchar(50) DEFAULT NULL,
  `iso_639_1` varchar(50) DEFAULT NULL,
  `language_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




CREATE TABLE IF NOT EXISTS `geo_name` (
	`geonameid` INT(11) NOT NULL,
	`name` VARCHAR(200) NULL DEFAULT NULL,
	`asciiname` VARCHAR(200) NULL DEFAULT NULL,
	`alternatenames` VARCHAR(4000) NULL DEFAULT NULL,
	`latitude` DECIMAL(10,7) NULL DEFAULT NULL,
	`longitude` DECIMAL(10,7) NULL DEFAULT NULL,
	`fclass` CHAR(1) NULL DEFAULT NULL,
	`fcode` VARCHAR(10) NULL DEFAULT NULL,
	`country` VARCHAR(2) NULL DEFAULT NULL,
	`cc2` VARCHAR(60) NULL DEFAULT NULL,
	`admin1` VARCHAR(20) NULL DEFAULT NULL,
	`admin2` VARCHAR(80) NULL DEFAULT NULL,
	`admin3` VARCHAR(20) NULL DEFAULT NULL,
	`admin4` VARCHAR(20) NULL DEFAULT NULL,
	`population` INT(11) NULL DEFAULT NULL,
	`elevation` INT(11) NULL DEFAULT NULL,
	`gtopo30` INT(11) NULL DEFAULT NULL,
	`timezone` VARCHAR(40) NULL DEFAULT NULL,
	`moddate` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`geonameid`),
	INDEX `country` (`country`),
	FULLTEXT INDEX `name_asciiname_alternatenames` (`name`, `asciiname`, `alternatenames`)
)
COLLATE='utf8_general_ci'
ENGINE=MyISAM;







CREATE TABLE IF NOT EXISTS `geo_timezones` (
	`countrycode` VARCHAR(200) NULL DEFAULT NULL,
	`timeZoneId` VARCHAR(200) NOT NULL DEFAULT '',
	`GMT_offset` DECIMAL(3,1) NULL DEFAULT NULL,
	`DST_offset` DECIMAL(3,1) NULL DEFAULT NULL,
	`raw_offset` DECIMAL(3,1) NULL DEFAULT NULL,
	PRIMARY KEY (`timeZoneId`),
	INDEX `countrycode` (`countrycode`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
