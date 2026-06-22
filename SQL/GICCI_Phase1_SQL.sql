-- ============================================================
--  GLOBAL INFLATION & CURRENCY CRISIS INDEX (GICCI)
--  Phase 1 — SQL Database
--  Author : Santosh Gutte
--  Dataset : 50 Countries | 1970 – 2025
-- ============================================================
CREATE DATABASE gicci_db;
USE gicci_db;


-- ============================================================
--  TABLE 1: countries (50 countries)
-- ============================================================
CREATE TABLE countries (
    country_id      INT PRIMARY KEY,
    country_name    VARCHAR(100) NOT NULL,
    country_code    CHAR(3)      NOT NULL,
    region          VARCHAR(50)  NOT NULL,
    sub_region      VARCHAR(50),
    currency_name   VARCHAR(50),
    currency_code   CHAR(3)
);
 
INSERT INTO countries VALUES
(1,  'India',           'IND', 'South Asia',     'Indian Subcontinent', 'Indian Rupee',       'INR'),
(2,  'Pakistan',        'PAK', 'South Asia',     'Indian Subcontinent', 'Pakistani Rupee',    'PKR'),
(3,  'Sri Lanka',       'LKA', 'South Asia',     'Indian Subcontinent', 'Sri Lankan Rupee',   'LKR'),
(4,  'Bangladesh',      'BGD', 'South Asia',     'Indian Subcontinent', 'Taka',               'BDT'),
(5,  'Nepal',           'NPL', 'South Asia',     'Indian Subcontinent', 'Nepalese Rupee',     'NPR'),
(6,  'Indonesia',       'IDN', 'Southeast Asia', 'Maritime SEA',        'Indonesian Rupiah',  'IDR'),
(7,  'Thailand',        'THA', 'Southeast Asia', 'Mainland SEA',        'Thai Baht',          'THB'),
(8,  'Malaysia',        'MYS', 'Southeast Asia', 'Maritime SEA',        'Malaysian Ringgit',  'MYR'),
(9,  'Philippines',     'PHL', 'Southeast Asia', 'Maritime SEA',        'Philippine Peso',    'PHP'),
(10, 'Vietnam',         'VNM', 'Southeast Asia', 'Mainland SEA',        'Vietnamese Dong',    'VND'),
(11, 'Argentina',       'ARG', 'Latin America',  'Southern Cone',       'Argentine Peso',     'ARS'),
(12, 'Venezuela',       'VEN', 'Latin America',  'Northern SA',         'Venezuelan Bolivar', 'VES'),
(13, 'Brazil',          'BRA', 'Latin America',  'Northern SA',         'Brazilian Real',     'BRL'),
(14, 'Mexico',          'MEX', 'Latin America',  'Central America',     'Mexican Peso',       'MXN'),
(15, 'Chile',           'CHL', 'Latin America',  'Southern Cone',       'Chilean Peso',       'CLP'),
(16, 'Colombia',        'COL', 'Latin America',  'Northern SA',         'Colombian Peso',     'COP'),
(17, 'Peru',            'PER', 'Latin America',  'Southern Cone',       'Peruvian Sol',       'PEN'),
(18, 'Ecuador',         'ECU', 'Latin America',  'Northern SA',         'US Dollar',          'USD'),
(19, 'Bolivia',         'BOL', 'Latin America',  'Southern Cone',       'Boliviano',          'BOB'),
(20, 'Uruguay',         'URY', 'Latin America',  'Southern Cone',       'Uruguayan Peso',     'UYU'),
(21, 'Germany',         'DEU', 'Europe',         'Western Europe',      'Euro',               'EUR'),
(22, 'France',          'FRA', 'Europe',         'Western Europe',      'Euro',               'EUR'),
(23, 'United Kingdom',  'GBR', 'Europe',         'Northern Europe',     'British Pound',      'GBP'),
(24, 'Italy',           'ITA', 'Europe',         'Southern Europe',     'Euro',               'EUR'),
(25, 'Spain',           'ESP', 'Europe',         'Southern Europe',     'Euro',               'EUR'),
(26, 'Greece',          'GRC', 'Europe',         'Southern Europe',     'Euro',               'EUR'),
(27, 'Turkey',          'TUR', 'Europe',         'Eastern Europe',      'Turkish Lira',       'TRY'),
(28, 'Russia',          'RUS', 'Europe',         'Eastern Europe',      'Russian Ruble',      'RUB'),
(29, 'Ukraine',         'UKR', 'Europe',         'Eastern Europe',      'Ukrainian Hryvnia',  'UAH'),
(30, 'Poland',          'POL', 'Europe',         'Eastern Europe',      'Polish Zloty',       'PLN'),
(31, 'Nigeria',         'NGA', 'Africa',         'West Africa',         'Nigerian Naira',     'NGN'),
(32, 'Egypt',           'EGY', 'Africa',         'North Africa',        'Egyptian Pound',     'EGP'),
(33, 'South Africa',    'ZAF', 'Africa',         'Southern Africa',     'South African Rand', 'ZAR'),
(34, 'Kenya',           'KEN', 'Africa',         'East Africa',         'Kenyan Shilling',    'KES'),
(35, 'Ethiopia',        'ETH', 'Africa',         'East Africa',         'Ethiopian Birr',     'ETB'),
(36, 'Ghana',           'GHA', 'Africa',         'West Africa',         'Ghanaian Cedi',      'GHS'),
(37, 'Tanzania',        'TZA', 'Africa',         'East Africa',         'Tanzanian Shilling', 'TZS'),
(38, 'Zimbabwe',        'ZWE', 'Africa',         'Southern Africa',     'Zimbabwe Dollar',    'ZWL'),
(39, 'Sudan',           'SDN', 'Africa',         'North Africa',        'Sudanese Pound',     'SDG'),
(40, 'Angola',          'AGO', 'Africa',         'Central Africa',      'Angolan Kwanza',     'AOA'),
(41, 'USA',             'USA', 'North America',  'Northern America',    'US Dollar',          'USD'),
(42, 'Canada',          'CAN', 'North America',  'Northern America',    'Canadian Dollar',    'CAD'),
(43, 'Japan',           'JPN', 'East Asia',      'East Asia',           'Japanese Yen',       'JPY'),
(44, 'China',           'CHN', 'East Asia',      'East Asia',           'Chinese Yuan',       'CNY'),
(45, 'South Korea',     'KOR', 'East Asia',      'East Asia',           'South Korean Won',   'KRW'),
(46, 'Saudi Arabia',    'SAU', 'Middle East',    'Arabian Peninsula',   'Saudi Riyal',        'SAR'),
(47, 'Iran',            'IRN', 'Middle East',    'Persian Gulf',        'Iranian Rial',       'IRR'),
(48, 'Israel',          'ISR', 'Middle East',    'Levant',              'Israeli Shekel',     'ILS'),
(49, 'UAE',             'ARE', 'Middle East',    'Arabian Peninsula',   'UAE Dirham',         'AED'),
(50, 'Lebanon',         'LBN', 'Middle East',    'Levant',              'Lebanese Pound',     'LBP');
 
 
 SELECT * FROM countries;
 
 
 
 
 
-- ============================================================
--  TABLE 2: economic_indicators
-- ============================================================
CREATE TABLE economic_indicators (
    indicator_id        INT PRIMARY KEY,
    country_id          INT          NOT NULL,
    year                INT          NOT NULL,
    inflation_rate      DECIMAL(12,2),
    gdp_growth_rate     DECIMAL(8,2),
    unemployment_rate   DECIMAL(8,2),
    current_account_pct DECIMAL(8,2),
    foreign_reserves_bn DECIMAL(10,2),
    notes               VARCHAR(500),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);
 
INSERT INTO economic_indicators VALUES
-- INDIA
(1,  1,1970,  5.5,  5.0, 3.2,-1.2,   0.8,'Post Green Revolution era'),
(2,  1,1980, 11.3,  6.7, 4.0,-1.8,   6.8,'Oil shock impact'),
(3,  1,1991, 13.9, -1.1, 5.0,-3.5,   1.2,'BOP Crisis IMF bailout'),
(4,  1,1995,  9.9,  7.6, 4.8,-1.5,  20.8,'Post liberalization growth'),
(5,  1,2000,  3.8,  4.2, 4.3,-1.0,  38.0,'IT boom begins'),
(6,  1,2005,  4.2,  9.3, 4.4,-1.2, 132.5,'High growth phase'),
(7,  1,2008,  8.3,  3.9, 4.5,-2.3, 248.0,'Global financial crisis'),
(8,  1,2013,  9.9,  6.4, 4.7,-4.8, 292.0,'Taper tantrum rupee fall'),
(9,  1,2016,  4.5,  8.3, 4.5,-0.7, 360.0,'Demonetization year'),
(10, 1,2020,  6.1, -6.6, 7.1, 0.9, 577.0,'COVID GDP contraction'),
(11, 1,2022,  6.7,  7.2, 4.8,-2.0, 561.0,'Post COVID recovery'),
(12, 1,2025,  4.8,  6.5, 4.3,-1.5, 660.0,'Stable growth digital economy'),
-- PAKISTAN
(13, 2,1980, 11.9,  8.9, 3.5,-4.6,   1.8,'Zia era Afghan war'),
(14, 2,1990,  9.6,  4.6, 3.1,-4.3,   0.7,'Political instability'),
(15, 2,2000,  3.6,  4.3, 7.8,-0.2,   2.3,'Musharraf era'),
(16, 2,2010, 13.9,  2.6, 5.6,-2.2,  16.8,'Energy crisis begins'),
(17, 2,2015,  2.5,  4.1, 5.9,-1.0,  18.7,'CPEC investment surge'),
(18, 2,2020, 10.7, -0.5, 4.5,-1.5,  12.1,'COVID IMF program'),
(19, 2,2023, 29.2, -0.5, 6.1,-1.0,   8.2,'Severe economic crisis'),
-- SRI LANKA
(20, 3,2000,  6.2,  6.0, 7.7,-3.4,   1.0,'Post war recovery'),
(21, 3,2010,  5.9,  8.0, 4.9,-2.9,   6.9,'War ended growth'),
(22, 3,2019,  3.5,  2.3, 5.0,-3.1,   7.6,'Pre crisis stability'),
(23, 3,2020,  4.6, -3.6, 5.3,-1.2,   5.7,'COVID impact'),
(24, 3,2021,  5.9,  3.3, 5.0,-3.8,   3.1,'Reserves collapse begins'),
(25, 3,2022, 46.4, -8.7, 5.4,-3.5,   1.7,'Economic meltdown default'),
(26, 3,2023, 25.2, -2.3, 4.8,-1.9,   3.5,'IMF bailout austerity'),
-- BANGLADESH
(27, 4,1980, 10.5,  3.6,45.0,-2.5,   0.2,'Post liberation poverty'),
(28, 4,1990,  5.6,  5.9,35.0,-1.1,   1.1,'Garment industry growth'),
(29, 4,2000,  2.8,  5.9,25.0,-1.5,   1.6,'Export boom begins'),
(30, 4,2010,  8.1,  5.6,18.0,-0.5,  11.2,'RMG sector expansion'),
(31, 4,2020,  5.7,  3.8, 5.3,-1.7,  43.2,'COVID resilience'),
(32, 4,2023,  9.0,  6.0, 5.1,-0.5,  31.2,'Post COVID recovery'),
-- NEPAL
(33, 5,1990, 11.2,  4.6,10.0,-5.1,   0.3,'Democracy transition'),
(34, 5,2000,  3.4,  6.1, 7.0,-3.5,   0.9,'Tourism growth'),
(35, 5,2010,  9.6,  4.8, 7.5,-2.8,   3.2,'Remittance economy'),
(36, 5,2020,  4.2, -2.4, 5.0,-1.2,   9.5,'COVID tourism collapse'),
(37, 5,2023,  7.8,  4.2, 5.5,-7.5,   4.1,'Forex crisis recovery'),
-- INDONESIA
(38, 6,1980, 18.0,  9.9, 2.0,-2.5,   5.5,'Oil boom Suharto'),
(39, 6,1990,  7.8,  9.0, 2.7,-2.6,  10.4,'Manufacturing growth'),
(40, 6,1997,  6.2,  4.7, 4.7,-2.3,  20.3,'Pre Asian crisis peak'),
(41, 6,1998, 58.5,-13.1, 5.5, 4.3,  23.6,'Asian Crisis collapse'),
(42, 6,2000,  3.7,  4.9, 6.1, 5.3,  29.4,'Post crisis recovery'),
(43, 6,2010,  5.1,  6.2, 7.1, 0.7,  96.2,'Commodity boom'),
(44, 6,2020,  2.0, -2.1, 7.1,-0.4, 135.9,'COVID impact'),
(45, 6,2023,  3.7,  5.0, 5.3,-1.0, 139.3,'Stable recovery'),
-- THAILAND
(46, 7,1980, 19.7,  5.0, 0.5,-6.3,   1.8,'Oil shock impact'),
(47, 7,1990,  5.9, 11.2, 2.2,-8.5,  14.3,'Tiger economy boom'),
(48, 7,1997,  5.6, -2.8, 0.9,-12.8, 26.2,'Asian crisis hit'),
(49, 7,1998,  8.1,-10.5, 3.4,12.7,  29.5,'Baht collapse recovery'),
(50, 7,2000,  1.6,  4.5, 1.5, 7.5,  32.7,'Export led recovery'),
(51, 7,2010,  3.3,  7.5, 1.0, 3.1, 172.1,'Strong growth'),
(52, 7,2020, -0.8, -6.1, 1.7, 3.4, 246.0,'COVID tourism collapse'),
(53, 7,2023,  1.2,  1.9, 1.1, 1.2, 224.5,'Slow recovery'),
-- MALAYSIA
(54, 8,1980,  6.7,  7.4, 3.4,-0.5,   4.5,'Commodity dependent'),
(55, 8,1990,  2.6,  9.0, 5.1,-2.1,   9.7,'Manufacturing boom'),
(56, 8,1997,  2.7,  7.3, 2.4,-12.1, 26.6,'Pre crisis peak'),
(57, 8,1998,  5.3, -7.4, 3.2,13.2,  25.6,'Asian crisis capital controls'),
(58, 8,2000,  1.6,  8.9, 3.0, 9.4,  29.6,'Strong recovery'),
(59, 8,2010,  1.7,  7.4, 3.4,10.9, 106.5,'Stable growth'),
(60, 8,2020, -1.1, -5.6, 4.5, 4.2, 107.6,'COVID impact'),
(61, 8,2023,  2.5,  3.6, 3.4, 2.8, 113.5,'Recovery'),
-- PHILIPPINES
(62, 9,1980, 18.2,  5.5, 4.8,-5.8,   1.8,'Marcos era'),
(63, 9,1990, 12.7,  3.0, 8.1,-6.0,   2.2,'Post Marcos recovery'),
(64, 9,2000,  4.4,  4.4,10.1,-3.5,  13.5,'OFW remittances grow'),
(65, 9,2010,  3.8,  7.6, 7.3, 3.5,  62.4,'BPO boom'),
(66, 9,2020,  2.6, -9.5, 8.7, 3.3, 110.1,'COVID worst hit in Asia'),
(67, 9,2023,  6.0,  5.6, 4.8,-3.1, 103.7,'Recovery'),
-- VIETNAM
(68,10,1990, 67.1,  5.1,12.0,-6.1,   0.2,'Doi Moi reforms begin'),
(69,10,2000, -1.7,  6.8, 6.5,-1.0,   3.4,'WTO preparation'),
(70,10,2010,  9.2,  6.4, 2.9,-3.8,  12.5,'Manufacturing hub rises'),
(71,10,2020,  3.2,  2.9, 2.5,-0.5,  95.0,'COVID managed well'),
(72,10,2023,  3.3,  5.0, 2.2,-4.5, 103.0,'Export slowdown'),
-- ARGENTINA
(73,11,1975,183.0, -0.5, 3.1,-1.5,   1.5,'Rodrigazo hyperinflation'),
(74,11,1980, 87.5,  1.5, 2.8,-2.1,   4.2,'Chronic inflation'),
(75,11,1985,385.0, -4.4, 4.2,-2.5,   3.8,'Austral Plan'),
(76,11,1989,3080.0,-7.0, 7.4,-2.8,   1.2,'Hyperinflation peak'),
(77,11,1995,  1.6, -2.8,17.5,-1.8,  15.5,'Tequila effect'),
(78,11,2001, -1.1, -4.4,18.3,-1.2,  14.6,'Corralito banking freeze'),
(79,11,2002, 25.9,-10.9,19.7,-8.5,   9.8,'Largest sovereign default'),
(80,11,2010, 22.9,  9.5, 7.7, 0.2,  52.2,'Kirchner boom'),
(81,11,2018, 47.6, -2.6, 9.2,-4.8,  65.8,'Peso crisis IMF bailout'),
(82,11,2022, 94.8, -2.1, 6.8,-2.9,  37.0,'Inflation spiral'),
(83,11,2024,211.4, -1.7, 7.5,-1.2,  27.0,'Milei shock therapy'),
-- VENEZUELA
(84,12,1980, 19.6, -2.0, 5.0, 4.5,  10.2,'Oil boom ends'),
(85,12,1990, 40.7,  6.5, 9.9,-1.5,   8.8,'Caracazo riots'),
(86,12,1998, 35.8, -0.1,11.2,-4.2,  14.8,'Chavez elected'),
(87,12,2005, 15.9, 10.3, 9.5, 4.5,  30.4,'Oil windfall'),
(88,12,2013, 40.6,  1.3, 7.8,-3.5,  20.1,'Maduro era begins'),
(89,12,2016,254.4,-17.0,21.2,-4.2,   9.8,'Economic collapse'),
(90,12,2018,65374.0,-19.6,33.3,-4.0, 9.7,'Worst modern hyperinflation'),
(91,12,2022,167.2, 17.5,14.5,-3.2,  10.5,'Dollarization stabilizing'),
-- BRAZIL
(92,13,1980, 82.8,  9.2, 6.3,-5.1,   6.9,'Oil shock debt crisis'),
(93,13,1990,2947.7,-4.3, 4.3,-0.8,   9.5,'Hyperinflation Collor Plan'),
(94,13,1995, 22.0,  4.2, 4.6,-2.6,  51.8,'Real Plan success'),
(95,13,2000,  7.1,  4.4, 9.6,-4.0,  33.0,'Lula era begins'),
(96,13,2010,  5.0,  7.5, 6.7,-3.5, 288.6,'Commodity boom'),
(97,13,2015,  9.0, -3.5,11.5,-3.0, 369.5,'Recession begins'),
(98,13,2020,  3.2, -4.1,13.7,-1.7, 355.6,'COVID impact'),
(99,13,2023,  4.6,  2.9, 8.0,-1.2, 355.0,'Recovery'),
-- MEXICO
(100,14,1980, 26.4,  8.3, 4.5,-5.4,   3.0,'Oil boom'),
(101,14,1990, 26.7,  5.1, 2.7,-3.0,  10.0,'NAFTA approaching'),
(102,14,1995, 35.0, -6.2, 6.2,-0.5,   6.3,'Tequila crisis'),
(103,14,2000,  9.5,  6.6, 2.2,-3.2,  35.5,'Post NAFTA growth'),
(104,14,2010,  4.2,  5.1, 5.4,-0.4, 120.6,'Manufacturing boom'),
(105,14,2020,  3.4, -8.2, 4.4, 2.4, 193.0,'COVID impact'),
(106,14,2023,  5.5,  3.2, 2.8,-1.1, 214.0,'Nearshoring boom'),
-- CHILE
(107,15,1980, 35.1,  7.8,10.4,-7.1,   4.1,'Pinochet reforms'),
(108,15,1990, 26.0,  3.7, 7.8,-1.6,   6.9,'Democracy transition'),
(109,15,2000,  3.8,  4.5, 9.7,-1.1,  15.1,'Stable growth era'),
(110,15,2010,  1.4,  5.8, 8.1, 1.5,  27.8,'Mining boom'),
(111,15,2020,  3.0, -5.8,10.8, 1.1,  39.0,'COVID social unrest'),
(112,15,2023,  7.6,  0.2, 8.8,-3.8,  42.3,'Inflation spike'),
-- COLOMBIA
(113,16,1980, 26.5,  4.1, 9.8,-0.2,   5.6,'Coffee economy'),
(114,16,1990, 32.4,  4.3,10.2,-0.5,   4.6,'Cartel era'),
(115,16,2000,  9.2,  2.9,20.2,-0.9,   8.4,'FARC conflict'),
(116,16,2010,  2.3,  3.9,11.8,-3.0,  28.5,'Peace process'),
(117,16,2020,  1.6, -7.0,15.9,-3.4,  58.5,'COVID impact'),
(118,16,2023, 11.7,  0.6,10.2,-3.1,  59.1,'Inflation spike'),
-- PERU
(119,17,1980, 59.2,  2.9, 7.1,-4.1,   1.8,'Military government'),
(120,17,1990,7481.7,-5.1,10.1,-5.4,   0.5,'Hyperinflation Fujimori'),
(121,17,2000,  3.8,  3.0, 7.6,-2.9,   8.6,'Post hyperinflation'),
(122,17,2010,  1.5,  8.5, 7.9,-2.5,  44.2,'Mining boom'),
(123,17,2020,  1.8,-11.0, 7.4, 0.7,  74.7,'COVID worst in region'),
(124,17,2023,  6.5,  0.5, 7.0,-1.8,  71.4,'Political instability'),
-- ECUADOR
(125,18,1990, 48.4,  3.0, 7.5,-3.2,   0.8,'Sucre depreciation'),
(126,18,2000, 96.1,  1.1,14.4, 5.8,   1.2,'Dollarization year'),
(127,18,2010,  3.6,  3.5, 5.0,-2.3,   2.6,'Oil boom Correa'),
(128,18,2020, -0.3, -7.8, 6.6, 2.9,   7.1,'COVID oil crash'),
(129,18,2023,  2.2,  2.4, 3.7, 2.1,   7.8,'Stable dollarized'),
-- BOLIVIA
(130,19,1980, 47.1,  0.6,12.0,-4.4,   0.3,'Military government'),
(131,19,1985,11750.0,-1.0,15.0,-5.5,  0.1,'Hyperinflation peak'),
(132,19,2000,  4.6,  2.5, 7.5,-5.7,   1.1,'Gas boom beginning'),
(133,19,2010,  2.5,  4.1, 5.7, 4.0,  10.0,'Morales commodity boom'),
(134,19,2020,  0.9, -8.8, 8.7, 2.3,   5.3,'COVID political crisis'),
(135,19,2023,  2.6,  2.0, 4.5,-2.3,   3.8,'Forex reserves declining'),
-- URUGUAY
(136,20,1990,112.5,  0.9, 9.3,-0.7,   0.7,'Hyperinflation'),
(137,20,2002, 25.9,-11.0,17.0, 3.5,   0.8,'Banking crisis default'),
(138,20,2010,  6.7,  8.4, 6.8,-1.0,  10.1,'Strong recovery'),
(139,20,2020,  9.8, -6.1, 7.5,-1.0,  16.7,'COVID impact'),
(140,20,2023,  5.1,  1.8, 8.3,-2.5,  17.2,'Stable economy'),
-- GERMANY
(141,21,1980,  5.5,  1.0, 2.9, 0.5,  55.0,'Oil shock impact'),
(142,21,1990,  2.7,  5.3, 4.8,-3.5,  65.0,'Reunification spending'),
(143,21,2000,  1.4,  3.0, 8.0,-1.8,  75.0,'Dot com era'),
(144,21,2008,  2.8,  1.1, 7.4, 5.7,  80.0,'GFC strong exports'),
(145,21,2020,  0.5, -4.6, 4.2, 7.0,  85.0,'COVID'),
(146,21,2022,  8.7,  1.8, 5.3, 4.1,  88.0,'Energy crisis Russia gas'),
(147,21,2024,  2.5, -0.2, 5.8, 5.5,  90.0,'Industrial recession'),
-- FRANCE
(148,22,1980, 13.6,  1.6, 6.4,-0.6,  30.0,'Oil shock stagflation'),
(149,22,1990,  3.2,  2.9, 9.0,-0.8,  35.0,'Post reunification'),
(150,22,2000,  1.7,  3.9, 9.1, 1.4,  40.0,'Euro adoption'),
(151,22,2010,  1.5,  1.9, 9.3,-1.2,  45.0,'Post GFC recovery'),
(152,22,2020,  0.5, -7.9, 8.0,-3.4,  50.0,'COVID lockdowns'),
(153,22,2023,  4.9,  0.9, 7.3,-1.3,  55.0,'Inflation normalizing'),
-- UNITED KINGDOM
(154,23,1980, 18.0, -2.1, 6.9, 1.3,  25.0,'Thatcher era recession'),
(155,23,1990,  9.5,  0.5, 6.9,-3.9,  30.0,'ERM membership'),
(156,23,2000,  2.9,  4.2, 5.4,-2.6,  35.0,'Blair era growth'),
(157,23,2010,  3.3,  1.5, 7.8,-3.3,  40.0,'Austerity begins'),
(158,23,2020,  0.9, -9.3, 4.8,-2.6,  45.0,'COVID + Brexit'),
(159,23,2022, 11.1,  4.0, 3.7,-5.3,  48.0,'Highest inflation since 1981'),
(160,23,2023,  6.8,  0.3, 4.2,-3.5,  50.0,'Inflation cooling'),
-- ITALY
(161,24,1980, 21.2,  3.5, 7.6,-2.4,  25.0,'Oil shock'),
(162,24,1990,  6.5,  2.0,11.4,-1.5,  30.0,'Lira weakness'),
(163,24,2000,  2.6,  3.7,10.6, 0.5,  35.0,'Euro adoption'),
(164,24,2010,  1.6,  1.7, 8.4,-3.5,  40.0,'Debt crisis'),
(165,24,2020, -0.1, -8.9, 9.3, 3.7,  45.0,'COVID worst in Europe'),
(166,24,2023,  5.9,  0.9, 6.7, 1.3,  48.0,'Recovery'),
-- SPAIN
(167,25,1980, 15.6,  1.5,11.7,-2.3,  12.0,'Post Franco transition'),
(168,25,1990,  6.7,  3.8,16.3,-3.5,  20.0,'EU membership boom'),
(169,25,2000,  3.4,  5.3,13.9,-4.0,  25.0,'Housing boom'),
(170,25,2010,  2.0, -0.1,19.9,-4.0,  30.0,'Debt crisis austerity'),
(171,25,2013,  1.5, -1.7,26.1, 1.5,  35.0,'Unemployment peak'),
(172,25,2020, -0.3,-10.8,15.5, 0.7,  40.0,'COVID worst in Europe'),
(173,25,2023,  3.4,  2.5,11.6, 2.5,  45.0,'Strong recovery'),
-- GREECE
(174,26,1980, 24.9,  1.8, 2.7,-3.7,   3.0,'Pre EU'),
(175,26,2000,  3.2,  4.5,11.2,-7.7,   8.0,'Olympics boom'),
(176,26,2010,  4.7, -5.4,12.5,-10.1, 10.0,'Debt crisis explodes'),
(177,26,2012,  1.0, -7.3,24.4,-2.4,   7.0,'Bailout austerity'),
(178,26,2015, -1.1, -0.4,24.9, 0.1,   6.0,'Referendum crisis'),
(179,26,2020, -1.3, -9.0,16.4,-7.0,   9.0,'COVID impact'),
(180,26,2023,  3.5,  2.0,10.9,-7.2,  12.0,'Recovery'),
-- TURKEY
(181,27,1980, 94.3, -2.8, 8.2,-2.5,   3.5,'Military coup structural crisis'),
(182,27,1990, 60.3,  9.4, 7.9,-1.8,   8.6,'Chronic inflation'),
(183,27,1994,106.3, -5.5, 8.2,-2.1,   5.2,'Banking crisis lira collapse'),
(184,27,2001, 54.4, -5.7, 8.4,-2.5,  18.9,'IMF bailout banking crisis'),
(185,27,2005,  8.2,  8.4, 9.5,-4.5,  50.5,'AKP reforms disinflation'),
(186,27,2018, 16.3,  2.8,10.9,-3.5,  93.0,'Lira crash 30%'),
(187,27,2021, 19.6, 11.0,12.0,-0.9, 111.0,'Unorthodox rate cuts'),
(188,27,2022, 72.3,  5.6,10.5,-5.7, 128.5,'80 year inflation high'),
(189,27,2024, 65.0,  3.2, 9.8,-3.2, 150.2,'Rate hikes stabilizing'),
-- RUSSIA
(190,28,1992,1526.0,-14.5,5.2, 2.0,   8.0,'Soviet collapse hyperinflation'),
(191,28,1998, 27.7, -5.3,11.8, 0.1,  12.6,'Ruble crisis default'),
(192,28,2000, 20.8, 10.0,10.6,18.0,  28.0,'Putin era oil boom'),
(193,28,2010,  6.9,  4.5, 7.4, 4.4, 479.4,'Resource boom'),
(194,28,2014,  7.8,  0.7, 5.2, 3.1, 385.5,'Crimea annexation sanctions'),
(195,28,2020,  3.4, -2.7, 5.8, 2.4, 595.8,'COVID oil crash'),
(196,28,2022, 13.7, -2.1, 3.9,10.8, 581.7,'Ukraine war sanctions'),
-- UKRAINE
(197,29,1993,10155.0,-14.2,1.0,2.0,   0.5,'Post Soviet hyperinflation'),
(198,29,2000, 28.2,  5.9,11.7, 4.8,   1.5,'Recovery begins'),
(199,29,2010,  9.4,  4.1, 8.8,-2.2,  34.6,'Yanukovych era'),
(200,29,2014, 12.1, -6.6, 9.3,-3.4,  20.4,'Maidan revolution'),
(201,29,2020,  2.7, -3.8, 9.5, 3.3,  29.1,'COVID'),
(202,29,2022, 20.2,-29.1,15.0,-8.0,  25.4,'Russian invasion'),
-- POLAND
(203,30,1990,585.8,-11.6, 6.3, 1.0,   4.5,'Shock therapy transition'),
(204,30,2000, 10.1,  4.3,16.1,-5.8,  26.6,'EU accession prep'),
(205,30,2010,  2.6,  3.7, 9.6,-5.1,  93.5,'Avoided recession'),
(206,30,2020,  3.7, -2.5, 3.2, 3.0, 100.5,'COVID resilience'),
(207,30,2022, 14.4,  5.1, 2.9,-2.4, 166.7,'Energy crisis inflation'),
-- NIGERIA
(208,31,1980, 10.0,  4.2, 5.5, 4.2,   8.5,'Oil boom peak'),
(209,31,1990,  7.4,  8.2, 4.5, 4.8,   4.5,'Oil boom era'),
(210,31,2000,  6.9,  5.0, 5.1,10.6,  10.1,'Obasanjo reforms'),
(211,31,2010, 13.7,  8.0, 5.0, 5.7,  32.9,'Oil wealth'),
(212,31,2016, 15.7, -1.6,12.8,-0.6,  25.8,'Oil shock naira devaluation'),
(213,31,2020, 13.2, -1.8,23.1,-4.0,  36.5,'COVID oil crash FX crisis'),
(214,31,2023, 24.7,  2.9,14.2,-3.8,  33.2,'Naira float devaluation'),
-- EGYPT
(215,32,1980, 20.8, 10.1, 5.0,-4.2,   2.2,'Sadat era'),
(216,32,1990, 16.8,  5.7, 8.6,-4.5,   4.3,'Gulf War impact'),
(217,32,2000,  2.7,  5.4, 9.0,-1.8,  13.1,'Reform era'),
(218,32,2010, 11.7,  5.1, 9.0,-2.0,  35.2,'Pre Arab Spring'),
(219,32,2016, 13.8,  4.3,12.5,-6.0,  23.3,'IMF program pound floated'),
(220,32,2020,  5.7,  3.6, 9.9,-3.6,  40.1,'COVID resilience'),
(221,32,2023, 33.9,  3.8, 7.3,-1.5,  34.9,'Currency crisis'),
-- SOUTH AFRICA
(222,33,1980, 13.8,  6.6, 9.9,-3.9,   6.4,'Apartheid era'),
(223,33,1990, 14.4, -0.3,15.1,-1.0,   3.4,'Sanctions impact'),
(224,33,2000,  5.3,  4.2,26.7,-0.1,   7.3,'Post apartheid growth'),
(225,33,2010,  4.3,  3.0,24.7,-2.0,  43.8,'World Cup year'),
(226,33,2020,  3.3, -6.4,29.2,-2.0,  55.1,'COVID load shedding'),
(227,33,2023,  5.9,  0.6,32.9,-1.6,  62.4,'Load shedding crisis'),
-- KENYA
(228,34,1980, 13.8,  4.9, 9.0,-5.3,   0.5,'Oil shock'),
(229,34,1990, 17.8,  4.2, 9.5,-6.0,   0.4,'Structural adjustment'),
(230,34,2000,  6.2,  0.6,14.0,-2.5,   1.1,'Drought political crisis'),
(231,34,2010,  4.3,  8.4,12.7,-6.0,   4.3,'Mobile money boom'),
(232,34,2020,  5.3,  0.3,10.4,-4.8,   7.3,'COVID'),
(233,34,2023,  7.7,  5.0,12.0,-4.4,   7.5,'Debt distress'),
-- ETHIOPIA
(234,35,1990,  5.2,  2.0,15.0,-5.0,   0.2,'Mengistu era ends'),
(235,35,2000,  6.2,  6.4,10.0,-4.0,   0.5,'Meles reforms'),
(236,35,2010,  8.1, 12.6, 5.0,-4.5,   2.1,'Strong growth'),
(237,35,2020, 20.6,  6.1, 3.0,-4.0,   3.1,'COVID Tigray conflict'),
(238,35,2023, 33.8,  7.2, 3.5,-4.5,   1.5,'War inflation'),
-- GHANA
(239,36,1980, 50.1, -3.5,10.0,-4.0,   0.2,'Economic crisis'),
(240,36,1990, 37.2,  3.3,10.0,-3.0,   0.5,'PNDC reforms'),
(241,36,2000, 25.2,  3.7,10.0,-7.0,   0.4,'HIPC debt relief'),
(242,36,2010,  8.6,  7.9,10.0,-7.0,   4.7,'Oil discovery boom'),
(243,36,2020, 10.4,  0.5, 6.8,-3.0,   8.6,'COVID'),
(244,36,2022, 31.5,  3.2, 4.5,-10.0,  6.6,'Default IMF bailout'),
-- TANZANIA
(245,37,1990, 19.7,  3.9, 5.0,-9.0,   0.2,'Socialist economy'),
(246,37,2000,  5.9,  4.9, 5.0,-5.0,   0.9,'Liberalization'),
(247,37,2010,  7.2,  7.0, 4.5,-9.0,   3.8,'Natural gas discovery'),
(248,37,2020,  3.3,  4.8, 2.4,-3.0,   5.6,'COVID managed'),
(249,37,2023,  4.2,  5.1, 2.5,-4.2,   5.9,'Stable growth'),
-- ZIMBABWE
(250,38,2000, 55.2, -7.3,11.0,-3.2,   0.7,'Land reforms collapse'),
(251,38,2003,598.7,-10.4,22.0,-4.5,   0.1,'Hyperinflation accelerating'),
(252,38,2007,66212.3,-3.7,40.0,-5.0, 0.05,'Hyperinflation catastrophe'),
(253,38,2008,231150888.87,-17.7,80.0,-5.5,0.04,'Worst hyperinflation recorded'),
(254,38,2009,  6.2,  6.3,55.0,-3.1,   0.2,'USD adoption ends crisis'),
(255,38,2020,557.2, -8.3,35.0,-2.5,   0.5,'New currency collapse'),
-- SUDAN
(256,39,1990, 65.0,  2.0,20.0,-10.0,  0.1,'Sanctions era'),
(257,39,2000,  8.0,  8.0,18.0,-5.0,   0.3,'Oil boom begins'),
(258,39,2010, 13.0,  3.5,16.0,-4.0,   1.8,'Pre South Sudan split'),
(259,39,2020,163.3, -3.6,19.5,-15.0,  0.2,'Revolution COVID'),
(260,39,2023,256.2, -5.0,25.0,-20.0,  0.1,'Civil war collapse'),
-- ANGOLA
(261,40,1995,2672.2,-5.7,20.0,-10.0,  0.2,'Civil war hyperinflation'),
(262,40,2000,325.0,  3.0,18.0,12.0,   1.0,'Oil boom begins'),
(263,40,2010, 14.5,  3.4,26.0, 9.0,  19.5,'Oil peak'),
(264,40,2016, 30.7,  0.0,28.0,-2.0,  23.7,'Oil crash'),
(265,40,2020, 22.3, -5.4,33.0,-2.1,  14.5,'COVID oil crash'),
(266,40,2023, 13.6,  1.0,30.0, 3.5,  14.1,'Recovery'),
-- USA
(267,41,1970,  5.7,  0.2, 5.0,-0.3, 145.0,'Nixon shock approaching'),
(268,41,1975,  9.1, -0.2, 8.5,-0.8, 160.0,'Stagflation era'),
(269,41,1980, 13.5, -0.3, 7.1, 0.1, 175.0,'Volcker shock rate hike'),
(270,41,1990,  5.4,  1.9, 5.6,-1.5, 185.0,'Gulf War S&L crisis'),
(271,41,2000,  3.4,  4.1, 4.0,-4.2, 190.0,'Dot com peak'),
(272,41,2008,  3.8, -0.3, 5.8,-4.9, 200.0,'GFC Lehman collapse'),
(273,41,2010,  1.6,  2.6, 9.6,-3.2, 210.0,'QE era slow recovery'),
(274,41,2020,  1.2, -3.5, 8.1,-3.1, 240.0,'COVID massive stimulus'),
(275,41,2022,  8.0,  2.1, 3.7,-3.8, 245.0,'40 year inflation high'),
(276,41,2024,  2.9,  2.5, 4.0,-3.5, 250.0,'Soft landing achieved'),
-- CANADA
(277,42,1980, 10.1,  2.2, 7.5,-1.7,  10.0,'Oil shock'),
(278,42,1990,  4.8, -0.2, 8.1,-3.7,  15.0,'Recession'),
(279,42,2000,  2.7,  5.2, 6.8, 2.6,  30.0,'Commodity boom'),
(280,42,2010,  1.8,  3.1, 8.0,-3.2,  57.0,'Post GFC recovery'),
(281,42,2020,  0.7, -5.3, 9.5,-1.9,  86.5,'COVID stimulus'),
(282,42,2022,  6.8,  3.4, 5.3, 0.1,  88.0,'Inflation surge'),
-- JAPAN
(283,43,1980,  7.8,  2.8, 2.0,-1.0,  30.0,'Oil shock impact'),
(284,43,1990,  3.1,  5.6, 2.1, 1.2,  78.5,'Bubble economy peak'),
(285,43,1992,  1.7,  0.8, 2.2, 3.1,  71.5,'Bubble bursts lost decade'),
(286,43,2000, -0.7,  2.8, 4.7, 2.5, 354.9,'Deflationary trap'),
(287,43,2008,  1.4, -1.2, 4.0, 3.2, 996.5,'GFC yen safe haven'),
(288,43,2020,  0.0, -4.3, 2.8, 3.3,1368.0,'COVID massive stimulus'),
(289,43,2022,  2.5,  1.0, 2.6, 1.8,1228.0,'Yen hits 32 year low'),
-- CHINA
(290,44,1980,  6.0,  7.8, 4.0, 0.5,   2.5,'Post Cultural Revolution'),
(291,44,1990,  3.1,  3.8, 2.5, 3.1,  11.1,'Tiananmen sanctions'),
(292,44,2000,  0.4,  8.5, 3.1, 1.7, 165.6,'WTO entry export engine'),
(293,44,2008,  5.9,  9.6, 4.0, 9.2,1946.0,'GFC stimulus package'),
(294,44,2015,  1.4,  6.9, 4.1, 2.8,3330.0,'Stock market crash'),
(295,44,2020,  2.5,  2.3, 5.6, 1.9,3217.0,'Only major economy grew'),
(296,44,2023,  0.2,  5.2, 5.2,-0.6,3238.0,'Deflation risk property crisis'),
-- SOUTH KOREA
(297,45,1980, 28.7, -1.5, 5.2,-8.5,   3.0,'Oil shock'),
(298,45,1990,  8.6,  9.2, 2.4,-0.9,  14.8,'Tiger economy peak'),
(299,45,1995,  4.5,  9.2, 2.1,-1.8,  32.7,'Tiger economy boom'),
(300,45,1997,  4.4,  5.9, 2.6,-1.6,  20.4,'Asian crisis hits'),
(301,45,1998,  7.5, -5.5, 7.0, 4.0,  52.0,'Painful restructuring'),
(302,45,2000,  2.3,  8.8, 4.4, 2.4,  96.2,'Post crisis recovery'),
(303,45,2008,  4.7,  2.3, 3.2, 0.3, 201.2,'GFC won depreciates'),
(304,45,2020,  0.5, -0.9, 3.9, 4.6, 443.1,'COVID containment'),
(305,45,2022,  5.1,  2.6, 2.9, 1.8, 423.2,'Inflation won weakness'),
-- SAUDI ARABIA
(306,46,1980,  1.7, 12.5, 4.0,36.0,  25.0,'Oil boom peak'),
(307,46,1990,  2.1,  9.0, 4.5,17.0,  10.0,'Gulf War'),
(308,46,2000, -1.1,  4.9, 4.6, 7.6,  18.0,'Oil price recovery'),
(309,46,2010,  5.3,  7.4, 3.5,14.8,  44.9,'Arab Spring oil premium'),
(310,46,2016,  3.5, -0.7, 5.6,-14.0,536.0,'Oil crash fiscal stress'),
(311,46,2020,  3.4, -4.1, 7.4,-11.0,453.8,'COVID oil crash'),
(312,46,2023,  2.3,  0.8, 3.5, 3.5, 457.4,'Vision 2030'),
-- IRAN
(313,47,1980, 23.5,-14.1,14.0,-4.0,   3.0,'Revolution Iraq war'),
(314,47,1990, 17.0, 12.0,11.0,-1.0,   5.0,'Post war reconstruction'),
(315,47,2000, 12.6,  5.1,14.0, 7.0,   8.0,'Khatami reforms'),
(316,47,2010, 10.1,  5.9,13.5, 6.0,  20.0,'Sanctions begin'),
(317,47,2018, 31.2, -4.8,12.1,-4.0,   7.0,'US maximum pressure'),
(318,47,2020, 36.4,  3.4,11.0,-2.0,   4.0,'COVID sanctions'),
(319,47,2023, 44.6,  4.7,10.5,-1.5,   5.0,'Continued sanctions'),
-- ISRAEL
(320,48,1980,133.0,  3.4, 3.5,-5.6,   2.0,'Hyperinflation period'),
(321,48,1985,304.6,  4.4, 6.7,-2.0,   3.0,'Stabilization plan'),
(322,48,1990, 17.6,  6.4, 9.6,-2.5,   6.0,'Mass immigration surge'),
(323,48,2000,  1.1,  9.4, 8.8,-1.3,  23.0,'Tech boom'),
(324,48,2010,  2.7,  5.7, 6.7, 2.5,  70.9,'Strong growth'),
(325,48,2020, -0.6, -1.9, 4.3, 4.9, 177.9,'COVID managed well'),
(326,48,2023,  4.2,  2.0, 3.5, 3.1, 204.7,'Gaza war impact'),
-- UAE
(327,49,1980,  8.5, 12.0, 2.0,20.0,   5.0,'Oil boom'),
(328,49,1990,  0.9, 15.0, 1.5,10.0,   8.0,'Gulf War'),
(329,49,2000,  1.3, 12.4, 2.3,13.0,  15.0,'Diversification'),
(330,49,2010,  0.9,  1.6, 2.8, 3.2,  39.9,'Post GFC recovery'),
(331,49,2020, -2.1, -6.1, 2.5, 6.3,  90.0,'COVID oil crash'),
(332,49,2023,  4.8,  3.4, 2.2, 9.5,  98.0,'Expo 2020 legacy'),
-- LEBANON
(333,50,2000,  0.0,  1.0,11.0,-16.4, 15.0,'Reconstruction era'),
(334,50,2010,  4.5,  8.0,11.0,-25.0, 45.0,'Growth before crisis'),
(335,50,2018,  4.6, -1.9,11.4,-24.9, 31.9,'Banking crisis looming'),
(336,50,2019,  2.9, -6.9,11.4,-27.7, 29.6,'Protests default imminent'),
(337,50,2020, 84.9,-21.4,35.8,-22.3, 19.8,'Worst crisis Beirut explosion'),
(338,50,2021,154.8,-10.5,40.0,-20.5, 14.2,'Currency lost 90% value'),
(339,50,2023,221.3, -0.5,48.0,-15.0, 10.5,'Ongoing collapse');
 
 
 SELECT * FROM economic_indicators;
 
 
 
-- ============================================================
--  TABLE 3: currency_data
-- ============================================================
CREATE TABLE currency_data (
    currency_id          INT PRIMARY KEY,
    country_id           INT          NOT NULL,
    year                 INT          NOT NULL,
    exchange_rate_usd    DECIMAL(15,4),
    yoy_devaluation_pct  DECIMAL(8,2),
    black_market_premium DECIMAL(8,2),
    currency_regime      VARCHAR(50),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);
 
INSERT INTO currency_data VALUES
-- INDIA
(1,  1,1980,   7.86,  4.8, NULL,'Managed Float'),
(2,  1,1991,  22.74, 25.6,  8.5,'Managed Float'),
(3,  1,2000,  44.94,  3.2, NULL,'Managed Float'),
(4,  1,2013,  58.60, 10.6, NULL,'Managed Float'),
(5,  1,2020,  74.10,  2.5, NULL,'Managed Float'),
(6,  1,2022,  82.72, 11.6, NULL,'Managed Float'),
(7,  1,2025,  84.20,  1.8, NULL,'Managed Float'),
-- PAKISTAN
(8,  2,1980,   9.90,  5.0, NULL,'Managed Float'),
(9,  2,2000,  53.65,  3.5, NULL,'Managed Float'),
(10, 2,2018, 109.84, 30.0, 15.0,'Managed Float'),
(11, 2,2023, 285.00, 40.0, 20.0,'Free Float'),
-- SRI LANKA
(12, 3,2019, 178.80,  2.0, NULL,'Managed Float'),
(13, 3,2021, 200.50,  7.5, NULL,'Managed Float'),
(14, 3,2022, 363.00, 81.0, 25.0,'Crisis Float'),
(15, 3,2023, 323.00,-11.0, 10.0,'Post IMF Managed'),
-- ARGENTINA
(16,11,1989, 650.00,195.0, 45.0,'Crawling Peg'),
(17,11,2001,   1.00,  0.0, 12.5,'Currency Board'),
(18,11,2002,   3.32,230.0, 15.0,'Free Float post default'),
(19,11,2018,  38.10, 51.0, 18.0,'Managed Float'),
(20,11,2022, 175.00, 55.0, 85.0,'Multiple exchange rates'),
(21,11,2024, 900.00,106.0, 20.0,'Milei unification attempt'),
-- VENEZUELA
(22,12,2013,   6.29,  4.5, 55.0,'Fixed official'),
(23,12,2016,  10.00, 37.2,350.0,'Multiple rates black market surges'),
(24,12,2018,248000.0,99999.0,400.0,'Sovereign Bolivar introduced'),
-- TURKEY
(25,27,1994, 38900.0, 89.5, NULL,'Free Float'),
(26,27,2001,1650000.0,96.5,NULL,'Free Float'),
(27,27,2018,   5.30, 39.4, NULL,'Managed Float'),
(28,27,2022,  18.60, 44.2, NULL,'Managed Float'),
(29,27,2024,  32.50, 74.7, NULL,'Managed Float'),
-- ZIMBABWE
(30,38,2007, 30000.0,500.0,600.0,'Fixed official meaningless'),
(31,38,2008,2200000000.0,99999.0,800.0,'Hyperinflation currency abandoned'),
(32,38,2009,   1.00,  0.0, NULL,'USD adopted ZWD demonetized'),
-- LEBANON
(33,50,2019,1508.00,  0.0, 15.0,'Peg to USD'),
(34,50,2021,15000.0,894.4,300.0,'Currency collapse'),
(35,50,2023,90000.0,500.0,200.0,'Dollarization accelerating'),
-- RUSSIA
(36,28,1992, 415.00,999.0, NULL,'Free Float'),
(37,28,1998,   6.30, 75.0, NULL,'Managed Float'),
(38,28,2014,  38.60, 72.0, NULL,'Free Float'),
(39,28,2022,  70.00, 25.0, NULL,'Managed Float'),
-- UKRAINE
(40,29,2014,  11.90, 97.0, NULL,'Managed Float'),
(41,29,2022,  36.60,207.0, NULL,'Fixed wartime rate'),
-- USA
(42,41,1980,   1.00,  0.0, NULL,'Free Float base currency'),
(43,41,2020,   1.00,  0.0, NULL,'Free Float base currency'),
-- CHINA
(44,44,2000,   8.28, -0.4, NULL,'Managed Peg to USD'),
(45,44,2015,   6.49,  3.1, NULL,'Managed Float'),
(46,44,2022,   6.73,  0.8, NULL,'Managed Float'),
-- BRAZIL
(47,13,1990,   1.00,  0.0, NULL,'Multiple plans Cruzeiro'),
(48,13,1995,   0.92, -5.0, NULL,'Real Plan crawling peg'),
(49,13,2002,   2.92, 52.0, NULL,'Managed Float'),
(50,13,2020,   5.40, 28.0, NULL,'Free Float'),
-- MEXICO
(51,14,1994,   3.40,  5.0,  2.0,'Managed Peg'),
(52,14,1995,   6.50, 91.2,  5.0,'Crisis Float'),
(53,14,2000,   9.46,  4.5, NULL,'Free Float'),
(54,14,2020,  21.50, 15.0, NULL,'Free Float'),
-- INDONESIA
(55, 6,1997,   2909.0, 5.0, NULL,'Managed Float'),
(56, 6,1998,  10014.0,244.0,NULL,'Crisis Float'),
(57, 6,2000,   8421.0,-15.9,NULL,'Managed Float'),
(58, 6,2020,  14582.0, 5.0, NULL,'Managed Float'),
-- NIGERIA
(59,31,2016, 253.00, 37.0, 40.0,'Managed Float'),
(60,31,2020, 381.00, 10.0, 20.0,'Managed Float'),
(61,31,2023,1500.00,294.0, 15.0,'Free Float'),
-- EGYPT
(62,32,2016,  13.00, 55.0, 20.0,'Free Float after devaluation'),
(63,32,2023,  30.90, 75.0, 15.0,'Managed Float'),
-- SOUTH KOREA
(64,45,1997,   951.0, 10.0,NULL,'Managed Float'),
(65,45,1998,  1401.0, 47.3,NULL,'Free Float crisis'),
(66,45,2022,  1291.0, 11.0,NULL,'Managed Float'),
-- GHANA
(67,36,2022,  10.32, 55.0, 10.0,'Managed Float'),
(68,36,2023,  11.20,  8.5, NULL,'Managed Float'),
-- IRAN
(69,47,2018, 42000.0,400.0,300.0,'Multiple official rates'),
(70,47,2023,420000.0,900.0,200.0,'Black market dominant'),
-- POLAND
(71,30,1990, 9500.0, 500.0, NULL,'Crawling Peg'),
(72,30,2000,   4.30,  5.0, NULL,'Managed Float'),
(73,30,2022,   4.70, 15.0, NULL,'Managed Float'),
-- SAUDI ARABIA
(74,46,1980,   3.33,  0.0, NULL,'Fixed Peg to USD'),
(75,46,2023,   3.75,  0.0, NULL,'Fixed Peg to USD'),
-- UAE
(76,49,1980,   3.67,  0.0, NULL,'Fixed Peg to USD'),
(77,49,2023,   3.67,  0.0, NULL,'Fixed Peg to USD'),
-- JAPAN
(78,43,1985, 200.50, 10.0, NULL,'Managed Float'),
(79,43,1995,  94.06,-30.0, NULL,'Managed Float'),
(80,43,2022, 131.50, 15.0, NULL,'Managed Float'),
-- GREECE (pre Euro)
(81,26,1995, 231.00,  5.0, NULL,'Managed Float pre Euro'),
(82,26,2001,   0.34,  0.0, NULL,'Euro adopted'),
-- UK
(83,23,1992,   0.57, 15.0, NULL,'ERM exit Black Wednesday'),
(84,23,2016,   0.74, 15.0, NULL,'Brexit vote pound falls'),
(85,23,2022,   0.83,  8.0, NULL,'Managed Float'),
-- UKRAINE cont
(86,29,1993,12610.0,999.0, NULL,'Karbovanets hyperinflation'),
-- ANGOLA
(87,40,1995,  14.08,999.0,200.0,'Multiple rates civil war'),
(88,40,2000,  10.00, 50.0, 30.0,'Post dollarization'),
(89,40,2020, 658.00, 30.0, NULL,'Managed Float'),
-- BOLIVIA
(90,19,1985,1500000.0,99999.0,NULL,'Hyperinflation'),
(91,19,2000,   6.18,  2.0, NULL,'Crawling Peg'),
(92,19,2020,   6.91,  1.2, NULL,'Managed Peg'),
-- PERU
(93,17,1990,1200.00,999.0, NULL,'Hyperinflation'),
(94,17,2000,   3.49,  2.0, NULL,'Free Float'),
(95,17,2020,   3.62,  2.5, NULL,'Managed Float'),
-- TURKEY cont
(96,27,1980,  76.00, 20.0, NULL,'Managed Float'),
(97,27,1990, 2608.0, 60.0, NULL,'Managed Float'),
-- RUSSIA cont
(98,28,2000,  28.13, 10.0, NULL,'Managed Float'),
(99,28,2022,  68.50, 25.0, NULL,'Capital controls managed');
 
 SELECT * FROM currency_data;
 
 
-- ============================================================
--  TABLE 4: crisis_events
-- ============================================================
CREATE TABLE crisis_events (
    crisis_id         INT PRIMARY KEY,
    country_id        INT          NOT NULL,
    crisis_name       VARCHAR(200) NOT NULL,
    start_year        INT          NOT NULL,
    end_year          INT,
    crisis_type       VARCHAR(50),
    severity_score    INT,
    imf_involved      BOOLEAN,
    default_occurred  BOOLEAN,
    notes             VARCHAR(500),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);
 
INSERT INTO crisis_events VALUES
(1,  1, 'India BOP Crisis',                  1991,1991,'BOP',           7, TRUE, FALSE,'Forex reserves below 2 weeks imports. IMF 1.8bn bailout. Liberalization follows.'),
(2,  1, 'India Taper Tantrum',               2013,2013,'Currency',      4, FALSE,FALSE,'Rupee fell 20% vs USD. RBI intervention stabilized.'),
(3,  2, 'Pakistan BOP Crisis',               2019,2019,'BOP',           6, TRUE, FALSE,'IMF 6bn bailout. Rupee devalued 30%. Severe austerity.'),
(4,  2, 'Pakistan Economic Crisis',          2023,2024,'Currency',      7, TRUE, FALSE,'Rupee lost 50%. Inflation 29%. IMF emergency support.'),
(5,  3, 'Sri Lanka Economic Crisis',         2022,2023,'BOP',           9, TRUE, TRUE, 'First default in history. Reserves near zero. Mass protests toppled president.'),
(6,  6, 'Indonesian Asian Crisis',           1997,1998,'Currency',      9, TRUE, FALSE,'Rupiah fell 80%. Suharto regime fell. IMF 43bn.'),
(7,  7, 'Thai Baht Crisis',                  1997,1998,'Currency',      8, TRUE, FALSE,'Baht devalued triggered Asian contagion. IMF 17bn.'),
(8,  8, 'Malaysian Asian Crisis',            1997,1998,'Banking',       7, FALSE,FALSE,'Ringgit fell. Mahathir imposed capital controls. Avoided IMF.'),
(9,  11,'Argentine Hyperinflation',          1989,1990,'Hyperinflation',9, TRUE, FALSE,'Inflation peaked 3000%. Austral replaced by Peso 1:10000.'),
(10, 11,'Argentine Tequila Effect',          1995,1995,'Banking',       5, TRUE, FALSE,'Spillover from Mexico crisis. Peso dollar peg held but banking stress severe.'),
(11, 11,'Argentine Great Default',           2001,2002,'Debt',          10,TRUE, TRUE, 'Largest sovereign default 100bn. Peso devalued 300%.'),
(12, 11,'Argentine Peso Crisis',             2018,2019,'Currency',      7, TRUE, FALSE,'Peso lost 50%. IMF 57bn bailout largest ever at the time.'),
(13, 11,'Argentine Hyperinflation 2nd Wave', 2023,2024,'Hyperinflation',9, TRUE, FALSE,'Inflation over 200%. Milei elected on radical shock therapy platform.'),
(14, 12,'Venezuela Economic Collapse',       2014,2024,'Hyperinflation',10,FALSE,TRUE, 'GDP fell 80%. Hyperinflation peaked 65000% in 2018. Worst peacetime collapse.'),
(15, 13,'Brazil Hyperinflation',             1989,1994,'Hyperinflation',8, FALSE,FALSE,'Inflation hit 2947% in 1990. Multiple currency plans failed. Real Plan succeeded 1994.'),
(16, 14,'Mexican Tequila Crisis',            1994,1995,'Currency',      7, TRUE, FALSE,'Peso devalued 50%. US 50bn rescue package. Contagion across Latin America.'),
(17, 17,'Peru Hyperinflation',               1988,1990,'Hyperinflation',8, TRUE, FALSE,'Inflation hit 7482% under Garcia. Fujimori shock therapy stabilized.'),
(18, 19,'Bolivia Hyperinflation',            1984,1985,'Hyperinflation',8, TRUE, FALSE,'Inflation hit 11750%. Worst in South American history until Venezuela.'),
(19, 20,'Uruguay Banking Crisis',            2002,2002,'Banking',       7, TRUE, TRUE, 'Argentine crisis spillover. Bank deposits frozen. IMF 1.5bn.'),
(20, 26,'Greek Debt Crisis',                 2010,2018,'Debt',          8, TRUE, TRUE, 'Largest IMF program. Three bailouts totaling 289bn Euro. Severe austerity.'),
(21, 27,'Turkish Banking Crisis',            2001,2001,'Banking',       7, TRUE, FALSE,'Two large banks collapsed. IMF bailout. Lira lost 50%.'),
(22, 27,'Turkish Lira Crisis',               2018,2018,'Currency',      6, FALSE,FALSE,'Lira fell 40%. Unconventional monetary policy blamed.'),
(23, 27,'Turkish Inflation Spiral',          2021,2023,'Currency',      7, FALSE,FALSE,'Inflation hit 80%. Rate cuts triggered massive lira collapse.'),
(24, 28,'Russian Ruble Crisis',              1998,1998,'Debt',          8, FALSE,TRUE, 'Russia defaulted on domestic debt. Ruble lost 75%. IMF 11bn.'),
(25, 29,'Ukraine Hryvnia Crisis',            2014,2015,'Currency',      7, TRUE, FALSE,'Hryvnia lost 70%. War in Donbas. IMF 17bn.'),
(26, 29,'Ukraine War Economic Crisis',       2022,2024,'Banking',       9, TRUE, FALSE,'Russian invasion. GDP fell 30%. Massive Western support.'),
(27, 30,'Polish Shock Therapy',              1990,1992,'Currency',      6, TRUE, FALSE,'Inflation 586% in 1990. Balcerowicz Plan rapid stabilization.'),
(28, 31,'Nigerian Naira Crisis',             2023,2024,'Currency',      6, FALSE,FALSE,'CBN floated naira. Lost 70% value. Inflation surged to 30%.'),
(29, 32,'Egyptian Pound Crisis',             2016,2016,'Currency',      6, TRUE, FALSE,'Pound floated lost 50%. IMF 12bn. Fuel subsidy cuts.'),
(30, 32,'Egyptian Currency Crisis 2',        2023,2023,'Currency',      6, TRUE, FALSE,'Another devaluation. Inflation hit 33%. IMF program expanded.'),
(31, 35,'Ethiopian Economic Crisis',         2020,2023,'Banking',       6, FALSE,FALSE,'Tigray war collapsed economy. Inflation 34%. Debt restructuring needed.'),
(32, 36,'Ghana Debt Crisis',                 2022,2023,'Debt',          7, TRUE, TRUE, 'Ghana defaulted on external debt. IMF 3bn. Domestic debt restructured.'),
(33, 38,'Zimbabwe Hyperinflation',           2007,2009,'Hyperinflation',10,FALSE,TRUE, 'Inflation reached 89.7 sextillion percent Nov 2008. Currency abandoned.'),
(34, 39,'Sudan Economic Collapse',           2020,2024,'Banking',       8, FALSE,FALSE,'Revolution plus COVID plus civil war. Inflation 256%. Economy destroyed.'),
(35, 40,'Angola Civil War Hyperinflation',   1993,2002,'Hyperinflation',8, FALSE,FALSE,'Civil war destroyed economy. Inflation 2672% in 1995.'),
(36, 41,'USA Great Financial Crisis',        2008,2009,'Banking',       9, FALSE,FALSE,'Lehman collapse. 700bn TARP bailout. Global contagion.'),
(37, 43,'Japan Lost Decade',                 1991,2003,'Banking',       7, FALSE,FALSE,'Asset bubble burst. Deflation trap. GDP stagnation for decade.'),
(38, 44,'Chinese Stock Market Crash',        2015,2015,'Banking',       5, FALSE,FALSE,'Shanghai Composite lost 40%. Capital outflows. Yuan devalued.'),
(39, 45,'South Korean Asian Crisis',         1997,1998,'Banking',       8, TRUE, FALSE,'Won collapsed 50%. IMF 58bn. Massive corporate restructuring chaebols.'),
(40, 47,'Iran Sanctions Economic Crisis',    2018,2023,'Currency',      7, FALSE,FALSE,'US maximum pressure. Rial lost 90%. Inflation 44%. Severe shortages.'),
(41, 48,'Israel Hyperinflation',             1984,1985,'Hyperinflation',7, FALSE,FALSE,'Inflation hit 450%. Emergency stabilization plan worked rapidly.'),
(42, 50,'Lebanese Financial Collapse',       2019,2024,'Banking',       10,FALSE,TRUE, 'Banks froze deposits. Currency lost 98%. Beirut explosion worsened collapse.');
 
 
 SELECT * FROM crisis_events;
 
-- ============================================================
--  TABLE 5: gicci_scores
-- ============================================================
CREATE TABLE gicci_scores (
    score_id          INT PRIMARY KEY,
    country_id        INT          NOT NULL,
    year              INT          NOT NULL,
    inflation_score   DECIMAL(5,2),
    currency_score    DECIMAL(5,2),
    debt_score        DECIMAL(5,2),
    growth_score      DECIMAL(5,2),
    gicci_total       DECIMAL(5,2),
    risk_category     VARCHAR(20),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);
 
INSERT INTO gicci_scores VALUES
-- INDIA
(1,  1,1991, 20.0,18.0,12.0,20.0, 70.0,'Crisis'),
(2,  1,2000,  3.0, 2.0, 5.0, 3.0, 13.0,'Stable'),
(3,  1,2013, 15.0,12.0,12.0, 0.0, 39.0,'Watch'),
(4,  1,2020,  8.0, 2.0, 0.0,25.0, 35.0,'Watch'),
(5,  1,2025,  3.0, 0.0, 5.0, 0.0,  8.0,'Stable'),
-- PAKISTAN
(6,  2,2023, 22.0,18.0,15.0, 8.0, 63.0,'Crisis'),
-- SRI LANKA
(7,  3,2022, 20.0,22.0,12.0,25.0, 79.0,'Collapse'),
(8,  3,2023, 18.0,10.0,12.0, 8.0, 48.0,'Stress'),
-- ARGENTINA
(9,  11,1989, 25.0,25.0,15.0,25.0, 90.0,'Collapse'),
(10, 11,2001,  0.0, 5.0,12.0,20.0, 37.0,'Watch'),
(11, 11,2002, 20.0,25.0,25.0,25.0, 95.0,'Collapse'),
(12, 11,2018, 20.0,18.0,12.0, 8.0, 58.0,'Crisis'),
(13, 11,2024, 25.0,22.0,15.0,20.0, 82.0,'Collapse'),
-- VENEZUELA
(14, 12,2016, 25.0,25.0,20.0,25.0, 95.0,'Collapse'),
(15, 12,2018, 25.0,25.0,25.0,25.0,100.0,'Collapse'),
(16, 12,2022, 22.0,22.0,20.0, 0.0, 64.0,'Crisis'),
-- BRAZIL
(17, 13,1990, 25.0,20.0,15.0,20.0, 80.0,'Collapse'),
(18, 13,2020,  3.0, 5.0, 5.0,20.0, 33.0,'Watch'),
-- MEXICO
(19, 14,1995, 20.0,22.0,12.0,25.0, 79.0,'Collapse'),
(20, 14,2020,  3.0, 5.0, 0.0,25.0, 33.0,'Watch'),
-- CHILE
(21, 15,2020,  3.0, 3.0, 0.0,20.0, 26.0,'Watch'),
-- COLOMBIA
(22, 16,2020,  0.0, 3.0, 5.0,22.0, 30.0,'Watch'),
-- PERU
(23, 17,1990, 25.0,25.0,20.0,25.0, 95.0,'Collapse'),
(24, 17,2020,  0.0, 3.0, 0.0,25.0, 28.0,'Watch'),
-- BOLIVIA
(25, 19,1985, 25.0,25.0,20.0,25.0, 95.0,'Collapse'),
(26, 19,2020,  0.0, 0.0, 5.0,25.0, 30.0,'Watch'),
-- GERMANY
(27, 21,2022,  8.0, 0.0, 0.0, 0.0,  8.0,'Stable'),
-- FRANCE
(28, 22,2020,  0.0, 0.0, 5.0,20.0, 25.0,'Watch'),
-- UK
(29, 23,2022,  8.0, 5.0, 5.0, 0.0, 18.0,'Watch'),
-- GREECE
(30, 26,2012,  3.0, 0.0,25.0,25.0, 53.0,'Crisis'),
(31, 26,2015,  0.0, 0.0,22.0,15.0, 37.0,'Watch'),
-- TURKEY
(32, 27,2001, 20.0,25.0,15.0,25.0, 85.0,'Collapse'),
(33, 27,2022, 22.0,22.0,12.0, 0.0, 56.0,'Crisis'),
-- RUSSIA
(34, 28,1992, 25.0,25.0,18.0,25.0, 93.0,'Collapse'),
(35, 28,1998, 18.0,22.0,25.0,20.0, 85.0,'Collapse'),
(36, 28,2022, 15.0,12.0, 0.0, 8.0, 35.0,'Watch'),
-- UKRAINE
(37, 29,1993, 25.0,25.0,18.0,25.0, 93.0,'Collapse'),
(38, 29,2022, 18.0,22.0,15.0,25.0, 80.0,'Collapse'),
-- NIGERIA
(39, 31,2023, 15.0,22.0,12.0, 0.0, 49.0,'Stress'),
-- EGYPT
(40, 32,2023, 20.0,18.0,12.0, 0.0, 50.0,'Stress'),
-- SOUTH AFRICA
(41, 33,2020,  3.0, 5.0, 5.0,20.0, 33.0,'Watch'),
-- KENYA
(42, 34,2023,  8.0, 8.0,12.0, 0.0, 28.0,'Watch'),
-- ETHIOPIA
(43, 35,2023, 20.0,15.0,12.0, 0.0, 47.0,'Stress'),
-- GHANA
(44, 36,2022, 20.0,18.0,25.0,  0.0,63.0,'Crisis'),
-- ZIMBABWE
(45, 38,2008, 25.0,25.0,25.0,25.0,100.0,'Collapse'),
(46, 38,2020, 22.0,22.0,20.0,25.0, 89.0,'Collapse'),
-- SUDAN
(47, 39,2023, 25.0,22.0,20.0,20.0, 87.0,'Collapse'),
-- ANGOLA
(48, 40,1995, 25.0,25.0,20.0,25.0, 95.0,'Collapse'),
(49, 40,2020, 18.0,12.0,10.0,20.0, 60.0,'Crisis'),
-- USA
(50, 41,2008,  3.0, 0.0, 5.0,15.0, 23.0,'Watch'),
(51, 41,2022,  8.0, 0.0, 5.0, 0.0, 13.0,'Stable'),
-- JAPAN
(52, 43,2000,  0.0, 0.0, 0.0, 3.0,  3.0,'Stable'),
-- CHINA
(53, 44,2020,  3.0, 0.0, 0.0, 0.0,  3.0,'Stable'),
-- SOUTH KOREA
(54, 45,1998,  8.0,22.0,12.0,25.0, 67.0,'Crisis'),
(55, 45,2020,  0.0, 0.0, 0.0, 3.0,  3.0,'Stable'),
-- SAUDI ARABIA
(56, 46,2020,  3.0, 0.0, 5.0,20.0, 28.0,'Watch'),
-- IRAN
(57, 47,2020, 20.0,22.0,15.0, 0.0, 57.0,'Crisis'),
-- ISRAEL
(58, 48,1985, 22.0,20.0,12.0, 0.0, 54.0,'Crisis'),
(59, 48,2020,  0.0, 0.0, 0.0, 3.0,  3.0,'Stable'),
-- LEBANON
(60, 50,2021, 25.0,25.0,25.0,25.0,100.0,'Collapse'),
(61, 50,2023, 25.0,25.0,25.0, 8.0, 83.0,'Collapse');
 
SELECT * FROM gicci_scores;





-- Query 1: Top 10 worst GICCI scores ever recorded
SELECT
    c.country_name,
    c.region,
    gs.year,
    gs.gicci_total,
    gs.risk_category,
    gs.inflation_score,
    gs.currency_score,
    gs.debt_score,
    gs.growth_score
FROM gicci_scores gs
JOIN countries c ON gs.country_id = c.country_id
ORDER BY gs.gicci_total DESC
LIMIT 10;


-- Query 2: Countries that recovered fastest after a "Crisis" or "Collapse"
-- (GICCI improvement from worst point to 5 years later)
WITH worst_scores AS (
    SELECT
        country_id,
        MAX(gicci_total) AS worst_gicci
    FROM gicci_scores
    GROUP BY country_id
)

SELECT
    c.country_name,
    gs.year AS worst_year,
    ws.worst_gicci

FROM worst_scores ws

JOIN gicci_scores gs
ON ws.country_id = gs.country_id
AND ws.worst_gicci = gs.gicci_total

JOIN countries c
ON c.country_id = ws.country_id

ORDER BY ws.worst_gicci DESC;


-- Query 3: Window function — running average GICCI per country over time
SELECT
    c.country_name,
    gs.year,
    gs.gicci_total,
    ROUND(AVG(gs.gicci_total) OVER (
        PARTITION BY gs.country_id
        ORDER BY gs.year
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) AS rolling_3yr_avg_gicci,
    ROUND(MAX(gs.gicci_total) OVER (
        PARTITION BY gs.country_id
        ORDER BY gs.year
    ), 2) AS all_time_worst_gicci,
    RANK() OVER (
        PARTITION BY gs.year
        ORDER BY gs.gicci_total DESC
    ) AS crisis_rank_that_year
FROM gicci_scores gs
JOIN countries c ON gs.country_id = c.country_id
ORDER BY c.country_name, gs.year;


-- Query 4: IMF involvement rate by region
SELECT
    c.region,
    COUNT(*)                                  AS total_crises,
    SUM(CASE WHEN ce.imf_involved THEN 1 ELSE 0 END) AS imf_bailouts,
    SUM(CASE WHEN ce.default_occurred THEN 1 ELSE 0 END) AS defaults,
    ROUND(
        100.0 * SUM(CASE WHEN ce.imf_involved THEN 1 ELSE 0 END) / COUNT(*), 1
    ) AS imf_involvement_pct,
    ROUND(AVG(ce.severity_score), 2)          AS avg_severity
FROM crisis_events ce
JOIN countries c ON ce.country_id = c.country_id
GROUP BY c.region
ORDER BY avg_severity DESC;


-- Query 5: Inflation vs GDP correlation by decade
SELECT
    c.region,
    (ei.year / 10 * 10)                       AS decade,
    ROUND(AVG(ei.inflation_rate), 2)           AS avg_inflation,
    ROUND(AVG(ei.gdp_growth_rate), 2)         AS avg_gdp_growth,
    ROUND(AVG(ei.unemployment_rate), 2)       AS avg_unemployment,
    COUNT(DISTINCT ei.country_id)             AS countries_in_sample
FROM economic_indicators ei
JOIN countries c ON ei.country_id = c.country_id
GROUP BY c.region, decade
ORDER BY decade, avg_inflation DESC;


-- Query 6: Currency collapse leaderboard — worst devaluations ever
SELECT
    c.country_name,
    c.region,
    cd.year,
    cd.exchange_rate_usd,
    cd.yoy_devaluation_pct,
    cd.black_market_premium,
    cd.currency_regime,
    RANK() OVER (ORDER BY cd.yoy_devaluation_pct DESC) AS devaluation_rank
FROM currency_data cd
JOIN countries c ON cd.country_id = c.country_id
WHERE cd.yoy_devaluation_pct IS NOT NULL
ORDER BY cd.yoy_devaluation_pct DESC;


-- Query 7: Countries currently (2023–2025) at Stress/Crisis/Collapse risk
SELECT
    c.country_name,
    c.region,
    gs.year,
    gs.gicci_total,
    gs.risk_category,
    ei.inflation_rate,
    ei.gdp_growth_rate,
    ce.crisis_name
FROM gicci_scores gs
JOIN countries c ON gs.country_id = c.country_id
JOIN economic_indicators ei
    ON ei.country_id = gs.country_id AND ei.year = gs.year
LEFT JOIN crisis_events ce
    ON ce.country_id = gs.country_id
    AND gs.year BETWEEN ce.start_year AND COALESCE(ce.end_year, 2025)
WHERE gs.year >= 2020
  AND gs.risk_category IN ('Stress', 'Crisis', 'Collapse')
ORDER BY gs.gicci_total DESC;


-- ============================================================
--  GICCI — Analytical Queries
--  Concepts: JOIN, GROUP BY, HAVING, CTE, Window Functions,
--            CASE WHEN, Subqueries, UNION, EXISTS, RANK
--  Author : Santosh Gutte | VIT Mumbai
-- ============================================================

USE gicci_db;


-- ============================================================
--  SECTION 1: BASIC QUERIES (SELECT, WHERE, ORDER BY)
-- ============================================================

-- Query 1: All countries with their region and currency
SELECT country_name, region, currency_name, currency_code
FROM countries
ORDER BY region, country_name;

-- Query 2: Countries with inflation above 50%
SELECT c.country_name, c.region, ei.year, ei.inflation_rate
FROM economic_indicators ei
JOIN countries c ON ei.country_id = c.country_id
WHERE ei.inflation_rate > 50
ORDER BY ei.inflation_rate DESC;

-- Query 3: All crisis events with severity 9 or 10
SELECT c.country_name, ce.crisis_name, ce.start_year,
       ce.crisis_type, ce.severity_score
FROM crisis_events ce
JOIN countries c ON ce.country_id = c.country_id
WHERE ce.severity_score >= 9
ORDER BY ce.severity_score DESC;

-- Query 4: Countries in Collapse category
SELECT c.country_name, c.region, gs.year, gs.gicci_total
FROM gicci_scores gs
JOIN countries c ON gs.country_id = c.country_id
WHERE gs.risk_category = 'Collapse'
ORDER BY gs.gicci_total DESC;


-- ============================================================
--  SECTION 2: AGGREGATE FUNCTIONS (COUNT, AVG, MAX, MIN, SUM)
-- ============================================================

-- Query 5: Average inflation by region
SELECT c.region,
       ROUND(AVG(ei.inflation_rate), 2) AS avg_inflation,
       ROUND(MAX(ei.inflation_rate), 2) AS max_inflation,
       ROUND(MIN(ei.inflation_rate), 2) AS min_inflation,
       COUNT(*)                          AS data_points
FROM economic_indicators ei
JOIN countries c ON ei.country_id = c.country_id
GROUP BY c.region
ORDER BY avg_inflation DESC;

-- Query 6: Total crisis events per region
SELECT c.region,
       COUNT(*)                                              AS total_crises,
       SUM(CASE WHEN ce.imf_involved = TRUE THEN 1 ELSE 0 END) AS imf_bailouts,
       SUM(CASE WHEN ce.default_occurred = TRUE THEN 1 ELSE 0 END) AS defaults,
       ROUND(AVG(ce.severity_score), 2)                     AS avg_severity
FROM crisis_events ce
JOIN countries c ON ce.country_id = c.country_id
GROUP BY c.region
ORDER BY avg_severity DESC;

-- Query 7: Count of countries per risk category
SELECT risk_category,
       COUNT(DISTINCT country_id) AS countries,
       COUNT(*)                   AS total_records,
       ROUND(AVG(gicci_total), 2) AS avg_gicci
FROM gicci_scores
GROUP BY risk_category
ORDER BY avg_gicci DESC;


-- ============================================================
--  SECTION 3: HAVING CLAUSE
-- ============================================================

-- Query 8: Regions with average inflation above 20%
SELECT c.region,
       ROUND(AVG(ei.inflation_rate), 2) AS avg_inflation,
       COUNT(DISTINCT ei.country_id)    AS countries
FROM economic_indicators ei
JOIN countries c ON ei.country_id = c.country_id
GROUP BY c.region
HAVING AVG(ei.inflation_rate) > 20
ORDER BY avg_inflation DESC;

-- Query 9: Countries with more than 2 crisis events
SELECT c.country_name, c.region,
       COUNT(*) AS total_crises,
       ROUND(AVG(ce.severity_score), 2) AS avg_severity
FROM crisis_events ce
JOIN countries c ON ce.country_id = c.country_id
GROUP BY ce.country_id, c.country_name, c.region
HAVING COUNT(*) > 2
ORDER BY total_crises DESC;

-- Query 10: Years with average GICCI above 50
SELECT gs.year,
       ROUND(AVG(gs.gicci_total), 2) AS avg_gicci,
       COUNT(DISTINCT gs.country_id) AS countries_in_crisis
FROM gicci_scores gs
GROUP BY gs.year
HAVING AVG(gs.gicci_total) > 50
ORDER BY avg_gicci DESC;


-- ============================================================
--  SECTION 4: JOINS (INNER, LEFT, MULTIPLE TABLE)
-- ============================================================

-- Query 11: Full country economic profile
-- (3 table join: countries + economic_indicators + gicci_scores)
SELECT c.country_name, c.region,
       ei.year, ei.inflation_rate, ei.gdp_growth_rate,
       ei.unemployment_rate, ei.foreign_reserves_bn,
       gs.gicci_total, gs.risk_category
FROM countries c
JOIN economic_indicators ei ON c.country_id = ei.country_id
JOIN gicci_scores gs ON gs.country_id = ei.country_id
                     AND gs.year = ei.year
ORDER BY c.country_name, ei.year;

-- Query 12: All countries including those with NO crisis events (LEFT JOIN)
SELECT c.country_name, c.region,
       COUNT(ce.crisis_id) AS total_crises,
       COALESCE(MAX(ce.severity_score), 0) AS worst_severity
FROM countries c
LEFT JOIN crisis_events ce ON c.country_id = ce.country_id
GROUP BY c.country_id, c.country_name, c.region
ORDER BY total_crises DESC;

-- Query 13: Crisis events with currency data at time of crisis
SELECT c.country_name,
       ce.crisis_name, ce.start_year, ce.crisis_type,
       cd.exchange_rate_usd, cd.yoy_devaluation_pct,
       cd.black_market_premium
FROM crisis_events ce
JOIN countries c ON ce.country_id = c.country_id
LEFT JOIN currency_data cd ON cd.country_id = ce.country_id
                           AND cd.year = ce.start_year
ORDER BY ce.severity_score DESC;


-- ============================================================
--  SECTION 5: SUBQUERIES
-- ============================================================

-- Query 14: Countries with inflation above global average
SELECT c.country_name, c.region, ei.year, ei.inflation_rate
FROM economic_indicators ei
JOIN countries c ON ei.country_id = c.country_id
WHERE ei.inflation_rate > (
    SELECT AVG(inflation_rate) FROM economic_indicators
    WHERE inflation_rate IS NOT NULL
)
ORDER BY ei.inflation_rate DESC;

-- Query 15: Top 10 worst GICCI scores ever
SELECT c.country_name, c.region,
       gs.year, gs.gicci_total, gs.risk_category
FROM gicci_scores gs
JOIN countries c ON gs.country_id = c.country_id
WHERE gs.gicci_total = (
    SELECT MAX(gicci_total) FROM gicci_scores gs2
    WHERE gs2.country_id = gs.country_id
)
ORDER BY gs.gicci_total DESC
LIMIT 10;

-- Query 16: Countries that had IMF bailout AND still defaulted
SELECT c.country_name, ce.crisis_name,
       ce.start_year, ce.crisis_type, ce.severity_score
FROM crisis_events ce
JOIN countries c ON ce.country_id = c.country_id
WHERE ce.country_id IN (
    SELECT country_id FROM crisis_events
    WHERE imf_involved = TRUE AND default_occurred = TRUE
)
ORDER BY ce.severity_score DESC;


-- ============================================================
--  SECTION 6: EXISTS
-- ============================================================

-- Query 17: Countries that experienced hyperinflation
SELECT c.country_name, c.region
FROM countries c
WHERE EXISTS (
    SELECT 1 FROM crisis_events ce
    WHERE ce.country_id = c.country_id
    AND ce.crisis_type = 'Hyperinflation'
)
ORDER BY c.region, c.country_name;

-- Query 18: Countries that NEVER had an IMF bailout
SELECT c.country_name, c.region
FROM countries c
WHERE NOT EXISTS (
    SELECT 1 FROM crisis_events ce
    WHERE ce.country_id = c.country_id
    AND ce.imf_involved = TRUE
)
ORDER BY c.region;


-- ============================================================
--  SECTION 7: CASE WHEN
-- ============================================================

-- Query 19: Classify inflation severity
SELECT c.country_name, ei.year, ei.inflation_rate,
       CASE
           WHEN ei.inflation_rate < 3   THEN 'Deflationary / Very Low'
           WHEN ei.inflation_rate < 6   THEN 'Healthy'
           WHEN ei.inflation_rate < 10  THEN 'Moderate'
           WHEN ei.inflation_rate < 25  THEN 'High'
           WHEN ei.inflation_rate < 100 THEN 'Very High'
           WHEN ei.inflation_rate < 1000 THEN 'Hyperinflation'
           ELSE                              'Extreme Hyperinflation'
       END AS inflation_category
FROM economic_indicators ei
JOIN countries c ON ei.country_id = c.country_id
ORDER BY ei.inflation_rate DESC;

-- Query 20: GDP growth status classification
SELECT c.country_name, ei.year, ei.gdp_growth_rate,
       CASE
           WHEN ei.gdp_growth_rate > 7   THEN 'Boom'
           WHEN ei.gdp_growth_rate > 4   THEN 'Strong Growth'
           WHEN ei.gdp_growth_rate > 0   THEN 'Moderate Growth'
           WHEN ei.gdp_growth_rate > -3  THEN 'Mild Recession'
           WHEN ei.gdp_growth_rate > -7  THEN 'Severe Recession'
           ELSE                               'Economic Collapse'
       END AS gdp_status,
       ei.inflation_rate
FROM economic_indicators ei
JOIN countries c ON ei.country_id = c.country_id
ORDER BY ei.gdp_growth_rate;

-- Query 21: GICCI risk level with explanation
SELECT c.country_name, gs.year, gs.gicci_total, gs.risk_category,
       CASE gs.risk_category
           WHEN 'Stable'   THEN 'Economy is healthy — no immediate concern'
           WHEN 'Watch'    THEN 'Early warning signs — monitor closely'
           WHEN 'Stress'   THEN 'Significant pressure — policy action needed'
           WHEN 'Crisis'   THEN 'Active emergency — IMF likely involved'
           WHEN 'Collapse' THEN 'Total breakdown — comparable to Zimbabwe 2008'
       END AS description
FROM gicci_scores gs
JOIN countries c ON gs.country_id = c.country_id
ORDER BY gs.gicci_total DESC;


-- ============================================================
--  SECTION 8: CTE (Common Table Expressions)
-- ============================================================

-- Query 22: Countries with worst and best GICCI using CTE
WITH country_gicci AS (
    SELECT country_id,
           MIN(gicci_total) AS best_gicci,
           MAX(gicci_total) AS worst_gicci,
           ROUND(AVG(gicci_total), 2) AS avg_gicci
    FROM gicci_scores
    GROUP BY country_id
)
SELECT c.country_name, c.region,
       cg.best_gicci, cg.worst_gicci, cg.avg_gicci,
       (cg.worst_gicci - cg.best_gicci) AS gicci_range
FROM country_gicci cg
JOIN countries c ON cg.country_id = c.country_id
ORDER BY cg.worst_gicci DESC;

-- Query 23: Crisis frequency analysis using CTE
WITH crisis_count AS (
    SELECT country_id,
           COUNT(*) AS total_crises,
           SUM(CASE WHEN default_occurred = TRUE THEN 1 ELSE 0 END) AS defaults,
           SUM(CASE WHEN imf_involved = TRUE THEN 1 ELSE 0 END) AS imf_bailouts,
           AVG(severity_score) AS avg_severity
    FROM crisis_events
    GROUP BY country_id
),
crisis_classification AS (
    SELECT country_id, total_crises, defaults, imf_bailouts,
           ROUND(avg_severity, 2) AS avg_severity,
           CASE
               WHEN total_crises >= 4 THEN 'Serial Crisis Country'
               WHEN total_crises >= 2 THEN 'Repeat Crisis Country'
               ELSE 'Single Crisis Country'
           END AS crisis_pattern
    FROM crisis_count
)
SELECT c.country_name, c.region,
       cc.total_crises, cc.defaults, cc.imf_bailouts,
       cc.avg_severity, cc.crisis_pattern
FROM crisis_classification cc
JOIN countries c ON cc.country_id = c.country_id
ORDER BY cc.total_crises DESC;

-- Query 24: Recovery analysis — GICCI improvement after crisis
WITH worst_year AS (
    SELECT country_id,
           year AS crisis_year,
           gicci_total AS crisis_gicci
    FROM gicci_scores
    WHERE gicci_total >= 75
),
recovery AS (
    SELECT wy.country_id, wy.crisis_year, wy.crisis_gicci,
           gs.year AS recovery_year, gs.gicci_total AS recovery_gicci,
           (wy.crisis_gicci - gs.gicci_total) AS improvement
    FROM worst_year wy
    JOIN gicci_scores gs ON gs.country_id = wy.country_id
    WHERE gs.year > wy.crisis_year
)
SELECT c.country_name,
       r.crisis_year, r.crisis_gicci,
       r.recovery_year, r.recovery_gicci,
       r.improvement,
       CASE
           WHEN r.improvement > 30 THEN 'Strong Recovery'
           WHEN r.improvement > 15 THEN 'Moderate Recovery'
           WHEN r.improvement > 0  THEN 'Slow Recovery'
           ELSE 'No Recovery'
       END AS recovery_status
FROM recovery r
JOIN countries c ON r.country_id = c.country_id
ORDER BY r.improvement DESC;


-- ============================================================
--  SECTION 9: WINDOW FUNCTIONS
-- ============================================================

-- Query 25: RANK countries by GICCI score each year
SELECT c.country_name, c.region,
       gs.year, gs.gicci_total, gs.risk_category,
       RANK() OVER (
           PARTITION BY gs.year
           ORDER BY gs.gicci_total DESC
       ) AS crisis_rank_that_year
FROM gicci_scores gs
JOIN countries c ON gs.country_id = c.country_id
ORDER BY gs.year, crisis_rank_that_year;

-- Query 26: Rolling 3 year average GICCI per country
SELECT c.country_name, gs.year, gs.gicci_total,
       ROUND(AVG(gs.gicci_total) OVER (
           PARTITION BY gs.country_id
           ORDER BY gs.year
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ), 2) AS rolling_3yr_avg,
       MAX(gs.gicci_total) OVER (
           PARTITION BY gs.country_id
       ) AS all_time_worst_gicci
FROM gicci_scores gs
JOIN countries c ON gs.country_id = c.country_id
ORDER BY c.country_name, gs.year;

-- Query 27: Inflation ranking within each region
SELECT c.country_name, c.region, ei.year, ei.inflation_rate,
       RANK() OVER (
           PARTITION BY c.region
           ORDER BY ei.inflation_rate DESC
       ) AS inflation_rank_in_region,
       ROUND(AVG(ei.inflation_rate) OVER (
           PARTITION BY c.region
       ), 2) AS region_avg_inflation
FROM economic_indicators ei
JOIN countries c ON ei.country_id = c.country_id
WHERE ei.inflation_rate IS NOT NULL
ORDER BY c.region, inflation_rank_in_region;

-- Query 28: Currency devaluation ranking (DENSE_RANK)
SELECT c.country_name, cd.year,
       cd.exchange_rate_usd, cd.yoy_devaluation_pct,
       cd.black_market_premium, cd.currency_regime,
       DENSE_RANK() OVER (
           ORDER BY cd.yoy_devaluation_pct DESC
       ) AS devaluation_rank
FROM currency_data cd
JOIN countries c ON cd.country_id = c.country_id
WHERE cd.yoy_devaluation_pct IS NOT NULL
ORDER BY cd.yoy_devaluation_pct DESC;

-- Query 29: GDP growth vs previous year (LAG function)
SELECT c.country_name, ei.year, ei.gdp_growth_rate,
       LAG(ei.gdp_growth_rate) OVER (
           PARTITION BY ei.country_id
           ORDER BY ei.year
       ) AS previous_year_gdp,
       ROUND(
           ei.gdp_growth_rate -
           LAG(ei.gdp_growth_rate) OVER (
               PARTITION BY ei.country_id
               ORDER BY ei.year
           ), 2
       ) AS gdp_change
FROM economic_indicators ei
JOIN countries c ON ei.country_id = c.country_id
ORDER BY c.country_name, ei.year;

-- Query 30: Running total of crisis events over time (LEAD function)
SELECT c.country_name, ce.start_year, ce.crisis_name,
       ce.severity_score,
       LEAD(ce.crisis_name) OVER (
           PARTITION BY ce.country_id
           ORDER BY ce.start_year
       ) AS next_crisis,
       LEAD(ce.start_year) OVER (
           PARTITION BY ce.country_id
           ORDER BY ce.start_year
       ) AS next_crisis_year
FROM crisis_events ce
JOIN countries c ON ce.country_id = c.country_id
ORDER BY c.country_name, ce.start_year;


-- ============================================================
--  SECTION 10: UNION & UNION ALL
-- ============================================================

-- Query 31: Combined list of hyperinflation countries
-- (from crisis_events OR from economic_indicators)
SELECT c.country_name, 'From Crisis Events' AS source,
       ce.start_year AS year, ce.crisis_type AS detail
FROM crisis_events ce
JOIN countries c ON ce.country_id = c.country_id
WHERE ce.crisis_type = 'Hyperinflation'

UNION

SELECT c.country_name, 'From Economic Data' AS source,
       ei.year, CONCAT(ROUND(ei.inflation_rate, 0), '% inflation') AS detail
FROM economic_indicators ei
JOIN countries c ON ei.country_id = c.country_id
WHERE ei.inflation_rate > 500

ORDER BY country_name, year;

-- Query 32: Countries with BOTH banking crisis AND currency crisis
SELECT country_id FROM crisis_events WHERE crisis_type = 'Banking'
INTERSECT
SELECT country_id FROM crisis_events WHERE crisis_type = 'Currency';


-- ============================================================
--  SECTION 11: ADVANCED ANALYTICAL QUERIES
-- ============================================================

-- Query 33: IMF involvement rate by region (percentage)
SELECT c.region,
       COUNT(*) AS total_crises,
       SUM(CASE WHEN ce.imf_involved = TRUE THEN 1 ELSE 0 END) AS imf_bailouts,
       ROUND(
           100.0 * SUM(CASE WHEN ce.imf_involved = TRUE THEN 1 ELSE 0 END)
           / COUNT(*), 1
       ) AS imf_pct,
       SUM(CASE WHEN ce.default_occurred = TRUE THEN 1 ELSE 0 END) AS defaults,
       ROUND(AVG(ce.severity_score), 2) AS avg_severity
FROM crisis_events ce
JOIN countries c ON ce.country_id = c.country_id
GROUP BY c.region
ORDER BY avg_severity DESC;

-- Query 34: Decade-wise inflation and GDP trends
SELECT c.region,
       (ei.year DIV 10 * 10) AS decade,
       ROUND(AVG(ei.inflation_rate), 2)    AS avg_inflation,
       ROUND(AVG(ei.gdp_growth_rate), 2)   AS avg_gdp_growth,
       ROUND(AVG(ei.unemployment_rate), 2) AS avg_unemployment,
       COUNT(DISTINCT ei.country_id)        AS countries_in_sample
FROM economic_indicators ei
JOIN countries c ON ei.country_id = c.country_id
GROUP BY c.region, decade
ORDER BY decade, avg_inflation DESC;

-- Query 35: Countries currently at risk (2020 onwards)
SELECT c.country_name, c.region,
       gs.year, gs.gicci_total, gs.risk_category,
       ei.inflation_rate, ei.gdp_growth_rate,
       ce.crisis_name
FROM gicci_scores gs
JOIN countries c ON gs.country_id = c.country_id
JOIN economic_indicators ei
    ON ei.country_id = gs.country_id AND ei.year = gs.year
LEFT JOIN crisis_events ce
    ON ce.country_id = gs.country_id
    AND gs.year BETWEEN ce.start_year AND COALESCE(ce.end_year, 2025)
WHERE gs.year >= 2020
AND gs.risk_category IN ('Stress', 'Crisis', 'Collapse')
ORDER BY gs.gicci_total DESC;

-- Query 36: Correlation check — high inflation = low GDP?
SELECT
    CASE
        WHEN ei.inflation_rate < 6   THEN 'Low Inflation'
        WHEN ei.inflation_rate < 25  THEN 'Moderate Inflation'
        WHEN ei.inflation_rate < 100 THEN 'High Inflation'
        ELSE 'Hyperinflation'
    END AS inflation_group,
    COUNT(*) AS records,
    ROUND(AVG(ei.gdp_growth_rate), 2) AS avg_gdp_growth,
    ROUND(AVG(ei.unemployment_rate), 2) AS avg_unemployment
FROM economic_indicators ei
WHERE ei.inflation_rate IS NOT NULL
AND ei.gdp_growth_rate IS NOT NULL
GROUP BY inflation_group
ORDER BY MIN(ei.inflation_rate);

-- Query 37: GICCI sub-score contribution analysis
SELECT c.country_name, gs.year,
       gs.inflation_score, gs.currency_score,
       gs.debt_score, gs.growth_score,
       gs.gicci_total,
       ROUND(gs.inflation_score / gs.gicci_total * 100, 1) AS inflation_contribution_pct,
       ROUND(gs.currency_score  / gs.gicci_total * 100, 1) AS currency_contribution_pct,
       ROUND(gs.debt_score      / gs.gicci_total * 100, 1) AS debt_contribution_pct,
       ROUND(gs.growth_score    / gs.gicci_total * 100, 1) AS growth_contribution_pct
FROM gicci_scores gs
JOIN countries c ON gs.country_id = c.country_id
WHERE gs.gicci_total > 0
ORDER BY gs.gicci_total DESC;

-- Query 38: Black market premium analysis
SELECT c.country_name, cd.year,
       cd.exchange_rate_usd, cd.yoy_devaluation_pct,
       cd.black_market_premium,
       cd.currency_regime,
       CASE
           WHEN cd.black_market_premium > 100 THEN 'Extreme — Economy Dysfunctional'
           WHEN cd.black_market_premium > 50  THEN 'Very High — Capital Controls Failing'
           WHEN cd.black_market_premium > 20  THEN 'High — Official Rate Unrealistic'
           WHEN cd.black_market_premium > 0   THEN 'Moderate — Some Tension'
           ELSE 'None — Rate is Credible'
       END AS premium_assessment
FROM currency_data cd
JOIN countries c ON cd.country_id = c.country_id
WHERE cd.black_market_premium IS NOT NULL
ORDER BY cd.black_market_premium DESC;

-- Query 39: Multi-dimensional crisis scoring
SELECT c.country_name, c.region,
       COUNT(DISTINCT ce.crisis_id)   AS num_crises,
       MAX(ce.severity_score)          AS worst_severity,
       MAX(gs.gicci_total)             AS worst_gicci,
       MAX(ei.inflation_rate)          AS worst_inflation,
       MIN(ei.gdp_growth_rate)         AS worst_gdp,
       SUM(CASE WHEN ce.default_occurred = TRUE THEN 1 ELSE 0 END) AS num_defaults,
       SUM(CASE WHEN ce.imf_involved = TRUE THEN 1 ELSE 0 END)     AS num_imf_programs,
       CASE
           WHEN MAX(gs.gicci_total) >= 90 THEN 'EXTREME RISK COUNTRY'
           WHEN MAX(gs.gicci_total) >= 70 THEN 'HIGH RISK COUNTRY'
           WHEN MAX(gs.gicci_total) >= 50 THEN 'MEDIUM RISK COUNTRY'
           ELSE 'LOW RISK COUNTRY'
       END AS overall_risk_profile
FROM countries c
LEFT JOIN crisis_events ce ON c.country_id = ce.country_id
LEFT JOIN gicci_scores gs  ON c.country_id = gs.country_id
LEFT JOIN economic_indicators ei ON c.country_id = ei.country_id
GROUP BY c.country_id, c.country_name, c.region
ORDER BY worst_gicci DESC;

-- Query 40: Final Summary Dashboard Query
SELECT
    (SELECT COUNT(*) FROM countries)                          AS total_countries,
    (SELECT COUNT(*) FROM economic_indicators)               AS total_eco_records,
    (SELECT COUNT(*) FROM crisis_events)                     AS total_crises,
    (SELECT COUNT(*) FROM gicci_scores WHERE risk_category = 'Collapse') AS collapse_records,
    (SELECT ROUND(AVG(gicci_total), 2) FROM gicci_scores)   AS avg_gicci_score,
    (SELECT MAX(gicci_total) FROM gicci_scores)              AS worst_gicci_ever,
    (SELECT ROUND(AVG(severity_score), 2) FROM crisis_events) AS avg_crisis_severity,
    (SELECT ROUND(100.0 * SUM(imf_involved) / COUNT(*), 1) FROM crisis_events) AS imf_bailout_rate_pct,
    (SELECT MAX(inflation_rate) FROM economic_indicators)    AS worst_inflation_ever;

-- ============================================================
--  END OF ANALYTICAL QUERIES
-- ============================================================

-- ============================================================
--  GICCI — Additional Table: Recovery Index
--  Created after EDA analysis to measure how fast
--  countries recovered after economic crises
--  Author : Santosh Gutte | VIT Mumbai
--
--  INTERVIEWER TALKING POINT:
--  "After completing my EDA in Python, I noticed that the
--   dataset only tracked crisis events but not recovery.
--   I added this table to measure recovery speed, strength,
--   and sustainability — making the analysis more complete."
-- ============================================================

USE gicci_db;


-- aditional table created by me --

-- ============================================================
--  TABLE 6: recovery_index
--  Tracks recovery after each major crisis event
-- ============================================================
CREATE TABLE recovery_index (
    recovery_id             INT PRIMARY KEY,
    country_id              INT          NOT NULL,
    crisis_id               INT          NOT NULL,   -- links to crisis_events
    crisis_end_year         INT          NOT NULL,   -- when crisis ended
    recovery_year           INT          NOT NULL,   -- when recovery was achieved
    years_to_recover        INT,                     -- how many years it took
    pre_crisis_gdp_growth   DECIMAL(8,2),            -- avg GDP before crisis
    post_crisis_gdp_growth  DECIMAL(8,2),            -- avg GDP after recovery
    pre_crisis_inflation    DECIMAL(8,2),            -- avg inflation before
    post_crisis_inflation   DECIMAL(8,2),            -- avg inflation after
    gicci_at_crisis_peak    DECIMAL(5,2),            -- worst GICCI during crisis
    gicci_at_recovery       DECIMAL(5,2),            -- GICCI when recovered
    gicci_improvement       DECIMAL(5,2),            -- how much GICCI improved
    recovery_type           VARCHAR(50),             -- Fast/Moderate/Slow/No Recovery
    recovery_driver         VARCHAR(200),            -- what drove the recovery
    imf_helped_recovery     BOOLEAN,                 -- did IMF help in recovery
    sustained_recovery      BOOLEAN,                 -- did recovery last 5+ years
    relapsed_into_crisis    BOOLEAN,                 -- did they fall back into crisis
    recovery_score          DECIMAL(5,2),            -- 0-100 (100 = perfect recovery)
    notes                   VARCHAR(500),
    FOREIGN KEY (country_id) REFERENCES countries(country_id),
    FOREIGN KEY (crisis_id)  REFERENCES crisis_events(crisis_id)
);

-- ============================================================
--  RECOVERY SCORE FORMULA:
--  recovery_score = 
--    (gicci_improvement / gicci_at_crisis_peak * 40)   -- 40 pts for GICCI improvement
--  + (CASE years_to_recover WHEN <3 THEN 30 WHEN <5 THEN 20 ELSE 10 END)  -- 30 pts speed
--  + (IF sustained_recovery = TRUE THEN 20 ELSE 0)    -- 20 pts sustainability
--  + (IF relapsed_into_crisis = FALSE THEN 10 ELSE 0) -- 10 pts no relapse
-- ============================================================

INSERT INTO recovery_index VALUES

-- ─────────────────────────────────────────────
-- INDIA — BOP Crisis 1991
-- crisis_id = 1
-- ─────────────────────────────────────────────
(1, 1, 1,
 1991, 1994, 3,
 5.5,  7.6,
 11.2,  9.9,
 70.0, 13.0, 57.0,
 'Fast Recovery',
 'Liberalization reforms — FDI opened — IT sector emerged — RBI stabilized rupee',
 TRUE, TRUE, FALSE,
 88.0,
 'India recovered fastest among BOP crisis countries. Liberalization unlocked growth.'),

-- ─────────────────────────────────────────────
-- ARGENTINA — Great Default 2001-2002
-- crisis_id = 11
-- ─────────────────────────────────────────────
(2, 11, 11,
 2002, 2005, 3,
 -2.8, 9.5,
 25.9, 22.9,
 95.0, 37.0, 58.0,
 'Fast Recovery',
 'Commodity boom — soy exports — Kirchner stimulus spending — debt restructuring',
 TRUE, FALSE, TRUE,
 62.0,
 'Argentina recovered quickly on commodity boom but relapsed into crisis by 2018.'),

-- ─────────────────────────────────────────────
-- ARGENTINA — Peso Crisis 2018
-- crisis_id = 12
-- ─────────────────────────────────────────────
(3, 11, 12,
 2019, 2024, 5,
 -2.6, -1.7,
 47.6, 94.8,
 58.0, 82.0, -24.0,
 'No Recovery',
 'Milei shock therapy ongoing — inflation still 200%+ — no sustainable recovery yet',
 TRUE, FALSE, TRUE,
 12.0,
 'Argentina went from Peso Crisis directly into 2nd Hyperinflation — no real recovery.'),

-- ─────────────────────────────────────────────
-- SOUTH KOREA — Asian Crisis 1997-1998
-- crisis_id = 39
-- ─────────────────────────────────────────────
(4, 45, 39,
 1998, 2001, 3,
 -5.5, 8.8,
 7.5,  2.3,
 67.0, 3.0, 64.0,
 'Fast Recovery',
 'IMF reforms — chaebol restructuring — export surge — IT boom — strong institutions',
 TRUE, TRUE, FALSE,
 95.0,
 'Best recovery case in dataset. South Korea repaid IMF early and grew stronger.'),

-- ─────────────────────────────────────────────
-- INDONESIA — Asian Crisis 1997-1998
-- crisis_id = 6
-- ─────────────────────────────────────────────
(5, 6, 6,
 1998, 2003, 5,
 -13.1, 5.0,
 58.5, 3.7,
 NULL, NULL, NULL,
 'Moderate Recovery',
 'Political reform — Suharto fell — democracy — commodity exports drove recovery',
 TRUE, TRUE, FALSE,
 72.0,
 'Indonesia recovered but took longer than Korea. Political transformation helped.'),

-- ─────────────────────────────────────────────
-- THAILAND — Asian Crisis 1997-1998
-- crisis_id = 7
-- ─────────────────────────────────────────────
(6, 7, 7,
 1998, 2002, 4,
 -10.5, 7.5,
 8.1,  3.3,
 NULL, NULL, NULL,
 'Moderate Recovery',
 'Export led recovery — manufacturing FDI — tourism rebound — IMF program reforms',
 TRUE, TRUE, FALSE,
 78.0,
 'Thailand recovered steadily through exports and tourism over 4 years.'),

-- ─────────────────────────────────────────────
-- TURKEY — Banking Crisis 2001
-- crisis_id = 21
-- ─────────────────────────────────────────────
(7, 27, 21,
 2001, 2004, 3,
 -5.7, 8.4,
 54.4, 8.2,
 85.0, NULL, NULL,
 'Fast Recovery',
 'AKP economic reforms — Erdogan early era — IMF discipline — EU accession progress',
 TRUE, TRUE, TRUE,
 80.0,
 'Turkey recovered impressively from 2001 but relapsed into crisis by 2018.'),

-- ─────────────────────────────────────────────
-- TURKEY — Inflation Spiral 2021-2023
-- crisis_id = 23
-- ─────────────────────────────────────────────
(8, 27, 23,
 2023, 2025, 2,
 11.0, 3.2,
 72.3, 65.0,
 56.0, NULL, NULL,
 'Slow Recovery',
 'Rate hikes finally applied — orthodox policy return — but inflation still 65%',
 FALSE, FALSE, FALSE,
 35.0,
 'Turkey began orthodox monetary policy in 2023. Recovery still in progress.'),

-- ─────────────────────────────────────────────
-- RUSSIA — Ruble Crisis 1998
-- crisis_id = 24
-- ─────────────────────────────────────────────
(9, 28, 24,
 1998, 2001, 3,
 -5.3, 10.0,
 27.7, 20.8,
 85.0, NULL, NULL,
 'Fast Recovery',
 'Oil price recovery — Putin stabilization — debt restructuring — export revenues',
 FALSE, TRUE, FALSE,
 75.0,
 'Russia recovered rapidly on oil boom. Growth hit 10% by 2000.'),

-- ─────────────────────────────────────────────
-- BRAZIL — Hyperinflation 1989-1994
-- crisis_id = 15
-- ─────────────────────────────────────────────
(10, 13, 15,
 1994, 1997, 3,
 -4.3, 4.4,
 2947.7, 7.1,
 80.0, NULL, NULL,
 'Fast Recovery',
 'Real Plan 1994 — currency anchor — fiscal discipline — Cardoso reforms',
 FALSE, TRUE, FALSE,
 82.0,
 'Brazil eliminated hyperinflation with Real Plan. One of best stabilization examples.'),

-- ─────────────────────────────────────────────
-- MEXICO — Tequila Crisis 1994-1995
-- crisis_id = 16
-- ─────────────────────────────────────────────
(11, 14, 16,
 1995, 1997, 2,
 -6.2, 6.6,
 35.0, 9.5,
 79.0, NULL, NULL,
 'Fast Recovery',
 'US 50bn rescue — NAFTA trade boost — peso stabilization — export manufacturing',
 TRUE, TRUE, FALSE,
 85.0,
 'Mexico recovered very fast thanks to US support and NAFTA exports.'),

-- ─────────────────────────────────────────────
-- GREECE — Debt Crisis 2010-2018
-- crisis_id = 20
-- ─────────────────────────────────────────────
(12, 26, 20,
 2018, 2022, 4,
 -5.4, 2.0,
 4.7,  3.5,
 53.0, NULL, NULL,
 'Moderate Recovery',
 'Tourism recovery — EU support — austerity reforms — debt relief — Mitsotakis reforms',
 TRUE, TRUE, FALSE,
 65.0,
 'Greece slowly recovered after decade of austerity. Tourism was the key driver.'),

-- ─────────────────────────────────────────────
-- ZIMBABWE — Hyperinflation 2007-2009
-- crisis_id = 33
-- ─────────────────────────────────────────────
(13, 38, 33,
 2009, 2013, 4,
 -17.7, 6.3,
 66212.3, 6.2,
 100.0, NULL, NULL,
 'Moderate Recovery',
 'USD adoption — eliminated hyperinflation overnight — GNU government — aid inflows',
 FALSE, FALSE, TRUE,
 45.0,
 'Zimbabwe stabilized by adopting USD but relapsed with new ZWL in 2019.'),

-- ─────────────────────────────────────────────
-- SRI LANKA — Economic Crisis 2022
-- crisis_id = 5
-- ─────────────────────────────────────────────
(14, 3, 5,
 2023, 2026, 3,
 -8.7, -2.3,
 46.4, 25.2,
 79.0, 48.0, 31.0,
 'Slow Recovery',
 'IMF bailout — austerity — tax hikes — debt restructuring — tourism slowly returning',
 TRUE, FALSE, FALSE,
 42.0,
 'Sri Lanka in early recovery. IMF program on track but living standards still very low.'),

-- ─────────────────────────────────────────────
-- VENEZUELA — Economic Collapse 2014-ongoing
-- crisis_id = 14
-- ─────────────────────────────────────────────
(15, 12, 14,
 2022, 2030, 8,
 -19.6, 17.5,
 65374.0, 167.2,
 100.0, 64.0, 36.0,
 'Slow Recovery',
 'Partial dollarization — oil production slight recovery — sanctions still heavy',
 FALSE, FALSE, FALSE,
 22.0,
 'Venezuela showing slight recovery from 2022 dollarization but far from stable.'),

-- ─────────────────────────────────────────────
-- UKRAINE — War Economic Crisis 2022
-- crisis_id = 26
-- ─────────────────────────────────────────────
(16, 29, 26,
 2024, 2028, 4,
 -29.1, NULL,
 20.2,  NULL,
 80.0, NULL, NULL,
 'Slow Recovery',
 'Western aid — reconstruction funding — EU accession track — but war ongoing',
 TRUE, FALSE, FALSE,
 30.0,
 'Recovery entirely depends on war outcome. Reconstruction cost estimated 500bn+.'),

-- ─────────────────────────────────────────────
-- INDIA — Taper Tantrum 2013
-- crisis_id = 2
-- ─────────────────────────────────────────────
(17, 1, 2,
 2013, 2014, 1,
 6.4, 8.3,
 9.9, 4.5,
 39.0, 35.0, 4.0,
 'Fast Recovery',
 'RBI intervention — Raghuram Rajan rate hike — forex reserves rebuilt — FDI return',
 FALSE, TRUE, FALSE,
 92.0,
 'India recovered from taper tantrum within 1 year. RBI credibility restored.'),

-- ─────────────────────────────────────────────
-- GHANA — Debt Crisis 2022
-- crisis_id = 32
-- ─────────────────────────────────────────────
(18, 36, 32,
 2023, 2026, 3,
 3.2, NULL,
 31.5, NULL,
 63.0, NULL, NULL,
 'Slow Recovery',
 'IMF 3bn program — domestic debt restructuring — gold exports — spending cuts',
 TRUE, FALSE, FALSE,
 38.0,
 'Ghana in early IMF program. Cocoa and gold exports key to recovery.'),

-- ─────────────────────────────────────────────
-- ARGENTINA — Hyperinflation 1989-1990
-- crisis_id = 9
-- ─────────────────────────────────────────────
(19, 11, 9,
 1990, 1993, 3,
 -7.0, -2.8,
 3080.0, 1.6,
 90.0, 37.0, 53.0,
 'Fast Recovery',
 'Convertibility Plan 1991 — 1:1 USD peg — privatization — Menem reforms',
 TRUE, FALSE, TRUE,
 68.0,
 'Argentina killed hyperinflation with convertibility but it created future crisis.'),

-- ─────────────────────────────────────────────
-- PERU — Hyperinflation 1988-1990
-- crisis_id = 17
-- ─────────────────────────────────────────────
(20, 17, 17,
 1990, 1994, 4,
 -5.1, 8.5,
 7481.7, 3.8,
 95.0, NULL, NULL,
 'Fast Recovery',
 'Fujimori shock therapy — privatization — central bank independence — dollarization partial',
 TRUE, TRUE, FALSE,
 78.0,
 'Peru achieved impressive stabilization under Fujimori. Mining boom sustained recovery.');


-- ============================================================
--  ANALYTICAL QUERIES ON RECOVERY INDEX
-- ============================================================

-- Query 1: Best recoveries ever (fastest + most complete)
SELECT c.country_name, c.region,
       ri.crisis_end_year, ri.recovery_year,
       ri.years_to_recover, ri.recovery_type,
       ri.gicci_improvement, ri.recovery_score,
       ri.recovery_driver
FROM recovery_index ri
JOIN countries c ON ri.country_id = c.country_id
ORDER BY ri.recovery_score DESC;

-- Query 2: Average recovery time by region
SELECT c.region,
       ROUND(AVG(ri.years_to_recover), 1) AS avg_years_to_recover,
       ROUND(AVG(ri.recovery_score), 1)   AS avg_recovery_score,
       ROUND(AVG(ri.gicci_improvement), 1) AS avg_gicci_improvement,
       COUNT(*) AS crises_analyzed
FROM recovery_index ri
JOIN countries c ON ri.country_id = c.country_id
WHERE ri.years_to_recover IS NOT NULL
GROUP BY c.region
ORDER BY avg_recovery_score DESC;

-- Query 3: Countries that recovered but relapsed
SELECT c.country_name,
       ri.recovery_type, ri.recovery_score,
       ri.years_to_recover, ri.sustained_recovery,
       ri.relapsed_into_crisis, ri.notes
FROM recovery_index ri
JOIN countries c ON ri.country_id = c.country_id
WHERE ri.relapsed_into_crisis = TRUE
ORDER BY ri.recovery_score DESC;

-- Query 4: IMF impact on recovery speed
SELECT
    CASE WHEN ri.imf_helped_recovery = TRUE THEN 'IMF Involved' ELSE 'No IMF' END AS imf_status,
    COUNT(*)                                  AS total_cases,
    ROUND(AVG(ri.years_to_recover), 1)       AS avg_years_to_recover,
    ROUND(AVG(ri.recovery_score), 1)         AS avg_recovery_score,
    ROUND(AVG(ri.gicci_improvement), 1)      AS avg_gicci_improvement,
    SUM(CASE WHEN ri.sustained_recovery = TRUE THEN 1 ELSE 0 END) AS sustained_recoveries
FROM recovery_index ri
WHERE ri.years_to_recover IS NOT NULL
GROUP BY imf_status;

-- Query 5: Recovery type distribution
SELECT ri.recovery_type,
       COUNT(*) AS count,
       ROUND(AVG(ri.recovery_score), 1) AS avg_score,
       ROUND(AVG(ri.years_to_recover), 1) AS avg_years,
       ROUND(AVG(ri.gicci_improvement), 1) AS avg_gicci_improvement
FROM recovery_index ri
WHERE ri.years_to_recover IS NOT NULL
GROUP BY ri.recovery_type
ORDER BY avg_score DESC;

-- Query 6: Full recovery analysis joining all tables
SELECT c.country_name, c.region,
       ce.crisis_name, ce.crisis_type, ce.severity_score,
       ri.years_to_recover, ri.recovery_type,
       ri.recovery_score, ri.gicci_at_crisis_peak,
       ri.gicci_at_recovery, ri.gicci_improvement,
       ri.sustained_recovery, ri.relapsed_into_crisis,
       ri.recovery_driver
FROM recovery_index ri
JOIN countries c     ON ri.country_id = c.country_id
JOIN crisis_events ce ON ri.crisis_id  = ce.crisis_id
ORDER BY ri.recovery_score DESC;

-- Query 7: Rank countries by recovery score using Window Function
SELECT c.country_name, c.region,
       ri.recovery_type, ri.recovery_score,
       ri.years_to_recover,
       RANK() OVER (ORDER BY ri.recovery_score DESC) AS recovery_rank,
       RANK() OVER (PARTITION BY c.region ORDER BY ri.recovery_score DESC) AS regional_recovery_rank
FROM recovery_index ri
JOIN countries c ON ri.country_id = c.country_id
ORDER BY recovery_rank;

-- Query 8: CTE — Countries with fast recovery but relapsed
WITH fast_recoveries AS (
    SELECT ri.*, c.country_name, c.region
    FROM recovery_index ri
    JOIN countries c ON ri.country_id = c.country_id
    WHERE ri.recovery_type = 'Fast Recovery'
)
SELECT country_name, region,
       years_to_recover, recovery_score,
       relapsed_into_crisis,
       CASE
           WHEN relapsed_into_crisis = TRUE THEN 'Warning — Fast but Unstable'
           ELSE 'Good — Fast and Stable'
       END AS assessment
FROM fast_recoveries
ORDER BY recovery_score DESC;

-- ============================================================
--  END OF RECOVERY INDEX TABLE
-- ============================================================


-- ============================================================
--  END OF GICCI PHASE 1 — SQL DATABASE
--  Next: Phase 2 — Python EDA & Visualization
-- ============================================================
