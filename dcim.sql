-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2026 at 03:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dcim`
--

-- --------------------------------------------------------

--
-- Table structure for table `fac_binaudits`
--

CREATE TABLE `fac_binaudits` (
  `BinID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AuditStamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_bincontents`
--

CREATE TABLE `fac_bincontents` (
  `BinID` int(11) NOT NULL,
  `SupplyID` int(11) NOT NULL,
  `Count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_cabinet`
--

CREATE TABLE `fac_cabinet` (
  `CabinetID` int(11) NOT NULL,
  `DataCenterID` int(11) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `LocationSortable` varchar(20) NOT NULL,
  `AssignedTo` int(11) NOT NULL,
  `ZoneID` int(11) NOT NULL,
  `CabRowID` int(11) NOT NULL,
  `CabinetHeight` int(11) NOT NULL,
  `Model` varchar(80) NOT NULL,
  `Keylock` varchar(30) NOT NULL,
  `MaxKW` float NOT NULL,
  `MaxWeight` int(11) NOT NULL,
  `InstallationDate` date NOT NULL,
  `MapX1` int(11) NOT NULL,
  `MapX2` int(11) NOT NULL,
  `FrontEdge` varchar(7) NOT NULL DEFAULT 'Top',
  `MapY1` int(11) NOT NULL,
  `MapY2` int(11) NOT NULL,
  `Notes` text DEFAULT NULL,
  `U1Position` varchar(7) NOT NULL DEFAULT 'Default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fac_cabinet`
--

INSERT INTO `fac_cabinet` (`CabinetID`, `DataCenterID`, `Location`, `LocationSortable`, `AssignedTo`, `ZoneID`, `CabRowID`, `CabinetHeight`, `Model`, `Keylock`, `MaxKW`, `MaxWeight`, `InstallationDate`, `MapX1`, `MapX2`, `FrontEdge`, `MapY1`, `MapY2`, `Notes`, `U1Position`) VALUES
(1, 2, 'CB01', 'CB01', 0, 8, 5, 42, '', '', 0, 0, '2026-05-31', 0, 0, 'Top', 0, 0, '', 'Bottom');

-- --------------------------------------------------------

--
-- Table structure for table `fac_cabinettags`
--

CREATE TABLE `fac_cabinettags` (
  `CabinetID` int(11) NOT NULL,
  `TagID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_cabinettooltip`
--

CREATE TABLE `fac_cabinettooltip` (
  `SortOrder` smallint(6) DEFAULT NULL,
  `Field` varchar(20) NOT NULL,
  `Label` varchar(30) NOT NULL,
  `Enabled` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fac_cabinettooltip`
--

INSERT INTO `fac_cabinettooltip` (`SortOrder`, `Field`, `Label`, `Enabled`) VALUES
(NULL, 'AssetTag', 'Asset Tag', 0),
(NULL, 'ChassisSlots', 'Number of Slots in Chassis:', 0),
(NULL, 'DeviceID', 'Device ID', 0),
(NULL, 'DeviceType', 'Device Type', 0),
(NULL, 'EscalationID', 'Details', 0),
(NULL, 'EscalationTimeID', 'Time Period', 0),
(NULL, 'InstallDate', 'Install Date', 0),
(NULL, 'MfgDate', 'Manufacture Date', 0),
(NULL, 'NominalWatts', 'Nominal Draw (Watts)', 0),
(NULL, 'Owner', 'Departmental Owner', 0),
(NULL, 'Ports', 'Number of Data Ports', 0),
(NULL, 'PowerSupplyCount', 'Number of Power Supplies', 0),
(NULL, 'PrimaryContact', 'Primary Contact', 0),
(NULL, 'PrimaryIP', 'Primary IP', 0),
(NULL, 'SerialNo', 'Serial Number', 0),
(NULL, 'SNMPCommunity', 'SNMP Read Only Community', 0),
(NULL, 'Status', 'Device Status', 0),
(NULL, 'TemplateID', 'Device Class', 0),
(NULL, 'VM Hypervisor', 'VM Hypervisor', 0),
(NULL, 'WarrantyCo', 'Warranty Company', 0),
(NULL, 'WarrantyExpire', 'Warranty Expiration', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fac_cabrow`
--

CREATE TABLE `fac_cabrow` (
  `CabRowID` int(11) NOT NULL,
  `Name` varchar(120) NOT NULL,
  `DataCenterID` int(11) NOT NULL,
  `ZoneID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fac_cabrow`
--

INSERT INTO `fac_cabrow` (`CabRowID`, `Name`, `DataCenterID`, `ZoneID`) VALUES
(4, 'CA', 2, 8),
(5, 'CB', 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `fac_cdutemplate`
--

CREATE TABLE `fac_cdutemplate` (
  `TemplateID` int(11) NOT NULL,
  `ManufacturerID` int(11) NOT NULL,
  `Model` varchar(80) NOT NULL,
  `Managed` int(1) NOT NULL,
  `ATS` int(1) NOT NULL,
  `SNMPVersion` varchar(2) NOT NULL DEFAULT '2c',
  `VersionOID` varchar(80) NOT NULL,
  `OutletNameOID` varchar(80) NOT NULL,
  `OutletDescOID` varchar(80) NOT NULL,
  `OutletCountOID` varchar(80) NOT NULL,
  `OutletStatusOID` varchar(80) NOT NULL,
  `OutletStatusOn` varchar(80) NOT NULL,
  `Multiplier` varchar(6) DEFAULT NULL,
  `OID1` varchar(80) NOT NULL,
  `OID2` varchar(80) NOT NULL,
  `OID3` varchar(80) NOT NULL,
  `ATSStatusOID` varchar(80) NOT NULL,
  `ATSDesiredResult` varchar(80) NOT NULL,
  `ProcessingProfile` varchar(20) NOT NULL DEFAULT 'SingleOIDWatts',
  `Voltage` int(11) NOT NULL,
  `Amperage` int(11) NOT NULL,
  `NumOutlets` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_cdutooltip`
--

CREATE TABLE `fac_cdutooltip` (
  `SortOrder` smallint(6) DEFAULT NULL,
  `Field` varchar(20) NOT NULL,
  `Label` varchar(30) NOT NULL,
  `Enabled` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fac_cdutooltip`
--

INSERT INTO `fac_cdutooltip` (`SortOrder`, `Field`, `Label`, `Enabled`) VALUES
(NULL, 'BreakerSize', 'Breaker Size', 0),
(NULL, 'FirmwareVersion', 'Firmware Version', 0),
(NULL, 'InputAmperage', 'Input Amperage', 0),
(NULL, 'IPAddress', 'IP Address', 0),
(NULL, 'Model', 'Model', 0),
(NULL, 'NumOutlets', 'Used/Total Connections', 0),
(NULL, 'PanelID', 'Source Panel', 0),
(NULL, 'PanelPole', 'Panel Pole Number', 0),
(NULL, 'PanelVoltage', 'Voltage', 0),
(NULL, 'SNMPCommunity', 'SNMP Community', 0),
(NULL, 'Uptime', 'Uptime', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fac_colorcoding`
--

CREATE TABLE `fac_colorcoding` (
  `ColorID` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `DefaultNote` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_config`
--

CREATE TABLE `fac_config` (
  `Parameter` varchar(40) NOT NULL,
  `Value` text NOT NULL,
  `UnitOfMeasure` varchar(40) NOT NULL,
  `ValType` varchar(40) NOT NULL,
  `DefaultVal` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fac_config`
--

INSERT INTO `fac_config` (`Parameter`, `Value`, `UnitOfMeasure`, `ValType`, `DefaultVal`) VALUES
('Version', '23.04', '', '', ''),
('OrgName', 'openDCIM Computer Facilities', 'Name', 'string', 'openDCIM Computer Facilities'),
('ClassList', 'ITS, Internal, Customer', 'List', 'string', 'ITS, Internal, Customer'),
('SpaceRed', '80', 'percentage', 'float', '80'),
('SpaceYellow', '60', 'percentage', 'float', '60'),
('WeightRed', '80', 'percentage', 'float', '80'),
('WeightYellow', '60', 'percentage', 'float', '60'),
('PowerRed', '80', 'percentage', 'float', '80'),
('PowerYellow', '60', 'percentage', 'float', '60'),
('RackWarningHours', '4', 'Hours', 'integer', '4'),
('RackOverdueHours', '1', 'Hours', 'integer', '1'),
('CriticalColor', '#cc0000', 'HexColor', 'string', '#cc0000'),
('CautionColor', '#cccc00', 'HexColor', 'string', '#cccc00'),
('GoodColor', '#0a0', 'HexColor', 'string', '#0a0'),
('FreeSpaceColor', '#FFFFFF', 'HexColor', 'string', '#FFFFFF'),
('MediaEnforce', 'disabled', 'Enabled/Disabled', 'string', 'disabled'),
('OutlineCabinets', 'disabled', 'Enabled/Disabled', 'string', 'disabled'),
('LabelCabinets', 'disabled', 'Enabled/Disabled', 'string', 'disabled'),
('DefaultPanelVoltage', '208', 'Volts', 'int', '208'),
('annualCostPerUYear', '200', 'Dollars', 'float', '200'),
('Locale', 'en_US.utf8', 'TextLocale', 'string', 'en_US.utf8'),
('timezone', 'America/Chicago', 'string', 'string', 'America/Chicago'),
('PDFLogoFile', 'images/logo-htech.svg', 'Filename', 'string', 'images/logo.png'),
('PDFfont', 'Arial', 'Font', 'string', 'Arial'),
('SMTPServer', 'smtp.your.domain', 'Server', 'string', 'smtp.your.domain'),
('SMTPPort', '25', 'Port', 'int', '25'),
('SMTPHelo', 'your.domain', 'Helo', 'string', 'your.domain'),
('SMTPUser', '', 'Username', 'string', ''),
('SMTPPassword', '', 'Password', 'string', ''),
('MailFromAddr', 'DataCenterTeamAddr@your.domain', 'Email', 'string', 'DataCenterTeamAddr@your.domain'),
('MailSubject', 'ITS Facilities Rack Request', 'EmailSub', 'string', 'ITS Facilities Rack Request'),
('MailToAddr', 'DataCenterTeamAddr@your.domain', 'Email', 'string', 'DataCenterTeamAddr@your.domain'),
('ComputerFacMgr', 'DataCenterMgr Name', 'Name', 'string', 'DataCenterMgr Name'),
('NetworkCapacityReportOptIn', 'OptIn', 'OptIn/OptOut', 'string', 'OptIn'),
('NetworkThreshold', '75', 'Percentage', 'integer', '75'),
('FacMgrMail', 'DataCenterMgr@your.domain', 'Email', 'string', 'DataCenterMgr@your.domain'),
('InstallURL', '', 'URL', 'string', 'https://dcim.your.domain'),
('UserLookupURL', 'https://', 'URL', 'string', 'https://'),
('HeaderColor', '#020d1a', 'HexColor', 'string', '#006633'),
('BodyColor', '#F0E0B2', 'HexColor', 'string', '#F0E0B2'),
('LinkColor', '#000000', 'HexColor', 'string', '#000000'),
('VisitedLinkColor', '#8D90B3', 'HexColor', 'string', '#8D90B3'),
('LabelCase', 'upper', 'string', 'string', 'upper'),
('mDate', 'blank', 'string', 'string', 'blank'),
('wDate', 'blank', 'string', 'string', 'blank'),
('NewInstallsPeriod', '7', 'Days', 'int', '7'),
('VMExpirationTime', '7', 'Days', 'int', '7'),
('mUnits', 'english', 'English/Metric', 'string', 'english'),
('snmpwalk', '/usr/bin/snmpwalk', 'path', 'string', '/usr/bin/snmpwalk'),
('snmpget', '/usr/bin/snmpget', 'path', 'string', '/usr/bin/snmpget'),
('SNMPCommunity', 'public', 'string', 'string', 'public'),
('cut', '/bin/cut', 'path', 'string', '/bin/cut'),
('ToolTips', 'Disabled', 'Enabled/Disabled', 'string', 'Disabled'),
('CDUToolTips', 'Disabled', 'Enabled/Disabled', 'string', 'Disabled'),
('PageSize', 'Letter', 'string', 'string', 'Letter'),
('path_weight_cabinet', '1', '', 'int', '1'),
('path_weight_rear', '1', '', 'int', '1'),
('path_weight_row', '4', '', 'int', '4'),
('TemperatureRed', '30', 'degrees', 'float', '30'),
('TemperatureYellow', '25', 'degrees', 'float', '25'),
('HumidityRedHigh', '75', 'percentage', 'float', '75'),
('HumidityRedLow', '35', 'percentage', 'float', '35'),
('HumidityYellowHigh', '55', 'percentage', 'float', '55'),
('HumidityYellowLow', '45', 'percentage', 'float', '45'),
('WorkOrderBuilder', 'disabled', 'Enabled/Disabled', 'string', 'Disabled'),
('RackRequests', 'enabled', 'Enabled/Disabled', 'string', 'Enabled'),
('dot', '/usr/bin/dot', 'path', 'string', '/usr/bin/dot'),
('AppendCabDC', 'disabled', 'Enabled/Disabled', 'string', 'Disabled'),
('APIUserID', '', 'Email', 'string', ''),
('APIKey', '', 'Key', 'string', ''),
('RequireDefinedUser', 'disabled', 'Enabled/Disabled', 'string', 'Disabled'),
('SNMPVersion', '2c', 'Version', 'string', '2c'),
('U1Position', 'Bottom', 'Top/Bottom', 'string', 'Bottom'),
('RCIHigh', '80', 'degrees', 'float', '80'),
('RCILow', '65', 'degress', 'float', '65'),
('FilterCabinetList', 'disabled', 'Enabled/Disabled', 'string', 'Disabled'),
('CostPerKwHr', '.25', 'Currency', 'float', '.25'),
('v3SecurityLevel', '', 'noAuthNoPriv/authNoPriv/authPriv', 'string', 'noAuthNoPriv'),
('v3AuthProtocol', '', 'SHA/MD5', 'string', 'SHA'),
('v3AuthPassphrase', '', 'Password', 'string', ''),
('v3PrivProtocol', '', 'SHA/MD5', 'string', 'SHA'),
('v3PrivPassphrase', '', 'Password', 'string', ''),
('PatchPanelsOnly', 'enabled', 'Enabled/Disabled', 'string', 'enabled'),
('LDAPServer', 'localhost', 'URI', 'string', 'localhost'),
('LDAPBaseDN', 'dc=opendcim,dc=org', 'DN', 'string', 'dc=opendcim,dc=org'),
('LDAPBindDN', 'cn=%userid%,ou=users,dc=opendcim,dc=org', 'DN', 'string', 'cn=%userid%,ou=users,dc=opendcim,dc=org'),
('LDAPBaseSearch', '(&(objectClass=posixGroup)(memberUid=%userid%))', 'DN', 'string', '(&(objectClass=posixGroup)(memberUid=%userid%))'),
('LDAPUserSearch', '(|(uid=%userid%)(sAMAccountName=%userid%))', 'DN', 'string', '(|(uid=%userid%)(sAMAccountName=%userid%))'),
('LDAPDebug', 'enabled', 'Enabled/Disabled', 'string', 'disabled'),
('LDAPSessionExpiration', '0', 'Seconds', 'int', '0'),
('LDAPSiteAccess', 'cn=openDCIM,ou=groups,dc=opendcim,dc=org', 'DN', 'string', 'cn=openDCIM,ou=groups,dc=opendcim,dc=org'),
('LDAPReadAccess', 'cn=ReadAccess,cn=openDCIM,ou=groups,dc=opendcim,dc=org', 'DN', 'string', 'cn=ReadAccess,cn=openDCIM,ou=groups,dc=opendcim,dc=org'),
('LDAPWriteAccess', 'cn=WriteAccess,cn=openDCIM,ou=groups,dc=opendcim,dc=org', 'DN', 'string', 'cn=WriteAccess,cn=openDCIM,ou=groups,dc=opendcim,dc=org'),
('LDAPDeleteAccess', 'cn=DeleteAccess,cn=openDCIM,ou=groups,dc=opendcim,dc=org', 'DN', 'string', 'cn=DeleteAccess,cn=openDCIM,ou=groups,dc=opendcim,dc=org'),
('LDAPAdminOwnDevices', 'cn=AdminOwnDevices,cn=openDCIM,ou=groups,dc=opendcim,dc=org', 'DN', 'string', 'cn=AdminOwnDevices,cn=openDCIM,ou=groups,dc=opendcim,dc=org'),
('LDAPRackRequest', 'cn=RackRequest,cn=openDCIM,ou=groups,dc=opendcim,dc=org', 'DN', 'string', 'cn=RackRequest,cn=openDCIM,ou=groups,dc=opendcim,dc=org'),
('LDAPRackAdmin', 'cn=RackAdmin,cn=openDCIM,ou=groups,dc=opendcim,dc=org', 'DN', 'string', 'cn=RackAdmin,cn=openDCIM,ou=groups,dc=opendcim,dc=org'),
('LDAPBulkOperations', 'cn=BulkOperations,cn=openDCIM,ou=groups,dc=opendcim,dc=org', 'DN', 'string', 'cn=BulkOperations,cn=openDCIM,ou=groups,dc=opendcim,dc=org'),
('LDAPContactAdmin', 'cn=ContactAdmin,cn=openDCIM,ou=groups,dc=opendcim,dc=org', 'DN', 'string', 'cn=ContactAdmin,cn=openDCIM,ou=groups,dc=opendcim,dc=org'),
('LDAPSiteAdmin', 'cn=SiteAdmin,cn=openDCIM,ou=groups,dc=opendcim,dc=org', 'DN', 'string', 'cn=SiteAdmin,cn=openDCIM,ou=groups,dc=opendcim,dc=org'),
('LDAP_Debug_Password', 'dcimadmin', 'string', 'string', 'Leave blank to disable'),
('LDAPFirstName', '', 'string', 'string', ''),
('LDAPLastName', '', 'string', 'string', ''),
('LDAPEmail', '', 'string', 'string', ''),
('LDAPPhone1', '', 'string', 'string', ''),
('LDAPPhone2', '', 'string', 'string', ''),
('LDAPPhone3', '', 'string', 'string', ''),
('OIDCEndpoint', '', 'string', 'string', ''),
('OIDCUserID', 'user_id', 'string', 'string', 'user_id'),
('OIDCClientID', '', 'string', 'string', ''),
('OIDCClientSecret', '', 'string', 'string', ''),
('SAMLGroupAttribute', '', 'string', '', 'memberOf'),
('SAMLBaseURL', '', 'string', 'string', ''),
('SAMLShowSuccessPage', 'enabled', 'string', 'Enabled/Disabled', 'enabled'),
('SAMLspentityId', '', 'URL', 'string', 'https://opendcim.local'),
('SAMLspx509cert', '', 'string', 'string', ''),
('SAMLspprivateKey', '', 'string', 'string', ''),
('SAMLidpentityId', '', 'URL', 'string', 'https://accounts.google.com/o/saml2?idpid=XXXXXXXXX'),
('SAMLidpssoURL', '', 'URL', 'string', 'https://accounts.google.com/o/saml2/idp?idpid=XXXXXXXXX'),
('SAMLidpslsURL', '', 'URL', 'string', ''),
('SAMLaccountPrefix', '', 'string', 'string', 'DOMAIN\\'),
('SAMLaccountSuffix', '', 'string', 'string', '@example.org'),
('SAMLidpx509cert', '', 'string', 'string', ''),
('SAMLIdPMetadataURL', '', 'string', 'string', ''),
('SAMLCertCountry', '', 'string', 'string', 'US'),
('SAMLCertProvince', '', 'string', 'string', 'Tennessee'),
('SAMLCertOrganization', '', 'string', 'string', 'openDCIM User'),
('AttrFirstName', 'givenname', 'string', 'string', 'givenname'),
('AttrLastName', 'sn', 'string', 'string', 'sn'),
('AttrEmail', 'mail', 'string', 'string', 'mail'),
('AttrPhone1', 'telephonenumber', 'string', 'string', 'telephonenumber'),
('AttrPhone2', 'mobile', 'string', 'string', 'mobile'),
('AttrCountry', '', 'Country', 'string', ''),
('drawingpath', 'assets/drawings/', 'string', 'string', 'assets/drawings/'),
('picturepath', 'assets/pictures/', 'string', 'string', 'assets/pictures/'),
('RackRequestsActions', 'disabled', 'Enabled/Disabled', 'string', 'disabled'),
('logretention', '0', 'days', 'integer', '0'),
('reportspath', 'assets/reports/', 'string', 'string', 'assets/reports/'),
('ReservationExpiration', '0', 'days', 'integer', '0'),
('PowerAlertsEmail', 'disabled', 'Enabled/Disabled', 'string', 'disabled'),
('SensorAlertsEmail', 'disabled', 'Enabled/Disabled', 'string', 'disabled'),
('AssignCabinetLabels', 'Location', 'Name', 'string', 'Location'),
('GDPRCountryIsolation', 'disabled', 'Enabled/Disabled', 'string', 'disabled'),
('GDPRPIIPrivacy', 'disabled', 'Enabled/Disabled', 'string', 'disabled'),
('DefaultCountry', 'US', 'Country', 'string', 'US'),
('LDAP_Debug_Password', 'admin', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `fac_container`
--

CREATE TABLE `fac_container` (
  `ContainerID` int(11) NOT NULL,
  `Name` varchar(120) NOT NULL,
  `countryCode` char(2) NOT NULL,
  `ParentID` int(11) NOT NULL DEFAULT 0,
  `DrawingFileName` varchar(255) DEFAULT NULL,
  `MapX` int(11) NOT NULL,
  `MapY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fac_container`
--

INSERT INTO `fac_container` (`ContainerID`, `Name`, `countryCode`, `ParentID`, `DrawingFileName`, `MapX`, `MapY`) VALUES
(1, 'CNO', 'TH', 0, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fac_country`
--

CREATE TABLE `fac_country` (
  `countryCode` char(2) NOT NULL,
  `countryName` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fac_country`
--

INSERT INTO `fac_country` (`countryCode`, `countryName`) VALUES
('AD', 'Andorra'),
('AE', 'United Arab Emirates'),
('AF', 'Afghanistan'),
('AG', 'Antigua and Barbuda'),
('AI', 'Anguilla'),
('AL', 'Albania'),
('AM', 'Armenia'),
('AO', 'Angola'),
('AQ', 'Antarctica'),
('AR', 'Argentina'),
('AS', 'American Samoa'),
('AT', 'Austria'),
('AU', 'Australia'),
('AW', 'Aruba'),
('AX', 'Åland'),
('AZ', 'Azerbaijan'),
('BA', 'Bosnia and Herzegovina'),
('BB', 'Barbados'),
('BD', 'Bangladesh'),
('BE', 'Belgium'),
('BF', 'Burkina Faso'),
('BG', 'Bulgaria'),
('BH', 'Bahrain'),
('BI', 'Burundi'),
('BJ', 'Benin'),
('BL', 'Saint Barthélemy'),
('BM', 'Bermuda'),
('BN', 'Brunei'),
('BO', 'Bolivia'),
('BQ', 'Bonaire, Sint Eustatius, and Saba'),
('BR', 'Brazil'),
('BS', 'Bahamas'),
('BT', 'Bhutan'),
('BV', 'Bouvet Island'),
('BW', 'Botswana'),
('BY', 'Belarus'),
('BZ', 'Belize'),
('CA', 'Canada'),
('CC', 'Cocos (Keeling) Islands'),
('CD', 'DR Congo'),
('CF', 'Central African Republic'),
('CG', 'Congo Republic'),
('CH', 'Switzerland'),
('CI', 'Ivory Coast'),
('CK', 'Cook Islands'),
('CL', 'Chile'),
('CM', 'Cameroon'),
('CN', 'China'),
('CO', 'Colombia'),
('CR', 'Costa Rica'),
('CU', 'Cuba'),
('CV', 'Cabo Verde'),
('CW', 'Curaçao'),
('CX', 'Christmas Island'),
('CY', 'Cyprus'),
('CZ', 'Czechia'),
('DE', 'Germany'),
('DJ', 'Djibouti'),
('DK', 'Denmark'),
('DM', 'Dominica'),
('DO', 'Dominican Republic'),
('DZ', 'Algeria'),
('EC', 'Ecuador'),
('EE', 'Estonia'),
('EG', 'Egypt'),
('EH', 'Western Sahara'),
('ER', 'Eritrea'),
('ES', 'Spain'),
('ET', 'Ethiopia'),
('FI', 'Finland'),
('FJ', 'Fiji'),
('FK', 'Falkland Islands'),
('FM', 'Micronesia'),
('FO', 'Faroe Islands'),
('FR', 'France'),
('GA', 'Gabon'),
('GB', 'United Kingdom'),
('GD', 'Grenada'),
('GE', 'Georgia'),
('GF', 'French Guiana'),
('GG', 'Guernsey'),
('GH', 'Ghana'),
('GI', 'Gibraltar'),
('GL', 'Greenland'),
('GM', 'The Gambia'),
('GN', 'Guinea'),
('GP', 'Guadeloupe'),
('GQ', 'Equatorial Guinea'),
('GR', 'Greece'),
('GS', 'South Georgia and South Sandwich Islands'),
('GT', 'Guatemala'),
('GU', 'Guam'),
('GW', 'Guinea-Bissau'),
('GY', 'Guyana'),
('HK', 'Hong Kong'),
('HM', 'Heard and McDonald Islands'),
('HN', 'Honduras'),
('HR', 'Croatia'),
('HT', 'Haiti'),
('HU', 'Hungary'),
('ID', 'Indonesia'),
('IE', 'Ireland'),
('IL', 'Israel'),
('IM', 'Isle of Man'),
('IN', 'India'),
('IO', 'British Indian Ocean Territory'),
('IQ', 'Iraq'),
('IR', 'Iran'),
('IS', 'Iceland'),
('IT', 'Italy'),
('JE', 'Jersey'),
('JM', 'Jamaica'),
('JO', 'Jordan'),
('JP', 'Japan'),
('KE', 'Kenya'),
('KG', 'Kyrgyzstan'),
('KH', 'Cambodia'),
('KI', 'Kiribati'),
('KM', 'Comoros'),
('KN', 'St Kitts and Nevis'),
('KP', 'North Korea'),
('KR', 'South Korea'),
('KW', 'Kuwait'),
('KY', 'Cayman Islands'),
('KZ', 'Kazakhstan'),
('LA', 'Laos'),
('LB', 'Lebanon'),
('LC', 'Saint Lucia'),
('LI', 'Liechtenstein'),
('LK', 'Sri Lanka'),
('LR', 'Liberia'),
('LS', 'Lesotho'),
('LT', 'Lithuania'),
('LU', 'Luxembourg'),
('LV', 'Latvia'),
('LY', 'Libya'),
('MA', 'Morocco'),
('MC', 'Monaco'),
('MD', 'Moldova'),
('ME', 'Montenegro'),
('MF', 'Saint Martin'),
('MG', 'Madagascar'),
('MH', 'Marshall Islands'),
('MK', 'North Macedonia'),
('ML', 'Mali'),
('MM', 'Myanmar'),
('MN', 'Mongolia'),
('MO', 'Macao'),
('MP', 'Northern Mariana Islands'),
('MQ', 'Martinique'),
('MR', 'Mauritania'),
('MS', 'Montserrat'),
('MT', 'Malta'),
('MU', 'Mauritius'),
('MV', 'Maldives'),
('MW', 'Malawi'),
('MX', 'Mexico'),
('MY', 'Malaysia'),
('MZ', 'Mozambique'),
('NA', 'Namibia'),
('NC', 'New Caledonia'),
('NE', 'Niger'),
('NF', 'Norfolk Island'),
('NG', 'Nigeria'),
('NI', 'Nicaragua'),
('NL', 'Netherlands'),
('NO', 'Norway'),
('NP', 'Nepal'),
('NR', 'Nauru'),
('NU', 'Niue'),
('NZ', 'New Zealand'),
('OM', 'Oman'),
('PA', 'Panama'),
('PE', 'Peru'),
('PF', 'French Polynesia'),
('PG', 'Papua New Guinea'),
('PH', 'Philippines'),
('PK', 'Pakistan'),
('PL', 'Poland'),
('PM', 'Saint Pierre and Miquelon'),
('PN', 'Pitcairn Islands'),
('PR', 'Puerto Rico'),
('PS', 'Palestine'),
('PT', 'Portugal'),
('PW', 'Palau'),
('PY', 'Paraguay'),
('QA', 'Qatar'),
('RE', 'Réunion'),
('RO', 'Romania'),
('RS', 'Serbia'),
('RU', 'Russia'),
('RW', 'Rwanda'),
('SA', 'Saudi Arabia'),
('SB', 'Solomon Islands'),
('SC', 'Seychelles'),
('SD', 'Sudan'),
('SE', 'Sweden'),
('SG', 'Singapore'),
('SH', 'Saint Helena'),
('SI', 'Slovenia'),
('SJ', 'Svalbard and Jan Mayen'),
('SK', 'Slovakia'),
('SL', 'Sierra Leone'),
('SM', 'San Marino'),
('SN', 'Senegal'),
('SO', 'Somalia'),
('SR', 'Suriname'),
('SS', 'South Sudan'),
('ST', 'São Tomé and Príncipe'),
('SV', 'El Salvador'),
('SX', 'Sint Maarten'),
('SY', 'Syria'),
('SZ', 'Eswatini'),
('TC', 'Turks and Caicos Islands'),
('TD', 'Chad'),
('TF', 'French Southern Territories'),
('TG', 'Togo'),
('TH', 'Thailand'),
('TJ', 'Tajikistan'),
('TK', 'Tokelau'),
('TL', 'Timor-Leste'),
('TM', 'Turkmenistan'),
('TN', 'Tunisia'),
('TO', 'Tonga'),
('TR', 'Turkey'),
('TT', 'Trinidad and Tobago'),
('TV', 'Tuvalu'),
('TW', 'Taiwan'),
('TZ', 'Tanzania'),
('UA', 'Ukraine'),
('UG', 'Uganda'),
('UM', 'U.S. Outlying Islands'),
('US', 'United States'),
('UY', 'Uruguay'),
('UZ', 'Uzbekistan'),
('VA', 'Vatican City'),
('VC', 'St Vincent and Grenadines'),
('VE', 'Venezuela'),
('VG', 'British Virgin Islands'),
('VI', 'U.S. Virgin Islands'),
('VN', 'Vietnam'),
('VU', 'Vanuatu'),
('WF', 'Wallis and Futuna'),
('WS', 'Samoa'),
('XK', 'Kosovo'),
('YE', 'Yemen'),
('YT', 'Mayotte'),
('ZA', 'South Africa'),
('ZM', 'Zambia'),
('ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `fac_datacache`
--

CREATE TABLE `fac_datacache` (
  `ItemType` varchar(80) NOT NULL,
  `Value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fac_datacache`
--

INSERT INTO `fac_datacache` (`ItemType`, `Value`) VALUES
('NavMenu', '<ul class=\"mktree\" id=\"datacenters\">\n	<li class=\"liClosed\" id=\"c1\"><a class=\"Container\" href=\"container_stats.php?container=1\">CNO</a>\n		<ul>\n		<li class=\"liClosed\" id=\"dc1\"><a class=\"DataCenter\" href=\"dc_stats.php?dc=1\">RST#1st</a>\n			<ul>\n			<li class=\"liClosed\" id=\"zone10\"><a class=\"Zone\" href=\"zone_stats.php?zone=10\">Battery Room</a>\n				<ul>\n				</ul>\n			</li>\n			<li class=\"liClosed\" id=\"zone9\"><a class=\"Zone\" href=\"zone_stats.php?zone=9\">Generator Room</a>\n				<ul>\n				</ul>\n			</li>\n			<li id=\"dc-1\"><a href=\"storageroom.php?dc=1\">Storage Room</a></li>\n			</ul>\n		</li>\n		<li class=\"liClosed\" id=\"dc2\"><a class=\"DataCenter\" href=\"dc_stats.php?dc=2\">RST#2nd</a>\n			<ul>\n			<li class=\"liClosed\" id=\"zone6\"><a class=\"Zone\" href=\"zone_stats.php?zone=6\">Zone A</a>\n				<ul>\n				</ul>\n			</li>\n			<li class=\"liClosed\" id=\"zone7\"><a class=\"Zone\" href=\"zone_stats.php?zone=7\">Zone B</a>\n				<ul>\n				</ul>\n			</li>\n			<li class=\"liClosed\" id=\"zone8\"><a class=\"Zone\" href=\"zone_stats.php?zone=8\">Zone C</a>\n				<ul>\n				<li class=\"liClosed\" id=\"cr4\"><a class=\"CabRow\" href=\"rowview.php?row=4\">CA</a>\n					<ul>\n					</ul>\n				</li>\n				<li class=\"liClosed\" id=\"cr5\"><a class=\"CabRow\" href=\"rowview.php?row=5\">CB</a>\n					<ul>\n					<li class=\"liClosed\" id=\"cab1\"><a class=\"Cabinet\" href=\"cabnavigator.php?cabinetid=1\">CB01</a></li>\n					</ul>\n				</li>\n				</ul>\n			</li>\n			<li id=\"dc-2\"><a href=\"storageroom.php?dc=2\">Storage Room</a></li>\n			</ul>\n		</li>\n		<li class=\"liClosed\" id=\"dc3\"><a class=\"DataCenter\" href=\"dc_stats.php?dc=3\">RST#3rd</a>\n			<ul>\n			<li id=\"dc-3\"><a href=\"storageroom.php?dc=3\">Storage Room</a></li>\n			</ul>\n		</li>\n		<li class=\"liClosed\" id=\"dc4\"><a class=\"DataCenter\" href=\"dc_stats.php?dc=4\">RST#4th</a>\n			<ul>\n			<li id=\"dc-4\"><a href=\"storageroom.php?dc=4\">Storage Room</a></li>\n			</ul>\n		</li>\n		</ul>\n	</li>\n<li id=\"dc-1\"><a href=\"storageroom.php\">General Storage Room</a></li>\n</ul>');

-- --------------------------------------------------------

--
-- Table structure for table `fac_datacenter`
--

CREATE TABLE `fac_datacenter` (
  `DataCenterID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `SquareFootage` int(11) NOT NULL,
  `DeliveryAddress` varchar(255) NOT NULL,
  `countryCode` char(2) NOT NULL,
  `Administrator` varchar(80) NOT NULL,
  `MaxkW` int(11) NOT NULL,
  `DrawingFileName` varchar(255) NOT NULL,
  `EntryLogging` tinyint(1) NOT NULL,
  `ContainerID` int(11) NOT NULL,
  `MapX` int(11) NOT NULL,
  `MapY` int(11) NOT NULL,
  `U1Position` varchar(7) NOT NULL DEFAULT 'Default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fac_datacenter`
--

INSERT INTO `fac_datacenter` (`DataCenterID`, `Name`, `SquareFootage`, `DeliveryAddress`, `countryCode`, `Administrator`, `MaxkW`, `DrawingFileName`, `EntryLogging`, `ContainerID`, `MapX`, `MapY`, `U1Position`) VALUES
(1, 'RST#1st', 0, '', 'TH', '', 0, '', 0, 1, 0, 0, 'Default'),
(2, 'RST#2nd', 0, '', 'TH', '', 0, '', 0, 1, 0, 0, 'Default'),
(3, 'RST#3rd', 0, '', 'TH', '', 0, '', 0, 1, 0, 0, 'Default'),
(4, 'RST#4th', 0, '', 'TH', '', 0, '', 0, 1, 0, 0, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `fac_decommission`
--

CREATE TABLE `fac_decommission` (
  `SurplusDate` date NOT NULL,
  `Label` varchar(80) NOT NULL,
  `SerialNo` varchar(40) NOT NULL,
  `AssetTag` varchar(20) NOT NULL,
  `UserID` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_department`
--

CREATE TABLE `fac_department` (
  `DeptID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ExecSponsor` varchar(80) NOT NULL,
  `SDM` varchar(80) NOT NULL,
  `Classification` varchar(80) NOT NULL,
  `DeptColor` varchar(7) NOT NULL DEFAULT '#FFFFFF'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_deptcontacts`
--

CREATE TABLE `fac_deptcontacts` (
  `DeptID` int(11) NOT NULL,
  `ContactID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_device`
--

CREATE TABLE `fac_device` (
  `DeviceID` int(11) NOT NULL,
  `Label` varchar(80) NOT NULL,
  `SerialNo` varchar(40) NOT NULL,
  `AssetTag` varchar(20) NOT NULL,
  `PrimaryIP` varchar(254) NOT NULL,
  `SNMPVersion` varchar(2) NOT NULL,
  `v3SecurityLevel` varchar(12) NOT NULL,
  `v3AuthProtocol` varchar(3) NOT NULL,
  `v3AuthPassphrase` varchar(80) NOT NULL,
  `v3PrivProtocol` varchar(3) NOT NULL,
  `v3PrivPassphrase` varchar(80) NOT NULL,
  `SNMPCommunity` varchar(80) NOT NULL,
  `SNMPFailureCount` tinyint(1) NOT NULL,
  `Hypervisor` varchar(40) NOT NULL,
  `APIUsername` varchar(80) NOT NULL,
  `APIPassword` varchar(80) NOT NULL,
  `APIPort` smallint(4) NOT NULL,
  `ProxMoxRealm` varchar(80) NOT NULL,
  `Owner` int(11) NOT NULL,
  `EscalationTimeID` int(11) NOT NULL,
  `EscalationID` int(11) NOT NULL,
  `PrimaryContact` int(11) NOT NULL,
  `Cabinet` int(11) NOT NULL,
  `Position` int(11) NOT NULL,
  `Height` int(11) NOT NULL,
  `Ports` int(11) NOT NULL,
  `FirstPortNum` int(11) NOT NULL,
  `TemplateID` int(11) NOT NULL,
  `NominalWatts` int(11) NOT NULL,
  `PowerSupplyCount` int(11) NOT NULL,
  `DeviceType` varchar(23) NOT NULL DEFAULT 'Server',
  `ChassisSlots` smallint(6) NOT NULL,
  `RearChassisSlots` smallint(6) NOT NULL,
  `ParentDevice` int(11) NOT NULL,
  `MfgDate` date NOT NULL,
  `InstallDate` date NOT NULL,
  `WarrantyCo` varchar(80) NOT NULL,
  `WarrantyExpire` date DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `Status` varchar(20) NOT NULL DEFAULT 'Production',
  `HalfDepth` tinyint(1) NOT NULL DEFAULT 0,
  `BackSide` tinyint(1) NOT NULL DEFAULT 0,
  `AuditStamp` datetime NOT NULL,
  `Weight` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_devicecache`
--

CREATE TABLE `fac_devicecache` (
  `DeviceID` int(11) NOT NULL,
  `Front` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Rear` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_devicecustomattribute`
--

CREATE TABLE `fac_devicecustomattribute` (
  `AttributeID` int(11) NOT NULL,
  `Label` varchar(80) NOT NULL,
  `AttributeType` varchar(8) NOT NULL DEFAULT 'string',
  `Required` tinyint(1) NOT NULL DEFAULT 0,
  `AllDevices` tinyint(1) NOT NULL DEFAULT 0,
  `DefaultValue` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_devicecustomvalue`
--

CREATE TABLE `fac_devicecustomvalue` (
  `DeviceID` int(11) NOT NULL,
  `AttributeID` int(11) NOT NULL,
  `Value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_devicestatus`
--

CREATE TABLE `fac_devicestatus` (
  `StatusID` int(11) NOT NULL,
  `Status` varchar(40) NOT NULL,
  `ColorCode` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fac_devicestatus`
--

INSERT INTO `fac_devicestatus` (`StatusID`, `Status`, `ColorCode`) VALUES
(1, 'Reserved', '#00FFFF'),
(2, 'Test', '#FFFFFF'),
(3, 'Development', '#FFFFFF'),
(4, 'QA', '#FFFFFF'),
(5, 'Production', '#FFFFFF'),
(6, 'Spare', '#FFFFFF'),
(7, 'Disposed', '#FFFFFF');

-- --------------------------------------------------------

--
-- Table structure for table `fac_devicetags`
--

CREATE TABLE `fac_devicetags` (
  `DeviceID` int(11) NOT NULL,
  `TagID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_devicetemplate`
--

CREATE TABLE `fac_devicetemplate` (
  `TemplateID` int(11) NOT NULL,
  `ManufacturerID` int(11) NOT NULL,
  `Model` varchar(80) NOT NULL,
  `Height` int(11) NOT NULL,
  `Weight` int(11) NOT NULL,
  `Wattage` int(11) NOT NULL,
  `DeviceType` varchar(23) NOT NULL DEFAULT 'Server',
  `PSCount` int(11) NOT NULL,
  `NumPorts` int(11) NOT NULL,
  `Notes` text NOT NULL,
  `FrontPictureFile` varchar(255) NOT NULL,
  `RearPictureFile` varchar(255) NOT NULL,
  `ChassisSlots` smallint(6) NOT NULL,
  `RearChassisSlots` smallint(6) NOT NULL,
  `SNMPVersion` varchar(2) NOT NULL DEFAULT '2c',
  `GlobalID` int(11) NOT NULL DEFAULT 0,
  `ShareToRepo` tinyint(1) NOT NULL DEFAULT 0,
  `KeepLocal` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_devicetemplatecustomvalue`
--

CREATE TABLE `fac_devicetemplatecustomvalue` (
  `TemplateID` int(11) NOT NULL,
  `AttributeID` int(11) NOT NULL,
  `Required` tinyint(1) NOT NULL DEFAULT 0,
  `Value` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_disposition`
--

CREATE TABLE `fac_disposition` (
  `DispositionID` int(11) NOT NULL,
  `Name` varchar(80) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `ReferenceNumber` varchar(80) NOT NULL,
  `Status` varchar(10) NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fac_disposition`
--

INSERT INTO `fac_disposition` (`DispositionID`, `Name`, `Description`, `ReferenceNumber`, `Status`) VALUES
(1, 'Salvage', 'Items sent to a qualified e-waste disposal provider.', '', 'Active'),
(2, 'Returned to Customer', 'Item has been removed from the data center and returned to the customer.', '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `fac_dispositionmembership`
--

CREATE TABLE `fac_dispositionmembership` (
  `DispositionID` int(11) NOT NULL,
  `DeviceID` int(11) NOT NULL,
  `DispositionDate` date NOT NULL,
  `DisposedBy` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_escalations`
--

CREATE TABLE `fac_escalations` (
  `EscalationID` int(11) NOT NULL,
  `Details` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_escalationtimes`
--

CREATE TABLE `fac_escalationtimes` (
  `EscalationTimeID` int(11) NOT NULL,
  `TimePeriod` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_genericlog`
--

CREATE TABLE `fac_genericlog` (
  `UserID` varchar(80) NOT NULL,
  `Class` varchar(40) NOT NULL,
  `ObjectID` varchar(80) NOT NULL,
  `ChildID` int(11) DEFAULT NULL,
  `Action` varchar(40) NOT NULL,
  `Property` varchar(40) NOT NULL,
  `OldVal` varchar(255) NOT NULL,
  `NewVal` varchar(255) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fac_genericlog`
--

INSERT INTO `fac_genericlog` (`UserID`, `Class`, `ObjectID`, `ChildID`, `Action`, `Property`, `OldVal`, `NewVal`, `Time`) VALUES
('admin', 'Container', '1', NULL, '1', 'ContainerID', '', '1', '2026-05-31 08:01:21'),
('admin', 'Container', '1', NULL, '1', 'Name', '', 'CNO', '2026-05-31 08:01:21'),
('admin', 'Container', '1', NULL, '1', 'countryCode', '', 'TH', '2026-05-31 08:01:21'),
('admin', 'DataCenter', '1', NULL, '1', 'DataCenterID', '', '1', '2026-05-31 08:03:46'),
('admin', 'DataCenter', '1', NULL, '1', 'Name', '', 'RST', '2026-05-31 08:03:46'),
('admin', 'DataCenter', '1', NULL, '1', 'countryCode', '', 'TH', '2026-05-31 08:03:46'),
('admin', 'DataCenter', '1', NULL, '1', 'ContainerID', '', '1', '2026-05-31 08:03:46'),
('admin', 'DataCenter', '1', NULL, '1', 'U1Position', '', 'Default', '2026-05-31 08:03:46'),
('admin', 'Zone', '1', NULL, '1', 'ZoneID', '', '1', '2026-05-31 08:05:29'),
('admin', 'Zone', '1', NULL, '1', 'DataCenterID', '', '1', '2026-05-31 08:05:29'),
('admin', 'Zone', '1', NULL, '1', 'Description', '', 'RST#1st', '2026-05-31 08:05:29'),
('admin', 'Zone', '1', NULL, '1', 'MapZoom', '', '100', '2026-05-31 08:05:29'),
('admin', 'Zone', '1', NULL, '3', 'Description', 'RST#1st', 'RST#2nd', '2026-05-31 08:06:09'),
('admin', 'Zone', '1', NULL, '3', 'Description', 'RST#2nd', 'RST#1st', '2026-05-31 08:06:39'),
('admin', 'Zone', '2', NULL, '1', 'ZoneID', '', '2', '2026-05-31 08:07:05'),
('admin', 'Zone', '2', NULL, '1', 'DataCenterID', '', '1', '2026-05-31 08:07:05'),
('admin', 'Zone', '2', NULL, '1', 'Description', '', 'RST#2nd', '2026-05-31 08:07:05'),
('admin', 'Zone', '2', NULL, '1', 'MapZoom', '', '100', '2026-05-31 08:07:05'),
('admin', 'Zone', '3', NULL, '1', 'ZoneID', '', '3', '2026-05-31 08:07:38'),
('admin', 'Zone', '3', NULL, '1', 'DataCenterID', '', '1', '2026-05-31 08:07:38'),
('admin', 'Zone', '3', NULL, '1', 'Description', '', 'RST#3rd', '2026-05-31 08:07:38'),
('admin', 'Zone', '3', NULL, '1', 'MapZoom', '', '100', '2026-05-31 08:07:38'),
('admin', 'Zone', '4', NULL, '1', 'ZoneID', '', '4', '2026-05-31 08:08:09'),
('admin', 'Zone', '4', NULL, '1', 'DataCenterID', '', '1', '2026-05-31 08:08:09'),
('admin', 'Zone', '4', NULL, '1', 'Description', '', 'RST#4th', '2026-05-31 08:08:09'),
('admin', 'Zone', '4', NULL, '1', 'MapZoom', '', '100', '2026-05-31 08:08:09'),
('admin', 'Zone', '5', NULL, '1', 'ZoneID', '', '5', '2026-05-31 08:13:03'),
('admin', 'Zone', '5', NULL, '1', 'DataCenterID', '', '1', '2026-05-31 08:13:03'),
('admin', 'Zone', '5', NULL, '1', 'Description', '', 'Zone A', '2026-05-31 08:13:03'),
('admin', 'Zone', '5', NULL, '1', 'MapZoom', '', '100', '2026-05-31 08:13:03'),
('admin', 'Zone', '5', NULL, '3', 'Description', 'Zone A', 'Rooftop', '2026-05-31 08:14:23'),
('admin', 'CabRow', '1', NULL, '1', 'CabRowID', '', '1', '2026-05-31 08:15:26'),
('admin', 'CabRow', '1', NULL, '1', 'Name', '', 'Zone A', '2026-05-31 08:15:26'),
('admin', 'CabRow', '1', NULL, '1', 'DataCenterID', '', '1', '2026-05-31 08:15:26'),
('admin', 'CabRow', '1', NULL, '1', 'ZoneID', '', '2', '2026-05-31 08:15:26'),
('admin', 'CabRow', '2', NULL, '1', 'CabRowID', '', '2', '2026-05-31 08:31:55'),
('admin', 'CabRow', '2', NULL, '1', 'Name', '', 'Zone B', '2026-05-31 08:31:55'),
('admin', 'CabRow', '2', NULL, '1', 'DataCenterID', '', '1', '2026-05-31 08:31:55'),
('admin', 'CabRow', '2', NULL, '1', 'ZoneID', '', '2', '2026-05-31 08:31:55'),
('admin', 'CabRow', '3', NULL, '1', 'CabRowID', '', '3', '2026-05-31 08:32:40'),
('admin', 'CabRow', '3', NULL, '1', 'Name', '', 'Zone C', '2026-05-31 08:32:40'),
('admin', 'CabRow', '3', NULL, '1', 'DataCenterID', '', '1', '2026-05-31 08:32:40'),
('admin', 'CabRow', '3', NULL, '1', 'ZoneID', '', '2', '2026-05-31 08:32:40'),
('admin', 'DataCenter', '1', NULL, '3', 'Name', 'RST', 'RST#1st', '2026-05-31 08:37:23'),
('admin', 'Zone', '5', NULL, '2', '', '', '', '2026-05-31 08:45:40'),
('admin', 'CabRow', '1', NULL, '2', '', '', '', '2026-05-31 08:45:46'),
('admin', 'CabRow', '2', NULL, '2', '', '', '', '2026-05-31 08:45:46'),
('admin', 'CabRow', '3', NULL, '2', '', '', '', '2026-05-31 08:45:46'),
('admin', 'Zone', '2', NULL, '2', '', '', '', '2026-05-31 08:45:46'),
('admin', 'Zone', '1', NULL, '2', '', '', '', '2026-05-31 08:46:15'),
('admin', 'Zone', '3', NULL, '2', '', '', '', '2026-05-31 08:46:21'),
('admin', 'Zone', '4', NULL, '2', '', '', '', '2026-05-31 08:46:35'),
('admin', 'DataCenter', '2', NULL, '1', 'DataCenterID', '', '2', '2026-05-31 08:48:04'),
('admin', 'DataCenter', '2', NULL, '1', 'Name', '', 'RST#2nd', '2026-05-31 08:48:04'),
('admin', 'DataCenter', '2', NULL, '1', 'countryCode', '', 'TH', '2026-05-31 08:48:04'),
('admin', 'DataCenter', '2', NULL, '1', 'ContainerID', '', '1', '2026-05-31 08:48:04'),
('admin', 'DataCenter', '2', NULL, '1', 'U1Position', '', 'Default', '2026-05-31 08:48:04'),
('admin', 'DataCenter', '3', NULL, '1', 'DataCenterID', '', '3', '2026-05-31 08:48:25'),
('admin', 'DataCenter', '3', NULL, '1', 'Name', '', 'RST#3rd', '2026-05-31 08:48:25'),
('admin', 'DataCenter', '3', NULL, '1', 'countryCode', '', 'TH', '2026-05-31 08:48:25'),
('admin', 'DataCenter', '3', NULL, '1', 'ContainerID', '', '1', '2026-05-31 08:48:25'),
('admin', 'DataCenter', '3', NULL, '1', 'U1Position', '', 'Default', '2026-05-31 08:48:25'),
('admin', 'DataCenter', '4', NULL, '1', 'DataCenterID', '', '4', '2026-05-31 08:48:55'),
('admin', 'DataCenter', '4', NULL, '1', 'Name', '', 'RST#4th', '2026-05-31 08:48:55'),
('admin', 'DataCenter', '4', NULL, '1', 'countryCode', '', 'TH', '2026-05-31 08:48:55'),
('admin', 'DataCenter', '4', NULL, '1', 'ContainerID', '', '1', '2026-05-31 08:48:55'),
('admin', 'DataCenter', '4', NULL, '1', 'U1Position', '', 'Default', '2026-05-31 08:48:55'),
('admin', 'Zone', '6', NULL, '1', 'ZoneID', '', '6', '2026-05-31 08:50:12'),
('admin', 'Zone', '6', NULL, '1', 'DataCenterID', '', '2', '2026-05-31 08:50:12'),
('admin', 'Zone', '6', NULL, '1', 'Description', '', 'Zone A', '2026-05-31 08:50:12'),
('admin', 'Zone', '6', NULL, '1', 'MapZoom', '', '100', '2026-05-31 08:50:12'),
('admin', 'Zone', '7', NULL, '1', 'ZoneID', '', '7', '2026-05-31 08:50:58'),
('admin', 'Zone', '7', NULL, '1', 'DataCenterID', '', '2', '2026-05-31 08:50:58'),
('admin', 'Zone', '7', NULL, '1', 'Description', '', 'Zone B', '2026-05-31 08:50:58'),
('admin', 'Zone', '7', NULL, '1', 'MapZoom', '', '100', '2026-05-31 08:50:58'),
('admin', 'Zone', '8', NULL, '1', 'ZoneID', '', '8', '2026-05-31 08:51:16'),
('admin', 'Zone', '8', NULL, '1', 'DataCenterID', '', '2', '2026-05-31 08:51:16'),
('admin', 'Zone', '8', NULL, '1', 'Description', '', 'Zone C', '2026-05-31 08:51:16'),
('admin', 'Zone', '8', NULL, '1', 'MapZoom', '', '100', '2026-05-31 08:51:16'),
('admin', 'CabRow', '4', NULL, '1', 'CabRowID', '', '4', '2026-05-31 08:52:33'),
('admin', 'CabRow', '4', NULL, '1', 'Name', '', 'CA', '2026-05-31 08:52:33'),
('admin', 'CabRow', '4', NULL, '1', 'DataCenterID', '', '2', '2026-05-31 08:52:33'),
('admin', 'CabRow', '4', NULL, '1', 'ZoneID', '', '8', '2026-05-31 08:52:33'),
('admin', 'CabRow', '5', NULL, '1', 'CabRowID', '', '5', '2026-05-31 08:53:04'),
('admin', 'CabRow', '5', NULL, '1', 'Name', '', 'CB', '2026-05-31 08:53:04'),
('admin', 'CabRow', '5', NULL, '1', 'DataCenterID', '', '2', '2026-05-31 08:53:04'),
('admin', 'CabRow', '5', NULL, '1', 'ZoneID', '', '8', '2026-05-31 08:53:04'),
('admin', 'Zone', '9', NULL, '1', 'ZoneID', '', '9', '2026-05-31 08:54:08'),
('admin', 'Zone', '9', NULL, '1', 'DataCenterID', '', '1', '2026-05-31 08:54:08'),
('admin', 'Zone', '9', NULL, '1', 'Description', '', 'Generator Room', '2026-05-31 08:54:08'),
('admin', 'Zone', '9', NULL, '1', 'MapZoom', '', '100', '2026-05-31 08:54:08'),
('admin', 'Zone', '10', NULL, '1', 'ZoneID', '', '10', '2026-05-31 08:54:58'),
('admin', 'Zone', '10', NULL, '1', 'DataCenterID', '', '1', '2026-05-31 08:54:58'),
('admin', 'Zone', '10', NULL, '1', 'Description', '', 'Battery Room', '2026-05-31 08:54:58'),
('admin', 'Zone', '10', NULL, '1', 'MapZoom', '', '100', '2026-05-31 08:54:58'),
('admin', 'Cabinet', '1', NULL, '1', 'CabinetID', '', '1', '2026-05-31 09:00:53'),
('admin', 'Cabinet', '1', NULL, '1', 'DataCenterID', '', '2', '2026-05-31 09:00:53'),
('admin', 'Cabinet', '1', NULL, '1', 'Location', '', 'CB01', '2026-05-31 09:00:53'),
('admin', 'Cabinet', '1', NULL, '1', 'LocationSortable', '', 'CB01', '2026-05-31 09:00:53'),
('admin', 'Cabinet', '1', NULL, '1', 'ZoneID', '', '8', '2026-05-31 09:00:53'),
('admin', 'Cabinet', '1', NULL, '1', 'CabRowID', '', '5', '2026-05-31 09:00:53'),
('admin', 'Cabinet', '1', NULL, '1', 'CabinetHeight', '', '42', '2026-05-31 09:00:53'),
('admin', 'Cabinet', '1', NULL, '1', 'InstallationDate', '', '2026-05-31', '2026-05-31 09:00:53'),
('admin', 'Cabinet', '1', NULL, '1', 'FrontEdge', '', 'Top', '2026-05-31 09:00:53'),
('admin', 'Cabinet', '1', NULL, '1', 'U1Position', '', 'Bottom', '2026-05-31 09:00:53');

-- --------------------------------------------------------

--
-- Table structure for table `fac_jobs`
--

CREATE TABLE `fac_jobs` (
  `SessionID` varchar(80) NOT NULL,
  `Percentage` int(11) NOT NULL DEFAULT 0,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_manufacturer`
--

CREATE TABLE `fac_manufacturer` (
  `ManufacturerID` int(11) NOT NULL,
  `Name` varchar(80) NOT NULL,
  `GlobalID` int(11) NOT NULL DEFAULT 0,
  `SubscribeToUpdates` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_mediatypes`
--

CREATE TABLE `fac_mediatypes` (
  `MediaID` int(11) NOT NULL,
  `MediaType` varchar(40) NOT NULL,
  `ColorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_panelschedule`
--

CREATE TABLE `fac_panelschedule` (
  `PanelID` int(11) NOT NULL,
  `PolePosition` int(11) NOT NULL,
  `NumPoles` int(11) NOT NULL,
  `Label` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_pdustats`
--

CREATE TABLE `fac_pdustats` (
  `PDUID` int(11) NOT NULL,
  `Wattage` int(11) NOT NULL,
  `LastRead` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_people`
--

CREATE TABLE `fac_people` (
  `PersonID` int(11) NOT NULL,
  `UserID` varchar(255) NOT NULL,
  `LastName` varchar(40) NOT NULL,
  `FirstName` varchar(40) NOT NULL,
  `Phone1` varchar(20) NOT NULL,
  `Phone2` varchar(20) NOT NULL,
  `countryCode` char(2) NOT NULL,
  `Email` varchar(80) NOT NULL,
  `APIKey` varchar(80) NOT NULL,
  `AdminOwnDevices` tinyint(1) NOT NULL,
  `ReadAccess` tinyint(1) NOT NULL,
  `WriteAccess` tinyint(1) NOT NULL,
  `DeleteAccess` tinyint(1) NOT NULL,
  `ContactAdmin` tinyint(1) NOT NULL,
  `RackRequest` tinyint(1) NOT NULL,
  `RackAdmin` tinyint(1) NOT NULL,
  `BulkOperations` tinyint(1) NOT NULL,
  `SiteAdmin` tinyint(1) NOT NULL,
  `Disabled` tinyint(1) NOT NULL,
  `LastActivity` datetime NOT NULL,
  `ExpirationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fac_people`
--

INSERT INTO `fac_people` (`PersonID`, `UserID`, `LastName`, `FirstName`, `Phone1`, `Phone2`, `countryCode`, `Email`, `APIKey`, `AdminOwnDevices`, `ReadAccess`, `WriteAccess`, `DeleteAccess`, `ContactAdmin`, `RackRequest`, `RackAdmin`, `BulkOperations`, `SiteAdmin`, `Disabled`, `LastActivity`, `ExpirationDate`) VALUES
(1, 'admin', 'Administrator', 'Emergency', '', '', '', '', '', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2026-05-31 20:05:10', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `fac_ports`
--

CREATE TABLE `fac_ports` (
  `DeviceID` int(11) NOT NULL,
  `PortNumber` int(11) NOT NULL,
  `Label` varchar(40) NOT NULL,
  `MediaID` int(11) NOT NULL DEFAULT 0,
  `ColorID` int(11) NOT NULL DEFAULT 0,
  `ConnectedDeviceID` int(11) DEFAULT NULL,
  `ConnectedPort` int(11) DEFAULT NULL,
  `Notes` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_powerconnection`
--

CREATE TABLE `fac_powerconnection` (
  `PDUID` int(11) NOT NULL,
  `PDUPosition` varchar(11) NOT NULL,
  `DeviceID` int(11) NOT NULL,
  `DeviceConnNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_powerdistribution`
--

CREATE TABLE `fac_powerdistribution` (
  `PDUID` int(11) NOT NULL,
  `Label` varchar(40) NOT NULL,
  `CabinetID` int(11) NOT NULL,
  `TemplateID` int(11) NOT NULL,
  `IPAddress` varchar(254) NOT NULL,
  `SNMPCommunity` varchar(50) NOT NULL,
  `FirmwareVersion` varchar(40) NOT NULL,
  `PanelID` int(11) NOT NULL,
  `BreakerSize` int(11) NOT NULL,
  `PanelPole` varchar(20) NOT NULL,
  `InputAmperage` int(11) NOT NULL,
  `FailSafe` tinyint(1) NOT NULL,
  `PanelID2` int(11) NOT NULL,
  `PanelPole2` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_powerpanel`
--

CREATE TABLE `fac_powerpanel` (
  `PanelID` int(11) NOT NULL,
  `PanelLabel` varchar(80) NOT NULL,
  `NumberOfPoles` int(11) NOT NULL,
  `MainBreakerSize` int(11) NOT NULL,
  `PanelVoltage` int(11) NOT NULL,
  `NumberScheme` varchar(10) NOT NULL DEFAULT 'Sequential',
  `ParentPanelID` int(11) NOT NULL,
  `ParentBreakerName` varchar(80) NOT NULL,
  `PanelIPAddress` varchar(30) NOT NULL,
  `TemplateID` int(11) NOT NULL,
  `MapDataCenterID` int(11) NOT NULL,
  `MapX1` int(11) NOT NULL,
  `MapX2` int(11) NOT NULL,
  `MapY1` int(11) NOT NULL,
  `MapY2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_powerports`
--

CREATE TABLE `fac_powerports` (
  `DeviceID` int(11) NOT NULL,
  `PortNumber` int(11) NOT NULL,
  `Label` varchar(40) NOT NULL,
  `ConnectedDeviceID` int(11) DEFAULT NULL,
  `ConnectedPort` int(11) DEFAULT NULL,
  `Notes` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_projectmembership`
--

CREATE TABLE `fac_projectmembership` (
  `ProjectID` int(11) NOT NULL,
  `MemberType` varchar(7) NOT NULL DEFAULT 'Device',
  `MemberID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_projects`
--

CREATE TABLE `fac_projects` (
  `ProjectID` int(11) NOT NULL,
  `ProjectName` varchar(80) NOT NULL,
  `ProjectSponsor` varchar(80) NOT NULL,
  `ProjectStartDate` date NOT NULL,
  `ProjectExpirationDate` date NOT NULL,
  `ProjectActualEndDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_rackrequest`
--

CREATE TABLE `fac_rackrequest` (
  `RequestID` int(11) NOT NULL,
  `RequestorID` int(11) NOT NULL,
  `RequestTime` datetime NOT NULL,
  `CompleteTime` datetime NOT NULL,
  `Label` varchar(40) NOT NULL,
  `SerialNo` varchar(40) NOT NULL,
  `MfgDate` date NOT NULL,
  `AssetTag` varchar(40) NOT NULL,
  `Hypervisor` varchar(40) NOT NULL,
  `Owner` int(11) NOT NULL,
  `DeviceHeight` int(11) NOT NULL,
  `EthernetCount` int(11) NOT NULL,
  `VLANList` varchar(80) NOT NULL,
  `SANCount` int(11) NOT NULL,
  `SANList` varchar(80) NOT NULL,
  `DeviceClass` varchar(80) NOT NULL,
  `DeviceType` varchar(23) NOT NULL DEFAULT 'Server',
  `LabelColor` varchar(80) NOT NULL,
  `CurrentLocation` varchar(120) NOT NULL,
  `SpecialInstructions` text NOT NULL,
  `RequestedAction` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_sensorreadings`
--

CREATE TABLE `fac_sensorreadings` (
  `DeviceID` int(11) NOT NULL,
  `Temperature` float NOT NULL,
  `Humidity` float NOT NULL,
  `LastRead` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_sensortemplate`
--

CREATE TABLE `fac_sensortemplate` (
  `TemplateID` int(11) NOT NULL,
  `ManufacturerID` int(11) NOT NULL,
  `Model` varchar(80) NOT NULL,
  `TemperatureOID` varchar(256) NOT NULL,
  `HumidityOID` varchar(256) NOT NULL,
  `TempMultiplier` float NOT NULL DEFAULT 1,
  `HumidityMultiplier` float NOT NULL DEFAULT 1,
  `mUnits` varchar(7) NOT NULL DEFAULT 'english'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_slots`
--

CREATE TABLE `fac_slots` (
  `TemplateID` int(11) NOT NULL,
  `Position` int(11) NOT NULL,
  `BackSide` tinyint(1) NOT NULL,
  `X` int(11) DEFAULT NULL,
  `Y` int(11) DEFAULT NULL,
  `W` int(11) DEFAULT NULL,
  `H` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_supplies`
--

CREATE TABLE `fac_supplies` (
  `SupplyID` int(11) NOT NULL,
  `PartNum` varchar(40) NOT NULL,
  `PartName` varchar(80) NOT NULL,
  `MinQty` int(11) NOT NULL,
  `MaxQty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_supplybin`
--

CREATE TABLE `fac_supplybin` (
  `BinID` int(11) NOT NULL,
  `Location` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_tags`
--

CREATE TABLE `fac_tags` (
  `TagID` int(11) NOT NULL,
  `Name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fac_tags`
--

INSERT INTO `fac_tags` (`TagID`, `Name`) VALUES
(2, 'NoReport'),
(1, 'Report');

-- --------------------------------------------------------

--
-- Table structure for table `fac_templateports`
--

CREATE TABLE `fac_templateports` (
  `TemplateID` int(11) NOT NULL,
  `PortNumber` int(11) NOT NULL,
  `Label` varchar(40) NOT NULL,
  `MediaID` int(11) NOT NULL DEFAULT 0,
  `ColorID` int(11) NOT NULL DEFAULT 0,
  `Notes` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_templatepowerports`
--

CREATE TABLE `fac_templatepowerports` (
  `TemplateID` int(11) NOT NULL,
  `PortNumber` int(11) NOT NULL,
  `Label` varchar(40) NOT NULL,
  `PortNotes` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_vminventory`
--

CREATE TABLE `fac_vminventory` (
  `VMIndex` int(11) NOT NULL,
  `DeviceID` int(11) NOT NULL,
  `LastUpdated` datetime NOT NULL,
  `vmID` int(11) NOT NULL,
  `vmName` varchar(80) NOT NULL,
  `vmState` varchar(80) NOT NULL,
  `Owner` int(11) NOT NULL,
  `PrimaryContact` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fac_zone`
--

CREATE TABLE `fac_zone` (
  `ZoneID` int(11) NOT NULL,
  `DataCenterID` int(11) NOT NULL,
  `Description` varchar(120) NOT NULL,
  `MapX1` int(11) NOT NULL,
  `MapY1` int(11) NOT NULL,
  `MapX2` int(11) NOT NULL,
  `MapY2` int(11) NOT NULL,
  `MapZoom` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fac_zone`
--

INSERT INTO `fac_zone` (`ZoneID`, `DataCenterID`, `Description`, `MapX1`, `MapY1`, `MapX2`, `MapY2`, `MapZoom`) VALUES
(6, 2, 'Zone A', 0, 0, 0, 0, 100),
(7, 2, 'Zone B', 0, 0, 0, 0, 100),
(8, 2, 'Zone C', 0, 0, 0, 0, 100),
(9, 1, 'Generator Room', 0, 0, 0, 0, 100),
(10, 1, 'Battery Room', 0, 0, 0, 0, 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fac_cabinet`
--
ALTER TABLE `fac_cabinet`
  ADD PRIMARY KEY (`CabinetID`);

--
-- Indexes for table `fac_cabinettags`
--
ALTER TABLE `fac_cabinettags`
  ADD PRIMARY KEY (`CabinetID`,`TagID`);

--
-- Indexes for table `fac_cabinettooltip`
--
ALTER TABLE `fac_cabinettooltip`
  ADD UNIQUE KEY `Field` (`Field`);

--
-- Indexes for table `fac_cabrow`
--
ALTER TABLE `fac_cabrow`
  ADD PRIMARY KEY (`CabRowID`);

--
-- Indexes for table `fac_cdutemplate`
--
ALTER TABLE `fac_cdutemplate`
  ADD PRIMARY KEY (`TemplateID`),
  ADD UNIQUE KEY `ManufacturerID_2` (`ManufacturerID`,`Model`),
  ADD KEY `ManufacturerID` (`ManufacturerID`);

--
-- Indexes for table `fac_cdutooltip`
--
ALTER TABLE `fac_cdutooltip`
  ADD UNIQUE KEY `Field` (`Field`);

--
-- Indexes for table `fac_colorcoding`
--
ALTER TABLE `fac_colorcoding`
  ADD PRIMARY KEY (`ColorID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `fac_container`
--
ALTER TABLE `fac_container`
  ADD PRIMARY KEY (`ContainerID`);

--
-- Indexes for table `fac_country`
--
ALTER TABLE `fac_country`
  ADD PRIMARY KEY (`countryCode`);

--
-- Indexes for table `fac_datacache`
--
ALTER TABLE `fac_datacache`
  ADD PRIMARY KEY (`ItemType`);

--
-- Indexes for table `fac_datacenter`
--
ALTER TABLE `fac_datacenter`
  ADD PRIMARY KEY (`DataCenterID`);

--
-- Indexes for table `fac_department`
--
ALTER TABLE `fac_department`
  ADD PRIMARY KEY (`DeptID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `fac_device`
--
ALTER TABLE `fac_device`
  ADD PRIMARY KEY (`DeviceID`),
  ADD KEY `SerialNo` (`SerialNo`,`AssetTag`,`PrimaryIP`),
  ADD KEY `AssetTag` (`AssetTag`),
  ADD KEY `Cabinet` (`Cabinet`),
  ADD KEY `TemplateID` (`TemplateID`);

--
-- Indexes for table `fac_devicecache`
--
ALTER TABLE `fac_devicecache`
  ADD UNIQUE KEY `DeviceID` (`DeviceID`);

--
-- Indexes for table `fac_devicecustomattribute`
--
ALTER TABLE `fac_devicecustomattribute`
  ADD PRIMARY KEY (`AttributeID`),
  ADD UNIQUE KEY `Label` (`Label`);

--
-- Indexes for table `fac_devicecustomvalue`
--
ALTER TABLE `fac_devicecustomvalue`
  ADD PRIMARY KEY (`DeviceID`,`AttributeID`);

--
-- Indexes for table `fac_devicestatus`
--
ALTER TABLE `fac_devicestatus`
  ADD PRIMARY KEY (`StatusID`);

--
-- Indexes for table `fac_devicetags`
--
ALTER TABLE `fac_devicetags`
  ADD PRIMARY KEY (`DeviceID`,`TagID`);

--
-- Indexes for table `fac_devicetemplate`
--
ALTER TABLE `fac_devicetemplate`
  ADD PRIMARY KEY (`TemplateID`),
  ADD UNIQUE KEY `ManufacturerID` (`ManufacturerID`,`Model`);

--
-- Indexes for table `fac_devicetemplatecustomvalue`
--
ALTER TABLE `fac_devicetemplatecustomvalue`
  ADD PRIMARY KEY (`TemplateID`,`AttributeID`);

--
-- Indexes for table `fac_disposition`
--
ALTER TABLE `fac_disposition`
  ADD PRIMARY KEY (`DispositionID`);

--
-- Indexes for table `fac_dispositionmembership`
--
ALTER TABLE `fac_dispositionmembership`
  ADD PRIMARY KEY (`DeviceID`);

--
-- Indexes for table `fac_escalations`
--
ALTER TABLE `fac_escalations`
  ADD PRIMARY KEY (`EscalationID`);

--
-- Indexes for table `fac_escalationtimes`
--
ALTER TABLE `fac_escalationtimes`
  ADD PRIMARY KEY (`EscalationTimeID`);

--
-- Indexes for table `fac_genericlog`
--
ALTER TABLE `fac_genericlog`
  ADD KEY `Object` (`ObjectID`),
  ADD KEY `ObjectTime` (`ObjectID`,`Time`);

--
-- Indexes for table `fac_jobs`
--
ALTER TABLE `fac_jobs`
  ADD PRIMARY KEY (`SessionID`);

--
-- Indexes for table `fac_manufacturer`
--
ALTER TABLE `fac_manufacturer`
  ADD PRIMARY KEY (`ManufacturerID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `fac_mediatypes`
--
ALTER TABLE `fac_mediatypes`
  ADD PRIMARY KEY (`MediaID`),
  ADD UNIQUE KEY `mediatype` (`MediaType`);

--
-- Indexes for table `fac_panelschedule`
--
ALTER TABLE `fac_panelschedule`
  ADD PRIMARY KEY (`PanelID`);

--
-- Indexes for table `fac_pdustats`
--
ALTER TABLE `fac_pdustats`
  ADD PRIMARY KEY (`PDUID`);

--
-- Indexes for table `fac_people`
--
ALTER TABLE `fac_people`
  ADD PRIMARY KEY (`PersonID`),
  ADD UNIQUE KEY `UserID` (`UserID`);

--
-- Indexes for table `fac_ports`
--
ALTER TABLE `fac_ports`
  ADD PRIMARY KEY (`DeviceID`,`PortNumber`),
  ADD UNIQUE KEY `LabeledPort` (`DeviceID`,`PortNumber`,`Label`),
  ADD UNIQUE KEY `ConnectedDevice` (`ConnectedDeviceID`,`ConnectedPort`),
  ADD KEY `Notes` (`Notes`);

--
-- Indexes for table `fac_powerconnection`
--
ALTER TABLE `fac_powerconnection`
  ADD UNIQUE KEY `PDUID` (`PDUID`,`PDUPosition`),
  ADD UNIQUE KEY `DeviceID` (`DeviceID`,`DeviceConnNumber`);

--
-- Indexes for table `fac_powerdistribution`
--
ALTER TABLE `fac_powerdistribution`
  ADD PRIMARY KEY (`PDUID`),
  ADD KEY `CabinetID` (`CabinetID`),
  ADD KEY `PanelID` (`PanelID`);

--
-- Indexes for table `fac_powerpanel`
--
ALTER TABLE `fac_powerpanel`
  ADD PRIMARY KEY (`PanelID`);

--
-- Indexes for table `fac_powerports`
--
ALTER TABLE `fac_powerports`
  ADD PRIMARY KEY (`DeviceID`,`PortNumber`),
  ADD UNIQUE KEY `LabeledPort` (`DeviceID`,`PortNumber`,`Label`),
  ADD UNIQUE KEY `ConnectedDevice` (`ConnectedDeviceID`,`ConnectedPort`),
  ADD KEY `Notes` (`Notes`);

--
-- Indexes for table `fac_projectmembership`
--
ALTER TABLE `fac_projectmembership`
  ADD PRIMARY KEY (`ProjectID`,`MemberType`,`MemberID`);

--
-- Indexes for table `fac_projects`
--
ALTER TABLE `fac_projects`
  ADD PRIMARY KEY (`ProjectID`);

--
-- Indexes for table `fac_rackrequest`
--
ALTER TABLE `fac_rackrequest`
  ADD PRIMARY KEY (`RequestID`),
  ADD KEY `RequestorID` (`RequestorID`);

--
-- Indexes for table `fac_sensorreadings`
--
ALTER TABLE `fac_sensorreadings`
  ADD PRIMARY KEY (`DeviceID`);

--
-- Indexes for table `fac_sensortemplate`
--
ALTER TABLE `fac_sensortemplate`
  ADD PRIMARY KEY (`TemplateID`);

--
-- Indexes for table `fac_slots`
--
ALTER TABLE `fac_slots`
  ADD PRIMARY KEY (`TemplateID`,`Position`,`BackSide`);

--
-- Indexes for table `fac_supplies`
--
ALTER TABLE `fac_supplies`
  ADD PRIMARY KEY (`SupplyID`);

--
-- Indexes for table `fac_supplybin`
--
ALTER TABLE `fac_supplybin`
  ADD PRIMARY KEY (`BinID`);

--
-- Indexes for table `fac_tags`
--
ALTER TABLE `fac_tags`
  ADD PRIMARY KEY (`TagID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `fac_templateports`
--
ALTER TABLE `fac_templateports`
  ADD PRIMARY KEY (`TemplateID`,`PortNumber`),
  ADD UNIQUE KEY `LabeledPort` (`TemplateID`,`PortNumber`,`Label`);

--
-- Indexes for table `fac_templatepowerports`
--
ALTER TABLE `fac_templatepowerports`
  ADD PRIMARY KEY (`TemplateID`,`PortNumber`),
  ADD UNIQUE KEY `LabeledPort` (`TemplateID`,`PortNumber`,`Label`);

--
-- Indexes for table `fac_vminventory`
--
ALTER TABLE `fac_vminventory`
  ADD PRIMARY KEY (`VMIndex`),
  ADD UNIQUE KEY `VMList` (`vmID`,`vmName`),
  ADD KEY `ValidDevice` (`DeviceID`);

--
-- Indexes for table `fac_zone`
--
ALTER TABLE `fac_zone`
  ADD PRIMARY KEY (`ZoneID`),
  ADD KEY `DataCenterID` (`DataCenterID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fac_cabinet`
--
ALTER TABLE `fac_cabinet`
  MODIFY `CabinetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fac_cabrow`
--
ALTER TABLE `fac_cabrow`
  MODIFY `CabRowID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fac_cdutemplate`
--
ALTER TABLE `fac_cdutemplate`
  MODIFY `TemplateID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_colorcoding`
--
ALTER TABLE `fac_colorcoding`
  MODIFY `ColorID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_container`
--
ALTER TABLE `fac_container`
  MODIFY `ContainerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fac_datacenter`
--
ALTER TABLE `fac_datacenter`
  MODIFY `DataCenterID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fac_department`
--
ALTER TABLE `fac_department`
  MODIFY `DeptID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_device`
--
ALTER TABLE `fac_device`
  MODIFY `DeviceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_devicecustomattribute`
--
ALTER TABLE `fac_devicecustomattribute`
  MODIFY `AttributeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_devicestatus`
--
ALTER TABLE `fac_devicestatus`
  MODIFY `StatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fac_devicetemplate`
--
ALTER TABLE `fac_devicetemplate`
  MODIFY `TemplateID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_disposition`
--
ALTER TABLE `fac_disposition`
  MODIFY `DispositionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fac_escalations`
--
ALTER TABLE `fac_escalations`
  MODIFY `EscalationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_escalationtimes`
--
ALTER TABLE `fac_escalationtimes`
  MODIFY `EscalationTimeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_manufacturer`
--
ALTER TABLE `fac_manufacturer`
  MODIFY `ManufacturerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_mediatypes`
--
ALTER TABLE `fac_mediatypes`
  MODIFY `MediaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_panelschedule`
--
ALTER TABLE `fac_panelschedule`
  MODIFY `PanelID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_people`
--
ALTER TABLE `fac_people`
  MODIFY `PersonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fac_powerdistribution`
--
ALTER TABLE `fac_powerdistribution`
  MODIFY `PDUID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_powerpanel`
--
ALTER TABLE `fac_powerpanel`
  MODIFY `PanelID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_projects`
--
ALTER TABLE `fac_projects`
  MODIFY `ProjectID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_rackrequest`
--
ALTER TABLE `fac_rackrequest`
  MODIFY `RequestID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_sensortemplate`
--
ALTER TABLE `fac_sensortemplate`
  MODIFY `TemplateID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_supplies`
--
ALTER TABLE `fac_supplies`
  MODIFY `SupplyID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_supplybin`
--
ALTER TABLE `fac_supplybin`
  MODIFY `BinID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_tags`
--
ALTER TABLE `fac_tags`
  MODIFY `TagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fac_vminventory`
--
ALTER TABLE `fac_vminventory`
  MODIFY `VMIndex` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fac_zone`
--
ALTER TABLE `fac_zone`
  MODIFY `ZoneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
