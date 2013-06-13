-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 13, 2013 at 12:37 PM
-- Server version: 5.5.9
-- PHP Version: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `stylesaute`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `logo` varchar(256) COLLATE utf8_bin NOT NULL,
  `type` enum('shirt','pant') COLLATE utf8_bin NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Dumping data for table `brands`
--


-- --------------------------------------------------------

--
-- Table structure for table `budgets`
--

CREATE TABLE `budgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `item_limit` float NOT NULL,
  `tag_line` varchar(45) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `icons` text COLLATE utf8_bin,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Dumping data for table `budgets`
--


-- --------------------------------------------------------

--
-- Table structure for table `budgets_items`
--

CREATE TABLE `budgets_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `budget_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_budgets_items_budgets1_idx` (`budget_id`),
  KEY `fk_budgets_items_items1_idx` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Dumping data for table `budgets_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) unsigned NOT NULL,
  `region_id` int(11) unsigned NOT NULL,
  `city` varchar(100) NOT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `time_zone` varchar(50) DEFAULT NULL,
  `dmaId` varchar(100) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `City` (`city`),
  KEY `fk_cities_countries1_idx` (`country_id`),
  KEY `fk_cities_regions1_idx` (`region_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='City table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cities`
--


-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(100) DEFAULT NULL,
  `FIPS104` varchar(50) DEFAULT NULL,
  `ISO2` varchar(50) DEFAULT NULL,
  `ISO3` varchar(50) DEFAULT NULL,
  `ISON` varchar(50) DEFAULT NULL,
  `internet` varchar(50) DEFAULT NULL,
  `capital` varchar(50) DEFAULT NULL,
  `map_reference` varchar(50) DEFAULT NULL,
  `nationality_singular` varchar(50) DEFAULT NULL,
  `nationality_plural` varchar(50) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `currency_code` varchar(50) DEFAULT NULL,
  `population` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `flag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Country` (`country`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='country table' AUTO_INCREMENT=276 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` VALUES(1, 'Afghanistan', 'AF', 'AF', 'AFG', '4', 'AF', 'Kabul ', 'Asia ', 'Afghan', 'Afghans', 'Afghani ', 'AFA', '26813057', 'Afghanistan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Afghanistan');
INSERT INTO `countries` VALUES(2, 'Albania', 'AL', 'AL', 'ALB', '8', 'AL', 'Tirana ', 'Europe ', 'Albanian', 'Albanians', 'Lek ', 'ALL', '3510484', 'Albania', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Albania');
INSERT INTO `countries` VALUES(3, 'Algeria', 'AG', 'DZ', 'DZA', '12', 'DZ', 'Algiers ', 'Africa ', 'Algerian', 'Algerians', 'Algerian Dinar ', 'DZD', '31736053', 'Algeria', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Algeria');
INSERT INTO `countries` VALUES(4, 'American Samoa', 'AQ', 'AS', 'ASM', '16', 'AS', 'Pago Pago ', 'Oceania ', 'American Samoan', 'American Samoans', 'US Dollar', 'USD', '67084', 'American Samoa', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'American Samoa');
INSERT INTO `countries` VALUES(5, 'Andorra', 'AN', 'AD', 'AND', '20', 'AD', 'Andorra la Vella ', 'Europe ', 'Andorran', 'Andorrans', 'Euro', 'EUR', '67627', 'Andorra', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Andorra');
INSERT INTO `countries` VALUES(6, 'Angola', 'AO', 'AO', 'AGO', '24', 'AO', 'Luanda ', 'Africa ', 'Angolan', 'Angolans', 'Kwanza ', 'AOA', '10366031', 'Angola', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Angola');
INSERT INTO `countries` VALUES(7, 'Anguilla', 'AV', 'AI', 'AIA', '660', 'AI', 'The Valley ', 'Central America and the Caribbean ', 'Anguillan', 'Anguillans', 'East Caribbean Dollar ', 'XCD', '12132', 'Anguilla', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Anguilla');
INSERT INTO `countries` VALUES(8, 'Antarctica', 'AY', 'AQ', 'ATA', '10', 'AQ', '', 'Antarctic Region ', '', '', '', '', '0', 'Antarctica', 'ISO defines as the territory south of 60 degrees s', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Antarctica');
INSERT INTO `countries` VALUES(9, 'Antigua and Barbuda', 'AC', 'AG', 'ATG', '28', 'AG', 'Saint John''s ', 'Central America and the Caribbean ', 'Antiguan and Barbudan', 'Antiguans and Barbudans', 'East Caribbean Dollar ', 'XCD', '66970', 'Antigua and Barbuda', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Antigua & Barbuda');
INSERT INTO `countries` VALUES(10, 'Argentina', 'AR', 'AR', 'ARG', '32', 'AR', 'Buenos Aires ', 'South America ', 'Argentine', 'Argentines', 'Argentine Peso ', 'ARS', '37384816', 'Argentina', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Argentina');
INSERT INTO `countries` VALUES(11, 'Armenia', 'AM', 'AM', 'ARM', '51', 'AM', 'Yerevan ', 'Commonwealth of Independent States ', 'Armenian', 'Armenians', 'Armenian Dram ', 'AMD', '3336100', 'Armenia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Armenia');
INSERT INTO `countries` VALUES(12, 'Aruba', 'AA', 'AW', 'ABW', '533', 'AW', 'Oranjestad ', 'Central America and the Caribbean ', 'Aruban', 'Arubans', 'Aruban Guilder', 'AWG', '70007', 'Aruba', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Aruba');
INSERT INTO `countries` VALUES(13, 'Ashmore and Cartier', 'AT', '--', '-- ', '--', '--', '', 'Southeast Asia ', '', '', '', '', '0', 'Ashmore and Cartier', 'ISO includes with Australia', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(14, 'Australia', 'AS', 'AU', 'AUS', '36', 'AU', 'Canberra ', 'Oceania ', 'Australian', 'Australians', 'Australian dollar ', 'AUD', '19357594', 'Australia', 'ISO includes Ashmore and Cartier Islands,Coral Sea', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Australia');
INSERT INTO `countries` VALUES(15, 'Austria', 'AU', 'AT', 'AUT', '40', 'AT', 'Vienna ', 'Europe ', 'Austrian', 'Austrians', 'Euro', 'EUR', '8150835', 'Austria', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Austria');
INSERT INTO `countries` VALUES(16, 'Azerbaijan', 'AJ', 'AZ', 'AZE', '31', 'AZ', 'Baku (Baki) ', 'Commonwealth of Independent States ', 'Azerbaijani', 'Azerbaijanis', 'Azerbaijani Manat ', 'AZM', '7771092', 'Azerbaijan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Azerbaijan');
INSERT INTO `countries` VALUES(17, 'The Bahamas', 'BF', 'BS', 'BHS', '44', 'BS', 'Nassau ', 'Central America and the Caribbean ', 'Bahamian', 'Bahamians', 'Bahamian Dollar ', 'BSD', '297852', 'The Bahamas', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'The Bahamas');
INSERT INTO `countries` VALUES(18, 'Bahrain', 'BA', 'BH', 'BHR', '48', 'BH', 'Manama ', 'Middle East ', 'Bahraini', 'Bahrainis', 'Bahraini Dinar ', 'BHD', '645361', 'Bahrain', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bahrain');
INSERT INTO `countries` VALUES(19, 'Baker Island', 'FQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', '', '', '0', 'Baker Island', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(20, 'Bangladesh', 'BG', 'BD', 'BGD', '50', 'BD', 'Dhaka ', 'Asia ', 'Bangladeshi', 'Bangladeshis', 'Taka ', 'BDT', '131269860', 'Bangladesh', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bangladesh');
INSERT INTO `countries` VALUES(21, 'Barbados', 'BB', 'BB', 'BRB', '52', 'BB', 'Bridgetown ', 'Central America and the Caribbean ', 'Barbadian', 'Barbadians', 'Barbados Dollar', 'BBD', '275330', 'Barbados', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Barbados');
INSERT INTO `countries` VALUES(22, 'Bassas da India', 'BS', '--', '-- ', '--', '--', '', 'Africa ', '', '', '', '', '0', 'Bassas da India', 'ISO includes with the Miscellaneous (French) India', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(23, 'Belarus', 'BO', 'BY', 'BLR', '112', 'BY', 'Minsk ', 'Commonwealth of Independent States ', 'Belarusian', 'Belarusians', 'Belarussian Ruble', 'BYR', '10350194', 'Belarus', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Belarus');
INSERT INTO `countries` VALUES(24, 'Belgium', 'BE', 'BE', 'BEL', '56', 'BE', 'Brussels ', 'Europe ', 'Belgian', 'Belgians', 'Euro', 'EUR', '10258762', 'Belgium', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Belgium');
INSERT INTO `countries` VALUES(25, 'Belize', 'BH', 'BZ', 'BLZ', '84', 'BZ', 'Belmopan ', 'Central America and the Caribbean ', 'Belizean', 'Belizeans', 'Belize Dollar', 'BZD', '256062', 'Belize', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Belize');
INSERT INTO `countries` VALUES(26, 'Benin', 'BN', 'BJ', 'BEN', '204', 'BJ', 'Porto-Novo  ', 'Africa ', 'Beninese', 'Beninese', 'CFA Franc BCEAO', 'XOF', '6590782', 'Benin', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Benin');
INSERT INTO `countries` VALUES(27, 'Bermuda', 'BD', 'BM', 'BMU', '60', 'BM', 'Hamilton ', 'North America ', 'Bermudian', 'Bermudians', 'Bermudian Dollar ', 'BMD', '63503', 'Bermuda', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bermuda');
INSERT INTO `countries` VALUES(28, 'Bhutan', 'BT', 'BT', 'BTN', '64', 'BT', 'Thimphu ', 'Asia ', 'Bhutanese', 'Bhutanese', 'Ngultrum', 'BTN', '2049412', 'Bhutan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bhutan');
INSERT INTO `countries` VALUES(29, 'Bolivia', 'BL', 'BO', 'BOL', '68', 'BO', 'La Paz /Sucre ', 'South America ', 'Bolivian', 'Bolivians', 'Boliviano ', 'BOB', '8300463', 'Bolivia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bolivia');
INSERT INTO `countries` VALUES(30, 'Bosnia and Herzegovina', 'BK', 'BA', 'BIH', '70', 'BA', 'Sarajevo ', 'Bosnia and Herzegovina, Europe ', 'Bosnian and Herzegovinian', 'Bosnians and Herzegovinians', 'Convertible Marka', 'BAM', '3922205', 'Bosnia and Herzegovina', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bosnia & Herzegovina');
INSERT INTO `countries` VALUES(31, 'Botswana', 'BC', 'BW', 'BWA', '72', 'BW', 'Gaborone ', 'Africa ', 'Motswana', 'Batswana', 'Pula ', 'BWP', '1586119', 'Botswana', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Botswana');
INSERT INTO `countries` VALUES(32, 'Bouvet Island', 'BV', 'BV', 'BVT', '74', 'BV', '', 'Antarctic Region ', '', '', 'Norwegian Krone ', 'NOK', '0', 'Bouvet Island', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bouvet Island');
INSERT INTO `countries` VALUES(33, 'Brazil', 'BR', 'BR', 'BRA', '76', 'BR', 'Brasilia ', 'South America ', 'Brazilian', 'Brazilians', 'Brazilian Real ', 'BRL', '174468575', 'Brazil', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Brazil');
INSERT INTO `countries` VALUES(34, 'British Indian Ocean Territory', 'IO', 'IO', 'IOT', '86', 'IO', '', 'World ', '', '', 'US Dollar', 'USD', '0', 'The British Indian Ocean Territory', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'British Indian Ocean Territory');
INSERT INTO `countries` VALUES(35, 'British Virgin Islands', 'VI', 'VG', 'VGB', '92', 'VG', 'Road Town ', 'Central America and the Caribbean ', 'British Virgin Islander', 'British Virgin Islanders', 'US Dollar', 'USD', '20812', 'The British Virgin Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(36, 'Brunei Darussalam', 'BX', 'BN', 'BRN', '96', 'BN', '', '', '', '', 'Brunei Dollar', 'BND', '372361', 'Brunei', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Brunei Darussalam');
INSERT INTO `countries` VALUES(37, 'Bulgaria', 'BU', 'BG', 'BGR', '100', 'BG', 'Sofia ', 'Europe ', 'Bulgarian', 'Bulgarians', 'Lev ', 'BGN', '7707495', 'Bulgaria', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bulgaria');
INSERT INTO `countries` VALUES(38, 'Burkina Faso', 'UV', 'BF', 'BFA', '854', 'BF', 'Ouagadougou ', 'Africa ', 'Burkinabe', 'Burkinabe', 'CFA Franc BCEAO', 'XOF', '12272289', 'Burkina Faso', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Burkina Faso');
INSERT INTO `countries` VALUES(39, 'Burma', 'BM', 'MM', 'MMR', '104', 'MM', 'Rangoon ', 'Southeast Asia ', 'Burmese', 'Burmese', 'kyat ', 'MMK', '41994678', 'Burma', 'ISO uses the name Myanmar', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(40, 'Burundi', 'BY', 'BI', 'BDI', '108', 'BI', 'Bujumbura ', 'Africa ', 'Burundi', 'Burundians', 'Burundi Franc ', 'BIF', '6223897', 'Burundi', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Burundi');
INSERT INTO `countries` VALUES(41, 'Cambodia', 'CB', 'KH', 'KHM', '116', 'KH', 'Phnom Penh ', 'Southeast Asia ', 'Cambodian', 'Cambodians', 'Riel ', 'KHR', '12491501', 'Cambodia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cambodia');
INSERT INTO `countries` VALUES(42, 'Cameroon', 'CM', 'CM', 'CMR', '120', 'CM', 'Yaounde ', 'Africa ', 'Cameroonian', 'Cameroonians', 'CFA Franc BEAC', 'XAF', '15803220', 'Cameroon', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cameroon');
INSERT INTO `countries` VALUES(43, 'Canada', 'CA', 'CA', 'CAN', '124', 'CA', 'Ottawa ', 'North America ', 'Canadian', 'Canadians', 'Canadian Dollar ', 'CAD', '31592805', 'Canada', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Canada');
INSERT INTO `countries` VALUES(44, 'Cape Verde', 'CV', 'CV', 'CPV', '132', 'CV', 'Praia ', 'World ', 'Cape Verdean', 'Cape Verdeans', 'Cape Verdean Escudo ', 'CVE', '405163', 'Cape Verde', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cape Verde');
INSERT INTO `countries` VALUES(45, 'Cayman Islands', 'CJ', 'KY', 'CYM', '136', 'KY', 'George Town ', 'Central America and the Caribbean ', 'Caymanian', 'Caymanians', 'Cayman Islands Dollar', 'KYD', '35527', 'The Cayman Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cayman Islands');
INSERT INTO `countries` VALUES(46, 'Central African Republic', 'CT', 'CF', 'CAF', '140', 'CF', 'Bangui ', 'Africa ', 'Central African', 'Central Africans', 'CFA Franc BEAC', 'XAF', '3576884', 'The Central African Republic', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Central African Republic');
INSERT INTO `countries` VALUES(47, 'Chad', 'CD', 'TD', 'TCD', '148', 'TD', 'N''Djamena ', 'Africa ', 'Chadian', 'Chadians', 'CFA Franc BEAC', 'XAF', '8707078', 'Chad', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Chad');
INSERT INTO `countries` VALUES(48, 'Chile', 'CI', 'CL', 'CHL', '152', 'CL', 'Santiago ', 'South America ', 'Chilean', 'Chileans', 'Chilean Peso ', 'CLP', '15328467', 'Chile', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Chile');
INSERT INTO `countries` VALUES(49, 'China', 'CH', 'CN', 'CHN', '156', 'CN', 'Beijing ', 'Asia ', 'Chinese', 'Chinese', 'Yuan Renminbi', 'CNY', '1273111290', 'China', 'see also Taiwan', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'China');
INSERT INTO `countries` VALUES(50, 'Christmas Island', 'KT', 'CX', 'CXR', '162', 'CX', 'The Settlement ', 'Southeast Asia ', 'Christmas Island', 'Christmas Islanders', 'Australian Dollar ', 'AUD', '2771', 'Christmas Island', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Christmas Island');
INSERT INTO `countries` VALUES(51, 'Clipperton Island', 'IP', '--', '-- ', '--', '--', '', 'World ', '', '', '', '', '0', 'Clipperton Island', 'ISO includes with French Polynesia', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(52, 'Cocos (Keeling) Islands', 'CK', 'CC', 'CCK', '166', 'CC', 'West Island ', 'Southeast Asia ', 'Cocos Islander', 'Cocos Islanders', 'Australian Dollar ', 'AUD', '633', 'The Cocos Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cocos (Keeling) Islands');
INSERT INTO `countries` VALUES(53, 'Colombia', 'CO', 'CO', 'COL', '170', 'CO', 'Bogota ', 'South America, Central America and the Caribbean ', 'Colombian', 'Colombians', 'Colombian Peso ', 'COP', '40349388', 'Colombia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Colombia');
INSERT INTO `countries` VALUES(54, 'Comoros', 'CN', 'KM', 'COM', '174', 'KM', 'Moroni ', 'Africa ', 'Comoran', 'Comorans', 'Comoro Franc', 'KMF', '596202', 'Comoros', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Comoros');
INSERT INTO `countries` VALUES(55, 'Congo, Democratic Republic of the', 'CG', 'CD', 'COD', '180', 'CD', 'Kinshasa ', 'Africa ', 'Congolese', 'Congolese', 'Franc Congolais', 'CDF', '53624718', 'Democratic Republic of the Congo', 'formerly Zaire', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Congo-Brazzaville');
INSERT INTO `countries` VALUES(56, 'Congo, Republic of the', 'CF', 'CG', 'COG', '178', 'CG', 'Brazzaville ', 'Africa ', 'Congolese', 'Congolese', 'CFA Franc BEAC', 'XAF', '2894336', 'Republic of the Congo', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Congo-Brazzaville');
INSERT INTO `countries` VALUES(57, 'Cook Islands', 'CW', 'CK', 'COK', '184', 'CK', 'Avarua ', 'Oceania ', 'Cook Islander', 'Cook Islanders', 'New Zealand Dollar ', 'NZD', '20611', 'The Cook Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cook Islands');
INSERT INTO `countries` VALUES(58, 'Coral Sea Islands', 'CR', '--', '-- ', '--', '--', '', 'Oceania ', '', '', '', '', '0', 'The Coral Sea Islands', 'ISO includes with Australia', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(59, 'Costa Rica', 'CS', 'CR', 'CRI', '188', 'CR', 'San Jose ', 'Central America and the Caribbean ', 'Costa Rican', 'Costa Ricans', 'Costa Rican Colon', 'CRC', '3773057', 'Costa Rica', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Costa Rica');
INSERT INTO `countries` VALUES(60, 'Cote d''Ivoire', 'IV', 'CI', 'CIV', '384', 'CI', 'Yamoussoukro', 'Africa ', 'Ivorian', 'Ivorians', 'CFA Franc BCEAO', 'XOF', '16393221', 'Cote d''Ivoire', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cote d''Ivoire');
INSERT INTO `countries` VALUES(61, 'Croatia', 'HR', 'HR', 'HRV', '191', 'HR', 'Zagreb ', 'Europe ', 'Croatian', 'Croats', 'Kuna', 'HRK', '4334142', 'Croatia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Croatia');
INSERT INTO `countries` VALUES(62, 'Cuba', 'CU', 'CU', 'CUB', '192', 'CU', 'Havana ', 'Central America and the Caribbean ', 'Cuban', 'Cubans', 'Cuban Peso', 'CUP', '11184023', 'Cuba', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cuba');
INSERT INTO `countries` VALUES(63, 'Cyprus', 'CY', 'CY', 'CYP', '196', 'CY', 'Nicosia ', 'Middle East ', 'Cypriot', 'Cypriots', 'Cyprus Pound', 'CYP', '762887', 'Cyprus', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cyprus');
INSERT INTO `countries` VALUES(64, 'Czech Republic', 'EZ', 'CZ', 'CZE', '203', 'CZ', 'Prague ', 'Europe ', 'Czech', 'Czechs', 'Czech Koruna', 'CZK', '10264212', 'The Czech Republic', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Czech Republic');
INSERT INTO `countries` VALUES(65, 'Denmark', 'DA', 'DK', 'DNK', '208', 'DK', 'Copenhagen ', 'Europe ', 'Danish', 'Danes', 'Danish Krone', 'DKK', '5352815', 'Denmark', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Denmark');
INSERT INTO `countries` VALUES(66, 'Djibouti', 'DJ', 'DJ', 'DJI', '262', 'DJ', 'Djibouti ', 'Africa ', 'Djiboutian', 'Djiboutians', 'Djibouti Franc', 'DJF', '460700', 'Djibouti', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Djibouti');
INSERT INTO `countries` VALUES(67, 'Dominica', 'DO', 'DM', 'DMA', '212', 'DM', 'Roseau ', 'Central America and the Caribbean ', 'Dominican', 'Dominicans', 'East Caribbean Dollar', 'XCD', '70786', 'Dominica', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Dominica');
INSERT INTO `countries` VALUES(68, 'Dominican Republic', 'DR', 'DO', 'DOM', '214', 'DO', 'Santo Domingo ', 'Central America and the Caribbean ', 'Dominican', 'Dominicans', 'Dominican Peso', 'DOP', '8581477', 'The Dominican Republic', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Dominican Republic');
INSERT INTO `countries` VALUES(69, 'East Timor', 'TT', 'TL', 'TLS', '626', 'TP', '', '', '', '', 'Timor Escudo', 'TPE', '1040880', 'East Timor', 'NULL', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(70, 'Ecuador', 'EC', 'EC', 'ECU', '218', 'EC', 'Quito ', 'South America ', 'Ecuadorian', 'Ecuadorians', 'US Dollar', 'USD', '13183978', 'Ecuador', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Ecuador');
INSERT INTO `countries` VALUES(71, 'Egypt', 'EG', 'EG', 'EGY', '818', 'EG', 'Cairo ', 'Africa ', 'Egyptian', 'Egyptians', 'Egyptian Pound ', 'EGP', '69536644', 'Egypt', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Egypt');
INSERT INTO `countries` VALUES(72, 'El Salvador', 'ES', 'SV', 'SLV', '222', 'SV', 'San Salvador ', 'Central America and the Caribbean ', 'Salvadoran', 'Salvadorans', 'El Salvador Colon', 'SVC', '6237662', 'El Salvador', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'El Salvador');
INSERT INTO `countries` VALUES(73, 'Equatorial Guinea', 'EK', 'GQ', 'GNQ', '226', 'GQ', 'Malabo ', 'Africa ', 'Equatorial Guinean', 'Equatorial Guineans', 'CFA Franc BEAC', 'XAF', '486060', 'Equatorial Guinea', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Equatorial Guinea');
INSERT INTO `countries` VALUES(74, 'Eritrea', 'ER', 'ER', 'ERI', '232', 'ER', 'Asmara ', 'Africa ', 'Eritrean', 'Eritreans', 'Nakfa', 'ERN', '4298269', 'Eritrea', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Eritrea');
INSERT INTO `countries` VALUES(75, 'Estonia', 'EN', 'EE', 'EST', '233', 'EE', 'Tallinn ', 'Europe ', 'Estonian', 'Estonians', 'Kroon', 'EEK', '1423316', 'Estonia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Estonia');
INSERT INTO `countries` VALUES(76, 'Ethiopia', 'ET', 'ET', 'ETH', '231', 'ET', 'Addis Ababa ', 'Africa ', 'Ethiopian', 'Ethiopians', 'Ethiopian Birr', 'ETB', '65891874', 'Ethiopia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Ethiopia');
INSERT INTO `countries` VALUES(77, 'Europa Island', 'EU', '--', '-- ', '--', '--', '', 'Africa ', '', '', '', '', '0', 'Europa Island', 'ISO includes with the Miscellaneous (French) India', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(78, 'Falkland Islands (Islas Malvinas)', 'FK', 'FK', 'FLK', '238', 'FK', 'Stanley', 'South America', 'Falkland Island', 'Falkland Islanders', 'Falkland Islands Pound', 'FKP', '2895', 'The Falkland Islands ', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Falkland (Malvinas)');
INSERT INTO `countries` VALUES(79, 'Faroe Islands', 'FO', 'FO', 'FRO', '234', 'FO', 'Torshavn ', 'Europe ', 'Faroese', 'Faroese', 'Danish Krone ', 'DKK', '45661', 'The Faroe Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Faroes');
INSERT INTO `countries` VALUES(80, 'Fiji', 'FJ', 'FJ', 'FJI', '242', 'FJ', 'Suva ', 'Oceania ', 'Fijian', 'Fijians', 'Fijian Dollar ', 'FJD', '844330', 'Fiji', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Fiji');
INSERT INTO `countries` VALUES(81, 'Finland', 'FI', 'FI', 'FIN', '246', 'FI', 'Helsinki ', 'Europe ', 'Finnish', 'Finns', 'Euro', 'EUR', '5175783', 'Finland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Finland');
INSERT INTO `countries` VALUES(82, 'France', 'FR', 'FR', 'FRA', '250', 'FR', 'Paris ', 'Europe ', 'Frenchman', 'Frenchmen', 'Euro', 'EUR', '59551227', 'France', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'France');
INSERT INTO `countries` VALUES(83, 'France, Metropolitan', '--', '--', '-- ', '--', 'FX', '', '', '', '', 'Euro', 'EUR', '0', 'Metropolitan France', 'ISO limits to the European part of France, excludi', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'France');
INSERT INTO `countries` VALUES(84, 'French Guiana', 'FG', 'GF', 'GUF', '254', 'GF', 'Cayenne ', 'South America ', 'French Guianese', 'French Guianese', 'Euro', 'EUR', '177562', 'French Guiana', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'French Guiana');
INSERT INTO `countries` VALUES(85, 'French Polynesia', 'FP', 'PF', 'PYF', '258', 'PF', 'Papeete ', 'Oceania ', 'French Polynesian', 'French Polynesians', 'CFP Franc', 'XPF', '253506', 'French Polynesia', 'ISO includes Clipperton Island', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(86, 'French Southern and Antarctic Lands', 'FS', 'TF', 'ATF', '260', 'TF', '', 'Antarctic Region ', '', '', 'Euro', 'EUR', '0', 'The French Southern and Antarctic Lands', 'FIPS 10-4 does not include the French-claimed port', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'French Southern Territories');
INSERT INTO `countries` VALUES(87, 'Gabon', 'GB', 'GA', 'GAB', '266', 'GA', 'Libreville ', 'Africa ', 'Gabonese', 'Gabonese', 'CFA Franc BEAC', 'XAF', '1221175', 'Gabon', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Gabon');
INSERT INTO `countries` VALUES(88, 'The Gambia', 'GA', 'GM', 'GMB', '270', 'GM', 'Banjul ', 'Africa ', 'Gambian', 'Gambians', 'Dalasi', 'GMD', '1411205', 'The Gambia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Gambia');
INSERT INTO `countries` VALUES(89, 'Gaza Strip', 'GZ', '--', '-- ', '--', '--', '', 'Middle East ', '', '', 'New Israeli Shekel ', 'ILS', '1178119', 'The Gaza Strip', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(90, 'Georgia', 'GG', 'GE', 'GEO', '268', 'GE', 'T''bilisi ', 'Commonwealth of Independent States ', 'Georgian', 'Georgians', 'Lari', 'GEL', '4989285', 'Georgia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Georgia');
INSERT INTO `countries` VALUES(91, 'Germany', 'GM', 'DE', 'DEU', '276', 'DE', 'Berlin ', 'Europe ', 'German', 'Germans', 'Euro', 'EUR', '83029536', 'Deutschland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Germany');
INSERT INTO `countries` VALUES(92, 'Ghana', 'GH', 'GH', 'GHA', '288', 'GH', 'Accra ', 'Africa ', 'Ghanaian', 'Ghanaians', 'Cedi', 'GHC', '19894014', 'Ghana', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Ghana');
INSERT INTO `countries` VALUES(93, 'Gibraltar', 'GI', 'GI', 'GIB', '292', 'GI', 'Gibraltar ', 'Europe ', 'Gibraltar', 'Gibraltarians', 'Gibraltar Pound', 'GIP', '27649', 'Gibraltar', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Gibraltar');
INSERT INTO `countries` VALUES(94, 'Glorioso Islands', 'GO', '--', '-- ', '--', '--', '', 'Africa ', '', '', '', '', '0', 'The Glorioso Islands', 'ISO includes with the Miscellaneous (French) India', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(95, 'Greece', 'GR', 'GR', 'GRC', '300', 'GR', 'Athens ', 'Europe ', 'Greek', 'Greeks', 'Euro', 'EUR', '10623835', 'Greece', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Greece');
INSERT INTO `countries` VALUES(96, 'Greenland', 'GL', 'GL', 'GRL', '304', 'GL', 'Nuuk ', 'Arctic Region ', 'Greenlandic', 'Greenlanders', 'Danish Krone', 'DKK', '56352', 'Greenland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Greenland');
INSERT INTO `countries` VALUES(97, 'Grenada', 'GJ', 'GD', 'GRD', '308', 'GD', 'Saint George''s ', 'Central America and the Caribbean ', 'Grenadian', 'Grenadians', 'East Caribbean Dollar', 'XCD', '89227', 'Grenada', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Grenada');
INSERT INTO `countries` VALUES(98, 'Guadeloupe', 'GP', 'GP', 'GLP', '312', 'GP', 'Basse-Terre ', 'Central America and the Caribbean ', 'Guadeloupe', 'Guadeloupians', 'Euro', 'EUR', '431170', 'Guadeloupe', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Guadeloupe');
INSERT INTO `countries` VALUES(99, 'Guam', 'GQ', 'GU', 'GUM', '316', 'GU', 'Hagatna', 'Oceania ', 'Guamanian', 'Guamanians', 'US Dollar', 'USD', '157557', 'Guam', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Guam');
INSERT INTO `countries` VALUES(100, 'Guatemala', 'GT', 'GT', 'GTM', '320', 'GT', 'Guatemala ', 'Central America and the Caribbean ', 'Guatemalan', 'Guatemalans', 'Quetzal', 'GTQ', '12974361', 'Guatemala', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Guatemala');
INSERT INTO `countries` VALUES(101, 'Guernsey', 'GK', '--', '-- ', '--', 'GG', 'Saint Peter Port ', 'Europe ', 'Channel Islander', 'Channel Islanders', 'Pound Sterling', 'GBP', '64342', 'Guernsey', 'ISO includes with the United Kingdom', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Guernsey');
INSERT INTO `countries` VALUES(102, 'Guinea', 'GV', 'GN', 'GIN', '324', 'GN', 'Conakry ', 'Africa ', 'Guinean', 'Guineans', 'Guinean Franc ', 'GNF', '7613870', 'Guinea', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Guinea');
INSERT INTO `countries` VALUES(103, 'Guinea-Bissau', 'PU', 'GW', 'GNB', '624', 'GW', 'Bissau ', 'Africa ', 'Guinean', 'Guineans', 'CFA Franc BCEAO', 'XOF', '1315822', 'Guinea-Bissau', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Guinea-Bissau');
INSERT INTO `countries` VALUES(104, 'Guyana', 'GY', 'GY', 'GUY', '328', 'GY', 'Georgetown ', 'South America ', 'Guyanese', 'Guyanese', 'Guyana Dollar', 'GYD', '697181', 'Guyana', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Guyana');
INSERT INTO `countries` VALUES(105, 'Haiti', 'HA', 'HT', 'HTI', '332', 'HT', 'Port-au-Prince ', 'Central America and the Caribbean ', 'Haitian', 'Haitians', 'Gourde', 'HTG', '6964549', 'Haiti', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Haiti');
INSERT INTO `countries` VALUES(106, 'Heard Island and McDonald Islands', 'HM', 'HM', 'HMD', '334', 'HM', '', 'Antarctic Region ', '', '', 'Australian Dollar', 'AUD', '0', 'The Heard Island and McDonald Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Heard Island and McDonald');
INSERT INTO `countries` VALUES(107, 'Holy See (Vatican City)', 'VT', 'VA', 'VAT', '336', 'VA', 'Vatican City ', 'Europe ', '', '', 'Euro', 'EUR', '890', 'The Vatican City', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Vatican City');
INSERT INTO `countries` VALUES(108, 'Honduras', 'HO', 'HN', 'HND', '340', 'HN', 'Tegucigalpa ', 'Central America and the Caribbean ', 'Honduran', 'Hondurans', 'Lempira', 'HNL', '6406052', 'Honduras', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Honduras');
INSERT INTO `countries` VALUES(109, 'Hong Kong (SAR)', 'HK', 'HK', 'HKG', '344', 'HK', '', 'Southeast Asia ', '', '', 'Hong Kong Dollar ', 'HKD', '0', 'Xianggang ', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Hong Kong');
INSERT INTO `countries` VALUES(110, 'Howland Island', 'HQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', '', '', '7210505', 'Howland Island', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(111, 'Hungary', 'HU', 'HU', 'HUN', '348', 'HU', 'Budapest ', 'Europe ', 'Hungarian', 'Hungarians', 'Forint', 'HUF', '10106017', 'Hungary', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Hungary');
INSERT INTO `countries` VALUES(112, 'Iceland', 'IC', 'IS', 'ISL', '352', 'IS', 'Reykjavik ', 'Arctic Region ', 'Icelandic', 'Icelanders', 'Iceland Krona', 'ISK', '277906', 'Iceland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Iceland');
INSERT INTO `countries` VALUES(113, 'India', 'IN', 'IN', 'IND', '356', 'IN', 'New Delhi ', 'Asia ', 'Indian', 'Indians', 'Indian Rupee ', 'INR', '1029991145', 'India', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'India');
INSERT INTO `countries` VALUES(114, 'Indonesia', 'ID', 'ID', 'IDN', '360', 'ID', 'Jakarta ', 'Southeast Asia ', 'Indonesian', 'Indonesians', 'Rupiah', 'IDR', '228437870', 'Indonesia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Indonezia');
INSERT INTO `countries` VALUES(115, 'Iran', 'IR', 'IR', 'IRN', '364', 'IR', 'Tehran ', 'Middle East ', 'Iranian', 'Iranians', 'Iranian Rial', 'IRR', '66128965', 'Iran', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Iran');
INSERT INTO `countries` VALUES(116, 'Iraq', 'IZ', 'IQ', 'IRQ', '368', 'IQ', 'Baghdad ', 'Middle East ', 'Iraqi', 'Iraqis', 'Iraqi Dinar', 'IQD', '23331985', 'Iraq', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Iraq');
INSERT INTO `countries` VALUES(117, 'Ireland', 'EI', 'IE', 'IRL', '372', 'IE', 'Dublin ', 'Europe ', 'Irish', 'Irishmen', 'Euro', 'EUR', '3840838', 'Ireland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Ireland');
INSERT INTO `countries` VALUES(118, 'Israel', 'IS', 'IL', 'ISR', '376', 'IL', 'Jerusalem', 'Middle East ', 'Israeli', 'Israelis', 'New Israeli Sheqel', 'ILS', '5938093', 'Israel', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Israel');
INSERT INTO `countries` VALUES(119, 'Italy', 'IT', 'IT', 'ITA', '380', 'IT', 'Rome ', 'Europe ', 'Italian', 'Italians', 'Euro', 'EUR', '57679825', 'Italia ', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Italy');
INSERT INTO `countries` VALUES(120, 'Jamaica', 'JM', 'JM', 'JAM', '388', 'JM', 'Kingston ', 'Central America and the Caribbean ', 'Jamaican', 'Jamaicans', 'Jamaican dollar ', 'JMD', '2665636', 'Jamaica', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Jamaica');
INSERT INTO `countries` VALUES(121, 'Jan Mayen', 'JN', '--', '-- ', '--', '--', '', 'Arctic Region ', '', '', 'Norway Kroner', 'NOK', '0', 'Jan Mayen', 'ISO includes with Svalbard', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(122, 'Japan', 'JA', 'JP', 'JPN', '392', 'JP', 'Tokyo ', 'Asia ', 'Japanese', 'Japanese', 'Yen ', 'JPY', '126771662', 'Japan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Japan');
INSERT INTO `countries` VALUES(123, 'Jarvis Island', 'DQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', '', '', '0', 'Jarvis Island', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(124, 'Jersey', 'JE', '--', '-- ', '--', 'JE', 'Saint Helier ', 'Europe ', 'Channel Islander', 'Channel Islanders', 'Pound Sterling', 'GBP', '89361', 'Jersey', 'ISO includes with the United Kingdom', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Jersey');
INSERT INTO `countries` VALUES(125, 'Johnston Atoll', 'JQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', '', '', '0', 'Johnston Atoll', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(126, 'Jordan', 'JO', 'JO', 'JOR', '400', 'JO', 'Amman ', 'Middle East ', 'Jordanian', 'Jordanians', 'Jordanian Dinar', 'JOD', '5153378', 'Jordan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Jordan');
INSERT INTO `countries` VALUES(127, 'Juan de Nova Island', 'JU', '--', '-- ', '--', '--', '', 'Africa ', '', '', '', '', '0', 'Juan de Nova Island', 'ISO includes with the Miscellaneous (French) India', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(128, 'Kazakhstan', 'KZ', 'KZ', 'KAZ', '398', 'KZ', 'Astana ', 'Commonwealth of Independent States ', 'Kazakhstani', 'Kazakhstanis', 'Tenge', 'KZT', '16731303', 'Kazakhstan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Kazakhstan');
INSERT INTO `countries` VALUES(129, 'Kenya', 'KE', 'KE', 'KEN', '404', 'KE', 'Nairobi ', 'Africa ', 'Kenyan', 'Kenyans', 'Kenyan shilling ', 'KES', '30765916', 'Kenya', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Kenya');
INSERT INTO `countries` VALUES(130, 'Kingman Reef', 'KQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', '', '', '0', 'Kingman Reef', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(131, 'Kiribati', 'KR', 'KI', 'KIR', '296', 'KI', 'Tarawa ', 'Oceania ', 'I-Kiribati', 'I-Kiribati', 'Australian dollar ', 'AUD', '94149', 'Kiribati', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Kiribati');
INSERT INTO `countries` VALUES(132, 'Korea, North', 'KN', 'KP', 'PRK', '408', 'KP', 'P''yongyang ', 'Asia ', 'Korean', 'Koreans', 'North Korean Won', 'KPW', '21968228', 'North Korea', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'North Korea');
INSERT INTO `countries` VALUES(133, 'Korea, South', 'KS', 'KR', 'KOR', '410', 'KR', 'Seoul ', 'Asia ', 'Korean', 'Koreans', 'Won', 'KRW', '47904370', 'South Korea', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'South Korea');
INSERT INTO `countries` VALUES(134, 'Kuwait', 'KU', 'KW', 'KWT', '414', 'KW', 'Kuwait ', 'Middle East ', 'Kuwaiti', 'Kuwaitis', 'Kuwaiti Dinar', 'KWD', '2041961', 'Al Kuwayt', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Kuwait');
INSERT INTO `countries` VALUES(135, 'Kyrgyzstan', 'KG', 'KG', 'KGZ', '417', 'KG', 'Bishkek ', 'Commonwealth of Independent States ', 'Kyrgyzstani', 'Kyrgyzstanis', 'Som', 'KGS', '4753003', 'Kyrgyzstan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Kyrgyzstan');
INSERT INTO `countries` VALUES(136, 'Laos', 'LA', 'LA', 'LAO', '418', 'LA', 'Vientiane ', 'Southeast Asia ', 'Lao', 'Laos', 'Kip', 'LAK', '5635967', 'Laos', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Laos');
INSERT INTO `countries` VALUES(137, 'Latvia', 'LG', 'LV', 'LVA', '428', 'LV', 'Riga ', 'Europe ', 'Latvian', 'Latvians', 'Latvian Lats', 'LVL', '2385231', 'Latvia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Latvia');
INSERT INTO `countries` VALUES(138, 'Lebanon', 'LE', 'LB', 'LBN', '422', 'LB', 'Beirut ', 'Middle East ', 'Lebanese', 'Lebanese', 'Lebanese Pound', 'LBP', '3627774', 'Lebanon', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Lebanon');
INSERT INTO `countries` VALUES(139, 'Lesotho', 'LT', 'LS', 'LSO', '426', 'LS', 'Maseru ', 'Africa ', 'Basotho', 'Mosotho', 'Loti', 'LSL', '2177062', 'Lesotho', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Lesotho');
INSERT INTO `countries` VALUES(140, 'Liberia', 'LI', 'LR', 'LBR', '430', 'LR', 'Monrovia ', 'Africa ', 'Liberian', 'Liberians', 'Liberian Dollar', 'LRD', '3225837', 'Liberia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Liberia');
INSERT INTO `countries` VALUES(141, 'Libya', 'LY', 'LY', 'LBY', '434', 'LY', 'Tripoli ', 'Africa ', 'Libyan', 'Libyans', 'Libyan Dinar', 'LYD', '5240599', 'Libya', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Libya');
INSERT INTO `countries` VALUES(142, 'Liechtenstein', 'LS', 'LI', 'LIE', '438', 'LI', 'Vaduz ', 'Europe ', 'Liechtenstein', 'Liechtensteiners', 'Swiss Franc', 'CHF', '32528', 'Liechtenstein', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Liechtenstein');
INSERT INTO `countries` VALUES(143, 'Lithuania', 'LH', 'LT', 'LTU', '440', 'LT', 'Vilnius ', 'Europe ', 'Lithuanian', 'Lithuanians', 'Lithuanian Litas', 'LTL', '3610535', 'Lithuania', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Lithuania');
INSERT INTO `countries` VALUES(144, 'Luxembourg', 'LU', 'LU', 'LUX', '442', 'LU', 'Luxembourg ', 'Europe ', 'Luxembourg', 'Luxembourgers', 'Euro', 'EUR', '442972', 'Luxembourg', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Luxembourg');
INSERT INTO `countries` VALUES(145, 'Macao', 'MC', 'MO', 'MAC', '446', 'MO', '', 'Southeast Asia ', 'Chinese', 'Chinese', 'Pataca', 'MOP', '453733', 'Macao', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Macao');
INSERT INTO `countries` VALUES(146, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MK', 'MKD', '807', 'MK', 'Skopje ', 'Europe ', 'Macedonian', 'Macedonians', 'Denar', 'MKD', '2046209', 'Makedonija', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Macedonia, The Former Yugoslav Republic of');
INSERT INTO `countries` VALUES(147, 'Madagascar', 'MA', 'MG', 'MDG', '450', 'MG', 'Antananarivo ', 'Africa ', 'Malagasy', 'Malagasy', 'Malagasy Franc', 'MGF', '15982563', 'Madagascar', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Madagascar');
INSERT INTO `countries` VALUES(148, 'Malawi', 'MI', 'MW', 'MWI', '454', 'MW', 'Lilongwe ', 'Africa ', 'Malawian', 'Malawians', 'Kwacha', 'MWK', '10548250', 'Malawi', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Malawi');
INSERT INTO `countries` VALUES(149, 'Malaysia', 'MY', 'MY', 'MYS', '458', 'MY', 'Kuala Lumpur ', 'Southeast Asia ', 'Malaysian', 'Malaysians', 'Malaysian Ringgit', 'MYR', '22229040', 'Malaysia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Malaysia');
INSERT INTO `countries` VALUES(150, 'Maldives', 'MV', 'MV', 'MDV', '462', 'MV', 'Male ', 'Asia ', 'Maldivian', 'Maldivians', 'Rufiyaa', 'MVR', '310764', 'Maldives', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Maldives');
INSERT INTO `countries` VALUES(151, 'Mali', 'ML', 'ML', 'MLI', '466', 'ML', 'Bamako ', 'Africa ', 'Malian', 'Malians', 'CFA Franc BCEAO', 'XOF', '11008518', 'Mali', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Mali');
INSERT INTO `countries` VALUES(152, 'Malta', 'MT', 'MT', 'MLT', '470', 'MT', 'Valletta ', 'Europe ', 'Maltese', 'Maltese', 'Maltese Lira', 'MTL', '394583', 'Malta', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Malta');
INSERT INTO `countries` VALUES(153, 'Man, Isle of', 'IM', '--', '-- ', '--', 'IM', 'Douglas ', 'Europe ', 'Manxman', 'Manxmen', 'Pound Sterling', 'GBP', '73489', 'The Isle of Man', 'ISO includes with the United Kingdom', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Isle of Man');
INSERT INTO `countries` VALUES(154, 'Marshall Islands', 'RM', 'MH', 'MHL', '584', 'MH', 'Majuro ', 'Oceania ', 'Marshallese', 'Marshallese', 'US Dollar', 'USD', '70822', 'The Marshall Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Marshall Islands');
INSERT INTO `countries` VALUES(155, 'Martinique', 'MB', 'MQ', 'MTQ', '474', 'MQ', 'Fort-de-France ', 'Central America and the Caribbean ', 'Martiniquais', 'Martiniquais', 'Euro', 'EUR', '418454', 'Martinique', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Martinique');
INSERT INTO `countries` VALUES(156, 'Mauritania', 'MR', 'MR', 'MRT', '478', 'MR', 'Nouakchott ', 'Africa ', 'Mauritanian', 'Mauritanians', 'Ouguiya', 'MRO', '2747312', 'Mauritania', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Mauritania');
INSERT INTO `countries` VALUES(157, 'Mauritius', 'MP', 'MU', 'MUS', '480', 'MU', 'Port Louis ', 'World ', 'Mauritian', 'Mauritians', 'Mauritius Rupee', 'MUR', '1189825', 'Mauritius', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Mauritius');
INSERT INTO `countries` VALUES(158, 'Mayotte', 'MF', 'YT', 'MYT', '175', 'YT', 'Mamoutzou ', 'Africa ', 'Mahorais', 'Mahorais', 'Euro', 'EUR', '163366', 'Mayotte', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Mayotte');
INSERT INTO `countries` VALUES(159, 'Mexico', 'MX', 'MX', 'MEX', '484', 'MX', 'Mexico ', 'North America ', 'Mexican', 'Mexicans', 'Mexican Peso', 'MXN', '101879171', 'Mexico', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Mexico');
INSERT INTO `countries` VALUES(160, 'Micronesia, Federated States of', 'FM', 'FM', 'FSM', '583', 'FM', 'Palikir ', 'Oceania ', 'Micronesian', 'Micronesians', 'US Dollar', 'USD', '134597', 'The Federated States of Micronesia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Micronesia, Federated States of');
INSERT INTO `countries` VALUES(161, 'Midway Islands', 'MQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', 'United States Dollars', 'USD', '0', 'The Midway Islands', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(162, 'Miscellaneous (French)', '--', '--', '-- ', '--', '--', '', '', '', '', '', '', '0', 'Miscellaneous (French)', 'ISO includes Bassas da India, Europa Island, Glori', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(163, 'Moldova', 'MD', 'MD', 'MDA', '498', 'MD', 'Chisinau ', 'Commonwealth of Independent States ', 'Moldovan', 'Moldovans', 'Moldovan Leu', 'MDL', '4431570', 'Moldova', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Moldova');
INSERT INTO `countries` VALUES(164, 'Monaco', 'MN', 'MC', 'MCO', '492', 'MC', 'Monaco ', 'Europe ', 'Monegasque', 'Monegasques', 'Euro', 'EUR', '31842', 'Monaco', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Monaco');
INSERT INTO `countries` VALUES(165, 'Mongolia', 'MG', 'MN', 'MNG', '496', 'MN', 'Ulaanbaatar ', 'Asia ', 'Mongolian', 'Mongolians', 'Tugrik', 'MNT', '2654999', 'Mongolia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Mongolia');
INSERT INTO `countries` VALUES(166, 'Montenegro', '--', '--', '-- ', '--', '--', '', '', '', '', '', '', '0', 'Montenegro', 'now included as region within Yugoslavia', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Montenegro');
INSERT INTO `countries` VALUES(167, 'Montserrat', 'MH', 'MS', 'MSR', '500', 'MS', 'Plymouth', 'Central America and the Caribbean ', 'Montserratian', 'Montserratians', 'East Caribbean Dollar', 'XCD', '7574', 'Montserrat', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Montserrat');
INSERT INTO `countries` VALUES(168, 'Morocco', 'MO', 'MA', 'MAR', '504', 'MA', 'Rabat ', 'Africa ', 'Moroccan', 'Moroccans', 'Moroccan Dirham', 'MAD', '30645305', 'Morocco', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Morocco');
INSERT INTO `countries` VALUES(169, 'Mozambique', 'MZ', 'MZ', 'MOZ', '508', 'MZ', 'Maputo ', 'Africa ', 'Mozambican', 'Mozambicans', 'Metical', 'MZM', '19371057', 'Mozambique', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Mozambique');
INSERT INTO `countries` VALUES(170, 'Myanmar', '--', '--', '-- ', '--', '--', '', '', '', '', 'Kyat', 'MMK', '0', 'Myanmar', 'see Burma', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Myanmar(Burma)');
INSERT INTO `countries` VALUES(171, 'Namibia', 'WA', 'NA', 'NAM', '516', 'NA', 'Windhoek ', 'Africa ', 'Namibian', 'Namibians', 'Namibian Dollar ', 'NAD', '1797677', 'Namibia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Namibia');
INSERT INTO `countries` VALUES(172, 'Nauru', 'NR', 'NR', 'NRU', '520', 'NR', '', 'Oceania ', 'Nauruan', 'Nauruans', 'Australian Dollar', 'AUD', '12088', 'Nauru', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Nauru');
INSERT INTO `countries` VALUES(173, 'Navassa Island', 'BQ', '--', '-- ', '--', '--', '', 'Central America and the Caribbean ', '', '', '', '', '0', 'Navassa Island', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(174, 'Nepal', 'NP', 'NP', 'NPL', '524', 'NP', 'Kathmandu ', 'Asia ', 'Nepalese', 'Nepalese', 'Nepalese Rupee', 'NPR', '25284463', 'Nepal', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Nepal');
INSERT INTO `countries` VALUES(175, 'Netherlands', 'NL', 'NL', 'NLD', '528', 'NL', 'Amsterdam ', 'Europe ', 'Dutchman', 'Dutchmen', 'Euro', 'EUR', '15981472', 'The Netherlands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Netherlands');
INSERT INTO `countries` VALUES(176, 'Netherlands Antilles', 'NT', 'AN', 'ANT', '530', 'AN', 'Willemstad ', 'Central America and the Caribbean ', 'Dutch Antillean', 'Dutch Antilleans', 'Netherlands Antillean guilder ', 'ANG', '212226', 'The Netherlands Antilles', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Netherlands Antilles');
INSERT INTO `countries` VALUES(177, 'New Caledonia', 'NC', 'NC', 'NCL', '540', 'NC', 'Noumea ', 'Oceania ', 'New Caledonian', 'New Caledonians', 'CFP Franc', 'XPF', '204863', 'New Caledonia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'New Caledonia');
INSERT INTO `countries` VALUES(178, 'New Zealand', 'NZ', 'NZ', 'NZL', '554', 'NZ', 'Wellington ', 'Oceania ', 'New Zealand', 'New Zealanders', 'New Zealand Dollar', 'NZD', '3864129', 'New Zealand', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'New Zealand');
INSERT INTO `countries` VALUES(179, 'Nicaragua', 'NU', 'NI', 'NIC', '558', 'NI', 'Managua ', 'Central America and the Caribbean ', 'Nicaraguan', 'Nicaraguans', 'Cordoba Oro', 'NIO', '4918393', 'Nicaragua', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Nicaragua');
INSERT INTO `countries` VALUES(180, 'Niger', 'NG', 'NE', 'NER', '562', 'NE', 'Niamey ', 'Africa ', 'Nigerien', 'Nigeriens', 'CFA Franc BCEAO', 'XOF', '10355156', 'Niger', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Niger');
INSERT INTO `countries` VALUES(181, 'Nigeria', 'NI', 'NG', 'NGA', '566', 'NG', 'Abuja', 'Africa ', 'Nigerian', 'Nigerians', 'Naira', 'NGN', '126635626', 'Nigeria', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Nigeria');
INSERT INTO `countries` VALUES(182, 'Niue', 'NE', 'NU', 'NIU', '570', 'NU', 'Alofi ', 'Oceania ', 'Niuean', 'Niueans', 'New Zealand Dollar', 'NZD', '2124', 'Niue', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Niue');
INSERT INTO `countries` VALUES(183, 'Norfolk Island', 'NF', 'NF', 'NFK', '574', 'NF', 'Kingston ', 'Oceania ', 'Norfolk Islander', 'Norfolk Islanders', 'Australian Dollar', 'AUD', '1879', 'Norfolk Island', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Norfolk');
INSERT INTO `countries` VALUES(184, 'Northern Mariana Islands', 'CQ', 'MP', 'MNP', '580', 'MP', 'Saipan ', 'Oceania ', '', '', 'US Dollar', 'USD', '74612', 'The Northern Mariana Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Northern Mariana');
INSERT INTO `countries` VALUES(185, 'Norway', 'NO', 'NO', 'NOR', '578', 'NO', 'Oslo ', 'Europe ', 'Norwegian', 'Norwegians', 'Norwegian Krone', 'NOK', '4503440', 'Norway', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Norway');
INSERT INTO `countries` VALUES(186, 'Oman', 'MU', 'OM', 'OMN', '512', 'OM', 'Muscat ', 'Middle East ', 'Omani', 'Omanis', 'Rial Omani', 'OMR', '2622198', 'Oman', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Oman');
INSERT INTO `countries` VALUES(187, 'Pakistan', 'PK', 'PK', 'PAK', '586', 'PK', 'Islamabad ', 'Asia ', 'Pakistani', 'Pakistanis', 'Pakistan Rupee', 'PKR', '144616639', 'Pakistan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Pakistan');
INSERT INTO `countries` VALUES(188, 'Palau', 'PS', 'PW', 'PLW', '585', 'PW', 'Koror ', 'Oceania ', 'Palauan', 'Palauans', 'US Dollar', 'USD', '19092', 'Palau', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Palau');
INSERT INTO `countries` VALUES(189, 'Palmyra Atoll', 'LQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', '', '', '0', 'Palmyra Atoll', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(190, 'Panama', 'PM', 'PA', 'PAN', '591', 'PA', 'Panama ', 'Central America and the Caribbean ', 'Panamanian', 'Panamanians', 'balboa ', 'PAB', '2845647', 'Panama', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Panama');
INSERT INTO `countries` VALUES(191, 'Papua New Guinea', 'PP', 'PG', 'PNG', '598', 'PG', 'Port Moresby ', 'Oceania ', 'Papua New Guinean', 'Papua New Guineans', 'Kina', 'PGK', '5049055', 'Papua New Guinea', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Papua New Guinea');
INSERT INTO `countries` VALUES(192, 'Paracel Islands', 'PF', '--', '-- ', '--', '--', '', 'Southeast Asia ', '', '', '', '', '0', 'The Paracel Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(193, 'Paraguay', 'PA', 'PY', 'PRY', '600', 'PY', 'Asuncion ', 'South America ', 'Paraguayan', 'Paraguayans', 'Guarani', 'PYG', '5734139', 'Paraguay', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Paraguay');
INSERT INTO `countries` VALUES(194, 'Peru', 'PE', 'PE', 'PER', '604', 'PE', 'Lima ', 'South America ', 'Peruvian', 'Peruvians', 'Nuevo Sol', 'PEN', '27483864', 'Peru', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Peru');
INSERT INTO `countries` VALUES(195, 'Philippines', 'RP', 'PH', 'PHL', '608', 'PH', 'Manila ', 'Southeast Asia ', 'Philippine', 'Filipinos', 'Philippine Peso', 'PHP', '82841518', 'The Philippines', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Philippines');
INSERT INTO `countries` VALUES(196, 'Pitcairn Islands', 'PC', 'PN', 'PCN', '612', 'PN', 'Adamstown ', 'Oceania ', 'Pitcairn Islander', 'Pitcairn Islanders', 'New Zealand Dollar', 'NZD', '47', 'The Pitcairn Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Pitcairn');
INSERT INTO `countries` VALUES(197, 'Poland', 'PL', 'PL', 'POL', '616', 'PL', 'Warsaw ', 'Europe ', 'Polish', 'Poles', 'Zloty', 'PLN', '38633912', 'Poland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Poland');
INSERT INTO `countries` VALUES(198, 'Portugal', 'PO', 'PT', 'PRT', '620', 'PT', 'Lisbon ', 'Europe ', 'Portuguese', 'Portuguese', 'Euro', 'EUR', '10066253', 'Portugal', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Portugal');
INSERT INTO `countries` VALUES(199, 'Puerto Rico', 'RQ', 'PR', 'PRI', '630', 'PR', 'San Juan ', 'Central America and the Caribbean ', 'Puerto Rican', 'Puerto Ricans', 'US Dollar', 'USD', '3937316', 'Puerto Rico', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Puerto Rico');
INSERT INTO `countries` VALUES(200, 'Qatar', 'QA', 'QA', 'QAT', '634', 'QA', 'Doha ', 'Middle East ', 'Qatari', 'Qataris', 'Qatari Rial', 'QAR', '769152', 'Qatar', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Qatar');
INSERT INTO `countries` VALUES(201, 'Réunion', 'RE', 'RE', 'REU', '638', 'RE', 'Saint-Denis', 'World', 'Reunionese', 'Reunionese', 'Euro', 'EUR', '732570', 'R.©union', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Reunion');
INSERT INTO `countries` VALUES(202, 'Romania', 'RO', 'RO', 'ROU', '642', 'RO', 'Bucharest ', 'Europe ', 'Romanian', 'Romanians', 'Leu', 'ROL', '22364022', 'Romania', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Romania');
INSERT INTO `countries` VALUES(203, 'Russia', 'RS', 'RU', 'RUS', '643', 'RU', 'Moscow ', 'Asia ', 'Russian', 'Russians', 'Russian Ruble', 'RUB', '145470197', 'Russia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Russian Federation');
INSERT INTO `countries` VALUES(204, 'Rwanda', 'RW', 'RW', 'RWA', '646', 'RW', 'Kigali ', 'Africa ', 'Rwandan', 'Rwandans', 'Rwanda Franc', 'RWF', '7312756', 'Rwanda', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Rwanda');
INSERT INTO `countries` VALUES(205, 'Saint Helena', 'SH', 'SH', 'SHN', '654', 'SH', 'Jamestown ', 'Africa ', 'Saint Helenian', 'Saint Helenians', 'Saint Helenian Pound ', 'SHP', '7266', 'Saint Helena', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Saint Helena');
INSERT INTO `countries` VALUES(206, 'Saint Kitts and Nevis', 'SC', 'KN', 'KNA', '659', 'KN', 'Basseterre ', 'Central America and the Caribbean ', 'Kittitian and Nevisian', 'Kittitians and Nevisians', 'East Caribbean Dollar ', 'XCD', '38756', 'Saint Kitts and Nevis', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'St Kitts & Nevis');
INSERT INTO `countries` VALUES(207, 'Saint Lucia', 'ST', 'LC', 'LCA', '662', 'LC', 'Castries ', 'Central America and the Caribbean ', 'Saint Lucian', 'Saint Lucians', 'East Caribbean Dollar ', 'XCD', '158178', 'Saint Lucia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Saint Lucia');
INSERT INTO `countries` VALUES(208, 'Saint Pierre and Miquelon', 'SB', 'PM', 'SPM', '666', 'PM', 'Saint-Pierre ', 'North America ', 'Frenchman', 'Frenchmen', 'Euro', 'EUR', '6928', 'Saint Pierre and Miquelon', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Saint Pierre and Miquelon');
INSERT INTO `countries` VALUES(209, 'Saint Vincent and the Grenadines', 'VC', 'VC', 'VCT', '670', 'VC', 'Kingstown ', 'Central America and the Caribbean ', 'Saint Vincentian', 'Saint Vincentians', 'East Caribbean Dollar ', 'XCD', '115942', 'Saint Vincent and the Grenadines', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'St Vincent & the Grenadines');
INSERT INTO `countries` VALUES(210, 'Samoa', 'WS', 'WS', 'WSM', '882', 'WS', 'Apia ', 'Oceania ', 'Samoan', 'Samoans', 'Tala', 'WST', '179058', 'Samoa', 'NULL', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Samoa');
INSERT INTO `countries` VALUES(211, 'San Marino', 'SM', 'SM', 'SMR', '674', 'SM', 'San Marino ', 'Europe ', 'Sammarinese', 'Sammarinese', 'Euro', 'EUR', '27336', 'San Marino', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'San Marino');
INSERT INTO `countries` VALUES(212, 'São Tomé and Príncipe', 'TP', 'ST', 'STP', '678', 'ST', 'Sao Tome', 'Africa', 'Sao Tomean', 'Sao Tomeans', 'Dobra', 'STD', '165034', 'S..o Tom.© and Pr.­ncipe', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Sao Tome & Principe');
INSERT INTO `countries` VALUES(213, 'Saudi Arabia', 'SA', 'SA', 'SAU', '682', 'SA', 'Riyadh ', 'Middle East ', 'Saudi Arabian ', 'Saudis', 'Saudi Riyal', 'SAR', '22757092', 'Saudi Arabia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Saudi Arabia');
INSERT INTO `countries` VALUES(214, 'Senegal', 'SG', 'SN', 'SEN', '686', 'SN', 'Dakar ', 'Africa ', 'Senegalese', 'Senegalese', 'CFA Franc BCEAO', 'XOF', '10284929', 'Senegal', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Senegal');
INSERT INTO `countries` VALUES(215, 'Serbia', '--', '--', '-- ', '--', '--', '', '', '', '', '', '', '0', 'Serbia', 'now included as region within Yugoslavia', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Serbia(Yugoslavia)');
INSERT INTO `countries` VALUES(216, 'Serbia and Montenegro', '--', '--', '-- ', '--', '--', '', '', '', '', '', '', '0', 'Serbia and Montenegro', 'See Yugoslavia', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(217, 'Seychelles', 'SE', 'SC', 'SYC', '690', 'SC', 'Victoria ', 'Africa ', 'Seychellois', 'Seychellois', 'Seychelles Rupee', 'SCR', '79715', 'Seychelles', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Seychelles');
INSERT INTO `countries` VALUES(218, 'Sierra Leone', 'SL', 'SL', 'SLE', '694', 'SL', 'Freetown ', 'Africa ', 'Sierra Leonean', 'Sierra Leoneans', 'Leone', 'SLL', '5426618', 'Sierra Leone', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Sierra Leone');
INSERT INTO `countries` VALUES(219, 'Singapore', 'SN', 'SG', 'SGP', '702', 'SG', 'Singapore ', 'Southeast Asia ', 'Singaporeian', 'Singaporeans', 'Singapore Dollar', 'SGD', '4300419', 'Singapore', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Singapore');
INSERT INTO `countries` VALUES(220, 'Slovakia', 'LO', 'SK', 'SVK', '703', 'SK', 'Bratislava ', 'Europe ', 'Slovakian', 'Slovaks', 'Slovak Koruna', 'SKK', '5414937', 'Slovakia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Slovakia');
INSERT INTO `countries` VALUES(221, 'Slovenia', 'SI', 'SI', 'SVN', '705', 'SI', 'Ljubljana ', 'Europe ', 'Slovenian', 'Slovenes', 'Euro', 'EUR', '1930132', 'Slovenia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Slovenia');
INSERT INTO `countries` VALUES(222, 'Solomon Islands', 'BP', 'SB', 'SLB', '90', 'SB', 'Honiara ', 'Oceania ', 'Solomon Islander', 'Solomon Islanders', 'Solomon Islands Dollar', 'SBD', '480442', 'The Solomon Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Solomon Islands');
INSERT INTO `countries` VALUES(223, 'Somalia', 'SO', 'SO', 'SOM', '706', 'SO', 'Mogadishu ', 'Africa ', 'Somali', 'Somalis', 'Somali Shilling', 'SOS', '7488773', 'Somalia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Somalia');
INSERT INTO `countries` VALUES(224, 'South Africa', 'SF', 'ZA', 'ZAF', '710', 'ZA', 'Pretoria', 'Africa ', 'South African', 'South Africans', 'Rand', 'ZAR', '43586097', 'South Africa', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'South Africa');
INSERT INTO `countries` VALUES(225, 'South Georgia and the South Sandwich Islands', 'SX', 'GS', 'SGS', '239', 'GS', '', 'Antarctic Region ', '', '', 'Pound Sterling', 'GBP', '0', 'The South Georgia and the South Sandwich Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'South Georgia and South Sandwich');
INSERT INTO `countries` VALUES(226, 'Spain', 'SP', 'ES', 'ESP', '724', 'ES', 'Madrid ', 'Europe ', 'Spanish', 'Spaniards', 'Euro', 'EUR', '40037995', 'Spain', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Spain');
INSERT INTO `countries` VALUES(227, 'Spratly Islands', 'PG', '--', '-- ', '--', '--', '', 'Southeast Asia ', '', '', '', '', '0', 'The Spratly Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(228, 'Sri Lanka', 'CE', 'LK', 'LKA', '144', 'LK', 'Colombo', 'Asia ', 'Sri Lankan', 'Sri Lankans', 'Sri Lanka Rupee', 'LKR', '19408635', 'Sri Lanka', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Sri Lanka');
INSERT INTO `countries` VALUES(229, 'Sudan', 'SU', 'SD', 'SDN', '736', 'SD', 'Khartoum ', 'Africa ', 'Sudanese', 'Sudanese', 'Sudanese Dinar', 'SDD', '36080373', 'Sudan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Sudan');
INSERT INTO `countries` VALUES(230, 'Suriname', 'NS', 'SR', 'SUR', '740', 'SR', 'Paramaribo ', 'South America ', 'Surinamese', 'Surinamers', 'Suriname Guilder', 'SRG', '433998', 'Suriname', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Suriname');
INSERT INTO `countries` VALUES(231, 'Svalbard', 'SV', 'SJ', 'SJM', '744', 'SJ', 'Longyearbyen ', 'Arctic Region ', '', '', 'Norwegian Krone', 'NOK', '2332', 'Svalbard', 'ISO includes Jan Mayen', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Svalbard and Jan Mayen');
INSERT INTO `countries` VALUES(232, 'Swaziland', 'WZ', 'SZ', 'SWZ', '748', 'SZ', 'Mbabane ', 'Africa ', 'Swazi', 'Swazis', 'Lilangeni', 'SZL', '1104343', 'Swaziland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Swaziland');
INSERT INTO `countries` VALUES(233, 'Sweden', 'SW', 'SE', 'SWE', '752', 'SE', 'Stockholm ', 'Europe ', 'Swedish', 'Swedes', 'Swedish Krona', 'SEK', '8875053', 'Sweden', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Sweden');
INSERT INTO `countries` VALUES(234, 'Switzerland', 'SZ', 'CH', 'CHE', '756', 'CH', 'Bern ', 'Europe ', 'Swiss', 'Swiss', 'Swiss Franc', 'CHF', '7283274', 'Switzerland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Switzerland');
INSERT INTO `countries` VALUES(235, 'Syria', 'SY', 'SY', 'SYR', '760', 'SY', 'Damascus ', 'Middle East ', 'Syrian', 'Syrians', 'Syrian Pound', 'SYP', '16728808', 'Syria', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Syria');
INSERT INTO `countries` VALUES(236, 'Taiwan', 'TW', 'TW', 'TWN', '158', 'TW', 'Taipei ', 'Southeast Asia ', 'Taiwanese', 'Taiwanese', 'New Taiwan Dollar', 'TWD', '22370461', 'Taiwan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Taiwan');
INSERT INTO `countries` VALUES(237, 'Tajikistan', 'TI', 'TJ', 'TJK', '762', 'TJ', 'Dushanbe ', 'Commonwealth of Independent States ', 'Tajikistani', 'Tajikistanis', 'Somoni', 'TJS', '6578681', 'Tajikistan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Tajikistan');
INSERT INTO `countries` VALUES(238, 'Tanzania', 'TZ', 'TZ', 'TZA', '834', 'TZ', 'Dar es Salaam', 'Africa ', 'Tanzanian', 'Tanzanians', 'Tanzanian Shilling', 'TZS', '36232074', 'Tanzania', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Tanzania');
INSERT INTO `countries` VALUES(239, 'Thailand', 'TH', 'TH', 'THA', '764', 'TH', 'Bangkok ', 'Southeast Asia ', 'Thai', 'Thai', 'Baht', 'THB', '61797751', 'Thailand', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Thailand');
INSERT INTO `countries` VALUES(240, 'Togo', 'TO', 'TG', 'TGO', '768', 'TG', 'Lome ', 'Africa ', 'Togolese', 'Togolese', 'CFA Franc BCEAO', 'XOF', '5153088', 'Togo', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Togo');
INSERT INTO `countries` VALUES(241, 'Tokelau', 'TL', 'TK', 'TKL', '772', 'TK', '', 'Oceania ', 'Tokelauan', 'Tokelauans', 'New Zealand Dollar', 'NZD', '1445', 'Tokelau', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Tokelau');
INSERT INTO `countries` VALUES(242, 'Tonga', 'TN', 'TO', 'TON', '776', 'TO', 'Nuku''alofa ', 'Oceania ', 'Tongan', 'Tongans', 'Pa''anga', 'TOP', '104227', 'Tonga', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Tonga');
INSERT INTO `countries` VALUES(243, 'Trinidad and Tobago', 'TD', 'TT', 'TTO', '780', 'TT', 'Port-of-Spain ', 'Central America and the Caribbean ', 'Trinidadian and Tobagonian', 'Trinidadians and Tobagonians', 'Trinidad and Tobago Dollar', 'TTD', '1169682', 'Trinidad and Tobago', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Trinidad & Tobago');
INSERT INTO `countries` VALUES(244, 'Tromelin Island', 'TE', '--', '-- ', '--', '--', '', 'Africa ', '', '', '', '', '0', 'Tromelin Island', 'ISO includes with the Miscellaneous (French) India', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(245, 'Tunisia', 'TS', 'TN', 'TUN', '788', 'TN', 'Tunis ', 'Africa ', 'Tunisian', 'Tunisians', 'Tunisian Dinar', 'TND', '9705102', 'Tunisia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Tunisia');
INSERT INTO `countries` VALUES(246, 'Turkey', 'TU', 'TR', 'TUR', '792', 'TR', 'Ankara ', 'Middle East ', 'Turkish', 'Turks', 'Turkish Lira', 'TRL', '66493970', 'Turkey', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Turkey');
INSERT INTO `countries` VALUES(247, 'Turkmenistan', 'TX', 'TM', 'TKM', '795', 'TM', 'Ashgabat ', 'Commonwealth of Independent States ', 'Turkmen', 'Turkmens', 'Manat', 'TMM', '4603244', 'Turkmenistan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Turkmenistan');
INSERT INTO `countries` VALUES(248, 'Turks and Caicos Islands', 'TK', 'TC', 'TCA', '796', 'TC', 'Cockburn Town ', 'Central America and the Caribbean ', '', '', 'US Dollar', 'USD', '18122', 'The Turks and Caicos Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Turks and Caicos Islands');
INSERT INTO `countries` VALUES(249, 'Tuvalu', 'TV', 'TV', 'TUV', '798', 'TV', 'Funafuti ', 'Oceania ', 'Tuvaluan', 'Tuvaluans', 'Australian Dollar', 'AUD', '10991', 'Tuvalu', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Tuvalu');
INSERT INTO `countries` VALUES(250, 'Uganda', 'UG', 'UG', 'UGA', '800', 'UG', 'Kampala ', 'Africa ', 'Ugandan', 'Ugandans', 'Uganda Shilling', 'UGX', '23985712', 'Uganda', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Uganda');
INSERT INTO `countries` VALUES(251, 'Ukraine', 'UP', 'UA', 'UKR', '804', 'UA', 'Kiev ', 'Commonwealth of Independent States ', 'Ukrainian', 'Ukrainians', 'Hryvnia', 'UAH', '48760474', 'The Ukraine', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Ukraine');
INSERT INTO `countries` VALUES(252, 'United Arab Emirates', 'AE', 'AE', 'ARE', '784', 'AE', 'Abu Dhabi ', 'Middle East ', 'Emirati', 'Emiratis', 'UAE Dirham', 'AED', '2407460', 'The United Arab Emirates', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'United Arab Emirates');
INSERT INTO `countries` VALUES(253, 'United Kingdom', 'UK', 'GB', 'GBR', '826', 'UK', 'London ', 'Europe ', 'British', 'Britons', 'Pound Sterling', 'GBP', '59647790', 'The United Kingdom', 'ISO includes Guernsey, Isle of Man, Jersey', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'United Kingdom(Great Britain)');
INSERT INTO `countries` VALUES(254, 'United States', 'US', 'US', 'USA', '840', 'US', 'Washington, DC ', 'North America ', 'American', 'Americans', 'US Dollar', 'USD', '278058881', 'The United States', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'United States of America(USA)');
INSERT INTO `countries` VALUES(255, 'United States Minor Outlying Islands', '--', 'UM', 'UMI', '581', 'UM', '', '', '', '', 'US Dollar', 'USD', '0', 'The United States Minor Outlying Islands', 'ISO includes Baker Island, Howland Island, Jarvis ', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'United States Minor Outlying');
INSERT INTO `countries` VALUES(256, 'Uruguay', 'UY', 'UY', 'URY', '858', 'UY', 'Montevideo ', 'South America ', 'Uruguayan', 'Uruguayans', 'Peso Uruguayo', 'UYU', '3360105', 'Uruguay', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Uruguay');
INSERT INTO `countries` VALUES(257, 'Uzbekistan', 'UZ', 'UZ', 'UZB', '860', 'UZ', 'Tashkent', 'Commonwealth of Independent States ', 'Uzbekistani', 'Uzbekistanis', 'Uzbekistan Sum', 'UZS', '25155064', 'Uzbekistan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Uzbekistan');
INSERT INTO `countries` VALUES(258, 'Vanuatu', 'NH', 'VU', 'VUT', '548', 'VU', 'Port-Vila ', 'Oceania ', 'Ni-Vanuatu', 'Ni-Vanuatu', 'Vatu', 'VUV', '192910', 'Vanuatu', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Vanuatu');
INSERT INTO `countries` VALUES(259, 'Venezuela', 'VE', 'VE', 'VEN', '862', 'VE', 'Caracas ', 'South America, Central America and the Caribbean ', 'Venezuelan', 'Venezuelans', 'Bolivar', 'VEB', '23916810', 'Venezuela', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Venezuela');
INSERT INTO `countries` VALUES(260, 'Vietnam', 'VM', 'VN', 'VNM', '704', 'VN', 'Hanoi ', 'Southeast Asia ', 'Vietnamese', 'Vietnamese', 'Dong', 'VND', '79939014', 'Vietnam', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Viet Nam');
INSERT INTO `countries` VALUES(261, 'Virgin Islands', 'VQ', 'VI', 'VIR', '850', 'VI', 'Charlotte Amalie ', 'Central America and the Caribbean ', 'Virgin Islander', 'Virgin Islanders', 'US Dollar', 'USD', '122211', 'The Virgin Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(262, 'Virgin Islands (UK)', '--', '--', '-- ', '--', '--', '', '', '', '', 'US Dollar', 'USD', '0', 'Virgin Islands (UK)', 'see British Virgin Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Virgin Islands British');
INSERT INTO `countries` VALUES(263, 'Virgin Islands (US)', '--', '--', '-- ', '--', '--', '', '', '', '', 'US Dollar', 'USD', '0', 'Virgin Islands (US)', 'see Virgin Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Virgin Islands US');
INSERT INTO `countries` VALUES(264, 'Wake Island', 'WQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', 'US Dollar', 'USD', '0', 'Wake Island', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(265, 'Wallis and Futuna', 'WF', 'WF', 'WLF', '876', 'WF', 'Mata-Utu', 'Oceania ', 'Wallis and Futuna Islander', 'Wallis and Futuna Islanders', 'CFP Franc', 'XPF', '15435', 'Wallis and Futuna', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Wallis and Futuna');
INSERT INTO `countries` VALUES(266, 'West Bank', 'WE', '--', '-- ', '--', '--', '', 'Middle East ', '', '', 'New Israeli Shekel ', 'ILS', '2090713', 'The West Bank', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(267, 'Western Sahara', 'WI', 'EH', 'ESH', '732', 'EH', '', 'Africa ', 'Sahrawian', 'Sahrawis', 'Moroccan Dirham', 'MAD', '250559', 'Western Sahara', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Western Sahara');
INSERT INTO `countries` VALUES(268, 'Western Samoa', '--', '--', '-- ', '--', '--', '', '', '', '', 'Tala', 'WST', '0', 'Western Samoa', 'see Samoa', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(269, 'World', '--', '--', '-- ', '--', '--', '', 'World, Time Zones ', '', '', '', '', '1862433264', 'The World', 'NULL', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(270, 'Yemen', 'YM', 'YE', 'YEM', '887', 'YE', 'Sanaa ', 'Middle East ', 'Yemeni', 'Yemenis', 'Yemeni Rial', 'YER', '18078035', 'Yemen', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Yemen');
INSERT INTO `countries` VALUES(271, 'Yugoslavia', 'YI', 'YU', 'YUG', '891', 'YU', 'Belgrade ', 'Europe ', 'Serbian', 'Serbs', 'Yugoslavian Dinar ', 'YUM', '10677290', 'Yugoslavia', 'NULL', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, '');
INSERT INTO `countries` VALUES(272, 'Zaire', '--', '--', '-- ', '--', '--', '', '', '', '', '', '', '0', 'Zaire', 'see Democratic Republic of the Congo', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Congo-Kinshasa(Zaire)');
INSERT INTO `countries` VALUES(273, 'Zambia', 'ZA', 'ZM', 'ZWB', '894', 'ZM', 'Lusaka ', 'Africa ', 'Zambian', 'Zambians', 'Kwacha', 'ZMK', '9770199', 'Zambia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Zambia');
INSERT INTO `countries` VALUES(274, 'Zimbabwe', 'ZI', 'ZW', 'ZWE', '716', 'ZW', 'Harare ', 'Africa ', 'Zimbabwean', 'Zimbabweans', 'Zimbabwe Dollar', 'ZWD', '11365366', 'Zimbabwe', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Zimbabwe');
INSERT INTO `countries` VALUES(275, 'Palestinian Territory, Occupied', '--', 'PS', 'PSE', '275', 'PS', '', '', '', '', '', '', '0', 'Palestine', 'NULL', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Palestine');

-- --------------------------------------------------------

--
-- Table structure for table `dresses`
--

CREATE TABLE `dresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Dumping data for table `dresses`
--

INSERT INTO `dresses` VALUES(1, 'Plaid', NULL, NULL);
INSERT INTO `dresses` VALUES(2, 'Stripes', NULL, NULL);
INSERT INTO `dresses` VALUES(3, 'Pink/Pastels', NULL, NULL);
INSERT INTO `dresses` VALUES(4, 'Skinny Jeans', NULL, NULL);
INSERT INTO `dresses` VALUES(5, 'Red', NULL, NULL);
INSERT INTO `dresses` VALUES(6, 'Graphics', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` VALUES(1, 'admin', '2013-06-02 14:14:05', '2013-06-02 14:14:05');
INSERT INTO `groups` VALUES(2, 'advertiser', '2013-06-02 14:14:28', '2013-06-02 14:14:28');
INSERT INTO `groups` VALUES(3, 'publisher', '2013-06-02 14:14:36', '2013-06-02 14:14:36');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `min_price` float NOT NULL,
  `created` datetime DEFAULT NULL COMMENT '   ',
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Dumping data for table `items`
--


-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `body_shape` enum('oval','rectangle','trapezoid') COLLATE utf8_bin NOT NULL,
  `shirt_size` enum('na','xs','s','m','l','xl','xxl') COLLATE utf8_bin NOT NULL,
  `waist_size` enum('28','30','32') COLLATE utf8_bin NOT NULL,
  `inseam` enum('na','28','30','32','34','36') COLLATE utf8_bin NOT NULL,
  `fit` enum('trim','relaxed') COLLATE utf8_bin DEFAULT NULL,
  `budget_id` int(10) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profiles_users1_idx` (`user_id`),
  KEY `fk_profiles_budgets1_idx` (`budget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Dumping data for table `profiles`
--


-- --------------------------------------------------------

--
-- Table structure for table `profiles_brands`
--

CREATE TABLE `profiles_brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int(10) unsigned NOT NULL,
  `profile_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profiles_brands_brands1_idx` (`brand_id`),
  KEY `fk_profiles_brands_profiles1_idx` (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Dumping data for table `profiles_brands`
--


-- --------------------------------------------------------

--
-- Table structure for table `profiles_dresses`
--

CREATE TABLE `profiles_dresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(10) unsigned NOT NULL,
  `dress_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profiles_dresses_profiles1_idx` (`profile_id`),
  KEY `fk_profiles_dresses_dresses1_idx` (`dress_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Dumping data for table `profiles_dresses`
--


-- --------------------------------------------------------

--
-- Table structure for table `profiles_styles`
--

CREATE TABLE `profiles_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(10) unsigned NOT NULL,
  `style_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profiles_styles_profiles_idx` (`profile_id`),
  KEY `fk_profiles_styles_styles1_idx` (`style_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Dumping data for table `profiles_styles`
--


-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `region` varchar(100) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `ADM1Code` varchar(50) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `last_updated_by` int(11) DEFAULT NULL,
  `country_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_regions_countries1_idx` (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Region table' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `regions`
--


-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `address_line1` varchar(45) COLLATE utf8_bin NOT NULL,
  `address_line2` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zipcode` varchar(7) COLLATE utf8_bin NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shipping_addresses_users1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Dumping data for table `shipping_addresses`
--


-- --------------------------------------------------------

--
-- Table structure for table `styles`
--

CREATE TABLE `styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `style` varchar(32) COLLATE utf8_bin NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dumping data for table `styles`
--

INSERT INTO `styles` VALUES(1, 'Casual', NULL, NULL);
INSERT INTO `styles` VALUES(2, 'Classic', NULL, NULL);
INSERT INTO `styles` VALUES(3, 'Preppy', NULL, NULL);
INSERT INTO `styles` VALUES(4, 'Hipster', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(32) COLLATE utf8_bin NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` VALUES(2, 'social', 4, '2013-06-02 17:29:55', '2013-06-02 17:29:55');
INSERT INTO `tags` VALUES(4, 'games', 4, '2013-06-02 17:46:02', '2013-06-02 17:46:02');
INSERT INTO `tags` VALUES(5, 'facebook', 4, '2013-06-02 17:46:54', '2013-06-02 17:46:54');
INSERT INTO `tags` VALUES(6, 'betting', 4, '2013-06-02 17:46:59', '2013-06-02 17:46:59');
INSERT INTO `tags` VALUES(7, 'sex', 4, '2013-06-02 17:57:52', '2013-06-02 17:57:52');
INSERT INTO `tags` VALUES(8, 'porn', 4, '2013-06-02 17:57:55', '2013-06-02 17:57:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `email` varchar(256) NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  `presignup_id` int(10) unsigned DEFAULT NULL,
  `facebook_id` bigint(20) unsigned DEFAULT NULL,
  `auth_token` varchar(256) NOT NULL,
  `twitter_id` bigint(20) unsigned DEFAULT NULL,
  `twitter_screen_name` varchar(16) DEFAULT NULL,
  `twitter_token` varchar(256) DEFAULT NULL,
  `twitter_secret` varchar(256) DEFAULT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `zipcode` varchar(7) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `address_1` varchar(100) NOT NULL,
  `address_2` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(2) DEFAULT NULL,
  `user_timezone` decimal(5,2) NOT NULL DEFAULT '-13.00',
  `paypal_email` varchar(256) DEFAULT NULL,
  `referral_url` varchar(256) DEFAULT NULL,
  `referrer` int(10) unsigned DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `password` varchar(64) CHARACTER SET utf8 NOT NULL,
  `password_reset` varchar(64) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `facebook_id` (`facebook_id`),
  UNIQUE KEY `unq_facebook_id` (`facebook_id`),
  UNIQUE KEY `unq_twitter_id` (`twitter_id`),
  KEY `fk_users_groups1_idx` (`group_id`),
  KEY `fk_users_presignups1_idx` (`presignup_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES(4, 'anikendra@gmail.com', 'anikendra@gmail.com', 1, NULL, NULL, '', NULL, NULL, NULL, NULL, '', '', '', '0000-00-00', NULL, '', '', '', '', NULL, -13.00, NULL, NULL, NULL, 1, '4c6064bc7386b8ace459a68ce456641bed6d6689', '', NULL, '2013-06-02 14:19:10', '2013-06-02 14:21:20');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `budgets_items`
--
ALTER TABLE `budgets_items`
  ADD CONSTRAINT `fk_budgets_items_budgets1` FOREIGN KEY (`budget_id`) REFERENCES `budgets` (`id`) ,
  ADD CONSTRAINT `fk_budgets_items_items1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `fk_profiles_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ,
  ADD CONSTRAINT `fk_profiles_budgets1` FOREIGN KEY (`budget_id`) REFERENCES `budgets` (`id`) ;

--
-- Constraints for table `profiles_brands`
--
ALTER TABLE `profiles_brands`
  ADD CONSTRAINT `fk_profiles_brands_brands1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ,
  ADD CONSTRAINT `fk_profiles_brands_profiles1` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ;

--
-- Constraints for table `profiles_dresses`
--
ALTER TABLE `profiles_dresses`
  ADD CONSTRAINT `fk_profiles_dresses_profiles1` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ,
  ADD CONSTRAINT `fk_profiles_dresses_dresses1` FOREIGN KEY (`dress_id`) REFERENCES `dresses` (`id`) ;

--
-- Constraints for table `profiles_styles`
--
ALTER TABLE `profiles_styles`
  ADD CONSTRAINT `fk_profiles_styles_profiles` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`id`) ,
  ADD CONSTRAINT `fk_profiles_styles_styles1` FOREIGN KEY (`style_id`) REFERENCES `styles` (`id`) ;

--
-- Constraints for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD CONSTRAINT `fk_shipping_addresses_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);
