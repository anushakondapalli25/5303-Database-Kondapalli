-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 04, 2015 at 04:33 PM
-- Server version: 5.5.46-0ubuntu0.14.04.2
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `spoloju`
--

-- --------------------------------------------------------

--
-- Table structure for table `applied_for`
--

CREATE TABLE IF NOT EXISTS `applied_for` (
  `date` date NOT NULL,
  `job_category_id` varchar(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `company_id` int(10) NOT NULL,
  `paid` enum('yes','no') NOT NULL,
  PRIMARY KEY (`job_category_id`,`user_id`,`company_id`),
  KEY `user_id` (`user_id`),
  KEY `job_category_id` (`job_category_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applied_for`
--

INSERT INTO `applied_for` (`date`, `job_category_id`, `user_id`, `company_id`, `paid`) VALUES
('2016-01-01', '1', 1, 1, 'yes'),
('2015-11-10', '1', 6, 1, 'yes'),
('2015-12-01', '1', 6, 2, 'yes'),
('2015-12-04', '2', 2, 1, 'yes'),
('2016-01-15', '2', 20, 3, 'yes'),
('2015-12-16', '2', 20, 5, 'yes'),
('2014-12-11', '3', 6, 2, 'yes'),
('2016-01-15', '3', 6, 3, 'yes'),
('2015-11-10', '4', 10, 1, 'yes'),
('2015-12-03', '4', 10, 3, 'yes'),
('2014-12-18', '4', 10, 4, 'yes'),
('2015-12-01', '4', 18, 2, 'yes'),
('2015-11-04', '5', 5, 4, 'yes'),
('2015-12-15', '5', 19, 3, 'yes'),
('2016-01-02', '6', 5, 1, 'yes'),
('2016-01-08', '6', 9, 5, 'yes'),
('2016-01-02', '7', 3, 2, 'yes'),
('2016-01-01', '8', 3, 3, 'yes'),
('2015-10-08', '9', 10, 4, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `charges_for_company`
--

CREATE TABLE IF NOT EXISTS `charges_for_company` (
  `company_id` varchar(20) NOT NULL,
  `rate` float NOT NULL,
  `key` varchar(32) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `charges_for_company`
--

INSERT INTO `charges_for_company` (`company_id`, `rate`, `key`) VALUES
('1', 15, 'interview cost'),
('2', 15, 'interview cost'),
('3', 15, 'interview cost'),
('4', 15, 'interview cost'),
('5', 15, 'interview cost');

-- --------------------------------------------------------

--
-- Table structure for table `charges_for_user`
--

CREATE TABLE IF NOT EXISTS `charges_for_user` (
  `user_id` varchar(10) NOT NULL,
  `rate` float NOT NULL,
  `key` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `charges_for_user`
--

INSERT INTO `charges_for_user` (`user_id`, `rate`, `key`) VALUES
('1', 10, 'application cost'),
('10', 10, 'application cost'),
('18', 10, 'application cost'),
('19', 10, 'application cost'),
('2', 10, 'application cost'),
('20', 10, 'application cost'),
('3', 10, 'application cost'),
('4', 10, 'application cost'),
('5', 10, 'application cost'),
('6', 10, 'application cost'),
('7', 10, 'application cost'),
('8', 10, 'application cost'),
('9', 10, 'application cost');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `company_id` varchar(32) NOT NULL,
  `company_name` varchar(32) NOT NULL,
  `street_address` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `state` varchar(32) NOT NULL,
  `zip_code` int(10) NOT NULL,
  `telephone` bigint(10) NOT NULL,
  `company_description` varchar(64) NOT NULL,
  `interviews_given` varchar(32) NOT NULL,
  `resumes_downloaded` varchar(64) NOT NULL,
  `date_of_last_download` date NOT NULL,
  `outstanding_balance` varchar(64) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `street_address`, `city`, `state`, `zip_code`, `telephone`, `company_description`, `interviews_given`, `resumes_downloaded`, `date_of_last_download`, `outstanding_balance`) VALUES
('1', 'microsoft', '4700 taft blvd', 'wichita falls', 'texas', 76308, 2147483647, 'Microsoft Corporation /?ma?kr?s??ft/ is an American multinationa', '5', '5', '2015-12-31', '100'),
('2', 'oracle', '4325 metro street', 'dallas', 'texas', 76403, 2345678901, 'Oracle is a provider of Enterprise Resources Planning software. ', '5', '5', '2015-12-31', '50'),
('3', 'apollo', '340 kevin street', 'dallas', 'texas', 45902, 5678567856, 'Apollo Hospitals is India''s leading super speciality hospital. O', '5', '3', '2015-12-30', '30'),
('4', 'samsung', '4700 taft blvd', 'wichita falls', 'texas', 76308, 6545678765, 'It comprises numerous subsidiaries and affiliated businesses, mo', '5', '5', '2015-12-29', '50'),
('5', 'apple', '22122 Erwin Street', 'los angels', 'CA', 67083, 8767897656, 'Apple Inc. is an American multinational technology company headq', '8', '5', '2015-12-30', '50');

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE IF NOT EXISTS `employee_details` (
  `user_id` int(20) NOT NULL,
  `start_date` date NOT NULL,
  `hourly_rate` float NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`user_id`, `start_date`, `hourly_rate`) VALUES
(11, '2015-06-02', 20),
(12, '2015-07-01', 20),
(13, '2014-11-18', 20),
(14, '2014-08-06', 20),
(15, '2015-09-08', 20),
(16, '2014-10-02', 20),
(17, '2015-09-08', 20);

-- --------------------------------------------------------

--
-- Table structure for table `interviews`
--

CREATE TABLE IF NOT EXISTS `interviews` (
  `date` date NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `job_category_id` varchar(32) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `completed` enum('yes','no') NOT NULL,
  `interview_id` int(10) NOT NULL,
  `customer_representative` varchar(32) NOT NULL,
  PRIMARY KEY (`company_id`,`job_category_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interviews`
--

INSERT INTO `interviews` (`date`, `company_id`, `job_category_id`, `user_id`, `completed`, `interview_id`, `customer_representative`) VALUES
('0000-00-00', '', '', '', 'no', 0, ''),
('2016-01-01', '1', '1', '1', 'no', 1, 'linda welch'),
('2016-01-01', '1', '2', '2', 'no', 2, 'lorraine curtis'),
('2015-01-01', '1', '3', '4', 'yes', 3, 'mark baker'),
('2015-10-08', '1', '4', '10', 'yes', 4, 'lorraine curtis'),
('2016-01-02', '1', '6', '5', 'no', 5, 'samantha jacobs'),
('2016-01-15', '2', '1', '6', 'no', 6, 'lorraine curtis'),
('2015-01-22', '2', '3', '6', 'yes', 7, 'lorraine curtis'),
('2015-12-01', '2', '4', '18', 'yes', 8, 'lorraine curtis'),
('2016-01-09', '2', '7', '3', 'no', 9, 'pauline shaw'),
('2015-11-04', '3', '1', '6', 'yes', 10, 'tamara nichols'),
('2015-12-17', '3', '3', '6', 'yes', 11, 'linda welch'),
('2016-01-08', '3', '4', '10', 'no', 12, 'marian cox'),
('2015-12-15', '3', '5', '19', 'yes', 13, 'linda welch'),
('2015-12-03', '3', '8', '3', 'yes', 14, 'pedro kelly'),
('2015-01-15', '4', '2', '20', 'yes', 16, 'mark baker'),
('2016-01-22', '4', '4', '10', 'yes', 17, 'lorraine curtis'),
('2016-01-15', '4', '5', '5', 'no', 18, 'pedro kelly'),
('2015-12-01', '4', '9', '10', 'yes', 19, 'mark baker'),
('2015-11-10', '5', '2', '20', 'yes', 20, 'lorraine curtis'),
('2015-12-01', '5', '6', '4', 'yes', 21, 'linda welch');

-- --------------------------------------------------------

--
-- Table structure for table `job_categories`
--

CREATE TABLE IF NOT EXISTS `job_categories` (
  `job_category_id` varchar(32) NOT NULL,
  `job_category_name` varchar(32) NOT NULL,
  `parent_category` varchar(32) NOT NULL,
  `sub_categories` varchar(32) NOT NULL,
  PRIMARY KEY (`job_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_categories`
--

INSERT INTO `job_categories` (`job_category_id`, `job_category_name`, `parent_category`, `sub_categories`) VALUES
('1', 'it and engineering ', 'computer programming', 'quality engineer'),
('10', 'nursing', 'nurse manager', 'practitioner'),
('2', 'nursing', 'nurse manager', 'oncology'),
('3', 'sales and marketing', 'broadcasting', 'social media producer'),
('4', 'hr and recuiter', 'developer', 'student development advicer'),
('5', 'health care', 'dermatologist', 'medical dermology'),
('6', 'it and engineering', 'computer programming', 'developer'),
('7', 'it and engineering', 'computer programming', 'designer'),
('8', 'sales and marketing', 'management', 'finance'),
('9', 'sales and marketing', 'broadcasting', 'management');

-- --------------------------------------------------------

--
-- Table structure for table `posted_jobs`
--

CREATE TABLE IF NOT EXISTS `posted_jobs` (
  `date_posted` date DEFAULT NULL,
  `document` varchar(64) NOT NULL,
  `job_category` varchar(64) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `job_category_id` varchar(20) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`company_id`,`job_category_id`),
  KEY `date_posted` (`date_posted`),
  KEY `company_id` (`company_id`,`job_category_id`),
  KEY `company_id_2` (`company_id`),
  KEY `job_category_id` (`job_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posted_jobs`
--

INSERT INTO `posted_jobs` (`date_posted`, `document`, `job_category`, `company_id`, `job_category_id`, `pid`) VALUES
('2015-12-03', '', 'quality engineer', '1', '1', NULL),
('2015-12-03', '', 'oncology', '1', '2', NULL),
('2014-12-17', '', 'social media producer', '1', '3', NULL),
('2015-08-19', '', 'student development advicer', '1', '4', NULL),
('2015-09-30', '', 'quality engineer', '2', '1', NULL),
('2014-11-10', '', 'social media producer', '2', '3', NULL),
('2015-12-03', '', 'student development advicer', '2', '4', NULL),
('2014-12-30', '', 'designer', '2', '7', NULL),
('2015-09-23', '', 'quality engineer', '3', '1', NULL),
('2015-09-19', '', 'social media producer', '3', '3', NULL),
('2015-08-24', '', 'student development advicer', '3', '4', NULL),
('2015-09-30', '', 'medical dermology', '3', '5', NULL),
('2015-10-02', '', 'finance', '3', '8', NULL),
('2015-12-03', '', 'oncology', '4', '2', NULL),
('2015-09-25', '', 'student development advicer', '4', '4', NULL),
('2015-08-06', '', 'medical dermology', '4', '5', NULL),
('2015-09-01', '', 'tester', '4', '7', NULL),
('2015-08-30', '', 'management', '4', '9', NULL),
('2015-06-25', '', 'Practitioner', '5', '10', NULL),
('2015-09-28', '', 'oncology', '5', '2', NULL),
('2015-10-16', '', 'developer', '5', '6', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `user_id` int(10) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`user_id`, `role`) VALUES
(1, 'jobseeker'),
(2, 'jobseeker'),
(3, 'jobseeker'),
(4, 'jobseeker'),
(5, 'jobseeker'),
(6, 'jobseeker'),
(7, 'jobseeker'),
(8, 'jobseeker'),
(9, 'jobseeker'),
(10, 'jobseeker'),
(11, 'employee'),
(12, 'employee'),
(13, 'employee'),
(14, 'employee'),
(15, 'employee'),
(16, 'employee'),
(17, 'employee'),
(18, 'jobseeker'),
(19, 'jobseeker'),
(20, 'jobseeker'),
(21, 'employee'),
(22, 'jobseeker');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `last` varchar(32) NOT NULL,
  `first` varchar(32) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(32) NOT NULL,
  `state` varchar(32) NOT NULL,
  `zip` int(20) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `phone` varchar(128) NOT NULL,
  `picture` blob,
  `user_id` int(10) NOT NULL,
  `social_security_no` bigint(32) NOT NULL,
  `credit_card_no` bigint(32) NOT NULL,
  `expiration_month` int(10) NOT NULL,
  `expiration_year` year(4) NOT NULL,
  `cvc` int(10) NOT NULL,
  `document` blob,
  `date_posted` date DEFAULT NULL,
  `job` varchar(64) DEFAULT NULL,
  `job_description` text,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`last`, `first`, `street`, `city`, `state`, `zip`, `email`, `password`, `phone`, `picture`, `user_id`, `social_security_no`, `credit_card_no`, `expiration_month`, `expiration_year`, `cvc`, `document`, `date_posted`, `job`, `job_description`) VALUES
('abigail', 'ward', '3462 cackson st', 'traralgon', 'victoria', 59344, 'abigail.ward@example.com', 'reaper', '04-2542-3368', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f37342e6a7067, 1, 1234567890, 2345678987654323, 3, 2014, 123, '', '2015-11-01', 'quality engineer', ' highly qualified Quality Engineer to champion continuous improvement at our Albuquerque manufacturing facility'),
('brent', 'butler', '5305 crockett st', 'tamworth', 'queensland', 23635, 'brent.butler@example.com', 'cat123', '04-5806-0586', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f34322e6a7067, 2, 7897896789, 9898765456789098, 4, 2017, 321, '', '2015-11-02', 'oncology', ' Ensures that quality age appropriate nursing care is delivered to all patients on his/her nursing unit in accordance with the philosophy, policies, procedures and program plans of the hospital.'),
('camila', 'thompson', '8171 lakeview st', 'tamworth', 'queensland', 57218, 'camila.thompson@example.com', 'rrpass1', '05-4646-3134', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f38392e6a7067, 3, 9876789876, 2343232345676767, 5, 2018, 423, '', '2015-11-03', 'finance', ' brilliant Social Media Producer to create dynamic digital content and grow Atlanta''s largest audience of news enthusiasts across multiple online channels.'),
('catherine', 'kelly', '8672 shady ln dr', 'coffs harbour', 'australian capital territory', 90367, 'catherine.kelly@example.com', 'smiley', '04-8201-9513', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f32382e6a7067, 4, 4567654567, 1212123232343434, 6, 2017, 522, '', '2015-11-04', 'practitioner', ' Ensures that quality age appropriate nursing care is delivered to all patients on his/her nursing unit in accordance with the philosophy, policies, procedures and program plans of the hospital.'),
('diane', 'jacobs', '6623 groveland terrace', 'ballarat', 'tasmania', 26592, 'diane.jacobs@example.com', 'sasha1', '05-3402-0910', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f33382e6a7067, 5, 6567654345, 7878789898654323, 6, 2015, 111, '', '2015-11-05', 'student development advices', ' brilliant Social Media Producer to create dynamic digital content and grow Atlanta''s largest audience of news enthusiasts across multiple online channels.'),
('duane', 'morris', '6803 shady ln dr', 'rockhampton', 'new south wales', 72241, 'duane.morris@example.com', 'housewifes', '07-2216-6941', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f36332e6a7067, 6, 3456543236, 2343454546789898, 7, 2016, 222, '', '2015-10-06', 'quality engineer', ' highly qualified Quality Engineer to champion continuous improvement at our Albuquerque manufacturing facility'),
('gregory', 'rodriguez', '5491 bruce st', 'traralgon', 'new south wales', 54833, 'gregory.rodriguez@example.com', 'quant4307s', '09-1263-9763', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f38392e6a7067, 7, 6754345689, 4929914582690691, 7, 2015, 333, '', '2015-12-07', 'social media producer', ' brilliant Social Media Producer to create dynamic digital content and grow Atlanta''s largest audience of news enthusiasts across multiple online channels.'),
('javier', 'shaw', '2051 northaven rd', 'bathurst', 'queensland', 94875, 'javier.shaw@example.com', 'kkkkkkk', '05-5373-7318', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f38352e6a7067, 8, 9876567876, 4556806600184832, 2, 2014, 444, '', '2015-12-08', 'student development advices', ' brilliant Social Media Producer to create dynamic digital content and grow Atlanta''s largest audience of news enthusiasts across multiple online channels.'),
('katie', 'kelley', '8047 homestead rd', 'bunbury', 'new south wales', 31299, 'katie.kelley@example.com', 'cartman', '03-3372-6786', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f39302e6a7067, 9, 8767676765, 4716489689025494, 9, 2017, 555, '', '2015-11-09', 'developer', ' highly qualified Quality Engineer to champion continuous improvement at our Albuquerque manufacturing facility'),
('linda', 'castro', '3795 hogan st', 'australian capital territory', 'new south wales', 16220, 'linda.castro@example.com', 'pass', '03-8745-4393', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f362e6a7067, 10, 8989098789, 5199175348642927, 10, 2016, 666, '', '2015-11-12', 'medical dermatologist', ' brilliant Social Media Producer to create dynamic digital content and grow Atlanta''s largest audience of news enthusiasts across multiple online channels.'),
('linda', 'welch', '9610 shady ln dr', 'australian capital territory', 'australian capital territory', 29398, 'linda.welch@example.com', 'kuai', '06-8956-3581', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f37302e6a7067, 11, 9876768905, 5539346549151609, 11, 2016, 777, '', '0000-00-00', '', ''),
('lorraine', 'curtis', '2331 college st', 'ballarat', 'australian capital territory', 29651, 'lorraine.curtis@example.com', 'tazman', '09-0370-1212', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f35302e6a7067, 12, 2345434345, 5569449491440765, 12, 2014, 776, '', '0000-00-00', '', ''),
('marian', 'cox', '8528 james st', 'hobart', 'new south wales', 89332, 'marian.cox@example.com', 'cattle', '06-0113-9721', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f32372e6a7067, 13, 1234321230, 5486166929239383, 2, 2016, 999, '', '0000-00-00', '', ''),
('mark', 'baker', '3787 lone wolf trail', 'warrnambool', 'victoria', 45914, 'mark.baker@example.com', 'firefigh', '06-0439-6594', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f342e6a7067, 14, 1454678240, 5577658901430907, 3, 2017, 890, '', '0000-00-00', '', ''),
('pauline', 'shaw', '7893 w sherman dr', 'hervey bay', 'queensland', 92866, 'pauline.shaw@example.com', '1125', '06-5601-7954', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f37392e6a7067, 15, 3456789202, 6011279117180863, 9, 2015, 656, '', '0000-00-00', '', ''),
('pedro', 'kelley', '7603 pockrus page rd', 'ballarat', 'south australia', 88503, 'pedro.kelley@example.com', 'starstar', '06-7525-5091', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f392e6a7067, 16, 1010908907, 6011519317441767, 1, 2017, 128, '', '0000-00-00', '', ''),
('samantha', 'jacobs', '9255 spring st', 'bundaberg', 'victoria', 78250, 'samantha.jacobs@example.com', 'fdsa', '06-4333-7739', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f36342e6a7067, 17, 5654567890, 3483844452028067, 12, 2016, 888, '', '0000-00-00', '', ''),
('soham', 'pearson', '6417 green rd', 'townsville', 'south australia', 43338, 'soham.pearson@example.com', 'maynard', '05-3150-9793', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f6d656e2f35362e6a7067, 18, 2342323231, 3749246575278414, 11, 2014, 452, '', '2015-12-16', 'designer', ' highly qualified Quality Engineer to champion continuous improvement at our Albuquerque manufacturing facility'),
('tamara', 'nichols', '3912 saddle dr', 'geelong', 'australian capital territory', 88716, 'tamara.nichols@example.com', 'senna', '01-9868-5217', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f32352e6a7067, 19, 8080907076, 3469408622678460, 5, 2015, 212, '', '2015-12-03', 'management', ' brilliant Social Media Producer to create dynamic digital content and grow Atlanta''s largest audience of news enthusiasts across multiple online channels.'),
('tracey', 'alexander', '9713 w dallas st', 'bunbury', 'queensland', 60050, 'tracey.alexander@example.com', 'racers', '01-4774-1474', 0x68747470733a2f2f72616e646f6d757365722e6d652f6170692f706f727472616974732f6d65642f776f6d656e2f34372e6a7067, 20, 3454567651, 7898989090876543, 6, 2016, 121, '', '2015-11-12', 'oncology', ' Ensures that quality age appropriate nursing care is delivered to all patients on his/her nursing unit in accordance with the philosophy, policies, procedures and program plans of the hospital.'),
('mayflower', 'sita', '4700 taft', 'wichitafalls', 'texas', 76308, 'sita@yahoo.com', '12345', '4255590557', NULL, 21, 2389035360, 123432378909567, 7, 2016, 456, NULL, NULL, NULL, NULL),
('goodwill', 'emily', '4700 taft', 'wichitafalls', 'texas', 76308, 'good.emi@gmail.com', '32444', '4567890876', NULL, 22, 2342323232, 6565656565656565, 6, 2017, 666, NULL, '0000-00-00', 'quality engineer', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
