-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 04, 2013 at 02:19 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vidoofy`
--

-- --------------------------------------------------------

--
-- Table structure for table `acos`
--

DROP TABLE IF EXISTS `acos`;
CREATE TABLE IF NOT EXISTS `acos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `acos`
--


-- --------------------------------------------------------

--
-- Table structure for table `aros`
--

DROP TABLE IF EXISTS `aros`;
CREATE TABLE IF NOT EXISTS `aros` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `foreign_key` int(10) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `aros`
--

INSERT INTO `aros` (`id`, `parent_id`, `model`, `foreign_key`, `alias`, `lft`, `rght`) VALUES
(1, NULL, 'Group', 1, NULL, 1, 4),
(2, NULL, 'Group', 2, NULL, 5, 6),
(3, NULL, 'Group', 3, NULL, 7, 8),
(4, 1, 'User', 4, NULL, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `aros_acos`
--

DROP TABLE IF EXISTS `aros_acos`;
CREATE TABLE IF NOT EXISTS `aros_acos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aro_id` int(10) NOT NULL,
  `aco_id` int(10) NOT NULL,
  `_create` varchar(2) NOT NULL DEFAULT '0',
  `_read` varchar(2) NOT NULL DEFAULT '0',
  `_update` varchar(2) NOT NULL DEFAULT '0',
  `_delete` varchar(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_aros_acos_aros1_idx` (`aro_id`),
  KEY `fk_aros_acos_acos1_idx` (`aco_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `aros_acos`
--


-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
CREATE TABLE IF NOT EXISTS `campaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `youtube_url` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `cpv` float NOT NULL,
  `budget` float NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `paused` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_campaigns_users1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `campaigns`
--


-- --------------------------------------------------------

--
-- Table structure for table `campaign_details`
--

DROP TABLE IF EXISTS `campaign_details`;
CREATE TABLE IF NOT EXISTS `campaign_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(10) unsigned NOT NULL,
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `budget_consumed` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_campaign_details_campaigns1_idx` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `campaign_details`
--


-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
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
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `contacts`
--


-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
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

INSERT INTO `countries` (`id`, `country`, `FIPS104`, `ISO2`, `ISO3`, `ISON`, `internet`, `capital`, `map_reference`, `nationality_singular`, `nationality_plural`, `currency`, `currency_code`, `population`, `title`, `comment`, `created`, `created_by`, `modified`, `last_updated_by`, `flag`) VALUES
(1, 'Afghanistan', 'AF', 'AF', 'AFG', '4', 'AF', 'Kabul ', 'Asia ', 'Afghan', 'Afghans', 'Afghani ', 'AFA', '26813057', 'Afghanistan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Afghanistan'),
(2, 'Albania', 'AL', 'AL', 'ALB', '8', 'AL', 'Tirana ', 'Europe ', 'Albanian', 'Albanians', 'Lek ', 'ALL', '3510484', 'Albania', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Albania'),
(3, 'Algeria', 'AG', 'DZ', 'DZA', '12', 'DZ', 'Algiers ', 'Africa ', 'Algerian', 'Algerians', 'Algerian Dinar ', 'DZD', '31736053', 'Algeria', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Algeria'),
(4, 'American Samoa', 'AQ', 'AS', 'ASM', '16', 'AS', 'Pago Pago ', 'Oceania ', 'American Samoan', 'American Samoans', 'US Dollar', 'USD', '67084', 'American Samoa', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'American Samoa'),
(5, 'Andorra', 'AN', 'AD', 'AND', '20', 'AD', 'Andorra la Vella ', 'Europe ', 'Andorran', 'Andorrans', 'Euro', 'EUR', '67627', 'Andorra', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Andorra'),
(6, 'Angola', 'AO', 'AO', 'AGO', '24', 'AO', 'Luanda ', 'Africa ', 'Angolan', 'Angolans', 'Kwanza ', 'AOA', '10366031', 'Angola', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Angola'),
(7, 'Anguilla', 'AV', 'AI', 'AIA', '660', 'AI', 'The Valley ', 'Central America and the Caribbean ', 'Anguillan', 'Anguillans', 'East Caribbean Dollar ', 'XCD', '12132', 'Anguilla', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Anguilla'),
(8, 'Antarctica', 'AY', 'AQ', 'ATA', '10', 'AQ', '', 'Antarctic Region ', '', '', '', '', '0', 'Antarctica', 'ISO defines as the territory south of 60 degrees s', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Antarctica'),
(9, 'Antigua and Barbuda', 'AC', 'AG', 'ATG', '28', 'AG', 'Saint John''s ', 'Central America and the Caribbean ', 'Antiguan and Barbudan', 'Antiguans and Barbudans', 'East Caribbean Dollar ', 'XCD', '66970', 'Antigua and Barbuda', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Antigua & Barbuda'),
(10, 'Argentina', 'AR', 'AR', 'ARG', '32', 'AR', 'Buenos Aires ', 'South America ', 'Argentine', 'Argentines', 'Argentine Peso ', 'ARS', '37384816', 'Argentina', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Argentina'),
(11, 'Armenia', 'AM', 'AM', 'ARM', '51', 'AM', 'Yerevan ', 'Commonwealth of Independent States ', 'Armenian', 'Armenians', 'Armenian Dram ', 'AMD', '3336100', 'Armenia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Armenia'),
(12, 'Aruba', 'AA', 'AW', 'ABW', '533', 'AW', 'Oranjestad ', 'Central America and the Caribbean ', 'Aruban', 'Arubans', 'Aruban Guilder', 'AWG', '70007', 'Aruba', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Aruba'),
(13, 'Ashmore and Cartier', 'AT', '--', '-- ', '--', '--', '', 'Southeast Asia ', '', '', '', '', '0', 'Ashmore and Cartier', 'ISO includes with Australia', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(14, 'Australia', 'AS', 'AU', 'AUS', '36', 'AU', 'Canberra ', 'Oceania ', 'Australian', 'Australians', 'Australian dollar ', 'AUD', '19357594', 'Australia', 'ISO includes Ashmore and Cartier Islands,Coral Sea', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Australia'),
(15, 'Austria', 'AU', 'AT', 'AUT', '40', 'AT', 'Vienna ', 'Europe ', 'Austrian', 'Austrians', 'Euro', 'EUR', '8150835', 'Austria', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Austria'),
(16, 'Azerbaijan', 'AJ', 'AZ', 'AZE', '31', 'AZ', 'Baku (Baki) ', 'Commonwealth of Independent States ', 'Azerbaijani', 'Azerbaijanis', 'Azerbaijani Manat ', 'AZM', '7771092', 'Azerbaijan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Azerbaijan'),
(17, 'The Bahamas', 'BF', 'BS', 'BHS', '44', 'BS', 'Nassau ', 'Central America and the Caribbean ', 'Bahamian', 'Bahamians', 'Bahamian Dollar ', 'BSD', '297852', 'The Bahamas', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'The Bahamas'),
(18, 'Bahrain', 'BA', 'BH', 'BHR', '48', 'BH', 'Manama ', 'Middle East ', 'Bahraini', 'Bahrainis', 'Bahraini Dinar ', 'BHD', '645361', 'Bahrain', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bahrain'),
(19, 'Baker Island', 'FQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', '', '', '0', 'Baker Island', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(20, 'Bangladesh', 'BG', 'BD', 'BGD', '50', 'BD', 'Dhaka ', 'Asia ', 'Bangladeshi', 'Bangladeshis', 'Taka ', 'BDT', '131269860', 'Bangladesh', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bangladesh'),
(21, 'Barbados', 'BB', 'BB', 'BRB', '52', 'BB', 'Bridgetown ', 'Central America and the Caribbean ', 'Barbadian', 'Barbadians', 'Barbados Dollar', 'BBD', '275330', 'Barbados', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Barbados'),
(22, 'Bassas da India', 'BS', '--', '-- ', '--', '--', '', 'Africa ', '', '', '', '', '0', 'Bassas da India', 'ISO includes with the Miscellaneous (French) India', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(23, 'Belarus', 'BO', 'BY', 'BLR', '112', 'BY', 'Minsk ', 'Commonwealth of Independent States ', 'Belarusian', 'Belarusians', 'Belarussian Ruble', 'BYR', '10350194', 'Belarus', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Belarus'),
(24, 'Belgium', 'BE', 'BE', 'BEL', '56', 'BE', 'Brussels ', 'Europe ', 'Belgian', 'Belgians', 'Euro', 'EUR', '10258762', 'Belgium', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Belgium'),
(25, 'Belize', 'BH', 'BZ', 'BLZ', '84', 'BZ', 'Belmopan ', 'Central America and the Caribbean ', 'Belizean', 'Belizeans', 'Belize Dollar', 'BZD', '256062', 'Belize', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Belize'),
(26, 'Benin', 'BN', 'BJ', 'BEN', '204', 'BJ', 'Porto-Novo  ', 'Africa ', 'Beninese', 'Beninese', 'CFA Franc BCEAO', 'XOF', '6590782', 'Benin', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Benin'),
(27, 'Bermuda', 'BD', 'BM', 'BMU', '60', 'BM', 'Hamilton ', 'North America ', 'Bermudian', 'Bermudians', 'Bermudian Dollar ', 'BMD', '63503', 'Bermuda', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bermuda'),
(28, 'Bhutan', 'BT', 'BT', 'BTN', '64', 'BT', 'Thimphu ', 'Asia ', 'Bhutanese', 'Bhutanese', 'Ngultrum', 'BTN', '2049412', 'Bhutan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bhutan'),
(29, 'Bolivia', 'BL', 'BO', 'BOL', '68', 'BO', 'La Paz /Sucre ', 'South America ', 'Bolivian', 'Bolivians', 'Boliviano ', 'BOB', '8300463', 'Bolivia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bolivia'),
(30, 'Bosnia and Herzegovina', 'BK', 'BA', 'BIH', '70', 'BA', 'Sarajevo ', 'Bosnia and Herzegovina, Europe ', 'Bosnian and Herzegovinian', 'Bosnians and Herzegovinians', 'Convertible Marka', 'BAM', '3922205', 'Bosnia and Herzegovina', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bosnia & Herzegovina'),
(31, 'Botswana', 'BC', 'BW', 'BWA', '72', 'BW', 'Gaborone ', 'Africa ', 'Motswana', 'Batswana', 'Pula ', 'BWP', '1586119', 'Botswana', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Botswana'),
(32, 'Bouvet Island', 'BV', 'BV', 'BVT', '74', 'BV', '', 'Antarctic Region ', '', '', 'Norwegian Krone ', 'NOK', '0', 'Bouvet Island', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bouvet Island'),
(33, 'Brazil', 'BR', 'BR', 'BRA', '76', 'BR', 'Brasilia ', 'South America ', 'Brazilian', 'Brazilians', 'Brazilian Real ', 'BRL', '174468575', 'Brazil', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Brazil'),
(34, 'British Indian Ocean Territory', 'IO', 'IO', 'IOT', '86', 'IO', '', 'World ', '', '', 'US Dollar', 'USD', '0', 'The British Indian Ocean Territory', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'British Indian Ocean Territory'),
(35, 'British Virgin Islands', 'VI', 'VG', 'VGB', '92', 'VG', 'Road Town ', 'Central America and the Caribbean ', 'British Virgin Islander', 'British Virgin Islanders', 'US Dollar', 'USD', '20812', 'The British Virgin Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(36, 'Brunei Darussalam', 'BX', 'BN', 'BRN', '96', 'BN', '', '', '', '', 'Brunei Dollar', 'BND', '372361', 'Brunei', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Brunei Darussalam'),
(37, 'Bulgaria', 'BU', 'BG', 'BGR', '100', 'BG', 'Sofia ', 'Europe ', 'Bulgarian', 'Bulgarians', 'Lev ', 'BGN', '7707495', 'Bulgaria', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Bulgaria'),
(38, 'Burkina Faso', 'UV', 'BF', 'BFA', '854', 'BF', 'Ouagadougou ', 'Africa ', 'Burkinabe', 'Burkinabe', 'CFA Franc BCEAO', 'XOF', '12272289', 'Burkina Faso', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Burkina Faso'),
(39, 'Burma', 'BM', 'MM', 'MMR', '104', 'MM', 'Rangoon ', 'Southeast Asia ', 'Burmese', 'Burmese', 'kyat ', 'MMK', '41994678', 'Burma', 'ISO uses the name Myanmar', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(40, 'Burundi', 'BY', 'BI', 'BDI', '108', 'BI', 'Bujumbura ', 'Africa ', 'Burundi', 'Burundians', 'Burundi Franc ', 'BIF', '6223897', 'Burundi', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Burundi'),
(41, 'Cambodia', 'CB', 'KH', 'KHM', '116', 'KH', 'Phnom Penh ', 'Southeast Asia ', 'Cambodian', 'Cambodians', 'Riel ', 'KHR', '12491501', 'Cambodia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cambodia'),
(42, 'Cameroon', 'CM', 'CM', 'CMR', '120', 'CM', 'Yaounde ', 'Africa ', 'Cameroonian', 'Cameroonians', 'CFA Franc BEAC', 'XAF', '15803220', 'Cameroon', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cameroon'),
(43, 'Canada', 'CA', 'CA', 'CAN', '124', 'CA', 'Ottawa ', 'North America ', 'Canadian', 'Canadians', 'Canadian Dollar ', 'CAD', '31592805', 'Canada', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Canada'),
(44, 'Cape Verde', 'CV', 'CV', 'CPV', '132', 'CV', 'Praia ', 'World ', 'Cape Verdean', 'Cape Verdeans', 'Cape Verdean Escudo ', 'CVE', '405163', 'Cape Verde', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cape Verde'),
(45, 'Cayman Islands', 'CJ', 'KY', 'CYM', '136', 'KY', 'George Town ', 'Central America and the Caribbean ', 'Caymanian', 'Caymanians', 'Cayman Islands Dollar', 'KYD', '35527', 'The Cayman Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cayman Islands'),
(46, 'Central African Republic', 'CT', 'CF', 'CAF', '140', 'CF', 'Bangui ', 'Africa ', 'Central African', 'Central Africans', 'CFA Franc BEAC', 'XAF', '3576884', 'The Central African Republic', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Central African Republic'),
(47, 'Chad', 'CD', 'TD', 'TCD', '148', 'TD', 'N''Djamena ', 'Africa ', 'Chadian', 'Chadians', 'CFA Franc BEAC', 'XAF', '8707078', 'Chad', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Chad'),
(48, 'Chile', 'CI', 'CL', 'CHL', '152', 'CL', 'Santiago ', 'South America ', 'Chilean', 'Chileans', 'Chilean Peso ', 'CLP', '15328467', 'Chile', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Chile'),
(49, 'China', 'CH', 'CN', 'CHN', '156', 'CN', 'Beijing ', 'Asia ', 'Chinese', 'Chinese', 'Yuan Renminbi', 'CNY', '1273111290', 'China', 'see also Taiwan', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'China'),
(50, 'Christmas Island', 'KT', 'CX', 'CXR', '162', 'CX', 'The Settlement ', 'Southeast Asia ', 'Christmas Island', 'Christmas Islanders', 'Australian Dollar ', 'AUD', '2771', 'Christmas Island', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Christmas Island'),
(51, 'Clipperton Island', 'IP', '--', '-- ', '--', '--', '', 'World ', '', '', '', '', '0', 'Clipperton Island', 'ISO includes with French Polynesia', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(52, 'Cocos (Keeling) Islands', 'CK', 'CC', 'CCK', '166', 'CC', 'West Island ', 'Southeast Asia ', 'Cocos Islander', 'Cocos Islanders', 'Australian Dollar ', 'AUD', '633', 'The Cocos Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cocos (Keeling) Islands'),
(53, 'Colombia', 'CO', 'CO', 'COL', '170', 'CO', 'Bogota ', 'South America, Central America and the Caribbean ', 'Colombian', 'Colombians', 'Colombian Peso ', 'COP', '40349388', 'Colombia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Colombia'),
(54, 'Comoros', 'CN', 'KM', 'COM', '174', 'KM', 'Moroni ', 'Africa ', 'Comoran', 'Comorans', 'Comoro Franc', 'KMF', '596202', 'Comoros', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Comoros'),
(55, 'Congo, Democratic Republic of the', 'CG', 'CD', 'COD', '180', 'CD', 'Kinshasa ', 'Africa ', 'Congolese', 'Congolese', 'Franc Congolais', 'CDF', '53624718', 'Democratic Republic of the Congo', 'formerly Zaire', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Congo-Brazzaville'),
(56, 'Congo, Republic of the', 'CF', 'CG', 'COG', '178', 'CG', 'Brazzaville ', 'Africa ', 'Congolese', 'Congolese', 'CFA Franc BEAC', 'XAF', '2894336', 'Republic of the Congo', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Congo-Brazzaville'),
(57, 'Cook Islands', 'CW', 'CK', 'COK', '184', 'CK', 'Avarua ', 'Oceania ', 'Cook Islander', 'Cook Islanders', 'New Zealand Dollar ', 'NZD', '20611', 'The Cook Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cook Islands'),
(58, 'Coral Sea Islands', 'CR', '--', '-- ', '--', '--', '', 'Oceania ', '', '', '', '', '0', 'The Coral Sea Islands', 'ISO includes with Australia', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(59, 'Costa Rica', 'CS', 'CR', 'CRI', '188', 'CR', 'San Jose ', 'Central America and the Caribbean ', 'Costa Rican', 'Costa Ricans', 'Costa Rican Colon', 'CRC', '3773057', 'Costa Rica', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Costa Rica'),
(60, 'Cote d''Ivoire', 'IV', 'CI', 'CIV', '384', 'CI', 'Yamoussoukro', 'Africa ', 'Ivorian', 'Ivorians', 'CFA Franc BCEAO', 'XOF', '16393221', 'Cote d''Ivoire', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cote d''Ivoire'),
(61, 'Croatia', 'HR', 'HR', 'HRV', '191', 'HR', 'Zagreb ', 'Europe ', 'Croatian', 'Croats', 'Kuna', 'HRK', '4334142', 'Croatia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Croatia'),
(62, 'Cuba', 'CU', 'CU', 'CUB', '192', 'CU', 'Havana ', 'Central America and the Caribbean ', 'Cuban', 'Cubans', 'Cuban Peso', 'CUP', '11184023', 'Cuba', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cuba'),
(63, 'Cyprus', 'CY', 'CY', 'CYP', '196', 'CY', 'Nicosia ', 'Middle East ', 'Cypriot', 'Cypriots', 'Cyprus Pound', 'CYP', '762887', 'Cyprus', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Cyprus'),
(64, 'Czech Republic', 'EZ', 'CZ', 'CZE', '203', 'CZ', 'Prague ', 'Europe ', 'Czech', 'Czechs', 'Czech Koruna', 'CZK', '10264212', 'The Czech Republic', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Czech Republic'),
(65, 'Denmark', 'DA', 'DK', 'DNK', '208', 'DK', 'Copenhagen ', 'Europe ', 'Danish', 'Danes', 'Danish Krone', 'DKK', '5352815', 'Denmark', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Denmark'),
(66, 'Djibouti', 'DJ', 'DJ', 'DJI', '262', 'DJ', 'Djibouti ', 'Africa ', 'Djiboutian', 'Djiboutians', 'Djibouti Franc', 'DJF', '460700', 'Djibouti', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Djibouti'),
(67, 'Dominica', 'DO', 'DM', 'DMA', '212', 'DM', 'Roseau ', 'Central America and the Caribbean ', 'Dominican', 'Dominicans', 'East Caribbean Dollar', 'XCD', '70786', 'Dominica', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Dominica'),
(68, 'Dominican Republic', 'DR', 'DO', 'DOM', '214', 'DO', 'Santo Domingo ', 'Central America and the Caribbean ', 'Dominican', 'Dominicans', 'Dominican Peso', 'DOP', '8581477', 'The Dominican Republic', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Dominican Republic'),
(69, 'East Timor', 'TT', 'TL', 'TLS', '626', 'TP', '', '', '', '', 'Timor Escudo', 'TPE', '1040880', 'East Timor', 'NULL', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(70, 'Ecuador', 'EC', 'EC', 'ECU', '218', 'EC', 'Quito ', 'South America ', 'Ecuadorian', 'Ecuadorians', 'US Dollar', 'USD', '13183978', 'Ecuador', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Ecuador'),
(71, 'Egypt', 'EG', 'EG', 'EGY', '818', 'EG', 'Cairo ', 'Africa ', 'Egyptian', 'Egyptians', 'Egyptian Pound ', 'EGP', '69536644', 'Egypt', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Egypt'),
(72, 'El Salvador', 'ES', 'SV', 'SLV', '222', 'SV', 'San Salvador ', 'Central America and the Caribbean ', 'Salvadoran', 'Salvadorans', 'El Salvador Colon', 'SVC', '6237662', 'El Salvador', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'El Salvador'),
(73, 'Equatorial Guinea', 'EK', 'GQ', 'GNQ', '226', 'GQ', 'Malabo ', 'Africa ', 'Equatorial Guinean', 'Equatorial Guineans', 'CFA Franc BEAC', 'XAF', '486060', 'Equatorial Guinea', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Equatorial Guinea'),
(74, 'Eritrea', 'ER', 'ER', 'ERI', '232', 'ER', 'Asmara ', 'Africa ', 'Eritrean', 'Eritreans', 'Nakfa', 'ERN', '4298269', 'Eritrea', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Eritrea'),
(75, 'Estonia', 'EN', 'EE', 'EST', '233', 'EE', 'Tallinn ', 'Europe ', 'Estonian', 'Estonians', 'Kroon', 'EEK', '1423316', 'Estonia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Estonia'),
(76, 'Ethiopia', 'ET', 'ET', 'ETH', '231', 'ET', 'Addis Ababa ', 'Africa ', 'Ethiopian', 'Ethiopians', 'Ethiopian Birr', 'ETB', '65891874', 'Ethiopia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Ethiopia'),
(77, 'Europa Island', 'EU', '--', '-- ', '--', '--', '', 'Africa ', '', '', '', '', '0', 'Europa Island', 'ISO includes with the Miscellaneous (French) India', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(78, 'Falkland Islands (Islas Malvinas)', 'FK', 'FK', 'FLK', '238', 'FK', 'Stanley', 'South America', 'Falkland Island', 'Falkland Islanders', 'Falkland Islands Pound', 'FKP', '2895', 'The Falkland Islands ', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Falkland (Malvinas)'),
(79, 'Faroe Islands', 'FO', 'FO', 'FRO', '234', 'FO', 'Torshavn ', 'Europe ', 'Faroese', 'Faroese', 'Danish Krone ', 'DKK', '45661', 'The Faroe Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Faroes'),
(80, 'Fiji', 'FJ', 'FJ', 'FJI', '242', 'FJ', 'Suva ', 'Oceania ', 'Fijian', 'Fijians', 'Fijian Dollar ', 'FJD', '844330', 'Fiji', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Fiji'),
(81, 'Finland', 'FI', 'FI', 'FIN', '246', 'FI', 'Helsinki ', 'Europe ', 'Finnish', 'Finns', 'Euro', 'EUR', '5175783', 'Finland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Finland'),
(82, 'France', 'FR', 'FR', 'FRA', '250', 'FR', 'Paris ', 'Europe ', 'Frenchman', 'Frenchmen', 'Euro', 'EUR', '59551227', 'France', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'France'),
(83, 'France, Metropolitan', '--', '--', '-- ', '--', 'FX', '', '', '', '', 'Euro', 'EUR', '0', 'Metropolitan France', 'ISO limits to the European part of France, excludi', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'France'),
(84, 'French Guiana', 'FG', 'GF', 'GUF', '254', 'GF', 'Cayenne ', 'South America ', 'French Guianese', 'French Guianese', 'Euro', 'EUR', '177562', 'French Guiana', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'French Guiana'),
(85, 'French Polynesia', 'FP', 'PF', 'PYF', '258', 'PF', 'Papeete ', 'Oceania ', 'French Polynesian', 'French Polynesians', 'CFP Franc', 'XPF', '253506', 'French Polynesia', 'ISO includes Clipperton Island', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(86, 'French Southern and Antarctic Lands', 'FS', 'TF', 'ATF', '260', 'TF', '', 'Antarctic Region ', '', '', 'Euro', 'EUR', '0', 'The French Southern and Antarctic Lands', 'FIPS 10-4 does not include the French-claimed port', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'French Southern Territories'),
(87, 'Gabon', 'GB', 'GA', 'GAB', '266', 'GA', 'Libreville ', 'Africa ', 'Gabonese', 'Gabonese', 'CFA Franc BEAC', 'XAF', '1221175', 'Gabon', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Gabon'),
(88, 'The Gambia', 'GA', 'GM', 'GMB', '270', 'GM', 'Banjul ', 'Africa ', 'Gambian', 'Gambians', 'Dalasi', 'GMD', '1411205', 'The Gambia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Gambia'),
(89, 'Gaza Strip', 'GZ', '--', '-- ', '--', '--', '', 'Middle East ', '', '', 'New Israeli Shekel ', 'ILS', '1178119', 'The Gaza Strip', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(90, 'Georgia', 'GG', 'GE', 'GEO', '268', 'GE', 'T''bilisi ', 'Commonwealth of Independent States ', 'Georgian', 'Georgians', 'Lari', 'GEL', '4989285', 'Georgia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Georgia'),
(91, 'Germany', 'GM', 'DE', 'DEU', '276', 'DE', 'Berlin ', 'Europe ', 'German', 'Germans', 'Euro', 'EUR', '83029536', 'Deutschland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Germany'),
(92, 'Ghana', 'GH', 'GH', 'GHA', '288', 'GH', 'Accra ', 'Africa ', 'Ghanaian', 'Ghanaians', 'Cedi', 'GHC', '19894014', 'Ghana', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Ghana'),
(93, 'Gibraltar', 'GI', 'GI', 'GIB', '292', 'GI', 'Gibraltar ', 'Europe ', 'Gibraltar', 'Gibraltarians', 'Gibraltar Pound', 'GIP', '27649', 'Gibraltar', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Gibraltar'),
(94, 'Glorioso Islands', 'GO', '--', '-- ', '--', '--', '', 'Africa ', '', '', '', '', '0', 'The Glorioso Islands', 'ISO includes with the Miscellaneous (French) India', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(95, 'Greece', 'GR', 'GR', 'GRC', '300', 'GR', 'Athens ', 'Europe ', 'Greek', 'Greeks', 'Euro', 'EUR', '10623835', 'Greece', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Greece'),
(96, 'Greenland', 'GL', 'GL', 'GRL', '304', 'GL', 'Nuuk ', 'Arctic Region ', 'Greenlandic', 'Greenlanders', 'Danish Krone', 'DKK', '56352', 'Greenland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Greenland'),
(97, 'Grenada', 'GJ', 'GD', 'GRD', '308', 'GD', 'Saint George''s ', 'Central America and the Caribbean ', 'Grenadian', 'Grenadians', 'East Caribbean Dollar', 'XCD', '89227', 'Grenada', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Grenada'),
(98, 'Guadeloupe', 'GP', 'GP', 'GLP', '312', 'GP', 'Basse-Terre ', 'Central America and the Caribbean ', 'Guadeloupe', 'Guadeloupians', 'Euro', 'EUR', '431170', 'Guadeloupe', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Guadeloupe'),
(99, 'Guam', 'GQ', 'GU', 'GUM', '316', 'GU', 'Hagatna', 'Oceania ', 'Guamanian', 'Guamanians', 'US Dollar', 'USD', '157557', 'Guam', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Guam'),
(100, 'Guatemala', 'GT', 'GT', 'GTM', '320', 'GT', 'Guatemala ', 'Central America and the Caribbean ', 'Guatemalan', 'Guatemalans', 'Quetzal', 'GTQ', '12974361', 'Guatemala', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Guatemala'),
(101, 'Guernsey', 'GK', '--', '-- ', '--', 'GG', 'Saint Peter Port ', 'Europe ', 'Channel Islander', 'Channel Islanders', 'Pound Sterling', 'GBP', '64342', 'Guernsey', 'ISO includes with the United Kingdom', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Guernsey'),
(102, 'Guinea', 'GV', 'GN', 'GIN', '324', 'GN', 'Conakry ', 'Africa ', 'Guinean', 'Guineans', 'Guinean Franc ', 'GNF', '7613870', 'Guinea', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Guinea'),
(103, 'Guinea-Bissau', 'PU', 'GW', 'GNB', '624', 'GW', 'Bissau ', 'Africa ', 'Guinean', 'Guineans', 'CFA Franc BCEAO', 'XOF', '1315822', 'Guinea-Bissau', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Guinea-Bissau'),
(104, 'Guyana', 'GY', 'GY', 'GUY', '328', 'GY', 'Georgetown ', 'South America ', 'Guyanese', 'Guyanese', 'Guyana Dollar', 'GYD', '697181', 'Guyana', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Guyana'),
(105, 'Haiti', 'HA', 'HT', 'HTI', '332', 'HT', 'Port-au-Prince ', 'Central America and the Caribbean ', 'Haitian', 'Haitians', 'Gourde', 'HTG', '6964549', 'Haiti', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Haiti'),
(106, 'Heard Island and McDonald Islands', 'HM', 'HM', 'HMD', '334', 'HM', '', 'Antarctic Region ', '', '', 'Australian Dollar', 'AUD', '0', 'The Heard Island and McDonald Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Heard Island and McDonald'),
(107, 'Holy See (Vatican City)', 'VT', 'VA', 'VAT', '336', 'VA', 'Vatican City ', 'Europe ', '', '', 'Euro', 'EUR', '890', 'The Vatican City', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Vatican City'),
(108, 'Honduras', 'HO', 'HN', 'HND', '340', 'HN', 'Tegucigalpa ', 'Central America and the Caribbean ', 'Honduran', 'Hondurans', 'Lempira', 'HNL', '6406052', 'Honduras', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Honduras'),
(109, 'Hong Kong (SAR)', 'HK', 'HK', 'HKG', '344', 'HK', '', 'Southeast Asia ', '', '', 'Hong Kong Dollar ', 'HKD', '0', 'Xianggang ', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Hong Kong'),
(110, 'Howland Island', 'HQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', '', '', '7210505', 'Howland Island', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(111, 'Hungary', 'HU', 'HU', 'HUN', '348', 'HU', 'Budapest ', 'Europe ', 'Hungarian', 'Hungarians', 'Forint', 'HUF', '10106017', 'Hungary', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Hungary'),
(112, 'Iceland', 'IC', 'IS', 'ISL', '352', 'IS', 'Reykjavik ', 'Arctic Region ', 'Icelandic', 'Icelanders', 'Iceland Krona', 'ISK', '277906', 'Iceland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Iceland'),
(113, 'India', 'IN', 'IN', 'IND', '356', 'IN', 'New Delhi ', 'Asia ', 'Indian', 'Indians', 'Indian Rupee ', 'INR', '1029991145', 'India', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'India'),
(114, 'Indonesia', 'ID', 'ID', 'IDN', '360', 'ID', 'Jakarta ', 'Southeast Asia ', 'Indonesian', 'Indonesians', 'Rupiah', 'IDR', '228437870', 'Indonesia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Indonezia'),
(115, 'Iran', 'IR', 'IR', 'IRN', '364', 'IR', 'Tehran ', 'Middle East ', 'Iranian', 'Iranians', 'Iranian Rial', 'IRR', '66128965', 'Iran', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Iran'),
(116, 'Iraq', 'IZ', 'IQ', 'IRQ', '368', 'IQ', 'Baghdad ', 'Middle East ', 'Iraqi', 'Iraqis', 'Iraqi Dinar', 'IQD', '23331985', 'Iraq', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Iraq'),
(117, 'Ireland', 'EI', 'IE', 'IRL', '372', 'IE', 'Dublin ', 'Europe ', 'Irish', 'Irishmen', 'Euro', 'EUR', '3840838', 'Ireland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Ireland'),
(118, 'Israel', 'IS', 'IL', 'ISR', '376', 'IL', 'Jerusalem', 'Middle East ', 'Israeli', 'Israelis', 'New Israeli Sheqel', 'ILS', '5938093', 'Israel', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Israel'),
(119, 'Italy', 'IT', 'IT', 'ITA', '380', 'IT', 'Rome ', 'Europe ', 'Italian', 'Italians', 'Euro', 'EUR', '57679825', 'Italia ', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Italy'),
(120, 'Jamaica', 'JM', 'JM', 'JAM', '388', 'JM', 'Kingston ', 'Central America and the Caribbean ', 'Jamaican', 'Jamaicans', 'Jamaican dollar ', 'JMD', '2665636', 'Jamaica', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Jamaica'),
(121, 'Jan Mayen', 'JN', '--', '-- ', '--', '--', '', 'Arctic Region ', '', '', 'Norway Kroner', 'NOK', '0', 'Jan Mayen', 'ISO includes with Svalbard', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(122, 'Japan', 'JA', 'JP', 'JPN', '392', 'JP', 'Tokyo ', 'Asia ', 'Japanese', 'Japanese', 'Yen ', 'JPY', '126771662', 'Japan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Japan'),
(123, 'Jarvis Island', 'DQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', '', '', '0', 'Jarvis Island', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(124, 'Jersey', 'JE', '--', '-- ', '--', 'JE', 'Saint Helier ', 'Europe ', 'Channel Islander', 'Channel Islanders', 'Pound Sterling', 'GBP', '89361', 'Jersey', 'ISO includes with the United Kingdom', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Jersey'),
(125, 'Johnston Atoll', 'JQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', '', '', '0', 'Johnston Atoll', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(126, 'Jordan', 'JO', 'JO', 'JOR', '400', 'JO', 'Amman ', 'Middle East ', 'Jordanian', 'Jordanians', 'Jordanian Dinar', 'JOD', '5153378', 'Jordan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Jordan'),
(127, 'Juan de Nova Island', 'JU', '--', '-- ', '--', '--', '', 'Africa ', '', '', '', '', '0', 'Juan de Nova Island', 'ISO includes with the Miscellaneous (French) India', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(128, 'Kazakhstan', 'KZ', 'KZ', 'KAZ', '398', 'KZ', 'Astana ', 'Commonwealth of Independent States ', 'Kazakhstani', 'Kazakhstanis', 'Tenge', 'KZT', '16731303', 'Kazakhstan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Kazakhstan'),
(129, 'Kenya', 'KE', 'KE', 'KEN', '404', 'KE', 'Nairobi ', 'Africa ', 'Kenyan', 'Kenyans', 'Kenyan shilling ', 'KES', '30765916', 'Kenya', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Kenya'),
(130, 'Kingman Reef', 'KQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', '', '', '0', 'Kingman Reef', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(131, 'Kiribati', 'KR', 'KI', 'KIR', '296', 'KI', 'Tarawa ', 'Oceania ', 'I-Kiribati', 'I-Kiribati', 'Australian dollar ', 'AUD', '94149', 'Kiribati', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Kiribati'),
(132, 'Korea, North', 'KN', 'KP', 'PRK', '408', 'KP', 'P''yongyang ', 'Asia ', 'Korean', 'Koreans', 'North Korean Won', 'KPW', '21968228', 'North Korea', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'North Korea'),
(133, 'Korea, South', 'KS', 'KR', 'KOR', '410', 'KR', 'Seoul ', 'Asia ', 'Korean', 'Koreans', 'Won', 'KRW', '47904370', 'South Korea', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'South Korea'),
(134, 'Kuwait', 'KU', 'KW', 'KWT', '414', 'KW', 'Kuwait ', 'Middle East ', 'Kuwaiti', 'Kuwaitis', 'Kuwaiti Dinar', 'KWD', '2041961', 'Al Kuwayt', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Kuwait'),
(135, 'Kyrgyzstan', 'KG', 'KG', 'KGZ', '417', 'KG', 'Bishkek ', 'Commonwealth of Independent States ', 'Kyrgyzstani', 'Kyrgyzstanis', 'Som', 'KGS', '4753003', 'Kyrgyzstan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Kyrgyzstan'),
(136, 'Laos', 'LA', 'LA', 'LAO', '418', 'LA', 'Vientiane ', 'Southeast Asia ', 'Lao', 'Laos', 'Kip', 'LAK', '5635967', 'Laos', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Laos'),
(137, 'Latvia', 'LG', 'LV', 'LVA', '428', 'LV', 'Riga ', 'Europe ', 'Latvian', 'Latvians', 'Latvian Lats', 'LVL', '2385231', 'Latvia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Latvia'),
(138, 'Lebanon', 'LE', 'LB', 'LBN', '422', 'LB', 'Beirut ', 'Middle East ', 'Lebanese', 'Lebanese', 'Lebanese Pound', 'LBP', '3627774', 'Lebanon', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Lebanon'),
(139, 'Lesotho', 'LT', 'LS', 'LSO', '426', 'LS', 'Maseru ', 'Africa ', 'Basotho', 'Mosotho', 'Loti', 'LSL', '2177062', 'Lesotho', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Lesotho'),
(140, 'Liberia', 'LI', 'LR', 'LBR', '430', 'LR', 'Monrovia ', 'Africa ', 'Liberian', 'Liberians', 'Liberian Dollar', 'LRD', '3225837', 'Liberia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Liberia'),
(141, 'Libya', 'LY', 'LY', 'LBY', '434', 'LY', 'Tripoli ', 'Africa ', 'Libyan', 'Libyans', 'Libyan Dinar', 'LYD', '5240599', 'Libya', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Libya'),
(142, 'Liechtenstein', 'LS', 'LI', 'LIE', '438', 'LI', 'Vaduz ', 'Europe ', 'Liechtenstein', 'Liechtensteiners', 'Swiss Franc', 'CHF', '32528', 'Liechtenstein', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Liechtenstein'),
(143, 'Lithuania', 'LH', 'LT', 'LTU', '440', 'LT', 'Vilnius ', 'Europe ', 'Lithuanian', 'Lithuanians', 'Lithuanian Litas', 'LTL', '3610535', 'Lithuania', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Lithuania'),
(144, 'Luxembourg', 'LU', 'LU', 'LUX', '442', 'LU', 'Luxembourg ', 'Europe ', 'Luxembourg', 'Luxembourgers', 'Euro', 'EUR', '442972', 'Luxembourg', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Luxembourg'),
(145, 'Macao', 'MC', 'MO', 'MAC', '446', 'MO', '', 'Southeast Asia ', 'Chinese', 'Chinese', 'Pataca', 'MOP', '453733', 'Macao', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Macao'),
(146, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MK', 'MKD', '807', 'MK', 'Skopje ', 'Europe ', 'Macedonian', 'Macedonians', 'Denar', 'MKD', '2046209', 'Makedonija', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Macedonia, The Former Yugoslav Republic of'),
(147, 'Madagascar', 'MA', 'MG', 'MDG', '450', 'MG', 'Antananarivo ', 'Africa ', 'Malagasy', 'Malagasy', 'Malagasy Franc', 'MGF', '15982563', 'Madagascar', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Madagascar'),
(148, 'Malawi', 'MI', 'MW', 'MWI', '454', 'MW', 'Lilongwe ', 'Africa ', 'Malawian', 'Malawians', 'Kwacha', 'MWK', '10548250', 'Malawi', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Malawi'),
(149, 'Malaysia', 'MY', 'MY', 'MYS', '458', 'MY', 'Kuala Lumpur ', 'Southeast Asia ', 'Malaysian', 'Malaysians', 'Malaysian Ringgit', 'MYR', '22229040', 'Malaysia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Malaysia'),
(150, 'Maldives', 'MV', 'MV', 'MDV', '462', 'MV', 'Male ', 'Asia ', 'Maldivian', 'Maldivians', 'Rufiyaa', 'MVR', '310764', 'Maldives', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Maldives'),
(151, 'Mali', 'ML', 'ML', 'MLI', '466', 'ML', 'Bamako ', 'Africa ', 'Malian', 'Malians', 'CFA Franc BCEAO', 'XOF', '11008518', 'Mali', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Mali'),
(152, 'Malta', 'MT', 'MT', 'MLT', '470', 'MT', 'Valletta ', 'Europe ', 'Maltese', 'Maltese', 'Maltese Lira', 'MTL', '394583', 'Malta', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Malta'),
(153, 'Man, Isle of', 'IM', '--', '-- ', '--', 'IM', 'Douglas ', 'Europe ', 'Manxman', 'Manxmen', 'Pound Sterling', 'GBP', '73489', 'The Isle of Man', 'ISO includes with the United Kingdom', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Isle of Man'),
(154, 'Marshall Islands', 'RM', 'MH', 'MHL', '584', 'MH', 'Majuro ', 'Oceania ', 'Marshallese', 'Marshallese', 'US Dollar', 'USD', '70822', 'The Marshall Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Marshall Islands'),
(155, 'Martinique', 'MB', 'MQ', 'MTQ', '474', 'MQ', 'Fort-de-France ', 'Central America and the Caribbean ', 'Martiniquais', 'Martiniquais', 'Euro', 'EUR', '418454', 'Martinique', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Martinique'),
(156, 'Mauritania', 'MR', 'MR', 'MRT', '478', 'MR', 'Nouakchott ', 'Africa ', 'Mauritanian', 'Mauritanians', 'Ouguiya', 'MRO', '2747312', 'Mauritania', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Mauritania'),
(157, 'Mauritius', 'MP', 'MU', 'MUS', '480', 'MU', 'Port Louis ', 'World ', 'Mauritian', 'Mauritians', 'Mauritius Rupee', 'MUR', '1189825', 'Mauritius', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Mauritius'),
(158, 'Mayotte', 'MF', 'YT', 'MYT', '175', 'YT', 'Mamoutzou ', 'Africa ', 'Mahorais', 'Mahorais', 'Euro', 'EUR', '163366', 'Mayotte', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Mayotte'),
(159, 'Mexico', 'MX', 'MX', 'MEX', '484', 'MX', 'Mexico ', 'North America ', 'Mexican', 'Mexicans', 'Mexican Peso', 'MXN', '101879171', 'Mexico', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Mexico'),
(160, 'Micronesia, Federated States of', 'FM', 'FM', 'FSM', '583', 'FM', 'Palikir ', 'Oceania ', 'Micronesian', 'Micronesians', 'US Dollar', 'USD', '134597', 'The Federated States of Micronesia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Micronesia, Federated States of'),
(161, 'Midway Islands', 'MQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', 'United States Dollars', 'USD', '0', 'The Midway Islands', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(162, 'Miscellaneous (French)', '--', '--', '-- ', '--', '--', '', '', '', '', '', '', '0', 'Miscellaneous (French)', 'ISO includes Bassas da India, Europa Island, Glori', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(163, 'Moldova', 'MD', 'MD', 'MDA', '498', 'MD', 'Chisinau ', 'Commonwealth of Independent States ', 'Moldovan', 'Moldovans', 'Moldovan Leu', 'MDL', '4431570', 'Moldova', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Moldova'),
(164, 'Monaco', 'MN', 'MC', 'MCO', '492', 'MC', 'Monaco ', 'Europe ', 'Monegasque', 'Monegasques', 'Euro', 'EUR', '31842', 'Monaco', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Monaco'),
(165, 'Mongolia', 'MG', 'MN', 'MNG', '496', 'MN', 'Ulaanbaatar ', 'Asia ', 'Mongolian', 'Mongolians', 'Tugrik', 'MNT', '2654999', 'Mongolia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Mongolia'),
(166, 'Montenegro', '--', '--', '-- ', '--', '--', '', '', '', '', '', '', '0', 'Montenegro', 'now included as region within Yugoslavia', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Montenegro'),
(167, 'Montserrat', 'MH', 'MS', 'MSR', '500', 'MS', 'Plymouth', 'Central America and the Caribbean ', 'Montserratian', 'Montserratians', 'East Caribbean Dollar', 'XCD', '7574', 'Montserrat', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Montserrat'),
(168, 'Morocco', 'MO', 'MA', 'MAR', '504', 'MA', 'Rabat ', 'Africa ', 'Moroccan', 'Moroccans', 'Moroccan Dirham', 'MAD', '30645305', 'Morocco', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Morocco'),
(169, 'Mozambique', 'MZ', 'MZ', 'MOZ', '508', 'MZ', 'Maputo ', 'Africa ', 'Mozambican', 'Mozambicans', 'Metical', 'MZM', '19371057', 'Mozambique', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Mozambique'),
(170, 'Myanmar', '--', '--', '-- ', '--', '--', '', '', '', '', 'Kyat', 'MMK', '0', 'Myanmar', 'see Burma', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Myanmar(Burma)'),
(171, 'Namibia', 'WA', 'NA', 'NAM', '516', 'NA', 'Windhoek ', 'Africa ', 'Namibian', 'Namibians', 'Namibian Dollar ', 'NAD', '1797677', 'Namibia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Namibia'),
(172, 'Nauru', 'NR', 'NR', 'NRU', '520', 'NR', '', 'Oceania ', 'Nauruan', 'Nauruans', 'Australian Dollar', 'AUD', '12088', 'Nauru', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Nauru'),
(173, 'Navassa Island', 'BQ', '--', '-- ', '--', '--', '', 'Central America and the Caribbean ', '', '', '', '', '0', 'Navassa Island', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(174, 'Nepal', 'NP', 'NP', 'NPL', '524', 'NP', 'Kathmandu ', 'Asia ', 'Nepalese', 'Nepalese', 'Nepalese Rupee', 'NPR', '25284463', 'Nepal', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Nepal'),
(175, 'Netherlands', 'NL', 'NL', 'NLD', '528', 'NL', 'Amsterdam ', 'Europe ', 'Dutchman', 'Dutchmen', 'Euro', 'EUR', '15981472', 'The Netherlands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Netherlands'),
(176, 'Netherlands Antilles', 'NT', 'AN', 'ANT', '530', 'AN', 'Willemstad ', 'Central America and the Caribbean ', 'Dutch Antillean', 'Dutch Antilleans', 'Netherlands Antillean guilder ', 'ANG', '212226', 'The Netherlands Antilles', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Netherlands Antilles'),
(177, 'New Caledonia', 'NC', 'NC', 'NCL', '540', 'NC', 'Noumea ', 'Oceania ', 'New Caledonian', 'New Caledonians', 'CFP Franc', 'XPF', '204863', 'New Caledonia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'New Caledonia'),
(178, 'New Zealand', 'NZ', 'NZ', 'NZL', '554', 'NZ', 'Wellington ', 'Oceania ', 'New Zealand', 'New Zealanders', 'New Zealand Dollar', 'NZD', '3864129', 'New Zealand', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'New Zealand'),
(179, 'Nicaragua', 'NU', 'NI', 'NIC', '558', 'NI', 'Managua ', 'Central America and the Caribbean ', 'Nicaraguan', 'Nicaraguans', 'Cordoba Oro', 'NIO', '4918393', 'Nicaragua', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Nicaragua'),
(180, 'Niger', 'NG', 'NE', 'NER', '562', 'NE', 'Niamey ', 'Africa ', 'Nigerien', 'Nigeriens', 'CFA Franc BCEAO', 'XOF', '10355156', 'Niger', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Niger'),
(181, 'Nigeria', 'NI', 'NG', 'NGA', '566', 'NG', 'Abuja', 'Africa ', 'Nigerian', 'Nigerians', 'Naira', 'NGN', '126635626', 'Nigeria', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Nigeria'),
(182, 'Niue', 'NE', 'NU', 'NIU', '570', 'NU', 'Alofi ', 'Oceania ', 'Niuean', 'Niueans', 'New Zealand Dollar', 'NZD', '2124', 'Niue', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Niue'),
(183, 'Norfolk Island', 'NF', 'NF', 'NFK', '574', 'NF', 'Kingston ', 'Oceania ', 'Norfolk Islander', 'Norfolk Islanders', 'Australian Dollar', 'AUD', '1879', 'Norfolk Island', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Norfolk'),
(184, 'Northern Mariana Islands', 'CQ', 'MP', 'MNP', '580', 'MP', 'Saipan ', 'Oceania ', '', '', 'US Dollar', 'USD', '74612', 'The Northern Mariana Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Northern Mariana'),
(185, 'Norway', 'NO', 'NO', 'NOR', '578', 'NO', 'Oslo ', 'Europe ', 'Norwegian', 'Norwegians', 'Norwegian Krone', 'NOK', '4503440', 'Norway', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Norway'),
(186, 'Oman', 'MU', 'OM', 'OMN', '512', 'OM', 'Muscat ', 'Middle East ', 'Omani', 'Omanis', 'Rial Omani', 'OMR', '2622198', 'Oman', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Oman'),
(187, 'Pakistan', 'PK', 'PK', 'PAK', '586', 'PK', 'Islamabad ', 'Asia ', 'Pakistani', 'Pakistanis', 'Pakistan Rupee', 'PKR', '144616639', 'Pakistan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Pakistan'),
(188, 'Palau', 'PS', 'PW', 'PLW', '585', 'PW', 'Koror ', 'Oceania ', 'Palauan', 'Palauans', 'US Dollar', 'USD', '19092', 'Palau', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Palau'),
(189, 'Palmyra Atoll', 'LQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', '', '', '0', 'Palmyra Atoll', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(190, 'Panama', 'PM', 'PA', 'PAN', '591', 'PA', 'Panama ', 'Central America and the Caribbean ', 'Panamanian', 'Panamanians', 'balboa ', 'PAB', '2845647', 'Panama', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Panama'),
(191, 'Papua New Guinea', 'PP', 'PG', 'PNG', '598', 'PG', 'Port Moresby ', 'Oceania ', 'Papua New Guinean', 'Papua New Guineans', 'Kina', 'PGK', '5049055', 'Papua New Guinea', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Papua New Guinea'),
(192, 'Paracel Islands', 'PF', '--', '-- ', '--', '--', '', 'Southeast Asia ', '', '', '', '', '0', 'The Paracel Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(193, 'Paraguay', 'PA', 'PY', 'PRY', '600', 'PY', 'Asuncion ', 'South America ', 'Paraguayan', 'Paraguayans', 'Guarani', 'PYG', '5734139', 'Paraguay', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Paraguay'),
(194, 'Peru', 'PE', 'PE', 'PER', '604', 'PE', 'Lima ', 'South America ', 'Peruvian', 'Peruvians', 'Nuevo Sol', 'PEN', '27483864', 'Peru', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Peru'),
(195, 'Philippines', 'RP', 'PH', 'PHL', '608', 'PH', 'Manila ', 'Southeast Asia ', 'Philippine', 'Filipinos', 'Philippine Peso', 'PHP', '82841518', 'The Philippines', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Philippines'),
(196, 'Pitcairn Islands', 'PC', 'PN', 'PCN', '612', 'PN', 'Adamstown ', 'Oceania ', 'Pitcairn Islander', 'Pitcairn Islanders', 'New Zealand Dollar', 'NZD', '47', 'The Pitcairn Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Pitcairn'),
(197, 'Poland', 'PL', 'PL', 'POL', '616', 'PL', 'Warsaw ', 'Europe ', 'Polish', 'Poles', 'Zloty', 'PLN', '38633912', 'Poland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Poland'),
(198, 'Portugal', 'PO', 'PT', 'PRT', '620', 'PT', 'Lisbon ', 'Europe ', 'Portuguese', 'Portuguese', 'Euro', 'EUR', '10066253', 'Portugal', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Portugal'),
(199, 'Puerto Rico', 'RQ', 'PR', 'PRI', '630', 'PR', 'San Juan ', 'Central America and the Caribbean ', 'Puerto Rican', 'Puerto Ricans', 'US Dollar', 'USD', '3937316', 'Puerto Rico', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Puerto Rico'),
(200, 'Qatar', 'QA', 'QA', 'QAT', '634', 'QA', 'Doha ', 'Middle East ', 'Qatari', 'Qataris', 'Qatari Rial', 'QAR', '769152', 'Qatar', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Qatar'),
(201, 'Réunion', 'RE', 'RE', 'REU', '638', 'RE', 'Saint-Denis', 'World', 'Reunionese', 'Reunionese', 'Euro', 'EUR', '732570', 'R.©union', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Reunion'),
(202, 'Romania', 'RO', 'RO', 'ROU', '642', 'RO', 'Bucharest ', 'Europe ', 'Romanian', 'Romanians', 'Leu', 'ROL', '22364022', 'Romania', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Romania'),
(203, 'Russia', 'RS', 'RU', 'RUS', '643', 'RU', 'Moscow ', 'Asia ', 'Russian', 'Russians', 'Russian Ruble', 'RUB', '145470197', 'Russia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Russian Federation'),
(204, 'Rwanda', 'RW', 'RW', 'RWA', '646', 'RW', 'Kigali ', 'Africa ', 'Rwandan', 'Rwandans', 'Rwanda Franc', 'RWF', '7312756', 'Rwanda', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Rwanda'),
(205, 'Saint Helena', 'SH', 'SH', 'SHN', '654', 'SH', 'Jamestown ', 'Africa ', 'Saint Helenian', 'Saint Helenians', 'Saint Helenian Pound ', 'SHP', '7266', 'Saint Helena', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Saint Helena'),
(206, 'Saint Kitts and Nevis', 'SC', 'KN', 'KNA', '659', 'KN', 'Basseterre ', 'Central America and the Caribbean ', 'Kittitian and Nevisian', 'Kittitians and Nevisians', 'East Caribbean Dollar ', 'XCD', '38756', 'Saint Kitts and Nevis', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'St Kitts & Nevis'),
(207, 'Saint Lucia', 'ST', 'LC', 'LCA', '662', 'LC', 'Castries ', 'Central America and the Caribbean ', 'Saint Lucian', 'Saint Lucians', 'East Caribbean Dollar ', 'XCD', '158178', 'Saint Lucia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Saint Lucia'),
(208, 'Saint Pierre and Miquelon', 'SB', 'PM', 'SPM', '666', 'PM', 'Saint-Pierre ', 'North America ', 'Frenchman', 'Frenchmen', 'Euro', 'EUR', '6928', 'Saint Pierre and Miquelon', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Saint Pierre and Miquelon'),
(209, 'Saint Vincent and the Grenadines', 'VC', 'VC', 'VCT', '670', 'VC', 'Kingstown ', 'Central America and the Caribbean ', 'Saint Vincentian', 'Saint Vincentians', 'East Caribbean Dollar ', 'XCD', '115942', 'Saint Vincent and the Grenadines', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'St Vincent & the Grenadines'),
(210, 'Samoa', 'WS', 'WS', 'WSM', '882', 'WS', 'Apia ', 'Oceania ', 'Samoan', 'Samoans', 'Tala', 'WST', '179058', 'Samoa', 'NULL', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Samoa'),
(211, 'San Marino', 'SM', 'SM', 'SMR', '674', 'SM', 'San Marino ', 'Europe ', 'Sammarinese', 'Sammarinese', 'Euro', 'EUR', '27336', 'San Marino', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'San Marino'),
(212, 'São Tomé and Príncipe', 'TP', 'ST', 'STP', '678', 'ST', 'Sao Tome', 'Africa', 'Sao Tomean', 'Sao Tomeans', 'Dobra', 'STD', '165034', 'S..o Tom.© and Pr.­ncipe', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Sao Tome & Principe'),
(213, 'Saudi Arabia', 'SA', 'SA', 'SAU', '682', 'SA', 'Riyadh ', 'Middle East ', 'Saudi Arabian ', 'Saudis', 'Saudi Riyal', 'SAR', '22757092', 'Saudi Arabia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Saudi Arabia'),
(214, 'Senegal', 'SG', 'SN', 'SEN', '686', 'SN', 'Dakar ', 'Africa ', 'Senegalese', 'Senegalese', 'CFA Franc BCEAO', 'XOF', '10284929', 'Senegal', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Senegal'),
(215, 'Serbia', '--', '--', '-- ', '--', '--', '', '', '', '', '', '', '0', 'Serbia', 'now included as region within Yugoslavia', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Serbia(Yugoslavia)'),
(216, 'Serbia and Montenegro', '--', '--', '-- ', '--', '--', '', '', '', '', '', '', '0', 'Serbia and Montenegro', 'See Yugoslavia', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(217, 'Seychelles', 'SE', 'SC', 'SYC', '690', 'SC', 'Victoria ', 'Africa ', 'Seychellois', 'Seychellois', 'Seychelles Rupee', 'SCR', '79715', 'Seychelles', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Seychelles'),
(218, 'Sierra Leone', 'SL', 'SL', 'SLE', '694', 'SL', 'Freetown ', 'Africa ', 'Sierra Leonean', 'Sierra Leoneans', 'Leone', 'SLL', '5426618', 'Sierra Leone', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Sierra Leone'),
(219, 'Singapore', 'SN', 'SG', 'SGP', '702', 'SG', 'Singapore ', 'Southeast Asia ', 'Singaporeian', 'Singaporeans', 'Singapore Dollar', 'SGD', '4300419', 'Singapore', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Singapore'),
(220, 'Slovakia', 'LO', 'SK', 'SVK', '703', 'SK', 'Bratislava ', 'Europe ', 'Slovakian', 'Slovaks', 'Slovak Koruna', 'SKK', '5414937', 'Slovakia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Slovakia'),
(221, 'Slovenia', 'SI', 'SI', 'SVN', '705', 'SI', 'Ljubljana ', 'Europe ', 'Slovenian', 'Slovenes', 'Euro', 'EUR', '1930132', 'Slovenia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Slovenia'),
(222, 'Solomon Islands', 'BP', 'SB', 'SLB', '90', 'SB', 'Honiara ', 'Oceania ', 'Solomon Islander', 'Solomon Islanders', 'Solomon Islands Dollar', 'SBD', '480442', 'The Solomon Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Solomon Islands');
INSERT INTO `countries` (`id`, `country`, `FIPS104`, `ISO2`, `ISO3`, `ISON`, `internet`, `capital`, `map_reference`, `nationality_singular`, `nationality_plural`, `currency`, `currency_code`, `population`, `title`, `comment`, `created`, `created_by`, `modified`, `last_updated_by`, `flag`) VALUES
(223, 'Somalia', 'SO', 'SO', 'SOM', '706', 'SO', 'Mogadishu ', 'Africa ', 'Somali', 'Somalis', 'Somali Shilling', 'SOS', '7488773', 'Somalia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Somalia'),
(224, 'South Africa', 'SF', 'ZA', 'ZAF', '710', 'ZA', 'Pretoria', 'Africa ', 'South African', 'South Africans', 'Rand', 'ZAR', '43586097', 'South Africa', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'South Africa'),
(225, 'South Georgia and the South Sandwich Islands', 'SX', 'GS', 'SGS', '239', 'GS', '', 'Antarctic Region ', '', '', 'Pound Sterling', 'GBP', '0', 'The South Georgia and the South Sandwich Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'South Georgia and South Sandwich'),
(226, 'Spain', 'SP', 'ES', 'ESP', '724', 'ES', 'Madrid ', 'Europe ', 'Spanish', 'Spaniards', 'Euro', 'EUR', '40037995', 'Spain', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Spain'),
(227, 'Spratly Islands', 'PG', '--', '-- ', '--', '--', '', 'Southeast Asia ', '', '', '', '', '0', 'The Spratly Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(228, 'Sri Lanka', 'CE', 'LK', 'LKA', '144', 'LK', 'Colombo', 'Asia ', 'Sri Lankan', 'Sri Lankans', 'Sri Lanka Rupee', 'LKR', '19408635', 'Sri Lanka', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Sri Lanka'),
(229, 'Sudan', 'SU', 'SD', 'SDN', '736', 'SD', 'Khartoum ', 'Africa ', 'Sudanese', 'Sudanese', 'Sudanese Dinar', 'SDD', '36080373', 'Sudan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Sudan'),
(230, 'Suriname', 'NS', 'SR', 'SUR', '740', 'SR', 'Paramaribo ', 'South America ', 'Surinamese', 'Surinamers', 'Suriname Guilder', 'SRG', '433998', 'Suriname', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Suriname'),
(231, 'Svalbard', 'SV', 'SJ', 'SJM', '744', 'SJ', 'Longyearbyen ', 'Arctic Region ', '', '', 'Norwegian Krone', 'NOK', '2332', 'Svalbard', 'ISO includes Jan Mayen', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Svalbard and Jan Mayen'),
(232, 'Swaziland', 'WZ', 'SZ', 'SWZ', '748', 'SZ', 'Mbabane ', 'Africa ', 'Swazi', 'Swazis', 'Lilangeni', 'SZL', '1104343', 'Swaziland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Swaziland'),
(233, 'Sweden', 'SW', 'SE', 'SWE', '752', 'SE', 'Stockholm ', 'Europe ', 'Swedish', 'Swedes', 'Swedish Krona', 'SEK', '8875053', 'Sweden', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Sweden'),
(234, 'Switzerland', 'SZ', 'CH', 'CHE', '756', 'CH', 'Bern ', 'Europe ', 'Swiss', 'Swiss', 'Swiss Franc', 'CHF', '7283274', 'Switzerland', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Switzerland'),
(235, 'Syria', 'SY', 'SY', 'SYR', '760', 'SY', 'Damascus ', 'Middle East ', 'Syrian', 'Syrians', 'Syrian Pound', 'SYP', '16728808', 'Syria', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Syria'),
(236, 'Taiwan', 'TW', 'TW', 'TWN', '158', 'TW', 'Taipei ', 'Southeast Asia ', 'Taiwanese', 'Taiwanese', 'New Taiwan Dollar', 'TWD', '22370461', 'Taiwan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Taiwan'),
(237, 'Tajikistan', 'TI', 'TJ', 'TJK', '762', 'TJ', 'Dushanbe ', 'Commonwealth of Independent States ', 'Tajikistani', 'Tajikistanis', 'Somoni', 'TJS', '6578681', 'Tajikistan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Tajikistan'),
(238, 'Tanzania', 'TZ', 'TZ', 'TZA', '834', 'TZ', 'Dar es Salaam', 'Africa ', 'Tanzanian', 'Tanzanians', 'Tanzanian Shilling', 'TZS', '36232074', 'Tanzania', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Tanzania'),
(239, 'Thailand', 'TH', 'TH', 'THA', '764', 'TH', 'Bangkok ', 'Southeast Asia ', 'Thai', 'Thai', 'Baht', 'THB', '61797751', 'Thailand', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Thailand'),
(240, 'Togo', 'TO', 'TG', 'TGO', '768', 'TG', 'Lome ', 'Africa ', 'Togolese', 'Togolese', 'CFA Franc BCEAO', 'XOF', '5153088', 'Togo', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Togo'),
(241, 'Tokelau', 'TL', 'TK', 'TKL', '772', 'TK', '', 'Oceania ', 'Tokelauan', 'Tokelauans', 'New Zealand Dollar', 'NZD', '1445', 'Tokelau', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Tokelau'),
(242, 'Tonga', 'TN', 'TO', 'TON', '776', 'TO', 'Nuku''alofa ', 'Oceania ', 'Tongan', 'Tongans', 'Pa''anga', 'TOP', '104227', 'Tonga', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Tonga'),
(243, 'Trinidad and Tobago', 'TD', 'TT', 'TTO', '780', 'TT', 'Port-of-Spain ', 'Central America and the Caribbean ', 'Trinidadian and Tobagonian', 'Trinidadians and Tobagonians', 'Trinidad and Tobago Dollar', 'TTD', '1169682', 'Trinidad and Tobago', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Trinidad & Tobago'),
(244, 'Tromelin Island', 'TE', '--', '-- ', '--', '--', '', 'Africa ', '', '', '', '', '0', 'Tromelin Island', 'ISO includes with the Miscellaneous (French) India', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(245, 'Tunisia', 'TS', 'TN', 'TUN', '788', 'TN', 'Tunis ', 'Africa ', 'Tunisian', 'Tunisians', 'Tunisian Dinar', 'TND', '9705102', 'Tunisia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Tunisia'),
(246, 'Turkey', 'TU', 'TR', 'TUR', '792', 'TR', 'Ankara ', 'Middle East ', 'Turkish', 'Turks', 'Turkish Lira', 'TRL', '66493970', 'Turkey', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Turkey'),
(247, 'Turkmenistan', 'TX', 'TM', 'TKM', '795', 'TM', 'Ashgabat ', 'Commonwealth of Independent States ', 'Turkmen', 'Turkmens', 'Manat', 'TMM', '4603244', 'Turkmenistan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Turkmenistan'),
(248, 'Turks and Caicos Islands', 'TK', 'TC', 'TCA', '796', 'TC', 'Cockburn Town ', 'Central America and the Caribbean ', '', '', 'US Dollar', 'USD', '18122', 'The Turks and Caicos Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Turks and Caicos Islands'),
(249, 'Tuvalu', 'TV', 'TV', 'TUV', '798', 'TV', 'Funafuti ', 'Oceania ', 'Tuvaluan', 'Tuvaluans', 'Australian Dollar', 'AUD', '10991', 'Tuvalu', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Tuvalu'),
(250, 'Uganda', 'UG', 'UG', 'UGA', '800', 'UG', 'Kampala ', 'Africa ', 'Ugandan', 'Ugandans', 'Uganda Shilling', 'UGX', '23985712', 'Uganda', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Uganda'),
(251, 'Ukraine', 'UP', 'UA', 'UKR', '804', 'UA', 'Kiev ', 'Commonwealth of Independent States ', 'Ukrainian', 'Ukrainians', 'Hryvnia', 'UAH', '48760474', 'The Ukraine', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Ukraine'),
(252, 'United Arab Emirates', 'AE', 'AE', 'ARE', '784', 'AE', 'Abu Dhabi ', 'Middle East ', 'Emirati', 'Emiratis', 'UAE Dirham', 'AED', '2407460', 'The United Arab Emirates', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'United Arab Emirates'),
(253, 'United Kingdom', 'UK', 'GB', 'GBR', '826', 'UK', 'London ', 'Europe ', 'British', 'Britons', 'Pound Sterling', 'GBP', '59647790', 'The United Kingdom', 'ISO includes Guernsey, Isle of Man, Jersey', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'United Kingdom(Great Britain)'),
(254, 'United States', 'US', 'US', 'USA', '840', 'US', 'Washington, DC ', 'North America ', 'American', 'Americans', 'US Dollar', 'USD', '278058881', 'The United States', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'United States of America(USA)'),
(255, 'United States Minor Outlying Islands', '--', 'UM', 'UMI', '581', 'UM', '', '', '', '', 'US Dollar', 'USD', '0', 'The United States Minor Outlying Islands', 'ISO includes Baker Island, Howland Island, Jarvis ', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'United States Minor Outlying'),
(256, 'Uruguay', 'UY', 'UY', 'URY', '858', 'UY', 'Montevideo ', 'South America ', 'Uruguayan', 'Uruguayans', 'Peso Uruguayo', 'UYU', '3360105', 'Uruguay', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Uruguay'),
(257, 'Uzbekistan', 'UZ', 'UZ', 'UZB', '860', 'UZ', 'Tashkent', 'Commonwealth of Independent States ', 'Uzbekistani', 'Uzbekistanis', 'Uzbekistan Sum', 'UZS', '25155064', 'Uzbekistan', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Uzbekistan'),
(258, 'Vanuatu', 'NH', 'VU', 'VUT', '548', 'VU', 'Port-Vila ', 'Oceania ', 'Ni-Vanuatu', 'Ni-Vanuatu', 'Vatu', 'VUV', '192910', 'Vanuatu', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Vanuatu'),
(259, 'Venezuela', 'VE', 'VE', 'VEN', '862', 'VE', 'Caracas ', 'South America, Central America and the Caribbean ', 'Venezuelan', 'Venezuelans', 'Bolivar', 'VEB', '23916810', 'Venezuela', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Venezuela'),
(260, 'Vietnam', 'VM', 'VN', 'VNM', '704', 'VN', 'Hanoi ', 'Southeast Asia ', 'Vietnamese', 'Vietnamese', 'Dong', 'VND', '79939014', 'Vietnam', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Viet Nam'),
(261, 'Virgin Islands', 'VQ', 'VI', 'VIR', '850', 'VI', 'Charlotte Amalie ', 'Central America and the Caribbean ', 'Virgin Islander', 'Virgin Islanders', 'US Dollar', 'USD', '122211', 'The Virgin Islands', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(262, 'Virgin Islands (UK)', '--', '--', '-- ', '--', '--', '', '', '', '', 'US Dollar', 'USD', '0', 'Virgin Islands (UK)', 'see British Virgin Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Virgin Islands British'),
(263, 'Virgin Islands (US)', '--', '--', '-- ', '--', '--', '', '', '', '', 'US Dollar', 'USD', '0', 'Virgin Islands (US)', 'see Virgin Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Virgin Islands US'),
(264, 'Wake Island', 'WQ', '--', '-- ', '--', '--', '', 'Oceania ', '', '', 'US Dollar', 'USD', '0', 'Wake Island', 'ISO includes with the US Minor Outlying Islands', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(265, 'Wallis and Futuna', 'WF', 'WF', 'WLF', '876', 'WF', 'Mata-Utu', 'Oceania ', 'Wallis and Futuna Islander', 'Wallis and Futuna Islanders', 'CFP Franc', 'XPF', '15435', 'Wallis and Futuna', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Wallis and Futuna'),
(266, 'West Bank', 'WE', '--', '-- ', '--', '--', '', 'Middle East ', '', '', 'New Israeli Shekel ', 'ILS', '2090713', 'The West Bank', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(267, 'Western Sahara', 'WI', 'EH', 'ESH', '732', 'EH', '', 'Africa ', 'Sahrawian', 'Sahrawis', 'Moroccan Dirham', 'MAD', '250559', 'Western Sahara', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Western Sahara'),
(268, 'Western Samoa', '--', '--', '-- ', '--', '--', '', '', '', '', 'Tala', 'WST', '0', 'Western Samoa', 'see Samoa', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(269, 'World', '--', '--', '-- ', '--', '--', '', 'World, Time Zones ', '', '', '', '', '1862433264', 'The World', 'NULL', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(270, 'Yemen', 'YM', 'YE', 'YEM', '887', 'YE', 'Sanaa ', 'Middle East ', 'Yemeni', 'Yemenis', 'Yemeni Rial', 'YER', '18078035', 'Yemen', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Yemen'),
(271, 'Yugoslavia', 'YI', 'YU', 'YUG', '891', 'YU', 'Belgrade ', 'Europe ', 'Serbian', 'Serbs', 'Yugoslavian Dinar ', 'YUM', '10677290', 'Yugoslavia', 'NULL', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, ''),
(272, 'Zaire', '--', '--', '-- ', '--', '--', '', '', '', '', '', '', '0', 'Zaire', 'see Democratic Republic of the Congo', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Congo-Kinshasa(Zaire)'),
(273, 'Zambia', 'ZA', 'ZM', 'ZWB', '894', 'ZM', 'Lusaka ', 'Africa ', 'Zambian', 'Zambians', 'Kwacha', 'ZMK', '9770199', 'Zambia', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Zambia'),
(274, 'Zimbabwe', 'ZI', 'ZW', 'ZWE', '716', 'ZW', 'Harare ', 'Africa ', 'Zimbabwean', 'Zimbabweans', 'Zimbabwe Dollar', 'ZWD', '11365366', 'Zimbabwe', '', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Zimbabwe'),
(275, 'Palestinian Territory, Occupied', '--', 'PS', 'PSE', '275', 'PS', '', '', '', '', '', '', '0', 'Palestine', 'NULL', '2010-05-19 15:22:02', 1, '2010-05-19 15:22:02', 1, 'Palestine');

-- --------------------------------------------------------

--
-- Table structure for table `dailylogs`
--

DROP TABLE IF EXISTS `dailylogs`;
CREATE TABLE IF NOT EXISTS `dailylogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `type` enum('clicks','referral') NOT NULL,
  `last_incremental_id` int(10) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_date_type_last)incremental_id` (`date`,`type`,`last_incremental_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dailylogs`
--


-- --------------------------------------------------------

--
-- Table structure for table `geoip`
--

DROP TABLE IF EXISTS `geoip`;
CREATE TABLE IF NOT EXISTS `geoip` (
  `begin_ip` varchar(20) NOT NULL,
  `end_ip` varchar(20) NOT NULL,
  `ip_long_from` int(10) unsigned NOT NULL,
  `ip_long_to` int(10) unsigned NOT NULL,
  `country` varchar(4) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `geoip`
--


-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `created`, `modified`) VALUES
(1, 'admin', '2013-06-02 14:14:05', '2013-06-02 14:14:05'),
(2, 'advertiser', '2013-06-02 14:14:28', '2013-06-02 14:14:28'),
(3, 'publisher', '2013-06-02 14:14:36', '2013-06-02 14:14:36');

-- --------------------------------------------------------

--
-- Table structure for table `instant_payment_notifications`
--

DROP TABLE IF EXISTS `instant_payment_notifications`;
CREATE TABLE IF NOT EXISTS `instant_payment_notifications` (
  `id` char(36) NOT NULL,
  `notify_version` varchar(64) DEFAULT NULL COMMENT 'IPN Version Number',
  `verify_sign` varchar(127) DEFAULT NULL COMMENT 'Encrypted string used to verify the authenticityof the tansaction',
  `test_ipn` int(11) DEFAULT NULL,
  `address_city` varchar(40) DEFAULT NULL COMMENT 'City of customers address',
  `address_country` varchar(64) DEFAULT NULL COMMENT 'Country of customers address',
  `address_country_code` varchar(2) DEFAULT NULL COMMENT 'Two character ISO 3166 country code',
  `address_name` varchar(128) DEFAULT NULL COMMENT 'Name used with address (included when customer provides a Gift address)',
  `address_state` varchar(40) DEFAULT NULL COMMENT 'State of customer address',
  `address_status` varchar(20) DEFAULT NULL COMMENT 'confirmed/unconfirmed',
  `address_street` varchar(200) DEFAULT NULL COMMENT 'Customer''s street address',
  `address_zip` varchar(20) DEFAULT NULL COMMENT 'Zip code of customer''s address',
  `first_name` varchar(64) DEFAULT NULL COMMENT 'Customer''s first name',
  `last_name` varchar(64) DEFAULT NULL COMMENT 'Customer''s last name',
  `payer_business_name` varchar(127) DEFAULT NULL COMMENT 'Customer''s company name, if customer represents a business',
  `payer_email` varchar(127) DEFAULT NULL COMMENT 'Customer''s primary email address. Use this email to provide any credits',
  `payer_id` varchar(13) DEFAULT NULL COMMENT 'Unique customer ID.',
  `payer_status` varchar(20) DEFAULT NULL COMMENT 'verified/unverified',
  `contact_phone` varchar(20) DEFAULT NULL COMMENT 'Customer''s telephone number.',
  `residence_country` varchar(2) DEFAULT NULL COMMENT 'Two-Character ISO 3166 country code',
  `business` varchar(127) DEFAULT NULL COMMENT 'Email address or account ID of the payment recipient (that is, the merchant). Equivalent to the values of receiver_email (If payment is sent to primary account) and business set in the Website Payment HTML.',
  `item_name` varchar(127) DEFAULT NULL COMMENT 'Item name as passed by you, the merchant. Or, if not passed by you, as entered by your customer. If this is a shopping cart transaction, Paypal will append the number of the item (e.g., item_name_1,item_name_2, and so forth).',
  `item_number` varchar(127) DEFAULT NULL COMMENT 'Pass-through variable for you to track purchases. It will get passed back to you at the completion of the payment. If omitted, no variable will be passed back to you.',
  `quantity` varchar(127) DEFAULT NULL COMMENT 'Quantity as entered by your customer or as passed by you, the merchant. If this is a shopping cart transaction, PayPal appends the number of the item (e.g., quantity1,quantity2).',
  `receiver_email` varchar(127) DEFAULT NULL COMMENT 'Primary email address of the payment recipient (that is, the merchant). If the payment is sent to a non-primary email address on your PayPal account, the receiver_email is still your primary email.',
  `receiver_id` varchar(13) DEFAULT NULL COMMENT 'Unique account ID of the payment recipient (i.e., the merchant). This is the same as the recipients referral ID.',
  `custom` varchar(255) DEFAULT NULL COMMENT 'Custom value as passed by you, the merchant. These are pass-through variables that are never presented to your customer.',
  `invoice` varchar(127) DEFAULT NULL COMMENT 'Pass through variable you can use to identify your invoice number for this purchase. If omitted, no variable is passed back.',
  `memo` varchar(255) DEFAULT NULL COMMENT 'Memo as entered by your customer in PayPal Website Payments note field.',
  `option_name1` varchar(64) DEFAULT NULL COMMENT 'Option name 1 as requested by you',
  `option_name2` varchar(64) DEFAULT NULL COMMENT 'Option 2 name as requested by you',
  `option_selection1` varchar(200) DEFAULT NULL COMMENT 'Option 1 choice as entered by your customer',
  `option_selection2` varchar(200) DEFAULT NULL COMMENT 'Option 2 choice as entered by your customer',
  `tax` decimal(10,2) DEFAULT NULL COMMENT 'Amount of tax charged on payment',
  `auth_id` varchar(19) DEFAULT NULL COMMENT 'Authorization identification number',
  `auth_exp` varchar(28) DEFAULT NULL COMMENT 'Authorization expiration date and time, in the following format: HH:MM:SS DD Mmm YY, YYYY PST',
  `auth_amount` int(11) DEFAULT NULL COMMENT 'Authorization amount',
  `auth_status` varchar(20) DEFAULT NULL COMMENT 'Status of authorization',
  `num_cart_items` int(11) DEFAULT NULL COMMENT 'If this is a PayPal shopping cart transaction, number of items in the cart',
  `parent_txn_id` varchar(19) DEFAULT NULL COMMENT 'In the case of a refund, reversal, or cancelled reversal, this variable contains the txn_id of the original transaction, while txn_id contains a new ID for the new transaction.',
  `payment_date` varchar(28) DEFAULT NULL COMMENT 'Time/date stamp generated by PayPal, in the following format: HH:MM:SS DD Mmm YY, YYYY PST',
  `payment_status` varchar(20) DEFAULT NULL COMMENT 'Payment status of the payment',
  `payment_type` varchar(10) DEFAULT NULL COMMENT 'echeck/instant',
  `pending_reason` varchar(20) DEFAULT NULL COMMENT 'This variable is only set if payment_status=pending',
  `reason_code` varchar(20) DEFAULT NULL COMMENT 'This variable is only set if payment_status=reversed',
  `remaining_settle` int(11) DEFAULT NULL COMMENT 'Remaining amount that can be captured with Authorization and Capture',
  `shipping_method` varchar(64) DEFAULT NULL COMMENT 'The name of a shipping method from the shipping calculations section of the merchants account profile. The buyer selected the named shipping method for this transaction',
  `shipping` decimal(10,2) DEFAULT NULL COMMENT 'Shipping charges associated with this transaction. Format unsigned, no currency symbol, two decimal places',
  `transaction_entity` varchar(20) DEFAULT NULL COMMENT 'Authorization and capture transaction entity',
  `txn_id` varchar(19) DEFAULT '' COMMENT 'A unique transaction ID generated by PayPal',
  `txn_type` varchar(20) DEFAULT NULL COMMENT 'cart/express_checkout/send-money/virtual-terminal/web-accept',
  `exchange_rate` decimal(10,2) DEFAULT NULL COMMENT 'Exchange rate used if a currency conversion occured',
  `mc_currency` varchar(3) DEFAULT NULL COMMENT 'Three character country code. For payment IPN notifications, this is the currency of the payment, for non-payment subscription IPN notifications, this is the currency of the subscription.',
  `mc_fee` decimal(10,2) DEFAULT NULL COMMENT 'Transaction fee associated with the payment, mc_gross minus mc_fee equals the amount deposited into the receiver_email account. Equivalent to payment_fee for USD payments. If this amount is negative, it signifies a refund or reversal, and either ofthose p',
  `mc_gross` decimal(10,2) DEFAULT NULL COMMENT 'Full amount of the customer''s payment',
  `mc_handling` decimal(10,2) DEFAULT NULL COMMENT 'Total handling charge associated with the transaction',
  `mc_shipping` decimal(10,2) DEFAULT NULL COMMENT 'Total shipping amount associated with the transaction',
  `payment_fee` decimal(10,2) DEFAULT NULL COMMENT 'USD transaction fee associated with the payment',
  `payment_gross` decimal(10,2) DEFAULT NULL COMMENT 'Full USD amount of the customers payment transaction, before payment_fee is subtracted',
  `settle_amount` decimal(10,2) DEFAULT NULL COMMENT 'Amount that is deposited into the account''s primary balance after a currency conversion',
  `settle_currency` varchar(3) DEFAULT NULL COMMENT 'Currency of settle amount. Three digit currency code',
  `auction_buyer_id` varchar(64) DEFAULT NULL COMMENT 'The customer''s auction ID.',
  `auction_closing_date` varchar(28) DEFAULT NULL COMMENT 'The auction''s close date. In the format: HH:MM:SS DD Mmm YY, YYYY PSD',
  `auction_multi_item` int(11) DEFAULT NULL COMMENT 'The number of items purchased in multi-item auction payments',
  `for_auction` varchar(10) DEFAULT NULL COMMENT 'This is an auction payment - payments made using Pay for eBay Items or Smart Logos - as well as send money/money request payments with the type eBay items or Auction Goods(non-eBay)',
  `subscr_date` varchar(28) DEFAULT NULL COMMENT 'Start date or cancellation date depending on whether txn_type is subcr_signup or subscr_cancel',
  `subscr_effective` varchar(28) DEFAULT NULL COMMENT 'Date when a subscription modification becomes effective',
  `period1` varchar(10) DEFAULT NULL COMMENT '(Optional) Trial subscription interval in days, weeks, months, years (example a 4 day interval is 4 D',
  `period2` varchar(10) DEFAULT NULL COMMENT '(Optional) Trial period',
  `period3` varchar(10) DEFAULT NULL COMMENT 'Regular subscription interval in days, weeks, months, years',
  `amount1` decimal(10,2) DEFAULT NULL COMMENT 'Amount of payment for Trial period 1 for USD',
  `amount2` decimal(10,2) DEFAULT NULL COMMENT 'Amount of payment for Trial period 2 for USD',
  `amount3` decimal(10,2) DEFAULT NULL COMMENT 'Amount of payment for regular subscription  period 1 for USD',
  `mc_amount1` decimal(10,2) DEFAULT NULL COMMENT 'Amount of payment for trial period 1 regardless of currency',
  `mc_amount2` decimal(10,2) DEFAULT NULL COMMENT 'Amount of payment for trial period 2 regardless of currency',
  `mc_amount3` decimal(10,2) DEFAULT NULL COMMENT 'Amount of payment for regular subscription period regardless of currency',
  `recurring` varchar(1) DEFAULT NULL COMMENT 'Indicates whether rate recurs (1 is yes, blank is no)',
  `reattempt` varchar(1) DEFAULT NULL COMMENT 'Indicates whether reattempts should occur on payment failure (1 is yes, blank is no)',
  `retry_at` varchar(28) DEFAULT NULL COMMENT 'Date PayPal will retry a failed subscription payment',
  `recur_times` int(11) DEFAULT NULL COMMENT 'The number of payment installations that will occur at the regular rate',
  `username` varchar(64) DEFAULT NULL COMMENT '(Optional) Username generated by PayPal and given to subscriber to access the subscription',
  `password` varchar(24) DEFAULT NULL COMMENT '(Optional) Password generated by PayPal and given to subscriber to access the subscription (Encrypted)',
  `subscr_id` varchar(19) DEFAULT NULL COMMENT 'ID generated by PayPal for the subscriber',
  `case_id` varchar(28) DEFAULT NULL COMMENT 'Case identification number',
  `case_type` varchar(28) DEFAULT NULL COMMENT 'complaint/chargeback',
  `case_creation_date` varchar(28) DEFAULT NULL COMMENT 'Date/Time the case was registered',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instant_payment_notifications`
--


-- --------------------------------------------------------

--
-- Table structure for table `mailqueues`
--

DROP TABLE IF EXISTS `mailqueues`;
CREATE TABLE IF NOT EXISTS `mailqueues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `to` varchar(100) NOT NULL,
  `from` varchar(100) NOT NULL,
  `subject` varchar(256) NOT NULL,
  `data` text NOT NULL,
  `template` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 => Queued\n1 => Sent\n2 => failed',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mailqueues_users1_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mailqueues`
--


-- --------------------------------------------------------

--
-- Table structure for table `paypal_items`
--

DROP TABLE IF EXISTS `paypal_items`;
CREATE TABLE IF NOT EXISTS `paypal_items` (
  `id` varchar(36) NOT NULL,
  `instant_payment_notification_id` varchar(36) NOT NULL,
  `item_name` varchar(127) DEFAULT NULL,
  `item_number` varchar(127) DEFAULT NULL,
  `quantity` varchar(127) DEFAULT NULL,
  `mc_gross` float(10,2) DEFAULT NULL,
  `mc_shipping` float(10,2) DEFAULT NULL,
  `mc_handling` float(10,2) DEFAULT NULL,
  `tax` float(10,2) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paypal_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
CREATE TABLE IF NOT EXISTS `platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Dumping data for table `platforms`
--

INSERT INTO `platforms` (`id`, `name`, `created`, `modified`) VALUES
(1, 'Blogs/Sites', '2013-06-02 16:52:52', '2013-06-02 16:52:52'),
(2, 'Mobile Apps', '2013-06-02 16:53:06', '2013-06-02 16:53:06'),
(3, 'Games', '2013-06-02 16:53:16', '2013-06-02 16:53:16'),
(4, 'Social Networks', '2013-06-02 16:53:28', '2013-06-02 16:53:28');

-- --------------------------------------------------------

--
-- Table structure for table `presignups`
--

DROP TABLE IF EXISTS `presignups`;
CREATE TABLE IF NOT EXISTS `presignups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(256) NOT NULL,
  `blog_url` varchar(256) DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(16) NOT NULL,
  `country` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `referral_url` varchar(256) NOT NULL,
  `type` enum('publisher','advertiser') NOT NULL DEFAULT 'publisher',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `presignups`
--

INSERT INTO `presignups` (`id`, `email`, `blog_url`, `status`, `ip`, `country`, `referral_url`, `type`, `created`, `modified`) VALUES
(5, 'anikendra@gmail.com', '', 0, '127.0.0.1', '', 'http://bit.ly/', 'publisher', '2013-05-28 18:08:12', '2013-05-28 18:08:12'),
(6, 'anikendra@hotmail.com', 'http://anikendra.com', 0, '127.0.0.1', '', 'http://bit.ly/', 'publisher', '2013-05-29 15:48:03', '2013-05-29 15:48:03'),
(7, 'anikendra@copublish.in', 'http://google.com', 0, '127.0.0.1', '', 'http://bit.ly/', 'publisher', '2013-05-29 15:53:34', '2013-05-29 15:53:34'),
(8, 'admin@copublish.in', 'http://youtube.com/anikendra', 0, '127.0.0.1', '', 'http://bit.ly/', 'advertiser', '2013-05-29 16:18:44', '2013-05-29 16:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `publisher_ips`
--

DROP TABLE IF EXISTS `publisher_ips`;
CREATE TABLE IF NOT EXISTS `publisher_ips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `ips` longtext,
  PRIMARY KEY (`id`),
  KEY `fk_publisher_ips_users1_idx` (`user_id`),
  KEY `fk_publisher_ips_campaigns1_idx` (`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `publisher_ips`
--


-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
CREATE TABLE IF NOT EXISTS `referrals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(256) NOT NULL,
  `presignup_id` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_referrals_presignups1_idx` (`presignup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `referrals`
--


-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
CREATE TABLE IF NOT EXISTS `regions` (
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
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
CREATE TABLE IF NOT EXISTS `sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(256) COLLATE utf8_bin NOT NULL,
  `url` varchar(64) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `user_id`, `title`, `url`, `description`, `created`, `modified`) VALUES
(1, 4, 'Testing Country', 'http://google.com', '#1', '2013-06-02 15:46:45', '2013-06-02 15:46:45'),
(2, 4, 'Testing Country via token input', 'http://google.com', '#1 search engine', '2013-06-02 15:51:11', '2013-06-02 15:51:11'),
(3, 4, 'Testing platform', 'http://facebook.com', '#1 social network', '2013-06-02 17:03:04', '2013-06-02 17:03:04'),
(4, 4, 'Testing Country', 'http://facebook.com', '#1', '2013-06-02 17:14:39', '2013-06-02 17:14:39'),
(5, 4, 'Testing tags', 'http://viraliti.com', 'failed startup', '2013-06-02 17:57:06', '2013-06-02 17:57:06'),
(6, 4, 'test tag again', 'http://tube8.com', 'porn site I prefer', '2013-06-02 17:58:23', '2013-06-02 17:58:23'),
(7, 4, 'test multiselect', 'http://vidoofy.com', 'multi select', '2013-06-03 17:57:18', '2013-06-03 17:57:18'),
(8, 4, 'Testing Country', 'http://google.com', '#1', '2013-06-03 18:05:42', '2013-06-03 18:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `sites_countries`
--

DROP TABLE IF EXISTS `sites_countries`;
CREATE TABLE IF NOT EXISTS `sites_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

--
-- Dumping data for table `sites_countries`
--

INSERT INTO `sites_countries` (`id`, `site_id`, `country_id`) VALUES
(1, 1, 1),
(2, 1, 195),
(3, 1, 197),
(4, 1, 198),
(5, 2, 113),
(6, 2, 254),
(7, 2, 253),
(8, 2, 43),
(9, 4, 113),
(10, 5, 113),
(11, 7, 113),
(12, 8, 253);

-- --------------------------------------------------------

--
-- Table structure for table `sites_platforms`
--

DROP TABLE IF EXISTS `sites_platforms`;
CREATE TABLE IF NOT EXISTS `sites_platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL,
  `platform_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=12 ;

--
-- Dumping data for table `sites_platforms`
--

INSERT INTO `sites_platforms` (`id`, `site_id`, `platform_id`) VALUES
(1, 3, 1),
(2, 3, 3),
(3, 3, 4),
(4, 4, 1),
(5, 4, 4),
(6, 5, 3),
(7, 6, 1),
(8, 7, 1),
(9, 7, 3),
(10, 7, 4),
(11, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sites_tags`
--

DROP TABLE IF EXISTS `sites_tags`;
CREATE TABLE IF NOT EXISTS `sites_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) unsigned NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Dumping data for table `sites_tags`
--

INSERT INTO `sites_tags` (`id`, `tag_id`, `site_id`) VALUES
(1, 4, 5),
(2, 2, 5),
(3, 5, 5),
(4, 6, 5),
(5, 7, 6),
(6, 8, 6),
(7, 4, 7),
(8, 8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
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

INSERT INTO `tags` (`id`, `tag`, `user_id`, `created`, `modified`) VALUES
(2, 'social', 4, '2013-06-02 17:29:55', '2013-06-02 17:29:55'),
(4, 'games', 4, '2013-06-02 17:46:02', '2013-06-02 17:46:02'),
(5, 'facebook', 4, '2013-06-02 17:46:54', '2013-06-02 17:46:54'),
(6, 'betting', 4, '2013-06-02 17:46:59', '2013-06-02 17:46:59'),
(7, 'sex', 4, '2013-06-02 17:57:52', '2013-06-02 17:57:52'),
(8, 'porn', 4, '2013-06-02 17:57:55', '2013-06-02 17:57:55');

-- --------------------------------------------------------

--
-- Table structure for table `targets`
--

DROP TABLE IF EXISTS `targets`;
CREATE TABLE IF NOT EXISTS `targets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(10) unsigned NOT NULL,
  `countries` text,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_targets_campaigns1_idx` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `targets`
--


-- --------------------------------------------------------

--
-- Table structure for table `target_categories`
--

DROP TABLE IF EXISTS `target_categories`;
CREATE TABLE IF NOT EXISTS `target_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target_id` int(10) unsigned NOT NULL,
  `name` varchar(256) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_target_categories_targets1_idx` (`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `target_categories`
--


-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `type` enum('views','referral','withdrawel') NOT NULL,
  `amount` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `date` date NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_transactions_users1_idx` (`user_id`),
  KEY `fk_transactions_campaigns1_idx` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `transactions`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
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

INSERT INTO `users` (`id`, `username`, `email`, `group_id`, `presignup_id`, `facebook_id`, `auth_token`, `twitter_id`, `twitter_screen_name`, `twitter_token`, `twitter_secret`, `first_name`, `last_name`, `zipcode`, `dob`, `gender`, `address_1`, `address_2`, `city`, `state`, `country`, `user_timezone`, `paypal_email`, `referral_url`, `referrer`, `active`, `password`, `password_reset`, `activation_code`, `created`, `modified`) VALUES
(4, 'anikendra@gmail.com', 'anikendra@gmail.com', 1, NULL, NULL, '', NULL, NULL, NULL, NULL, '', '', '', '0000-00-00', NULL, '', '', '', '', NULL, '-13.00', NULL, NULL, NULL, 1, '4c6064bc7386b8ace459a68ce456641bed6d6689', '', NULL, '2013-06-02 14:19:10', '2013-06-02 14:21:20');

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
CREATE TABLE IF NOT EXISTS `views` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `campaign_id` int(10) unsigned NOT NULL,
  `user_ip` varchar(32) NOT NULL,
  `referer` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unque_hit` (`user_ip`),
  KEY `fk_hits_campaigns1_idx` (`campaign_id`),
  KEY `fk_hits_users1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `views`
--


-- --------------------------------------------------------

--
-- Table structure for table `view_countries`
--

DROP TABLE IF EXISTS `view_countries`;
CREATE TABLE IF NOT EXISTS `view_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `view_id` int(10) unsigned NOT NULL,
  `country` varchar(4) NOT NULL,
  `views` int(10) unsigned NOT NULL,
  `day` date NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_view_countries_views1_idx` (`view_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `view_countries`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `aros_acos`
--
ALTER TABLE `aros_acos`
  ADD CONSTRAINT `fk_aros_acos_acos1` FOREIGN KEY (`aco_id`) REFERENCES `acos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aros_acos_aros1` FOREIGN KEY (`aro_id`) REFERENCES `aros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD CONSTRAINT `fk_campaigns_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `campaign_details`
--
ALTER TABLE `campaign_details`
  ADD CONSTRAINT `fk_campaign_details_campaigns1` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `referrals`
--
ALTER TABLE `referrals`
  ADD CONSTRAINT `fk_referrals_presignups1` FOREIGN KEY (`presignup_id`) REFERENCES `presignups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `targets`
--
ALTER TABLE `targets`
  ADD CONSTRAINT `fk_targets_campaigns1` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_transactions_campaigns1` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transactions_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_presignups1` FOREIGN KEY (`presignup_id`) REFERENCES `presignups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `views`
--
ALTER TABLE `views`
  ADD CONSTRAINT `fk_hits_campaigns1` FOREIGN KEY (`campaign_id`) REFERENCES `campaigns` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hits_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `view_countries`
--
ALTER TABLE `view_countries`
  ADD CONSTRAINT `fk_view_countries_views1` FOREIGN KEY (`view_id`) REFERENCES `views` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
