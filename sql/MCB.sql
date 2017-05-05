-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 04, 2017 at 07:55 PM
-- Server version: 5.6.28
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MCB`
--

-- --------------------------------------------------------

--
-- Table structure for table `beer`
--

DROP TABLE IF EXISTS `beer`;
CREATE TABLE `beer` (
  `beer_id` int(11) NOT NULL,
  `beer_name` varchar(128) NOT NULL,
  `beer_type_id` int(11) NOT NULL,
  `brewery_id` int(11) NOT NULL,
  `ABV` decimal(3,1) DEFAULT NULL,
  `IBU` decimal(3,1) DEFAULT NULL,
  `description` mediumtext,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `beer`
--

INSERT INTO `beer` (`beer_id`, `beer_name`, `beer_type_id`, `brewery_id`, `ABV`, `IBU`, `description`, `active`) VALUES
(1, 'Literally Just Orange Peels', 18, 1, '2.0', '99.9', 'Extremely bitter. Literally just orange peels steeped in water.', 1),
(2, 'Dennys\' Great Experiment', 1, 1, '4.0', '10.0', 'Designed to complement the Build Your Own Grand Slam at your local Denny\'s.', 1),
(3, 'Nothing Weird About This Beer', 2, 1, '5.0', '20.0', 'There is absolutely nothing suspicious about this beer.', 1),
(4, 'Beer 3: The Sequel: Official Beer of the Movie', 3, 1, '10.0', '30.0', 'Gentle, yet bitter enough to make you want popcorn, which you can get at the front desk for the low price of $10.99.', 1),
(5, 'Guaranteed to Stain', 4, 2, '8.0', '20.0', 'This beer is so foul that it is guaranteed to leave very obvious, permanent stains on anything it touches.', 1),
(6, 'Grog', 5, 2, '50.0', '99.9', 'Pirate drink of choice. Maim and pillage in style with the only authentic drink made by real pirates (tm).', 1),
(7, 'The One Beer Nobody Orders', 6, 2, '8.0', '15.0', 'Utterly average in every respect, this beer goes unordered because the owner forgot to put it on the menu.', 1),
(8, 'Not Really Beer At All', 1, 2, '0.0', '0.0', 'It says it\'s beer, but it\'s obvious that the owner has watered it down to the point of being indistinguishable from ordinary tap water.', 1),
(9, 'Inexplicably Frightening: The Beer', 15, 3, '13.3', '33.3', 'Nobody knows what it is and nobody wants to find out.', 1),
(10, 'Beer 4: Revenge of Beer', 12, 3, '10.0', '12.0', 'The sequel to the sequel to the sequel to the sequel to Beer, this drink has not changed in any appreciable way.', 1),
(11, 'Lemon Peels and That\'s It', 17, 3, '10.0', '50.0', 'A clone of a popular local drink.', 1),
(12, 'Fake Beer', 14, 3, '80.0', '40.0', 'A misguided attempt. Vodka with brown food dye. ', 1),
(13, 'Free Vegetables Beer', 13, 4, '9.0', '25.0', 'Comes with a voucher for leeks from the local co-op.', 1),
(14, 'Oops! All Yeast', 11, 4, '0.0', '30.0', 'For adventurous types, this "beer" is from the samples taken off the production line that fail to meet quality standards.', 1),
(15, 'Blue Moon', 2, 4, '5.4', '9.0', 'Normal Blue Moon beer with no alterations.', 1),
(16, 'Very Nearly Blue Moon', 3, 4, '10.0', '9.1', 'A homebrew attempt at Blue Moon by the owner of the bar.', 1),
(28, 'Smiling Irish Bastard', 5, 15, '6.0', '45.6', 'Our brewers\' favorite staple beer is copper in color with moderate maltiness and features grapefruit hop character. This pale is brewed with traditional Cascade hops from the Pacific Northwest that linger on your palette. The name says it all: American strong, like Officer Bernie Welch, a legend in the Bangor police force. From Freeses’ Department Store through “Devil’s Half Acre,” with his billy club in hand, he wiped the smile off more than one hooligan’s face while keeping Bangor’s downtown safe.', 1),
(29, 'Blue Moon 2', 2, 3, '5.4', '10.0', 'Completely made up.', 1),
(32, 'Beer', 1, 1, '0.0', '0.0', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `beer_type`
--

DROP TABLE IF EXISTS `beer_type`;
CREATE TABLE `beer_type` (
  `beer_type_id` int(11) NOT NULL,
  `beer_type_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `beer_type`
--

INSERT INTO `beer_type` (`beer_type_id`, `beer_type_name`) VALUES
(1, 'Pale Lager'),
(2, 'Witbier'),
(3, 'Pilsener'),
(4, 'Blonde Ale'),
(5, 'American Pale Ale'),
(6, 'India Pale Ale'),
(7, 'Weissbier'),
(8, 'Saison'),
(9, 'English Bitter'),
(10, 'Double IPA'),
(11, 'Dark Lager'),
(12, 'Amber Ale'),
(13, 'Bock'),
(14, 'Dunkelweizen'),
(15, 'Irish Dry Stout'),
(16, 'Doppelbock'),
(17, 'Porter'),
(18, 'Stout');

-- --------------------------------------------------------

--
-- Table structure for table `brewery`
--

DROP TABLE IF EXISTS `brewery`;
CREATE TABLE `brewery` (
  `brewery_id` int(11) NOT NULL,
  `brewery_name` varchar(128) NOT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `telephone_num` varchar(10) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `website` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brewery`
--

INSERT INTO `brewery` (`brewery_id`, `brewery_name`, `owner`, `telephone_num`, `location_id`, `website`) VALUES
(1, 'Alcohol Jefferson\'s House of Beer', 'Alcohol Jefferson', '2075551111', 1, 'freealcoholjefferson.com'),
(2, 'Beer Place', 'Beer McGee', '2075552222', 2, 'beerplace.com'),
(3, 'Engelbert\'s House of Beer and Beer Alone', 'Engelbert (Not That One)', '2075553333', 3, 'notthatengelbertshouseofbeerandbeeralone.com'),
(4, 'Beer 2: The Sequel To Beer', 'Anonymous', '2075554444', 4, 'beerpart2firstblood.net'),
(15, 'Geaghan\'s Brewery', 'Andy Geaghan', '2079453730', 44, '');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `street_address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `zipcode` int(5) NOT NULL,
  `state` char(2) DEFAULT 'ME'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `street_address`, `city`, `zipcode`, `state`) VALUES
(1, '10 Wilson Street', 'Brewer', 4412, 'ME'),
(2, '110 Union Street', 'Bangor', 4401, 'ME'),
(3, '19 Center Street', 'Orono', 4473, 'ME'),
(4, '192 Munson Road', 'Orono', 4469, 'ME'),
(44, '570 Main St', 'Bangor', 4401, 'ME'),
(45, '91 Munson Road', 'Orono', 4469, 'ME');

-- --------------------------------------------------------

--
-- Table structure for table `MCB_users`
--

DROP TABLE IF EXISTS `MCB_users`;
CREATE TABLE `MCB_users` (
  `user_id` int(11) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email_address` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MCB_users`
--

INSERT INTO `MCB_users` (`user_id`, `last_name`, `first_name`, `username`, `password`, `email_address`) VALUES
(2, 'Cole', 'Jonathan', 'jon', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'test@test.com');

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
CREATE TABLE `price` (
  `beer_id` int(11) NOT NULL,
  `beer_amount` int(11) NOT NULL,
  `cost` decimal(3,2) NOT NULL,
  `date` date NOT NULL,
  `retail_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`beer_id`, `beer_amount`, `cost`, `date`, `retail_id`) VALUES
(1, 1, '2.99', '0000-00-00', 1),
(2, 1, '2.89', '0000-00-00', 1),
(3, 1, '2.49', '0000-00-00', 1),
(4, 1, '2.00', '0000-00-00', 1),
(5, 1, '2.50', '0000-00-00', 2),
(6, 1, '2.15', '0000-00-00', 2),
(7, 8, '2.65', '0000-00-00', 2),
(8, 8, '2.22', '0000-00-00', 2),
(9, 1, '3.50', '0000-00-00', 3),
(10, 1, '9.99', '0000-00-00', 3),
(11, 1, '9.99', '0000-00-00', 3),
(12, 1, '4.50', '0000-00-00', 3),
(13, 1, '1.00', '0000-00-00', 4),
(14, 1, '2.00', '0000-00-00', 4),
(15, 1, '3.00', '0000-00-00', 4),
(16, 1, '3.50', '0000-00-00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `retail_outlet`
--

DROP TABLE IF EXISTS `retail_outlet`;
CREATE TABLE `retail_outlet` (
  `retail_id` int(11) NOT NULL,
  `retail_name` varchar(128) NOT NULL,
  `retail_type_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `retail_outlet`
--

INSERT INTO `retail_outlet` (`retail_id`, `retail_name`, `retail_type_id`, `location_id`) VALUES
(1, 'Alcohol Jefferson\'s Take-Out Beer', 1, 1),
(2, 'Beer Store', 2, 2),
(3, 'Engelbert (Not That One)\'s Beer Market', 3, 4),
(4, 'Beer 2: The Restaurant', 4, 3),
(21, 'Geaghan\'s Tap Room', 1, 44);

-- --------------------------------------------------------

--
-- Table structure for table `retail_type`
--

DROP TABLE IF EXISTS `retail_type`;
CREATE TABLE `retail_type` (
  `retail_type_id` int(11) NOT NULL,
  `retail_type_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `retail_type`
--

INSERT INTO `retail_type` (`retail_type_id`, `retail_type_name`) VALUES
(1, 'Tap Room'),
(2, 'Bar'),
(3, 'Restaurant'),
(4, 'Store');

-- --------------------------------------------------------

--
-- Table structure for table `ZIP`
--

DROP TABLE IF EXISTS `ZIP`;
CREATE TABLE `ZIP` (
  `ZIP` int(6) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `latitude` decimal(11,7) DEFAULT NULL,
  `longitude` decimal(11,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ZIP`
--

INSERT INTO `ZIP` (`ZIP`, `city`, `state`, `latitude`, `longitude`) VALUES
(3901, 'Berwick', 'ME', '43.2901600', '-70.8455900'),
(3902, 'Cape Neddick', 'ME', '43.2162500', '-70.6285600'),
(3903, 'Eliot', 'ME', '43.1354300', '-70.7934800'),
(3904, 'Kittery', 'ME', '43.1015300', '-70.7361100'),
(3905, 'Kittery Point', 'ME', '43.0851200', '-70.6960700'),
(3906, 'North Berwick', 'ME', '43.3275100', '-70.7646000'),
(3907, 'Ogunquit', 'ME', '43.2479300', '-70.5995200'),
(3908, 'South Berwick', 'ME', '43.2347800', '-70.7787600'),
(3909, 'York', 'ME', '43.1595300', '-70.6523900'),
(3910, 'York Beach', 'ME', '43.2116700', '-70.7320100'),
(3911, 'York Harbor', 'ME', '43.1554600', '-70.6357000'),
(4001, 'Acton', 'ME', '43.5481200', '-70.9318900'),
(4002, 'Alfred', 'ME', '43.4909300', '-70.6884000'),
(4003, 'Bailey Island', 'ME', '43.7307900', '-69.9944800'),
(4004, 'Bar Mills', 'ME', '43.3656500', '-70.6043700'),
(4005, 'Biddeford', 'ME', '43.4807000', '-70.4587100'),
(4006, 'Biddeford Pool', 'ME', '43.4360400', '-70.3598000'),
(4007, 'Biddeford', 'ME', '43.4581300', '-70.5053000'),
(4008, 'Bowdoinham', 'ME', '44.0230500', '-69.8836900'),
(4009, 'Bridgton', 'ME', '44.0591900', '-70.7255200'),
(4010, 'Brownfield', 'ME', '43.9387400', '-70.9004900'),
(4011, 'Brunswick', 'ME', '43.8992000', '-69.9589400'),
(4013, 'Bustins Island', 'ME', '44.4080700', '-70.4707000'),
(4014, 'Cape Porpoise', 'ME', '43.3656500', '-70.6043700'),
(4015, 'Casco', 'ME', '43.9525900', '-70.5137700'),
(4016, 'Center Lovell', 'ME', '44.1809600', '-70.8917200'),
(4017, 'Chebeague Island', 'ME', '43.7366200', '-70.1152200'),
(4019, 'Cliff Island', 'ME', '43.6968700', '-70.0944800'),
(4020, 'Cornish', 'ME', '43.7736000', '-70.8087800'),
(4021, 'Cumberland Center', 'ME', '43.7982500', '-70.2655400'),
(4022, 'Denmark', 'ME', '43.9690000', '-70.7880400'),
(4024, 'East Baldwin', 'ME', '43.8238400', '-70.6848200'),
(4027, 'Lebanon', 'ME', '43.4033400', '-70.9171900'),
(4028, 'East Parsonfield', 'ME', '43.7323900', '-70.8451100'),
(4029, 'Sebago', 'ME', '43.8873500', '-70.6775500'),
(4030, 'East Waterboro', 'ME', '43.5858600', '-70.6793000'),
(4031, 'Raymond', 'ME', '43.9169100', '-70.4391100'),
(4032, 'Freeport', 'ME', '43.8437700', '-70.1017200'),
(4033, 'Freeport', 'ME', '44.4080700', '-70.4707000'),
(4034, 'Freeport', 'ME', '44.4080700', '-70.4707000'),
(4037, 'Fryeburg', 'ME', '44.0508500', '-70.9564800'),
(4038, 'Gorham', 'ME', '43.6971100', '-70.4630100'),
(4039, 'Gray', 'ME', '43.8795700', '-70.3533000'),
(4040, 'Harrison', 'ME', '44.1038900', '-70.6532700'),
(4041, 'Hiram', 'ME', '43.8717300', '-70.8339100'),
(4042, 'Hollis Center', 'ME', '43.6112300', '-70.6326500'),
(4043, 'Kennebunk', 'ME', '43.3855100', '-70.5470700'),
(4046, 'Kennebunkport', 'ME', '43.3994900', '-70.4769000'),
(4047, 'Parsonsfield', 'ME', '43.7550000', '-70.8983000'),
(4048, 'Limerick', 'ME', '43.6827900', '-70.7717800'),
(4049, 'Limington', 'ME', '43.7338100', '-70.7026300'),
(4050, 'Long Island', 'ME', '43.6926800', '-70.1547500'),
(4051, 'Lovell', 'ME', '44.1722700', '-70.8723100'),
(4053, 'Merepoint', 'ME', '44.4080700', '-70.4707000'),
(4054, 'Moody', 'ME', '43.2763400', '-70.5977500'),
(4055, 'Naples', 'ME', '43.9599700', '-70.6031200'),
(4056, 'Newfield', 'ME', '43.6583700', '-70.8688700'),
(4057, 'North Bridgton', 'ME', '44.4080700', '-70.4707000'),
(4061, 'North Waterboro', 'ME', '43.6431900', '-70.7303300'),
(4062, 'Windham', 'ME', '43.8106700', '-70.4169700'),
(4063, 'Ocean Park', 'ME', '43.5048800', '-70.3857000'),
(4064, 'Old Orchard Beach', 'ME', '43.5148600', '-70.3856000'),
(4065, 'Ellsworth', 'ME', '44.5409800', '-68.4232900'),
(4066, 'Orrs Island', 'ME', '43.7634000', '-69.9703800'),
(4068, 'Porter', 'ME', '43.8338300', '-70.9309400'),
(4069, 'Pownal', 'ME', '43.9126100', '-70.1789300'),
(4070, 'Scarborough', 'ME', '43.5769800', '-70.2736400'),
(4071, 'Raymond', 'ME', '43.9172000', '-70.4723300'),
(4072, 'Saco', 'ME', '43.5273200', '-70.4517100'),
(4073, 'Sanford', 'ME', '43.4267900', '-70.7524500'),
(4074, 'Scarborough', 'ME', '43.5832200', '-70.3526800'),
(4075, 'Sebago Lake', 'ME', '43.7960500', '-70.5521800'),
(4076, 'Shapleigh', 'ME', '43.5530700', '-70.8451500'),
(4077, 'South Casco', 'ME', '43.9100200', '-70.5245200'),
(4078, 'South Freeport', 'ME', '43.8207700', '-70.1207800'),
(4079, 'Harpswell', 'ME', '43.7973900', '-69.9521700'),
(4081, 'South Waterford', 'ME', '44.5661500', '-70.6615500'),
(4082, 'South Windham', 'ME', '44.4080700', '-70.4707000'),
(4083, 'Springvale', 'ME', '43.4670300', '-70.8027500'),
(4084, 'Standish', 'ME', '43.7615900', '-70.5643300'),
(4085, 'Steep Falls', 'ME', '43.7704300', '-70.6381200'),
(4086, 'Topsham', 'ME', '43.9467400', '-69.9616300'),
(4087, 'Waterboro', 'ME', '43.5606600', '-70.7549700'),
(4088, 'Waterford', 'ME', '44.1907600', '-70.7075700'),
(4090, 'Wells', 'ME', '43.3202100', '-70.6117800'),
(4091, 'West Baldwin', 'ME', '43.8248800', '-70.7503800'),
(4092, 'Westbrook', 'ME', '43.6821400', '-70.3582300'),
(4093, 'West Buxton', 'ME', '43.6603800', '-70.5749200'),
(4094, 'West Kennebunk', 'ME', '43.4061000', '-70.5732500'),
(4095, 'West Newfield', 'ME', '43.6426300', '-70.9121800'),
(4096, 'Yarmouth', 'ME', '43.8017700', '-70.1793200'),
(4097, 'North Yarmouth', 'ME', '43.8427900', '-70.2298500'),
(4098, 'Westbrook', 'ME', '44.4080700', '-70.4707000'),
(4101, 'Portland', 'ME', '43.6605200', '-70.2586200'),
(4102, 'Portland', 'ME', '43.6586300', '-70.2911000'),
(4103, 'Portland', 'ME', '43.6858800', '-70.2903000'),
(4104, 'Portland', 'ME', '43.8464900', '-70.4648300'),
(4105, 'Falmouth', 'ME', '43.7367300', '-70.2602700'),
(4106, 'South Portland', 'ME', '43.6315400', '-70.2727200'),
(4107, 'Cape Elizabeth', 'ME', '43.6047300', '-70.2261700'),
(4108, 'Peaks Island', 'ME', '43.6651700', '-70.1947500'),
(4109, 'Portland', 'ME', '43.6783300', '-70.1987400'),
(4110, 'Cumberland Foreside', 'ME', '43.7603600', '-70.1968100'),
(4112, 'Portland', 'ME', '44.4080700', '-70.4707000'),
(4116, 'South Portland', 'ME', '44.4080700', '-70.4707000'),
(4122, 'Portland', 'ME', '44.4080700', '-70.4707000'),
(4123, 'Portland', 'ME', '44.4080700', '-70.4707000'),
(4124, 'Portland', 'ME', '44.4080700', '-70.4707000'),
(4210, 'Auburn', 'ME', '44.0891700', '-70.2414300'),
(4211, 'Auburn', 'ME', '44.1970000', '-70.2394800'),
(4212, 'Auburn', 'ME', '44.1970000', '-70.2394800'),
(4216, 'Andover', 'ME', '44.6618900', '-70.7995200'),
(4217, 'Bethel', 'ME', '44.3721200', '-70.8175000'),
(4219, 'Bryant Pond', 'ME', '44.3869500', '-70.6308200'),
(4220, 'Buckfield', 'ME', '44.2952600', '-70.3671000'),
(4221, 'Canton', 'ME', '44.4236500', '-70.3137800'),
(4222, 'Durham', 'ME', '43.9725000', '-70.1229100'),
(4223, 'Danville', 'ME', '44.0238700', '-70.2857400'),
(4224, 'Dixfield', 'ME', '44.5555800', '-70.4138300'),
(4225, 'Dryden', 'ME', '44.6027000', '-70.2265100'),
(4226, 'East Andover', 'ME', '44.6141300', '-70.6988200'),
(4227, 'East Dixfield', 'ME', '44.5791300', '-70.3263300'),
(4228, 'East Livermore', 'ME', '44.4009900', '-70.1338300'),
(4230, 'East Poland', 'ME', '44.0626700', '-70.3270400'),
(4231, 'Stoneham', 'ME', '44.2615600', '-70.8704400'),
(4234, 'East Wilton', 'ME', '44.6175000', '-70.1820100'),
(4236, 'Greene', 'ME', '44.1944000', '-70.1418100'),
(4237, 'Hanover', 'ME', '44.4928100', '-70.7356000'),
(4238, 'Hebron', 'ME', '44.1974100', '-70.3697500'),
(4239, 'Jay', 'ME', '44.5164700', '-70.2193300'),
(4240, 'Lewiston', 'ME', '44.0947700', '-70.1914100'),
(4241, 'Lewiston', 'ME', '44.1970000', '-70.2394800'),
(4243, 'Lewiston', 'ME', '44.1970000', '-70.2394800'),
(4250, 'Lisbon', 'ME', '44.0275000', '-70.1097000'),
(4252, 'Lisbon Falls', 'ME', '44.0098200', '-70.0563100'),
(4253, 'Livermore', 'ME', '44.4085700', '-70.2245200'),
(4254, 'Livermore Falls', 'ME', '44.4709600', '-70.1748600'),
(4255, 'Locke Mills', 'ME', '44.3597600', '-70.6723100'),
(4256, 'Mechanic Falls', 'ME', '44.1047200', '-70.3919700'),
(4257, 'Mexico', 'ME', '44.5569800', '-70.5335100'),
(4258, 'Minot', 'ME', '44.1549200', '-70.3331900'),
(4259, 'Monmouth', 'ME', '44.2318100', '-69.9989700'),
(4260, 'New Gloucester', 'ME', '43.9573700', '-70.2948800'),
(4261, 'Newry', 'ME', '44.5705300', '-70.8759900'),
(4262, 'North Jay', 'ME', '45.0633800', '-70.3816300'),
(4263, 'Leeds', 'ME', '44.2838400', '-70.1125400'),
(4265, 'North Monmouth', 'ME', '44.2819900', '-70.0402700'),
(4266, 'North Turner', 'ME', '44.3579800', '-70.2557800'),
(4267, 'North Waterford', 'ME', '44.5661500', '-70.6615500'),
(4268, 'Norway', 'ME', '44.2235800', '-70.5836600'),
(4270, 'Oxford', 'ME', '44.1146100', '-70.5050600'),
(4271, 'Paris', 'ME', '44.2641100', '-70.4985100'),
(4273, 'Hanover', 'ME', '44.4981900', '-70.6970200'),
(4274, 'Poland', 'ME', '44.0491500', '-70.3907700'),
(4275, 'Roxbury', 'ME', '44.7270700', '-70.6478000'),
(4276, 'Rumford', 'ME', '44.5359900', '-70.5660900'),
(4278, 'Rumford Center', 'ME', '44.3770300', '-70.5680400'),
(4279, 'Rumford', 'ME', '44.5642100', '-70.7158600'),
(4280, 'Sabattus', 'ME', '44.1190000', '-70.0756800'),
(4281, 'South Paris', 'ME', '44.2351400', '-70.5050800'),
(4282, 'Turner', 'ME', '44.2668400', '-70.2456300'),
(4283, 'Turner Center', 'ME', '44.1970000', '-70.2394800'),
(4284, 'Wayne', 'ME', '44.3495400', '-70.0569800'),
(4285, 'Weld', 'ME', '44.6970700', '-70.4327500'),
(4286, 'West Bethel', 'ME', '44.4020500', '-70.8600900'),
(4287, 'Bowdoin', 'ME', '44.0481500', '-69.9684700'),
(4288, 'West Minot', 'ME', '44.1970000', '-70.2394800'),
(4289, 'West Paris', 'ME', '44.3252800', '-70.5245100'),
(4290, 'Peru', 'ME', '44.4946200', '-70.4372600'),
(4291, 'West Poland', 'ME', '44.0408500', '-70.4530000'),
(4292, 'Sumner', 'ME', '44.3838200', '-70.4353300'),
(4294, 'Wilton', 'ME', '44.6022600', '-70.2290600'),
(4321, 'Stoneham', 'ME', '44.2092100', '-70.8180400'),
(4327, 'Richmond', 'ME', '44.0915600', '-69.8040700'),
(4330, 'Augusta', 'ME', '44.3444000', '-69.7634500'),
(4332, 'Augusta', 'ME', '44.4140500', '-69.7519100'),
(4333, 'Augusta', 'ME', '44.4140500', '-69.7519100'),
(4336, 'Augusta', 'ME', '44.3156900', '-69.8180000'),
(4338, 'Augusta', 'ME', '44.4140500', '-69.7519100'),
(4341, 'Coopers Mills', 'ME', '44.2587700', '-69.5510200'),
(4342, 'Dresden', 'ME', '44.0768500', '-69.7501200'),
(4343, 'East Winthrop', 'ME', '44.4140500', '-69.7519100'),
(4344, 'Farmingdale', 'ME', '44.2604300', '-69.8012200'),
(4345, 'Gardiner', 'ME', '44.2114900', '-69.8086600'),
(4346, 'Randolph', 'ME', '44.2349100', '-69.7572200'),
(4347, 'Hallowell', 'ME', '44.2868000', '-69.7978800'),
(4348, 'Jefferson', 'ME', '44.2127800', '-69.4971000'),
(4349, 'Kents Hill', 'ME', '44.4297700', '-70.0645600'),
(4350, 'Litchfield', 'ME', '44.1740500', '-69.9336300'),
(4351, 'Manchester', 'ME', '44.3069500', '-69.8751800'),
(4352, 'Mount Vernon', 'ME', '44.4659900', '-69.9607300'),
(4353, 'Whitefield', 'ME', '44.2098700', '-69.6042700'),
(4354, 'Palermo', 'ME', '44.3849000', '-69.4136000'),
(4355, 'Readfield', 'ME', '44.3768000', '-69.9635300'),
(4357, 'Richmond', 'ME', '44.1172300', '-69.8294700'),
(4358, 'South China', 'ME', '44.4289100', '-69.5267900'),
(4359, 'South Gardiner', 'ME', '44.1832600', '-69.7771900'),
(4360, 'Vienna', 'ME', '44.5484500', '-69.9850000'),
(4363, 'Windsor', 'ME', '44.3002400', '-69.5744000'),
(4364, 'Winthrop', 'ME', '44.3184200', '-69.9599700'),
(4401, 'Bangor', 'ME', '44.8177700', '-68.7895200'),
(4402, 'Bangor', 'ME', '45.5198600', '-68.6474100'),
(4406, 'Abbot', 'ME', '45.2219300', '-69.4903900'),
(4408, 'Aurora', 'ME', '44.8733200', '-68.2331100'),
(4410, 'Bradford', 'ME', '45.0882900', '-68.9099700'),
(4411, 'Bradley', 'ME', '44.9117300', '-68.6210000'),
(4412, 'Brewer', 'ME', '44.7869600', '-68.7547000'),
(4413, 'Brookton', 'ME', '45.5386600', '-67.7529500'),
(4414, 'Brownville', 'ME', '45.3692100', '-69.0343100'),
(4415, 'Brownville Junction', 'ME', '45.3511800', '-69.0580600'),
(4416, 'Bucksport', 'ME', '44.6098100', '-68.7830300'),
(4417, 'Burlington', 'ME', '45.2641100', '-68.4208700'),
(4418, 'Cardville', 'ME', '45.1103300', '-68.6210300'),
(4419, 'Carmel', 'ME', '44.7896000', '-69.0058700'),
(4420, 'Castine', 'ME', '44.4129600', '-68.7980400'),
(4421, 'Castine', 'ME', '44.4059200', '-68.7934100'),
(4422, 'Charleston', 'ME', '45.0609400', '-69.0352700'),
(4423, 'Costigan', 'ME', '45.0189500', '-68.4898700'),
(4424, 'Danforth', 'ME', '45.6794500', '-67.8620800'),
(4426, 'Dover Foxcroft', 'ME', '45.1950500', '-69.1886100'),
(4427, 'Corinth', 'ME', '44.9799800', '-69.0074600'),
(4428, 'Eddington', 'ME', '44.7982800', '-68.5694000'),
(4429, 'Holden', 'ME', '44.7006000', '-68.5968200'),
(4430, 'East Millinocket', 'ME', '45.6318200', '-68.5817800'),
(4431, 'East Orland', 'ME', '44.5680100', '-68.6811600'),
(4434, 'Etna', 'ME', '44.8021800', '-69.1421200'),
(4435, 'Exeter', 'ME', '44.9619100', '-69.1221400'),
(4438, 'Frankfort', 'ME', '44.6116500', '-68.9196500'),
(4441, 'Greenville', 'ME', '45.5176900', '-69.5223000'),
(4442, 'Greenville Junction', 'ME', '45.4798300', '-69.6277300'),
(4443, 'Guilford', 'ME', '45.2457800', '-69.3719100'),
(4444, 'Hampden', 'ME', '44.7357400', '-68.9251800'),
(4448, 'Howland', 'ME', '45.2410900', '-68.6702500'),
(4449, 'Hudson', 'ME', '44.9996200', '-68.8843100'),
(4450, 'Kenduskeag', 'ME', '44.9217500', '-68.9312500'),
(4451, 'Kingman', 'ME', '45.5488100', '-68.2084100'),
(4453, 'Lagrange', 'ME', '45.1849400', '-68.7888100'),
(4454, 'Lambert Lake', 'ME', '45.0029600', '-67.4955400'),
(4455, 'Lee', 'ME', '45.3339700', '-68.2931300'),
(4456, 'Levant', 'ME', '44.8762800', '-68.9871200'),
(4457, 'Lincoln', 'ME', '45.3689300', '-68.4835400'),
(4459, 'Mattawamkeag', 'ME', '45.5185300', '-68.3362300'),
(4460, 'Medway', 'ME', '45.6386100', '-68.5201200'),
(4461, 'Milford', 'ME', '44.9567700', '-68.6219900'),
(4462, 'Millinocket', 'ME', '45.6469100', '-68.7480100'),
(4463, 'Milo', 'ME', '45.2416100', '-68.9510100'),
(4464, 'Monson', 'ME', '45.3039100', '-69.5136800'),
(4465, 'Cary', 'ME', '45.9613300', '-67.8240000'),
(4467, 'Olamon', 'ME', '45.5198600', '-68.6474100'),
(4468, 'Old Town', 'ME', '44.9515500', '-68.6788900'),
(4469, 'Orono', 'ME', '45.0027900', '-68.6334300'),
(4471, 'Orient', 'ME', '45.9095100', '-67.8585600'),
(4472, 'Orland', 'ME', '44.5604700', '-68.6908400'),
(4473, 'Orono', 'ME', '44.8892400', '-68.6817700'),
(4474, 'Orrington', 'ME', '44.7213900', '-68.7890500'),
(4475, 'Passadumkeag', 'ME', '45.1918100', '-68.5895300'),
(4476, 'Penobscot', 'ME', '44.4447000', '-68.7357600'),
(4478, 'Rockwood', 'ME', '45.7045900', '-69.8087900'),
(4479, 'Sangerville', 'ME', '45.1298100', '-69.3257100'),
(4481, 'Sebec', 'ME', '45.7923600', '-69.3046300'),
(4485, 'Shirley Mills', 'ME', '45.7923600', '-69.3046300'),
(4487, 'Springfield', 'ME', '45.3861800', '-68.0816300'),
(4488, 'Stetson', 'ME', '44.8918600', '-69.1108000'),
(4489, 'Stillwater', 'ME', '44.9223600', '-68.6867900'),
(4490, 'Topsfield', 'ME', '45.4264600', '-67.7600900'),
(4491, 'Vanceboro', 'ME', '45.0029600', '-67.4955400'),
(4492, 'Waite', 'ME', '45.0029600', '-67.4955400'),
(4493, 'West Enfield', 'ME', '45.2474000', '-68.5181900'),
(4495, 'Winn', 'ME', '45.4843800', '-68.3766200'),
(4496, 'Winterport', 'ME', '44.6576900', '-68.8957000'),
(4497, 'Wytopitlock', 'ME', '45.7335400', '-68.0587500'),
(4530, 'Bath', 'ME', '43.9006500', '-69.8340500'),
(4535, 'Alna', 'ME', '44.0849800', '-69.6253500'),
(4536, 'Bayville', 'ME', '44.0213300', '-69.5232600'),
(4537, 'Boothbay', 'ME', '43.9078100', '-69.6460800'),
(4538, 'Boothbay Harbor', 'ME', '43.8542400', '-69.6321700'),
(4539, 'Bristol', 'ME', '43.9651200', '-69.5052900'),
(4541, 'Chamberlain', 'ME', '43.8856800', '-69.4795000'),
(4543, 'Damariscotta', 'ME', '44.0365300', '-69.4884100'),
(4544, 'East Boothbay', 'ME', '43.8326400', '-69.5890300'),
(4546, 'Georgetown', 'ME', '43.7670100', '-69.7498100'),
(4547, 'Friendship', 'ME', '43.9836600', '-69.3388500'),
(4548, 'Georgetown', 'ME', '43.8105400', '-69.7432500'),
(4549, 'Isle Of Springs', 'ME', '44.0213300', '-69.5232600'),
(4551, 'Bremen', 'ME', '43.9996100', '-69.4373800'),
(4552, 'Newagen', 'ME', '44.0213300', '-69.5232600'),
(4553, 'Newcastle', 'ME', '44.0487100', '-69.5433500'),
(4554, 'New Harbor', 'ME', '43.8630200', '-69.5131400'),
(4555, 'Nobleboro', 'ME', '44.0961900', '-69.4785700'),
(4556, 'Edgecomb', 'ME', '43.9734700', '-69.6351600'),
(4557, 'Richmond', 'ME', '44.0904700', '-69.8039300'),
(4558, 'Pemaquid', 'ME', '43.8938400', '-69.5204100'),
(4562, 'Phippsburg', 'ME', '43.7931300', '-69.8177800'),
(4563, 'Cushing', 'ME', '43.9933500', '-69.2681900'),
(4564, 'Round Pond', 'ME', '43.9374600', '-69.4572100'),
(4565, 'Sebasco Estates', 'ME', '43.7733100', '-69.8634600'),
(4567, 'Small Point', 'ME', '43.9008500', '-69.8595400'),
(4568, 'South Bristol', 'ME', '43.8639000', '-69.5587400'),
(4570, 'Squirrel Island', 'ME', '44.0213300', '-69.5232600'),
(4571, 'Trevett', 'ME', '43.8826100', '-69.6801400'),
(4572, 'Waldoboro', 'ME', '44.1063700', '-69.3717700'),
(4573, 'Walpole', 'ME', '43.9496700', '-69.5513300'),
(4574, 'Washington', 'ME', '44.2740000', '-69.3889600'),
(4575, 'West Boothbay Harbor', 'ME', '43.8545300', '-69.6607900'),
(4576, 'Southport', 'ME', '43.8230000', '-69.6666100'),
(4578, 'Wiscasset', 'ME', '43.9743600', '-69.6836600'),
(4579, 'Woolwich', 'ME', '43.9499000', '-69.7829800'),
(4600, 'Winter Harbor', 'ME', '44.3969500', '-68.0811800'),
(4605, 'Ellsworth', 'ME', '44.6148800', '-68.4362600'),
(4606, 'Addison', 'ME', '44.5560700', '-67.7012200'),
(4607, 'Gouldsboro', 'ME', '44.4956900', '-68.0946700'),
(4609, 'Bar Harbor', 'ME', '44.4025900', '-68.2620400'),
(4611, 'Beals', 'ME', '44.5078000', '-67.6025000'),
(4612, 'Bernard', 'ME', '44.2473900', '-68.3710400'),
(4613, 'Birch Harbor', 'ME', '44.3788600', '-68.0291500'),
(4614, 'Blue Hill', 'ME', '44.4130500', '-68.5815600'),
(4615, 'Blue Hill Falls', 'ME', '44.3544700', '-68.5478100'),
(4616, 'Brooklin', 'ME', '44.2753200', '-68.5595600'),
(4617, 'Brooksville', 'ME', '44.3635800', '-68.7439900'),
(4619, 'Calais', 'ME', '45.1660400', '-67.2424300'),
(4621, 'Eastport', 'ME', '44.9047800', '-66.9905200'),
(4622, 'Cherryfield', 'ME', '44.6867300', '-67.9916600'),
(4623, 'Columbia Falls', 'ME', '44.6954900', '-67.7395000'),
(4624, 'Corea', 'ME', '44.4280400', '-67.9882800'),
(4625, 'Cranberry Isles', 'ME', '44.2487100', '-68.2599100'),
(4626, 'Cutler', 'ME', '44.6732800', '-67.2394600'),
(4627, 'Deer Isle', 'ME', '44.2211400', '-68.6689400'),
(4628, 'Dennysville', 'ME', '44.8945600', '-67.2324000'),
(4629, 'East Blue Hill', 'ME', '44.4140900', '-68.5131300'),
(4630, 'East Machias', 'ME', '44.7539900', '-67.3786000'),
(4631, 'Eastport', 'ME', '44.9137400', '-67.0039100'),
(4634, 'Franklin', 'ME', '44.6178400', '-68.2354600'),
(4635, 'Frenchboro', 'ME', '44.1244700', '-68.3499500'),
(4637, 'Grand Lake Stream', 'ME', '45.1856300', '-67.6010200'),
(4640, 'Hancock', 'ME', '44.5245200', '-68.2829800'),
(4642, 'Harborside', 'ME', '44.3224200', '-68.8093300'),
(4643, 'Harrington', 'ME', '44.5991300', '-67.8253300'),
(4644, 'Hulls Cove', 'ME', '44.6418700', '-68.3914800'),
(4645, 'Isle Au Haut', 'ME', '44.0588000', '-68.6168500'),
(4646, 'Islesford', 'ME', '44.2582000', '-68.2277000'),
(4648, 'Jonesboro', 'ME', '44.6632000', '-67.5953800'),
(4649, 'Jonesport', 'ME', '44.5546600', '-67.5780800'),
(4650, 'Little Deer Isle', 'ME', '44.2864600', '-68.7109800'),
(4652, 'Lubec', 'ME', '44.8187300', '-67.0499600'),
(4653, 'Bass Harbor', 'ME', '44.2486100', '-68.3521000'),
(4654, 'Machias', 'ME', '44.8026300', '-67.5472700'),
(4655, 'Machiasport', 'ME', '44.6327000', '-67.3941600'),
(4656, 'Manset', 'ME', '44.6418700', '-68.3914800'),
(4657, 'Meddybemps', 'ME', '44.9710900', '-67.3854900'),
(4658, 'Milbridge', 'ME', '44.5120000', '-67.8782700'),
(4660, 'Mount Desert', 'ME', '44.3462900', '-68.3431700'),
(4662, 'Northeast Harbor', 'ME', '44.2910700', '-68.2814300'),
(4664, 'Sullivan', 'ME', '44.5280900', '-68.2233300'),
(4665, 'Otter Creek', 'ME', '44.6418700', '-68.3914800'),
(4666, 'Pembroke', 'ME', '44.9751100', '-67.1946000'),
(4667, 'Perry', 'ME', '44.9729600', '-67.0869700'),
(4668, 'Princeton', 'ME', '45.1885500', '-67.5906300'),
(4669, 'Prospect Harbor', 'ME', '44.4086900', '-68.0114200'),
(4671, 'Robbinston', 'ME', '45.0766200', '-67.1405700'),
(4672, 'Salsbury Cove', 'ME', '44.4304300', '-68.2849000'),
(4673, 'Sargentville', 'ME', '44.3056800', '-68.6784200'),
(4674, 'Seal Cove', 'ME', '44.2957100', '-68.4009200'),
(4675, 'Seal Harbor', 'ME', '44.2981000', '-68.2407500'),
(4676, 'Sedgwick', 'ME', '44.3330900', '-68.6569300'),
(4677, 'Sorrento', 'ME', '44.4826000', '-68.1818500'),
(4679, 'Southwest Harbor', 'ME', '44.2784500', '-68.3218600'),
(4680, 'Steuben', 'ME', '44.5103000', '-67.9487900'),
(4681, 'Stonington', 'ME', '44.1682100', '-68.6640500'),
(4683, 'Sunset', 'ME', '44.2149200', '-68.7769000'),
(4684, 'Surry', 'ME', '44.4906300', '-68.5008500'),
(4685, 'Swans Island', 'ME', '44.1615800', '-68.4460700'),
(4686, 'Wesley', 'ME', '45.0029600', '-67.4955400'),
(4690, 'West Tremont', 'ME', '44.6418700', '-68.3914800'),
(4691, 'Whiting', 'ME', '44.7900800', '-67.2478900'),
(4693, 'Winter Harbor', 'ME', '44.3848400', '-68.0945800'),
(4694, 'Baileyville', 'ME', '45.1165200', '-67.4248400'),
(4724, 'Poland', 'ME', '43.9959600', '-70.4103700'),
(4730, 'Houlton', 'ME', '46.1267200', '-67.8779800'),
(4732, 'Ashland', 'ME', '46.6400500', '-68.4280400'),
(4733, 'Benedicta', 'ME', '45.8107800', '-68.3997400'),
(4734, 'Blaine', 'ME', '46.5161600', '-68.8868200'),
(4735, 'Bridgewater', 'ME', '46.4217900', '-67.8941700'),
(4736, 'Caribou', 'ME', '46.8788600', '-68.0112800'),
(4737, 'Clayton Lake', 'ME', '46.5161600', '-68.8868200'),
(4738, 'Crouseville', 'ME', '46.5161600', '-68.8868200'),
(4739, 'Eagle Lake', 'ME', '47.0422200', '-68.6158800'),
(4740, 'Easton', 'ME', '46.6570000', '-67.8633800'),
(4741, 'Estcourt Station', 'ME', '46.5161600', '-68.8868200'),
(4742, 'Fort Fairfield', 'ME', '46.7747500', '-67.8501200'),
(4743, 'Fort Kent', 'ME', '47.2095400', '-68.5723800'),
(4744, 'Fort Kent Mills', 'ME', '46.5161600', '-68.8868200'),
(4745, 'Frenchville', 'ME', '47.2851900', '-68.3871600'),
(4746, 'Grand Isle', 'ME', '47.2811200', '-68.1427700'),
(4747, 'Island Falls', 'ME', '46.0045200', '-68.2700400'),
(4750, 'Limestone', 'ME', '46.9366100', '-67.8647100'),
(4751, 'Limestone', 'ME', '46.8929100', '-67.9643000'),
(4752, 'Ashland', 'ME', '46.6024700', '-68.4101300'),
(4756, 'Madawaska', 'ME', '47.3459300', '-68.3225600'),
(4757, 'Mapleton', 'ME', '46.6861900', '-68.1470000'),
(4758, 'Mars Hill', 'ME', '46.5124000', '-67.8665500'),
(4759, 'Masardis', 'ME', '46.4978900', '-68.3725100'),
(4760, 'Monticello', 'ME', '46.3118400', '-67.8551800'),
(4761, 'New Limerick', 'ME', '46.1004400', '-68.0033700'),
(4762, 'New Sweden', 'ME', '46.9538000', '-68.1204000'),
(4763, 'Oakfield', 'ME', '46.1047300', '-68.1139800'),
(4764, 'Oxbow', 'ME', '46.4166500', '-68.4764600'),
(4765, 'Patten', 'ME', '46.0242100', '-68.4924100'),
(4766, 'Perham', 'ME', '46.8697600', '-68.2929000'),
(4768, 'Portage', 'ME', '46.7781900', '-68.4992000'),
(4769, 'Presque Isle', 'ME', '46.6793200', '-68.0021600'),
(4770, 'Quimby', 'ME', '46.5161600', '-68.8868200'),
(4772, 'Saint Agatha', 'ME', '47.2417100', '-68.3393100'),
(4773, 'Saint David', 'ME', '47.2819500', '-68.2395900'),
(4774, 'Saint Francis', 'ME', '47.1197900', '-69.0025800'),
(4775, 'Sheridan', 'ME', '46.5161600', '-68.8868200'),
(4776, 'Sherman Mills', 'ME', '45.8641000', '-68.3398600'),
(4777, 'Sherman Station', 'ME', '45.8804300', '-68.4517300'),
(4779, 'Sinclair', 'ME', '47.1652500', '-68.2728800'),
(4780, 'Smyrna Mills', 'ME', '46.1641600', '-68.2323200'),
(4781, 'Soldier Pond', 'ME', '47.1631400', '-68.5891500'),
(4782, 'Stacyville', 'ME', '45.5198600', '-68.6474100'),
(4783, 'Stockholm', 'ME', '47.0493000', '-68.2082300'),
(4785, 'Van Buren', 'ME', '47.1468500', '-67.9471800'),
(4786, 'Washburn', 'ME', '46.7855100', '-68.1687100'),
(4787, 'Westfield', 'ME', '46.5746900', '-67.9653100'),
(4788, 'Winterville', 'ME', '46.5161600', '-68.8868200'),
(4840, 'Camden', 'ME', '44.2101100', '-69.1136200'),
(4841, 'Rockland', 'ME', '44.1087300', '-69.1136600'),
(4842, 'Owls Head', 'ME', '44.0869800', '-69.1042300'),
(4843, 'Camden', 'ME', '44.2181500', '-69.0818400'),
(4846, 'Glen Cove', 'ME', '44.1310000', '-69.0911100'),
(4847, 'Hope', 'ME', '44.2327200', '-69.1925400'),
(4848, 'Islesboro', 'ME', '44.3059800', '-68.9088300'),
(4849, 'Lincolnville', 'ME', '44.3259400', '-69.0306500'),
(4850, 'Lincolnville Center', 'ME', '44.4786900', '-69.1495500'),
(4851, 'Matinicus', 'ME', '43.8561200', '-68.8884700'),
(4852, 'Monhegan', 'ME', '43.7648600', '-69.3201600'),
(4853, 'North Haven', 'ME', '44.1541800', '-68.8781000'),
(4854, 'Owls Head', 'ME', '44.0657400', '-69.0753600'),
(4855, 'Port Clyde', 'ME', '44.0321900', '-69.1480100'),
(4856, 'Rockport', 'ME', '44.1808600', '-69.0981200'),
(4857, 'Saint George', 'ME', '44.0088700', '-69.2062900'),
(4858, 'South Thomaston', 'ME', '44.0246000', '-69.1278100'),
(4859, 'Spruce Head', 'ME', '43.9998200', '-69.1560800'),
(4860, 'Tenants Harbor', 'ME', '43.9464000', '-69.2352400'),
(4861, 'Thomaston', 'ME', '44.0826000', '-69.1759800'),
(4862, 'Union', 'ME', '44.2407600', '-69.2704800'),
(4863, 'Vinalhaven', 'ME', '44.0610500', '-68.8381900'),
(4864, 'Warren', 'ME', '44.1359300', '-69.2490700'),
(4865, 'West Rockport', 'ME', '44.1923600', '-69.1211300'),
(4901, 'Waterville', 'ME', '44.5549600', '-69.6129700'),
(4903, 'Waterville', 'ME', '44.5492200', '-69.7131700'),
(4910, 'Albion', 'ME', '44.5134900', '-69.4349600'),
(4911, 'Anson', 'ME', '44.7802900', '-69.9342400'),
(4912, 'Athens', 'ME', '44.9491300', '-69.6496800'),
(4915, 'Belfast', 'ME', '44.4452900', '-69.0225700'),
(4917, 'Belgrade', 'ME', '44.4931300', '-69.8334800'),
(4918, 'Belgrade Lakes', 'ME', '44.4140500', '-69.7519100'),
(4920, 'Bingham', 'ME', '45.0795200', '-69.8472300'),
(4921, 'Brooks', 'ME', '44.5545000', '-69.1260400'),
(4922, 'Burnham', 'ME', '44.6678400', '-69.3739800'),
(4923, 'Cambridge', 'ME', '45.0316900', '-69.4467200'),
(4924, 'Canaan', 'ME', '44.7656100', '-69.5569400'),
(4925, 'Caratunk', 'ME', '45.2493600', '-69.9433000'),
(4926, 'China', 'ME', '44.3911600', '-69.5382500'),
(4927, 'Clinton', 'ME', '44.6594800', '-69.5306400'),
(4928, 'Corinna', 'ME', '44.9490000', '-69.2732700'),
(4929, 'Detroit', 'ME', '44.7859200', '-69.3037600'),
(4930, 'Dexter', 'ME', '45.0234700', '-69.2972500'),
(4932, 'Dixmont', 'ME', '44.6896700', '-69.1248000'),
(4933, 'East Newport', 'ME', '45.5198600', '-68.6474100'),
(4935, 'East Vassalboro', 'ME', '44.4140500', '-69.7519100'),
(4936, 'Eustis', 'ME', '45.3257600', '-70.5406200'),
(4937, 'Fairfield', 'ME', '44.6033200', '-69.6362700'),
(4938, 'Farmington', 'ME', '44.6677600', '-70.1236200'),
(4939, 'Garland', 'ME', '45.0464900', '-69.1474700'),
(4940, 'Farmington Falls', 'ME', '44.6225600', '-70.0751700'),
(4941, 'Freedom', 'ME', '44.4660100', '-69.3133700'),
(4942, 'Harmony', 'ME', '44.9850400', '-69.5652300'),
(4943, 'Hartland', 'ME', '44.8613600', '-69.4993400'),
(4944, 'Hinckley', 'ME', '44.6847300', '-69.6425000'),
(4945, 'Jackman', 'ME', '45.5877100', '-70.2725700'),
(4947, 'Kingfield', 'ME', '45.0181200', '-70.2669000'),
(4949, 'Liberty', 'ME', '44.3711000', '-69.3274400'),
(4950, 'Madison', 'ME', '44.8192000', '-69.8278200'),
(4951, 'Monroe', 'ME', '44.5996000', '-69.0454200'),
(4952, 'Morrill', 'ME', '44.4177200', '-69.1519600'),
(4953, 'Newport', 'ME', '44.8554900', '-69.2639700'),
(4954, 'New Portland', 'ME', '44.9041000', '-70.1045300'),
(4955, 'New Sharon', 'ME', '44.6382500', '-70.0152500'),
(4956, 'New Vineyard', 'ME', '44.7978100', '-70.1244300'),
(4957, 'Norridgewock', 'ME', '44.7001700', '-69.8255400'),
(4958, 'North Anson', 'ME', '44.9263400', '-69.9352100'),
(4961, 'North New Portland', 'ME', '45.0563200', '-70.0865200'),
(4962, 'North Vassalboro', 'ME', '44.4644300', '-69.6169900'),
(4963, 'Oakland', 'ME', '44.5604900', '-69.7693800'),
(4964, 'Oquossoc', 'ME', '44.9241200', '-70.7678600'),
(4965, 'Palmyra', 'ME', '44.8458900', '-69.3677500'),
(4966, 'Phillips', 'ME', '44.8403500', '-70.3723500'),
(4967, 'Pittsfield', 'ME', '44.7743200', '-69.4061600'),
(4969, 'Plymouth', 'ME', '44.7679700', '-69.2119100'),
(4970, 'Rangeley', 'ME', '44.9667000', '-70.6576000'),
(4971, 'Saint Albans', 'ME', '44.9273800', '-69.3875200'),
(4972, 'Sandy Point', 'ME', '44.4786900', '-69.1495500'),
(4973, 'Searsmont', 'ME', '44.3695500', '-69.1882000'),
(4974, 'Searsport', 'ME', '44.5006200', '-68.9282900'),
(4975, 'Shawmut', 'ME', '44.6245100', '-69.5868500'),
(4976, 'Skowhegan', 'ME', '44.7825600', '-69.6921200'),
(4978, 'Smithfield', 'ME', '44.6248200', '-69.8111700'),
(4979, 'Solon', 'ME', '44.9405300', '-69.8075900'),
(4981, 'Stockton Springs', 'ME', '44.4990800', '-68.8566700'),
(4982, 'Stratton', 'ME', '45.1376000', '-70.4460600'),
(4983, 'Strong', 'ME', '44.8226200', '-70.2177800'),
(4984, 'Temple', 'ME', '44.6882900', '-70.2377300'),
(4985, 'West Forks', 'ME', '45.3800300', '-69.9089200'),
(4986, 'Thorndike', 'ME', '44.5556400', '-69.2324100'),
(4987, 'Troy', 'ME', '44.6788300', '-69.2691800'),
(4988, 'Unity', 'ME', '44.6050900', '-69.3302200'),
(4989, 'Vassalboro', 'ME', '44.3988500', '-69.6518100'),
(4992, 'West Farmington', 'ME', '44.6628200', '-70.1530400');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beer`
--
ALTER TABLE `beer`
  ADD PRIMARY KEY (`beer_id`,`beer_type_id`,`brewery_id`),
  ADD KEY `fk_beer_table_beer_type_table1_idx` (`beer_type_id`),
  ADD KEY `fk_beer_table_brewery_table1_idx` (`brewery_id`);

--
-- Indexes for table `beer_type`
--
ALTER TABLE `beer_type`
  ADD PRIMARY KEY (`beer_type_id`);

--
-- Indexes for table `brewery`
--
ALTER TABLE `brewery`
  ADD PRIMARY KEY (`brewery_id`,`location_id`),
  ADD KEY `fk_brewery_table_location_table1_idx` (`location_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `MCB_users`
--
ALTER TABLE `MCB_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`beer_id`,`beer_amount`,`retail_id`),
  ADD KEY `fk_price_table_retail_table1_idx` (`retail_id`);

--
-- Indexes for table `retail_outlet`
--
ALTER TABLE `retail_outlet`
  ADD PRIMARY KEY (`retail_id`,`retail_type_id`,`location_id`),
  ADD KEY `fk_retail_table_retail_type_table1_idx` (`retail_type_id`),
  ADD KEY `fk_retail_table_location_table1_idx` (`location_id`);

--
-- Indexes for table `retail_type`
--
ALTER TABLE `retail_type`
  ADD PRIMARY KEY (`retail_type_id`);

--
-- Indexes for table `ZIP`
--
ALTER TABLE `ZIP`
  ADD PRIMARY KEY (`ZIP`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beer`
--
ALTER TABLE `beer`
  MODIFY `beer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `beer_type`
--
ALTER TABLE `beer_type`
  MODIFY `beer_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `brewery`
--
ALTER TABLE `brewery`
  MODIFY `brewery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `MCB_users`
--
ALTER TABLE `MCB_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `retail_outlet`
--
ALTER TABLE `retail_outlet`
  MODIFY `retail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `retail_type`
--
ALTER TABLE `retail_type`
  MODIFY `retail_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `beer`
--
ALTER TABLE `beer`
  ADD CONSTRAINT `fk_beer_table_beer_type_table1` FOREIGN KEY (`beer_type_id`) REFERENCES `beer_type` (`beer_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_beer_table_brewery_table1` FOREIGN KEY (`brewery_id`) REFERENCES `brewery` (`brewery_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `brewery`
--
ALTER TABLE `brewery`
  ADD CONSTRAINT `fk_brewery_table_location_table1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `fk_price_table_beer_table1` FOREIGN KEY (`beer_id`) REFERENCES `beer` (`beer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_price_table_retail_table1` FOREIGN KEY (`retail_id`) REFERENCES `retail_outlet` (`retail_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `retail_outlet`
--
ALTER TABLE `retail_outlet`
  ADD CONSTRAINT `fk_retail_table_location_table1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_retail_table_retail_type_table1` FOREIGN KEY (`retail_type_id`) REFERENCES `retail_type` (`retail_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
