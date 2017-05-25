-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 25, 2017 at 11:23 AM
-- Server version: 5.7.13
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chriswatterston_www`
--

-- --------------------------------------------------------

--
-- Table structure for table `AreaLayoutColumns`
--

CREATE TABLE `AreaLayoutColumns` (
  `arLayoutColumnID` int(10) UNSIGNED NOT NULL,
  `arLayoutID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arLayoutColumnIndex` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arLayoutColumnDisplayID` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `AreaLayoutColumns`
--

INSERT INTO `AreaLayoutColumns` (`arLayoutColumnID`, `arLayoutID`, `arLayoutColumnIndex`, `arID`, `arLayoutColumnDisplayID`) VALUES
(1, 1, 0, 2, 1),
(2, 1, 1, 3, 2),
(3, 1, 2, 4, 3),
(4, 2, 0, 5, 4),
(5, 2, 1, 6, 5),
(6, 3, 0, 7, 6),
(7, 3, 1, 8, 7),
(8, 3, 2, 9, 8);

-- --------------------------------------------------------

--
-- Table structure for table `AreaLayoutCustomColumns`
--

CREATE TABLE `AreaLayoutCustomColumns` (
  `arLayoutColumnID` int(10) UNSIGNED NOT NULL,
  `arLayoutColumnWidth` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AreaLayoutPresets`
--

CREATE TABLE `AreaLayoutPresets` (
  `arLayoutPresetID` int(10) UNSIGNED NOT NULL,
  `arLayoutID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arLayoutPresetName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AreaLayouts`
--

CREATE TABLE `AreaLayouts` (
  `arLayoutID` int(10) UNSIGNED NOT NULL,
  `arLayoutSpacing` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arLayoutIsCustom` tinyint(1) NOT NULL DEFAULT '0',
  `arLayoutIsPreset` tinyint(1) NOT NULL DEFAULT '0',
  `arLayoutMaxColumns` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arLayoutUsesThemeGridFramework` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `AreaLayouts`
--

INSERT INTO `AreaLayouts` (`arLayoutID`, `arLayoutSpacing`, `arLayoutIsCustom`, `arLayoutIsPreset`, `arLayoutMaxColumns`, `arLayoutUsesThemeGridFramework`) VALUES
(1, 0, 0, 0, 12, 1),
(2, 0, 0, 0, 12, 1),
(3, 0, 0, 0, 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `AreaLayoutsUsingPresets`
--

CREATE TABLE `AreaLayoutsUsingPresets` (
  `arLayoutID` int(10) UNSIGNED NOT NULL,
  `preset` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AreaLayoutThemeGridColumns`
--

CREATE TABLE `AreaLayoutThemeGridColumns` (
  `arLayoutColumnID` int(10) UNSIGNED NOT NULL,
  `arLayoutColumnSpan` int(10) UNSIGNED DEFAULT '0',
  `arLayoutColumnOffset` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `AreaLayoutThemeGridColumns`
--

INSERT INTO `AreaLayoutThemeGridColumns` (`arLayoutColumnID`, `arLayoutColumnSpan`, `arLayoutColumnOffset`) VALUES
(1, 4, 0),
(2, 4, 0),
(3, 4, 0),
(4, 4, 0),
(5, 8, 0),
(6, 4, 0),
(7, 4, 0),
(8, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `AreaPermissionAssignments`
--

CREATE TABLE `AreaPermissionAssignments` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AreaPermissionBlockTypeAccessList`
--

CREATE TABLE `AreaPermissionBlockTypeAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `permission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AreaPermissionBlockTypeAccessListCustom`
--

CREATE TABLE `AreaPermissionBlockTypeAccessListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `btID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Areas`
--

CREATE TABLE `Areas` (
  `arID` int(10) UNSIGNED NOT NULL,
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `arOverrideCollectionPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `arInheritPermissionsFromAreaOnCID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arIsGlobal` tinyint(1) NOT NULL DEFAULT '0',
  `arParentID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Areas`
--

INSERT INTO `Areas` (`arID`, `cID`, `arHandle`, `arOverrideCollectionPermissions`, `arInheritPermissionsFromAreaOnCID`, `arIsGlobal`, `arParentID`) VALUES
(1, 138, 'Main', 0, 0, 0, 0),
(2, 138, 'Main : 1', 0, 0, 0, 1),
(3, 138, 'Main : 2', 0, 0, 0, 1),
(4, 138, 'Main : 3', 0, 0, 0, 1),
(5, 138, 'Main : 4', 0, 0, 0, 1),
(6, 138, 'Main : 5', 0, 0, 0, 1),
(7, 138, 'Main : 6', 0, 0, 0, 1),
(8, 138, 'Main : 7', 0, 0, 0, 1),
(9, 138, 'Main : 8', 0, 0, 0, 1),
(10, 139, 'Main', 0, 0, 0, 0),
(11, 152, 'Main', 0, 0, 0, 0),
(12, 153, 'Main', 0, 0, 0, 0),
(13, 154, 'Main', 0, 0, 0, 0),
(14, 1, 'Header Site Title', 0, 0, 1, 0),
(15, 155, 'Main', 0, 0, 0, 0),
(16, 1, 'Header Navigation', 0, 0, 1, 0),
(17, 1, 'Main', 0, 0, 0, 0),
(18, 1, 'Page Footer', 0, 0, 0, 0),
(19, 156, 'Main', 0, 0, 0, 0),
(20, 1, 'Footer Legal', 0, 0, 1, 0),
(21, 157, 'Main', 0, 0, 0, 0),
(22, 1, 'Footer Navigation', 0, 0, 1, 0),
(23, 158, 'Main', 0, 0, 0, 0),
(24, 1, 'Footer Contact', 0, 0, 1, 0),
(25, 159, 'Main', 0, 0, 0, 0),
(26, 160, 'Main', 0, 0, 0, 0),
(27, 161, 'Main', 0, 0, 0, 0),
(28, 162, 'Main', 0, 0, 0, 0),
(29, 163, 'Main', 0, 0, 0, 0),
(30, 164, 'Main', 0, 0, 0, 0),
(31, 1, 'Social Links', 0, 0, 0, 0),
(32, 1, 'Social Feed', 0, 0, 0, 0),
(33, 165, 'Main', 0, 0, 0, 0),
(34, 166, 'Main', 0, 0, 0, 0),
(35, 1, 'Edit Me', 0, 0, 0, 0),
(36, 168, 'Edit Me', 0, 0, 0, 0),
(37, 1, 'Header Latest Feed', 0, 0, 0, 0),
(38, 169, 'Edit Me', 0, 0, 0, 0),
(39, 170, 'Edit Me', 0, 0, 0, 0),
(40, 171, 'Edit Me', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `atAddress`
--

CREATE TABLE `atAddress` (
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atAddressSettings`
--

CREATE TABLE `atAddressSettings` (
  `akDefaultCountry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `akHasCustomCountries` tinyint(1) NOT NULL,
  `customCountries` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atBoolean`
--

CREATE TABLE `atBoolean` (
  `value` tinyint(1) NOT NULL,
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `atBoolean`
--

INSERT INTO `atBoolean` (`value`, `avID`) VALUES
(1, 9),
(1, 16),
(1, 18),
(1, 24),
(1, 25),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 43),
(1, 44),
(1, 51),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 109),
(1, 118),
(0, 119),
(1, 125),
(1, 126),
(1, 235),
(1, 268);

-- --------------------------------------------------------

--
-- Table structure for table `atBooleanSettings`
--

CREATE TABLE `atBooleanSettings` (
  `akCheckedByDefault` tinyint(1) NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `atBooleanSettings`
--

INSERT INTO `atBooleanSettings` (`akCheckedByDefault`, `akID`) VALUES
(0, 5),
(0, 7),
(0, 8),
(0, 11),
(0, 12),
(0, 13),
(1, 14),
(1, 15),
(0, 21);

-- --------------------------------------------------------

--
-- Table structure for table `atDateTime`
--

CREATE TABLE `atDateTime` (
  `value` datetime DEFAULT NULL,
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atDateTimeSettings`
--

CREATE TABLE `atDateTimeSettings` (
  `akDateDisplayMode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atDefault`
--

CREATE TABLE `atDefault` (
  `value` longtext COLLATE utf8_unicode_ci,
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `atDefault`
--

INSERT INTO `atDefault` (`value`, `avID`) VALUES
('fa fa-th-large', 1),
('pages, add page, delete page, copy, move, alias', 2),
('pages, add page, delete page, copy, move, alias', 3),
('pages, add page, delete page, copy, move, alias, bulk', 4),
('find page, search page, search, find, pages, sitemap', 5),
('add file, delete file, copy, move, alias, resize, crop, rename, images, title, attribute', 6),
('file, file attributes, title, attribute, description, rename', 7),
('files, category, categories', 8),
('new file set', 10),
('users, groups, people, find, delete user, remove user, change password, password', 11),
('find, search, people, delete user, remove user, change password, password', 12),
('user, group, people, permissions, expire, badges', 13),
('user attributes, user data, gather data, registration data', 14),
('new user, create', 15),
('new user group, new group, group, create', 17),
('group set', 19),
('community, points, karma', 20),
('action, community actions', 21),
('forms, log, error, email, mysql, exception, survey', 22),
('forms, questions, response, data', 23),
('questions, quiz, response', 26),
('forms, log, error, email, mysql, exception, survey, history', 27),
('new theme, theme, active theme, change theme, template, css', 28),
('page types', 29),
('page attributes, custom', 38),
('single, page, custom, application', 39),
('atom, rss, feed, syndication', 40),
('icon-bullhorn', 41),
('stacks, global areas, reusable content, scrapbook, copy, paste, paste block, copy block, site name, logo', 42),
('edit stacks, view stacks, all stacks', 45),
('block, refresh, custom', 46),
('add-on, addon, add on, package, app, ecommerce, discussions, forums, themes, templates, blocks', 47),
('add-on, addon, ecommerce, install, discussions, forums, themes, templates, blocks', 48),
('update, upgrade', 49),
('concrete5.org, my account, marketplace', 50),
('buy theme, new theme, marketplace, template', 52),
('buy addon, buy add on, buy add-on, purchase addon, purchase add on, purchase add-on, find addon, new addon, marketplace', 53),
('dashboard, configuration', 54),
('website name, title', 55),
('accessibility, easy mode', 56),
('sharing, facebook, twitter', 57),
('logo, favicon, iphone, icon, bookmark', 58),
('tinymce, content block, fonts, editor, content, overlay', 59),
('translate, translation, internationalization, multilingual', 60),
('timezone, profile, locale', 61),
('site attributes', 62),
('multilingual, localization, internationalization, i18n', 71),
('vanity, pretty url, redirection, hostname, canonical, seo, pageview, view', 72),
('bulk, seo, change keywords, engine, optimization, search', 73),
('traffic, statistics, google analytics, quant, pageviews, hits', 74),
('pretty, slug', 75),
('configure search, site search, search option', 76),
('file options, file manager, upload, modify', 77),
('security, files, media, extension, manager, upload', 78),
('images, picture, responsive, retina', 79),
('uploading, upload, images, image, resizing, manager', 80),
('security, alternate storage, hide files', 81),
('cache option, change cache, override, turn on cache, turn off cache, no cache, page cache, caching', 82),
('cache option, turn off cache, no cache, page cache, caching', 83),
('index search, reindex search, build sitemap, sitemap.xml, clear old versions, page versions, remove old', 84),
('queries, database, mysql', 85),
('editors, hide site, offline, private, public, access', 86),
('security, actions, administrator, admin, package, marketplace, search', 87),
('security, lock ip, lock out, block ip, address, restrict, access', 88),
('security, registration', 89),
('antispam, block spam, security', 90),
('lock site, under construction, hide, hidden', 91),
('profile, login, redirect, specific, dashboard, administrators', 92),
('member profile, member page, community, forums, social, avatar', 93),
('signup, new user, community, public registration, public, registration', 94),
('auth, authentication, types, oauth, facebook, login, registration', 95),
('global, password, reset, change password, force, sign out', 96),
('smtp, mail settings', 97),
('email server, mail settings, mail configuration, external, internal', 98),
('test smtp, test mail', 99),
('email server, mail settings, mail configuration, private message, message system, import, email, message', 100),
('conversations', 101),
('conversations', 102),
('conversations ratings, ratings, community, community points', 103),
('conversations bad words, banned words, banned, bad words, bad, words, list', 104),
('attribute configuration', 105),
('attributes, sets', 106),
('attributes, types', 107),
('topics, tags, taxonomy', 108),
('overrides, system info, debug, support, help', 110),
('errors, exceptions, develop, support, help', 111),
('email, logging, logs, smtp, pop, errors, mysql, log', 112),
('network, proxy server', 113),
('database, entities, doctrine, orm', 114),
('export, backup, database, sql, mysql, encryption, restore', 115),
('upgrade, new version, update', 116),
('fa fa-trash-o', 120),
('fa fa-briefcase', 121),
('fa fa-edit', 122),
('fa fa-th', 123),
('Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', 205),
('Welcome to Chris Watterston', 210),
('Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', 211),
('Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', 214),
('Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat. Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in.', 232),
('hello, world', 233),
('Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', 257),
('tester, sausage', 258),
('Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', 262),
('Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat. Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in.', 265),
('hello, world', 266),
('Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', 270),
('tester, sausage', 271),
('Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', 274),
('tester, sausage', 275);

-- --------------------------------------------------------

--
-- Table structure for table `atEmptySettings`
--

CREATE TABLE `atEmptySettings` (
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `atEmptySettings`
--

INSERT INTO `atEmptySettings` (`akID`) VALUES
(4),
(16),
(17),
(18),
(19);

-- --------------------------------------------------------

--
-- Table structure for table `atExpress`
--

CREATE TABLE `atExpress` (
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atExpressSelectedEntries`
--

CREATE TABLE `atExpressSelectedEntries` (
  `avID` int(10) UNSIGNED NOT NULL,
  `exEntryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atExpressSettings`
--

CREATE TABLE `atExpressSettings` (
  `exEntityID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atFile`
--

CREATE TABLE `atFile` (
  `fID` int(10) UNSIGNED DEFAULT NULL,
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `atFile`
--

INSERT INTO `atFile` (`fID`, `avID`) VALUES
(1, 206),
(1, 212),
(1, 215),
(1, 234),
(1, 259),
(1, 263),
(1, 267),
(1, 272),
(1, 276);

-- --------------------------------------------------------

--
-- Table structure for table `atFileSettings`
--

CREATE TABLE `atFileSettings` (
  `akFileManagerMode` int(11) NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `atFileSettings`
--

INSERT INTO `atFileSettings` (`akFileManagerMode`, `akID`) VALUES
(0, 20);

-- --------------------------------------------------------

--
-- Table structure for table `atNumber`
--

CREATE TABLE `atNumber` (
  `value` decimal(14,4) DEFAULT NULL,
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `atNumber`
--

INSERT INTO `atNumber` (`value`, `avID`) VALUES
('2.0000', 117),
('1.0000', 124),
('1024.0000', 187),
('768.0000', 188);

-- --------------------------------------------------------

--
-- Table structure for table `atSelect`
--

CREATE TABLE `atSelect` (
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atSelectedSocialLinks`
--

CREATE TABLE `atSelectedSocialLinks` (
  `avsID` int(10) UNSIGNED NOT NULL,
  `service` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serviceInfo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atSelectedTopics`
--

CREATE TABLE `atSelectedTopics` (
  `avTreeTopicNodeID` int(10) UNSIGNED NOT NULL,
  `treeNodeID` int(10) UNSIGNED NOT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `atSelectedTopics`
--

INSERT INTO `atSelectedTopics` (`avTreeTopicNodeID`, `treeNodeID`, `avID`) VALUES
(2, 16, 208),
(3, 11, 208),
(4, 18, 208),
(5, 26, 213),
(6, 26, 216),
(7, 17, 236),
(8, 11, 236),
(9, 20, 236),
(10, 26, 236),
(16, 16, 261),
(17, 18, 261),
(18, 26, 261),
(19, 11, 264),
(20, 26, 264),
(21, 27, 269),
(22, 26, 269),
(23, 26, 273),
(24, 18, 277),
(25, 26, 277);

-- --------------------------------------------------------

--
-- Table structure for table `atSelectOptionLists`
--

CREATE TABLE `atSelectOptionLists` (
  `avSelectOptionListID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `atSelectOptionLists`
--

INSERT INTO `atSelectOptionLists` (`avSelectOptionListID`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `atSelectOptions`
--

CREATE TABLE `atSelectOptions` (
  `avSelectOptionID` int(10) UNSIGNED NOT NULL,
  `isEndUserAdded` tinyint(1) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `displayOrder` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avSelectOptionListID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atSelectOptionsSelected`
--

CREATE TABLE `atSelectOptionsSelected` (
  `avID` int(10) UNSIGNED NOT NULL,
  `avSelectOptionID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atSelectSettings`
--

CREATE TABLE `atSelectSettings` (
  `akSelectAllowMultipleValues` tinyint(1) NOT NULL,
  `akSelectAllowOtherValues` tinyint(1) NOT NULL,
  `akSelectOptionDisplayOrder` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avSelectOptionListID` int(10) UNSIGNED DEFAULT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `atSelectSettings`
--

INSERT INTO `atSelectSettings` (`akSelectAllowMultipleValues`, `akSelectAllowOtherValues`, `akSelectOptionDisplayOrder`, `avSelectOptionListID`, `akID`) VALUES
(1, 1, 'display_asc', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `atSocialLinks`
--

CREATE TABLE `atSocialLinks` (
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atTextareaSettings`
--

CREATE TABLE `atTextareaSettings` (
  `akTextareaDisplayMode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `atTextareaSettings`
--

INSERT INTO `atTextareaSettings` (`akTextareaDisplayMode`, `akID`) VALUES
('', 2),
('text', 3),
('', 6),
('', 9);

-- --------------------------------------------------------

--
-- Table structure for table `atTextSettings`
--

CREATE TABLE `atTextSettings` (
  `akTextPlaceholder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `atTextSettings`
--

INSERT INTO `atTextSettings` (`akTextPlaceholder`, `akID`) VALUES
('', 1);

-- --------------------------------------------------------

--
-- Table structure for table `atTopic`
--

CREATE TABLE `atTopic` (
  `avID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `atTopic`
--

INSERT INTO `atTopic` (`avID`) VALUES
(208),
(213),
(216),
(236),
(261),
(264),
(269),
(273),
(277);

-- --------------------------------------------------------

--
-- Table structure for table `atTopicSettings`
--

CREATE TABLE `atTopicSettings` (
  `akTopicParentNodeID` int(11) NOT NULL,
  `akTopicTreeID` int(11) NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `atTopicSettings`
--

INSERT INTO `atTopicSettings` (`akTopicParentNodeID`, `akTopicTreeID`, `akID`) VALUES
(8, 4, 22);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeKeyCategories`
--

CREATE TABLE `AttributeKeyCategories` (
  `akCategoryID` int(10) UNSIGNED NOT NULL,
  `akCategoryHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `akCategoryAllowSets` int(11) NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `AttributeKeyCategories`
--

INSERT INTO `AttributeKeyCategories` (`akCategoryID`, `akCategoryHandle`, `akCategoryAllowSets`, `pkgID`) VALUES
(1, 'collection', 1, NULL),
(2, 'user', 1, NULL),
(3, 'file', 1, NULL),
(4, 'site', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeKeys`
--

CREATE TABLE `AttributeKeys` (
  `akID` int(10) UNSIGNED NOT NULL,
  `akHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `akName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `akIsSearchable` tinyint(1) NOT NULL,
  `akIsInternal` tinyint(1) NOT NULL,
  `akIsSearchableIndexed` tinyint(1) NOT NULL,
  `atID` int(10) UNSIGNED DEFAULT NULL,
  `akCategoryID` int(10) UNSIGNED DEFAULT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL,
  `akCategory` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `AttributeKeys`
--

INSERT INTO `AttributeKeys` (`akID`, `akHandle`, `akName`, `akIsSearchable`, `akIsInternal`, `akIsSearchableIndexed`, `atID`, `akCategoryID`, `pkgID`, `akCategory`) VALUES
(1, 'meta_title', 'Meta Title', 1, 0, 0, 1, 1, NULL, 'pagekey'),
(2, 'meta_description', 'Meta Description', 1, 0, 0, 2, 1, NULL, 'pagekey'),
(3, 'meta_keywords', 'Meta Keywords', 1, 0, 1, 2, 1, NULL, 'pagekey'),
(4, 'desktop_priority', 'Desktop Priority', 1, 1, 0, 6, 1, NULL, 'pagekey'),
(5, 'is_desktop', 'Is Desktop', 1, 1, 0, 3, 1, NULL, 'pagekey'),
(6, 'icon_dashboard', 'Dashboard Icon', 1, 1, 0, 2, 1, NULL, 'pagekey'),
(7, 'exclude_nav', 'Exclude From Nav', 1, 0, 0, 3, 1, NULL, 'pagekey'),
(8, 'exclude_page_list', 'Exclude From Page List', 1, 0, 0, 3, 1, NULL, 'pagekey'),
(9, 'header_extra_content', 'Header Extra Content', 1, 0, 0, 2, 1, NULL, 'pagekey'),
(10, 'tags', 'Tags', 1, 0, 1, 7, 1, NULL, 'pagekey'),
(11, 'is_featured', 'Is Featured', 1, 0, 0, 3, 1, NULL, 'pagekey'),
(12, 'exclude_search_index', 'Exclude From Search Index', 1, 0, 0, 3, 1, NULL, 'pagekey'),
(13, 'exclude_sitemapxml', 'Exclude From sitemap.xml', 1, 0, 0, 3, 1, NULL, 'pagekey'),
(14, 'profile_private_messages_enabled', 'I would like to receive private messages.', 1, 0, 0, 3, 2, NULL, 'userkey'),
(15, 'profile_private_messages_notification_enabled', 'Send me email notifications when I receive a private message.', 1, 0, 0, 3, 2, NULL, 'userkey'),
(16, 'width', 'Width', 1, 0, 0, 6, 3, NULL, 'filekey'),
(17, 'height', 'Height', 1, 0, 0, 6, 3, NULL, 'filekey'),
(18, 'account_profile_links', 'Personal Links', 1, 0, 0, 14, 2, NULL, 'userkey'),
(19, 'duration', 'Duration', 1, 0, 0, 6, 3, NULL, 'filekey'),
(20, 'thumbnail', 'Thumbnail', 0, 0, 0, 5, 1, NULL, 'pagekey'),
(21, 'micro_post', 'Micro Post', 1, 0, 1, 3, 1, NULL, 'pagekey'),
(22, 'post_topics', 'Post Topics', 1, 0, 1, 13, 1, NULL, 'pagekey');

-- --------------------------------------------------------

--
-- Table structure for table `AttributeSetKeys`
--

CREATE TABLE `AttributeSetKeys` (
  `asDisplayOrder` int(10) UNSIGNED NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL,
  `asID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `AttributeSetKeys`
--

INSERT INTO `AttributeSetKeys` (`asDisplayOrder`, `akID`, `asID`) VALUES
(0, 1, 1),
(1, 2, 1),
(0, 3, 3),
(1, 7, 2),
(2, 8, 2),
(2, 9, 1),
(4, 10, 2),
(0, 11, 2),
(3, 12, 2),
(3, 13, 1),
(1, 20, 3),
(2, 21, 3),
(3, 22, 3);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeSets`
--

CREATE TABLE `AttributeSets` (
  `asID` int(10) UNSIGNED NOT NULL,
  `asHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `asName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `asDisplayOrder` int(10) UNSIGNED NOT NULL,
  `asIsLocked` tinyint(1) NOT NULL,
  `akCategoryID` int(10) UNSIGNED DEFAULT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `AttributeSets`
--

INSERT INTO `AttributeSets` (`asID`, `asHandle`, `asName`, `asDisplayOrder`, `asIsLocked`, `akCategoryID`, `pkgID`) VALUES
(1, 'seo', 'SEO', 0, 0, 1, NULL),
(2, 'navigation', 'Navigation and Indexing', 0, 0, 1, NULL),
(3, 'bespoke', 'Bespoke', 0, 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeTypeCategories`
--

CREATE TABLE `AttributeTypeCategories` (
  `akCategoryID` int(10) UNSIGNED NOT NULL,
  `atID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `AttributeTypeCategories`
--

INSERT INTO `AttributeTypeCategories` (`akCategoryID`, `atID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 15),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 13),
(2, 14),
(2, 15),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 6),
(3, 7),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 15),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 13),
(4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeTypes`
--

CREATE TABLE `AttributeTypes` (
  `atID` int(10) UNSIGNED NOT NULL,
  `atHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `atName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `AttributeTypes`
--

INSERT INTO `AttributeTypes` (`atID`, `atHandle`, `atName`, `pkgID`) VALUES
(1, 'text', 'Text', NULL),
(2, 'textarea', 'Text Area', NULL),
(3, 'boolean', 'Checkbox', NULL),
(4, 'date_time', 'Date/Time', NULL),
(5, 'image_file', 'Image/File', NULL),
(6, 'number', 'Number', NULL),
(7, 'select', 'Select', NULL),
(8, 'address', 'Address', NULL),
(9, 'telephone', 'Phone Number', NULL),
(10, 'url', 'URL', NULL),
(11, 'email', 'Email', NULL),
(12, 'rating', 'Rating', NULL),
(13, 'topics', 'Topics', NULL),
(14, 'social_links', 'Social Links', NULL),
(15, 'express', 'Express Entity', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `AttributeValues`
--

CREATE TABLE `AttributeValues` (
  `avID` int(10) UNSIGNED NOT NULL,
  `akID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `AttributeValues`
--

INSERT INTO `AttributeValues` (`avID`, `akID`) VALUES
(205, 2),
(210, 2),
(211, 2),
(214, 2),
(232, 2),
(257, 2),
(262, 2),
(265, 2),
(270, 2),
(274, 2),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(17, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(38, 3),
(39, 3),
(40, 3),
(42, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 3),
(50, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(61, 3),
(62, 3),
(71, 3),
(72, 3),
(73, 3),
(74, 3),
(75, 3),
(76, 3),
(77, 3),
(78, 3),
(79, 3),
(80, 3),
(81, 3),
(82, 3),
(83, 3),
(84, 3),
(85, 3),
(86, 3),
(87, 3),
(88, 3),
(89, 3),
(90, 3),
(91, 3),
(92, 3),
(93, 3),
(94, 3),
(95, 3),
(96, 3),
(97, 3),
(98, 3),
(99, 3),
(100, 3),
(101, 3),
(102, 3),
(103, 3),
(104, 3),
(105, 3),
(106, 3),
(107, 3),
(108, 3),
(110, 3),
(111, 3),
(112, 3),
(113, 3),
(114, 3),
(115, 3),
(116, 3),
(233, 3),
(258, 3),
(266, 3),
(271, 3),
(275, 3),
(117, 4),
(124, 4),
(118, 5),
(125, 5),
(1, 6),
(41, 6),
(120, 6),
(121, 6),
(122, 6),
(123, 6),
(9, 7),
(16, 7),
(18, 7),
(24, 7),
(30, 7),
(31, 7),
(32, 7),
(33, 7),
(34, 7),
(35, 7),
(36, 7),
(37, 7),
(43, 7),
(51, 7),
(63, 7),
(65, 7),
(66, 7),
(67, 7),
(68, 7),
(69, 7),
(70, 7),
(119, 7),
(126, 7),
(25, 12),
(44, 12),
(64, 12),
(109, 12),
(187, 16),
(188, 17),
(206, 20),
(212, 20),
(215, 20),
(234, 20),
(259, 20),
(263, 20),
(267, 20),
(272, 20),
(276, 20),
(235, 21),
(268, 21),
(208, 22),
(213, 22),
(216, 22),
(236, 22),
(261, 22),
(264, 22),
(269, 22),
(273, 22),
(277, 22);

-- --------------------------------------------------------

--
-- Table structure for table `AuthenticationTypes`
--

CREATE TABLE `AuthenticationTypes` (
  `authTypeID` int(10) UNSIGNED NOT NULL,
  `authTypeHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `authTypeName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `authTypeIsEnabled` tinyint(1) NOT NULL,
  `authTypeDisplayOrder` int(10) UNSIGNED DEFAULT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `AuthenticationTypes`
--

INSERT INTO `AuthenticationTypes` (`authTypeID`, `authTypeHandle`, `authTypeName`, `authTypeIsEnabled`, `authTypeDisplayOrder`, `pkgID`) VALUES
(1, 'concrete', 'Standard', 1, 0, 0),
(2, 'community', 'concrete5.org', 0, 0, 0),
(3, 'facebook', 'Facebook', 0, 0, 0),
(4, 'twitter', 'Twitter', 0, 0, 0),
(5, 'google', 'Google', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `authTypeConcreteCookieMap`
--

CREATE TABLE `authTypeConcreteCookieMap` (
  `ID` int(10) UNSIGNED NOT NULL,
  `token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uID` int(11) DEFAULT NULL,
  `validThrough` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BannedWords`
--

CREATE TABLE `BannedWords` (
  `bwID` int(10) UNSIGNED NOT NULL,
  `bannedWord` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `BannedWords`
--

INSERT INTO `BannedWords` (`bwID`, `bannedWord`) VALUES
(1, 'fuck'),
(2, 'shit'),
(3, 'bitch'),
(4, 'ass');

-- --------------------------------------------------------

--
-- Table structure for table `BasicWorkflowPermissionAssignments`
--

CREATE TABLE `BasicWorkflowPermissionAssignments` (
  `wfID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BasicWorkflowProgressData`
--

CREATE TABLE `BasicWorkflowProgressData` (
  `wpID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uIDStarted` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uIDCompleted` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `wpDateCompleted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BlockFeatureAssignments`
--

CREATE TABLE `BlockFeatureAssignments` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `faID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BlockPermissionAssignments`
--

CREATE TABLE `BlockPermissionAssignments` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Blocks`
--

CREATE TABLE `Blocks` (
  `bID` int(10) UNSIGNED NOT NULL,
  `bName` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bDateAdded` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `bDateModified` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `bFilename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bIsActive` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `btID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `btCachedBlockRecord` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Blocks`
--

INSERT INTO `Blocks` (`bID`, `bName`, `bDateAdded`, `bDateModified`, `bFilename`, `bIsActive`, `btID`, `uID`, `btCachedBlockRecord`) VALUES
(1, '', '2017-05-22 15:59:59', '2017-05-22 15:59:59', NULL, '0', 6, 1, NULL),
(2, '', '2017-05-22 15:59:59', '2017-05-22 15:59:59', NULL, '0', 1, 1, NULL),
(3, '', '2017-05-22 15:59:59', '2017-05-22 15:59:59', NULL, '0', 11, 1, NULL),
(4, '', '2017-05-22 15:59:59', '2017-05-22 15:59:59', NULL, '0', 9, 1, NULL),
(5, '', '2017-05-22 15:59:59', '2017-05-22 15:59:59', NULL, '0', 8, 1, NULL),
(6, '', '2017-05-22 15:59:59', '2017-05-22 15:59:59', NULL, '0', 1, 1, NULL),
(7, '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', NULL, '0', 36, 1, NULL),
(8, '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', NULL, '0', 10, 1, NULL),
(9, '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', NULL, '0', 1, 1, NULL),
(10, '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', NULL, '0', 7, 1, NULL),
(11, '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', NULL, '0', 7, 1, NULL),
(12, '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', NULL, '0', 7, 1, NULL),
(13, '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', NULL, '0', 36, 1, NULL),
(14, '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', NULL, '0', 12, 1, NULL),
(15, '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', NULL, '0', 12, 1, NULL),
(16, '', '2017-05-22 16:00:01', '2017-05-22 16:00:01', NULL, '0', 2, 1, NULL),
(17, '', '2017-05-23 15:22:01', '2017-05-23 15:22:01', NULL, '0', 14, 1, NULL),
(18, '', '2017-05-23 15:22:20', '2017-05-23 15:22:20', NULL, '0', 14, 1, NULL),
(19, '', '2017-05-23 15:25:30', '2017-05-23 15:25:30', NULL, '0', 13, 1, NULL),
(20, '', '2017-05-23 15:25:57', '2017-05-23 15:25:57', NULL, '0', 13, 1, NULL),
(21, '', '2017-05-23 15:26:32', '2017-05-23 15:26:32', 'chris-watterston-header-navigation', '1', 13, 1, NULL),
(22, '', '2017-05-23 15:28:38', '2017-05-23 15:28:38', NULL, '0', 14, 1, NULL),
(23, '', '2017-05-23 15:29:24', '2017-05-23 15:29:24', NULL, '0', 14, 1, NULL),
(25, '', '2017-05-23 15:30:42', '2017-05-23 15:30:42', NULL, '0', 14, 1, NULL),
(27, '', '2017-05-23 15:30:55', '2017-05-23 15:30:55', NULL, '0', 14, 1, NULL),
(29, '', '2017-05-23 15:31:04', '2017-05-23 15:31:04', NULL, '0', 14, 1, NULL),
(31, '', '2017-05-23 15:31:17', '2017-05-23 15:31:17', NULL, '0', 14, 1, NULL),
(33, '', '2017-05-23 15:31:28', '2017-05-23 15:31:28', NULL, '0', 14, 1, NULL),
(35, '', '2017-05-23 15:32:36', '2017-05-23 15:32:36', NULL, '0', 14, 1, NULL),
(36, '', '2017-05-23 15:58:52', '2017-05-23 15:58:52', NULL, '1', 14, 1, NULL),
(37, '', '2017-05-23 15:59:25', '2017-05-23 15:59:25', NULL, '1', 14, 1, NULL),
(38, '', '2017-05-23 16:00:06', '2017-05-23 16:00:06', NULL, '1', 14, 1, NULL),
(39, '', '2017-05-23 16:10:16', '2017-05-23 16:10:16', NULL, '1', 14, 1, NULL),
(40, '', '2017-05-23 16:15:31', '2017-05-23 16:15:31', NULL, '1', 14, 1, NULL),
(41, '', '2017-05-23 16:16:31', '2017-05-23 16:16:31', NULL, '1', 14, 1, NULL),
(42, '', '2017-05-23 16:17:07', '2017-05-23 16:17:07', NULL, '1', 14, 1, NULL),
(43, '', '2017-05-23 16:39:10', '2017-05-23 16:39:10', NULL, '1', 14, 1, NULL),
(44, '', '2017-05-23 16:40:52', '2017-05-23 16:40:52', NULL, '1', 14, 1, NULL),
(45, '', '2017-05-23 16:41:36', '2017-05-23 16:41:36', NULL, '1', 14, 1, NULL),
(46, '', '2017-05-24 10:08:52', '2017-05-24 10:08:52', NULL, '0', 14, 1, NULL),
(47, '', '2017-05-24 10:09:39', '2017-05-24 10:09:39', NULL, '1', 14, 1, NULL),
(48, '', '2017-05-24 10:15:14', '2017-05-24 10:15:14', NULL, '0', 26, 1, NULL),
(49, '', '2017-05-24 10:15:14', '2017-05-24 10:15:14', NULL, '0', 26, 1, NULL),
(51, '', '2017-05-24 10:16:20', '2017-05-24 10:16:20', NULL, '0', 14, 1, NULL),
(52, '', '2017-05-24 10:16:42', '2017-05-24 10:16:42', NULL, '0', 30, 1, NULL),
(53, '', '2017-05-24 10:59:34', '2017-05-24 10:59:34', NULL, '0', 35, 1, NULL),
(54, '', '2017-05-24 11:03:55', '2017-05-24 11:03:55', NULL, '1', 35, 1, NULL),
(55, '', '2017-05-24 11:09:53', '2017-05-24 11:11:25', 'chris-watterston-latest-home', '1', 35, 1, NULL),
(56, '', '2017-05-25 08:06:20', '2017-05-25 08:06:20', 'chris-watterston-header-navigation', '1', 13, 1, NULL),
(57, '', '2017-05-25 08:58:51', '2017-05-25 08:58:51', NULL, '1', 14, 1, NULL),
(58, '', '2017-05-25 08:59:34', '2017-05-25 08:59:34', NULL, '1', 14, 1, NULL),
(59, '', '2017-05-25 08:59:52', '2017-05-25 08:59:52', NULL, '1', 14, 1, NULL),
(60, '', '2017-05-25 09:00:40', '2017-05-25 09:00:40', '', '1', 13, 1, NULL),
(61, '', '2017-05-25 09:01:15', '2017-05-25 09:01:15', '', '1', 13, 1, NULL),
(62, '', '2017-05-25 09:04:51', '2017-05-25 09:04:51', '', '1', 13, 1, NULL),
(63, '', '2017-05-25 10:12:22', '2017-05-25 10:12:22', 'chris-watterston-instagram', '1', 30, 1, NULL),
(64, '', '2017-05-25 10:12:58', '2017-05-25 10:12:58', 'chris-watterston-instagram', '1', 30, 1, NULL),
(65, '', '2017-05-25 11:00:37', '2017-05-25 11:00:37', NULL, '1', 26, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `BlockTypePermissionBlockTypeAccessList`
--

CREATE TABLE `BlockTypePermissionBlockTypeAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `permission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BlockTypePermissionBlockTypeAccessListCustom`
--

CREATE TABLE `BlockTypePermissionBlockTypeAccessListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `btID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `BlockTypes`
--

CREATE TABLE `BlockTypes` (
  `btIgnorePageThemeGridFrameworkContainer` tinyint(1) NOT NULL,
  `btID` int(11) NOT NULL,
  `btHandle` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `btName` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `btDescription` longtext COLLATE utf8_unicode_ci NOT NULL,
  `btCopyWhenPropagate` tinyint(1) NOT NULL,
  `btIncludeAll` tinyint(1) NOT NULL,
  `btIsInternal` tinyint(1) NOT NULL,
  `btSupportsInlineEdit` tinyint(1) NOT NULL,
  `btSupportsInlineAdd` tinyint(1) NOT NULL,
  `btDisplayOrder` int(11) NOT NULL,
  `btInterfaceHeight` int(11) NOT NULL,
  `btInterfaceWidth` int(11) NOT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `BlockTypes`
--

INSERT INTO `BlockTypes` (`btIgnorePageThemeGridFrameworkContainer`, `btID`, `btHandle`, `btName`, `btDescription`, `btCopyWhenPropagate`, `btIncludeAll`, `btIsInternal`, `btSupportsInlineEdit`, `btSupportsInlineAdd`, `btDisplayOrder`, `btInterfaceHeight`, `btInterfaceWidth`, `pkgID`) VALUES
(0, 1, 'core_area_layout', 'Area Layout', 'Proxy block for area layouts.', 0, 0, 1, 1, 1, 0, 400, 400, 0),
(0, 2, 'core_page_type_composer_control_output', 'Composer Control', 'Proxy block for blocks that need to be output through composer.', 0, 0, 1, 0, 0, 0, 400, 400, 0),
(0, 3, 'core_scrapbook_display', 'Scrapbook Display', 'Proxy block for blocks pasted through the scrapbook.', 0, 0, 1, 0, 0, 0, 400, 400, 0),
(0, 4, 'core_stack_display', 'Stack Display', 'Proxy block for stacks added through the UI.', 0, 0, 1, 0, 0, 0, 400, 400, 0),
(0, 5, 'core_conversation', 'Conversation', 'Displays conversations on a page.', 1, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 6, 'desktop_app_status', 'concrete5 Status Messages', 'Displays alerts about your concrete5 site and package updates.', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 7, 'desktop_newsflow_latest', 'Dashboard Newsflow Latest', 'Grabs the latest newsflow data from concrete5.org.', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 8, 'desktop_site_activity', 'Site Activity', 'Displays a graph of recent activity on your site.', 0, 0, 0, 0, 0, 0, 560, 450, 0),
(0, 9, 'desktop_featured_addon', 'Dashboard Featured Add-On', 'Features an add-on from concrete5.org.', 0, 0, 0, 0, 0, 0, 100, 300, 0),
(0, 10, 'desktop_featured_theme', 'Dashboard Featured Theme', 'Features a theme from concrete5.org.', 0, 0, 0, 0, 0, 0, 100, 300, 0),
(0, 11, 'desktop_latest_form', 'Latest Form', 'Shows the latest form submission.', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 12, 'desktop_waiting_for_me', 'Waiting for Me', 'Displays workflow actions waiting for you.', 0, 0, 0, 0, 0, 0, 560, 450, 0),
(0, 13, 'autonav', 'Auto-Nav', 'Creates navigation trees and sitemaps.', 0, 0, 0, 0, 0, 0, 350, 800, 0),
(0, 14, 'content', 'Content', 'HTML/WYSIWYG Editor Content.', 0, 0, 0, 1, 1, 0, 465, 600, 0),
(0, 15, 'date_navigation', 'Date Navigation', 'Displays a list of months to filter a page list by.', 0, 0, 0, 0, 0, 0, 450, 400, 0),
(0, 16, 'external_form', 'External Form', 'Include external forms in the filesystem and place them on pages.', 0, 0, 0, 0, 0, 0, 175, 370, 0),
(0, 17, 'file', 'File', 'Link to files stored in the asset library.', 0, 0, 0, 0, 0, 0, 320, 300, 0),
(0, 18, 'page_attribute_display', 'Page Attribute Display', 'Displays the value of a page attribute for the current page.', 0, 0, 0, 0, 0, 0, 365, 500, 0),
(0, 19, 'express_entry_list', 'Express Entry List', 'Add a searchable Express entry list to a page.', 0, 0, 0, 0, 0, 0, 400, 640, 0),
(0, 20, 'express_entry_detail', 'Express Entry Detail', 'Add an Express entry detail display to a page.', 0, 0, 0, 0, 0, 0, 400, 640, 0),
(0, 21, 'express_form', 'Form', 'Build simple forms and surveys.', 0, 0, 0, 0, 0, 0, 480, 640, 0),
(0, 22, 'form', 'Legacy Form', 'Build simple forms and surveys.', 1, 0, 0, 0, 0, 0, 430, 420, 0),
(0, 23, 'page_title', 'Page Title', 'Displays a Page\'s Title', 0, 0, 0, 0, 0, 0, 500, 470, 0),
(0, 24, 'feature', 'Feature', 'Displays an icon, a title, and a short paragraph description.', 0, 0, 0, 0, 0, 0, 520, 400, 0),
(0, 25, 'topic_list', 'Topic List', 'Displays a list of your site\'s topics, allowing you to click on them to filter a page list.', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 26, 'social_links', 'Social Links', 'Allows users to add social icons to their website', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 27, 'testimonial', 'Testimonial', 'Displays a quote or paragraph next to biographical information and a person\'s picture.', 0, 0, 0, 0, 0, 0, 560, 450, 0),
(0, 28, 'share_this_page', 'Share This Page', 'Allows users to share this page with social networks.', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 29, 'google_map', 'Google Map', 'Enter an address and a Google Map of that location will be placed in your page.', 0, 0, 0, 0, 0, 0, 460, 400, 0),
(1, 30, 'html', 'HTML', 'For adding HTML by hand.', 0, 0, 0, 0, 0, 0, 500, 600, 0),
(1, 31, 'horizontal_rule', 'Horizontal Rule', 'Adds a thin hairline horizontal divider to the page.', 0, 0, 0, 0, 0, 0, 400, 400, 0),
(0, 32, 'image', 'Image', 'Adds images and onstates from the library to pages.', 0, 0, 0, 0, 0, 0, 550, 400, 0),
(0, 33, 'faq', 'FAQ', 'Frequently Asked Questions Block', 0, 0, 0, 0, 0, 0, 465, 600, 0),
(0, 34, 'next_previous', 'Next & Previous Nav', 'Navigate through sibling pages.', 0, 0, 0, 0, 0, 0, 400, 430, 0),
(0, 35, 'page_list', 'Page List', 'List pages based on type, area.', 0, 0, 0, 0, 0, 0, 350, 800, 0),
(0, 36, 'rss_displayer', 'RSS Displayer', 'Fetch, parse and display the contents of an RSS or Atom feed.', 0, 0, 0, 0, 0, 0, 550, 400, 0),
(0, 37, 'search', 'Search', 'Add a search box to your site.', 0, 0, 0, 0, 0, 0, 420, 400, 0),
(1, 38, 'image_slider', 'Image Slider', 'Display your images and captions in an attractive slideshow format.', 0, 0, 0, 0, 0, 0, 550, 600, 0),
(0, 39, 'survey', 'Survey', 'Provide a simple survey, along with results in a pie chart format.', 0, 0, 0, 0, 0, 0, 400, 420, 0),
(0, 40, 'switch_language', 'Switch Language', 'Adds a front-end language switcher to your website.', 0, 0, 0, 0, 0, 0, 150, 500, 0),
(0, 41, 'tags', 'Tags', 'List pages based on type, area.', 0, 0, 0, 0, 0, 0, 439, 450, 0),
(0, 42, 'video', 'Video Player', 'Embeds uploaded video into a web page. Supports WebM, Ogg, and Quicktime/MPEG4 formats.', 0, 0, 0, 0, 0, 0, 270, 320, 0),
(0, 43, 'youtube', 'YouTube Video', 'Embeds a YouTube Video in your web page.', 0, 0, 0, 0, 0, 0, 490, 400, 0);

-- --------------------------------------------------------

--
-- Table structure for table `BlockTypeSetBlockTypes`
--

CREATE TABLE `BlockTypeSetBlockTypes` (
  `btID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `btsID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `displayOrder` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `BlockTypeSetBlockTypes`
--

INSERT INTO `BlockTypeSetBlockTypes` (`btID`, `btsID`, `displayOrder`) VALUES
(14, 1, 0),
(30, 1, 1),
(32, 1, 2),
(17, 1, 3),
(31, 1, 4),
(24, 1, 5),
(13, 2, 0),
(23, 2, 1),
(33, 2, 2),
(35, 2, 3),
(34, 2, 4),
(15, 2, 5),
(41, 2, 6),
(25, 2, 7),
(36, 2, 8),
(40, 2, 9),
(21, 3, 0),
(37, 3, 1),
(16, 3, 2),
(19, 4, 0),
(20, 4, 1),
(39, 5, 0),
(5, 5, 1),
(26, 5, 2),
(27, 5, 3),
(28, 5, 4),
(18, 6, 0),
(38, 6, 1),
(42, 6, 2),
(43, 6, 3),
(29, 6, 4),
(6, 7, 0),
(8, 7, 1),
(9, 7, 2),
(10, 7, 3),
(11, 7, 4),
(12, 7, 5),
(7, 7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `BlockTypeSets`
--

CREATE TABLE `BlockTypeSets` (
  `btsID` int(10) UNSIGNED NOT NULL,
  `btsName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `btsHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `btsDisplayOrder` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `BlockTypeSets`
--

INSERT INTO `BlockTypeSets` (`btsID`, `btsName`, `btsHandle`, `pkgID`, `btsDisplayOrder`) VALUES
(1, 'Basic', 'basic', 0, 0),
(2, 'Navigation', 'navigation', 0, 0),
(3, 'Forms', 'form', 0, 0),
(4, 'Express', 'express', 0, 0),
(5, 'Social Networking', 'social', 0, 0),
(6, 'Multimedia', 'multimedia', 0, 0),
(7, 'Desktop', 'core_desktop', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `btContentFile`
--

CREATE TABLE `btContentFile` (
  `bID` int(10) UNSIGNED NOT NULL,
  `fID` int(10) UNSIGNED DEFAULT NULL,
  `fileLinkText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filePassword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forceDownload` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btContentImage`
--

CREATE TABLE `btContentImage` (
  `bID` int(10) UNSIGNED NOT NULL,
  `fID` int(10) UNSIGNED DEFAULT '0',
  `fOnstateID` int(10) UNSIGNED DEFAULT '0',
  `maxWidth` int(10) UNSIGNED DEFAULT '0',
  `maxHeight` int(10) UNSIGNED DEFAULT '0',
  `externalLink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `internalLinkCID` int(10) UNSIGNED DEFAULT '0',
  `altText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btContentLocal`
--

CREATE TABLE `btContentLocal` (
  `bID` int(10) UNSIGNED NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `btContentLocal`
--

INSERT INTO `btContentLocal` (`bID`, `content`) VALUES
(17, '<ul>\r\n	<li><a href="#">become a client</a></li>\r\n	<li><a href="#">let&rsquo;s talk?</a></li>\r\n</ul>\r\n'),
(18, '<p>Copyright &copy; 2017 Chris Watterston. All rights reserved.</p>\r\n'),
(22, '<p>Yeh, I&rsquo;m a trusted and flexible geek who&rsquo;s passionate about my family and the design &amp; building of your</p>\r\n'),
(23, '<h1>websites | mobile apps</h1>\r\n'),
(25, ''),
(27, ''),
(29, ''),
(31, ''),
(33, ''),
(35, ''),
(36, '<h3>Yeh, I&rsquo;m a trusted and flexible geek who&rsquo;s passionate about my family and the design &amp; building of your</h3>\r\n'),
(37, '<h2>Yeh, I&rsquo;m a trusted and flexible geek who&rsquo;s passionate about my family and the design &amp; building of your</h2>\r\n'),
(38, '<h2 class="colour-white type-light">Yeh, I&rsquo;m a trusted and flexible geek who&rsquo;s passionate about my family and the design &amp; building of your</h2>\r\n'),
(39, '<h1 class="colour-white type-semibold type-uppercase">Websites | Mobile Apps</h1>\r\n'),
(40, '<h1 class="colour-white type-semibold type-uppercase">Websites <span class="type-ampersand">&amp;</span> Mobile Apps</h1>\r\n'),
(41, '<h1 class="colour-white type-semibold type-uppercase">Websites <span class="type-ampersand colour-lime">&amp;</span> Mobile Apps</h1>\r\n'),
(42, '<h1 class="colour-white type-semibold type-uppercase">Websites <span class="type-ampersand">&amp;</span> Mobile Apps</h1>\r\n'),
(43, '<h1 class="colour-white type-semibold type-uppercase">Websites <b class="type-ampersand">&amp;</b> Mobile Apps</h1>\r\n'),
(44, '<h1 class="colour-white type-semibold type-uppercase">Websites</h1>\r\n\r\n<div class="type-ampersand">&amp;</div>\r\n\r\n<p>Mobile Apps</p>\r\n'),
(45, '<h1 class="colour-white type-semibold type-uppercase">Websites <em class="type-ampersand">&amp;</em> Mobile Apps</h1>\r\n'),
(46, '<h1 class="colour-white type-semibold type-uppercase">Contact.</h1>\r\n'),
(47, '<h1 class="colour-white type-semibold type-uppercase">Contact.</h1>\r\n'),
(51, '<h1 class="colour-white type-semibold type-uppercase">Instagram.</h1>\r\n'),
(52, 'Instagram feed here...'),
(57, '<ul>\r\n	<li><a class="colour-white type-lowercase type-semibold family-table" href="#">become a client</a></li>\r\n	<li><a class="colour-white type-lowercase type-semibold family-table" href="#">let&rsquo;s talk?</a></li>\r\n</ul>\r\n'),
(58, '<p class="colour-white type-lowercase type-semibold family-table">Copyright &copy; 2017 Chris Watterston. All rights reserved.</p>\r\n'),
(59, '<p class="colour-white family-table">Copyright &copy; 2017 Chris Watterston. All rights reserved.</p>\r\n'),
(63, 'Instagram feed here...'),
(64, 'Instagram feed here...');

-- --------------------------------------------------------

--
-- Table structure for table `btCoreAreaLayout`
--

CREATE TABLE `btCoreAreaLayout` (
  `bID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arLayoutID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `btCoreAreaLayout`
--

INSERT INTO `btCoreAreaLayout` (`bID`, `arLayoutID`) VALUES
(2, 1),
(6, 2),
(9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `btCoreConversation`
--

CREATE TABLE `btCoreConversation` (
  `bID` int(10) UNSIGNED NOT NULL,
  `cnvID` int(11) DEFAULT NULL,
  `enablePosting` int(11) DEFAULT '1',
  `paginate` tinyint(1) NOT NULL DEFAULT '1',
  `itemsPerPage` smallint(5) UNSIGNED NOT NULL DEFAULT '50',
  `displayMode` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'threaded',
  `orderBy` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'date_desc',
  `enableOrdering` tinyint(1) NOT NULL DEFAULT '1',
  `enableCommentRating` tinyint(1) NOT NULL DEFAULT '1',
  `displayPostingForm` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'top',
  `addMessageLabel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dateFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'default',
  `customDateFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btCorePageTypeComposerControlOutput`
--

CREATE TABLE `btCorePageTypeComposerControlOutput` (
  `bID` int(10) UNSIGNED NOT NULL,
  `ptComposerOutputControlID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `btCorePageTypeComposerControlOutput`
--

INSERT INTO `btCorePageTypeComposerControlOutput` (`bID`, `ptComposerOutputControlID`) VALUES
(16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `btCoreScrapbookDisplay`
--

CREATE TABLE `btCoreScrapbookDisplay` (
  `bID` int(10) UNSIGNED NOT NULL,
  `bOriginalID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btCoreStackDisplay`
--

CREATE TABLE `btCoreStackDisplay` (
  `bID` int(10) UNSIGNED NOT NULL,
  `stID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btDateNavigation`
--

CREATE TABLE `btDateNavigation` (
  `bID` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filterByParent` tinyint(1) DEFAULT '0',
  `redirectToResults` tinyint(1) DEFAULT '0',
  `cParentID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cTargetID` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'this field is where the links will direct you',
  `ptID` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btDesktopNewsflowLatest`
--

CREATE TABLE `btDesktopNewsflowLatest` (
  `bID` int(10) UNSIGNED NOT NULL,
  `slot` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `btDesktopNewsflowLatest`
--

INSERT INTO `btDesktopNewsflowLatest` (`bID`, `slot`) VALUES
(10, 'A'),
(11, 'B'),
(12, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `btDesktopSiteActivity`
--

CREATE TABLE `btDesktopSiteActivity` (
  `bID` int(10) UNSIGNED NOT NULL,
  `types` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `btDesktopSiteActivity`
--

INSERT INTO `btDesktopSiteActivity` (`bID`, `types`) VALUES
(5, '["form_submissions","survey_results","signups","conversation_messages","workflow"]');

-- --------------------------------------------------------

--
-- Table structure for table `btExpressEntryDetail`
--

CREATE TABLE `btExpressEntryDetail` (
  `bID` int(10) UNSIGNED NOT NULL,
  `exEntityID` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `exSpecificEntryID` int(10) UNSIGNED NOT NULL,
  `exEntryAttributeKeyHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exFormID` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `entryMode` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btExpressEntryList`
--

CREATE TABLE `btExpressEntryList` (
  `bID` int(10) UNSIGNED NOT NULL,
  `exEntityID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detailPage` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `linkedProperties` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `searchProperties` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `columns` longtext COLLATE utf8_unicode_ci,
  `displayLimit` int(11) DEFAULT '20',
  `enableSearch` int(11) DEFAULT '0',
  `enableKeywordSearch` int(11) DEFAULT '0',
  `headerBackgroundColor` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  `headerBackgroundColorActiveSort` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  `headerTextColor` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  `tableName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `tableDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `tableStriped` tinyint(1) DEFAULT '0',
  `rowBackgroundColorAlternate` varchar(32) COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btExpressForm`
--

CREATE TABLE `btExpressForm` (
  `bID` int(10) UNSIGNED NOT NULL,
  `exFormID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `submitLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Submit',
  `thankyouMsg` text COLLATE utf8_unicode_ci,
  `notifyMeOnSubmission` tinyint(1) NOT NULL DEFAULT '0',
  `recipientEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayCaptcha` int(11) DEFAULT '1',
  `redirectCID` int(11) DEFAULT '0',
  `replyToEmailControlID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addFilesToSet` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btExternalForm`
--

CREATE TABLE `btExternalForm` (
  `bID` int(10) UNSIGNED NOT NULL,
  `filename` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btFaq`
--

CREATE TABLE `btFaq` (
  `bID` int(10) UNSIGNED NOT NULL,
  `blockTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btFaqEntries`
--

CREATE TABLE `btFaqEntries` (
  `id` int(10) UNSIGNED NOT NULL,
  `bID` int(10) UNSIGNED DEFAULT NULL,
  `linkTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btFeature`
--

CREATE TABLE `btFeature` (
  `bID` int(10) UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paragraph` text COLLATE utf8_unicode_ci,
  `externalLink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `internalLinkCID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btForm`
--

CREATE TABLE `btForm` (
  `bID` int(10) UNSIGNED NOT NULL,
  `questionSetId` int(10) UNSIGNED DEFAULT '0',
  `surveyName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submitText` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Submit',
  `thankyouMsg` text COLLATE utf8_unicode_ci,
  `notifyMeOnSubmission` tinyint(1) NOT NULL DEFAULT '0',
  `recipientEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayCaptcha` int(11) DEFAULT '1',
  `redirectCID` int(11) DEFAULT '0',
  `addFilesToSet` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btFormAnswers`
--

CREATE TABLE `btFormAnswers` (
  `aID` int(10) UNSIGNED NOT NULL,
  `asID` int(10) UNSIGNED DEFAULT '0',
  `msqID` int(10) UNSIGNED DEFAULT '0',
  `answer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `answerLong` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btFormAnswerSet`
--

CREATE TABLE `btFormAnswerSet` (
  `asID` int(10) UNSIGNED NOT NULL,
  `questionSetId` int(10) UNSIGNED DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btFormQuestions`
--

CREATE TABLE `btFormQuestions` (
  `qID` int(10) UNSIGNED NOT NULL,
  `msqID` int(10) UNSIGNED DEFAULT '0',
  `bID` int(10) UNSIGNED DEFAULT '0',
  `questionSetId` int(10) UNSIGNED DEFAULT '0',
  `question` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inputType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci,
  `position` int(10) UNSIGNED DEFAULT '1000',
  `width` int(10) UNSIGNED DEFAULT '50',
  `height` int(10) UNSIGNED DEFAULT '3',
  `defaultDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `required` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btGoogleMap`
--

CREATE TABLE `btGoogleMap` (
  `bID` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `zoom` smallint(6) DEFAULT NULL,
  `width` varchar(8) COLLATE utf8_unicode_ci DEFAULT '100%',
  `height` varchar(8) COLLATE utf8_unicode_ci DEFAULT '400px',
  `scrollwheel` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btImageSlider`
--

CREATE TABLE `btImageSlider` (
  `bID` int(10) UNSIGNED NOT NULL,
  `navigationType` int(10) UNSIGNED DEFAULT '0',
  `timeout` int(10) UNSIGNED DEFAULT NULL,
  `speed` int(10) UNSIGNED DEFAULT NULL,
  `noAnimate` int(10) UNSIGNED DEFAULT NULL,
  `pause` int(10) UNSIGNED DEFAULT NULL,
  `maxWidth` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btImageSliderEntries`
--

CREATE TABLE `btImageSliderEntries` (
  `id` int(10) UNSIGNED NOT NULL,
  `bID` int(10) UNSIGNED DEFAULT NULL,
  `cID` int(10) UNSIGNED DEFAULT '0',
  `fID` int(10) UNSIGNED DEFAULT '0',
  `linkURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `internalLinkCID` int(10) UNSIGNED DEFAULT '0',
  `title` longtext COLLATE utf8_unicode_ci,
  `description` longtext COLLATE utf8_unicode_ci,
  `sortOrder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btNavigation`
--

CREATE TABLE `btNavigation` (
  `bID` int(10) UNSIGNED NOT NULL,
  `orderBy` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'alpha_asc',
  `displayPages` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'top' COMMENT 'was enum(''top'',''current'',''above'',''below'',''custom'')',
  `displayPagesCID` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `displayPagesIncludeSelf` tinyint(1) NOT NULL DEFAULT '0',
  `displaySubPages` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'none' COMMENT 'was enum(''none'',''all'',''relevant'',''relevant_breadcrumb'')',
  `displaySubPageLevels` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'none' COMMENT 'was enum(''all'',''none'',''enough'',''enough_plus1'',''custom'')',
  `displaySubPageLevelsNum` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `displayUnavailablePages` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `btNavigation`
--

INSERT INTO `btNavigation` (`bID`, `orderBy`, `displayPages`, `displayPagesCID`, `displayPagesIncludeSelf`, `displaySubPages`, `displaySubPageLevels`, `displaySubPageLevelsNum`, `displayUnavailablePages`) VALUES
(19, 'display_asc', 'top', 0, 0, 'none', 'enough', 0, 0),
(20, 'display_asc', 'top', 0, 0, 'none', 'enough', 0, 0),
(21, 'display_asc', 'top', 0, 0, 'none', 'enough', 0, 0),
(56, 'display_asc', 'top', 0, 0, 'none', 'enough', 0, 0),
(60, 'display_asc', 'top', 0, 0, 'none', 'enough', 0, 0),
(61, 'display_asc', 'top', 0, 0, 'none', 'enough', 0, 0),
(62, 'display_asc', 'top', 0, 0, 'none', 'enough', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `btNextPrevious`
--

CREATE TABLE `btNextPrevious` (
  `bID` int(10) UNSIGNED NOT NULL,
  `nextLabel` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `previousLabel` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentLabel` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loopSequence` int(11) DEFAULT '1',
  `orderBy` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'display_asc'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btPageAttributeDisplay`
--

CREATE TABLE `btPageAttributeDisplay` (
  `bID` int(10) UNSIGNED NOT NULL,
  `attributeHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attributeTitleText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayTag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateFormat` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'div',
  `thumbnailHeight` int(10) UNSIGNED DEFAULT NULL,
  `thumbnailWidth` int(10) UNSIGNED DEFAULT NULL,
  `delimiter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btPageList`
--

CREATE TABLE `btPageList` (
  `bID` int(10) UNSIGNED NOT NULL,
  `num` smallint(5) UNSIGNED NOT NULL,
  `orderBy` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Was enum, display_asc'',''display_desc'',''chrono_asc'',''chrono_desc'',''alpha_asc'',''alpha_desc'',''score_asc'',''score_desc''',
  `cParentID` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `cThis` tinyint(1) NOT NULL DEFAULT '0',
  `cThisParent` tinyint(1) NOT NULL DEFAULT '0',
  `useButtonForLink` tinyint(1) NOT NULL DEFAULT '0',
  `buttonLinkText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pageListTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filterByRelated` tinyint(1) NOT NULL DEFAULT '0',
  `filterByCustomTopic` tinyint(1) NOT NULL DEFAULT '0',
  `filterDateOption` varchar(25) COLLATE utf8_unicode_ci DEFAULT 'all' COMMENT '(''all'',''today'',''past'',''future'',''between'')',
  `filterDateDays` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `filterDateStart` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filterDateEnd` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relatedTopicAttributeKeyHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customTopicAttributeKeyHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customTopicTreeNodeID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `includeName` tinyint(1) NOT NULL DEFAULT '1',
  `includeDescription` tinyint(1) NOT NULL DEFAULT '1',
  `includeDate` tinyint(1) NOT NULL DEFAULT '0',
  `includeAllDescendents` tinyint(1) NOT NULL DEFAULT '0',
  `paginate` tinyint(1) NOT NULL DEFAULT '0',
  `displayAliases` tinyint(1) NOT NULL DEFAULT '1',
  `ignorePermissions` tinyint(1) NOT NULL DEFAULT '0',
  `enableExternalFiltering` tinyint(1) NOT NULL DEFAULT '0',
  `ptID` smallint(5) UNSIGNED DEFAULT NULL,
  `pfID` int(11) DEFAULT '0',
  `truncateSummaries` int(11) DEFAULT '0',
  `displayFeaturedOnly` tinyint(1) DEFAULT '0',
  `noResultsMessage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayThumbnail` tinyint(1) DEFAULT '0',
  `truncateChars` int(11) DEFAULT '128'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `btPageList`
--

INSERT INTO `btPageList` (`bID`, `num`, `orderBy`, `cParentID`, `cThis`, `cThisParent`, `useButtonForLink`, `buttonLinkText`, `pageListTitle`, `filterByRelated`, `filterByCustomTopic`, `filterDateOption`, `filterDateDays`, `filterDateStart`, `filterDateEnd`, `relatedTopicAttributeKeyHandle`, `customTopicAttributeKeyHandle`, `customTopicTreeNodeID`, `includeName`, `includeDescription`, `includeDate`, `includeAllDescendents`, `paginate`, `displayAliases`, `ignorePermissions`, `enableExternalFiltering`, `ptID`, `pfID`, `truncateSummaries`, `displayFeaturedOnly`, `noResultsMessage`, `displayThumbnail`, `truncateChars`) VALUES
(53, 3, 'chrono_desc', 0, 0, 1, 0, '', '', 0, 0, '', 0, NULL, NULL, '', '', 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 1, 200),
(54, 3, 'chrono_desc', 0, 0, 1, 0, '', '', 0, 1, '', 0, NULL, NULL, '', 'post_topics', 26, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 1, 200),
(55, 3, 'chrono_desc', 0, 0, 1, 0, '', '', 0, 1, '', 0, NULL, NULL, '', 'post_topics', 26, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, '', 1, 200);

-- --------------------------------------------------------

--
-- Table structure for table `btPageTitle`
--

CREATE TABLE `btPageTitle` (
  `bID` int(10) UNSIGNED NOT NULL,
  `useCustomTitle` int(10) UNSIGNED DEFAULT '0',
  `useFilterTitle` int(10) UNSIGNED DEFAULT '0',
  `useFilterTopic` int(10) UNSIGNED DEFAULT '0',
  `useFilterTag` int(10) UNSIGNED DEFAULT '0',
  `useFilterDate` int(10) UNSIGNED DEFAULT '0',
  `topicTextFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tagTextFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateTextFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filterDateFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleText` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formatting` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btRssDisplay`
--

CREATE TABLE `btRssDisplay` (
  `bID` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateFormat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemsToDisplay` int(10) UNSIGNED DEFAULT '5',
  `showSummary` tinyint(1) NOT NULL DEFAULT '1',
  `launchInNewWindow` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `btRssDisplay`
--

INSERT INTO `btRssDisplay` (`bID`, `title`, `url`, `dateFormat`, `itemsToDisplay`, `showSummary`, `launchInNewWindow`) VALUES
(7, 'Tutorials', 'http://documentation.concrete5.org/rss/tutorials', '', 1, 1, 1),
(13, 'News from concrete5.org', 'http://www.concrete5.org/rss/blog', '', 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `btSearch`
--

CREATE TABLE `btSearch` (
  `bID` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buttonText` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baseSearchPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postTo_cID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resultsURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btShareThisPage`
--

CREATE TABLE `btShareThisPage` (
  `btShareThisPageID` int(10) UNSIGNED NOT NULL,
  `bID` int(10) UNSIGNED DEFAULT '0',
  `service` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayOrder` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btSocialLinks`
--

CREATE TABLE `btSocialLinks` (
  `btSocialLinkID` int(10) UNSIGNED NOT NULL,
  `bID` int(10) UNSIGNED DEFAULT '0',
  `slID` int(10) UNSIGNED DEFAULT '0',
  `displayOrder` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `btSocialLinks`
--

INSERT INTO `btSocialLinks` (`btSocialLinkID`, `bID`, `slID`, `displayOrder`) VALUES
(1, 48, 2, 0),
(2, 48, 1, 1),
(3, 48, 3, 2),
(4, 48, 4, 3),
(5, 48, 5, 4),
(6, 49, 2, 0),
(7, 49, 1, 1),
(8, 49, 3, 2),
(9, 49, 4, 3),
(10, 49, 5, 4),
(21, 65, 2, 0),
(22, 65, 1, 1),
(23, 65, 3, 2),
(24, 65, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `btSurvey`
--

CREATE TABLE `btSurvey` (
  `bID` int(10) UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `requiresRegistration` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btSurveyOptions`
--

CREATE TABLE `btSurveyOptions` (
  `optionID` int(10) UNSIGNED NOT NULL,
  `bID` int(11) DEFAULT NULL,
  `optionName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayOrder` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btSurveyResults`
--

CREATE TABLE `btSurveyResults` (
  `resultID` int(10) UNSIGNED NOT NULL,
  `optionID` int(10) UNSIGNED DEFAULT '0',
  `uID` int(10) UNSIGNED DEFAULT '0',
  `bID` int(11) DEFAULT NULL,
  `cID` int(11) DEFAULT NULL,
  `ipAddress` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btSwitchLanguage`
--

CREATE TABLE `btSwitchLanguage` (
  `bID` int(10) UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btTags`
--

CREATE TABLE `btTags` (
  `bID` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetCID` int(11) DEFAULT NULL,
  `displayMode` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'page',
  `cloudCount` int(11) DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btTestimonial`
--

CREATE TABLE `btTestimonial` (
  `bID` int(10) UNSIGNED NOT NULL,
  `fID` int(10) UNSIGNED DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paragraph` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btTopicList`
--

CREATE TABLE `btTopicList` (
  `bID` int(10) UNSIGNED NOT NULL,
  `mode` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S' COMMENT 'S = Search, P = Page',
  `topicAttributeKeyHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `topicTreeID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cParentID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btVideo`
--

CREATE TABLE `btVideo` (
  `bID` int(10) UNSIGNED NOT NULL,
  `webmfID` int(10) UNSIGNED DEFAULT '0',
  `oggfID` int(10) UNSIGNED DEFAULT '0',
  `posterfID` int(10) UNSIGNED DEFAULT '0',
  `mp4fID` int(10) UNSIGNED DEFAULT '0',
  `width` int(10) UNSIGNED DEFAULT NULL,
  `height` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `btYouTube`
--

CREATE TABLE `btYouTube` (
  `bID` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `videoURL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vHeight` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vWidth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sizing` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autoplay` tinyint(1) NOT NULL DEFAULT '0',
  `color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controls` int(10) UNSIGNED DEFAULT NULL,
  `iv_load_policy` int(10) UNSIGNED DEFAULT NULL,
  `loopEnd` tinyint(1) NOT NULL DEFAULT '0',
  `modestbranding` tinyint(1) NOT NULL DEFAULT '0',
  `rel` tinyint(1) NOT NULL DEFAULT '0',
  `showinfo` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CollectionAttributeKeys`
--

CREATE TABLE `CollectionAttributeKeys` (
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `CollectionAttributeKeys`
--

INSERT INTO `CollectionAttributeKeys` (`akID`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(20),
(21),
(22);

-- --------------------------------------------------------

--
-- Table structure for table `CollectionAttributeValues`
--

CREATE TABLE `CollectionAttributeValues` (
  `cID` int(10) UNSIGNED NOT NULL,
  `cvID` int(10) UNSIGNED NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `CollectionAttributeValues`
--

INSERT INTO `CollectionAttributeValues` (`cID`, `cvID`, `akID`, `avID`) VALUES
(2, 1, 6, 1),
(3, 1, 3, 2),
(4, 1, 3, 3),
(5, 1, 3, 4),
(6, 1, 3, 5),
(8, 1, 3, 6),
(9, 1, 3, 7),
(10, 1, 3, 8),
(11, 1, 7, 9),
(11, 1, 3, 10),
(12, 1, 3, 11),
(13, 1, 3, 12),
(14, 1, 3, 13),
(15, 1, 3, 14),
(16, 1, 3, 15),
(16, 1, 7, 16),
(17, 1, 3, 17),
(17, 1, 7, 18),
(19, 1, 3, 19),
(20, 1, 3, 20),
(22, 1, 3, 21),
(25, 1, 3, 22),
(26, 1, 3, 23),
(27, 1, 7, 24),
(27, 1, 12, 25),
(28, 1, 3, 26),
(29, 1, 3, 27),
(31, 1, 3, 28),
(32, 1, 3, 29),
(32, 1, 7, 30),
(34, 1, 7, 31),
(35, 1, 7, 32),
(36, 1, 7, 33),
(37, 1, 7, 34),
(38, 1, 7, 35),
(39, 1, 7, 36),
(41, 1, 7, 37),
(42, 1, 3, 38),
(43, 1, 3, 39),
(44, 1, 3, 40),
(46, 1, 6, 41),
(48, 1, 3, 42),
(50, 1, 7, 43),
(50, 1, 12, 44),
(50, 1, 3, 45),
(51, 1, 3, 46),
(52, 1, 3, 47),
(53, 1, 3, 48),
(54, 1, 3, 49),
(55, 1, 3, 50),
(55, 1, 7, 51),
(56, 1, 3, 52),
(57, 1, 3, 53),
(58, 1, 3, 54),
(60, 1, 3, 55),
(61, 1, 3, 56),
(62, 1, 3, 57),
(63, 1, 3, 58),
(64, 1, 3, 59),
(65, 1, 3, 60),
(66, 1, 3, 61),
(67, 1, 3, 62),
(67, 1, 7, 63),
(67, 1, 12, 64),
(69, 1, 7, 65),
(70, 1, 7, 66),
(71, 1, 7, 67),
(72, 1, 7, 68),
(73, 1, 7, 69),
(74, 1, 7, 70),
(76, 1, 3, 71),
(82, 1, 3, 72),
(83, 1, 3, 73),
(84, 1, 3, 74),
(85, 1, 3, 75),
(86, 1, 3, 76),
(88, 1, 3, 77),
(89, 1, 3, 78),
(90, 1, 3, 79),
(91, 1, 3, 80),
(92, 1, 3, 81),
(94, 1, 3, 82),
(95, 1, 3, 83),
(96, 1, 3, 84),
(97, 1, 3, 85),
(99, 1, 3, 86),
(100, 1, 3, 87),
(104, 1, 3, 88),
(105, 1, 3, 89),
(106, 1, 3, 90),
(107, 1, 3, 91),
(109, 1, 3, 92),
(110, 1, 3, 93),
(111, 1, 3, 94),
(112, 1, 3, 95),
(113, 1, 3, 96),
(115, 1, 3, 97),
(116, 1, 3, 98),
(117, 1, 3, 99),
(118, 1, 3, 100),
(119, 1, 3, 101),
(120, 1, 3, 102),
(121, 1, 3, 103),
(122, 1, 3, 104),
(124, 1, 3, 105),
(125, 1, 3, 106),
(126, 1, 3, 107),
(127, 1, 3, 108),
(129, 1, 12, 109),
(130, 1, 3, 110),
(131, 1, 3, 111),
(132, 1, 3, 112),
(133, 1, 3, 113),
(134, 1, 3, 114),
(135, 1, 3, 115),
(137, 1, 3, 116),
(138, 1, 4, 117),
(138, 1, 5, 118),
(138, 1, 7, 119),
(140, 1, 6, 120),
(143, 1, 6, 121),
(149, 1, 6, 122),
(150, 1, 6, 123),
(152, 1, 4, 124),
(152, 1, 5, 125),
(152, 1, 7, 126),
(168, 1, 2, 205),
(168, 1, 20, 206),
(168, 1, 22, 208),
(1, 4, 2, 210),
(1, 5, 2, 210),
(1, 6, 2, 210),
(168, 2, 2, 211),
(168, 2, 20, 212),
(168, 2, 22, 213),
(168, 3, 2, 214),
(168, 3, 20, 215),
(168, 3, 22, 216),
(169, 1, 2, 232),
(169, 1, 3, 233),
(169, 1, 20, 234),
(169, 1, 21, 235),
(169, 1, 22, 236),
(171, 1, 2, 257),
(171, 1, 3, 258),
(171, 1, 20, 259),
(171, 1, 22, 261),
(168, 4, 2, 262),
(168, 4, 20, 263),
(168, 4, 22, 264),
(169, 2, 2, 265),
(169, 2, 3, 266),
(169, 2, 20, 267),
(169, 2, 21, 268),
(169, 2, 22, 269),
(171, 2, 2, 270),
(171, 2, 3, 271),
(171, 2, 20, 272),
(171, 2, 22, 273),
(171, 3, 2, 274),
(171, 3, 3, 275),
(171, 3, 20, 276),
(171, 3, 22, 277);

-- --------------------------------------------------------

--
-- Table structure for table `Collections`
--

CREATE TABLE `Collections` (
  `cID` int(10) UNSIGNED NOT NULL,
  `cDateAdded` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `cDateModified` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `cHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Collections`
--

INSERT INTO `Collections` (`cID`, `cDateAdded`, `cDateModified`, `cHandle`) VALUES
(1, '2017-05-22 15:59:25', '2017-05-24 11:11:33', NULL),
(2, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'dashboard'),
(3, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'sitemap'),
(4, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'full'),
(5, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'explore'),
(6, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'search'),
(7, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'files'),
(8, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'search'),
(9, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'attributes'),
(10, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'sets'),
(11, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'add_set'),
(12, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'users'),
(13, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'search'),
(14, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'groups'),
(15, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'attributes'),
(16, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'add'),
(17, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'add_group'),
(18, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'bulkupdate'),
(19, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'group_sets'),
(20, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'points'),
(21, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'assign'),
(22, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'actions'),
(23, '2017-05-22 15:59:51', '2017-05-22 15:59:52', 'express'),
(24, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'entries'),
(25, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'reports'),
(26, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'forms'),
(27, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'legacy'),
(28, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'surveys'),
(29, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'logs'),
(30, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'pages'),
(31, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'themes'),
(32, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'inspect'),
(33, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'types'),
(34, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'organize'),
(35, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'add'),
(36, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'form'),
(37, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'output'),
(38, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'attributes'),
(39, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'permissions'),
(40, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'templates'),
(41, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'add'),
(42, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'attributes'),
(43, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'single'),
(44, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'feeds'),
(45, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'conversations'),
(46, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'messages'),
(47, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'blocks'),
(48, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'stacks'),
(49, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'permissions'),
(50, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'list'),
(51, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'types'),
(52, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'extend'),
(53, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'install'),
(54, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'update'),
(55, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'connect'),
(56, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'themes'),
(57, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'addons'),
(58, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'system'),
(59, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'basics'),
(60, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'name'),
(61, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'accessibility'),
(62, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'social'),
(63, '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'icons'),
(64, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'editor'),
(65, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'multilingual'),
(66, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'timezone'),
(67, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'attributes'),
(68, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'express'),
(69, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'entities'),
(70, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'attributes'),
(71, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'associations'),
(72, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'forms'),
(73, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'customize_search'),
(74, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'order_entries'),
(75, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'entries'),
(76, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'multilingual'),
(77, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'setup'),
(78, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'copy'),
(79, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'page_report'),
(80, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'translate_interface'),
(81, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'seo'),
(82, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'urls'),
(83, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'bulk'),
(84, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'codes'),
(85, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'excluded'),
(86, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'searchindex'),
(87, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'files'),
(88, '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'permissions'),
(89, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'filetypes'),
(90, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'thumbnails'),
(91, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'image_uploading'),
(92, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'storage'),
(93, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'optimization'),
(94, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'cache'),
(95, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'clearcache'),
(96, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'jobs'),
(97, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'query_log'),
(98, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'permissions'),
(99, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'site'),
(100, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'tasks'),
(101, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'users'),
(102, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'advanced'),
(103, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'workflows'),
(104, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'blacklist'),
(105, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'captcha'),
(106, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'antispam'),
(107, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'maintenance'),
(108, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'registration'),
(109, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'postlogin'),
(110, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'profiles'),
(111, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'open'),
(112, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'authentication'),
(113, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'global_password_reset'),
(114, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'notification'),
(115, '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'mail'),
(116, '2017-05-22 15:59:54', '2017-05-22 15:59:55', 'method'),
(117, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'test'),
(118, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'importers'),
(119, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'conversations'),
(120, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'settings'),
(121, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'points'),
(122, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'bannedwords'),
(123, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'permissions'),
(124, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'attributes'),
(125, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'sets'),
(126, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'types'),
(127, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'topics'),
(128, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'add'),
(129, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'environment'),
(130, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'info'),
(131, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'debug'),
(132, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'logging'),
(133, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'proxy'),
(134, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'entities'),
(135, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'backup'),
(136, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'backup'),
(137, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'update'),
(138, '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'welcome'),
(139, '2017-05-22 15:59:56', '2017-05-22 15:59:56', 'me'),
(140, '2017-05-22 16:00:00', '2017-05-22 16:00:00', '!trash'),
(141, '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'login'),
(142, '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'register'),
(143, '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'account'),
(144, '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'edit_profile'),
(145, '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'avatar'),
(146, '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'messages'),
(147, '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'page_forbidden'),
(148, '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'download_file'),
(149, '2017-05-22 16:00:00', '2017-05-22 16:00:00', '!drafts'),
(150, '2017-05-22 16:00:00', '2017-05-22 16:00:00', '!stacks'),
(151, '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'page_not_found'),
(152, '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'desktop'),
(153, '2017-05-22 16:00:01', '2017-05-22 16:00:01', NULL),
(154, '2017-05-22 16:01:20', '2017-05-23 16:41:37', 'header-site-title'),
(155, '2017-05-22 16:01:21', '2017-05-23 15:27:18', 'header-navigation'),
(156, '2017-05-22 16:01:21', '2017-05-25 08:59:53', 'footer-legal'),
(157, '2017-05-22 16:01:21', '2017-05-23 15:25:44', 'footer-navigation'),
(158, '2017-05-22 16:01:21', '2017-05-24 10:09:24', 'footer-contact'),
(159, '2017-05-23 15:30:41', '2017-05-23 15:30:42', ''),
(160, '2017-05-23 15:30:55', '2017-05-23 15:30:55', ''),
(161, '2017-05-23 15:31:03', '2017-05-23 15:31:04', ''),
(162, '2017-05-23 15:31:17', '2017-05-23 15:31:17', ''),
(163, '2017-05-23 15:31:28', '2017-05-23 15:31:28', ''),
(164, '2017-05-23 15:32:36', '2017-05-23 15:32:56', ''),
(165, '2017-05-24 10:14:23', '2017-05-25 11:00:39', 'social-links'),
(166, '2017-05-24 10:15:54', '2017-05-25 10:12:59', 'social-feed'),
(167, '2017-05-24 10:53:29', '2017-05-24 10:53:29', NULL),
(168, '2017-05-24 10:53:29', '2017-05-24 12:55:15', ''),
(169, '2017-05-24 11:07:06', '2017-05-24 12:56:05', ''),
(170, '2017-05-24 11:08:13', '2017-05-24 11:08:13', ''),
(171, '2017-05-24 11:08:23', '2017-05-24 13:12:56', '');

-- --------------------------------------------------------

--
-- Table structure for table `CollectionSearchIndexAttributes`
--

CREATE TABLE `CollectionSearchIndexAttributes` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ak_meta_title` longtext COLLATE utf8_unicode_ci,
  `ak_meta_description` longtext COLLATE utf8_unicode_ci,
  `ak_meta_keywords` longtext COLLATE utf8_unicode_ci,
  `ak_desktop_priority` decimal(14,4) DEFAULT '0.0000',
  `ak_is_desktop` tinyint(1) DEFAULT '0',
  `ak_icon_dashboard` longtext COLLATE utf8_unicode_ci,
  `ak_exclude_nav` tinyint(1) DEFAULT '0',
  `ak_exclude_page_list` tinyint(1) DEFAULT '0',
  `ak_header_extra_content` longtext COLLATE utf8_unicode_ci,
  `ak_tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ak_is_featured` tinyint(1) DEFAULT '0',
  `ak_exclude_search_index` tinyint(1) DEFAULT '0',
  `ak_exclude_sitemapxml` tinyint(1) DEFAULT '0',
  `ak_micro_post` tinyint(1) DEFAULT '0',
  `ak_post_topics` longtext COLLATE utf8_unicode_ci,
  `ak_casestudy_topics` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `CollectionSearchIndexAttributes`
--

INSERT INTO `CollectionSearchIndexAttributes` (`cID`, `ak_meta_title`, `ak_meta_description`, `ak_meta_keywords`, `ak_desktop_priority`, `ak_is_desktop`, `ak_icon_dashboard`, `ak_exclude_nav`, `ak_exclude_page_list`, `ak_header_extra_content`, `ak_tags`, `ak_is_featured`, `ak_exclude_search_index`, `ak_exclude_sitemapxml`, `ak_micro_post`, `ak_post_topics`, `ak_casestudy_topics`) VALUES
(1, NULL, 'Welcome to Chris Watterston', NULL, '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(2, NULL, NULL, NULL, '0.0000', 0, 'fa fa-th-large', 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(3, NULL, NULL, 'pages, add page, delete page, copy, move, alias', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(4, NULL, NULL, 'pages, add page, delete page, copy, move, alias', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(5, NULL, NULL, 'pages, add page, delete page, copy, move, alias, bulk', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(6, NULL, NULL, 'find page, search page, search, find, pages, sitemap', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(8, NULL, NULL, 'add file, delete file, copy, move, alias, resize, crop, rename, images, title, attribute', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(9, NULL, NULL, 'file, file attributes, title, attribute, description, rename', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(10, NULL, NULL, 'files, category, categories', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(11, NULL, NULL, 'new file set', '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(12, NULL, NULL, 'users, groups, people, find, delete user, remove user, change password, password', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(13, NULL, NULL, 'find, search, people, delete user, remove user, change password, password', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(14, NULL, NULL, 'user, group, people, permissions, expire, badges', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(15, NULL, NULL, 'user attributes, user data, gather data, registration data', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(16, NULL, NULL, 'new user, create', '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(17, NULL, NULL, 'new user group, new group, group, create', '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(19, NULL, NULL, 'group set', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(20, NULL, NULL, 'community, points, karma', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(22, NULL, NULL, 'action, community actions', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(25, NULL, NULL, 'forms, log, error, email, mysql, exception, survey', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(26, NULL, NULL, 'forms, questions, response, data', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(27, NULL, NULL, NULL, '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, NULL, NULL),
(28, NULL, NULL, 'questions, quiz, response', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(29, NULL, NULL, 'forms, log, error, email, mysql, exception, survey, history', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(31, NULL, NULL, 'new theme, theme, active theme, change theme, template, css', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(32, NULL, NULL, 'page types', '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(34, NULL, NULL, NULL, '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(35, NULL, NULL, NULL, '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(36, NULL, NULL, NULL, '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(37, NULL, NULL, NULL, '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(38, NULL, NULL, NULL, '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(39, NULL, NULL, NULL, '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(41, NULL, NULL, NULL, '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(42, NULL, NULL, 'page attributes, custom', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(43, NULL, NULL, 'single, page, custom, application', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(44, NULL, NULL, 'atom, rss, feed, syndication', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(46, NULL, NULL, NULL, '0.0000', 0, 'icon-bullhorn', 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(48, NULL, NULL, 'stacks, global areas, reusable content, scrapbook, copy, paste, paste block, copy block, site name, logo', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(50, NULL, NULL, 'edit stacks, view stacks, all stacks', '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, NULL, NULL),
(51, NULL, NULL, 'block, refresh, custom', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(52, NULL, NULL, 'add-on, addon, add on, package, app, ecommerce, discussions, forums, themes, templates, blocks', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(53, NULL, NULL, 'add-on, addon, ecommerce, install, discussions, forums, themes, templates, blocks', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(54, NULL, NULL, 'update, upgrade', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(55, NULL, NULL, 'concrete5.org, my account, marketplace', '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(56, NULL, NULL, 'buy theme, new theme, marketplace, template', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(57, NULL, NULL, 'buy addon, buy add on, buy add-on, purchase addon, purchase add on, purchase add-on, find addon, new addon, marketplace', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(58, NULL, NULL, 'dashboard, configuration', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(60, NULL, NULL, 'website name, title', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(61, NULL, NULL, 'accessibility, easy mode', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(62, NULL, NULL, 'sharing, facebook, twitter', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(63, NULL, NULL, 'logo, favicon, iphone, icon, bookmark', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(64, NULL, NULL, 'tinymce, content block, fonts, editor, content, overlay', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(65, NULL, NULL, 'translate, translation, internationalization, multilingual', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(66, NULL, NULL, 'timezone, profile, locale', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(67, NULL, NULL, 'site attributes', '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 1, 0, 0, NULL, NULL),
(69, NULL, NULL, NULL, '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(70, NULL, NULL, NULL, '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(71, NULL, NULL, NULL, '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(72, NULL, NULL, NULL, '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(73, NULL, NULL, NULL, '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(74, NULL, NULL, NULL, '0.0000', 0, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(76, NULL, NULL, 'multilingual, localization, internationalization, i18n', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(82, NULL, NULL, 'vanity, pretty url, redirection, hostname, canonical, seo, pageview, view', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(83, NULL, NULL, 'bulk, seo, change keywords, engine, optimization, search', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(84, NULL, NULL, 'traffic, statistics, google analytics, quant, pageviews, hits', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(85, NULL, NULL, 'pretty, slug', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(86, NULL, NULL, 'configure search, site search, search option', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(88, NULL, NULL, 'file options, file manager, upload, modify', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(89, NULL, NULL, 'security, files, media, extension, manager, upload', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(90, NULL, NULL, 'images, picture, responsive, retina', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(91, NULL, NULL, 'uploading, upload, images, image, resizing, manager', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(92, NULL, NULL, 'security, alternate storage, hide files', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(94, NULL, NULL, 'cache option, change cache, override, turn on cache, turn off cache, no cache, page cache, caching', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(95, NULL, NULL, 'cache option, turn off cache, no cache, page cache, caching', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(96, NULL, NULL, 'index search, reindex search, build sitemap, sitemap.xml, clear old versions, page versions, remove old', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(97, NULL, NULL, 'queries, database, mysql', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(99, NULL, NULL, 'editors, hide site, offline, private, public, access', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(100, NULL, NULL, 'security, actions, administrator, admin, package, marketplace, search', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(104, NULL, NULL, 'security, lock ip, lock out, block ip, address, restrict, access', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(105, NULL, NULL, 'security, registration', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(106, NULL, NULL, 'antispam, block spam, security', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(107, NULL, NULL, 'lock site, under construction, hide, hidden', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(109, NULL, NULL, 'profile, login, redirect, specific, dashboard, administrators', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(110, NULL, NULL, 'member profile, member page, community, forums, social, avatar', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(111, NULL, NULL, 'signup, new user, community, public registration, public, registration', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(112, NULL, NULL, 'auth, authentication, types, oauth, facebook, login, registration', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(113, NULL, NULL, 'global, password, reset, change password, force, sign out', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(115, NULL, NULL, 'smtp, mail settings', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(116, NULL, NULL, 'email server, mail settings, mail configuration, external, internal', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(117, NULL, NULL, 'test smtp, test mail', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(118, NULL, NULL, 'email server, mail settings, mail configuration, private message, message system, import, email, message', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(119, NULL, NULL, 'conversations', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(120, NULL, NULL, 'conversations', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(121, NULL, NULL, 'conversations ratings, ratings, community, community points', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(122, NULL, NULL, 'conversations bad words, banned words, banned, bad words, bad, words, list', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(124, NULL, NULL, 'attribute configuration', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(125, NULL, NULL, 'attributes, sets', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(126, NULL, NULL, 'attributes, types', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(127, NULL, NULL, 'topics, tags, taxonomy', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(129, NULL, NULL, NULL, '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 1, 0, 0, NULL, NULL),
(130, NULL, NULL, 'overrides, system info, debug, support, help', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(131, NULL, NULL, 'errors, exceptions, develop, support, help', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(132, NULL, NULL, 'email, logging, logs, smtp, pop, errors, mysql, log', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(133, NULL, NULL, 'network, proxy server', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(134, NULL, NULL, 'database, entities, doctrine, orm', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(135, NULL, NULL, 'export, backup, database, sql, mysql, encryption, restore', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(137, NULL, NULL, 'upgrade, new version, update', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(138, NULL, NULL, NULL, '2.0000', 1, NULL, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(140, NULL, NULL, NULL, '0.0000', 0, 'fa fa-trash-o', 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(143, NULL, NULL, NULL, '0.0000', 0, 'fa fa-briefcase', 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(149, NULL, NULL, NULL, '0.0000', 0, 'fa fa-edit', 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(150, NULL, NULL, NULL, '0.0000', 0, 'fa fa-th', 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(152, NULL, NULL, NULL, '1.0000', 1, NULL, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(168, NULL, 'Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', NULL, '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, '||/Posts/News||/Latest Feed||', NULL),
(169, NULL, 'Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat. Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in.', 'hello, world', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, 1, '||/Posts/Family||/Latest Feed||', NULL),
(171, NULL, 'Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', 'tester, sausage', '0.0000', 0, NULL, 0, 0, NULL, NULL, 0, 0, 0, NULL, '||/Posts/Inspirational||/Latest Feed||', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionAreaStyles`
--

CREATE TABLE `CollectionVersionAreaStyles` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionBlocks`
--

CREATE TABLE `CollectionVersionBlocks` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `bID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cbRelationID` int(10) UNSIGNED DEFAULT '0',
  `cbDisplayOrder` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `isOriginal` tinyint(1) NOT NULL DEFAULT '0',
  `cbOverrideAreaPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `cbIncludeAll` tinyint(1) NOT NULL DEFAULT '0',
  `cbOverrideBlockTypeCacheSettings` tinyint(1) NOT NULL DEFAULT '0',
  `cbOverrideBlockTypeContainerSettings` tinyint(1) NOT NULL DEFAULT '0',
  `cbEnableBlockContainer` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `CollectionVersionBlocks`
--

INSERT INTO `CollectionVersionBlocks` (`cID`, `cvID`, `bID`, `arHandle`, `cbRelationID`, `cbDisplayOrder`, `isOriginal`, `cbOverrideAreaPermissions`, `cbIncludeAll`, `cbOverrideBlockTypeCacheSettings`, `cbOverrideBlockTypeContainerSettings`, `cbEnableBlockContainer`) VALUES
(1, 4, 53, 'Header Latest Feed', 34, 0, 1, 0, 0, 0, 0, 0),
(1, 5, 54, 'Header Latest Feed', 34, 0, 1, 0, 0, 0, 0, 0),
(1, 6, 55, 'Header Latest Feed', 34, 0, 1, 0, 0, 0, 0, 0),
(138, 1, 1, 'Main', 1, 0, 1, 0, 0, 0, 0, 0),
(138, 1, 2, 'Main', 2, 1, 1, 0, 0, 0, 0, 0),
(138, 1, 3, 'Main : 1', 3, 0, 1, 0, 0, 0, 0, 0),
(138, 1, 4, 'Main : 2', 4, 0, 1, 0, 0, 0, 0, 0),
(138, 1, 5, 'Main : 3', 5, 0, 1, 0, 0, 0, 0, 0),
(138, 1, 6, 'Main', 6, 2, 1, 0, 0, 0, 0, 0),
(138, 1, 7, 'Main : 4', 7, 0, 1, 0, 0, 0, 0, 0),
(138, 1, 8, 'Main : 5', 8, 0, 1, 0, 0, 0, 0, 0),
(138, 1, 9, 'Main', 9, 3, 1, 0, 0, 0, 0, 0),
(138, 1, 10, 'Main : 6', 10, 0, 1, 0, 0, 0, 0, 0),
(138, 1, 11, 'Main : 7', 11, 0, 1, 0, 0, 0, 0, 0),
(138, 1, 12, 'Main : 8', 12, 0, 1, 0, 0, 0, 0, 0),
(138, 1, 13, 'Main', 13, 4, 1, 0, 0, 0, 0, 0),
(139, 1, 14, 'Main', 14, 0, 1, 0, 0, 0, 0, 0),
(152, 1, 15, 'Main', 15, 0, 1, 0, 0, 0, 0, 0),
(153, 1, 16, 'Main', 16, 0, 1, 0, 0, 0, 0, 0),
(154, 2, 22, 'Main', 21, 0, 1, 0, 0, 0, 0, 0),
(154, 3, 22, 'Main', 21, 0, 0, 0, 0, 0, 0, 0),
(154, 3, 23, 'Main', 22, 1, 1, 0, 0, 0, 0, 0),
(154, 4, 23, 'Main', 22, 1, 0, 0, 0, 0, 0, 0),
(154, 4, 36, 'Main', 21, 0, 1, 0, 0, 0, 0, 0),
(154, 5, 23, 'Main', 22, 1, 0, 0, 0, 0, 0, 0),
(154, 5, 37, 'Main', 21, 0, 1, 0, 0, 0, 0, 0),
(154, 6, 23, 'Main', 22, 1, 0, 0, 0, 0, 0, 0),
(154, 6, 38, 'Main', 21, 0, 1, 0, 0, 0, 0, 0),
(154, 7, 38, 'Main', 21, 0, 0, 0, 0, 0, 0, 0),
(154, 7, 39, 'Main', 22, 1, 1, 0, 0, 0, 0, 0),
(154, 8, 38, 'Main', 21, 0, 0, 0, 0, 0, 0, 0),
(154, 8, 40, 'Main', 22, 1, 1, 0, 0, 0, 0, 0),
(154, 9, 38, 'Main', 21, 0, 0, 0, 0, 0, 0, 0),
(154, 9, 41, 'Main', 22, 1, 1, 0, 0, 0, 0, 0),
(154, 10, 38, 'Main', 21, 0, 0, 0, 0, 0, 0, 0),
(154, 10, 42, 'Main', 22, 1, 1, 0, 0, 0, 0, 0),
(154, 11, 38, 'Main', 21, 0, 0, 0, 0, 0, 0, 0),
(154, 11, 43, 'Main', 22, 1, 1, 0, 0, 0, 0, 0),
(154, 12, 38, 'Main', 21, 0, 0, 0, 0, 0, 0, 0),
(154, 12, 44, 'Main', 22, 1, 1, 0, 0, 0, 0, 0),
(154, 13, 38, 'Main', 21, 0, 0, 0, 0, 0, 0, 0),
(154, 13, 45, 'Main', 22, 1, 1, 0, 0, 0, 0, 0),
(155, 2, 20, 'Main', 20, 0, 1, 0, 0, 0, 0, 0),
(155, 3, 21, 'Main', 20, 0, 1, 0, 0, 0, 0, 0),
(155, 4, 56, 'Main', 20, 0, 1, 0, 0, 0, 0, 0),
(156, 2, 18, 'Main', 18, 0, 1, 0, 0, 0, 0, 0),
(156, 3, 58, 'Main', 18, 0, 1, 0, 0, 0, 0, 0),
(156, 4, 59, 'Main', 18, 0, 1, 0, 0, 0, 0, 0),
(157, 2, 19, 'Main', 19, 0, 1, 0, 0, 0, 0, 0),
(157, 3, 60, 'Main', 19, 0, 1, 0, 0, 0, 0, 0),
(157, 4, 61, 'Main', 19, 0, 1, 0, 0, 0, 0, 0),
(157, 5, 62, 'Main', 19, 0, 1, 0, 0, 0, 0, 0),
(158, 2, 17, 'Main', 17, 0, 1, 0, 0, 0, 0, 0),
(158, 3, 17, 'Main', 17, 0, 0, 0, 0, 0, 0, 0),
(158, 3, 46, 'Main', 29, 1, 1, 0, 0, 0, 0, 0),
(158, 4, 17, 'Main', 17, 1, 0, 0, 0, 0, 0, 0),
(158, 4, 46, 'Main', 29, 0, 0, 0, 0, 0, 0, 0),
(158, 5, 17, 'Main', 17, 1, 0, 0, 0, 0, 0, 0),
(158, 5, 47, 'Main', 29, 0, 1, 0, 0, 0, 0, 0),
(158, 6, 47, 'Main', 29, 0, 0, 0, 0, 0, 0, 0),
(158, 6, 57, 'Main', 17, 1, 1, 0, 0, 0, 0, 0),
(159, 1, 25, 'Main', 23, 0, 1, 0, 0, 0, 0, 0),
(160, 1, 27, 'Main', 24, 0, 1, 0, 0, 0, 0, 0),
(161, 1, 29, 'Main', 25, 0, 1, 0, 0, 0, 0, 0),
(162, 1, 31, 'Main', 26, 0, 1, 0, 0, 0, 0, 0),
(163, 1, 33, 'Main', 27, 0, 1, 0, 0, 0, 0, 0),
(164, 1, 35, 'Main', 28, 0, 1, 0, 0, 0, 0, 0),
(164, 2, 35, 'Main', 28, 0, 0, 0, 0, 0, 0, 0),
(164, 3, 35, 'Main', 28, 0, 0, 0, 0, 0, 0, 0),
(165, 2, 48, 'Main', 30, 0, 1, 0, 0, 0, 0, 0),
(165, 3, 48, 'Main', 30, 1, 0, 0, 0, 0, 0, 0),
(165, 3, 49, 'Main', 31, 0, 1, 0, 0, 0, 0, 0),
(165, 4, 48, 'Main', 30, 0, 0, 0, 0, 0, 0, 0),
(165, 5, 65, 'Main', 30, 0, 1, 0, 0, 0, 0, 0),
(166, 2, 51, 'Main', 32, 0, 1, 0, 0, 0, 0, 0),
(166, 3, 51, 'Main', 32, 0, 0, 0, 0, 0, 0, 0),
(166, 3, 52, 'Main', 33, 1, 1, 0, 0, 0, 0, 0),
(166, 4, 51, 'Main', 32, 0, 0, 0, 0, 0, 0, 0),
(166, 4, 63, 'Main', 33, 1, 1, 0, 0, 0, 0, 0),
(166, 5, 51, 'Main', 32, 0, 0, 0, 0, 0, 0, 0),
(166, 5, 64, 'Main', 33, 1, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionBlocksCacheSettings`
--

CREATE TABLE `CollectionVersionBlocksCacheSettings` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `bID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `btCacheBlockOutput` tinyint(1) NOT NULL DEFAULT '0',
  `btCacheBlockOutputOnPost` tinyint(1) NOT NULL DEFAULT '0',
  `btCacheBlockOutputForRegisteredUsers` tinyint(1) NOT NULL DEFAULT '0',
  `btCacheBlockOutputLifetime` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionBlocksOutputCache`
--

CREATE TABLE `CollectionVersionBlocksOutputCache` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `bID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `btCachedBlockOutput` longtext COLLATE utf8_unicode_ci,
  `btCachedBlockOutputExpires` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionBlockStyles`
--

CREATE TABLE `CollectionVersionBlockStyles` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `CollectionVersionBlockStyles`
--

INSERT INTO `CollectionVersionBlockStyles` (`cID`, `cvID`, `bID`, `arHandle`, `issID`) VALUES
(138, 1, 13, 'Main', 1),
(157, 3, 60, 'Main', 2),
(157, 4, 61, 'Main', 3);

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionFeatureAssignments`
--

CREATE TABLE `CollectionVersionFeatureAssignments` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `faID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionRelatedEdits`
--

CREATE TABLE `CollectionVersionRelatedEdits` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cRelationID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cvRelationID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersions`
--

CREATE TABLE `CollectionVersions` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `cvName` text COLLATE utf8_unicode_ci,
  `cvHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cvDescription` text COLLATE utf8_unicode_ci,
  `cvDatePublic` datetime DEFAULT NULL,
  `cvDateCreated` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `cvComments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cvIsApproved` tinyint(1) NOT NULL DEFAULT '0',
  `cvIsNew` tinyint(1) NOT NULL DEFAULT '0',
  `cvAuthorUID` int(10) UNSIGNED DEFAULT NULL,
  `cvApproverUID` int(10) UNSIGNED DEFAULT NULL,
  `pThemeID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pTemplateID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cvActivateDatetime` datetime DEFAULT NULL,
  `cvPublishDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `CollectionVersions`
--

INSERT INTO `CollectionVersions` (`cID`, `cvID`, `cvName`, `cvHandle`, `cvDescription`, `cvDatePublic`, `cvDateCreated`, `cvComments`, `cvIsApproved`, `cvIsNew`, `cvAuthorUID`, `cvApproverUID`, `pThemeID`, `pTemplateID`, `cvActivateDatetime`, `cvPublishDate`) VALUES
(1, 1, 'Home', '', '', '2017-05-22 15:59:25', '2017-05-22 15:59:25', 'Initial Version', 0, 0, 1, NULL, 2, 4, NULL, NULL),
(1, 2, 'Home', '', '', '2017-05-22 15:59:25', '2017-05-23 14:51:13', 'New Version 2', 0, 0, 1, 1, 2, 4, NULL, NULL),
(1, 3, 'Home', '', '', '2017-05-22 15:59:25', '2017-05-23 14:51:24', 'New Version 3', 0, 0, 1, 1, 2, 5, NULL, NULL),
(1, 4, 'Home', '', '', '2017-05-22 15:59:25', '2017-05-24 10:59:34', 'Version 4', 0, 0, 1, 1, 2, 5, NULL, NULL),
(1, 5, 'Home', '', '', '2017-05-22 15:59:25', '2017-05-24 11:03:55', 'Version 5', 0, 0, 1, 1, 2, 5, NULL, NULL),
(1, 6, 'Home', '', '', '2017-05-22 15:59:25', '2017-05-24 11:09:53', 'Version 6', 1, 0, 1, 1, 2, 5, NULL, NULL),
(2, 1, 'Dashboard', 'dashboard', '', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(3, 1, 'Sitemap', 'sitemap', 'Whole world at a glance.', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(4, 1, 'Full Sitemap', 'full', '', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(5, 1, 'Flat View', 'explore', '', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(6, 1, 'Page Search', 'search', '', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(7, 1, 'Files', 'files', 'All documents and images.', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(8, 1, 'File Manager', 'search', '', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(9, 1, 'Attributes', 'attributes', '', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(10, 1, 'File Sets', 'sets', '', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(11, 1, 'Add File Set', 'add_set', '', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(12, 1, 'Members', 'users', 'Add and manage the user accounts and groups on your website.', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(13, 1, 'Search Users', 'search', '', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(14, 1, 'User Groups', 'groups', '', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(15, 1, 'Attributes', 'attributes', '', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(16, 1, 'Add User', 'add', '', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(17, 1, 'Add Group', 'add_group', '', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(18, 1, 'Move Multiple Groups', 'bulkupdate', '', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(19, 1, 'Group Sets', 'group_sets', '', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(20, 1, 'Community Points', 'points', NULL, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(21, 1, 'Assign Points', 'assign', NULL, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(22, 1, 'Actions', 'actions', NULL, '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(23, 1, 'Express', 'express', 'Express Data Objects', '2017-05-22 15:59:51', '2017-05-22 15:59:51', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(24, 1, 'View Entries', 'entries', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(25, 1, 'Reports', 'reports', 'Get data from forms and logs.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(26, 1, 'Form Results', 'forms', 'Get submission data.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(27, 1, 'Form Results', 'legacy', 'Get submission data.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(28, 1, 'Surveys', 'surveys', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(29, 1, 'Logs', 'logs', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(30, 1, 'Pages & Themes', 'pages', 'Reskin your site.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(31, 1, 'Themes', 'themes', 'Reskin your site.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(32, 1, 'Inspect', 'inspect', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(33, 1, 'Page Types', 'types', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(34, 1, 'Organize Page Type Order', 'organize', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(35, 1, 'Add Page Type', 'add', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(36, 1, 'Compose Form', 'form', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(37, 1, 'Defaults and Output', 'output', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(38, 1, 'Page Type Attributes', 'attributes', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(39, 1, 'Page Type Permissions', 'permissions', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(40, 1, 'Page Templates', 'templates', 'Form factors for pages in your site.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(41, 1, 'Add Page Template', 'add', 'Add page templates to your site.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(42, 1, 'Attributes', 'attributes', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(43, 1, 'Single Pages', 'single', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(44, 1, 'RSS Feeds', 'feeds', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(45, 1, 'Conversations', 'conversations', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(46, 1, 'Messages', 'messages', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(47, 1, 'Stacks & Blocks', 'blocks', 'Manage sitewide content and administer block types.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(48, 1, 'Stacks & Global Areas', 'stacks', 'Share content across your site.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(49, 1, 'Block & Stack Permissions', 'permissions', 'Control who can add blocks and stacks on your site.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(50, 1, 'Stack List', 'list', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(51, 1, 'Block Types', 'types', 'Manage the installed block types in your site.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(52, 1, 'Extend concrete5', 'extend', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(53, 1, 'Add Functionality', 'install', 'Install add-ons & themes.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(54, 1, 'Update Add-Ons', 'update', 'Update your installed packages.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(55, 1, 'Connect to the Community', 'connect', 'Connect to the concrete5 community.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(56, 1, 'Get More Themes', 'themes', 'Download themes from concrete5.org.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(57, 1, 'Get More Add-Ons', 'addons', 'Download add-ons from concrete5.org.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(58, 1, 'System & Settings', 'system', 'Secure and setup your site.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(59, 1, 'Basics', 'basics', 'Basic information about your website.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(60, 1, 'Name & Attributes', 'name', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(61, 1, 'Accessibility', 'accessibility', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(62, 1, 'Social Links', 'social', '', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(63, 1, 'Bookmark Icons', 'icons', 'Bookmark icon and mobile home screen icon setup.', '2017-05-22 15:59:52', '2017-05-22 15:59:52', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(64, 1, 'Rich Text Editor', 'editor', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(65, 1, 'Languages', 'multilingual', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(66, 1, 'Time Zone', 'timezone', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(67, 1, 'Custom Attributes', 'attributes', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(68, 1, 'Express', 'express', 'Express', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(69, 1, 'Data Objects', 'entities', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(70, 1, 'Attributes', 'attributes', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(71, 1, 'Associations', 'associations', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(72, 1, 'Forms', 'forms', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(73, 1, 'Customize Search', 'customize_search', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(74, 1, 'Customize Search', 'order_entries', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(75, 1, 'Custom Entry Locations', 'entries', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(76, 1, 'Multilingual', 'multilingual', 'Run your site in multiple languages.', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(77, 1, 'Multilingual Setup', 'setup', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(78, 1, 'Copy Languages', 'copy', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(79, 1, 'Page Report', 'page_report', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(80, 1, 'Translate Site Interface', 'translate_interface', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(81, 1, 'SEO & Statistics', 'seo', 'Enable pretty URLs and tracking codes.', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(82, 1, 'URLs and Redirection', 'urls', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(83, 1, 'Bulk SEO Updater', 'bulk', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(84, 1, 'Tracking Codes', 'codes', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(85, 1, 'Excluded URL Word List', 'excluded', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(86, 1, 'Search Index', 'searchindex', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(87, 1, 'Files', 'files', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(88, 1, 'File Manager Permissions', 'permissions', '', '2017-05-22 15:59:53', '2017-05-22 15:59:53', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(89, 1, 'Allowed File Types', 'filetypes', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(90, 1, 'Thumbnails', 'thumbnails', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(91, 1, 'Image Uploading', 'image_uploading', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(92, 1, 'File Storage Locations', 'storage', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(93, 1, 'Optimization', 'optimization', 'Keep your site running well.', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(94, 1, 'Cache & Speed Settings', 'cache', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(95, 1, 'Clear Cache', 'clearcache', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(96, 1, 'Automated Jobs', 'jobs', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(97, 1, 'Database Query Log', 'query_log', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(98, 1, 'Permissions & Access', 'permissions', 'Control who sees and edits your site.', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(99, 1, 'Site Access', 'site', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(100, 1, 'Task Permissions', 'tasks', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(101, 1, 'User Permissions', 'users', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(102, 1, 'Advanced Permissions', 'advanced', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(103, 1, 'Workflows', 'workflows', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(104, 1, 'IP Blacklist', 'blacklist', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(105, 1, 'Captcha Setup', 'captcha', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(106, 1, 'Spam Control', 'antispam', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(107, 1, 'Maintenance Mode', 'maintenance', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(108, 1, 'Login & Registration', 'registration', 'Change login behaviors and setup public profiles.', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(109, 1, 'Login Destination', 'postlogin', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(110, 1, 'Public Profiles', 'profiles', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(111, 1, 'Public Registration', 'open', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(112, 1, 'Authentication Types', 'authentication', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(113, 1, 'Global Password Reset', 'global_password_reset', 'Signs out all users, resets all passwords and forces users to choose a new one', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(114, 1, 'Notification Settings', 'notification', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(115, 1, 'Email', 'mail', 'Control how your site send and processes mail.', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(116, 1, 'SMTP Method', 'method', '', '2017-05-22 15:59:54', '2017-05-22 15:59:54', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(117, 1, 'Test Mail Settings', 'test', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(118, 1, 'Email Importers', 'importers', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(119, 1, 'Conversations', 'conversations', 'Manage your conversations settings', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(120, 1, 'Settings', 'settings', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(121, 1, 'Community Points', 'points', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(122, 1, 'Banned Words', 'bannedwords', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(123, 1, 'Conversation Permissions', 'permissions', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(124, 1, 'Attributes', 'attributes', 'Setup attributes for pages, users, files and more.', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(125, 1, 'Sets', 'sets', 'Group attributes into sets for easier organization', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(126, 1, 'Types', 'types', 'Choose which attribute types are available for different items.', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(127, 1, 'Topics', 'topics', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(128, 1, 'Add Topic Tree', 'add', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(129, 1, 'Environment', 'environment', 'Advanced settings for web developers.', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(130, 1, 'Environment Information', 'info', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(131, 1, 'Debug Settings', 'debug', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(132, 1, 'Logging Settings', 'logging', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(133, 1, 'Proxy Server', 'proxy', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(134, 1, 'Database Entities', 'entities', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(135, 1, 'Backup & Restore', 'backup', 'Backup or restore your website.', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(136, 1, 'Backup Database', 'backup', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(137, 1, 'Update concrete5', 'update', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(138, 1, 'Welcome', 'welcome', '', '2017-05-22 15:59:55', '2017-05-22 15:59:55', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(139, 1, 'Waiting for Me', 'me', '', '2017-05-22 15:59:56', '2017-05-22 15:59:56', 'Initial Version', 1, 0, 1, NULL, 0, 2, NULL, NULL),
(140, 1, 'Trash', '!trash', '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(141, 1, 'Login', 'login', '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(142, 1, 'Register', 'register', '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(143, 1, 'My Account', 'account', '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(144, 1, 'Edit Profile', 'edit_profile', 'Edit your user profile and change password.', '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(145, 1, 'Profile Picture', 'avatar', 'Specify a new image attached to posts or edits.', '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(146, 1, 'Private Messages', 'messages', 'Inbox for site-specific messages.', '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(147, 1, 'Page Forbidden', 'page_forbidden', '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(148, 1, 'Download File', 'download_file', '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'Initial Version', 1, 0, 1, NULL, 0, 0, NULL, NULL),
(149, 1, 'Drafts', '!drafts', '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'Initial Version', 1, 0, 1, NULL, 2, 0, NULL, NULL),
(150, 1, 'Stacks', '!stacks', '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'Initial Version', 1, 0, 1, NULL, 2, 0, NULL, NULL),
(151, 1, 'Page Not Found', 'page_not_found', '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'Initial Version', 1, 0, 1, NULL, 2, 0, NULL, NULL),
(152, 1, 'Welcome Back', 'desktop', '', '2017-05-22 16:00:00', '2017-05-22 16:00:00', 'Initial Version', 1, 0, 1, NULL, 2, 0, NULL, NULL),
(153, 1, '', NULL, NULL, '2017-05-22 16:00:01', '2017-05-22 16:00:01', 'Initial Version', 1, 0, NULL, NULL, 0, 4, NULL, NULL),
(154, 1, 'Header Site Title', 'header-site-title', NULL, '2017-05-22 16:01:20', '2017-05-22 16:01:20', 'Initial Version', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(154, 2, 'Header Site Title', 'header-site-title', NULL, '2017-05-22 16:01:20', '2017-05-23 15:28:38', 'New Version 2', 0, 0, 1, 1, 2, 0, NULL, NULL),
(154, 3, 'Header Site Title', 'header-site-title', NULL, '2017-05-22 16:01:20', '2017-05-23 15:29:24', 'New Version 3', 0, 0, 1, 1, 2, 0, NULL, NULL),
(154, 4, 'Header Site Title', 'header-site-title', NULL, '2017-05-22 16:01:20', '2017-05-23 15:58:52', 'New Version 4', 0, 0, 1, 1, 2, 0, NULL, NULL),
(154, 5, 'Header Site Title', 'header-site-title', NULL, '2017-05-22 16:01:20', '2017-05-23 15:59:25', 'New Version 5', 0, 0, 1, 1, 2, 0, NULL, NULL),
(154, 6, 'Header Site Title', 'header-site-title', NULL, '2017-05-22 16:01:20', '2017-05-23 16:00:06', 'New Version 6', 0, 0, 1, 1, 2, 0, NULL, NULL),
(154, 7, 'Header Site Title', 'header-site-title', NULL, '2017-05-22 16:01:20', '2017-05-23 16:10:16', 'New Version 7', 0, 0, 1, 1, 2, 0, NULL, NULL),
(154, 8, 'Header Site Title', 'header-site-title', NULL, '2017-05-22 16:01:20', '2017-05-23 16:15:31', 'New Version 8', 0, 0, 1, 1, 2, 0, NULL, NULL),
(154, 9, 'Header Site Title', 'header-site-title', NULL, '2017-05-22 16:01:20', '2017-05-23 16:16:31', 'New Version 9', 0, 0, 1, 1, 2, 0, NULL, NULL),
(154, 10, 'Header Site Title', 'header-site-title', NULL, '2017-05-22 16:01:20', '2017-05-23 16:17:07', 'New Version 10', 0, 0, 1, 1, 2, 0, NULL, NULL),
(154, 11, 'Header Site Title', 'header-site-title', NULL, '2017-05-22 16:01:20', '2017-05-23 16:39:10', 'New Version 11', 0, 0, 1, 1, 2, 0, NULL, NULL),
(154, 12, 'Header Site Title', 'header-site-title', NULL, '2017-05-22 16:01:20', '2017-05-23 16:40:52', 'New Version 12', 0, 0, 1, 1, 2, 0, NULL, NULL),
(154, 13, 'Header Site Title', 'header-site-title', NULL, '2017-05-22 16:01:20', '2017-05-23 16:41:36', 'New Version 13', 1, 0, 1, 1, 2, 0, NULL, NULL),
(155, 1, 'Header Navigation', 'header-navigation', NULL, '2017-05-22 16:01:21', '2017-05-22 16:01:21', 'Initial Version', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(155, 2, 'Header Navigation', 'header-navigation', NULL, '2017-05-22 16:01:21', '2017-05-23 15:25:57', 'New Version 2', 0, 0, 1, 1, 2, 0, NULL, NULL),
(155, 3, 'Header Navigation', 'header-navigation', NULL, '2017-05-22 16:01:21', '2017-05-23 15:26:32', 'New Version 3', 1, 0, 1, 1, 2, 0, NULL, NULL),
(155, 4, 'Header Navigation', 'header-navigation', NULL, '2017-05-22 16:01:21', '2017-05-25 08:06:20', 'New Version 4', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(156, 1, 'Footer Legal', 'footer-legal', NULL, '2017-05-22 16:01:21', '2017-05-22 16:01:21', 'Initial Version', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(156, 2, 'Footer Legal', 'footer-legal', NULL, '2017-05-22 16:01:21', '2017-05-23 15:22:20', 'New Version 2', 0, 0, 1, 1, 2, 0, NULL, NULL),
(156, 3, 'Footer Legal', 'footer-legal', NULL, '2017-05-22 16:01:21', '2017-05-25 08:59:34', 'New Version 3', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(156, 4, 'Footer Legal', 'footer-legal', NULL, '2017-05-22 16:01:21', '2017-05-25 08:59:52', 'New Version 4', 1, 0, 1, 1, 2, 0, NULL, NULL),
(157, 1, 'Footer Navigation', 'footer-navigation', NULL, '2017-05-22 16:01:21', '2017-05-22 16:01:21', 'Initial Version', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(157, 2, 'Footer Navigation', 'footer-navigation', NULL, '2017-05-22 16:01:21', '2017-05-23 15:25:30', 'New Version 2', 1, 0, 1, 1, 2, 0, NULL, NULL),
(157, 3, 'Footer Navigation', 'footer-navigation', NULL, '2017-05-22 16:01:21', '2017-05-25 09:00:40', 'New Version 3', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(157, 4, 'Footer Navigation', 'footer-navigation', NULL, '2017-05-22 16:01:21', '2017-05-25 09:01:15', 'New Version 4', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(157, 5, 'Footer Navigation', 'footer-navigation', NULL, '2017-05-22 16:01:21', '2017-05-25 09:04:51', 'New Version 5', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(158, 1, 'Footer Contact', 'footer-contact', NULL, '2017-05-22 16:01:21', '2017-05-22 16:01:21', 'Initial Version', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(158, 2, 'Footer Contact', 'footer-contact', NULL, '2017-05-22 16:01:21', '2017-05-23 15:22:01', 'New Version 2', 0, 0, 1, 1, 2, 0, NULL, NULL),
(158, 3, 'Footer Contact', 'footer-contact', NULL, '2017-05-22 16:01:21', '2017-05-24 10:08:52', 'New Version 3', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(158, 4, 'Footer Contact', 'footer-contact', NULL, '2017-05-22 16:01:21', '2017-05-24 10:08:59', 'New Version 4', 1, 0, 1, 1, 2, 0, NULL, NULL),
(158, 5, 'Footer Contact', 'footer-contact', NULL, '2017-05-22 16:01:21', '2017-05-24 10:09:39', 'New Version 5', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(158, 6, 'Footer Contact', 'footer-contact', NULL, '2017-05-22 16:01:21', '2017-05-25 08:58:51', 'New Version 6', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(159, 1, 'Services', 'services', '', '2017-05-23 15:30:41', '2017-05-23 15:30:41', 'Initial Version', 1, 0, 1, 1, 2, 4, NULL, NULL),
(160, 1, 'About Us', 'about-us', '', '2017-05-23 15:30:55', '2017-05-23 15:30:55', 'Initial Version', 1, 0, 1, 1, 2, 4, NULL, NULL),
(161, 1, 'Blog', 'blog', '', '2017-05-23 15:31:03', '2017-05-23 15:31:03', 'Initial Version', 1, 0, 1, 1, 2, 4, NULL, NULL),
(162, 1, 'Case Studies', 'case-studies', '', '2017-05-23 15:31:17', '2017-05-23 15:31:17', 'Initial Version', 1, 0, 1, 1, 2, 4, NULL, NULL),
(163, 1, 'Store', 'store', '', '2017-05-23 15:31:28', '2017-05-23 15:31:28', 'Initial Version', 1, 0, 1, 1, 2, 4, NULL, NULL),
(164, 1, 'get in contact', 'get-in-contact', '', '2017-05-23 15:32:36', '2017-05-23 15:32:36', 'Initial Version', 0, 0, 1, 1, 2, 4, NULL, NULL),
(164, 2, 'Get in Contact', 'get-in-contact', '', '2017-05-23 15:32:00', '2017-05-23 15:32:46', 'New Version 2', 0, 0, 1, 1, 2, 4, NULL, NULL),
(164, 3, 'Get in Contact', 'get-in-contact', '', '2017-05-23 15:32:00', '2017-05-23 15:32:56', 'New Version 3', 1, 0, 1, 1, 2, 4, NULL, NULL),
(165, 1, 'Social Links', 'social-links', NULL, '2017-05-24 10:14:23', '2017-05-24 10:14:23', 'Initial Version', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(165, 2, 'Social Links', 'social-links', NULL, '2017-05-24 10:14:23', '2017-05-24 10:15:14', 'New Version 2', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(165, 3, 'Social Links', 'social-links', NULL, '2017-05-24 10:14:23', '2017-05-24 10:15:14', 'New Version 3', 0, 0, 1, 1, 2, 0, NULL, NULL),
(165, 4, 'Social Links', 'social-links', NULL, '2017-05-24 10:14:23', '2017-05-24 10:15:39', 'New Version 4', 0, 0, 1, 1, 2, 0, NULL, NULL),
(165, 5, 'Social Links', 'social-links', NULL, '2017-05-24 10:14:23', '2017-05-25 11:00:37', 'New Version 5', 1, 0, 1, 1, 2, 0, NULL, NULL),
(166, 1, 'Social Feed', 'social-feed', NULL, '2017-05-24 10:15:54', '2017-05-24 10:15:54', 'Initial Version', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(166, 2, 'Social Feed', 'social-feed', NULL, '2017-05-24 10:15:54', '2017-05-24 10:16:20', 'New Version 2', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(166, 3, 'Social Feed', 'social-feed', NULL, '2017-05-24 10:15:54', '2017-05-24 10:16:42', 'New Version 3', 0, 0, 1, 1, 2, 0, NULL, NULL),
(166, 4, 'Social Feed', 'social-feed', NULL, '2017-05-24 10:15:54', '2017-05-25 10:12:22', 'New Version 4', 0, 0, 1, NULL, 2, 0, NULL, NULL),
(166, 5, 'Social Feed', 'social-feed', NULL, '2017-05-24 10:15:54', '2017-05-25 10:12:58', 'New Version 5', 1, 0, 1, 1, 2, 0, NULL, NULL),
(167, 1, '', NULL, NULL, '2017-05-24 10:53:29', '2017-05-24 10:53:29', 'Initial Version', 1, 0, NULL, NULL, 0, 6, NULL, NULL),
(168, 1, 'New DJI Drone and my first arial shots', 'new-dji-drone-and-my-first-arial-shots', NULL, '2017-05-24 10:53:00', '2017-05-24 10:53:29', 'Initial Version', 0, 0, 1, 1, 0, 6, NULL, NULL),
(168, 2, 'New DJI Drone and my first arial shots', 'new-dji-drone-and-my-first-arial-shots', '', '2017-05-24 10:53:00', '2017-05-24 11:04:27', 'New Version 2', 0, 0, 1, 1, 0, 6, NULL, NULL),
(168, 3, 'New DJI Drone and my first arial shots', 'new-dji-drone-and-my-first-arial-shots', 'Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', '2017-05-24 10:53:00', '2017-05-24 11:05:50', 'New Version 3', 0, 0, 1, 1, 0, 6, NULL, NULL),
(168, 4, 'New DJI Drone and my first arial shots', 'new-dji-drone-and-my-first-arial-shots', 'Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', '2017-05-24 10:53:00', '2017-05-24 12:55:14', 'New Version 4', 1, 0, 1, 1, 0, 6, NULL, NULL),
(169, 1, 'Building a Hobbit adventure for my kids', 'building-a-hobbit-adventure-for-my-kids', 'Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat. Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in.', '2017-05-24 11:07:00', '2017-05-24 11:07:06', 'Initial Version', 0, 0, 1, 1, 0, 6, NULL, NULL),
(169, 2, 'Building a Hobbit adventure for my kids', 'building-a-hobbit-adventure-for-my-kids', 'Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat. Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in.', '2017-05-24 11:07:00', '2017-05-24 12:56:04', 'New Version 2', 1, 0, 1, 1, 0, 6, NULL, NULL),
(170, 1, '', '', NULL, '2017-05-24 11:08:13', '2017-05-24 11:08:13', 'Initial Version', 0, 1, 1, NULL, 0, 6, NULL, NULL),
(171, 1, 'Entering 2017 with a new desk and mindset', 'entering-2017-with-a-new-desk-and-mindset', 'Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', '2017-05-24 11:08:00', '2017-05-24 11:08:23', 'Initial Version', 0, 0, 1, 1, 0, 6, NULL, NULL),
(171, 2, 'Entering 2017 with a new desk and mindset', 'entering-2017-with-a-new-desk-and-mindset', 'Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', '2017-05-24 11:08:00', '2017-05-24 12:56:48', 'New Version 2', 0, 0, 1, 1, 0, 6, NULL, NULL),
(171, 3, 'Entering 2017 with a new desk and mindset', 'entering-2017-with-a-new-desk-and-mindset', 'Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', '2017-05-24 11:08:00', '2017-05-24 13:12:56', 'New Version 3', 1, 0, 1, 1, 0, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `CollectionVersionThemeCustomStyles`
--

CREATE TABLE `CollectionVersionThemeCustomStyles` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `pThemeID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `scvlID` int(10) UNSIGNED DEFAULT '0',
  `preset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sccRecordID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Config`
--

CREATE TABLE `Config` (
  `configNamespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `configGroup` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `configItem` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `configValue` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Config`
--

INSERT INTO `Config` (`configNamespace`, `configGroup`, `configItem`, `configValue`) VALUES
('', 'concrete', 'security.token.encryption', '4b992b7108116366e517d9c5826407604a231a146616a4374299f404ab8135ee'),
('', 'concrete', 'security.token.jobs', '3fc12672f4ea7c45969fc9f1b7f3a8112eb3eea929bae8bd62c08d69ad7b535f'),
('', 'concrete', 'security.token.validation', '1b1f56f5d467ce7157172182cda197a54dc4bff1b9e19ab1bf7c8a2d41983b37');

-- --------------------------------------------------------

--
-- Table structure for table `ConfigStore`
--

CREATE TABLE `ConfigStore` (
  `cfKey` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cfValue` longtext COLLATE utf8_unicode_ci,
  `uID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ConfigStore`
--

INSERT INTO `ConfigStore` (`cfKey`, `timestamp`, `cfValue`, `uID`, `pkgID`) VALUES
('file_manager.sort.7', '2017-05-24 09:57:03', '["folderItemName","desc"]', 1, 0),
('MAIN_HELP_LAST_VIEWED', '2017-05-22 15:01:21', '1495465281', 1, 0),
('NEWSFLOW_LAST_VIEWED', '2017-05-22 15:00:01', '0', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ConversationDiscussions`
--

CREATE TABLE `ConversationDiscussions` (
  `cnvDiscussionID` int(10) UNSIGNED NOT NULL,
  `cnvDiscussionDateCreated` datetime NOT NULL,
  `cID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationEditors`
--

CREATE TABLE `ConversationEditors` (
  `cnvEditorID` int(10) UNSIGNED NOT NULL,
  `cnvEditorHandle` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnvEditorName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnvEditorIsActive` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ConversationEditors`
--

INSERT INTO `ConversationEditors` (`cnvEditorID`, `cnvEditorHandle`, `cnvEditorName`, `cnvEditorIsActive`, `pkgID`) VALUES
(1, 'plain_text', 'Plain Text', 1, 0),
(2, 'markdown', 'Markdown', 0, 0),
(3, 'redactor', 'Redactor', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ConversationFeatureDetailAssignments`
--

CREATE TABLE `ConversationFeatureDetailAssignments` (
  `faID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cnvID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationFlaggedMessages`
--

CREATE TABLE `ConversationFlaggedMessages` (
  `cnvMessageID` int(10) UNSIGNED NOT NULL,
  `cnvMessageFlagTypeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationFlaggedMessageTypes`
--

CREATE TABLE `ConversationFlaggedMessageTypes` (
  `cnvMessageFlagTypeID` int(10) UNSIGNED NOT NULL,
  `cnvMessageFlagTypeHandle` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ConversationFlaggedMessageTypes`
--

INSERT INTO `ConversationFlaggedMessageTypes` (`cnvMessageFlagTypeID`, `cnvMessageFlagTypeHandle`) VALUES
(1, 'spam');

-- --------------------------------------------------------

--
-- Table structure for table `ConversationMessageAttachments`
--

CREATE TABLE `ConversationMessageAttachments` (
  `cnvMessageAttachmentID` int(10) UNSIGNED NOT NULL,
  `cnvMessageID` int(11) DEFAULT NULL,
  `fID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationMessageNotifications`
--

CREATE TABLE `ConversationMessageNotifications` (
  `cnvMessageID` int(10) UNSIGNED NOT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationMessageRatings`
--

CREATE TABLE `ConversationMessageRatings` (
  `cnvMessageRatingID` int(10) UNSIGNED NOT NULL,
  `cnvMessageID` int(10) UNSIGNED DEFAULT NULL,
  `cnvRatingTypeID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cnvMessageRatingIP` tinyblob,
  `timestamp` datetime DEFAULT NULL,
  `uID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationMessages`
--

CREATE TABLE `ConversationMessages` (
  `cnvMessageID` int(10) UNSIGNED NOT NULL,
  `cnvID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cnvEditorID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cnvMessageAuthorName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnvMessageAuthorEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnvMessageAuthorWebsite` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnvMessageSubmitIP` tinyblob,
  `cnvMessageSubmitUserAgent` longtext COLLATE utf8_unicode_ci,
  `cnvMessageLevel` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cnvMessageParentID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cnvMessageDateCreated` datetime DEFAULT NULL,
  `cnvMessageSubject` text COLLATE utf8_unicode_ci,
  `cnvMessageBody` text COLLATE utf8_unicode_ci,
  `cnvIsMessageDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `cnvIsMessageApproved` tinyint(1) NOT NULL DEFAULT '0',
  `cnvMessageTotalRatingScore` bigint(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationPermissionAddMessageAccessList`
--

CREATE TABLE `ConversationPermissionAddMessageAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `permission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationPermissionAssignments`
--

CREATE TABLE `ConversationPermissionAssignments` (
  `cnvID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ConversationPermissionAssignments`
--

INSERT INTO `ConversationPermissionAssignments` (`cnvID`, `pkID`, `paID`) VALUES
(0, 67, 92),
(0, 68, 93),
(0, 71, 94),
(0, 70, 95),
(0, 72, 96),
(0, 69, 97),
(0, 73, 98),
(0, 74, 99);

-- --------------------------------------------------------

--
-- Table structure for table `ConversationRatingTypes`
--

CREATE TABLE `ConversationRatingTypes` (
  `cnvRatingTypeID` int(10) UNSIGNED NOT NULL,
  `cnvRatingTypeHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnvRatingTypeName` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnvRatingTypeCommunityPoints` int(11) DEFAULT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ConversationRatingTypes`
--

INSERT INTO `ConversationRatingTypes` (`cnvRatingTypeID`, `cnvRatingTypeHandle`, `cnvRatingTypeName`, `cnvRatingTypeCommunityPoints`, `pkgID`) VALUES
(1, 'up_vote', 'Up Vote', 1, 0),
(2, 'down_vote', 'Down Vote', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Conversations`
--

CREATE TABLE `Conversations` (
  `cnvID` int(10) UNSIGNED NOT NULL,
  `cID` int(10) UNSIGNED DEFAULT '0',
  `cnvDateCreated` datetime NOT NULL,
  `cnvDateLastMessage` datetime DEFAULT NULL,
  `cnvParentMessageID` int(10) UNSIGNED DEFAULT '0',
  `cnvAttachmentsEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `cnvMessagesTotal` int(10) UNSIGNED DEFAULT '0',
  `cnvOverrideGlobalPermissions` tinyint(1) DEFAULT '0',
  `cnvAttachmentOverridesEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `cnvMaxFilesGuest` int(11) DEFAULT '0',
  `cnvMaxFilesRegistered` int(11) DEFAULT '0',
  `cnvMaxFileSizeGuest` int(11) DEFAULT '0',
  `cnvMaxFileSizeRegistered` int(11) DEFAULT '0',
  `cnvFileExtensions` text COLLATE utf8_unicode_ci,
  `cnvNotificationOverridesEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `cnvEnableSubscription` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ConversationSubscriptions`
--

CREATE TABLE `ConversationSubscriptions` (
  `cnvID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ConversationSubscriptions`
--

INSERT INTO `ConversationSubscriptions` (`cnvID`, `uID`, `type`) VALUES
(0, 1, 'S');

-- --------------------------------------------------------

--
-- Table structure for table `DownloadStatistics`
--

CREATE TABLE `DownloadStatistics` (
  `dsID` int(10) UNSIGNED NOT NULL,
  `fID` int(10) UNSIGNED NOT NULL,
  `fvID` int(10) UNSIGNED NOT NULL,
  `uID` int(10) UNSIGNED NOT NULL,
  `rcID` int(10) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressAttributeKeys`
--

CREATE TABLE `ExpressAttributeKeys` (
  `entity_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressEntities`
--

CREATE TABLE `ExpressEntities` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `default_view_form_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `default_edit_form_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plural_handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supports_custom_display_order` tinyint(1) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `result_column_set` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:object)',
  `include_in_public_list` tinyint(1) NOT NULL,
  `entity_results_node_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressEntityAssociations`
--

CREATE TABLE `ExpressEntityAssociations` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `source_entity_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `target_entity_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `is_owned_by_association` tinyint(1) NOT NULL,
  `is_owning_association` tinyint(1) NOT NULL,
  `target_property_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inversed_by_property_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `association_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressEntityAssociationSelectedEntries`
--

CREATE TABLE `ExpressEntityAssociationSelectedEntries` (
  `id` int(11) NOT NULL,
  `exSelectedEntryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressEntityEntries`
--

CREATE TABLE `ExpressEntityEntries` (
  `exEntryID` int(11) NOT NULL,
  `exEntryDisplayOrder` int(11) NOT NULL,
  `exEntryDateCreated` datetime NOT NULL,
  `exEntryEntityID` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressEntityEntryAssociations`
--

CREATE TABLE `ExpressEntityEntryAssociations` (
  `id` int(11) NOT NULL,
  `association_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `exEntryID` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressEntityEntryAttributeValues`
--

CREATE TABLE `ExpressEntityEntryAttributeValues` (
  `exEntryID` int(11) NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressFormFieldSetAssociationControls`
--

CREATE TABLE `ExpressFormFieldSetAssociationControls` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `association_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `association_entity_label_mask` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressFormFieldSetAttributeKeyControls`
--

CREATE TABLE `ExpressFormFieldSetAttributeKeyControls` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `akID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressFormFieldSetControls`
--

CREATE TABLE `ExpressFormFieldSetControls` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `field_set_id` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL,
  `position` int(11) NOT NULL,
  `custom_label` longtext COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressFormFieldSets`
--

CREATE TABLE `ExpressFormFieldSets` (
  `id` int(11) NOT NULL,
  `form_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `position` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressFormFieldSetTextControls`
--

CREATE TABLE `ExpressFormFieldSetTextControls` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `headline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ExpressForms`
--

CREATE TABLE `ExpressForms` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `entity_id` char(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:guid)',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FeatureAssignments`
--

CREATE TABLE `FeatureAssignments` (
  `faID` int(10) UNSIGNED NOT NULL,
  `feID` int(10) UNSIGNED DEFAULT NULL,
  `fcID` int(10) UNSIGNED DEFAULT NULL,
  `fdObject` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FeatureCategories`
--

CREATE TABLE `FeatureCategories` (
  `fcID` int(10) UNSIGNED NOT NULL,
  `fcHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FeatureCategories`
--

INSERT INTO `FeatureCategories` (`fcID`, `fcHandle`, `pkgID`) VALUES
(1, 'collection_version', 0),
(2, 'gathering_item', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Features`
--

CREATE TABLE `Features` (
  `feID` int(10) UNSIGNED NOT NULL,
  `feHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `feScore` int(11) NOT NULL DEFAULT '1',
  `feHasCustomClass` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Features`
--

INSERT INTO `Features` (`feID`, `feHandle`, `feScore`, `feHasCustomClass`, `pkgID`) VALUES
(1, 'title', 1, 0, 0),
(2, 'link', 1, 0, 0),
(3, 'author', 1, 0, 0),
(4, 'date_time', 1, 0, 0),
(5, 'image', 500, 1, 0),
(6, 'conversation', 10, 1, 0),
(7, 'description', 1, 0, 0),
(8, 'featured', 1000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `FileAttributeKeys`
--

CREATE TABLE `FileAttributeKeys` (
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FileAttributeKeys`
--

INSERT INTO `FileAttributeKeys` (`akID`) VALUES
(16),
(17),
(19);

-- --------------------------------------------------------

--
-- Table structure for table `FileAttributeValues`
--

CREATE TABLE `FileAttributeValues` (
  `fID` int(10) UNSIGNED NOT NULL,
  `fvID` int(10) UNSIGNED NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FileAttributeValues`
--

INSERT INTO `FileAttributeValues` (`fID`, `fvID`, `akID`, `avID`) VALUES
(1, 1, 16, 187),
(1, 1, 17, 188);

-- --------------------------------------------------------

--
-- Table structure for table `FileImageThumbnailPaths`
--

CREATE TABLE `FileImageThumbnailPaths` (
  `fileID` int(10) UNSIGNED NOT NULL,
  `fileVersionID` int(10) UNSIGNED NOT NULL,
  `thumbnailTypeHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageLocationID` int(10) UNSIGNED NOT NULL,
  `path` longtext COLLATE utf8_unicode_ci NOT NULL,
  `isBuilt` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FileImageThumbnailPaths`
--

INSERT INTO `FileImageThumbnailPaths` (`fileID`, `fileVersionID`, `thumbnailTypeHandle`, `storageLocationID`, `path`, `isBuilt`) VALUES
(1, 1, 'file_manager_listing', 1, '/thumbnails/file_manager_listing/3714/9561/9802/temp-image.jpg', 1),
(1, 1, 'file_manager_listing_2x', 1, '/thumbnails/file_manager_listing_2x/3714/9561/9802/temp-image.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `FileImageThumbnailTypes`
--

CREATE TABLE `FileImageThumbnailTypes` (
  `ftTypeHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ftTypeName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ftTypeWidth` int(11) NOT NULL,
  `ftTypeHeight` int(11) DEFAULT NULL,
  `ftTypeIsRequired` tinyint(1) NOT NULL,
  `ftTypeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FileImageThumbnailTypes`
--

INSERT INTO `FileImageThumbnailTypes` (`ftTypeHandle`, `ftTypeName`, `ftTypeWidth`, `ftTypeHeight`, `ftTypeIsRequired`, `ftTypeID`) VALUES
('file_manager_listing', 'File Manager Thumbnails', 60, 60, 1, 1),
('file_manager_detail', 'File Manager Detail Thumbnails', 400, NULL, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `FilePermissionAssignments`
--

CREATE TABLE `FilePermissionAssignments` (
  `fID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FilePermissionFileTypeAccessList`
--

CREATE TABLE `FilePermissionFileTypeAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `permission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FilePermissionFileTypeAccessListCustom`
--

CREATE TABLE `FilePermissionFileTypeAccessListCustom` (
  `extension` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FilePermissionFileTypes`
--

CREATE TABLE `FilePermissionFileTypes` (
  `extension` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `fsID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Files`
--

CREATE TABLE `Files` (
  `fID` int(10) UNSIGNED NOT NULL,
  `fDateAdded` datetime NOT NULL,
  `fPassword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fOverrideSetPermissions` tinyint(1) NOT NULL,
  `ocID` int(10) UNSIGNED NOT NULL,
  `folderTreeNodeID` int(10) UNSIGNED NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `fslID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Files`
--

INSERT INTO `Files` (`fID`, `fDateAdded`, `fPassword`, `fOverrideSetPermissions`, `ocID`, `folderTreeNodeID`, `uID`, `fslID`) VALUES
(1, '2017-05-24 10:56:42', NULL, 0, 0, 7, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `FileSearchIndexAttributes`
--

CREATE TABLE `FileSearchIndexAttributes` (
  `fID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ak_width` decimal(14,4) DEFAULT '0.0000',
  `ak_height` decimal(14,4) DEFAULT '0.0000',
  `ak_duration` decimal(14,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FileSearchIndexAttributes`
--

INSERT INTO `FileSearchIndexAttributes` (`fID`, `ak_width`, `ak_height`, `ak_duration`) VALUES
(1, '1024.0000', '768.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `FileSetFiles`
--

CREATE TABLE `FileSetFiles` (
  `fsfID` int(10) UNSIGNED NOT NULL,
  `fID` int(10) UNSIGNED NOT NULL,
  `fsID` int(10) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fsDisplayOrder` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FileSetFiles`
--

INSERT INTO `FileSetFiles` (`fsfID`, `fID`, `fsID`, `timestamp`, `fsDisplayOrder`) VALUES
(1, 1, 1, '2017-05-24 09:56:59', 0);

-- --------------------------------------------------------

--
-- Table structure for table `FileSets`
--

CREATE TABLE `FileSets` (
  `fsID` int(10) UNSIGNED NOT NULL,
  `fsName` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `uID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `fsType` smallint(6) NOT NULL,
  `fsOverrideGlobalPermissions` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FileSets`
--

INSERT INTO `FileSets` (`fsID`, `fsName`, `uID`, `fsType`, `fsOverrideGlobalPermissions`) VALUES
(1, 'Images - Blog', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `FileSetSavedSearches`
--

CREATE TABLE `FileSetSavedSearches` (
  `fsID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `fsSearchRequest` text COLLATE utf8_unicode_ci,
  `fsResultColumns` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FileStorageLocations`
--

CREATE TABLE `FileStorageLocations` (
  `fslName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fslConfiguration` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:object)',
  `fslID` int(10) UNSIGNED NOT NULL,
  `fslIsDefault` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FileStorageLocations`
--

INSERT INTO `FileStorageLocations` (`fslName`, `fslConfiguration`, `fslID`, `fslIsDefault`) VALUES
('Default', 'O:69:"Concrete\\Core\\File\\StorageLocation\\Configuration\\DefaultConfiguration":1:{s:10:"\0*\0default";b:1;}', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `FileStorageLocationTypes`
--

CREATE TABLE `FileStorageLocationTypes` (
  `fslTypeHandle` longtext COLLATE utf8_unicode_ci NOT NULL,
  `fslTypeName` longtext COLLATE utf8_unicode_ci NOT NULL,
  `fslTypeID` int(11) NOT NULL,
  `pkgID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FileStorageLocationTypes`
--

INSERT INTO `FileStorageLocationTypes` (`fslTypeHandle`, `fslTypeName`, `fslTypeID`, `pkgID`) VALUES
('default', 'Default', 1, 0),
('local', 'Local', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `FileUsageRecord`
--

CREATE TABLE `FileUsageRecord` (
  `file_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `collection_version_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FileVersionLog`
--

CREATE TABLE `FileVersionLog` (
  `fvlID` int(10) UNSIGNED NOT NULL,
  `fID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `fvID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `fvUpdateTypeID` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `fvUpdateTypeAttributeID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FileVersions`
--

CREATE TABLE `FileVersions` (
  `fvID` int(11) NOT NULL,
  `fvFilename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fvPrefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fvDateAdded` datetime NOT NULL,
  `fvActivateDateTime` datetime NOT NULL,
  `fvIsApproved` tinyint(1) NOT NULL,
  `fvAuthorUID` int(11) NOT NULL,
  `fvSize` bigint(20) NOT NULL,
  `fvApproverUID` int(11) NOT NULL,
  `fvTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fvDescription` longtext COLLATE utf8_unicode_ci,
  `fvExtension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fvType` int(11) NOT NULL,
  `fvTags` longtext COLLATE utf8_unicode_ci,
  `fvHasListingThumbnail` tinyint(1) NOT NULL,
  `fvHasDetailThumbnail` tinyint(1) NOT NULL,
  `fID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FileVersions`
--

INSERT INTO `FileVersions` (`fvID`, `fvFilename`, `fvPrefix`, `fvDateAdded`, `fvActivateDateTime`, `fvIsApproved`, `fvAuthorUID`, `fvSize`, `fvApproverUID`, `fvTitle`, `fvDescription`, `fvExtension`, `fvType`, `fvTags`, `fvHasListingThumbnail`, `fvHasDetailThumbnail`, `fID`) VALUES
(1, 'temp-image.jpg', '371495619802', '2017-05-24 10:56:42', '2017-05-24 10:56:42', 1, 1, 102515, 1, 'temp-image.jpg', '', 'jpg', 1, '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gaPage`
--

CREATE TABLE `gaPage` (
  `gaiID` int(10) UNSIGNED NOT NULL,
  `cID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GatheringConfiguredDataSources`
--

CREATE TABLE `GatheringConfiguredDataSources` (
  `gcsID` int(10) UNSIGNED NOT NULL,
  `gaID` int(10) UNSIGNED DEFAULT NULL,
  `gasID` int(10) UNSIGNED DEFAULT NULL,
  `gcdObject` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GatheringDataSources`
--

CREATE TABLE `GatheringDataSources` (
  `gasID` int(10) UNSIGNED NOT NULL,
  `gasName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gasHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gasDisplayOrder` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GatheringDataSources`
--

INSERT INTO `GatheringDataSources` (`gasID`, `gasName`, `gasHandle`, `pkgID`, `gasDisplayOrder`) VALUES
(1, 'Site Page', 'page', 0, 0),
(2, 'RSS Feed', 'rss_feed', 0, 1),
(3, 'Flickr Feed', 'flickr_feed', 0, 2),
(4, 'Twitter', 'twitter', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `GatheringItemFeatureAssignments`
--

CREATE TABLE `GatheringItemFeatureAssignments` (
  `gafaID` int(10) UNSIGNED NOT NULL,
  `gaiID` int(10) UNSIGNED DEFAULT NULL,
  `faID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GatheringItems`
--

CREATE TABLE `GatheringItems` (
  `gaiID` int(10) UNSIGNED NOT NULL,
  `gaID` int(10) UNSIGNED DEFAULT NULL,
  `gasID` int(10) UNSIGNED DEFAULT NULL,
  `gaiDateTimeCreated` datetime NOT NULL,
  `gaiPublicDateTime` datetime NOT NULL,
  `gaiTitle` text COLLATE utf8_unicode_ci,
  `gaiSlotWidth` int(10) UNSIGNED DEFAULT '1',
  `gaiSlotHeight` int(10) UNSIGNED DEFAULT '1',
  `gaiKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gaiBatchDisplayOrder` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gaiBatchTimestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gaiIsDeleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GatheringItemSelectedTemplates`
--

CREATE TABLE `GatheringItemSelectedTemplates` (
  `gaiID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gatID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gatTypeID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GatheringItemTemplateFeatures`
--

CREATE TABLE `GatheringItemTemplateFeatures` (
  `gfeID` int(10) UNSIGNED NOT NULL,
  `gatID` int(10) UNSIGNED DEFAULT NULL,
  `feID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GatheringItemTemplateFeatures`
--

INSERT INTO `GatheringItemTemplateFeatures` (`gfeID`, `gatID`, `feID`) VALUES
(4, 1, 1),
(10, 2, 1),
(13, 3, 1),
(16, 4, 1),
(19, 5, 1),
(23, 7, 1),
(29, 11, 1),
(33, 12, 1),
(37, 13, 1),
(42, 14, 1),
(47, 15, 1),
(53, 17, 1),
(56, 18, 1),
(63, 21, 1),
(64, 22, 1),
(3, 1, 2),
(9, 2, 2),
(12, 3, 2),
(15, 4, 2),
(18, 5, 2),
(21, 6, 2),
(25, 8, 2),
(27, 9, 2),
(41, 13, 3),
(46, 14, 3),
(51, 16, 3),
(55, 17, 3),
(62, 20, 3),
(66, 22, 3),
(2, 1, 4),
(8, 2, 4),
(14, 4, 4),
(17, 5, 4),
(31, 11, 4),
(35, 12, 4),
(39, 13, 4),
(44, 14, 4),
(61, 20, 4),
(5, 1, 5),
(22, 6, 5),
(24, 8, 5),
(26, 9, 5),
(28, 10, 5),
(32, 11, 5),
(36, 12, 5),
(40, 13, 5),
(45, 14, 5),
(49, 15, 5),
(50, 16, 5),
(59, 19, 5),
(65, 22, 5),
(20, 5, 6),
(1, 1, 7),
(7, 2, 7),
(11, 3, 7),
(30, 11, 7),
(34, 12, 7),
(38, 13, 7),
(43, 14, 7),
(48, 15, 7),
(52, 16, 7),
(54, 17, 7),
(57, 18, 7),
(58, 19, 7),
(60, 20, 7),
(6, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `GatheringItemTemplates`
--

CREATE TABLE `GatheringItemTemplates` (
  `gatID` int(10) UNSIGNED NOT NULL,
  `gatHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gatName` text COLLATE utf8_unicode_ci,
  `gatHasCustomClass` tinyint(1) NOT NULL DEFAULT '0',
  `gatFixedSlotWidth` int(10) UNSIGNED DEFAULT '0',
  `gatFixedSlotHeight` int(10) UNSIGNED DEFAULT '0',
  `gatForceDefault` int(10) UNSIGNED DEFAULT '0',
  `pkgID` int(10) UNSIGNED DEFAULT NULL,
  `gatTypeID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GatheringItemTemplates`
--

INSERT INTO `GatheringItemTemplates` (`gatID`, `gatHandle`, `gatName`, `gatHasCustomClass`, `gatFixedSlotWidth`, `gatFixedSlotHeight`, `gatForceDefault`, `pkgID`, `gatTypeID`) VALUES
(1, 'featured', 'Featured Item', 0, 6, 2, 1, 0, 1),
(2, 'title_date_description', 'Title Date & Description', 0, 0, 0, 0, 0, 1),
(3, 'title_description', 'Title & Description', 0, 0, 0, 0, 0, 1),
(4, 'title_date', 'Title & Date', 0, 0, 0, 0, 0, 1),
(5, 'title_date_comments', 'Title, Date & Comments', 1, 0, 0, 0, 0, 1),
(6, 'thumbnail', 'Thumbnail', 0, 0, 0, 0, 0, 1),
(7, 'basic', 'Basic', 0, 0, 0, 0, 0, 2),
(8, 'image_sharing_link', 'Image Sharing Link', 0, 0, 0, 0, 0, 2),
(9, 'image_conversation', 'Image Conversation', 0, 0, 0, 0, 0, 2),
(10, 'image', 'Large Image', 0, 0, 0, 0, 0, 2),
(11, 'masthead_image_left', 'Masthead Image Left', 0, 0, 0, 0, 0, 1),
(12, 'masthead_image_right', 'Masthead Image Right', 0, 0, 0, 0, 0, 1),
(13, 'masthead_image_byline_right', 'Masthead Image Byline Right', 0, 0, 0, 0, 0, 1),
(14, 'masthead_image_byline_left', 'Masthead Image Byline Left', 0, 0, 0, 0, 0, 1),
(15, 'image_masthead_description_center', 'Image Masthead Description Center', 0, 0, 0, 0, 0, 1),
(16, 'image_byline_description_center', 'Image Byline Description Center', 0, 0, 0, 0, 0, 1),
(17, 'masthead_byline_description', 'Masthead Byline Description', 0, 0, 0, 0, 0, 1),
(18, 'masthead_description', 'Masthead Description', 0, 0, 0, 0, 0, 1),
(19, 'thumbnail_description_center', 'Thumbnail & Description Center', 0, 0, 0, 0, 0, 1),
(20, 'tweet', 'Tweet', 0, 0, 0, 0, 0, 1),
(21, 'vimeo', 'Vimeo', 0, 0, 0, 0, 0, 1),
(22, 'image_overlay_headline', 'Image Overlay Headline', 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `GatheringItemTemplateTypes`
--

CREATE TABLE `GatheringItemTemplateTypes` (
  `gatTypeID` int(10) UNSIGNED NOT NULL,
  `gatTypeHandle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `GatheringItemTemplateTypes`
--

INSERT INTO `GatheringItemTemplateTypes` (`gatTypeID`, `gatTypeHandle`, `pkgID`) VALUES
(1, 'tile', 0),
(2, 'detail', 0);

-- --------------------------------------------------------

--
-- Table structure for table `GatheringPermissionAssignments`
--

CREATE TABLE `GatheringPermissionAssignments` (
  `gaID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Gatherings`
--

CREATE TABLE `Gatherings` (
  `gaID` int(10) UNSIGNED NOT NULL,
  `gaDateCreated` datetime NOT NULL,
  `gaDateLastUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Groups`
--

CREATE TABLE `Groups` (
  `gID` int(10) UNSIGNED NOT NULL,
  `gName` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `gDescription` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gUserExpirationIsEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `gUserExpirationMethod` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gUserExpirationSetDateTime` datetime DEFAULT NULL,
  `gUserExpirationInterval` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gUserExpirationAction` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gIsBadge` tinyint(1) NOT NULL DEFAULT '0',
  `gBadgeFID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gBadgeDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gBadgeCommunityPointValue` int(11) NOT NULL DEFAULT '0',
  `gIsAutomated` tinyint(1) NOT NULL DEFAULT '0',
  `gCheckAutomationOnRegister` tinyint(1) NOT NULL DEFAULT '0',
  `gCheckAutomationOnLogin` tinyint(1) NOT NULL DEFAULT '0',
  `gCheckAutomationOnJobRun` tinyint(1) NOT NULL DEFAULT '0',
  `gPath` text COLLATE utf8_unicode_ci,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Groups`
--

INSERT INTO `Groups` (`gID`, `gName`, `gDescription`, `gUserExpirationIsEnabled`, `gUserExpirationMethod`, `gUserExpirationSetDateTime`, `gUserExpirationInterval`, `gUserExpirationAction`, `gIsBadge`, `gBadgeFID`, `gBadgeDescription`, `gBadgeCommunityPointValue`, `gIsAutomated`, `gCheckAutomationOnRegister`, `gCheckAutomationOnLogin`, `gCheckAutomationOnJobRun`, `gPath`, `pkgID`) VALUES
(1, 'Guest', 'The guest group represents unregistered visitors to your site.', 0, NULL, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '/Guest', 0),
(2, 'Registered Users', 'The registered users group represents all user accounts.', 0, NULL, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '/Registered Users', 0),
(3, 'Administrators', '', 0, NULL, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '/Administrators', 0);

-- --------------------------------------------------------

--
-- Table structure for table `GroupSetGroups`
--

CREATE TABLE `GroupSetGroups` (
  `gID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gsID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `GroupSets`
--

CREATE TABLE `GroupSets` (
  `gsID` int(10) UNSIGNED NOT NULL,
  `gsName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Jobs`
--

CREATE TABLE `Jobs` (
  `jID` int(10) UNSIGNED NOT NULL,
  `jName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `jDescription` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jDateInstalled` datetime DEFAULT NULL,
  `jDateLastRun` datetime DEFAULT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `jLastStatusText` longtext COLLATE utf8_unicode_ci,
  `jLastStatusCode` smallint(6) NOT NULL DEFAULT '0',
  `jStatus` varchar(14) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ENABLED',
  `jHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jNotUninstallable` smallint(6) NOT NULL DEFAULT '0',
  `isScheduled` smallint(6) NOT NULL DEFAULT '0',
  `scheduledInterval` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'days',
  `scheduledValue` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Jobs`
--

INSERT INTO `Jobs` (`jID`, `jName`, `jDescription`, `jDateInstalled`, `jDateLastRun`, `pkgID`, `jLastStatusText`, `jLastStatusCode`, `jStatus`, `jHandle`, `jNotUninstallable`, `isScheduled`, `scheduledInterval`, `scheduledValue`) VALUES
(1, 'Index Search Engine - Updates', 'Index the site to allow searching to work quickly and accurately', '2017-05-22 15:59:51', '2017-05-22 16:07:28', 0, 'Indexed 0 Pages, 0 Users, 0 Files, and 1 Sites.', 0, 'ENABLED', 'index_search', 1, 0, 'days', 0),
(2, 'Index Search Engine - All', 'Empties the page search index and reindexes all pages.', '2017-05-22 15:59:51', '2017-05-22 16:08:34', 0, 'Indexed 0 Pages, 0 Users, 0 Files, and 1 Sites.', 0, 'ENABLED', 'index_search_all', 1, 0, 'days', 0),
(3, 'Check Automated Groups', 'Automatically add users to groups and assign badges.', '2017-05-22 15:59:51', '2017-05-22 16:12:13', 0, 'Active users updated.', 0, 'ENABLED', 'check_automated_groups', 0, 0, 'days', 0),
(4, 'Generate the sitemap.xml file', 'Generate the sitemap.xml file that search engines use to crawl your site.', '2017-05-22 15:59:51', '2017-05-22 16:12:18', 0, '<a href="http://chriswatterston.com-www.dev/sitemap.xml" target="_blank">chriswatterston.com-www.dev/sitemap.xml</a> file saved (1 pages).', 0, 'ENABLED', 'generate_sitemap', 0, 0, 'days', 0),
(5, 'Process Email Posts', 'Polls an email account and grabs private messages/postings that are sent there..', '2017-05-22 15:59:51', '2017-05-22 16:12:18', 0, 'The Job was run successfully.', 0, 'ENABLED', 'process_email', 0, 0, 'days', 0),
(6, 'Remove Old Page Versions', 'Removes all except the 10 most recent page versions for each page.', '2017-05-22 15:59:51', '2017-05-22 16:12:21', 0, 'All pages have been processed, starting from beginning on next run.', 0, 'ENABLED', 'remove_old_page_versions', 0, 0, 'days', 0),
(7, 'Update Gatherings', 'Loads new items into gatherings.', '2017-05-22 15:59:51', '2017-05-22 16:12:23', 0, 'The Job was run successfully.', 0, 'ENABLED', 'update_gatherings', 0, 0, 'days', 0),
(8, 'Update Statistics Trackers', 'Scan the sitemap for file usage and stack usage to update statistics trackers', '2017-05-22 15:59:51', '2017-05-22 16:12:24', 0, 'The Job was run successfully.', 0, 'ENABLED', 'update_statistics', 0, 0, 'days', 0);

-- --------------------------------------------------------

--
-- Table structure for table `JobSetJobs`
--

CREATE TABLE `JobSetJobs` (
  `jsID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `jID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `jRunOrder` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `JobSetJobs`
--

INSERT INTO `JobSetJobs` (`jsID`, `jID`, `jRunOrder`) VALUES
(1, 1, 0),
(1, 4, 0),
(1, 5, 0),
(1, 6, 0),
(1, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `JobSets`
--

CREATE TABLE `JobSets` (
  `jsID` int(10) UNSIGNED NOT NULL,
  `jsName` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `jDateLastRun` datetime DEFAULT NULL,
  `isScheduled` smallint(6) NOT NULL DEFAULT '0',
  `scheduledInterval` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'days',
  `scheduledValue` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `JobSets`
--

INSERT INTO `JobSets` (`jsID`, `jsName`, `pkgID`, `jDateLastRun`, `isScheduled`, `scheduledInterval`, `scheduledValue`) VALUES
(1, 'Default', 0, NULL, 0, 'days', 0);

-- --------------------------------------------------------

--
-- Table structure for table `JobsLog`
--

CREATE TABLE `JobsLog` (
  `jlID` int(10) UNSIGNED NOT NULL,
  `jID` int(10) UNSIGNED NOT NULL,
  `jlMessage` longtext COLLATE utf8_unicode_ci NOT NULL,
  `jlTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jlError` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `JobsLog`
--

INSERT INTO `JobsLog` (`jlID`, `jID`, `jlMessage`, `jlTimestamp`, `jlError`) VALUES
(1, 1, 'Indexed 0 Pages, 0 Users, 0 Files, and 1 Sites.', '2017-05-22 15:08:26', 0),
(2, 2, 'Indexed 0 Pages, 0 Users, 0 Files, and 1 Sites.', '2017-05-22 15:09:33', 0),
(3, 3, 'Active users updated.', '2017-05-22 15:12:14', 0),
(4, 4, '<a href="http://chriswatterston.com-www.dev/sitemap.xml" target="_blank">chriswatterston.com-www.dev/sitemap.xml</a> file saved (1 pages).', '2017-05-22 15:12:16', 0),
(5, 5, 'The Job was run successfully.', '2017-05-22 15:12:18', 0),
(6, 4, '<a href="http://chriswatterston.com-www.dev/sitemap.xml" target="_blank">chriswatterston.com-www.dev/sitemap.xml</a> file saved (1 pages).', '2017-05-22 15:12:19', 0),
(7, 6, '1 versions deleted from 0 page (1)', '2017-05-22 15:12:20', 0),
(8, 6, 'All pages have been processed, starting from beginning on next run.', '2017-05-22 15:12:21', 0),
(9, 7, 'The Job was run successfully.', '2017-05-22 15:12:23', 0),
(10, 8, 'The Job was run successfully.', '2017-05-22 15:12:24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `LegacyAttributeKeys`
--

CREATE TABLE `LegacyAttributeKeys` (
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Logs`
--

CREATE TABLE `Logs` (
  `logID` int(10) UNSIGNED NOT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` int(10) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Logs`
--

INSERT INTO `Logs` (`logID`, `channel`, `time`, `message`, `uID`, `level`) VALUES
(1, 'exceptions', 1495616940, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/concrete/vendor/illuminate/filesystem/Illuminate/Filesystem/Filesystem.php:70 file_put_contents(/Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/config/generated_overrides/concrete.php): failed to open stream: Permission denied (2)\n', 1, 600),
(2, 'exceptions', 1495627076, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:55 Object of class Concrete\\Core\\Tree\\Node\\Type\\Topic could not be converted to string (4096)\n', 1, 600),
(3, 'exceptions', 1495627105, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:56 Object of class Concrete\\Core\\Tree\\Node\\Type\\Topic could not be converted to string (4096)\n', 1, 600),
(4, 'exceptions', 1495627120, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:56 Cannot use object of type Concrete\\Core\\Tree\\Node\\Type\\Topic as array (1)\n', 1, 600),
(5, 'exceptions', 1495627215, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:57 Object of class Concrete\\Core\\Tree\\Node\\Type\\Topic could not be converted to string (4096)\n', 1, 600),
(6, 'exceptions', 1495627264, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:57 Object of class Concrete\\Core\\Tree\\Node\\Type\\Topic could not be converted to string (4096)\n', 1, 600),
(7, 'exceptions', 1495627312, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:57 Object of class Concrete\\Core\\Tree\\Node\\Type\\Topic could not be converted to string (4096)\n', 1, 600),
(8, 'exceptions', 1495627350, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:29 syntax error, unexpected \',\' (4)\n', 1, 600),
(9, 'exceptions', 1495627353, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:29 syntax error, unexpected \',\' (4)\n', 1, 600),
(10, 'exceptions', 1495627365, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:57 Object of class Concrete\\Core\\Tree\\Node\\Type\\Topic could not be converted to string (4096)\n', 1, 600),
(11, 'exceptions', 1495627537, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:57 Cannot use object of type Concrete\\Core\\Tree\\Node\\Type\\Topic as array (1)\n', 1, 600),
(12, 'exceptions', 1495627552, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:57 Cannot use object of type Concrete\\Core\\Tree\\Node\\Type\\Topic as array (1)\n', 1, 600),
(13, 'exceptions', 1495627577, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:57 Cannot use object of type Concrete\\Core\\Tree\\Node\\Type\\Topic as array (1)\n', 1, 600),
(14, 'exceptions', 1495627581, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:57 Cannot use object of type Concrete\\Core\\Tree\\Node\\Type\\Topic as array (1)\n', 1, 600),
(15, 'exceptions', 1495627613, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:29 Cannot use object of type Concrete\\Core\\Tree\\Node\\Type\\Topic as array (1)\n', 1, 600),
(16, 'exceptions', 1495627686, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:29 Cannot use object of type Concrete\\Core\\Tree\\Node\\Type\\Topic as array (1)\n', 1, 600),
(17, 'exceptions', 1495627726, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:29 Cannot use object of type Concrete\\Core\\Tree\\Node\\Type\\Topic as array (1)\n', 1, 600),
(18, 'exceptions', 1495627900, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:29 syntax error, unexpected \',\' (4)\n', 1, 600),
(19, 'exceptions', 1495627909, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:29 syntax error, unexpected \',\' (4)\n', 1, 600),
(20, 'exceptions', 1495628765, 'Exception Occurred: /Users/chriswatterston/Sites/chriswatterston.com-www.dev/application/blocks/page_list/templates/chris-watterston-latest-home/view.php:29 syntax error, unexpected \':\' (4)\n', 1, 600);

-- --------------------------------------------------------

--
-- Table structure for table `MailImporters`
--

CREATE TABLE `MailImporters` (
  `miID` int(10) UNSIGNED NOT NULL,
  `miHandle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `miServer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `miUsername` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `miPassword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `miEncryption` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `miIsEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `miEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `miPort` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pkgID` int(10) UNSIGNED DEFAULT NULL,
  `miConnectionMethod` varchar(8) COLLATE utf8_unicode_ci DEFAULT 'POP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `MailImporters`
--

INSERT INTO `MailImporters` (`miID`, `miHandle`, `miServer`, `miUsername`, `miPassword`, `miEncryption`, `miIsEnabled`, `miEmail`, `miPort`, `pkgID`, `miConnectionMethod`) VALUES
(1, 'private_message', '', NULL, NULL, NULL, 0, '', 0, 0, 'POP');

-- --------------------------------------------------------

--
-- Table structure for table `MailValidationHashes`
--

CREATE TABLE `MailValidationHashes` (
  `mvhID` int(10) UNSIGNED NOT NULL,
  `miID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `mHash` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `mDateGenerated` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mDateRedeemed` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MultilingualPageRelations`
--

CREATE TABLE `MultilingualPageRelations` (
  `mpLocale` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `mpLanguage` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mpRelationID` int(10) UNSIGNED NOT NULL,
  `cID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `MultilingualTranslations`
--

CREATE TABLE `MultilingualTranslations` (
  `mtID` int(10) UNSIGNED NOT NULL,
  `mtSectionID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `msgid` text COLLATE utf8_unicode_ci NOT NULL,
  `msgidPlural` text COLLATE utf8_unicode_ci,
  `msgstr` text COLLATE utf8_unicode_ci,
  `msgstrPlurals` text COLLATE utf8_unicode_ci,
  `context` text COLLATE utf8_unicode_ci,
  `comments` text COLLATE utf8_unicode_ci,
  `reference` text COLLATE utf8_unicode_ci,
  `flags` text COLLATE utf8_unicode_ci,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `NotificationAlerts`
--

CREATE TABLE `NotificationAlerts` (
  `naID` int(10) UNSIGNED NOT NULL,
  `naIsArchived` tinyint(1) NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `nID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `NotificationPermissionSubscriptionList`
--

CREATE TABLE `NotificationPermissionSubscriptionList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `permission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `NotificationPermissionSubscriptionListCustom`
--

CREATE TABLE `NotificationPermissionSubscriptionListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `nSubscriptionIdentifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Notifications`
--

CREATE TABLE `Notifications` (
  `nID` int(10) UNSIGNED NOT NULL,
  `nDate` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OauthUserMap`
--

CREATE TABLE `OauthUserMap` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `binding` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Packages`
--

CREATE TABLE `Packages` (
  `pkgID` int(10) UNSIGNED NOT NULL,
  `pkgHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgIsInstalled` tinyint(1) NOT NULL,
  `pkgAvailableVersion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pkgDescription` longtext COLLATE utf8_unicode_ci NOT NULL,
  `pkgDateInstalled` datetime NOT NULL,
  `pkgName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PageFeeds`
--

CREATE TABLE `PageFeeds` (
  `customTopicAttributeKeyHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customTopicTreeNodeID` int(10) UNSIGNED NOT NULL,
  `iconFID` int(10) UNSIGNED NOT NULL,
  `pfDescription` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pfHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pfTitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pfID` int(10) UNSIGNED NOT NULL,
  `cParentID` int(10) UNSIGNED NOT NULL,
  `ptID` int(10) UNSIGNED NOT NULL,
  `pfIncludeAllDescendents` tinyint(1) NOT NULL,
  `pfDisplayAliases` tinyint(1) NOT NULL,
  `pfContentToDisplay` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pfAreaHandleToDisplay` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pfDisplayFeaturedOnly` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PagePaths`
--

CREATE TABLE `PagePaths` (
  `cPath` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ppID` int(11) NOT NULL,
  `cID` int(10) UNSIGNED NOT NULL,
  `ppIsCanonical` tinyint(1) NOT NULL,
  `ppGeneratedFromURLSlugs` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PagePaths`
--

INSERT INTO `PagePaths` (`cPath`, `ppID`, `cID`, `ppIsCanonical`, `ppGeneratedFromURLSlugs`) VALUES
('/dashboard', 1, 2, 1, 1),
('/dashboard/sitemap', 2, 3, 1, 1),
('/dashboard/sitemap/full', 3, 4, 1, 1),
('/dashboard/sitemap/explore', 4, 5, 1, 1),
('/dashboard/sitemap/search', 5, 6, 1, 1),
('/dashboard/files', 6, 7, 1, 1),
('/dashboard/files/search', 7, 8, 1, 1),
('/dashboard/files/attributes', 8, 9, 1, 1),
('/dashboard/files/sets', 9, 10, 1, 1),
('/dashboard/files/add_set', 10, 11, 1, 1),
('/dashboard/users', 11, 12, 1, 1),
('/dashboard/users/search', 12, 13, 1, 1),
('/dashboard/users/groups', 13, 14, 1, 1),
('/dashboard/users/attributes', 14, 15, 1, 1),
('/dashboard/users/add', 15, 16, 1, 1),
('/dashboard/users/add_group', 16, 17, 1, 1),
('/dashboard/users/groups/bulkupdate', 17, 18, 1, 1),
('/dashboard/users/group_sets', 18, 19, 1, 1),
('/dashboard/users/points', 19, 20, 1, 1),
('/dashboard/users/points/assign', 20, 21, 1, 1),
('/dashboard/users/points/actions', 21, 22, 1, 1),
('/dashboard/express', 22, 23, 1, 1),
('/dashboard/express/entries', 23, 24, 1, 1),
('/dashboard/reports', 24, 25, 1, 1),
('/dashboard/reports/forms', 25, 26, 1, 1),
('/dashboard/reports/forms/legacy', 26, 27, 1, 1),
('/dashboard/reports/surveys', 27, 28, 1, 1),
('/dashboard/reports/logs', 28, 29, 1, 1),
('/dashboard/pages', 29, 30, 1, 1),
('/dashboard/pages/themes', 30, 31, 1, 1),
('/dashboard/pages/themes/inspect', 31, 32, 1, 1),
('/dashboard/pages/types', 32, 33, 1, 1),
('/dashboard/pages/types/organize', 33, 34, 1, 1),
('/dashboard/pages/types/add', 34, 35, 1, 1),
('/dashboard/pages/types/form', 35, 36, 1, 1),
('/dashboard/pages/types/output', 36, 37, 1, 1),
('/dashboard/pages/types/attributes', 37, 38, 1, 1),
('/dashboard/pages/types/permissions', 38, 39, 1, 1),
('/dashboard/pages/templates', 39, 40, 1, 1),
('/dashboard/pages/templates/add', 40, 41, 1, 1),
('/dashboard/pages/attributes', 41, 42, 1, 1),
('/dashboard/pages/single', 42, 43, 1, 1),
('/dashboard/pages/feeds', 43, 44, 1, 1),
('/dashboard/conversations', 44, 45, 1, 1),
('/dashboard/conversations/messages', 45, 46, 1, 1),
('/dashboard/blocks', 46, 47, 1, 1),
('/dashboard/blocks/stacks', 47, 48, 1, 1),
('/dashboard/blocks/permissions', 48, 49, 1, 1),
('/dashboard/blocks/stacks/list', 49, 50, 1, 1),
('/dashboard/blocks/types', 50, 51, 1, 1),
('/dashboard/extend', 51, 52, 1, 1),
('/dashboard/extend/install', 52, 53, 1, 1),
('/dashboard/extend/update', 53, 54, 1, 1),
('/dashboard/extend/connect', 54, 55, 1, 1),
('/dashboard/extend/themes', 55, 56, 1, 1),
('/dashboard/extend/addons', 56, 57, 1, 1),
('/dashboard/system', 57, 58, 1, 1),
('/dashboard/system/basics', 58, 59, 1, 1),
('/dashboard/system/basics/name', 59, 60, 1, 1),
('/dashboard/system/basics/accessibility', 60, 61, 1, 1),
('/dashboard/system/basics/social', 61, 62, 1, 1),
('/dashboard/system/basics/icons', 62, 63, 1, 1),
('/dashboard/system/basics/editor', 63, 64, 1, 1),
('/dashboard/system/basics/multilingual', 64, 65, 1, 1),
('/dashboard/system/basics/timezone', 65, 66, 1, 1),
('/dashboard/system/basics/attributes', 66, 67, 1, 1),
('/dashboard/system/express', 67, 68, 1, 1),
('/dashboard/system/express/entities', 68, 69, 1, 1),
('/dashboard/system/express/entities/attributes', 69, 70, 1, 1),
('/dashboard/system/express/entities/associations', 70, 71, 1, 1),
('/dashboard/system/express/entities/forms', 71, 72, 1, 1),
('/dashboard/system/express/entities/customize_search', 72, 73, 1, 1),
('/dashboard/system/express/entities/order_entries', 73, 74, 1, 1),
('/dashboard/system/express/entries', 74, 75, 1, 1),
('/dashboard/system/multilingual', 75, 76, 1, 1),
('/dashboard/system/multilingual/setup', 76, 77, 1, 1),
('/dashboard/system/multilingual/copy', 77, 78, 1, 1),
('/dashboard/system/multilingual/page_report', 78, 79, 1, 1),
('/dashboard/system/multilingual/translate_interface', 79, 80, 1, 1),
('/dashboard/system/seo', 80, 81, 1, 1),
('/dashboard/system/seo/urls', 81, 82, 1, 1),
('/dashboard/system/seo/bulk', 82, 83, 1, 1),
('/dashboard/system/seo/codes', 83, 84, 1, 1),
('/dashboard/system/seo/excluded', 84, 85, 1, 1),
('/dashboard/system/seo/searchindex', 85, 86, 1, 1),
('/dashboard/system/files', 86, 87, 1, 1),
('/dashboard/system/files/permissions', 87, 88, 1, 1),
('/dashboard/system/files/filetypes', 88, 89, 1, 1),
('/dashboard/system/files/thumbnails', 89, 90, 1, 1),
('/dashboard/system/files/image_uploading', 90, 91, 1, 1),
('/dashboard/system/files/storage', 91, 92, 1, 1),
('/dashboard/system/optimization', 92, 93, 1, 1),
('/dashboard/system/optimization/cache', 93, 94, 1, 1),
('/dashboard/system/optimization/clearcache', 94, 95, 1, 1),
('/dashboard/system/optimization/jobs', 95, 96, 1, 1),
('/dashboard/system/optimization/query_log', 96, 97, 1, 1),
('/dashboard/system/permissions', 97, 98, 1, 1),
('/dashboard/system/permissions/site', 98, 99, 1, 1),
('/dashboard/system/permissions/tasks', 99, 100, 1, 1),
('/dashboard/system/permissions/users', 100, 101, 1, 1),
('/dashboard/system/permissions/advanced', 101, 102, 1, 1),
('/dashboard/system/permissions/workflows', 102, 103, 1, 1),
('/dashboard/system/permissions/blacklist', 103, 104, 1, 1),
('/dashboard/system/permissions/captcha', 104, 105, 1, 1),
('/dashboard/system/permissions/antispam', 105, 106, 1, 1),
('/dashboard/system/permissions/maintenance', 106, 107, 1, 1),
('/dashboard/system/registration', 107, 108, 1, 1),
('/dashboard/system/registration/postlogin', 108, 109, 1, 1),
('/dashboard/system/registration/profiles', 109, 110, 1, 1),
('/dashboard/system/registration/open', 110, 111, 1, 1),
('/dashboard/system/registration/authentication', 111, 112, 1, 1),
('/dashboard/system/registration/global_password_reset', 112, 113, 1, 1),
('/dashboard/system/registration/notification', 113, 114, 1, 1),
('/dashboard/system/mail', 114, 115, 1, 1),
('/dashboard/system/mail/method', 115, 116, 1, 1),
('/dashboard/system/mail/method/test', 116, 117, 1, 1),
('/dashboard/system/mail/importers', 117, 118, 1, 1),
('/dashboard/system/conversations', 118, 119, 1, 1),
('/dashboard/system/conversations/settings', 119, 120, 1, 1),
('/dashboard/system/conversations/points', 120, 121, 1, 1),
('/dashboard/system/conversations/bannedwords', 121, 122, 1, 1),
('/dashboard/system/conversations/permissions', 122, 123, 1, 1),
('/dashboard/system/attributes', 123, 124, 1, 1),
('/dashboard/system/attributes/sets', 124, 125, 1, 1),
('/dashboard/system/attributes/types', 125, 126, 1, 1),
('/dashboard/system/attributes/topics', 126, 127, 1, 1),
('/dashboard/system/attributes/topics/add', 127, 128, 1, 1),
('/dashboard/system/environment', 128, 129, 1, 1),
('/dashboard/system/environment/info', 129, 130, 1, 1),
('/dashboard/system/environment/debug', 130, 131, 1, 1),
('/dashboard/system/environment/logging', 131, 132, 1, 1),
('/dashboard/system/environment/proxy', 132, 133, 1, 1),
('/dashboard/system/environment/entities', 133, 134, 1, 1),
('/dashboard/system/backup', 134, 135, 1, 1),
('/dashboard/system/backup/backup', 135, 136, 1, 1),
('/dashboard/system/backup/update', 136, 137, 1, 1),
('/dashboard/welcome', 137, 138, 1, 1),
('/dashboard/welcome/me', 138, 139, 1, 1),
('/!trash', 139, 140, 1, 1),
('/login', 140, 141, 1, 1),
('/register', 141, 142, 1, 1),
('/account', 142, 143, 1, 1),
('/account/edit_profile', 143, 144, 1, 1),
('/account/avatar', 144, 145, 1, 1),
('/account/messages', 145, 146, 1, 1),
('/page_forbidden', 146, 147, 1, 1),
('/download_file', 147, 148, 1, 1),
('/!drafts', 148, 149, 1, 1),
('/!stacks', 149, 150, 1, 1),
('/page_not_found', 150, 151, 1, 1),
('/account/welcome', 151, 152, 1, 0),
('/!stacks/header-site-title', 152, 154, 1, 1),
('/!stacks/header-navigation', 153, 155, 1, 1),
('/!stacks/footer-legal', 154, 156, 1, 1),
('/!stacks/footer-navigation', 155, 157, 1, 1),
('/!stacks/footer-contact', 156, 158, 1, 1),
('', 157, 1, 1, 1),
('/services', 158, 159, 1, 1),
('/about-us', 159, 160, 1, 1),
('/blog', 160, 161, 1, 1),
('/case-studies', 161, 162, 1, 1),
('/store', 162, 163, 1, 1),
('/get-in-contact', 163, 164, 1, 1),
('/!stacks/social-links', 164, 165, 1, 1),
('/!stacks/social-feed', 165, 166, 1, 1),
('/blog/new-dji-drone-and-my-first-arial-shots', 166, 168, 1, 1),
('/blog/building-a-hobbit-adventure-for-my-kids', 167, 169, 1, 1),
('/!drafts/170', 168, 170, 1, 1),
('/blog/entering-2017-with-a-new-desk-and-mindset', 169, 171, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PagePermissionAssignments`
--

CREATE TABLE `PagePermissionAssignments` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PagePermissionAssignments`
--

INSERT INTO `PagePermissionAssignments` (`cID`, `pkID`, `paID`) VALUES
(1, 1, 69),
(2, 1, 50),
(141, 1, 48),
(142, 1, 49),
(149, 1, 51),
(1, 2, 70),
(149, 2, 52),
(1, 3, 71),
(149, 3, 53),
(1, 4, 72),
(149, 4, 54),
(1, 5, 73),
(149, 5, 55),
(1, 6, 74),
(149, 6, 56),
(1, 7, 75),
(149, 7, 57),
(1, 8, 77),
(149, 8, 59),
(1, 9, 78),
(149, 9, 60),
(1, 10, 79),
(149, 10, 61),
(1, 11, 80),
(149, 11, 62),
(1, 12, 81),
(149, 12, 63),
(1, 13, 82),
(149, 13, 64),
(1, 14, 83),
(149, 14, 65),
(1, 15, 84),
(149, 15, 66),
(1, 16, 85),
(149, 16, 67),
(1, 17, 86),
(149, 17, 68),
(1, 18, 76),
(149, 18, 58);

-- --------------------------------------------------------

--
-- Table structure for table `PagePermissionPageTypeAccessList`
--

CREATE TABLE `PagePermissionPageTypeAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `permission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `externalLink` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PagePermissionPageTypeAccessListCustom`
--

CREATE TABLE `PagePermissionPageTypeAccessListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ptID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PagePermissionPropertyAccessList`
--

CREATE TABLE `PagePermissionPropertyAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` tinyint(1) DEFAULT '0',
  `publicDateTime` tinyint(1) DEFAULT '0',
  `uID` tinyint(1) DEFAULT '0',
  `description` tinyint(1) DEFAULT '0',
  `paths` tinyint(1) DEFAULT '0',
  `attributePermission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PagePermissionPropertyAttributeAccessListCustom`
--

CREATE TABLE `PagePermissionPropertyAttributeAccessListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `akID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PagePermissionThemeAccessList`
--

CREATE TABLE `PagePermissionThemeAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `permission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PagePermissionThemeAccessListCustom`
--

CREATE TABLE `PagePermissionThemeAccessListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pThemeID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Pages`
--

CREATE TABLE `Pages` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `siteTreeID` int(10) UNSIGNED DEFAULT '0',
  `ptID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cIsTemplate` tinyint(1) NOT NULL DEFAULT '0',
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `cIsCheckedOut` tinyint(1) NOT NULL DEFAULT '0',
  `cCheckedOutUID` int(10) UNSIGNED DEFAULT NULL,
  `cCheckedOutDatetime` datetime DEFAULT NULL,
  `cCheckedOutDatetimeLastEdit` datetime DEFAULT NULL,
  `cOverrideTemplatePermissions` tinyint(1) NOT NULL DEFAULT '1',
  `cInheritPermissionsFromCID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cInheritPermissionsFrom` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PARENT',
  `cFilename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cPointerID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cPointerExternalLink` longtext COLLATE utf8_unicode_ci,
  `cPointerExternalLinkNewWindow` tinyint(1) NOT NULL DEFAULT '0',
  `cIsActive` tinyint(1) NOT NULL DEFAULT '1',
  `cChildren` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cDisplayOrder` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cParentID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cDraftTargetParentPageID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cCacheFullPageContent` smallint(6) NOT NULL DEFAULT '-1',
  `cCacheFullPageContentOverrideLifetime` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `cCacheFullPageContentLifetimeCustom` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cIsSystemPage` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Pages`
--

INSERT INTO `Pages` (`cID`, `siteTreeID`, `ptID`, `cIsTemplate`, `uID`, `cIsCheckedOut`, `cCheckedOutUID`, `cCheckedOutDatetime`, `cCheckedOutDatetimeLastEdit`, `cOverrideTemplatePermissions`, `cInheritPermissionsFromCID`, `cInheritPermissionsFrom`, `cFilename`, `cPointerID`, `cPointerExternalLink`, `cPointerExternalLinkNewWindow`, `cIsActive`, `cChildren`, `cDisplayOrder`, `cParentID`, `pkgID`, `cDraftTargetParentPageID`, `cCacheFullPageContent`, `cCacheFullPageContentOverrideLifetime`, `cCacheFullPageContentLifetimeCustom`, `cIsSystemPage`) VALUES
(1, 1, 6, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'OVERRIDE', NULL, 0, NULL, 0, 1, 17, 0, 0, 0, 0, -1, '0', 0, 0),
(2, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'OVERRIDE', '/dashboard/view.php', 0, NULL, 0, 1, 11, 0, 0, 0, 0, -1, '0', 0, 1),
(3, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/view.php', 0, NULL, 0, 1, 3, 1, 2, 0, 0, -1, '0', 0, 1),
(4, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/full.php', 0, NULL, 0, 1, 0, 0, 3, 0, 0, -1, '0', 0, 1),
(5, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/explore.php', 0, NULL, 0, 1, 0, 1, 3, 0, 0, -1, '0', 0, 1),
(6, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/sitemap/search.php', 0, NULL, 0, 1, 0, 2, 3, 0, 0, -1, '0', 0, 1),
(7, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/view.php', 0, NULL, 0, 1, 4, 2, 2, 0, 0, -1, '0', 0, 1),
(8, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/search.php', 0, NULL, 0, 1, 0, 0, 7, 0, 0, -1, '0', 0, 1),
(9, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/attributes.php', 0, NULL, 0, 1, 0, 1, 7, 0, 0, -1, '0', 0, 1),
(10, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/sets.php', 0, NULL, 0, 1, 0, 2, 7, 0, 0, -1, '0', 0, 1),
(11, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/files/add_set.php', 0, NULL, 0, 1, 0, 3, 7, 0, 0, -1, '0', 0, 1),
(12, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/view.php', 0, NULL, 0, 1, 7, 3, 2, 0, 0, -1, '0', 0, 1),
(13, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/search.php', 0, NULL, 0, 1, 0, 0, 12, 0, 0, -1, '0', 0, 1),
(14, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/groups.php', 0, NULL, 0, 1, 1, 1, 12, 0, 0, -1, '0', 0, 1),
(15, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/attributes.php', 0, NULL, 0, 1, 0, 2, 12, 0, 0, -1, '0', 0, 1),
(16, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/add.php', 0, NULL, 0, 1, 0, 3, 12, 0, 0, -1, '0', 0, 1),
(17, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/add_group.php', 0, NULL, 0, 1, 0, 4, 12, 0, 0, -1, '0', 0, 1),
(18, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/groups/bulkupdate.php', 0, NULL, 0, 1, 0, 0, 14, 0, 0, -1, '0', 0, 1),
(19, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/group_sets.php', 0, NULL, 0, 1, 0, 5, 12, 0, 0, -1, '0', 0, 1),
(20, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/points/view.php', 0, NULL, 0, 1, 2, 6, 12, 0, 0, -1, '0', 0, 1),
(21, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/points/assign.php', 0, NULL, 0, 1, 0, 0, 20, 0, 0, -1, '0', 0, 1),
(22, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/users/points/actions.php', 0, NULL, 0, 1, 0, 1, 20, 0, 0, -1, '0', 0, 1),
(23, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/express/view.php', 0, NULL, 0, 1, 1, 4, 2, 0, 0, -1, '0', 0, 1),
(24, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/express/entries.php', 0, NULL, 0, 1, 0, 0, 23, 0, 0, -1, '0', 0, 1),
(25, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports.php', 0, NULL, 0, 1, 3, 5, 2, 0, 0, -1, '0', 0, 1),
(26, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/forms.php', 0, NULL, 0, 1, 1, 0, 25, 0, 0, -1, '0', 0, 1),
(27, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/forms/legacy.php', 0, NULL, 0, 1, 0, 0, 26, 0, 0, -1, '0', 0, 1),
(28, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/surveys.php', 0, NULL, 0, 1, 0, 1, 25, 0, 0, -1, '0', 0, 1),
(29, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/reports/logs.php', 0, NULL, 0, 1, 0, 2, 25, 0, 0, -1, '0', 0, 1),
(30, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/view.php', 0, NULL, 0, 1, 6, 6, 2, 0, 0, -1, '0', 0, 1),
(31, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/themes/view.php', 0, NULL, 0, 1, 1, 0, 30, 0, 0, -1, '0', 0, 1),
(32, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/themes/inspect.php', 0, NULL, 0, 1, 0, 0, 31, 0, 0, -1, '0', 0, 1),
(33, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/view.php', 0, NULL, 0, 1, 6, 1, 30, 0, 0, -1, '0', 0, 1),
(34, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/organize.php', 0, NULL, 0, 1, 0, 0, 33, 0, 0, -1, '0', 0, 1),
(35, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/add.php', 0, NULL, 0, 1, 0, 1, 33, 0, 0, -1, '0', 0, 1),
(36, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/form.php', 0, NULL, 0, 1, 0, 2, 33, 0, 0, -1, '0', 0, 1),
(37, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/output.php', 0, NULL, 0, 1, 0, 3, 33, 0, 0, -1, '0', 0, 1),
(38, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/attributes.php', 0, NULL, 0, 1, 0, 4, 33, 0, 0, -1, '0', 0, 1),
(39, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/types/permissions.php', 0, NULL, 0, 1, 0, 5, 33, 0, 0, -1, '0', 0, 1),
(40, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/templates/view.php', 0, NULL, 0, 1, 1, 2, 30, 0, 0, -1, '0', 0, 1),
(41, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/templates/add.php', 0, NULL, 0, 1, 0, 0, 40, 0, 0, -1, '0', 0, 1),
(42, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/attributes.php', 0, NULL, 0, 1, 0, 3, 30, 0, 0, -1, '0', 0, 1),
(43, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/single.php', 0, NULL, 0, 1, 0, 4, 30, 0, 0, -1, '0', 0, 1),
(44, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/pages/feeds.php', 0, NULL, 0, 1, 0, 5, 30, 0, 0, -1, '0', 0, 1),
(45, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/conversations/view.php', 0, NULL, 0, 1, 1, 7, 2, 0, 0, -1, '0', 0, 1),
(46, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/conversations/messages.php', 0, NULL, 0, 1, 0, 0, 45, 0, 0, -1, '0', 0, 1),
(47, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/view.php', 0, NULL, 0, 1, 3, 8, 2, 0, 0, -1, '0', 0, 1),
(48, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/stacks/view.php', 0, NULL, 0, 1, 1, 0, 47, 0, 0, -1, '0', 0, 1),
(49, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/permissions.php', 0, NULL, 0, 1, 0, 1, 47, 0, 0, -1, '0', 0, 1),
(50, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/stacks/list/view.php', 0, NULL, 0, 1, 0, 0, 48, 0, 0, -1, '0', 0, 1),
(51, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/blocks/types/view.php', 0, NULL, 0, 1, 0, 2, 47, 0, 0, -1, '0', 0, 1),
(52, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/view.php', 0, NULL, 0, 1, 5, 9, 2, 0, 0, -1, '0', 0, 1),
(53, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/install.php', 0, NULL, 0, 1, 0, 0, 52, 0, 0, -1, '0', 0, 1),
(54, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/update.php', 0, NULL, 0, 1, 0, 1, 52, 0, 0, -1, '0', 0, 1),
(55, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/connect.php', 0, NULL, 0, 1, 0, 2, 52, 0, 0, -1, '0', 0, 1),
(56, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/themes.php', 0, NULL, 0, 1, 0, 3, 52, 0, 0, -1, '0', 0, 1),
(57, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/extend/addons.php', 0, NULL, 0, 1, 0, 4, 52, 0, 0, -1, '0', 0, 1),
(58, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/view.php', 0, NULL, 0, 1, 13, 10, 2, 0, 0, -1, '0', 0, 1),
(59, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/view.php', 0, NULL, 0, 1, 8, 0, 58, 0, 0, -1, '0', 0, 1),
(60, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/name.php', 0, NULL, 0, 1, 0, 0, 59, 0, 0, -1, '0', 0, 1),
(61, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/accessibility.php', 0, NULL, 0, 1, 0, 1, 59, 0, 0, -1, '0', 0, 1),
(62, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/social.php', 0, NULL, 0, 1, 0, 2, 59, 0, 0, -1, '0', 0, 1),
(63, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/icons.php', 0, NULL, 0, 1, 0, 3, 59, 0, 0, -1, '0', 0, 1),
(64, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/editor.php', 0, NULL, 0, 1, 0, 4, 59, 0, 0, -1, '0', 0, 1),
(65, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/multilingual/view.php', 0, NULL, 0, 1, 0, 5, 59, 0, 0, -1, '0', 0, 1),
(66, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/timezone.php', 0, NULL, 0, 1, 0, 6, 59, 0, 0, -1, '0', 0, 1),
(67, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/basics/attributes.php', 0, NULL, 0, 1, 0, 7, 59, 0, 0, -1, '0', 0, 1),
(68, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/view.php', 0, NULL, 0, 1, 2, 1, 58, 0, 0, -1, '0', 0, 1),
(69, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/entities.php', 0, NULL, 0, 1, 5, 0, 68, 0, 0, -1, '0', 0, 1),
(70, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/entities/attributes.php', 0, NULL, 0, 1, 0, 0, 69, 0, 0, -1, '0', 0, 1),
(71, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/entities/associations.php', 0, NULL, 0, 1, 0, 1, 69, 0, 0, -1, '0', 0, 1),
(72, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/entities/forms.php', 0, NULL, 0, 1, 0, 2, 69, 0, 0, -1, '0', 0, 1),
(73, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/entities/customize_search.php', 0, NULL, 0, 1, 0, 3, 69, 0, 0, -1, '0', 0, 1),
(74, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/entities/order_entries.php', 0, NULL, 0, 1, 0, 4, 69, 0, 0, -1, '0', 0, 1),
(75, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/express/entries.php', 0, NULL, 0, 1, 0, 1, 68, 0, 0, -1, '0', 0, 1),
(76, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multilingual/view.php', 0, NULL, 0, 1, 4, 2, 58, 0, 0, -1, '0', 0, 1),
(77, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multilingual/setup.php', 0, NULL, 0, 1, 0, 0, 76, 0, 0, -1, '0', 0, 1),
(78, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multilingual/copy.php', 0, NULL, 0, 1, 0, 1, 76, 0, 0, -1, '0', 0, 1),
(79, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multilingual/page_report.php', 0, NULL, 0, 1, 0, 2, 76, 0, 0, -1, '0', 0, 1),
(80, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/multilingual/translate_interface.php', 0, NULL, 0, 1, 0, 3, 76, 0, 0, -1, '0', 0, 1),
(81, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/view.php', 0, NULL, 0, 1, 5, 3, 58, 0, 0, -1, '0', 0, 1),
(82, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/urls.php', 0, NULL, 0, 1, 0, 0, 81, 0, 0, -1, '0', 0, 1),
(83, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/bulk.php', 0, NULL, 0, 1, 0, 1, 81, 0, 0, -1, '0', 0, 1),
(84, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/codes.php', 0, NULL, 0, 1, 0, 2, 81, 0, 0, -1, '0', 0, 1),
(85, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/excluded.php', 0, NULL, 0, 1, 0, 3, 81, 0, 0, -1, '0', 0, 1),
(86, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/seo/searchindex.php', 0, NULL, 0, 1, 0, 4, 81, 0, 0, -1, '0', 0, 1),
(87, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/view.php', 0, NULL, 0, 1, 5, 4, 58, 0, 0, -1, '0', 0, 1),
(88, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/permissions.php', 0, NULL, 0, 1, 0, 0, 87, 0, 0, -1, '0', 0, 1),
(89, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/filetypes.php', 0, NULL, 0, 1, 0, 1, 87, 0, 0, -1, '0', 0, 1),
(90, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/thumbnails.php', 0, NULL, 0, 1, 0, 2, 87, 0, 0, -1, '0', 0, 1),
(91, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/image_uploading.php', 0, NULL, 0, 1, 0, 3, 87, 0, 0, -1, '0', 0, 1),
(92, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/files/storage.php', 0, NULL, 0, 1, 0, 4, 87, 0, 0, -1, '0', 0, 1),
(93, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/view.php', 0, NULL, 0, 1, 4, 5, 58, 0, 0, -1, '0', 0, 1),
(94, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/cache.php', 0, NULL, 0, 1, 0, 0, 93, 0, 0, -1, '0', 0, 1),
(95, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/clearcache.php', 0, NULL, 0, 1, 0, 1, 93, 0, 0, -1, '0', 0, 1),
(96, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/jobs.php', 0, NULL, 0, 1, 0, 2, 93, 0, 0, -1, '0', 0, 1),
(97, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/optimization/query_log.php', 0, NULL, 0, 1, 0, 3, 93, 0, 0, -1, '0', 0, 1),
(98, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/view.php', 0, NULL, 0, 1, 9, 6, 58, 0, 0, -1, '0', 0, 1),
(99, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/site.php', 0, NULL, 0, 1, 0, 0, 98, 0, 0, -1, '0', 0, 1),
(100, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/tasks.php', 0, NULL, 0, 1, 0, 1, 98, 0, 0, -1, '0', 0, 1),
(101, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/users.php', 0, NULL, 0, 1, 0, 2, 98, 0, 0, -1, '0', 0, 1),
(102, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/advanced.php', 0, NULL, 0, 1, 0, 3, 98, 0, 0, -1, '0', 0, 1),
(103, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/workflows.php', 0, NULL, 0, 1, 0, 4, 98, 0, 0, -1, '0', 0, 1),
(104, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/blacklist.php', 0, NULL, 0, 1, 0, 5, 98, 0, 0, -1, '0', 0, 1),
(105, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/captcha.php', 0, NULL, 0, 1, 0, 6, 98, 0, 0, -1, '0', 0, 1),
(106, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/antispam.php', 0, NULL, 0, 1, 0, 7, 98, 0, 0, -1, '0', 0, 1),
(107, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/permissions/maintenance.php', 0, NULL, 0, 1, 0, 8, 98, 0, 0, -1, '0', 0, 1),
(108, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/view.php', 0, NULL, 0, 1, 6, 7, 58, 0, 0, -1, '0', 0, 1),
(109, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/postlogin.php', 0, NULL, 0, 1, 0, 0, 108, 0, 0, -1, '0', 0, 1),
(110, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/profiles.php', 0, NULL, 0, 1, 0, 1, 108, 0, 0, -1, '0', 0, 1),
(111, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/open.php', 0, NULL, 0, 1, 0, 2, 108, 0, 0, -1, '0', 0, 1),
(112, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/authentication.php', 0, NULL, 0, 1, 0, 3, 108, 0, 0, -1, '0', 0, 1),
(113, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/global_password_reset.php', 0, NULL, 0, 1, 0, 4, 108, 0, 0, -1, '0', 0, 1),
(114, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/registration/notification.php', 0, NULL, 0, 1, 0, 5, 108, 0, 0, -1, '0', 0, 1),
(115, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/view.php', 0, NULL, 0, 1, 2, 8, 58, 0, 0, -1, '0', 0, 1),
(116, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/method.php', 0, NULL, 0, 1, 1, 0, 115, 0, 0, -1, '0', 0, 1),
(117, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/method/test.php', 0, NULL, 0, 1, 0, 0, 116, 0, 0, -1, '0', 0, 1),
(118, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/mail/importers.php', 0, NULL, 0, 1, 0, 1, 115, 0, 0, -1, '0', 0, 1),
(119, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/conversations/view.php', 0, NULL, 0, 1, 4, 9, 58, 0, 0, -1, '0', 0, 1),
(120, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/conversations/settings.php', 0, NULL, 0, 1, 0, 0, 119, 0, 0, -1, '0', 0, 1),
(121, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/conversations/points.php', 0, NULL, 0, 1, 0, 1, 119, 0, 0, -1, '0', 0, 1),
(122, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/conversations/bannedwords.php', 0, NULL, 0, 1, 0, 2, 119, 0, 0, -1, '0', 0, 1),
(123, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/conversations/permissions.php', 0, NULL, 0, 1, 0, 3, 119, 0, 0, -1, '0', 0, 1),
(124, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/view.php', 0, NULL, 0, 1, 3, 10, 58, 0, 0, -1, '0', 0, 1),
(125, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/sets.php', 0, NULL, 0, 1, 0, 0, 124, 0, 0, -1, '0', 0, 1),
(126, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/types.php', 0, NULL, 0, 1, 0, 1, 124, 0, 0, -1, '0', 0, 1),
(127, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/topics/view.php', 0, NULL, 0, 1, 1, 2, 124, 0, 0, -1, '0', 0, 1),
(128, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/attributes/topics/add.php', 0, NULL, 0, 1, 0, 0, 127, 0, 0, -1, '0', 0, 1),
(129, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/view.php', 0, NULL, 0, 1, 5, 11, 58, 0, 0, -1, '0', 0, 1),
(130, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/info.php', 0, NULL, 0, 1, 0, 0, 129, 0, 0, -1, '0', 0, 1),
(131, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/debug.php', 0, NULL, 0, 1, 0, 1, 129, 0, 0, -1, '0', 0, 1),
(132, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/logging.php', 0, NULL, 0, 1, 0, 2, 129, 0, 0, -1, '0', 0, 1),
(133, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/proxy.php', 0, NULL, 0, 1, 0, 3, 129, 0, 0, -1, '0', 0, 1),
(134, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/environment/entities.php', 0, NULL, 0, 1, 0, 4, 129, 0, 0, -1, '0', 0, 1),
(135, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/backup/view.php', 0, NULL, 0, 1, 2, 12, 58, 0, 0, -1, '0', 0, 1),
(136, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/backup/backup.php', 0, NULL, 0, 1, 0, 0, 135, 0, 0, -1, '0', 0, 1),
(137, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/system/backup/update.php', 0, NULL, 0, 1, 0, 1, 135, 0, 0, -1, '0', 0, 1),
(138, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', '/dashboard/welcome.php', 0, NULL, 0, 1, 1, 0, 2, 0, 0, -1, '0', 0, 1),
(139, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 2, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 138, 0, 0, -1, '0', 0, 1),
(140, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/!trash/view.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(141, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 141, 'OVERRIDE', '/login.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(142, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 142, 'OVERRIDE', '/register.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(143, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/account/view.php', 0, NULL, 0, 1, 3, 0, 0, 0, 0, -1, '0', 0, 1),
(144, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/account/edit_profile.php', 0, NULL, 0, 1, 0, 0, 143, 0, 0, -1, '0', 0, 1),
(145, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/account/avatar.php', 0, NULL, 0, 1, 0, 1, 143, 0, 0, -1, '0', 0, 1),
(146, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/account/messages.php', 0, NULL, 0, 1, 0, 2, 143, 0, 0, -1, '0', 0, 1),
(147, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/page_forbidden.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(148, 0, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/download_file.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(149, 1, 0, 0, 1, 0, NULL, NULL, NULL, 1, 149, 'OVERRIDE', '/!drafts/view.php', 0, NULL, 0, 1, 1, 0, 0, 0, 0, -1, '0', 0, 1),
(150, 1, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/!stacks/view.php', 0, NULL, 0, 1, 7, 0, 0, 0, 0, -1, '0', 0, 1),
(151, 1, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/page_not_found.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(152, 1, 0, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', '/desktop.php', 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 1),
(153, 1, 5, 1, NULL, 0, NULL, NULL, NULL, 1, 153, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(154, 1, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 0, 150, 0, 0, -1, '0', 0, 1),
(155, 1, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 1, 150, 0, 0, -1, '0', 0, 1),
(156, 1, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 2, 150, 0, 0, -1, '0', 0, 1),
(157, 1, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 3, 150, 0, 0, -1, '0', 0, 1),
(158, 1, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 4, 150, 0, 0, -1, '0', 0, 1),
(159, 1, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 1, 1, 0, 1, -1, '0', 0, 0),
(160, 1, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 2, 1, 0, 1, -1, '0', 0, 0),
(161, 1, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 3, 3, 1, 0, 1, -1, '0', 0, 0),
(162, 1, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 4, 1, 0, 1, -1, '0', 0, 0),
(163, 1, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 5, 1, 0, 1, -1, '0', 0, 0),
(164, 1, 5, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 6, 1, 0, 1, -1, '0', 0, 0),
(165, 1, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 5, 150, 0, 0, -1, '0', 0, 1),
(166, 1, 1, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 6, 150, 0, 0, -1, '0', 0, 1),
(167, 1, 7, 1, NULL, 0, NULL, NULL, NULL, 1, 167, 'OVERRIDE', NULL, 0, NULL, 0, 1, 0, 0, 0, 0, 0, -1, '0', 0, 0),
(168, 1, 7, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 1, 161, 0, 161, -1, '0', 0, 0),
(169, 1, 7, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 2, 161, 0, 161, -1, '0', 0, 0),
(170, 1, 7, 0, 1, 0, NULL, NULL, NULL, 1, 149, 'PARENT', NULL, 0, NULL, 0, 0, 0, 0, 149, 0, 161, -1, '0', 0, 1),
(171, 1, 7, 0, 1, 0, NULL, NULL, NULL, 1, 1, 'PARENT', NULL, 0, NULL, 0, 1, 0, 3, 161, 0, 161, -1, '0', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `PageSearchIndex`
--

CREATE TABLE `PageSearchIndex` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `cName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cDescription` text COLLATE utf8_unicode_ci,
  `cPath` text COLLATE utf8_unicode_ci,
  `cDatePublic` datetime DEFAULT NULL,
  `cDateLastIndexed` datetime DEFAULT NULL,
  `cDateLastSitemapped` datetime DEFAULT NULL,
  `cRequiresReindex` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PageSearchIndex`
--

INSERT INTO `PageSearchIndex` (`cID`, `content`, `cName`, `cDescription`, `cPath`, `cDatePublic`, `cDateLastIndexed`, `cDateLastSitemapped`, `cRequiresReindex`) VALUES
(1, '', 'Home', '', '', '2017-05-22 15:59:25', '2017-05-24 11:11:40', NULL, 0),
(2, '', 'Dashboard', '', '/dashboard', '2017-05-22 15:59:51', '2017-05-22 16:08:35', NULL, 0),
(3, '', 'Sitemap', 'Whole world at a glance.', '/dashboard/sitemap', '2017-05-22 15:59:51', '2017-05-22 16:08:35', NULL, 0),
(4, '', 'Full Sitemap', '', '/dashboard/sitemap/full', '2017-05-22 15:59:51', '2017-05-22 16:08:35', NULL, 0),
(5, '', 'Flat View', '', '/dashboard/sitemap/explore', '2017-05-22 15:59:51', '2017-05-22 16:08:36', NULL, 0),
(6, '', 'Page Search', '', '/dashboard/sitemap/search', '2017-05-22 15:59:51', '2017-05-22 16:08:36', NULL, 0),
(7, '', 'Files', 'All documents and images.', '/dashboard/files', '2017-05-22 15:59:51', '2017-05-22 16:08:37', NULL, 0),
(8, '', 'File Manager', '', '/dashboard/files/search', '2017-05-22 15:59:51', '2017-05-22 16:08:37', NULL, 0),
(9, '', 'Attributes', '', '/dashboard/files/attributes', '2017-05-22 15:59:51', '2017-05-22 16:08:37', NULL, 0),
(10, '', 'File Sets', '', '/dashboard/files/sets', '2017-05-22 15:59:51', '2017-05-22 16:08:38', NULL, 0),
(11, '', 'Add File Set', '', '/dashboard/files/add_set', '2017-05-22 15:59:51', '2017-05-22 16:08:38', NULL, 0),
(12, '', 'Members', 'Add and manage the user accounts and groups on your website.', '/dashboard/users', '2017-05-22 15:59:51', '2017-05-22 16:08:38', NULL, 0),
(13, '', 'Search Users', '', '/dashboard/users/search', '2017-05-22 15:59:51', '2017-05-22 16:08:39', NULL, 0),
(14, '', 'User Groups', '', '/dashboard/users/groups', '2017-05-22 15:59:51', '2017-05-22 16:08:39', NULL, 0),
(15, '', 'Attributes', '', '/dashboard/users/attributes', '2017-05-22 15:59:51', '2017-05-22 16:08:39', NULL, 0),
(16, '', 'Add User', '', '/dashboard/users/add', '2017-05-22 15:59:51', '2017-05-22 16:08:40', NULL, 0),
(17, '', 'Add Group', '', '/dashboard/users/add_group', '2017-05-22 15:59:51', '2017-05-22 16:08:40', NULL, 0),
(18, '', 'Move Multiple Groups', '', '/dashboard/users/groups/bulkupdate', '2017-05-22 15:59:51', '2017-05-22 16:08:40', NULL, 0),
(19, '', 'Group Sets', '', '/dashboard/users/group_sets', '2017-05-22 15:59:51', '2017-05-22 16:08:41', NULL, 0),
(20, '', 'Community Points', NULL, '/dashboard/users/points', '2017-05-22 15:59:51', '2017-05-22 16:08:41', NULL, 0),
(21, '', 'Assign Points', NULL, '/dashboard/users/points/assign', '2017-05-22 15:59:51', '2017-05-22 16:08:41', NULL, 0),
(22, '', 'Actions', NULL, '/dashboard/users/points/actions', '2017-05-22 15:59:51', '2017-05-22 16:08:42', NULL, 0),
(23, '', 'Express', 'Express Data Objects', '/dashboard/express', '2017-05-22 15:59:51', '2017-05-22 16:08:42', NULL, 0),
(24, '', 'View Entries', '', '/dashboard/express/entries', '2017-05-22 15:59:52', '2017-05-22 16:08:42', NULL, 0),
(25, '', 'Reports', 'Get data from forms and logs.', '/dashboard/reports', '2017-05-22 15:59:52', '2017-05-22 16:08:43', NULL, 0),
(26, '', 'Form Results', 'Get submission data.', '/dashboard/reports/forms', '2017-05-22 15:59:52', '2017-05-22 16:08:43', NULL, 0),
(28, '', 'Surveys', '', '/dashboard/reports/surveys', '2017-05-22 15:59:52', '2017-05-22 16:08:44', NULL, 0),
(29, '', 'Logs', '', '/dashboard/reports/logs', '2017-05-22 15:59:52', '2017-05-22 16:08:44', NULL, 0),
(30, '', 'Pages & Themes', 'Reskin your site.', '/dashboard/pages', '2017-05-22 15:59:52', '2017-05-22 16:08:44', NULL, 0),
(31, '', 'Themes', 'Reskin your site.', '/dashboard/pages/themes', '2017-05-22 15:59:52', '2017-05-22 16:08:45', NULL, 0),
(32, '', 'Inspect', '', '/dashboard/pages/themes/inspect', '2017-05-22 15:59:52', '2017-05-22 16:08:45', NULL, 0),
(33, '', 'Page Types', '', '/dashboard/pages/types', '2017-05-22 15:59:52', '2017-05-22 16:08:46', NULL, 0),
(34, '', 'Organize Page Type Order', '', '/dashboard/pages/types/organize', '2017-05-22 15:59:52', '2017-05-22 16:08:47', NULL, 0),
(35, '', 'Add Page Type', '', '/dashboard/pages/types/add', '2017-05-22 15:59:52', '2017-05-22 16:08:47', NULL, 0),
(36, '', 'Compose Form', '', '/dashboard/pages/types/form', '2017-05-22 15:59:52', '2017-05-22 16:08:47', NULL, 0),
(37, '', 'Defaults and Output', '', '/dashboard/pages/types/output', '2017-05-22 15:59:52', '2017-05-22 16:08:48', NULL, 0),
(38, '', 'Page Type Attributes', '', '/dashboard/pages/types/attributes', '2017-05-22 15:59:52', '2017-05-22 16:08:48', NULL, 0),
(39, '', 'Page Type Permissions', '', '/dashboard/pages/types/permissions', '2017-05-22 15:59:52', '2017-05-22 16:08:48', NULL, 0),
(40, '', 'Page Templates', 'Form factors for pages in your site.', '/dashboard/pages/templates', '2017-05-22 15:59:52', '2017-05-22 16:08:49', NULL, 0),
(41, '', 'Add Page Template', 'Add page templates to your site.', '/dashboard/pages/templates/add', '2017-05-22 15:59:52', '2017-05-22 16:08:49', NULL, 0),
(42, '', 'Attributes', '', '/dashboard/pages/attributes', '2017-05-22 15:59:52', '2017-05-22 16:08:50', NULL, 0),
(43, '', 'Single Pages', '', '/dashboard/pages/single', '2017-05-22 15:59:52', '2017-05-22 16:08:50', NULL, 0),
(44, '', 'RSS Feeds', '', '/dashboard/pages/feeds', '2017-05-22 15:59:52', '2017-05-22 16:08:50', NULL, 0),
(45, '', 'Conversations', '', '/dashboard/conversations', '2017-05-22 15:59:52', '2017-05-22 16:08:51', NULL, 0),
(46, '', 'Messages', '', '/dashboard/conversations/messages', '2017-05-22 15:59:52', '2017-05-22 16:08:51', NULL, 0),
(47, '', 'Stacks & Blocks', 'Manage sitewide content and administer block types.', '/dashboard/blocks', '2017-05-22 15:59:52', '2017-05-22 16:08:51', NULL, 0),
(48, '', 'Stacks & Global Areas', 'Share content across your site.', '/dashboard/blocks/stacks', '2017-05-22 15:59:52', '2017-05-22 16:08:52', NULL, 0),
(49, '', 'Block & Stack Permissions', 'Control who can add blocks and stacks on your site.', '/dashboard/blocks/permissions', '2017-05-22 15:59:52', '2017-05-22 16:08:52', NULL, 0),
(51, '', 'Block Types', 'Manage the installed block types in your site.', '/dashboard/blocks/types', '2017-05-22 15:59:52', '2017-05-22 16:08:52', NULL, 0),
(52, '', 'Extend concrete5', '', '/dashboard/extend', '2017-05-22 15:59:52', '2017-05-22 16:08:53', NULL, 0),
(53, '', 'Add Functionality', 'Install add-ons & themes.', '/dashboard/extend/install', '2017-05-22 15:59:52', '2017-05-22 16:08:53', NULL, 0),
(54, '', 'Update Add-Ons', 'Update your installed packages.', '/dashboard/extend/update', '2017-05-22 15:59:52', '2017-05-22 16:08:54', NULL, 0),
(55, '', 'Connect to the Community', 'Connect to the concrete5 community.', '/dashboard/extend/connect', '2017-05-22 15:59:52', '2017-05-22 16:08:54', NULL, 0),
(56, '', 'Get More Themes', 'Download themes from concrete5.org.', '/dashboard/extend/themes', '2017-05-22 15:59:52', '2017-05-22 16:08:55', NULL, 0),
(57, '', 'Get More Add-Ons', 'Download add-ons from concrete5.org.', '/dashboard/extend/addons', '2017-05-22 15:59:52', '2017-05-22 16:08:55', NULL, 0),
(58, '', 'System & Settings', 'Secure and setup your site.', '/dashboard/system', '2017-05-22 15:59:52', '2017-05-22 16:08:56', NULL, 0),
(59, '', 'Basics', 'Basic information about your website.', '/dashboard/system/basics', '2017-05-22 15:59:52', '2017-05-22 16:08:57', NULL, 0),
(60, '', 'Name & Attributes', '', '/dashboard/system/basics/name', '2017-05-22 15:59:52', '2017-05-22 16:08:58', NULL, 0),
(61, '', 'Accessibility', '', '/dashboard/system/basics/accessibility', '2017-05-22 15:59:52', '2017-05-22 16:08:58', NULL, 0),
(62, '', 'Social Links', '', '/dashboard/system/basics/social', '2017-05-22 15:59:52', '2017-05-22 16:08:58', NULL, 0),
(63, '', 'Bookmark Icons', 'Bookmark icon and mobile home screen icon setup.', '/dashboard/system/basics/icons', '2017-05-22 15:59:52', '2017-05-22 16:08:59', NULL, 0),
(64, '', 'Rich Text Editor', '', '/dashboard/system/basics/editor', '2017-05-22 15:59:53', '2017-05-22 16:08:59', NULL, 0),
(65, '', 'Languages', '', '/dashboard/system/basics/multilingual', '2017-05-22 15:59:53', '2017-05-22 16:09:00', NULL, 0),
(66, '', 'Time Zone', '', '/dashboard/system/basics/timezone', '2017-05-22 15:59:53', '2017-05-22 16:09:00', NULL, 0),
(68, '', 'Express', 'Express', '/dashboard/system/express', '2017-05-22 15:59:53', '2017-05-22 16:09:01', NULL, 0),
(69, '', 'Data Objects', '', '/dashboard/system/express/entities', '2017-05-22 15:59:53', '2017-05-22 16:09:01', NULL, 0),
(70, '', 'Attributes', '', '/dashboard/system/express/entities/attributes', '2017-05-22 15:59:53', '2017-05-22 16:09:01', NULL, 0),
(71, '', 'Associations', '', '/dashboard/system/express/entities/associations', '2017-05-22 15:59:53', '2017-05-22 16:09:02', NULL, 0),
(72, '', 'Forms', '', '/dashboard/system/express/entities/forms', '2017-05-22 15:59:53', '2017-05-22 16:09:02', NULL, 0),
(73, '', 'Customize Search', '', '/dashboard/system/express/entities/customize_search', '2017-05-22 15:59:53', '2017-05-22 16:09:03', NULL, 0),
(74, '', 'Customize Search', '', '/dashboard/system/express/entities/order_entries', '2017-05-22 15:59:53', '2017-05-22 16:09:03', NULL, 0),
(75, '', 'Custom Entry Locations', '', '/dashboard/system/express/entries', '2017-05-22 15:59:53', '2017-05-22 16:09:03', NULL, 0),
(76, '', 'Multilingual', 'Run your site in multiple languages.', '/dashboard/system/multilingual', '2017-05-22 15:59:53', '2017-05-22 16:09:04', NULL, 0),
(77, '', 'Multilingual Setup', '', '/dashboard/system/multilingual/setup', '2017-05-22 15:59:53', '2017-05-22 16:09:04', NULL, 0),
(78, '', 'Copy Languages', '', '/dashboard/system/multilingual/copy', '2017-05-22 15:59:53', '2017-05-22 16:09:05', NULL, 0),
(79, '', 'Page Report', '', '/dashboard/system/multilingual/page_report', '2017-05-22 15:59:53', '2017-05-22 16:09:05', NULL, 0),
(80, '', 'Translate Site Interface', '', '/dashboard/system/multilingual/translate_interface', '2017-05-22 15:59:53', '2017-05-22 16:09:06', NULL, 0),
(81, '', 'SEO & Statistics', 'Enable pretty URLs and tracking codes.', '/dashboard/system/seo', '2017-05-22 15:59:53', '2017-05-22 16:09:06', NULL, 0),
(82, '', 'URLs and Redirection', '', '/dashboard/system/seo/urls', '2017-05-22 15:59:53', '2017-05-22 16:09:06', NULL, 0),
(83, '', 'Bulk SEO Updater', '', '/dashboard/system/seo/bulk', '2017-05-22 15:59:53', '2017-05-22 16:09:07', NULL, 0),
(84, '', 'Tracking Codes', '', '/dashboard/system/seo/codes', '2017-05-22 15:59:53', '2017-05-22 16:09:07', NULL, 0),
(85, '', 'Excluded URL Word List', '', '/dashboard/system/seo/excluded', '2017-05-22 15:59:53', '2017-05-22 16:09:07', NULL, 0),
(86, '', 'Search Index', '', '/dashboard/system/seo/searchindex', '2017-05-22 15:59:53', '2017-05-22 16:09:08', NULL, 0),
(87, '', 'Files', '', '/dashboard/system/files', '2017-05-22 15:59:53', '2017-05-22 16:09:08', NULL, 0),
(88, '', 'File Manager Permissions', '', '/dashboard/system/files/permissions', '2017-05-22 15:59:53', '2017-05-22 16:09:08', NULL, 0),
(89, '', 'Allowed File Types', '', '/dashboard/system/files/filetypes', '2017-05-22 15:59:54', '2017-05-22 16:09:09', NULL, 0),
(90, '', 'Thumbnails', '', '/dashboard/system/files/thumbnails', '2017-05-22 15:59:54', '2017-05-22 16:09:09', NULL, 0),
(91, '', 'Image Uploading', '', '/dashboard/system/files/image_uploading', '2017-05-22 15:59:54', '2017-05-22 16:09:09', NULL, 0),
(92, '', 'File Storage Locations', '', '/dashboard/system/files/storage', '2017-05-22 15:59:54', '2017-05-22 16:09:10', NULL, 0),
(93, '', 'Optimization', 'Keep your site running well.', '/dashboard/system/optimization', '2017-05-22 15:59:54', '2017-05-22 16:09:10', NULL, 0),
(94, '', 'Cache & Speed Settings', '', '/dashboard/system/optimization/cache', '2017-05-22 15:59:54', '2017-05-22 16:09:10', NULL, 0),
(95, '', 'Clear Cache', '', '/dashboard/system/optimization/clearcache', '2017-05-22 15:59:54', '2017-05-22 16:09:11', NULL, 0),
(96, '', 'Automated Jobs', '', '/dashboard/system/optimization/jobs', '2017-05-22 15:59:54', '2017-05-22 16:09:11', NULL, 0),
(97, '', 'Database Query Log', '', '/dashboard/system/optimization/query_log', '2017-05-22 15:59:54', '2017-05-22 16:09:12', NULL, 0),
(98, '', 'Permissions & Access', 'Control who sees and edits your site.', '/dashboard/system/permissions', '2017-05-22 15:59:54', '2017-05-22 16:09:12', NULL, 0),
(99, '', 'Site Access', '', '/dashboard/system/permissions/site', '2017-05-22 15:59:54', '2017-05-22 16:09:12', NULL, 0),
(100, '', 'Task Permissions', '', '/dashboard/system/permissions/tasks', '2017-05-22 15:59:54', '2017-05-22 16:09:13', NULL, 0),
(101, '', 'User Permissions', '', '/dashboard/system/permissions/users', '2017-05-22 15:59:54', '2017-05-22 16:09:13', NULL, 0),
(102, '', 'Advanced Permissions', '', '/dashboard/system/permissions/advanced', '2017-05-22 15:59:54', '2017-05-22 16:09:13', NULL, 0),
(103, '', 'Workflows', '', '/dashboard/system/permissions/workflows', '2017-05-22 15:59:54', '2017-05-22 16:09:14', NULL, 0),
(104, '', 'IP Blacklist', '', '/dashboard/system/permissions/blacklist', '2017-05-22 15:59:54', '2017-05-22 16:09:14', NULL, 0),
(105, '', 'Captcha Setup', '', '/dashboard/system/permissions/captcha', '2017-05-22 15:59:54', '2017-05-22 16:09:14', NULL, 0),
(106, '', 'Spam Control', '', '/dashboard/system/permissions/antispam', '2017-05-22 15:59:54', '2017-05-22 16:09:15', NULL, 0),
(107, '', 'Maintenance Mode', '', '/dashboard/system/permissions/maintenance', '2017-05-22 15:59:54', '2017-05-22 16:09:15', NULL, 0),
(108, '', 'Login & Registration', 'Change login behaviors and setup public profiles.', '/dashboard/system/registration', '2017-05-22 15:59:54', '2017-05-22 16:09:15', NULL, 0),
(109, '', 'Login Destination', '', '/dashboard/system/registration/postlogin', '2017-05-22 15:59:54', '2017-05-22 16:09:16', NULL, 0),
(110, '', 'Public Profiles', '', '/dashboard/system/registration/profiles', '2017-05-22 15:59:54', '2017-05-22 16:09:16', NULL, 0),
(111, '', 'Public Registration', '', '/dashboard/system/registration/open', '2017-05-22 15:59:54', '2017-05-22 16:09:16', NULL, 0),
(112, '', 'Authentication Types', '', '/dashboard/system/registration/authentication', '2017-05-22 15:59:54', '2017-05-22 16:09:17', NULL, 0),
(113, '', 'Global Password Reset', 'Signs out all users, resets all passwords and forces users to choose a new one', '/dashboard/system/registration/global_password_reset', '2017-05-22 15:59:54', '2017-05-22 16:09:17', NULL, 0),
(114, '', 'Notification Settings', '', '/dashboard/system/registration/notification', '2017-05-22 15:59:54', '2017-05-22 16:09:18', NULL, 0),
(115, '', 'Email', 'Control how your site send and processes mail.', '/dashboard/system/mail', '2017-05-22 15:59:54', '2017-05-22 16:09:18', NULL, 0),
(116, '', 'SMTP Method', '', '/dashboard/system/mail/method', '2017-05-22 15:59:54', '2017-05-22 16:09:18', NULL, 0),
(117, '', 'Test Mail Settings', '', '/dashboard/system/mail/method/test', '2017-05-22 15:59:55', '2017-05-22 16:09:19', NULL, 0),
(118, '', 'Email Importers', '', '/dashboard/system/mail/importers', '2017-05-22 15:59:55', '2017-05-22 16:09:19', NULL, 0),
(119, '', 'Conversations', 'Manage your conversations settings', '/dashboard/system/conversations', '2017-05-22 15:59:55', '2017-05-22 16:09:19', NULL, 0),
(120, '', 'Settings', '', '/dashboard/system/conversations/settings', '2017-05-22 15:59:55', '2017-05-22 16:09:20', NULL, 0),
(121, '', 'Community Points', '', '/dashboard/system/conversations/points', '2017-05-22 15:59:55', '2017-05-22 16:09:20', NULL, 0),
(122, '', 'Banned Words', '', '/dashboard/system/conversations/bannedwords', '2017-05-22 15:59:55', '2017-05-22 16:09:20', NULL, 0),
(123, '', 'Conversation Permissions', '', '/dashboard/system/conversations/permissions', '2017-05-22 15:59:55', '2017-05-22 16:09:21', NULL, 0),
(124, '', 'Attributes', 'Setup attributes for pages, users, files and more.', '/dashboard/system/attributes', '2017-05-22 15:59:55', '2017-05-22 16:09:21', NULL, 0),
(125, '', 'Sets', 'Group attributes into sets for easier organization', '/dashboard/system/attributes/sets', '2017-05-22 15:59:55', '2017-05-22 16:09:21', NULL, 0),
(126, '', 'Types', 'Choose which attribute types are available for different items.', '/dashboard/system/attributes/types', '2017-05-22 15:59:55', '2017-05-22 16:09:22', NULL, 0),
(127, '', 'Topics', '', '/dashboard/system/attributes/topics', '2017-05-22 15:59:55', '2017-05-22 16:09:22', NULL, 0),
(128, '', 'Add Topic Tree', '', '/dashboard/system/attributes/topics/add', '2017-05-22 15:59:55', '2017-05-22 16:09:22', NULL, 0),
(130, '', 'Environment Information', '', '/dashboard/system/environment/info', '2017-05-22 15:59:55', '2017-05-22 16:09:23', NULL, 0),
(131, '', 'Debug Settings', '', '/dashboard/system/environment/debug', '2017-05-22 15:59:55', '2017-05-22 16:09:23', NULL, 0),
(132, '', 'Logging Settings', '', '/dashboard/system/environment/logging', '2017-05-22 15:59:55', '2017-05-22 16:09:23', NULL, 0),
(133, '', 'Proxy Server', '', '/dashboard/system/environment/proxy', '2017-05-22 15:59:55', '2017-05-22 16:09:24', NULL, 0),
(134, '', 'Database Entities', '', '/dashboard/system/environment/entities', '2017-05-22 15:59:55', '2017-05-22 16:09:24', NULL, 0),
(135, '', 'Backup & Restore', 'Backup or restore your website.', '/dashboard/system/backup', '2017-05-22 15:59:55', '2017-05-22 16:09:25', NULL, 0),
(136, '', 'Backup Database', '', '/dashboard/system/backup/backup', '2017-05-22 15:59:55', '2017-05-22 16:09:25', NULL, 0),
(137, '', 'Update concrete5', '', '/dashboard/system/backup/update', '2017-05-22 15:59:55', '2017-05-22 16:09:25', NULL, 0),
(138, 'How to create rich text editor snippets Learn how to create and package rich text editor snippets  Interview with RunCloud A skype interview with the founders of concrete5 on RunCloud We\'re headed to PHPUK 2017! PHPUK is one of the largest PHP conferences in the world concrete5 Version 8.1.0 and New Express Documentation Now Available New update adds some minor feature improvements and a bunch of bug fixes.  ', 'Welcome', '', '/dashboard/welcome', '2017-05-22 15:59:55', '2017-05-22 16:09:26', NULL, 0),
(139, '', 'Waiting for Me', '', '/dashboard/welcome/me', '2017-05-22 15:59:56', '2017-05-22 16:09:26', NULL, 0),
(140, '', 'Trash', '', '/!trash', '2017-05-22 16:00:00', '2017-05-22 16:09:26', NULL, 0),
(141, '', 'Login', '', '/login', '2017-05-22 16:00:00', '2017-05-22 16:09:27', NULL, 0),
(142, '', 'Register', '', '/register', '2017-05-22 16:00:00', '2017-05-22 16:09:27', NULL, 0),
(143, '', 'My Account', '', '/account', '2017-05-22 16:00:00', '2017-05-22 16:09:27', NULL, 0),
(144, '', 'Edit Profile', 'Edit your user profile and change password.', '/account/edit_profile', '2017-05-22 16:00:00', '2017-05-22 16:09:28', NULL, 0),
(145, '', 'Profile Picture', 'Specify a new image attached to posts or edits.', '/account/avatar', '2017-05-22 16:00:00', '2017-05-22 16:09:28', NULL, 0),
(146, '', 'Private Messages', 'Inbox for site-specific messages.', '/account/messages', '2017-05-22 16:00:00', '2017-05-22 16:09:28', NULL, 0),
(147, '', 'Page Forbidden', '', '/page_forbidden', '2017-05-22 16:00:00', '2017-05-22 16:09:29', NULL, 0),
(148, '', 'Download File', '', '/download_file', '2017-05-22 16:00:00', '2017-05-22 16:09:29', NULL, 0),
(149, '', 'Drafts', '', '/!drafts', '2017-05-22 16:00:00', '2017-05-22 16:09:29', NULL, 0),
(150, '', 'Stacks', '', '/!stacks', '2017-05-22 16:00:00', '2017-05-22 16:09:30', NULL, 0),
(151, '', 'Page Not Found', '', '/page_not_found', '2017-05-22 16:00:00', '2017-05-22 16:09:30', NULL, 0),
(152, '', 'Welcome Back', '', '/account/welcome', '2017-05-22 16:00:00', '2017-05-22 16:09:30', NULL, 0),
(153, '', '', NULL, NULL, '2017-05-22 16:00:01', '2017-05-22 16:09:31', NULL, 0),
(154, 'Yeh, I’m a trusted and flexible geek who’s passionate about my family and the design & building of your\r\n Websites & Mobile Apps\r\n ', 'Header Site Title', NULL, '/!stacks/header-site-title', '2017-05-22 16:01:20', '2017-05-23 16:41:38', NULL, 0),
(155, '', 'Header Navigation', NULL, '/!stacks/header-navigation', '2017-05-22 16:01:21', '2017-05-23 15:27:19', NULL, 0),
(156, 'Copyright © 2017 Chris Watterston. All rights reserved. \r\n ', 'Footer Legal', NULL, '/!stacks/footer-legal', '2017-05-22 16:01:21', '2017-05-25 08:59:55', NULL, 0),
(157, '', 'Footer Navigation', NULL, '/!stacks/footer-navigation', '2017-05-22 16:01:21', '2017-05-23 15:25:45', NULL, 0),
(158, '\r\n	become a client\r\n	let’s talk?\r\n\r\n Contact.\r\n ', 'Footer Contact', NULL, '/!stacks/footer-contact', '2017-05-22 16:01:21', '2017-05-24 10:09:26', NULL, 0),
(159, '', 'Services', '', '/services', '2017-05-23 15:30:41', '2017-05-23 15:31:50', NULL, 0),
(160, '', 'About Us', '', '/about-us', '2017-05-23 15:30:55', '2017-05-23 15:31:50', NULL, 0),
(161, '', 'Blog', '', '/blog', '2017-05-23 15:31:03', '2017-05-23 15:31:50', NULL, 0),
(162, '', 'Case Studies', '', '/case-studies', '2017-05-23 15:31:17', '2017-05-23 15:31:50', NULL, 0),
(163, '', 'Store', '', '/store', '2017-05-23 15:31:28', '2017-05-23 15:31:50', NULL, 0),
(164, '', 'Get in Contact', '', '/get-in-contact', '2017-05-23 15:32:00', '2017-05-23 15:34:18', NULL, 0),
(165, '', 'Social Links', NULL, '/!stacks/social-links', '2017-05-24 10:14:23', '2017-05-25 11:00:42', NULL, 0),
(166, 'Instagram.\r\n Instagram feed here... ', 'Social Feed', NULL, '/!stacks/social-feed', '2017-05-24 10:15:54', '2017-05-25 10:13:01', NULL, 0),
(168, '', 'New DJI Drone and my first arial shots', 'Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', '/blog/new-dji-drone-and-my-first-arial-shots', '2017-05-24 10:53:00', '2017-05-24 12:57:18', NULL, 0),
(169, '', 'Building a Hobbit adventure for my kids', 'Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat. Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in.', '/blog/building-a-hobbit-adventure-for-my-kids', '2017-05-24 11:07:00', '2017-05-24 12:57:18', NULL, 0),
(171, '', 'Entering 2017 with a new desk and mindset', 'Adipiscing ante faucibus dictum ut at eu scelerisque orci a turpis quam imperdiet natoque malesuada suspendisse adipiscing suscipit habitasse ullamcorper pharetra vestibulum a viverra potenti dictumst in. Fusce ullamcorper maecenas turpis vestibulum arcu a nulla ornare parturient vestibulum ad ad class ac malesuada ut. Dis gravida a a curabitur parturient fringilla convallis hac at vehicula mus a auctor a mattis aliquam penatibus a vestibulum magna ante volutpat.', '/blog/entering-2017-with-a-new-desk-and-mindset', '2017-05-24 11:08:00', '2017-05-24 13:13:04', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `PageTemplates`
--

CREATE TABLE `PageTemplates` (
  `pTemplateID` int(11) NOT NULL,
  `pTemplateHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pTemplateIcon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pTemplateName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pTemplateIsInternal` tinyint(1) NOT NULL,
  `pkgID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PageTemplates`
--

INSERT INTO `PageTemplates` (`pTemplateID`, `pTemplateHandle`, `pTemplateIcon`, `pTemplateName`, `pTemplateIsInternal`, `pkgID`) VALUES
(1, 'core_stack', '', 'Stack', 1, 0),
(2, 'desktop', '', 'Desktop', 1, 0),
(3, 'dashboard_full', '', 'Dashboard Full', 1, 0),
(4, 'full', 'full.png', 'Full', 0, 0),
(5, 'home', 'blank.png', 'Home', 0, 0),
(6, 'blog', 'left_list.png', 'Blog', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `PageThemeCustomStyles`
--

CREATE TABLE `PageThemeCustomStyles` (
  `pThemeID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `scvlID` int(10) UNSIGNED DEFAULT '0',
  `preset` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sccRecordID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PageThemes`
--

CREATE TABLE `PageThemes` (
  `pThemeID` int(10) UNSIGNED NOT NULL,
  `pThemeHandle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pThemeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pThemeDescription` text COLLATE utf8_unicode_ci,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pThemeHasCustomClass` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PageThemes`
--

INSERT INTO `PageThemes` (`pThemeID`, `pThemeHandle`, `pThemeName`, `pThemeDescription`, `pkgID`, `pThemeHasCustomClass`) VALUES
(1, 'elemental', 'Elemental', 'Elegant, spacious theme with support for blogs, portfolios, layouts and more.', 0, 1),
(2, 'chriswatterston', 'Chris Watterston', 'The \'Chris Watterston\' theme has been designed and developed by Chris Watterston, for the use by \'Chris Watterston Designs\' in Sunbury-on-Thames, Surrey ONLY. Please contact hello@chriswatterston.com for all website and theme support.', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypeComposerControlTypes`
--

CREATE TABLE `PageTypeComposerControlTypes` (
  `ptComposerControlTypeID` int(10) UNSIGNED NOT NULL,
  `ptComposerControlTypeHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptComposerControlTypeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PageTypeComposerControlTypes`
--

INSERT INTO `PageTypeComposerControlTypes` (`ptComposerControlTypeID`, `ptComposerControlTypeHandle`, `ptComposerControlTypeName`, `pkgID`) VALUES
(1, 'core_page_property', 'Built-In Property', 0),
(2, 'collection_attribute', 'Custom Attribute', 0),
(3, 'block', 'Block', 0);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypeComposerFormLayoutSetControls`
--

CREATE TABLE `PageTypeComposerFormLayoutSetControls` (
  `ptComposerFormLayoutSetControlID` int(10) UNSIGNED NOT NULL,
  `ptComposerFormLayoutSetID` int(10) UNSIGNED DEFAULT '0',
  `ptComposerControlTypeID` int(10) UNSIGNED DEFAULT '0',
  `ptComposerControlObject` longtext COLLATE utf8_unicode_ci,
  `ptComposerFormLayoutSetControlDisplayOrder` int(10) UNSIGNED DEFAULT '0',
  `ptComposerFormLayoutSetControlCustomLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptComposerFormLayoutSetControlCustomTemplate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptComposerFormLayoutSetControlDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptComposerFormLayoutSetControlRequired` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PageTypeComposerFormLayoutSetControls`
--

INSERT INTO `PageTypeComposerFormLayoutSetControls` (`ptComposerFormLayoutSetControlID`, `ptComposerFormLayoutSetID`, `ptComposerControlTypeID`, `ptComposerControlObject`, `ptComposerFormLayoutSetControlDisplayOrder`, `ptComposerFormLayoutSetControlCustomLabel`, `ptComposerFormLayoutSetControlCustomTemplate`, `ptComposerFormLayoutSetControlDescription`, `ptComposerFormLayoutSetControlRequired`) VALUES
(1, 1, 1, 'O:78:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\NameCorePageProperty":12:{s:37:"\0*\0ptComposerControlRequiredByDefault";b:1;s:17:"\0*\0propertyHandle";s:4:"name";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:4:"name";s:24:"\0*\0ptComposerControlName";N;s:27:"\0*\0ptComposerControlIconSRC";N;s:33:"\0*\0ptComposerControlIconFormatter";O:48:"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter":1:{s:7:"\0*\0icon";s:9:"file-text";}s:20:"\0*\0ptComposerControl";N;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:31:"\0*\0ptComposerControlCustomLabel";N;s:31:"\0*\0ptComposerControlDescription";N;s:5:"error";s:0:"";}', 0, 'Page Name', NULL, NULL, 1),
(2, 1, 1, 'O:85:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\DescriptionCorePageProperty":12:{s:17:"\0*\0propertyHandle";s:11:"description";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:11:"description";s:24:"\0*\0ptComposerControlName";N;s:27:"\0*\0ptComposerControlIconSRC";N;s:33:"\0*\0ptComposerControlIconFormatter";O:48:"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter":1:{s:7:"\0*\0icon";s:4:"font";}s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:31:"\0*\0ptComposerControlCustomLabel";N;s:31:"\0*\0ptComposerControlDescription";N;s:5:"error";s:0:"";}', 1, NULL, NULL, NULL, 0),
(3, 1, 1, 'O:81:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\UrlSlugCorePageProperty":12:{s:17:"\0*\0propertyHandle";s:8:"url_slug";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:8:"url_slug";s:24:"\0*\0ptComposerControlName";N;s:27:"\0*\0ptComposerControlIconSRC";N;s:33:"\0*\0ptComposerControlIconFormatter";O:48:"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter":1:{s:7:"\0*\0icon";s:9:"file-text";}s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:31:"\0*\0ptComposerControlCustomLabel";N;s:31:"\0*\0ptComposerControlDescription";N;s:5:"error";s:0:"";}', 2, NULL, NULL, NULL, 0),
(4, 1, 1, 'O:86:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\PageTemplateCorePageProperty":12:{s:17:"\0*\0propertyHandle";s:13:"page_template";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:13:"page_template";s:24:"\0*\0ptComposerControlName";N;s:27:"\0*\0ptComposerControlIconSRC";N;s:33:"\0*\0ptComposerControlIconFormatter";O:48:"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter":1:{s:7:"\0*\0icon";s:8:"list-alt";}s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:31:"\0*\0ptComposerControlCustomLabel";N;s:31:"\0*\0ptComposerControlDescription";N;s:5:"error";s:0:"";}', 3, NULL, NULL, NULL, 0),
(5, 1, 1, 'O:87:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\PublishTargetCorePageProperty":12:{s:17:"\0*\0propertyHandle";s:14:"publish_target";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:14:"publish_target";s:24:"\0*\0ptComposerControlName";N;s:27:"\0*\0ptComposerControlIconSRC";N;s:33:"\0*\0ptComposerControlIconFormatter";O:48:"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter":1:{s:7:"\0*\0icon";s:8:"download";}s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:31:"\0*\0ptComposerControlCustomLabel";N;s:31:"\0*\0ptComposerControlDescription";N;s:5:"error";s:0:"";}', 4, NULL, NULL, NULL, 0),
(6, 2, 3, 'O:53:"Concrete\\Core\\Page\\Type\\Composer\\Control\\BlockControl":15:{s:7:"\0*\0btID";i:14;s:30:"\0*\0ptComposerControlTypeHandle";s:5:"block";s:5:"\0*\0bt";b:0;s:4:"\0*\0b";b:0;s:13:"\0*\0controller";N;s:30:"\0*\0ptComposerControlIdentifier";i:14;s:24:"\0*\0ptComposerControlName";s:7:"Content";s:27:"\0*\0ptComposerControlIconSRC";s:33:"/concrete/blocks/content/icon.png";s:33:"\0*\0ptComposerControlIconFormatter";N;s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:31:"\0*\0ptComposerControlCustomLabel";N;s:31:"\0*\0ptComposerControlDescription";N;s:5:"error";s:0:"";}', 0, 'Body', NULL, NULL, 0),
(7, 3, 1, 'O:78:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\NameCorePageProperty":12:{s:37:"\0*\0ptComposerControlRequiredByDefault";b:1;s:17:"\0*\0propertyHandle";s:4:"name";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:4:"name";s:24:"\0*\0ptComposerControlName";N;s:27:"\0*\0ptComposerControlIconSRC";N;s:33:"\0*\0ptComposerControlIconFormatter";O:48:"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter":1:{s:7:"\0*\0icon";s:9:"file-text";}s:20:"\0*\0ptComposerControl";N;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:31:"\0*\0ptComposerControlCustomLabel";N;s:31:"\0*\0ptComposerControlDescription";N;s:5:"error";s:0:"";}', 0, NULL, NULL, NULL, 1),
(10, 3, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":1:{s:7:"\0*\0akID";i:2;}', 1, '', '', '', 1),
(11, 4, 1, 'O:78:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\NameCorePageProperty":12:{s:37:"\0*\0ptComposerControlRequiredByDefault";b:1;s:17:"\0*\0propertyHandle";s:4:"name";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:4:"name";s:24:"\0*\0ptComposerControlName";N;s:27:"\0*\0ptComposerControlIconSRC";N;s:33:"\0*\0ptComposerControlIconFormatter";O:48:"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter":1:{s:7:"\0*\0icon";s:9:"file-text";}s:20:"\0*\0ptComposerControl";N;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:31:"\0*\0ptComposerControlCustomLabel";N;s:31:"\0*\0ptComposerControlDescription";N;s:5:"error";s:0:"";}', 0, NULL, NULL, NULL, 1),
(12, 4, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":1:{s:7:"\0*\0akID";i:2;}', 3, '', '', '', 1),
(13, 4, 1, 'O:81:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\UrlSlugCorePageProperty":12:{s:17:"\0*\0propertyHandle";s:8:"url_slug";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:8:"url_slug";s:24:"\0*\0ptComposerControlName";N;s:27:"\0*\0ptComposerControlIconSRC";N;s:33:"\0*\0ptComposerControlIconFormatter";O:48:"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter":1:{s:7:"\0*\0icon";s:9:"file-text";}s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:31:"\0*\0ptComposerControlCustomLabel";N;s:31:"\0*\0ptComposerControlDescription";N;s:5:"error";s:0:"";}', 1, NULL, NULL, NULL, 0),
(14, 4, 1, 'O:82:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\DateTimeCorePageProperty":12:{s:17:"\0*\0propertyHandle";s:9:"date_time";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:9:"date_time";s:24:"\0*\0ptComposerControlName";N;s:27:"\0*\0ptComposerControlIconSRC";N;s:33:"\0*\0ptComposerControlIconFormatter";O:48:"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter":1:{s:7:"\0*\0icon";s:8:"calendar";}s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:31:"\0*\0ptComposerControlCustomLabel";N;s:31:"\0*\0ptComposerControlDescription";N;s:5:"error";s:0:"";}', 5, NULL, NULL, NULL, 0),
(16, 5, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":1:{s:7:"\0*\0akID";i:20;}', 0, '', '', '', 1),
(17, 5, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":1:{s:7:"\0*\0akID";i:21;}', 1, '', '', '', 0),
(18, 5, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":1:{s:7:"\0*\0akID";i:22;}', 2, '', '', '', 1),
(19, 6, 1, 'O:78:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\NameCorePageProperty":12:{s:37:"\0*\0ptComposerControlRequiredByDefault";b:1;s:17:"\0*\0propertyHandle";s:4:"name";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:4:"name";s:24:"\0*\0ptComposerControlName";N;s:27:"\0*\0ptComposerControlIconSRC";N;s:33:"\0*\0ptComposerControlIconFormatter";O:48:"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter":1:{s:7:"\0*\0icon";s:9:"file-text";}s:20:"\0*\0ptComposerControl";N;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:31:"\0*\0ptComposerControlCustomLabel";N;s:31:"\0*\0ptComposerControlDescription";N;s:5:"error";s:0:"";}', 0, NULL, NULL, NULL, 1),
(20, 6, 1, 'O:81:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\UrlSlugCorePageProperty":12:{s:17:"\0*\0propertyHandle";s:8:"url_slug";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:8:"url_slug";s:24:"\0*\0ptComposerControlName";N;s:27:"\0*\0ptComposerControlIconSRC";N;s:33:"\0*\0ptComposerControlIconFormatter";O:48:"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter":1:{s:7:"\0*\0icon";s:9:"file-text";}s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:31:"\0*\0ptComposerControlCustomLabel";N;s:31:"\0*\0ptComposerControlDescription";N;s:5:"error";s:0:"";}', 1, NULL, NULL, NULL, 0),
(21, 6, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":1:{s:7:"\0*\0akID";i:2;}', 3, '', '', '', 1),
(22, 6, 1, 'O:82:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\DateTimeCorePageProperty":12:{s:17:"\0*\0propertyHandle";s:9:"date_time";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:9:"date_time";s:24:"\0*\0ptComposerControlName";N;s:27:"\0*\0ptComposerControlIconSRC";N;s:33:"\0*\0ptComposerControlIconFormatter";O:48:"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter":1:{s:7:"\0*\0icon";s:8:"calendar";}s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:31:"\0*\0ptComposerControlCustomLabel";N;s:31:"\0*\0ptComposerControlDescription";N;s:5:"error";s:0:"";}', 5, NULL, NULL, NULL, 0),
(23, 7, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":1:{s:7:"\0*\0akID";i:20;}', 0, '', '', '', 1),
(25, 7, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":1:{s:7:"\0*\0akID";i:22;}', 1, '', '', '', 1),
(26, 4, 1, 'O:85:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\DescriptionCorePageProperty":12:{s:17:"\0*\0propertyHandle";s:11:"description";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:11:"description";s:24:"\0*\0ptComposerControlName";N;s:27:"\0*\0ptComposerControlIconSRC";N;s:33:"\0*\0ptComposerControlIconFormatter";O:48:"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter":1:{s:7:"\0*\0icon";s:4:"font";}s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:31:"\0*\0ptComposerControlCustomLabel";N;s:31:"\0*\0ptComposerControlDescription";N;s:5:"error";s:0:"";}', 2, '', '', '', 1),
(27, 4, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":1:{s:7:"\0*\0akID";i:3;}', 4, '', '', '', 1),
(28, 6, 2, 'O:67:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CollectionAttributeControl":1:{s:7:"\0*\0akID";i:3;}', 4, '', '', '', 1),
(29, 6, 1, 'O:85:"Concrete\\Core\\Page\\Type\\Composer\\Control\\CorePageProperty\\DescriptionCorePageProperty":12:{s:17:"\0*\0propertyHandle";s:11:"description";s:30:"\0*\0ptComposerControlTypeHandle";s:18:"core_page_property";s:30:"\0*\0ptComposerControlIdentifier";s:11:"description";s:24:"\0*\0ptComposerControlName";N;s:27:"\0*\0ptComposerControlIconSRC";N;s:33:"\0*\0ptComposerControlIconFormatter";O:48:"Concrete\\Core\\Attribute\\FontAwesomeIconFormatter":1:{s:7:"\0*\0icon";s:4:"font";}s:20:"\0*\0ptComposerControl";N;s:37:"\0*\0ptComposerControlRequiredByDefault";b:0;s:41:"\0*\0ptComposerControlRequiredOnThisRequest";b:0;s:31:"\0*\0ptComposerControlCustomLabel";N;s:31:"\0*\0ptComposerControlDescription";N;s:5:"error";s:0:"";}', 2, '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypeComposerFormLayoutSets`
--

CREATE TABLE `PageTypeComposerFormLayoutSets` (
  `ptComposerFormLayoutSetID` int(10) UNSIGNED NOT NULL,
  `ptID` int(10) UNSIGNED DEFAULT '0',
  `ptComposerFormLayoutSetName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptComposerFormLayoutSetDescription` text COLLATE utf8_unicode_ci,
  `ptComposerFormLayoutSetDisplayOrder` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PageTypeComposerFormLayoutSets`
--

INSERT INTO `PageTypeComposerFormLayoutSets` (`ptComposerFormLayoutSetID`, `ptID`, `ptComposerFormLayoutSetName`, `ptComposerFormLayoutSetDescription`, `ptComposerFormLayoutSetDisplayOrder`) VALUES
(1, 5, 'Basics', '', 0),
(2, 5, 'Content', '', 1),
(3, 6, 'Default', '', 0),
(4, 7, 'Default', '', 0),
(5, 7, 'Bespoke', '', 1),
(6, 8, 'Default', '', 0),
(7, 8, 'Bespoke', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypeComposerOutputBlocks`
--

CREATE TABLE `PageTypeComposerOutputBlocks` (
  `ptComposerOutputBlockID` int(10) UNSIGNED NOT NULL,
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cvID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `arHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cbDisplayOrder` int(10) UNSIGNED DEFAULT '0',
  `ptComposerFormLayoutSetControlID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PageTypeComposerOutputBlocks`
--

INSERT INTO `PageTypeComposerOutputBlocks` (`ptComposerOutputBlockID`, `cID`, `cvID`, `arHandle`, `cbDisplayOrder`, `ptComposerFormLayoutSetControlID`, `bID`) VALUES
(2, 159, 1, 'Main', 0, 6, 25),
(4, 160, 1, 'Main', 0, 6, 27),
(6, 161, 1, 'Main', 0, 6, 29),
(8, 162, 1, 'Main', 0, 6, 31),
(10, 163, 1, 'Main', 0, 6, 33),
(12, 164, 1, 'Main', 0, 6, 35);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypeComposerOutputControls`
--

CREATE TABLE `PageTypeComposerOutputControls` (
  `ptComposerOutputControlID` int(10) UNSIGNED NOT NULL,
  `pTemplateID` int(10) UNSIGNED DEFAULT '0',
  `ptID` int(10) UNSIGNED DEFAULT '0',
  `ptComposerFormLayoutSetControlID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PageTypeComposerOutputControls`
--

INSERT INTO `PageTypeComposerOutputControls` (`ptComposerOutputControlID`, `pTemplateID`, `ptID`, `ptComposerFormLayoutSetControlID`) VALUES
(1, 4, 5, 6),
(2, 5, 5, 6),
(3, 6, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypePageTemplateDefaultPages`
--

CREATE TABLE `PageTypePageTemplateDefaultPages` (
  `pTemplateID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ptID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PageTypePageTemplateDefaultPages`
--

INSERT INTO `PageTypePageTemplateDefaultPages` (`pTemplateID`, `ptID`, `cID`) VALUES
(4, 5, 153),
(6, 7, 167);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypePageTemplates`
--

CREATE TABLE `PageTypePageTemplates` (
  `ptID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pTemplateID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PageTypePageTemplates`
--

INSERT INTO `PageTypePageTemplates` (`ptID`, `pTemplateID`) VALUES
(5, 5),
(6, 5),
(7, 6),
(8, 6);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypePermissionAssignments`
--

CREATE TABLE `PageTypePermissionAssignments` (
  `ptID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PageTypePermissionAssignments`
--

INSERT INTO `PageTypePermissionAssignments` (`ptID`, `pkID`, `paID`) VALUES
(1, 60, 9),
(2, 60, 9),
(3, 60, 9),
(4, 60, 9),
(5, 60, 9),
(6, 60, 9),
(7, 60, 9),
(8, 60, 9),
(1, 61, 9),
(2, 61, 9),
(3, 61, 9),
(4, 61, 9),
(5, 61, 9),
(6, 61, 9),
(7, 61, 9),
(8, 61, 9),
(1, 62, 9),
(2, 62, 9),
(3, 62, 9),
(4, 62, 9),
(5, 62, 9),
(6, 62, 9),
(7, 62, 9),
(8, 62, 9),
(1, 63, 9),
(2, 63, 9),
(3, 63, 9),
(4, 63, 9),
(5, 63, 9),
(6, 63, 9),
(7, 63, 9),
(8, 63, 9),
(1, 64, 31),
(2, 64, 32),
(3, 64, 33),
(4, 64, 34),
(5, 64, 36),
(6, 64, 101),
(7, 64, 102),
(8, 64, 104);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypePublishTargetTypes`
--

CREATE TABLE `PageTypePublishTargetTypes` (
  `ptPublishTargetTypeID` int(10) UNSIGNED NOT NULL,
  `ptPublishTargetTypeHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ptPublishTargetTypeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PageTypePublishTargetTypes`
--

INSERT INTO `PageTypePublishTargetTypes` (`ptPublishTargetTypeID`, `ptPublishTargetTypeHandle`, `ptPublishTargetTypeName`, `pkgID`) VALUES
(1, 'parent_page', 'Always publish below a certain page', 0),
(2, 'page_type', 'Choose from pages of a certain type', 0),
(3, 'all', 'Choose from all pages when publishing', 0);

-- --------------------------------------------------------

--
-- Table structure for table `PageTypes`
--

CREATE TABLE `PageTypes` (
  `ptID` int(10) UNSIGNED NOT NULL,
  `ptName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ptHandle` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ptPublishTargetTypeID` int(10) UNSIGNED DEFAULT NULL,
  `ptDefaultPageTemplateID` int(10) UNSIGNED DEFAULT NULL,
  `ptAllowedPageTemplates` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'A',
  `ptIsInternal` tinyint(1) NOT NULL DEFAULT '0',
  `ptIsFrequentlyAdded` tinyint(1) NOT NULL DEFAULT '1',
  `ptDisplayOrder` int(10) UNSIGNED DEFAULT NULL,
  `ptLaunchInComposer` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ptPublishTargetObject` longtext COLLATE utf8_unicode_ci,
  `siteTypeID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PageTypes`
--

INSERT INTO `PageTypes` (`ptID`, `ptName`, `ptHandle`, `ptPublishTargetTypeID`, `ptDefaultPageTemplateID`, `ptAllowedPageTemplates`, `ptIsInternal`, `ptIsFrequentlyAdded`, `ptDisplayOrder`, `ptLaunchInComposer`, `pkgID`, `ptPublishTargetObject`, `siteTypeID`) VALUES
(1, 'Stack', 'core_stack', 3, 0, 'A', 1, 0, 0, 0, 0, 'O:68:"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration":7:{s:21:"\0*\0selectorFormFactor";N;s:22:"\0*\0startingPointPageID";N;s:5:"error";s:0:"";s:21:"ptPublishTargetTypeID";s:1:"3";s:25:"ptPublishTargetTypeHandle";s:3:"all";s:9:"pkgHandle";b:0;s:17:"startingPointPage";N;}', 1),
(2, 'Stack Category', 'core_stack_category', 3, 0, 'A', 1, 0, 1, 0, 0, 'O:68:"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration":7:{s:21:"\0*\0selectorFormFactor";N;s:22:"\0*\0startingPointPageID";N;s:5:"error";s:0:"";s:21:"ptPublishTargetTypeID";s:1:"3";s:25:"ptPublishTargetTypeHandle";s:3:"all";s:9:"pkgHandle";b:0;s:17:"startingPointPage";N;}', 1),
(3, 'Desktop', 'core_desktop', 3, 0, 'A', 1, 0, 2, 0, 0, 'O:68:"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration":7:{s:21:"\0*\0selectorFormFactor";N;s:22:"\0*\0startingPointPageID";N;s:5:"error";s:0:"";s:21:"ptPublishTargetTypeID";s:1:"3";s:25:"ptPublishTargetTypeHandle";s:3:"all";s:9:"pkgHandle";b:0;s:17:"startingPointPage";N;}', 1),
(4, 'Dashboard Full', 'dashboard_full', 3, 0, 'A', 1, 0, 3, 0, 0, 'O:68:"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration":7:{s:21:"\0*\0selectorFormFactor";N;s:22:"\0*\0startingPointPageID";N;s:5:"error";s:0:"";s:21:"ptPublishTargetTypeID";s:1:"3";s:25:"ptPublishTargetTypeHandle";s:3:"all";s:9:"pkgHandle";b:0;s:17:"startingPointPage";N;}', 1),
(5, 'Page', 'default', 3, 4, 'X', 0, 1, 0, 0, 0, 'O:68:"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration":7:{s:21:"\0*\0selectorFormFactor";s:0:"";s:22:"\0*\0startingPointPageID";N;s:5:"error";s:0:"";s:21:"ptPublishTargetTypeID";s:1:"3";s:25:"ptPublishTargetTypeHandle";s:3:"all";s:9:"pkgHandle";b:0;s:17:"startingPointPage";s:1:"0";}', 1),
(6, 'Home', 'home', 3, 5, 'C', 0, 0, 1, 0, 0, 'O:68:"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\AllConfiguration":7:{s:21:"\0*\0selectorFormFactor";s:0:"";s:22:"\0*\0startingPointPageID";N;s:5:"error";s:0:"";s:21:"ptPublishTargetTypeID";s:1:"3";s:25:"ptPublishTargetTypeHandle";s:3:"all";s:9:"pkgHandle";b:0;s:17:"startingPointPage";s:1:"0";}', 1),
(7, 'Blog Update', 'blog_update', 1, 6, 'C', 0, 1, 2, 1, 0, 'O:75:"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\ParentPageConfiguration":5:{s:12:"\0*\0cParentID";s:3:"161";s:5:"error";s:0:"";s:21:"ptPublishTargetTypeID";s:1:"1";s:25:"ptPublishTargetTypeHandle";s:11:"parent_page";s:9:"pkgHandle";b:0;}', 1),
(8, 'Case Study Update', 'casestudy_update', 1, 6, 'C', 0, 1, 3, 1, 0, 'O:75:"Concrete\\Core\\Page\\Type\\PublishTarget\\Configuration\\ParentPageConfiguration":5:{s:12:"\0*\0cParentID";s:3:"162";s:5:"error";s:0:"";s:21:"ptPublishTargetTypeID";s:1:"1";s:25:"ptPublishTargetTypeHandle";s:11:"parent_page";s:9:"pkgHandle";b:0;}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `PageWorkflowProgress`
--

CREATE TABLE `PageWorkflowProgress` (
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `wpID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PageWorkflowProgress`
--

INSERT INTO `PageWorkflowProgress` (`cID`, `wpID`) VALUES
(158, 28);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccess`
--

CREATE TABLE `PermissionAccess` (
  `paID` int(10) UNSIGNED NOT NULL,
  `paIsInUse` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PermissionAccess`
--

INSERT INTO `PermissionAccess` (`paID`, `paIsInUse`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessEntities`
--

CREATE TABLE `PermissionAccessEntities` (
  `peID` int(10) UNSIGNED NOT NULL,
  `petID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PermissionAccessEntities`
--

INSERT INTO `PermissionAccessEntities` (`peID`, `petID`) VALUES
(1, 1),
(2, 1),
(6, 1),
(7, 2),
(3, 5),
(4, 6),
(5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessEntityGroups`
--

CREATE TABLE `PermissionAccessEntityGroups` (
  `pegID` int(10) UNSIGNED NOT NULL,
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PermissionAccessEntityGroups`
--

INSERT INTO `PermissionAccessEntityGroups` (`pegID`, `peID`, `gID`) VALUES
(1, 1, 3),
(2, 2, 1),
(3, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessEntityGroupSets`
--

CREATE TABLE `PermissionAccessEntityGroupSets` (
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gsID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessEntityTypeCategories`
--

CREATE TABLE `PermissionAccessEntityTypeCategories` (
  `petID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pkCategoryID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PermissionAccessEntityTypeCategories`
--

INSERT INTO `PermissionAccessEntityTypeCategories` (`petID`, `pkCategoryID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(6, 5),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(6, 6),
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(1, 8),
(2, 8),
(3, 8),
(4, 8),
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(1, 10),
(2, 10),
(3, 10),
(4, 10),
(1, 11),
(2, 11),
(3, 11),
(4, 11),
(1, 12),
(2, 12),
(3, 12),
(4, 12),
(1, 13),
(2, 13),
(3, 13),
(4, 13),
(1, 14),
(2, 14),
(3, 14),
(4, 14),
(1, 15),
(2, 15),
(3, 15),
(4, 15),
(5, 15),
(1, 16),
(2, 16),
(3, 16),
(4, 16),
(1, 17),
(2, 17),
(3, 17),
(4, 17),
(1, 18),
(2, 18),
(3, 18),
(4, 18),
(1, 19),
(2, 19),
(3, 19),
(4, 19),
(1, 20),
(2, 20),
(3, 20),
(4, 20),
(1, 21),
(2, 21),
(3, 21),
(4, 21),
(7, 21),
(1, 22),
(2, 22),
(3, 22),
(4, 22),
(7, 22),
(1, 23),
(2, 23),
(4, 23);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessEntityTypes`
--

CREATE TABLE `PermissionAccessEntityTypes` (
  `petID` int(10) UNSIGNED NOT NULL,
  `petHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `petName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PermissionAccessEntityTypes`
--

INSERT INTO `PermissionAccessEntityTypes` (`petID`, `petHandle`, `petName`, `pkgID`) VALUES
(1, 'group', 'Group', 0),
(2, 'user', 'User', 0),
(3, 'group_set', 'Group Set', 0),
(4, 'group_combination', 'Group Combination', 0),
(5, 'page_owner', 'Page Owner', 0),
(6, 'file_uploader', 'File Uploader', 0),
(7, 'conversation_message_author', 'Message Author', 0);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessEntityUsers`
--

CREATE TABLE `PermissionAccessEntityUsers` (
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PermissionAccessEntityUsers`
--

INSERT INTO `PermissionAccessEntityUsers` (`peID`, `uID`) VALUES
(7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessList`
--

CREATE TABLE `PermissionAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pdID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `accessType` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PermissionAccessList`
--

INSERT INTO `PermissionAccessList` (`paID`, `peID`, `pdID`, `accessType`) VALUES
(1, 1, 0, 10),
(2, 1, 0, 10),
(3, 1, 0, 10),
(4, 1, 0, 10),
(5, 1, 0, 10),
(6, 1, 0, 10),
(7, 1, 0, 10),
(8, 1, 0, 10),
(9, 1, 0, 10),
(10, 1, 0, 10),
(11, 1, 0, 10),
(12, 1, 0, 10),
(13, 1, 0, 10),
(14, 1, 0, 10),
(15, 1, 0, 10),
(16, 1, 0, 10),
(17, 1, 0, 10),
(18, 1, 0, 10),
(19, 1, 0, 10),
(20, 1, 0, 10),
(21, 1, 0, 10),
(22, 1, 0, 10),
(23, 1, 0, 10),
(24, 1, 0, 10),
(25, 1, 0, 10),
(26, 1, 0, 10),
(27, 1, 0, 10),
(27, 2, 0, 10),
(28, 1, 0, 10),
(28, 2, 0, 10),
(29, 1, 0, 10),
(30, 1, 0, 10),
(31, 3, 0, 10),
(32, 3, 0, 10),
(33, 3, 0, 10),
(34, 3, 0, 10),
(35, 1, 0, 10),
(36, 3, 0, 10),
(37, 2, 0, 10),
(38, 1, 0, 10),
(38, 2, 0, 10),
(39, 1, 0, 10),
(40, 1, 0, 10),
(41, 1, 0, 10),
(42, 1, 0, 10),
(43, 1, 0, 10),
(44, 1, 0, 10),
(45, 1, 0, 10),
(46, 1, 0, 10),
(47, 1, 0, 10),
(48, 2, 0, 10),
(49, 2, 0, 10),
(50, 1, 0, 10),
(51, 1, 0, 10),
(52, 1, 0, 10),
(53, 1, 0, 10),
(54, 1, 0, 10),
(55, 1, 0, 10),
(56, 1, 0, 10),
(57, 1, 0, 10),
(58, 1, 0, 10),
(59, 1, 0, 10),
(60, 1, 0, 10),
(61, 1, 0, 10),
(62, 1, 0, 10),
(63, 1, 0, 10),
(64, 1, 0, 10),
(65, 1, 0, 10),
(66, 1, 0, 10),
(67, 1, 0, 10),
(68, 1, 0, 10),
(69, 2, 0, 10),
(70, 1, 0, 10),
(71, 1, 0, 10),
(72, 1, 0, 10),
(73, 1, 0, 10),
(74, 1, 0, 10),
(75, 1, 0, 10),
(76, 1, 0, 10),
(77, 1, 0, 10),
(78, 1, 0, 10),
(79, 1, 0, 10),
(80, 1, 0, 10),
(81, 1, 0, 10),
(82, 1, 0, 10),
(83, 1, 0, 10),
(84, 1, 0, 10),
(85, 1, 0, 10),
(86, 1, 0, 10),
(87, 1, 0, 10),
(88, 1, 0, 10),
(89, 1, 0, 10),
(90, 1, 0, 10),
(91, 1, 0, 10),
(92, 2, 0, 10),
(93, 2, 0, 10),
(94, 1, 0, 10),
(94, 5, 0, 10),
(95, 1, 0, 10),
(95, 5, 0, 10),
(96, 1, 0, 10),
(96, 6, 0, 10),
(97, 1, 0, 10),
(98, 1, 0, 10),
(99, 1, 0, 10),
(100, 1, 0, 10),
(100, 7, 0, 10),
(101, 3, 0, 10),
(102, 3, 0, 10),
(103, 2, 0, 10),
(104, 3, 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAccessWorkflows`
--

CREATE TABLE `PermissionAccessWorkflows` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `wfID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionAssignments`
--

CREATE TABLE `PermissionAssignments` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PermissionAssignments`
--

INSERT INTO `PermissionAssignments` (`paID`, `pkID`) VALUES
(1, 19),
(2, 20),
(3, 75),
(4, 76),
(5, 77),
(6, 79),
(7, 80),
(8, 81),
(100, 82),
(9, 92),
(10, 94),
(11, 95),
(12, 96),
(13, 97),
(14, 98),
(15, 99),
(16, 100),
(17, 101),
(18, 102),
(19, 103),
(20, 104),
(21, 105),
(22, 106),
(29, 107),
(30, 108);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionDurationObjects`
--

CREATE TABLE `PermissionDurationObjects` (
  `pdID` int(10) UNSIGNED NOT NULL,
  `pdObject` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionKeyCategories`
--

CREATE TABLE `PermissionKeyCategories` (
  `pkCategoryID` int(10) UNSIGNED NOT NULL,
  `pkCategoryHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PermissionKeyCategories`
--

INSERT INTO `PermissionKeyCategories` (`pkCategoryID`, `pkCategoryHandle`, `pkgID`) VALUES
(1, 'page', NULL),
(2, 'single_page', NULL),
(3, 'stack', NULL),
(4, 'user', NULL),
(5, 'file_folder', NULL),
(6, 'file', NULL),
(7, 'area', NULL),
(8, 'block_type', NULL),
(9, 'block', NULL),
(10, 'admin', NULL),
(11, 'notification', NULL),
(12, 'sitemap', NULL),
(13, 'marketplace_newsflow', NULL),
(14, 'basic_workflow', NULL),
(15, 'page_type', NULL),
(16, 'gathering', NULL),
(17, 'group_tree_node', NULL),
(18, 'express_tree_node', NULL),
(19, 'category_tree_node', NULL),
(20, 'topic_tree_node', NULL),
(21, 'conversation', NULL),
(22, 'conversation_message', NULL),
(23, 'multilingual_section', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionKeys`
--

CREATE TABLE `PermissionKeys` (
  `pkID` int(10) UNSIGNED NOT NULL,
  `pkHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkCanTriggerWorkflow` tinyint(1) NOT NULL DEFAULT '0',
  `pkHasCustomClass` tinyint(1) NOT NULL DEFAULT '0',
  `pkDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pkCategoryID` int(10) UNSIGNED DEFAULT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PermissionKeys`
--

INSERT INTO `PermissionKeys` (`pkID`, `pkHandle`, `pkName`, `pkCanTriggerWorkflow`, `pkHasCustomClass`, `pkDescription`, `pkCategoryID`, `pkgID`) VALUES
(1, 'view_page', 'View', 0, 0, 'Can see a page exists and read its content.', 1, 0),
(2, 'view_page_versions', 'View Versions', 0, 0, 'Can view the page versions dialog and read past versions of a page.', 1, 0),
(3, 'view_page_in_sitemap', 'View Page in Sitemap', 0, 0, 'Controls whether a user can see a page in the sitemap or intelligent search.', 1, 0),
(4, 'preview_page_as_user', 'Preview Page As User', 0, 0, 'Ability to see what this page will look like at a specific time in the future as a specific user.', 1, 0),
(5, 'edit_page_properties', 'Edit Properties', 0, 1, 'Ability to change anything in the Page Properties menu.', 1, 0),
(6, 'edit_page_contents', 'Edit Contents', 0, 0, 'Ability to make edits to at least some of the content in the page. You can lock down different block areas and specific blocks by clicking Permissions on them as well. ', 1, 0),
(7, 'edit_page_speed_settings', 'Edit Speed Settings', 0, 0, 'Ability to change caching settings.', 1, 0),
(8, 'edit_page_theme', 'Change Theme', 0, 1, 'Ability to change just the theme for this page.', 1, 0),
(9, 'edit_page_template', 'Change Page Template', 0, 0, 'Ability to change just the page template for this page.', 1, 0),
(10, 'edit_page_page_type', 'Edit Page Type', 0, 0, 'Change the type of an existing page.', 1, 0),
(11, 'edit_page_permissions', 'Edit Permissions', 1, 0, 'Ability to change permissions for this page. Warning: by granting this a user could give themselves more access.', 1, 0),
(12, 'delete_page', 'Delete', 1, 0, 'Ability to move this page to the site\'s Trash.', 1, 0),
(13, 'delete_page_versions', 'Delete Versions', 1, 0, 'Ability to remove old versions of this page.', 1, 0),
(14, 'approve_page_versions', 'Approve Changes', 1, 0, 'Can publish an unapproved version of the page.', 1, 0),
(15, 'add_subpage', 'Add Sub-Page', 0, 1, 'Can add a page beneath the current page.', 1, 0),
(16, 'move_or_copy_page', 'Move or Copy Page', 1, 0, 'Can move or copy this page to another location.', 1, 0),
(17, 'schedule_page_contents_guest_access', 'Schedule Guest Access', 0, 0, 'Can control scheduled guest access to this page.', 1, 0),
(18, 'edit_page_multilingual_settings', 'Edit Multilingual Settings', 0, 0, 'Controls whether a user can see the multilingual settings menu, re-map a page or set a page as ignored in multilingual settings.', 1, 0),
(19, 'add_block', 'Add Block', 0, 1, 'Can add a block to any area on the site. If someone is added here they can add blocks to any area (unless that area has permissions that override these global permissions.)', 8, 0),
(20, 'add_stack', 'Add Stack', 0, 0, 'Can add a stack or block from a stack to any area on the site. If someone is added here they can add stacks to any area (unless that area has permissions that override these global permissions.)', 8, 0),
(21, 'view_area', 'View Area', 0, 0, 'Can view the area and its contents.', 7, 0),
(22, 'edit_area_contents', 'Edit Area Contents', 0, 0, 'Can edit blocks within this area.', 7, 0),
(23, 'add_block_to_area', 'Add Block to Area', 0, 1, 'Can add blocks to this area. This setting overrides the global Add Block permission for this area.', 7, 0),
(24, 'add_stack_to_area', 'Add Stack to Area', 0, 0, 'Can add stacks to this area. This setting overrides the global Add Stack permission for this area.', 7, 0),
(25, 'add_layout_to_area', 'Add Layouts to Area', 0, 0, 'Controls whether users get the ability to add layouts to a particular area.', 7, 0),
(26, 'edit_area_design', 'Edit Area Design', 0, 0, 'Controls whether users see design controls and can modify an area\'s custom CSS.', 7, 0),
(27, 'edit_area_permissions', 'Edit Area Permissions', 0, 0, 'Controls whether users can access the permissions on an area. Custom area permissions could override those of the page.', 7, 0),
(28, 'delete_area_contents', 'Delete Area Contents', 0, 0, 'Controls whether users can delete blocks from this area.', 7, 0),
(29, 'schedule_area_contents_guest_access', 'Schedule Guest Access', 0, 0, 'Controls whether users can schedule guest access permissions on blocks in this area. Guest Access is a shortcut for granting permissions just to the Guest Group.', 7, 0),
(30, 'view_block', 'View Block', 0, 0, 'Controls whether users can view this block in the page.', 9, 0),
(31, 'edit_block', 'Edit Block', 0, 0, 'Controls whether users can edit this block. This overrides any area or page permissions.', 9, 0),
(32, 'edit_block_custom_template', 'Change Custom Template', 0, 0, 'Controls whether users can change the custom template on this block. This overrides any area or page permissions.', 9, 0),
(33, 'edit_block_cache_settings', 'Edit Cache Settings', 0, 0, 'Controls whether users can change the block cache settings for this block instance.', 9, 0),
(34, 'edit_block_name', 'Edit Name', 0, 0, 'Controls whether users can change the block\'s name (rarely used.)', 9, 0),
(35, 'delete_block', 'Delete Block', 0, 0, 'Controls whether users can delete this block. This overrides any area or page permissions.', 9, 0),
(36, 'edit_block_design', 'Edit Design', 0, 0, 'Controls whether users can set custom design properties or CSS on this block.', 9, 0),
(37, 'edit_block_permissions', 'Edit Permissions', 0, 0, 'Controls whether users can change permissions on this block, potentially granting themselves or others greater access.', 9, 0),
(38, 'schedule_guest_access', 'Schedule Guest Access', 0, 0, 'Controls whether users can schedule guest access permissions on this block. Guest Access is a shortcut for granting permissions just to the Guest Group.', 9, 0),
(39, 'view_file_folder_file', 'View Files', 0, 0, 'View files within folder in the site.', 5, 0),
(40, 'search_file_folder', 'Search File Folder', 0, 0, 'See this file folder in the file manager', 5, 0),
(41, 'edit_file_folder', 'Edit File Folder', 0, 0, 'Edit a file folder.', 5, 0),
(42, 'edit_file_folder_file_properties', 'Edit File Properties', 0, 0, 'Can edit a file\'s properties.', 5, 0),
(43, 'edit_file_folder_file_contents', 'Edit File Contents', 0, 0, 'Can edit or replace files in folder.', 5, 0),
(44, 'copy_file_folder_files', 'Copy File', 0, 0, 'Can copy files in file folder.', 5, 0),
(45, 'edit_file_folder_permissions', 'Edit File Access', 0, 0, 'Can edit access to file folder.', 5, 0),
(46, 'delete_file_folder', 'Delete File Set', 0, 0, 'Can delete file folder.', 5, 0),
(47, 'delete_file_folder_files', 'Delete File', 0, 0, 'Can delete files in folder.', 5, 0),
(48, 'add_file', 'Add File', 0, 1, 'Can add files to folder.', 5, 0),
(49, 'view_file', 'View Files', 0, 0, 'Can view and download files.', 6, 0),
(50, 'view_file_in_file_manager', 'View File in File Manager', 0, 0, 'Can access the File Manager.', 6, 0),
(51, 'edit_file_properties', 'Edit File Properties', 0, 0, 'Can edit a file\'s properties.', 6, 0),
(52, 'edit_file_contents', 'Edit File Contents', 0, 0, 'Can edit or replace files.', 6, 0),
(53, 'copy_file', 'Copy File', 0, 0, 'Can copy file.', 6, 0),
(54, 'edit_file_permissions', 'Edit File Access', 0, 0, 'Can edit access to file.', 6, 0),
(55, 'delete_file', 'Delete File', 0, 0, 'Can delete file.', 6, 0),
(56, 'approve_basic_workflow_action', 'Approve or Deny', 0, 0, 'Grant ability to approve workflow.', 14, 0),
(57, 'notify_on_basic_workflow_entry', 'Notify on Entry', 0, 0, 'Notify approvers that a change has entered the workflow.', 14, 0),
(58, 'notify_on_basic_workflow_approve', 'Notify on Approve', 0, 0, 'Notify approvers that a change has been approved.', 14, 0),
(59, 'notify_on_basic_workflow_deny', 'Notify on Deny', 0, 0, 'Notify approvers that a change has been denied.', 14, 0),
(60, 'add_page_type', 'Add Pages of This Type', 0, 0, '', 15, 0),
(61, 'edit_page_type', 'Edit Page Type', 0, 0, '', 15, 0),
(62, 'delete_page_type', 'Delete Page Type', 0, 0, '', 15, 0),
(63, 'edit_page_type_permissions', 'Edit Page Type Permissions', 0, 0, '', 15, 0),
(64, 'edit_page_type_drafts', 'Edit Page Type Drafts', 0, 0, '', 15, 0),
(65, 'view_topic_tree_node', 'View Topic Tree Node', 0, 0, '', 20, 0),
(66, 'view_category_tree_node', 'View Category Tree Node', 0, 0, '', 19, 0),
(67, 'add_conversation_message', 'Add Message to Conversation', 0, 1, '', 21, 0),
(68, 'add_conversation_message_attachments', 'Add Message Attachments', 0, 0, '', 21, 0),
(69, 'edit_conversation_permissions', 'Edit Conversation Permissions', 0, 0, '', 21, 0),
(70, 'delete_conversation_message', 'Delete Message', 0, 0, '', 21, 0),
(71, 'edit_conversation_message', 'Edit Message', 0, 0, '', 21, 0),
(72, 'rate_conversation_message', 'Rate Message', 0, 0, '', 21, 0),
(73, 'flag_conversation_message', 'Flag Message', 0, 0, '', 21, 0),
(74, 'approve_conversation_message', 'Approve Message', 0, 0, '', 21, 0),
(75, 'edit_user_properties', 'Edit User Details', 0, 1, NULL, 4, 0),
(76, 'view_user_attributes', 'View User Attributes', 0, 1, NULL, 4, 0),
(77, 'activate_user', 'Activate/Deactivate User', 1, 0, NULL, 4, 0),
(78, 'sudo', 'Sign in as User', 0, 0, NULL, 4, 0),
(79, 'upgrade', 'Upgrade concrete5', 0, 0, NULL, 10, 0),
(80, 'access_group_search', 'Access Group Search', 0, 0, NULL, 4, 0),
(81, 'delete_user', 'Delete User', 1, 0, NULL, 4, 0),
(82, 'notify_in_notification_center', 'Notify in Notification Center', 0, 1, 'Controls who receives updates in the notification center.', 11, 0),
(83, 'view_express_entries', 'View Entries', 0, 0, NULL, 18, 0),
(84, 'add_express_entries', 'Add Entry', 0, 0, NULL, 18, 0),
(85, 'edit_express_entries', 'Edit Entry', 0, 0, NULL, 18, 0),
(86, 'delete_express_entries', 'Delete Entry', 0, 0, NULL, 18, 0),
(87, 'search_users_in_group', 'Search User Group', 0, 0, NULL, 17, 0),
(88, 'edit_group', 'Edit Group', 0, 0, NULL, 17, 0),
(89, 'assign_group', 'Assign Group', 0, 0, NULL, 17, 0),
(90, 'add_sub_group', 'Add Child Group', 0, 0, NULL, 17, 0),
(91, 'edit_group_permissions', 'Edit Group Permissions', 0, 0, NULL, 17, 0),
(92, 'access_page_type_permissions', 'Access Page Type Permissions', 0, 0, NULL, 10, 0),
(93, 'access_task_permissions', 'Access Task Permissions', 0, 0, NULL, 10, 0),
(94, 'access_sitemap', 'Access Sitemap', 0, 0, NULL, 12, 0),
(95, 'access_page_defaults', 'Access Page Type Defaults', 0, 0, NULL, 10, 0),
(96, 'customize_themes', 'Customize Themes', 0, 0, NULL, 10, 0),
(97, 'manage_layout_presets', 'Manage Layout Presets', 0, 0, NULL, 10, 0),
(98, 'empty_trash', 'Empty Trash', 0, 0, NULL, 10, 0),
(99, 'add_topic_tree', 'Add Topic Tree', 0, 0, NULL, 10, 0),
(100, 'remove_topic_tree', 'Remove Topic Tree', 0, 0, NULL, 10, 0),
(101, 'view_in_maintenance_mode', 'View Site in Maintenance Mode', 0, 0, 'Ability to see and use the website when concrete5 is in maintenance mode.', 10, 0),
(102, 'uninstall_packages', 'Uninstall Packages', 0, 0, NULL, 13, 0),
(103, 'install_packages', 'Install Packages', 0, 0, NULL, 13, 0),
(104, 'view_newsflow', 'View Newsflow', 0, 0, NULL, 13, 0),
(105, 'access_user_search_export', 'Export Site Users', 0, 0, 'Controls whether a user can export site users or not', 4, 0),
(106, 'access_user_search', 'Access User Search', 0, 0, 'Controls whether a user can view the search user interface.', 4, 0),
(107, 'edit_gatherings', 'Edit Gatherings', 0, 0, 'Can edit the footprint and items in all gatherings.', 10, 0),
(108, 'edit_gathering_items', 'Edit Gathering Items', 0, 0, '', 16, 0);

-- --------------------------------------------------------

--
-- Table structure for table `PileContents`
--

CREATE TABLE `PileContents` (
  `pcID` int(10) UNSIGNED NOT NULL,
  `pID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `itemID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `itemType` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `displayOrder` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Piles`
--

CREATE TABLE `Piles` (
  `pID` int(10) UNSIGNED NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Piles`
--

INSERT INTO `Piles` (`pID`, `uID`, `isDefault`, `timestamp`, `name`, `state`) VALUES
(1, 1, 1, '2017-05-23 14:21:27', NULL, 'READY');

-- --------------------------------------------------------

--
-- Table structure for table `PrivateMessageNotifications`
--

CREATE TABLE `PrivateMessageNotifications` (
  `msgID` int(10) UNSIGNED NOT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `QueueMessages`
--

CREATE TABLE `QueueMessages` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `queue_id` int(10) UNSIGNED NOT NULL,
  `handle` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `timeout` decimal(14,0) DEFAULT NULL,
  `created` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `QueuePageDuplicationRelations`
--

CREATE TABLE `QueuePageDuplicationRelations` (
  `queue_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `originalCID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Queues`
--

CREATE TABLE `Queues` (
  `queue_id` int(10) UNSIGNED NOT NULL,
  `queue_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `timeout` int(10) UNSIGNED NOT NULL DEFAULT '30'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SavedFileSearchQueries`
--

CREATE TABLE `SavedFileSearchQueries` (
  `id` int(11) NOT NULL,
  `presetName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query_fields` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:object)',
  `query_columns` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SavedPageSearchQueries`
--

CREATE TABLE `SavedPageSearchQueries` (
  `id` int(11) NOT NULL,
  `presetName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query_fields` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:object)',
  `query_columns` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SavedUserSearchQueries`
--

CREATE TABLE `SavedUserSearchQueries` (
  `id` int(11) NOT NULL,
  `presetName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query_fields` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:object)',
  `query_columns` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:object)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Sessions`
--

CREATE TABLE `Sessions` (
  `sessionID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sessionValue` text COLLATE utf8_unicode_ci NOT NULL,
  `sessionTime` int(10) UNSIGNED NOT NULL,
  `sessionLifeTime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiblingPageRelations`
--

CREATE TABLE `SiblingPageRelations` (
  `mpRelationID` int(10) UNSIGNED NOT NULL,
  `cID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SignupRequests`
--

CREATE TABLE `SignupRequests` (
  `id` int(11) NOT NULL,
  `ipFrom` tinyblob,
  `date_access` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteAttributeKeys`
--

CREATE TABLE `SiteAttributeKeys` (
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteAttributeValues`
--

CREATE TABLE `SiteAttributeValues` (
  `siteID` int(10) UNSIGNED NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteLocales`
--

CREATE TABLE `SiteLocales` (
  `siteLocaleID` int(10) UNSIGNED NOT NULL,
  `msIsDefault` tinyint(1) NOT NULL,
  `msLanguage` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `msCountry` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `msNumPlurals` int(11) NOT NULL,
  `msPluralRule` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `msPluralCases` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `siteID` int(10) UNSIGNED DEFAULT NULL,
  `siteTreeID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SiteLocales`
--

INSERT INTO `SiteLocales` (`siteLocaleID`, `msIsDefault`, `msLanguage`, `msCountry`, `msNumPlurals`, `msPluralRule`, `msPluralCases`, `siteID`, `siteTreeID`) VALUES
(1, 1, 'en', 'GB', 2, '(n != 1)', 'one@1\nother@0, 2~16, 100, 1000, 10000, 100000, 1000000, …', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Sites`
--

CREATE TABLE `Sites` (
  `siteID` int(10) UNSIGNED NOT NULL,
  `pThemeID` int(10) UNSIGNED NOT NULL,
  `siteIsDefault` tinyint(1) NOT NULL,
  `siteHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `siteTypeID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Sites`
--

INSERT INTO `Sites` (`siteID`, `pThemeID`, `siteIsDefault`, `siteHandle`, `siteTypeID`) VALUES
(1, 2, 1, 'default', 1);

-- --------------------------------------------------------

--
-- Table structure for table `SiteSearchIndexAttributes`
--

CREATE TABLE `SiteSearchIndexAttributes` (
  `siteID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTrees`
--

CREATE TABLE `SiteTrees` (
  `siteTreeID` int(10) UNSIGNED NOT NULL,
  `siteHomePageID` int(10) UNSIGNED NOT NULL,
  `treeType` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SiteTrees`
--

INSERT INTO `SiteTrees` (`siteTreeID`, `siteHomePageID`, `treeType`) VALUES
(1, 1, 'sitetree');

-- --------------------------------------------------------

--
-- Table structure for table `SiteTreeTrees`
--

CREATE TABLE `SiteTreeTrees` (
  `siteLocaleID` int(10) UNSIGNED DEFAULT NULL,
  `siteTreeID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SiteTreeTrees`
--

INSERT INTO `SiteTreeTrees` (`siteLocaleID`, `siteTreeID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTypes`
--

CREATE TABLE `SiteTypes` (
  `siteTypeID` int(10) UNSIGNED NOT NULL,
  `siteTypeHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `siteTypeName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `siteTypeThemeID` int(11) NOT NULL,
  `siteTypeHomePageTemplateID` int(11) NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SiteTypes`
--

INSERT INTO `SiteTypes` (`siteTypeID`, `siteTypeHandle`, `siteTypeName`, `siteTypeThemeID`, `siteTypeHomePageTemplateID`, `pkgID`) VALUES
(1, 'default', 'Default Site Type', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SocialLinks`
--

CREATE TABLE `SocialLinks` (
  `ssHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slID` int(11) NOT NULL,
  `siteID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SocialLinks`
--

INSERT INTO `SocialLinks` (`ssHandle`, `url`, `slID`, `siteID`) VALUES
('facebook', 'https://www.facebook.com/chriswatterston.co', 1, 1),
('twitter', 'https://twitter.com/chriswatterston', 2, 1),
('instagram', 'https://www.instagram.com/chriswatterston/', 3, 1),
('github', 'https://github.com/chriswatterston', 4, 1),
('skype', 'cwatterston', 5, 1),
('personal_website', 'http://www.chriswatterston.com/', 6, 1),
('dribbble', 'https://dribbble.com/chriswatterston', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Stacks`
--

CREATE TABLE `Stacks` (
  `stID` int(10) UNSIGNED NOT NULL,
  `stName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stType` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `stMultilingualSection` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `siteTreeID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Stacks`
--

INSERT INTO `Stacks` (`stID`, `stName`, `stType`, `cID`, `stMultilingualSection`, `siteTreeID`) VALUES
(1, 'Header Site Title', 20, 154, 0, 1),
(2, 'Header Navigation', 20, 155, 0, 1),
(3, 'Footer Legal', 20, 156, 0, 1),
(4, 'Footer Navigation', 20, 157, 0, 1),
(5, 'Footer Contact', 20, 158, 0, 1),
(6, 'Social Links', 0, 165, 0, 1),
(7, 'Social Feed', 0, 166, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `StackUsageRecord`
--

CREATE TABLE `StackUsageRecord` (
  `stack_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `collection_version_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `StyleCustomizerCustomCssRecords`
--

CREATE TABLE `StyleCustomizerCustomCssRecords` (
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sccRecordID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `StyleCustomizerInlineStylePresets`
--

CREATE TABLE `StyleCustomizerInlineStylePresets` (
  `pssPresetID` int(10) UNSIGNED NOT NULL,
  `pssPresetName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `StyleCustomizerInlineStyleSets`
--

CREATE TABLE `StyleCustomizerInlineStyleSets` (
  `issID` int(11) NOT NULL,
  `customClass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `backgroundColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `backgroundImageFileID` int(11) NOT NULL,
  `backgroundRepeat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `backgroundSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `backgroundPosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `borderColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `borderStyle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `borderWidth` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `borderRadius` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baseFontSize` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `textColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marginTop` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marginBottom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marginLeft` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marginRight` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paddingTop` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paddingBottom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paddingLeft` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paddingRight` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rotate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `boxShadowHorizontal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `boxShadowVertical` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `boxShadowBlur` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `boxShadowSpread` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `boxShadowColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hideOnExtraSmallDevice` tinyint(1) DEFAULT NULL,
  `hideOnSmallDevice` tinyint(1) DEFAULT NULL,
  `hideOnMediumDevice` tinyint(1) DEFAULT NULL,
  `hideOnLargeDevice` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `StyleCustomizerInlineStyleSets`
--

INSERT INTO `StyleCustomizerInlineStyleSets` (`issID`, `customClass`, `customID`, `backgroundColor`, `backgroundImageFileID`, `backgroundRepeat`, `backgroundSize`, `backgroundPosition`, `borderColor`, `borderStyle`, `borderWidth`, `borderRadius`, `baseFontSize`, `alignment`, `textColor`, `linkColor`, `marginTop`, `marginBottom`, `marginLeft`, `marginRight`, `paddingTop`, `paddingBottom`, `paddingLeft`, `paddingRight`, `rotate`, `boxShadowHorizontal`, `boxShadowVertical`, `boxShadowBlur`, `boxShadowSpread`, `boxShadowColor`, `hideOnExtraSmallDevice`, `hideOnSmallDevice`, `hideOnMediumDevice`, `hideOnLargeDevice`) VALUES
(1, 'concrete5-org-stories', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0),
(2, 'colour-white type-lowercase type-right', NULL, NULL, 0, 'no-repeat', 'auto', '0% 0%', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(3, 'colour-white type-lowercase type-right family-table', NULL, NULL, 0, 'no-repeat', 'auto', '0% 0%', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `StyleCustomizerValueLists`
--

CREATE TABLE `StyleCustomizerValueLists` (
  `scvlID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `StyleCustomizerValues`
--

CREATE TABLE `StyleCustomizerValues` (
  `scvID` int(10) UNSIGNED NOT NULL,
  `scvlID` int(10) UNSIGNED DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SystemAntispamLibraries`
--

CREATE TABLE `SystemAntispamLibraries` (
  `saslHandle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `saslName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `saslIsActive` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SystemCaptchaLibraries`
--

CREATE TABLE `SystemCaptchaLibraries` (
  `sclHandle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `sclName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sclIsActive` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SystemCaptchaLibraries`
--

INSERT INTO `SystemCaptchaLibraries` (`sclHandle`, `sclName`, `sclIsActive`, `pkgID`) VALUES
('securimage', 'SecurImage (Default)', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SystemContentEditorSnippets`
--

CREATE TABLE `SystemContentEditorSnippets` (
  `scsHandle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `scsName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scsIsActive` tinyint(1) NOT NULL DEFAULT '0',
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SystemContentEditorSnippets`
--

INSERT INTO `SystemContentEditorSnippets` (`scsHandle`, `scsName`, `scsIsActive`, `pkgID`) VALUES
('page_name', 'Page Name', 1, 0),
('user_name', 'User Name', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `SystemDatabaseMigrations`
--

CREATE TABLE `SystemDatabaseMigrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SystemDatabaseMigrations`
--

INSERT INTO `SystemDatabaseMigrations` (`version`) VALUES
('20140919000000'),
('20140930000000'),
('20141017000000'),
('20141024000000'),
('20141113000000'),
('20141219000000'),
('20150109000000'),
('20150504000000'),
('20150515000000'),
('20150610000000'),
('20150612000000'),
('20150615000000'),
('20150616000000'),
('20150619000000'),
('20150622000000'),
('20150623000000'),
('20150713000000'),
('20150731000000'),
('20151221000000'),
('20160107000000'),
('20160213000000'),
('20160314000000'),
('20160412000000'),
('20160615000000'),
('20160725000000'),
('20161109000000'),
('20161203000000'),
('20161208000000'),
('20161216000000'),
('20161216100000'),
('20170118000000'),
('20170123000000');

-- --------------------------------------------------------

--
-- Table structure for table `SystemDatabaseQueryLog`
--

CREATE TABLE `SystemDatabaseQueryLog` (
  `ID` int(10) UNSIGNED NOT NULL,
  `query` text COLLATE utf8_unicode_ci,
  `params` text COLLATE utf8_unicode_ci,
  `executionMS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TopicTrees`
--

CREATE TABLE `TopicTrees` (
  `treeID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topicTreeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `TopicTrees`
--

INSERT INTO `TopicTrees` (`treeID`, `topicTreeName`) VALUES
(4, 'Update Topics');

-- --------------------------------------------------------

--
-- Table structure for table `TreeFileNodes`
--

CREATE TABLE `TreeFileNodes` (
  `treeNodeID` int(10) UNSIGNED NOT NULL,
  `fID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `TreeFileNodes`
--

INSERT INTO `TreeFileNodes` (`treeNodeID`, `fID`) VALUES
(25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `TreeGroupNodes`
--

CREATE TABLE `TreeGroupNodes` (
  `treeNodeID` int(10) UNSIGNED NOT NULL,
  `gID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `TreeGroupNodes`
--

INSERT INTO `TreeGroupNodes` (`treeNodeID`, `gID`) VALUES
(2, 1),
(3, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `TreeNodePermissionAssignments`
--

CREATE TABLE `TreeNodePermissionAssignments` (
  `treeNodeID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pkID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `TreeNodePermissionAssignments`
--

INSERT INTO `TreeNodePermissionAssignments` (`treeNodeID`, `pkID`, `paID`) VALUES
(7, 39, 38),
(7, 40, 39),
(7, 41, 40),
(7, 42, 41),
(7, 43, 42),
(7, 44, 43),
(7, 45, 44),
(7, 46, 46),
(7, 47, 45),
(7, 48, 47),
(7, 66, 35),
(8, 66, 103),
(5, 83, 28),
(6, 83, 23),
(5, 84, 24),
(6, 84, 27),
(5, 85, 25),
(6, 85, 25),
(5, 86, 26),
(6, 86, 26),
(1, 87, 87),
(1, 88, 88),
(1, 89, 89),
(1, 90, 90),
(1, 91, 91);

-- --------------------------------------------------------

--
-- Table structure for table `TreeNodes`
--

CREATE TABLE `TreeNodes` (
  `treeNodeID` int(10) UNSIGNED NOT NULL,
  `treeNodeTypeID` int(10) UNSIGNED DEFAULT '0',
  `treeID` int(10) UNSIGNED DEFAULT '0',
  `treeNodeParentID` int(10) UNSIGNED DEFAULT '0',
  `treeNodeDisplayOrder` int(10) UNSIGNED DEFAULT '0',
  `treeNodeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `treeNodeOverridePermissions` tinyint(1) DEFAULT '0',
  `inheritPermissionsFromTreeNodeID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `TreeNodes`
--

INSERT INTO `TreeNodes` (`treeNodeID`, `treeNodeTypeID`, `treeID`, `treeNodeParentID`, `treeNodeDisplayOrder`, `treeNodeName`, `dateModified`, `dateCreated`, `treeNodeOverridePermissions`, `inheritPermissionsFromTreeNodeID`) VALUES
(1, 1, 1, 0, 0, '', '2017-05-22 15:59:23', '2017-05-22 15:59:23', 1, 1),
(2, 1, 1, 1, 0, '', '2017-05-22 15:59:23', '2017-05-22 15:59:23', 0, 1),
(3, 1, 1, 1, 1, '', '2017-05-22 15:59:23', '2017-05-22 15:59:23', 0, 1),
(4, 1, 1, 1, 2, '', '2017-05-22 15:59:23', '2017-05-22 15:59:23', 0, 1),
(5, 3, 2, 0, 0, '', '2017-05-22 15:59:25', '2017-05-22 15:59:25', 1, 5),
(6, 3, 2, 5, 0, 'Forms', '2017-05-22 15:59:25', '2017-05-22 15:59:25', 1, 6),
(7, 7, 3, 0, 0, '', '2017-05-22 16:00:01', '2017-05-22 16:00:01', 1, 7),
(8, 2, 4, 0, 0, '', '2017-05-24 10:30:57', '2017-05-24 10:30:57', 1, 8),
(9, 2, 4, 8, 0, 'Posts', '2017-05-24 10:31:21', '2017-05-24 10:31:21', 0, 8),
(11, 5, 4, 9, 0, 'News', '2017-05-24 10:32:17', '2017-05-24 10:32:17', 0, 8),
(18, 5, 4, 9, 3, 'Inspirational', '2017-05-24 10:34:16', '2017-05-24 10:34:16', 0, 8),
(20, 5, 4, 9, 5, 'Print Design', '2017-05-24 10:43:44', '2017-05-24 10:43:44', 0, 8),
(21, 5, 4, 9, 4, 'Web Design', '2017-05-24 10:44:05', '2017-05-24 10:44:05', 0, 8),
(25, 6, 3, 7, 0, '', '2017-05-24 10:56:42', '2017-05-24 10:56:42', 0, 7),
(26, 5, 4, 8, 2, 'Latest Feed', '2017-05-24 11:00:42', '2017-05-24 11:00:42', 0, 8),
(27, 5, 4, 9, 2, 'Family', '2017-05-24 12:50:26', '2017-05-24 12:50:26', 0, 8),
(28, 5, 4, 9, 6, 'iOS', '2017-05-24 12:50:45', '2017-05-24 12:50:45', 0, 8),
(29, 5, 4, 9, 7, 'Programming', '2017-05-24 12:51:37', '2017-05-24 12:51:37', 0, 8),
(30, 5, 4, 9, 8, 'Swift', '2017-05-24 12:51:49', '2017-05-24 12:51:49', 0, 8),
(31, 5, 4, 9, 9, 'Development', '2017-05-24 12:52:05', '2017-05-24 12:52:05', 0, 8);

-- --------------------------------------------------------

--
-- Table structure for table `TreeNodeTypes`
--

CREATE TABLE `TreeNodeTypes` (
  `treeNodeTypeID` int(10) UNSIGNED NOT NULL,
  `treeNodeTypeHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `pkgID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `TreeNodeTypes`
--

INSERT INTO `TreeNodeTypes` (`treeNodeTypeID`, `treeNodeTypeHandle`, `pkgID`) VALUES
(1, 'group', 0),
(2, 'category', 0),
(3, 'express_entry_category', 0),
(4, 'express_entry_results', 0),
(5, 'topic', 0),
(6, 'file', 0),
(7, 'file_folder', 0),
(8, 'search_preset', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Trees`
--

CREATE TABLE `Trees` (
  `treeID` int(10) UNSIGNED NOT NULL,
  `treeTypeID` int(10) UNSIGNED DEFAULT '0',
  `treeDateAdded` datetime DEFAULT NULL,
  `rootTreeNodeID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Trees`
--

INSERT INTO `Trees` (`treeID`, `treeTypeID`, `treeDateAdded`, `rootTreeNodeID`) VALUES
(1, 1, '2017-05-22 15:59:23', 1),
(2, 2, '2017-05-22 15:59:25', 5),
(3, 4, '2017-05-22 16:00:01', 7),
(4, 3, '2017-05-24 10:30:57', 8);

-- --------------------------------------------------------

--
-- Table structure for table `TreeSearchQueryNodes`
--

CREATE TABLE `TreeSearchQueryNodes` (
  `treeNodeID` int(10) UNSIGNED NOT NULL,
  `savedSearchID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `TreeTypes`
--

CREATE TABLE `TreeTypes` (
  `treeTypeID` int(10) UNSIGNED NOT NULL,
  `treeTypeHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `pkgID` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `TreeTypes`
--

INSERT INTO `TreeTypes` (`treeTypeID`, `treeTypeHandle`, `pkgID`) VALUES
(1, 'group', 0),
(2, 'express_entry_results', 0),
(3, 'topic', 0),
(4, 'file_manager', 0);

-- --------------------------------------------------------

--
-- Table structure for table `UserAttributeKeys`
--

CREATE TABLE `UserAttributeKeys` (
  `uakProfileDisplay` tinyint(1) NOT NULL,
  `uakProfileEdit` tinyint(1) NOT NULL,
  `uakProfileEditRequired` tinyint(1) NOT NULL,
  `uakRegisterEdit` tinyint(1) NOT NULL,
  `uakRegisterEditRequired` tinyint(1) NOT NULL,
  `uakMemberListDisplay` tinyint(1) NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `UserAttributeKeys`
--

INSERT INTO `UserAttributeKeys` (`uakProfileDisplay`, `uakProfileEdit`, `uakProfileEditRequired`, `uakRegisterEdit`, `uakRegisterEditRequired`, `uakMemberListDisplay`, `akID`) VALUES
(0, 1, 0, 1, 0, 0, 14),
(0, 1, 0, 1, 0, 0, 15),
(0, 0, 0, 0, 0, 0, 18);

-- --------------------------------------------------------

--
-- Table structure for table `UserAttributeValues`
--

CREATE TABLE `UserAttributeValues` (
  `uID` int(10) UNSIGNED NOT NULL,
  `akID` int(10) UNSIGNED NOT NULL,
  `avID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserBannedIPs`
--

CREATE TABLE `UserBannedIPs` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipFrom` tinyblob,
  `ipTo` tinyblob,
  `banCode` tinyint(1) NOT NULL DEFAULT '1',
  `expires` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `isManual` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserGroups`
--

CREATE TABLE `UserGroups` (
  `uID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ugEntered` datetime NOT NULL DEFAULT '1000-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserPermissionEditPropertyAccessList`
--

CREATE TABLE `UserPermissionEditPropertyAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uName` tinyint(1) DEFAULT '0',
  `uEmail` tinyint(1) DEFAULT '0',
  `uPassword` tinyint(1) DEFAULT '0',
  `uAvatar` tinyint(1) DEFAULT '0',
  `uTimezone` tinyint(1) DEFAULT '0',
  `uDefaultLanguage` tinyint(1) DEFAULT '0',
  `attributePermission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserPermissionEditPropertyAttributeAccessListCustom`
--

CREATE TABLE `UserPermissionEditPropertyAttributeAccessListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `akID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserPermissionViewAttributeAccessList`
--

CREATE TABLE `UserPermissionViewAttributeAccessList` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `permission` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserPermissionViewAttributeAccessListCustom`
--

CREATE TABLE `UserPermissionViewAttributeAccessListCustom` (
  `paID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `peID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `akID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserPointActions`
--

CREATE TABLE `UserPointActions` (
  `upaID` int(11) NOT NULL,
  `upaHandle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upaName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upaDefaultPoints` int(11) NOT NULL DEFAULT '0',
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `upaHasCustomClass` tinyint(1) NOT NULL DEFAULT '0',
  `upaIsActive` tinyint(1) NOT NULL DEFAULT '1',
  `gBadgeID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `UserPointActions`
--

INSERT INTO `UserPointActions` (`upaID`, `upaHandle`, `upaName`, `upaDefaultPoints`, `pkgID`, `upaHasCustomClass`, `upaIsActive`, `gBadgeID`) VALUES
(1, 'won_badge', 'Won a Badge', 5, 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `UserPointHistory`
--

CREATE TABLE `UserPointHistory` (
  `upID` int(11) NOT NULL,
  `upuID` int(11) NOT NULL DEFAULT '0',
  `upaID` int(11) DEFAULT '0',
  `upPoints` int(11) DEFAULT '0',
  `object` longtext COLLATE utf8_unicode_ci,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserPrivateMessages`
--

CREATE TABLE `UserPrivateMessages` (
  `msgID` int(10) UNSIGNED NOT NULL,
  `uAuthorID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `msgDateCreated` datetime NOT NULL,
  `msgSubject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `msgBody` text COLLATE utf8_unicode_ci,
  `uToID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserPrivateMessagesTo`
--

CREATE TABLE `UserPrivateMessagesTo` (
  `msgID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uAuthorID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `msgMailboxID` int(11) NOT NULL,
  `msgIsNew` tinyint(1) NOT NULL DEFAULT '0',
  `msgIsUnread` tinyint(1) NOT NULL DEFAULT '0',
  `msgIsReplied` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `uID` int(10) UNSIGNED NOT NULL,
  `uName` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `uEmail` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `uPassword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uIsActive` tinyint(1) NOT NULL,
  `uIsFullRecord` tinyint(1) NOT NULL,
  `uIsValidated` tinyint(1) NOT NULL DEFAULT '-1',
  `uDateAdded` datetime NOT NULL,
  `uLastPasswordChange` datetime NOT NULL,
  `uHasAvatar` tinyint(1) NOT NULL,
  `uLastOnline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uLastLogin` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uPreviousLogin` int(10) UNSIGNED DEFAULT '0',
  `uNumLogins` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uLastAuthTypeID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uLastIP` longtext COLLATE utf8_unicode_ci,
  `uTimezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uDefaultLanguage` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uIsPasswordReset` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`uID`, `uName`, `uEmail`, `uPassword`, `uIsActive`, `uIsFullRecord`, `uIsValidated`, `uDateAdded`, `uLastPasswordChange`, `uHasAvatar`, `uLastOnline`, `uLastLogin`, `uPreviousLogin`, `uNumLogins`, `uLastAuthTypeID`, `uLastIP`, `uTimezone`, `uDefaultLanguage`, `uIsPasswordReset`) VALUES
(1, 'admin', 'hello@chriswatterston.com', '$2a$12$kJV9yqhfCBt8k6DX6w7xxuSypfc/T0vGL5u2G3M2LTUpzYnRPmRvG', 1, 1, 1, '2017-05-22 15:59:23', '2017-05-22 15:59:23', 0, 1495707093, 1495613838, 1495546718, 3, 1, '7f000001', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `UserSearchIndexAttributes`
--

CREATE TABLE `UserSearchIndexAttributes` (
  `uID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ak_profile_private_messages_enabled` tinyint(1) DEFAULT '0',
  `ak_profile_private_messages_notification_enabled` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserSignupNotifications`
--

CREATE TABLE `UserSignupNotifications` (
  `usID` int(10) UNSIGNED DEFAULT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserSignups`
--

CREATE TABLE `UserSignups` (
  `usID` int(10) UNSIGNED NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `createdBy` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserValidationHashes`
--

CREATE TABLE `UserValidationHashes` (
  `uvhID` int(10) UNSIGNED NOT NULL,
  `uID` int(10) UNSIGNED DEFAULT NULL,
  `uHash` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `uDateGenerated` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `uDateRedeemed` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserWorkflowProgress`
--

CREATE TABLE `UserWorkflowProgress` (
  `uID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `wpID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowProgress`
--

CREATE TABLE `WorkflowProgress` (
  `wpID` int(10) UNSIGNED NOT NULL,
  `wpCategoryID` int(10) UNSIGNED DEFAULT NULL,
  `wfID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `wpApproved` tinyint(1) NOT NULL DEFAULT '0',
  `wpDateAdded` datetime DEFAULT NULL,
  `wpDateLastAction` datetime DEFAULT NULL,
  `wpCurrentStatus` int(11) NOT NULL DEFAULT '0',
  `wrID` int(11) NOT NULL DEFAULT '0',
  `wpIsCompleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `WorkflowProgress`
--

INSERT INTO `WorkflowProgress` (`wpID`, `wpCategoryID`, `wfID`, `wpApproved`, `wpDateAdded`, `wpDateLastAction`, `wpCurrentStatus`, `wrID`, `wpIsCompleted`) VALUES
(28, 1, 0, 0, '2017-05-24 10:09:00', NULL, 0, 28, 0);

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowProgressCategories`
--

CREATE TABLE `WorkflowProgressCategories` (
  `wpCategoryID` int(10) UNSIGNED NOT NULL,
  `wpCategoryHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `WorkflowProgressCategories`
--

INSERT INTO `WorkflowProgressCategories` (`wpCategoryID`, `wpCategoryHandle`, `pkgID`) VALUES
(1, 'page', NULL),
(2, 'file', NULL),
(3, 'user', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowProgressHistory`
--

CREATE TABLE `WorkflowProgressHistory` (
  `wphID` int(10) UNSIGNED NOT NULL,
  `wpID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `object` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `WorkflowProgressHistory`
--

INSERT INTO `WorkflowProgressHistory` (`wphID`, `wpID`, `timestamp`, `object`) VALUES
(1, 1, '2017-05-23 13:51:13', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:1:"1";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"2";}'),
(2, 2, '2017-05-23 13:51:24', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:1:"2";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"3";}'),
(3, 3, '2017-05-23 14:22:02', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:1:"3";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"158";s:4:"cvID";s:1:"2";}'),
(4, 4, '2017-05-23 14:22:22', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:1:"4";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"156";s:4:"cvID";s:1:"2";}'),
(5, 5, '2017-05-23 14:25:44', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:1:"5";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"157";s:4:"cvID";s:1:"2";}'),
(6, 6, '2017-05-23 14:25:59', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:1:"6";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"155";s:4:"cvID";s:1:"2";}'),
(7, 7, '2017-05-23 14:27:18', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:1:"7";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"155";s:4:"cvID";s:1:"3";}'),
(8, 8, '2017-05-23 14:28:40', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:1:"8";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"154";s:4:"cvID";s:1:"2";}'),
(9, 9, '2017-05-23 14:29:25', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:1:"9";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"154";s:4:"cvID";s:1:"3";}'),
(10, 10, '2017-05-23 14:30:42', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"10";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"159";s:4:"cvID";s:1:"1";}'),
(11, 11, '2017-05-23 14:30:55', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"11";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"160";s:4:"cvID";s:1:"1";}'),
(12, 12, '2017-05-23 14:31:04', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"12";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"161";s:4:"cvID";s:1:"1";}'),
(13, 13, '2017-05-23 14:31:17', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"13";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"162";s:4:"cvID";s:1:"1";}'),
(14, 14, '2017-05-23 14:31:28', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"14";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"163";s:4:"cvID";s:1:"1";}'),
(15, 15, '2017-05-23 14:32:36', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"15";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"164";s:4:"cvID";s:1:"1";}'),
(16, 16, '2017-05-23 14:32:46', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"16";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"164";s:4:"cvID";s:1:"2";}'),
(17, 17, '2017-05-23 14:32:56', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"17";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"164";s:4:"cvID";s:1:"3";}'),
(18, 18, '2017-05-23 14:58:54', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"18";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"154";s:4:"cvID";s:1:"4";}'),
(19, 19, '2017-05-23 14:59:26', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"19";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"154";s:4:"cvID";s:1:"5";}'),
(20, 20, '2017-05-23 15:00:08', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"20";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"154";s:4:"cvID";s:1:"6";}'),
(21, 21, '2017-05-23 15:10:17', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"21";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"154";s:4:"cvID";s:1:"7";}'),
(22, 22, '2017-05-23 15:15:33', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"22";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"154";s:4:"cvID";s:1:"8";}'),
(23, 23, '2017-05-23 15:16:33', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"23";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"154";s:4:"cvID";s:1:"9";}'),
(24, 24, '2017-05-23 15:17:08', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"24";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"154";s:4:"cvID";s:2:"10";}'),
(25, 25, '2017-05-23 15:39:12', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"25";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"154";s:4:"cvID";s:2:"11";}'),
(26, 26, '2017-05-23 15:40:54', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"26";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"154";s:4:"cvID";s:2:"12";}'),
(27, 27, '2017-05-23 15:41:37', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"27";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"154";s:4:"cvID";s:2:"13";}'),
(28, 28, '2017-05-24 09:09:00', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"28";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"158";s:4:"cvID";s:1:"4";}'),
(29, 29, '2017-05-24 09:09:24', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"29";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"158";s:4:"cvID";s:1:"4";}'),
(30, 30, '2017-05-24 09:15:30', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"30";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"165";s:4:"cvID";s:1:"3";}'),
(31, 31, '2017-05-24 09:15:40', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"31";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"165";s:4:"cvID";s:1:"4";}'),
(32, 32, '2017-05-24 09:16:44', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"32";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"166";s:4:"cvID";s:1:"3";}'),
(33, 33, '2017-05-24 09:57:23', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"33";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"168";s:4:"cvID";s:1:"1";}'),
(34, 34, '2017-05-24 10:00:02', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"34";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"4";}'),
(35, 35, '2017-05-24 10:04:00', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"35";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"5";}'),
(36, 36, '2017-05-24 10:04:27', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"36";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"168";s:4:"cvID";s:1:"2";}'),
(37, 37, '2017-05-24 10:05:50', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"37";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"168";s:4:"cvID";s:1:"3";}'),
(38, 38, '2017-05-24 10:07:58', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"38";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"169";s:4:"cvID";s:1:"1";}'),
(39, 39, '2017-05-24 10:09:19', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"39";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"171";s:4:"cvID";s:1:"1";}'),
(40, 40, '2017-05-24 10:11:33', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"40";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:1:"1";s:4:"cvID";s:1:"6";}'),
(41, 41, '2017-05-24 11:55:15', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"41";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"168";s:4:"cvID";s:1:"4";}'),
(42, 42, '2017-05-24 11:56:05', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"42";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"169";s:4:"cvID";s:1:"2";}'),
(43, 43, '2017-05-24 11:56:49', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"43";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"171";s:4:"cvID";s:1:"2";}'),
(44, 44, '2017-05-24 12:12:56', 'O:49:"Concrete\\Core\\Workflow\\Request\\ApprovePageRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"44";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"171";s:4:"cvID";s:1:"3";}'),
(45, 45, '2017-05-25 07:59:53', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"45";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"156";s:4:"cvID";s:1:"4";}'),
(46, 46, '2017-05-25 09:12:59', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"46";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"166";s:4:"cvID";s:1:"5";}'),
(47, 47, '2017-05-25 10:00:39', 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"47";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"165";s:4:"cvID";s:1:"5";}');

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowProgressNotifications`
--

CREATE TABLE `WorkflowProgressNotifications` (
  `wpID` int(10) UNSIGNED NOT NULL,
  `nID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowRequestObjects`
--

CREATE TABLE `WorkflowRequestObjects` (
  `wrID` int(10) UNSIGNED NOT NULL,
  `wrObject` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `WorkflowRequestObjects`
--

INSERT INTO `WorkflowRequestObjects` (`wrID`, `wrObject`) VALUES
(28, 'O:50:"Concrete\\Core\\Workflow\\Request\\ApproveStackRequest":10:{s:14:"\0*\0wrStatusNum";i:30;s:62:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0isScheduled";b:0;s:67:"\0Concrete\\Core\\Workflow\\Request\\ApprovePageRequest\0scheduleDatetime";N;s:12:"\0*\0currentWP";N;s:6:"\0*\0uID";s:1:"1";s:7:"\0*\0wrID";s:2:"28";s:5:"error";s:0:"";s:4:"pkID";s:2:"14";s:3:"cID";s:3:"158";s:4:"cvID";s:1:"4";}');

-- --------------------------------------------------------

--
-- Table structure for table `Workflows`
--

CREATE TABLE `Workflows` (
  `wfID` int(10) UNSIGNED NOT NULL,
  `wfName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wftID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WorkflowTypes`
--

CREATE TABLE `WorkflowTypes` (
  `wftID` int(10) UNSIGNED NOT NULL,
  `wftHandle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `wftName` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `pkgID` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `WorkflowTypes`
--

INSERT INTO `WorkflowTypes` (`wftID`, `wftHandle`, `wftName`, `pkgID`) VALUES
(1, 'basic', 'Basic Workflow', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AreaLayoutColumns`
--
ALTER TABLE `AreaLayoutColumns`
  ADD PRIMARY KEY (`arLayoutColumnID`),
  ADD KEY `arLayoutID` (`arLayoutID`,`arLayoutColumnIndex`),
  ADD KEY `arID` (`arID`),
  ADD KEY `arLayoutColumnDisplayID` (`arLayoutColumnDisplayID`);

--
-- Indexes for table `AreaLayoutCustomColumns`
--
ALTER TABLE `AreaLayoutCustomColumns`
  ADD PRIMARY KEY (`arLayoutColumnID`);

--
-- Indexes for table `AreaLayoutPresets`
--
ALTER TABLE `AreaLayoutPresets`
  ADD PRIMARY KEY (`arLayoutPresetID`),
  ADD KEY `arLayoutID` (`arLayoutID`),
  ADD KEY `arLayoutPresetName` (`arLayoutPresetName`);

--
-- Indexes for table `AreaLayouts`
--
ALTER TABLE `AreaLayouts`
  ADD PRIMARY KEY (`arLayoutID`);

--
-- Indexes for table `AreaLayoutsUsingPresets`
--
ALTER TABLE `AreaLayoutsUsingPresets`
  ADD PRIMARY KEY (`arLayoutID`);

--
-- Indexes for table `AreaLayoutThemeGridColumns`
--
ALTER TABLE `AreaLayoutThemeGridColumns`
  ADD PRIMARY KEY (`arLayoutColumnID`);

--
-- Indexes for table `AreaPermissionAssignments`
--
ALTER TABLE `AreaPermissionAssignments`
  ADD PRIMARY KEY (`cID`,`arHandle`,`pkID`,`paID`),
  ADD KEY `paID` (`paID`),
  ADD KEY `pkID` (`pkID`);

--
-- Indexes for table `AreaPermissionBlockTypeAccessList`
--
ALTER TABLE `AreaPermissionBlockTypeAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `AreaPermissionBlockTypeAccessListCustom`
--
ALTER TABLE `AreaPermissionBlockTypeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`btID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `btID` (`btID`);

--
-- Indexes for table `Areas`
--
ALTER TABLE `Areas`
  ADD PRIMARY KEY (`arID`),
  ADD KEY `arIsGlobal` (`arIsGlobal`),
  ADD KEY `cID` (`cID`),
  ADD KEY `arHandle` (`arHandle`),
  ADD KEY `arParentID` (`arParentID`);

--
-- Indexes for table `atAddress`
--
ALTER TABLE `atAddress`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atAddressSettings`
--
ALTER TABLE `atAddressSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `atBoolean`
--
ALTER TABLE `atBoolean`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atBooleanSettings`
--
ALTER TABLE `atBooleanSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `atDateTime`
--
ALTER TABLE `atDateTime`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atDateTimeSettings`
--
ALTER TABLE `atDateTimeSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `atDefault`
--
ALTER TABLE `atDefault`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atEmptySettings`
--
ALTER TABLE `atEmptySettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `atExpress`
--
ALTER TABLE `atExpress`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atExpressSelectedEntries`
--
ALTER TABLE `atExpressSelectedEntries`
  ADD PRIMARY KEY (`avID`,`exEntryID`),
  ADD KEY `IDX_C9D404BBA2A82A5D` (`avID`),
  ADD KEY `IDX_C9D404BB6DCB6296` (`exEntryID`);

--
-- Indexes for table `atExpressSettings`
--
ALTER TABLE `atExpressSettings`
  ADD PRIMARY KEY (`akID`),
  ADD KEY `IDX_E8F67F0FCE2D7284` (`exEntityID`);

--
-- Indexes for table `atFile`
--
ALTER TABLE `atFile`
  ADD PRIMARY KEY (`avID`),
  ADD KEY `IDX_73D17D61E3111F45` (`fID`);

--
-- Indexes for table `atFileSettings`
--
ALTER TABLE `atFileSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `atNumber`
--
ALTER TABLE `atNumber`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atSelect`
--
ALTER TABLE `atSelect`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atSelectedSocialLinks`
--
ALTER TABLE `atSelectedSocialLinks`
  ADD PRIMARY KEY (`avsID`),
  ADD KEY `IDX_10743709A2A82A5D` (`avID`);

--
-- Indexes for table `atSelectedTopics`
--
ALTER TABLE `atSelectedTopics`
  ADD PRIMARY KEY (`avTreeTopicNodeID`),
  ADD KEY `IDX_E42A7D5BA2A82A5D` (`avID`);

--
-- Indexes for table `atSelectOptionLists`
--
ALTER TABLE `atSelectOptionLists`
  ADD PRIMARY KEY (`avSelectOptionListID`);

--
-- Indexes for table `atSelectOptions`
--
ALTER TABLE `atSelectOptions`
  ADD PRIMARY KEY (`avSelectOptionID`),
  ADD KEY `IDX_797414B0CB59257C` (`avSelectOptionListID`);

--
-- Indexes for table `atSelectOptionsSelected`
--
ALTER TABLE `atSelectOptionsSelected`
  ADD PRIMARY KEY (`avID`,`avSelectOptionID`),
  ADD KEY `IDX_40C97EC3A2A82A5D` (`avID`),
  ADD KEY `IDX_40C97EC3E584C274` (`avSelectOptionID`);

--
-- Indexes for table `atSelectSettings`
--
ALTER TABLE `atSelectSettings`
  ADD PRIMARY KEY (`akID`),
  ADD UNIQUE KEY `UNIQ_5D514424CB59257C` (`avSelectOptionListID`);

--
-- Indexes for table `atSocialLinks`
--
ALTER TABLE `atSocialLinks`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atTextareaSettings`
--
ALTER TABLE `atTextareaSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `atTextSettings`
--
ALTER TABLE `atTextSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `atTopic`
--
ALTER TABLE `atTopic`
  ADD PRIMARY KEY (`avID`);

--
-- Indexes for table `atTopicSettings`
--
ALTER TABLE `atTopicSettings`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `AttributeKeyCategories`
--
ALTER TABLE `AttributeKeyCategories`
  ADD PRIMARY KEY (`akCategoryID`),
  ADD UNIQUE KEY `UNIQ_A2A0CC67FA0337B` (`akCategoryHandle`),
  ADD KEY `IDX_A2A0CC67CE45CBB0` (`pkgID`),
  ADD KEY `pkgID` (`pkgID`,`akCategoryID`),
  ADD KEY `akCategoryHandle` (`akCategoryHandle`);

--
-- Indexes for table `AttributeKeys`
--
ALTER TABLE `AttributeKeys`
  ADD PRIMARY KEY (`akID`),
  ADD KEY `IDX_DCA32C62A12CFE33` (`atID`),
  ADD KEY `IDX_DCA32C62B059B76B` (`akCategoryID`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `AttributeSetKeys`
--
ALTER TABLE `AttributeSetKeys`
  ADD PRIMARY KEY (`akID`,`asID`),
  ADD KEY `IDX_222F72D8B6561A7E` (`akID`),
  ADD KEY `IDX_222F72D8A463E8B6` (`asID`);

--
-- Indexes for table `AttributeSets`
--
ALTER TABLE `AttributeSets`
  ADD PRIMARY KEY (`asID`),
  ADD KEY `IDX_FCA02D5FB059B76B` (`akCategoryID`),
  ADD KEY `asHandle` (`asHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `AttributeTypeCategories`
--
ALTER TABLE `AttributeTypeCategories`
  ADD PRIMARY KEY (`akCategoryID`,`atID`),
  ADD KEY `IDX_49A9CABEB059B76B` (`akCategoryID`),
  ADD KEY `IDX_49A9CABEA12CFE33` (`atID`);

--
-- Indexes for table `AttributeTypes`
--
ALTER TABLE `AttributeTypes`
  ADD PRIMARY KEY (`atID`),
  ADD UNIQUE KEY `UNIQ_53580A7F46AA0F38` (`atHandle`),
  ADD KEY `IDX_53580A7FCE45CBB0` (`pkgID`),
  ADD KEY `pkgID` (`pkgID`,`atID`);

--
-- Indexes for table `AttributeValues`
--
ALTER TABLE `AttributeValues`
  ADD PRIMARY KEY (`avID`),
  ADD KEY `IDX_DCCE7864B6561A7E` (`akID`);

--
-- Indexes for table `AuthenticationTypes`
--
ALTER TABLE `AuthenticationTypes`
  ADD PRIMARY KEY (`authTypeID`),
  ADD UNIQUE KEY `authTypeHandle` (`authTypeHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `authTypeConcreteCookieMap`
--
ALTER TABLE `authTypeConcreteCookieMap`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `BannedWords`
--
ALTER TABLE `BannedWords`
  ADD PRIMARY KEY (`bwID`);

--
-- Indexes for table `BasicWorkflowPermissionAssignments`
--
ALTER TABLE `BasicWorkflowPermissionAssignments`
  ADD PRIMARY KEY (`wfID`,`pkID`,`paID`),
  ADD KEY `pkID` (`pkID`),
  ADD KEY `paID` (`paID`);

--
-- Indexes for table `BasicWorkflowProgressData`
--
ALTER TABLE `BasicWorkflowProgressData`
  ADD PRIMARY KEY (`wpID`),
  ADD KEY `uIDStarted` (`uIDStarted`),
  ADD KEY `uIDCompleted` (`uIDCompleted`);

--
-- Indexes for table `BlockFeatureAssignments`
--
ALTER TABLE `BlockFeatureAssignments`
  ADD PRIMARY KEY (`cID`,`cvID`,`bID`,`faID`),
  ADD KEY `faID` (`faID`,`cID`,`cvID`),
  ADD KEY `bID` (`bID`);

--
-- Indexes for table `BlockPermissionAssignments`
--
ALTER TABLE `BlockPermissionAssignments`
  ADD PRIMARY KEY (`cID`,`cvID`,`bID`,`pkID`,`paID`),
  ADD KEY `bID` (`bID`),
  ADD KEY `pkID` (`pkID`),
  ADD KEY `paID` (`paID`);

--
-- Indexes for table `Blocks`
--
ALTER TABLE `Blocks`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `btID` (`btID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `BlockTypePermissionBlockTypeAccessList`
--
ALTER TABLE `BlockTypePermissionBlockTypeAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `BlockTypePermissionBlockTypeAccessListCustom`
--
ALTER TABLE `BlockTypePermissionBlockTypeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`btID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `btID` (`btID`);

--
-- Indexes for table `BlockTypes`
--
ALTER TABLE `BlockTypes`
  ADD PRIMARY KEY (`btID`);

--
-- Indexes for table `BlockTypeSetBlockTypes`
--
ALTER TABLE `BlockTypeSetBlockTypes`
  ADD PRIMARY KEY (`btID`,`btsID`),
  ADD KEY `btsID` (`btsID`,`displayOrder`);

--
-- Indexes for table `BlockTypeSets`
--
ALTER TABLE `BlockTypeSets`
  ADD PRIMARY KEY (`btsID`),
  ADD UNIQUE KEY `btsHandle` (`btsHandle`),
  ADD KEY `btsDisplayOrder` (`btsDisplayOrder`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `btContentFile`
--
ALTER TABLE `btContentFile`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `fID` (`fID`);

--
-- Indexes for table `btContentImage`
--
ALTER TABLE `btContentImage`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `fID` (`fID`);

--
-- Indexes for table `btContentLocal`
--
ALTER TABLE `btContentLocal`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btCoreAreaLayout`
--
ALTER TABLE `btCoreAreaLayout`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `arLayoutID` (`arLayoutID`);

--
-- Indexes for table `btCoreConversation`
--
ALTER TABLE `btCoreConversation`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `cnvID` (`cnvID`);

--
-- Indexes for table `btCorePageTypeComposerControlOutput`
--
ALTER TABLE `btCorePageTypeComposerControlOutput`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `ptComposerOutputControlID` (`ptComposerOutputControlID`);

--
-- Indexes for table `btCoreScrapbookDisplay`
--
ALTER TABLE `btCoreScrapbookDisplay`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `bOriginalID` (`bOriginalID`);

--
-- Indexes for table `btCoreStackDisplay`
--
ALTER TABLE `btCoreStackDisplay`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `stID` (`stID`);

--
-- Indexes for table `btDateNavigation`
--
ALTER TABLE `btDateNavigation`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btDesktopNewsflowLatest`
--
ALTER TABLE `btDesktopNewsflowLatest`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btDesktopSiteActivity`
--
ALTER TABLE `btDesktopSiteActivity`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btExpressEntryDetail`
--
ALTER TABLE `btExpressEntryDetail`
  ADD PRIMARY KEY (`bID`,`exEntityID`,`exSpecificEntryID`,`exFormID`);

--
-- Indexes for table `btExpressEntryList`
--
ALTER TABLE `btExpressEntryList`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btExpressForm`
--
ALTER TABLE `btExpressForm`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btExternalForm`
--
ALTER TABLE `btExternalForm`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btFaq`
--
ALTER TABLE `btFaq`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btFaqEntries`
--
ALTER TABLE `btFaqEntries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bID` (`bID`,`sortOrder`);

--
-- Indexes for table `btFeature`
--
ALTER TABLE `btFeature`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btForm`
--
ALTER TABLE `btForm`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `questionSetIdForeign` (`questionSetId`);

--
-- Indexes for table `btFormAnswers`
--
ALTER TABLE `btFormAnswers`
  ADD PRIMARY KEY (`aID`),
  ADD KEY `asID` (`asID`),
  ADD KEY `msqID` (`msqID`);

--
-- Indexes for table `btFormAnswerSet`
--
ALTER TABLE `btFormAnswerSet`
  ADD PRIMARY KEY (`asID`),
  ADD KEY `questionSetId` (`questionSetId`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `btFormQuestions`
--
ALTER TABLE `btFormQuestions`
  ADD PRIMARY KEY (`qID`),
  ADD KEY `questionSetId` (`questionSetId`),
  ADD KEY `msqID` (`msqID`),
  ADD KEY `bID` (`bID`,`questionSetId`);

--
-- Indexes for table `btGoogleMap`
--
ALTER TABLE `btGoogleMap`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btImageSlider`
--
ALTER TABLE `btImageSlider`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btImageSliderEntries`
--
ALTER TABLE `btImageSliderEntries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `btNavigation`
--
ALTER TABLE `btNavigation`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btNextPrevious`
--
ALTER TABLE `btNextPrevious`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btPageAttributeDisplay`
--
ALTER TABLE `btPageAttributeDisplay`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btPageList`
--
ALTER TABLE `btPageList`
  ADD PRIMARY KEY (`bID`),
  ADD KEY `ptID` (`ptID`);

--
-- Indexes for table `btPageTitle`
--
ALTER TABLE `btPageTitle`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btRssDisplay`
--
ALTER TABLE `btRssDisplay`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btSearch`
--
ALTER TABLE `btSearch`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btShareThisPage`
--
ALTER TABLE `btShareThisPage`
  ADD PRIMARY KEY (`btShareThisPageID`);

--
-- Indexes for table `btSocialLinks`
--
ALTER TABLE `btSocialLinks`
  ADD PRIMARY KEY (`btSocialLinkID`),
  ADD KEY `bID` (`bID`,`displayOrder`),
  ADD KEY `slID` (`slID`);

--
-- Indexes for table `btSurvey`
--
ALTER TABLE `btSurvey`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btSurveyOptions`
--
ALTER TABLE `btSurveyOptions`
  ADD PRIMARY KEY (`optionID`),
  ADD KEY `bID` (`bID`,`displayOrder`);

--
-- Indexes for table `btSurveyResults`
--
ALTER TABLE `btSurveyResults`
  ADD PRIMARY KEY (`resultID`),
  ADD KEY `optionID` (`optionID`),
  ADD KEY `cID` (`cID`,`optionID`,`bID`),
  ADD KEY `bID` (`bID`,`cID`,`uID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `btSwitchLanguage`
--
ALTER TABLE `btSwitchLanguage`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btTags`
--
ALTER TABLE `btTags`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btTestimonial`
--
ALTER TABLE `btTestimonial`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btTopicList`
--
ALTER TABLE `btTopicList`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btVideo`
--
ALTER TABLE `btVideo`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `btYouTube`
--
ALTER TABLE `btYouTube`
  ADD PRIMARY KEY (`bID`);

--
-- Indexes for table `CollectionAttributeKeys`
--
ALTER TABLE `CollectionAttributeKeys`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `CollectionAttributeValues`
--
ALTER TABLE `CollectionAttributeValues`
  ADD PRIMARY KEY (`cID`,`cvID`,`akID`),
  ADD KEY `IDX_BB9995FCB6561A7E` (`akID`),
  ADD KEY `IDX_BB9995FCA2A82A5D` (`avID`);

--
-- Indexes for table `Collections`
--
ALTER TABLE `Collections`
  ADD PRIMARY KEY (`cID`),
  ADD KEY `cIDDateModified` (`cID`,`cDateModified`),
  ADD KEY `cDateModified` (`cDateModified`),
  ADD KEY `cDateAdded` (`cDateAdded`);

--
-- Indexes for table `CollectionSearchIndexAttributes`
--
ALTER TABLE `CollectionSearchIndexAttributes`
  ADD PRIMARY KEY (`cID`);

--
-- Indexes for table `CollectionVersionAreaStyles`
--
ALTER TABLE `CollectionVersionAreaStyles`
  ADD PRIMARY KEY (`cID`,`cvID`,`arHandle`),
  ADD KEY `issID` (`issID`);

--
-- Indexes for table `CollectionVersionBlocks`
--
ALTER TABLE `CollectionVersionBlocks`
  ADD PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  ADD KEY `bID` (`bID`,`cID`),
  ADD KEY `cbRelationID` (`cbRelationID`);

--
-- Indexes for table `CollectionVersionBlocksCacheSettings`
--
ALTER TABLE `CollectionVersionBlocksCacheSettings`
  ADD PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  ADD KEY `bID` (`bID`,`cID`,`cvID`,`arHandle`);

--
-- Indexes for table `CollectionVersionBlocksOutputCache`
--
ALTER TABLE `CollectionVersionBlocksOutputCache`
  ADD PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  ADD KEY `bID` (`bID`,`cID`,`cvID`,`arHandle`);

--
-- Indexes for table `CollectionVersionBlockStyles`
--
ALTER TABLE `CollectionVersionBlockStyles`
  ADD PRIMARY KEY (`cID`,`cvID`,`bID`,`arHandle`),
  ADD KEY `bID` (`bID`,`issID`),
  ADD KEY `issID` (`issID`);

--
-- Indexes for table `CollectionVersionFeatureAssignments`
--
ALTER TABLE `CollectionVersionFeatureAssignments`
  ADD PRIMARY KEY (`cID`,`cvID`,`faID`),
  ADD KEY `faID` (`faID`);

--
-- Indexes for table `CollectionVersionRelatedEdits`
--
ALTER TABLE `CollectionVersionRelatedEdits`
  ADD PRIMARY KEY (`cID`,`cvID`,`cRelationID`,`cvRelationID`);

--
-- Indexes for table `CollectionVersions`
--
ALTER TABLE `CollectionVersions`
  ADD PRIMARY KEY (`cID`,`cvID`),
  ADD KEY `cvIsApproved` (`cvIsApproved`),
  ADD KEY `cvAuthorUID` (`cvAuthorUID`),
  ADD KEY `cvApproverUID` (`cvApproverUID`),
  ADD KEY `pThemeID` (`pThemeID`),
  ADD KEY `pTemplateID` (`pTemplateID`);

--
-- Indexes for table `CollectionVersionThemeCustomStyles`
--
ALTER TABLE `CollectionVersionThemeCustomStyles`
  ADD PRIMARY KEY (`cID`,`cvID`,`pThemeID`),
  ADD KEY `pThemeID` (`pThemeID`),
  ADD KEY `scvlID` (`scvlID`),
  ADD KEY `sccRecordID` (`sccRecordID`);

--
-- Indexes for table `Config`
--
ALTER TABLE `Config`
  ADD PRIMARY KEY (`configNamespace`,`configGroup`,`configItem`),
  ADD KEY `configGroup` (`configGroup`);

--
-- Indexes for table `ConfigStore`
--
ALTER TABLE `ConfigStore`
  ADD PRIMARY KEY (`cfKey`,`uID`),
  ADD KEY `uID` (`uID`,`cfKey`),
  ADD KEY `pkgID` (`pkgID`,`cfKey`);

--
-- Indexes for table `ConversationDiscussions`
--
ALTER TABLE `ConversationDiscussions`
  ADD PRIMARY KEY (`cnvDiscussionID`),
  ADD KEY `cID` (`cID`);

--
-- Indexes for table `ConversationEditors`
--
ALTER TABLE `ConversationEditors`
  ADD PRIMARY KEY (`cnvEditorID`),
  ADD KEY `pkgID` (`pkgID`,`cnvEditorHandle`);

--
-- Indexes for table `ConversationFeatureDetailAssignments`
--
ALTER TABLE `ConversationFeatureDetailAssignments`
  ADD PRIMARY KEY (`faID`),
  ADD KEY `cnvID` (`cnvID`);

--
-- Indexes for table `ConversationFlaggedMessages`
--
ALTER TABLE `ConversationFlaggedMessages`
  ADD PRIMARY KEY (`cnvMessageID`),
  ADD KEY `cnvMessageFlagTypeID` (`cnvMessageFlagTypeID`);

--
-- Indexes for table `ConversationFlaggedMessageTypes`
--
ALTER TABLE `ConversationFlaggedMessageTypes`
  ADD PRIMARY KEY (`cnvMessageFlagTypeID`),
  ADD UNIQUE KEY `cnvMessageFlagTypeHandle` (`cnvMessageFlagTypeHandle`);

--
-- Indexes for table `ConversationMessageAttachments`
--
ALTER TABLE `ConversationMessageAttachments`
  ADD PRIMARY KEY (`cnvMessageAttachmentID`),
  ADD KEY `cnvMessageID` (`cnvMessageID`),
  ADD KEY `fID` (`fID`);

--
-- Indexes for table `ConversationMessageNotifications`
--
ALTER TABLE `ConversationMessageNotifications`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `ConversationMessageRatings`
--
ALTER TABLE `ConversationMessageRatings`
  ADD PRIMARY KEY (`cnvMessageRatingID`),
  ADD KEY `cnvMessageID` (`cnvMessageID`,`cnvRatingTypeID`),
  ADD KEY `cnvRatingTypeID` (`cnvRatingTypeID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `ConversationMessages`
--
ALTER TABLE `ConversationMessages`
  ADD PRIMARY KEY (`cnvMessageID`),
  ADD KEY `cnvID` (`cnvID`),
  ADD KEY `cnvMessageParentID` (`cnvMessageParentID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `ConversationPermissionAddMessageAccessList`
--
ALTER TABLE `ConversationPermissionAddMessageAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `ConversationPermissionAssignments`
--
ALTER TABLE `ConversationPermissionAssignments`
  ADD PRIMARY KEY (`cnvID`,`pkID`,`paID`),
  ADD KEY `paID` (`paID`),
  ADD KEY `pkID` (`pkID`);

--
-- Indexes for table `ConversationRatingTypes`
--
ALTER TABLE `ConversationRatingTypes`
  ADD PRIMARY KEY (`cnvRatingTypeID`),
  ADD UNIQUE KEY `cnvRatingTypeHandle` (`cnvRatingTypeHandle`),
  ADD KEY `pkgID` (`pkgID`,`cnvRatingTypeHandle`);

--
-- Indexes for table `Conversations`
--
ALTER TABLE `Conversations`
  ADD PRIMARY KEY (`cnvID`),
  ADD KEY `cID` (`cID`),
  ADD KEY `cnvParentMessageID` (`cnvParentMessageID`);

--
-- Indexes for table `ConversationSubscriptions`
--
ALTER TABLE `ConversationSubscriptions`
  ADD PRIMARY KEY (`cnvID`,`uID`),
  ADD KEY `cnvID` (`cnvID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `DownloadStatistics`
--
ALTER TABLE `DownloadStatistics`
  ADD PRIMARY KEY (`dsID`),
  ADD KEY `fID` (`fID`,`timestamp`),
  ADD KEY `fvID` (`fID`,`fvID`),
  ADD KEY `uID` (`uID`),
  ADD KEY `rcID` (`rcID`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `ExpressAttributeKeys`
--
ALTER TABLE `ExpressAttributeKeys`
  ADD PRIMARY KEY (`akID`),
  ADD KEY `IDX_8C881F181257D5D` (`entity_id`);

--
-- Indexes for table `ExpressEntities`
--
ALTER TABLE `ExpressEntities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_BC772AA6918020D9` (`handle`),
  ADD UNIQUE KEY `UNIQ_BC772AA6547D6B2D` (`default_view_form_id`),
  ADD UNIQUE KEY `UNIQ_BC772AA6C7DEC56D` (`default_edit_form_id`),
  ADD KEY `IDX_BC772AA6CE45CBB0` (`pkgID`);

--
-- Indexes for table `ExpressEntityAssociations`
--
ALTER TABLE `ExpressEntityAssociations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_98A0F796E9BBEE93` (`source_entity_id`),
  ADD KEY `IDX_98A0F796B5910F71` (`target_entity_id`);

--
-- Indexes for table `ExpressEntityAssociationSelectedEntries`
--
ALTER TABLE `ExpressEntityAssociationSelectedEntries`
  ADD PRIMARY KEY (`id`,`exSelectedEntryID`),
  ADD KEY `IDX_1F9C570CBF396750` (`id`),
  ADD KEY `IDX_1F9C570CC7B1F65C` (`exSelectedEntryID`);

--
-- Indexes for table `ExpressEntityEntries`
--
ALTER TABLE `ExpressEntityEntries`
  ADD PRIMARY KEY (`exEntryID`),
  ADD KEY `IDX_B8AE3531AFC87D03` (`exEntryEntityID`);

--
-- Indexes for table `ExpressEntityEntryAssociations`
--
ALTER TABLE `ExpressEntityEntryAssociations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_25B3A0826DCB6296` (`exEntryID`),
  ADD KEY `IDX_25B3A082EFB9C8A5` (`association_id`);

--
-- Indexes for table `ExpressEntityEntryAttributeValues`
--
ALTER TABLE `ExpressEntityEntryAttributeValues`
  ADD PRIMARY KEY (`exEntryID`,`akID`),
  ADD KEY `IDX_6DB641546DCB6296` (`exEntryID`),
  ADD KEY `IDX_6DB64154B6561A7E` (`akID`),
  ADD KEY `IDX_6DB64154A2A82A5D` (`avID`);

--
-- Indexes for table `ExpressFormFieldSetAssociationControls`
--
ALTER TABLE `ExpressFormFieldSetAssociationControls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E6DF21BBEFB9C8A5` (`association_id`);

--
-- Indexes for table `ExpressFormFieldSetAttributeKeyControls`
--
ALTER TABLE `ExpressFormFieldSetAttributeKeyControls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8481F9D1B6561A7E` (`akID`);

--
-- Indexes for table `ExpressFormFieldSetControls`
--
ALTER TABLE `ExpressFormFieldSetControls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E42868A43ABF811A` (`field_set_id`);

--
-- Indexes for table `ExpressFormFieldSets`
--
ALTER TABLE `ExpressFormFieldSets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A33BBBEC5FF69B7D` (`form_id`);

--
-- Indexes for table `ExpressFormFieldSetTextControls`
--
ALTER TABLE `ExpressFormFieldSetTextControls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ExpressForms`
--
ALTER TABLE `ExpressForms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8D09031A81257D5D` (`entity_id`);

--
-- Indexes for table `FeatureAssignments`
--
ALTER TABLE `FeatureAssignments`
  ADD PRIMARY KEY (`faID`),
  ADD KEY `feID` (`feID`),
  ADD KEY `fcID` (`fcID`);

--
-- Indexes for table `FeatureCategories`
--
ALTER TABLE `FeatureCategories`
  ADD PRIMARY KEY (`fcID`),
  ADD UNIQUE KEY `fcHandle` (`fcHandle`),
  ADD KEY `pkgID` (`pkgID`,`fcID`);

--
-- Indexes for table `Features`
--
ALTER TABLE `Features`
  ADD PRIMARY KEY (`feID`),
  ADD UNIQUE KEY `feHandle` (`feHandle`),
  ADD KEY `pkgID` (`pkgID`,`feID`);

--
-- Indexes for table `FileAttributeKeys`
--
ALTER TABLE `FileAttributeKeys`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `FileAttributeValues`
--
ALTER TABLE `FileAttributeValues`
  ADD PRIMARY KEY (`fID`,`fvID`,`akID`),
  ADD KEY `IDX_BBECEAA4B6561A7E` (`akID`),
  ADD KEY `IDX_BBECEAA4A2A82A5D` (`avID`);

--
-- Indexes for table `FileImageThumbnailPaths`
--
ALTER TABLE `FileImageThumbnailPaths`
  ADD UNIQUE KEY `thumbnailPathID` (`fileID`,`fileVersionID`,`thumbnailTypeHandle`,`storageLocationID`);

--
-- Indexes for table `FileImageThumbnailTypes`
--
ALTER TABLE `FileImageThumbnailTypes`
  ADD PRIMARY KEY (`ftTypeID`);

--
-- Indexes for table `FilePermissionAssignments`
--
ALTER TABLE `FilePermissionAssignments`
  ADD PRIMARY KEY (`fID`,`pkID`,`paID`),
  ADD KEY `pkID` (`pkID`),
  ADD KEY `paID` (`paID`);

--
-- Indexes for table `FilePermissionFileTypeAccessList`
--
ALTER TABLE `FilePermissionFileTypeAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `FilePermissionFileTypeAccessListCustom`
--
ALTER TABLE `FilePermissionFileTypeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`extension`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `FilePermissionFileTypes`
--
ALTER TABLE `FilePermissionFileTypes`
  ADD PRIMARY KEY (`fsID`,`gID`,`uID`,`extension`),
  ADD KEY `gID` (`gID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `Files`
--
ALTER TABLE `Files`
  ADD PRIMARY KEY (`fID`),
  ADD KEY `uID` (`uID`),
  ADD KEY `fslID` (`fslID`),
  ADD KEY `ocID` (`ocID`),
  ADD KEY `fOverrideSetPermissions` (`fOverrideSetPermissions`);

--
-- Indexes for table `FileSearchIndexAttributes`
--
ALTER TABLE `FileSearchIndexAttributes`
  ADD PRIMARY KEY (`fID`);

--
-- Indexes for table `FileSetFiles`
--
ALTER TABLE `FileSetFiles`
  ADD PRIMARY KEY (`fsfID`),
  ADD KEY `fID` (`fID`),
  ADD KEY `fsID` (`fsID`);

--
-- Indexes for table `FileSets`
--
ALTER TABLE `FileSets`
  ADD PRIMARY KEY (`fsID`),
  ADD KEY `uID` (`uID`,`fsType`,`fsName`),
  ADD KEY `fsName` (`fsName`),
  ADD KEY `fsType` (`fsType`);

--
-- Indexes for table `FileSetSavedSearches`
--
ALTER TABLE `FileSetSavedSearches`
  ADD PRIMARY KEY (`fsID`);

--
-- Indexes for table `FileStorageLocations`
--
ALTER TABLE `FileStorageLocations`
  ADD PRIMARY KEY (`fslID`);

--
-- Indexes for table `FileStorageLocationTypes`
--
ALTER TABLE `FileStorageLocationTypes`
  ADD PRIMARY KEY (`fslTypeID`);

--
-- Indexes for table `FileUsageRecord`
--
ALTER TABLE `FileUsageRecord`
  ADD PRIMARY KEY (`file_id`,`block_id`,`collection_id`,`collection_version_id`),
  ADD KEY `block` (`block_id`),
  ADD KEY `collection_version` (`collection_id`,`collection_version_id`);

--
-- Indexes for table `FileVersionLog`
--
ALTER TABLE `FileVersionLog`
  ADD PRIMARY KEY (`fvlID`),
  ADD KEY `fvID` (`fID`,`fvID`,`fvlID`);

--
-- Indexes for table `FileVersions`
--
ALTER TABLE `FileVersions`
  ADD PRIMARY KEY (`fID`,`fvID`),
  ADD KEY `IDX_D7B5A13AE3111F45` (`fID`),
  ADD KEY `fvFilename` (`fvFilename`),
  ADD KEY `fvExtension` (`fvExtension`),
  ADD KEY `fvType` (`fvType`);

--
-- Indexes for table `gaPage`
--
ALTER TABLE `gaPage`
  ADD PRIMARY KEY (`gaiID`),
  ADD KEY `cID` (`cID`);

--
-- Indexes for table `GatheringConfiguredDataSources`
--
ALTER TABLE `GatheringConfiguredDataSources`
  ADD PRIMARY KEY (`gcsID`),
  ADD KEY `gaID` (`gaID`),
  ADD KEY `gasID` (`gasID`);

--
-- Indexes for table `GatheringDataSources`
--
ALTER TABLE `GatheringDataSources`
  ADD PRIMARY KEY (`gasID`),
  ADD UNIQUE KEY `gasHandle` (`gasHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `GatheringItemFeatureAssignments`
--
ALTER TABLE `GatheringItemFeatureAssignments`
  ADD PRIMARY KEY (`gafaID`),
  ADD KEY `gaiID` (`gaiID`,`faID`),
  ADD KEY `faID` (`faID`);

--
-- Indexes for table `GatheringItems`
--
ALTER TABLE `GatheringItems`
  ADD PRIMARY KEY (`gaiID`),
  ADD UNIQUE KEY `gaiUniqueKey` (`gaiKey`,`gasID`,`gaID`),
  ADD KEY `gaID` (`gaID`,`gaiBatchTimestamp`),
  ADD KEY `gasID` (`gasID`);

--
-- Indexes for table `GatheringItemSelectedTemplates`
--
ALTER TABLE `GatheringItemSelectedTemplates`
  ADD PRIMARY KEY (`gaiID`,`gatID`),
  ADD UNIQUE KEY `gatUniqueKey` (`gaiID`,`gatTypeID`),
  ADD KEY `gatTypeID` (`gatTypeID`),
  ADD KEY `gatID` (`gatID`);

--
-- Indexes for table `GatheringItemTemplateFeatures`
--
ALTER TABLE `GatheringItemTemplateFeatures`
  ADD PRIMARY KEY (`gfeID`),
  ADD KEY `gatID` (`gatID`),
  ADD KEY `feID` (`feID`,`gatID`);

--
-- Indexes for table `GatheringItemTemplates`
--
ALTER TABLE `GatheringItemTemplates`
  ADD PRIMARY KEY (`gatID`),
  ADD UNIQUE KEY `gatHandle` (`gatHandle`,`gatTypeID`),
  ADD KEY `gatTypeID` (`gatTypeID`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `GatheringItemTemplateTypes`
--
ALTER TABLE `GatheringItemTemplateTypes`
  ADD PRIMARY KEY (`gatTypeID`),
  ADD UNIQUE KEY `gatTypeHandle` (`gatTypeHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `GatheringPermissionAssignments`
--
ALTER TABLE `GatheringPermissionAssignments`
  ADD PRIMARY KEY (`gaID`,`pkID`,`paID`),
  ADD KEY `pkID` (`pkID`),
  ADD KEY `paID` (`paID`);

--
-- Indexes for table `Gatherings`
--
ALTER TABLE `Gatherings`
  ADD PRIMARY KEY (`gaID`),
  ADD KEY `gaDateLastUpdated` (`gaDateLastUpdated`);

--
-- Indexes for table `Groups`
--
ALTER TABLE `Groups`
  ADD PRIMARY KEY (`gID`),
  ADD KEY `gName` (`gName`),
  ADD KEY `gBadgeFID` (`gBadgeFID`),
  ADD KEY `pkgID` (`pkgID`),
  ADD KEY `gPath` (`gPath`(255));

--
-- Indexes for table `GroupSetGroups`
--
ALTER TABLE `GroupSetGroups`
  ADD PRIMARY KEY (`gID`,`gsID`),
  ADD KEY `gsID` (`gsID`);

--
-- Indexes for table `GroupSets`
--
ALTER TABLE `GroupSets`
  ADD PRIMARY KEY (`gsID`),
  ADD KEY `gsName` (`gsName`),
  ADD KEY `pkgID` (`pkgID`,`gsID`);

--
-- Indexes for table `Jobs`
--
ALTER TABLE `Jobs`
  ADD PRIMARY KEY (`jID`),
  ADD UNIQUE KEY `jHandle` (`jHandle`),
  ADD KEY `pkgID` (`pkgID`),
  ADD KEY `isScheduled` (`isScheduled`,`jDateLastRun`,`jID`),
  ADD KEY `jDateLastRun` (`jDateLastRun`,`jID`);

--
-- Indexes for table `JobSetJobs`
--
ALTER TABLE `JobSetJobs`
  ADD PRIMARY KEY (`jsID`,`jID`),
  ADD KEY `jID` (`jID`);

--
-- Indexes for table `JobSets`
--
ALTER TABLE `JobSets`
  ADD PRIMARY KEY (`jsID`),
  ADD KEY `pkgID` (`pkgID`),
  ADD KEY `jsName` (`jsName`);

--
-- Indexes for table `JobsLog`
--
ALTER TABLE `JobsLog`
  ADD PRIMARY KEY (`jlID`),
  ADD KEY `jID` (`jID`);

--
-- Indexes for table `LegacyAttributeKeys`
--
ALTER TABLE `LegacyAttributeKeys`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `Logs`
--
ALTER TABLE `Logs`
  ADD PRIMARY KEY (`logID`),
  ADD KEY `channel` (`channel`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `MailImporters`
--
ALTER TABLE `MailImporters`
  ADD PRIMARY KEY (`miID`),
  ADD UNIQUE KEY `miHandle` (`miHandle`),
  ADD KEY `pkgID` (`pkgID`,`miID`);

--
-- Indexes for table `MailValidationHashes`
--
ALTER TABLE `MailValidationHashes`
  ADD PRIMARY KEY (`mvhID`),
  ADD UNIQUE KEY `mHash` (`mHash`),
  ADD KEY `miID` (`miID`);

--
-- Indexes for table `MultilingualPageRelations`
--
ALTER TABLE `MultilingualPageRelations`
  ADD PRIMARY KEY (`mpRelationID`,`cID`);

--
-- Indexes for table `MultilingualTranslations`
--
ALTER TABLE `MultilingualTranslations`
  ADD PRIMARY KEY (`mtID`);

--
-- Indexes for table `NotificationAlerts`
--
ALTER TABLE `NotificationAlerts`
  ADD PRIMARY KEY (`naID`),
  ADD KEY `IDX_E11C7408FD71026C` (`uID`),
  ADD KEY `IDX_E11C7408ED024EFD` (`nID`);

--
-- Indexes for table `NotificationPermissionSubscriptionList`
--
ALTER TABLE `NotificationPermissionSubscriptionList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `NotificationPermissionSubscriptionListCustom`
--
ALTER TABLE `NotificationPermissionSubscriptionListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`nSubscriptionIdentifier`),
  ADD KEY `peID` (`peID`),
  ADD KEY `nSubscriptionIdentifier` (`nSubscriptionIdentifier`);

--
-- Indexes for table `Notifications`
--
ALTER TABLE `Notifications`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `OauthUserMap`
--
ALTER TABLE `OauthUserMap`
  ADD PRIMARY KEY (`user_id`,`namespace`),
  ADD UNIQUE KEY `oauth_binding` (`binding`,`namespace`);

--
-- Indexes for table `Packages`
--
ALTER TABLE `Packages`
  ADD PRIMARY KEY (`pkgID`),
  ADD UNIQUE KEY `UNIQ_62C3A2F1F2D49DB1` (`pkgHandle`);

--
-- Indexes for table `PageFeeds`
--
ALTER TABLE `PageFeeds`
  ADD PRIMARY KEY (`pfID`);

--
-- Indexes for table `PagePaths`
--
ALTER TABLE `PagePaths`
  ADD PRIMARY KEY (`ppID`),
  ADD KEY `cPath` (`cPath`(255));

--
-- Indexes for table `PagePermissionAssignments`
--
ALTER TABLE `PagePermissionAssignments`
  ADD PRIMARY KEY (`cID`,`pkID`,`paID`),
  ADD KEY `paID` (`paID`,`pkID`),
  ADD KEY `pkID` (`pkID`);

--
-- Indexes for table `PagePermissionPageTypeAccessList`
--
ALTER TABLE `PagePermissionPageTypeAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `PagePermissionPageTypeAccessListCustom`
--
ALTER TABLE `PagePermissionPageTypeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`ptID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `ptID` (`ptID`);

--
-- Indexes for table `PagePermissionPropertyAccessList`
--
ALTER TABLE `PagePermissionPropertyAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `PagePermissionPropertyAttributeAccessListCustom`
--
ALTER TABLE `PagePermissionPropertyAttributeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`akID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `akID` (`akID`);

--
-- Indexes for table `PagePermissionThemeAccessList`
--
ALTER TABLE `PagePermissionThemeAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `PagePermissionThemeAccessListCustom`
--
ALTER TABLE `PagePermissionThemeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`pThemeID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `pThemeID` (`pThemeID`);

--
-- Indexes for table `Pages`
--
ALTER TABLE `Pages`
  ADD PRIMARY KEY (`cID`,`ptID`),
  ADD KEY `cParentID` (`cParentID`),
  ADD KEY `siteTreeID` (`siteTreeID`),
  ADD KEY `cIsActive` (`cID`,`cIsActive`),
  ADD KEY `cCheckedOutUID` (`cCheckedOutUID`),
  ADD KEY `uID` (`uID`,`cPointerID`),
  ADD KEY `cPointerID` (`cPointerID`,`cDisplayOrder`),
  ADD KEY `cIsTemplate` (`cID`,`cIsTemplate`),
  ADD KEY `cIsSystemPage` (`cID`,`cIsSystemPage`),
  ADD KEY `pkgID` (`pkgID`),
  ADD KEY `cParentMaxDisplay` (`cParentID`,`cDisplayOrder`);

--
-- Indexes for table `PageSearchIndex`
--
ALTER TABLE `PageSearchIndex`
  ADD PRIMARY KEY (`cID`),
  ADD KEY `cDateLastIndexed` (`cDateLastIndexed`),
  ADD KEY `cDateLastSitemapped` (`cDateLastSitemapped`),
  ADD KEY `cRequiresReindex` (`cRequiresReindex`);
ALTER TABLE `PageSearchIndex` ADD FULLTEXT KEY `cName` (`cName`);
ALTER TABLE `PageSearchIndex` ADD FULLTEXT KEY `cDescription` (`cDescription`);
ALTER TABLE `PageSearchIndex` ADD FULLTEXT KEY `content` (`content`);
ALTER TABLE `PageSearchIndex` ADD FULLTEXT KEY `content2` (`cName`,`cDescription`,`content`);

--
-- Indexes for table `PageTemplates`
--
ALTER TABLE `PageTemplates`
  ADD PRIMARY KEY (`pTemplateID`);

--
-- Indexes for table `PageThemeCustomStyles`
--
ALTER TABLE `PageThemeCustomStyles`
  ADD PRIMARY KEY (`pThemeID`),
  ADD KEY `scvlID` (`scvlID`),
  ADD KEY `sccRecordID` (`sccRecordID`);

--
-- Indexes for table `PageThemes`
--
ALTER TABLE `PageThemes`
  ADD PRIMARY KEY (`pThemeID`),
  ADD UNIQUE KEY `ptHandle` (`pThemeHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `PageTypeComposerControlTypes`
--
ALTER TABLE `PageTypeComposerControlTypes`
  ADD PRIMARY KEY (`ptComposerControlTypeID`),
  ADD UNIQUE KEY `ptComposerControlTypeHandle` (`ptComposerControlTypeHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `PageTypeComposerFormLayoutSetControls`
--
ALTER TABLE `PageTypeComposerFormLayoutSetControls`
  ADD PRIMARY KEY (`ptComposerFormLayoutSetControlID`),
  ADD KEY `ptComposerControlTypeID` (`ptComposerControlTypeID`);

--
-- Indexes for table `PageTypeComposerFormLayoutSets`
--
ALTER TABLE `PageTypeComposerFormLayoutSets`
  ADD PRIMARY KEY (`ptComposerFormLayoutSetID`),
  ADD KEY `ptID` (`ptID`);

--
-- Indexes for table `PageTypeComposerOutputBlocks`
--
ALTER TABLE `PageTypeComposerOutputBlocks`
  ADD PRIMARY KEY (`ptComposerOutputBlockID`),
  ADD KEY `cID` (`cID`),
  ADD KEY `bID` (`bID`,`cID`),
  ADD KEY `ptComposerFormLayoutSetControlID` (`ptComposerFormLayoutSetControlID`);

--
-- Indexes for table `PageTypeComposerOutputControls`
--
ALTER TABLE `PageTypeComposerOutputControls`
  ADD PRIMARY KEY (`ptComposerOutputControlID`),
  ADD KEY `pTemplateID` (`pTemplateID`,`ptComposerFormLayoutSetControlID`),
  ADD KEY `ptID` (`ptID`),
  ADD KEY `ptComposerFormLayoutSetControlID` (`ptComposerFormLayoutSetControlID`);

--
-- Indexes for table `PageTypePageTemplateDefaultPages`
--
ALTER TABLE `PageTypePageTemplateDefaultPages`
  ADD PRIMARY KEY (`pTemplateID`,`ptID`),
  ADD KEY `ptID` (`ptID`),
  ADD KEY `cID` (`cID`);

--
-- Indexes for table `PageTypePageTemplates`
--
ALTER TABLE `PageTypePageTemplates`
  ADD PRIMARY KEY (`ptID`,`pTemplateID`),
  ADD KEY `pTemplateID` (`pTemplateID`);

--
-- Indexes for table `PageTypePermissionAssignments`
--
ALTER TABLE `PageTypePermissionAssignments`
  ADD PRIMARY KEY (`ptID`,`pkID`,`paID`),
  ADD KEY `pkID` (`pkID`),
  ADD KEY `ptID` (`ptID`);

--
-- Indexes for table `PageTypePublishTargetTypes`
--
ALTER TABLE `PageTypePublishTargetTypes`
  ADD PRIMARY KEY (`ptPublishTargetTypeID`),
  ADD KEY `ptPublishTargetTypeHandle` (`ptPublishTargetTypeHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `PageTypes`
--
ALTER TABLE `PageTypes`
  ADD PRIMARY KEY (`ptID`),
  ADD UNIQUE KEY `ptHandle` (`ptHandle`),
  ADD KEY `siteTypeID` (`siteTypeID`),
  ADD KEY `pkgID` (`pkgID`,`ptID`);

--
-- Indexes for table `PageWorkflowProgress`
--
ALTER TABLE `PageWorkflowProgress`
  ADD PRIMARY KEY (`cID`,`wpID`),
  ADD KEY `wpID` (`wpID`);

--
-- Indexes for table `PermissionAccess`
--
ALTER TABLE `PermissionAccess`
  ADD PRIMARY KEY (`paID`);

--
-- Indexes for table `PermissionAccessEntities`
--
ALTER TABLE `PermissionAccessEntities`
  ADD PRIMARY KEY (`peID`),
  ADD KEY `petID` (`petID`);

--
-- Indexes for table `PermissionAccessEntityGroups`
--
ALTER TABLE `PermissionAccessEntityGroups`
  ADD PRIMARY KEY (`pegID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `gID` (`gID`);

--
-- Indexes for table `PermissionAccessEntityGroupSets`
--
ALTER TABLE `PermissionAccessEntityGroupSets`
  ADD PRIMARY KEY (`peID`,`gsID`),
  ADD KEY `gsID` (`gsID`);

--
-- Indexes for table `PermissionAccessEntityTypeCategories`
--
ALTER TABLE `PermissionAccessEntityTypeCategories`
  ADD PRIMARY KEY (`petID`,`pkCategoryID`),
  ADD KEY `pkCategoryID` (`pkCategoryID`);

--
-- Indexes for table `PermissionAccessEntityTypes`
--
ALTER TABLE `PermissionAccessEntityTypes`
  ADD PRIMARY KEY (`petID`),
  ADD UNIQUE KEY `petHandle` (`petHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `PermissionAccessEntityUsers`
--
ALTER TABLE `PermissionAccessEntityUsers`
  ADD PRIMARY KEY (`peID`,`uID`),
  ADD KEY `uID` (`uID`);

--
-- Indexes for table `PermissionAccessList`
--
ALTER TABLE `PermissionAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `accessType` (`accessType`),
  ADD KEY `peID` (`peID`),
  ADD KEY `peID_accessType` (`peID`,`accessType`),
  ADD KEY `pdID` (`pdID`),
  ADD KEY `permissionAccessDuration` (`paID`,`pdID`);

--
-- Indexes for table `PermissionAccessWorkflows`
--
ALTER TABLE `PermissionAccessWorkflows`
  ADD PRIMARY KEY (`paID`,`wfID`),
  ADD KEY `wfID` (`wfID`);

--
-- Indexes for table `PermissionAssignments`
--
ALTER TABLE `PermissionAssignments`
  ADD PRIMARY KEY (`paID`,`pkID`),
  ADD KEY `pkID` (`pkID`);

--
-- Indexes for table `PermissionDurationObjects`
--
ALTER TABLE `PermissionDurationObjects`
  ADD PRIMARY KEY (`pdID`);

--
-- Indexes for table `PermissionKeyCategories`
--
ALTER TABLE `PermissionKeyCategories`
  ADD PRIMARY KEY (`pkCategoryID`),
  ADD UNIQUE KEY `pkCategoryHandle` (`pkCategoryHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `PermissionKeys`
--
ALTER TABLE `PermissionKeys`
  ADD PRIMARY KEY (`pkID`),
  ADD UNIQUE KEY `akHandle` (`pkHandle`),
  ADD KEY `pkCategoryID` (`pkCategoryID`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `PileContents`
--
ALTER TABLE `PileContents`
  ADD PRIMARY KEY (`pcID`),
  ADD KEY `pID` (`pID`,`displayOrder`),
  ADD KEY `itemID` (`itemID`),
  ADD KEY `itemType` (`itemType`,`itemID`,`pID`);

--
-- Indexes for table `Piles`
--
ALTER TABLE `Piles`
  ADD PRIMARY KEY (`pID`),
  ADD KEY `uID` (`uID`,`name`);

--
-- Indexes for table `PrivateMessageNotifications`
--
ALTER TABLE `PrivateMessageNotifications`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `QueueMessages`
--
ALTER TABLE `QueueMessages`
  ADD PRIMARY KEY (`message_id`),
  ADD UNIQUE KEY `message_handle` (`handle`),
  ADD KEY `message_queueid` (`queue_id`);

--
-- Indexes for table `QueuePageDuplicationRelations`
--
ALTER TABLE `QueuePageDuplicationRelations`
  ADD PRIMARY KEY (`cID`,`originalCID`),
  ADD KEY `originalCID` (`originalCID`,`queue_name`);

--
-- Indexes for table `Queues`
--
ALTER TABLE `Queues`
  ADD PRIMARY KEY (`queue_id`),
  ADD KEY `queue_name` (`queue_name`);

--
-- Indexes for table `SavedFileSearchQueries`
--
ALTER TABLE `SavedFileSearchQueries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SavedPageSearchQueries`
--
ALTER TABLE `SavedPageSearchQueries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SavedUserSearchQueries`
--
ALTER TABLE `SavedUserSearchQueries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Sessions`
--
ALTER TABLE `Sessions`
  ADD PRIMARY KEY (`sessionID`);

--
-- Indexes for table `SiblingPageRelations`
--
ALTER TABLE `SiblingPageRelations`
  ADD PRIMARY KEY (`mpRelationID`,`cID`);

--
-- Indexes for table `SignupRequests`
--
ALTER TABLE `SignupRequests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ipFrom` (`ipFrom`(32));

--
-- Indexes for table `SiteAttributeKeys`
--
ALTER TABLE `SiteAttributeKeys`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `SiteAttributeValues`
--
ALTER TABLE `SiteAttributeValues`
  ADD PRIMARY KEY (`siteID`,`akID`),
  ADD KEY `IDX_67658AF7521D8435` (`siteID`),
  ADD KEY `IDX_67658AF7B6561A7E` (`akID`),
  ADD KEY `IDX_67658AF7A2A82A5D` (`avID`);

--
-- Indexes for table `SiteLocales`
--
ALTER TABLE `SiteLocales`
  ADD PRIMARY KEY (`siteLocaleID`),
  ADD UNIQUE KEY `UNIQ_2527AB2CF9431B4B` (`siteTreeID`),
  ADD KEY `IDX_2527AB2C521D8435` (`siteID`);

--
-- Indexes for table `Sites`
--
ALTER TABLE `Sites`
  ADD PRIMARY KEY (`siteID`),
  ADD UNIQUE KEY `UNIQ_7DC18567D84E1976` (`siteHandle`),
  ADD KEY `IDX_7DC18567E9548DF7` (`siteTypeID`);

--
-- Indexes for table `SiteSearchIndexAttributes`
--
ALTER TABLE `SiteSearchIndexAttributes`
  ADD PRIMARY KEY (`siteID`);

--
-- Indexes for table `SiteTrees`
--
ALTER TABLE `SiteTrees`
  ADD PRIMARY KEY (`siteTreeID`);

--
-- Indexes for table `SiteTreeTrees`
--
ALTER TABLE `SiteTreeTrees`
  ADD PRIMARY KEY (`siteTreeID`),
  ADD UNIQUE KEY `UNIQ_A4B9696EACD624CD` (`siteLocaleID`);

--
-- Indexes for table `SiteTypes`
--
ALTER TABLE `SiteTypes`
  ADD PRIMARY KEY (`siteTypeID`),
  ADD UNIQUE KEY `UNIQ_7CBFE97576D39A3C` (`siteTypeHandle`),
  ADD UNIQUE KEY `UNIQ_7CBFE975C7F74FC3` (`siteTypeName`),
  ADD KEY `IDX_7CBFE975CE45CBB0` (`pkgID`);

--
-- Indexes for table `SocialLinks`
--
ALTER TABLE `SocialLinks`
  ADD PRIMARY KEY (`slID`),
  ADD KEY `IDX_84EBA2B4521D8435` (`siteID`);

--
-- Indexes for table `Stacks`
--
ALTER TABLE `Stacks`
  ADD PRIMARY KEY (`stID`),
  ADD KEY `stType` (`stType`),
  ADD KEY `stName` (`stName`),
  ADD KEY `cID` (`cID`);

--
-- Indexes for table `StackUsageRecord`
--
ALTER TABLE `StackUsageRecord`
  ADD PRIMARY KEY (`stack_id`,`block_id`,`collection_id`,`collection_version_id`),
  ADD KEY `block` (`block_id`),
  ADD KEY `collection_version` (`collection_id`,`collection_version_id`);

--
-- Indexes for table `StyleCustomizerCustomCssRecords`
--
ALTER TABLE `StyleCustomizerCustomCssRecords`
  ADD PRIMARY KEY (`sccRecordID`);

--
-- Indexes for table `StyleCustomizerInlineStylePresets`
--
ALTER TABLE `StyleCustomizerInlineStylePresets`
  ADD PRIMARY KEY (`pssPresetID`),
  ADD KEY `issID` (`issID`);

--
-- Indexes for table `StyleCustomizerInlineStyleSets`
--
ALTER TABLE `StyleCustomizerInlineStyleSets`
  ADD PRIMARY KEY (`issID`);

--
-- Indexes for table `StyleCustomizerValueLists`
--
ALTER TABLE `StyleCustomizerValueLists`
  ADD PRIMARY KEY (`scvlID`);

--
-- Indexes for table `StyleCustomizerValues`
--
ALTER TABLE `StyleCustomizerValues`
  ADD PRIMARY KEY (`scvID`),
  ADD KEY `scvlID` (`scvlID`);

--
-- Indexes for table `SystemAntispamLibraries`
--
ALTER TABLE `SystemAntispamLibraries`
  ADD PRIMARY KEY (`saslHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `SystemCaptchaLibraries`
--
ALTER TABLE `SystemCaptchaLibraries`
  ADD PRIMARY KEY (`sclHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `SystemContentEditorSnippets`
--
ALTER TABLE `SystemContentEditorSnippets`
  ADD PRIMARY KEY (`scsHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `SystemDatabaseMigrations`
--
ALTER TABLE `SystemDatabaseMigrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `SystemDatabaseQueryLog`
--
ALTER TABLE `SystemDatabaseQueryLog`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `TopicTrees`
--
ALTER TABLE `TopicTrees`
  ADD PRIMARY KEY (`treeID`);

--
-- Indexes for table `TreeFileNodes`
--
ALTER TABLE `TreeFileNodes`
  ADD PRIMARY KEY (`treeNodeID`),
  ADD KEY `fID` (`fID`);

--
-- Indexes for table `TreeGroupNodes`
--
ALTER TABLE `TreeGroupNodes`
  ADD PRIMARY KEY (`treeNodeID`),
  ADD KEY `gID` (`gID`);

--
-- Indexes for table `TreeNodePermissionAssignments`
--
ALTER TABLE `TreeNodePermissionAssignments`
  ADD PRIMARY KEY (`treeNodeID`,`pkID`,`paID`),
  ADD KEY `pkID` (`pkID`),
  ADD KEY `paID` (`paID`);

--
-- Indexes for table `TreeNodes`
--
ALTER TABLE `TreeNodes`
  ADD PRIMARY KEY (`treeNodeID`),
  ADD KEY `treeNodeParentID` (`treeNodeParentID`),
  ADD KEY `treeNodeTypeID` (`treeNodeTypeID`),
  ADD KEY `treeID` (`treeID`),
  ADD KEY `inheritPermissionsFromTreeNodeID` (`inheritPermissionsFromTreeNodeID`,`treeNodeID`);

--
-- Indexes for table `TreeNodeTypes`
--
ALTER TABLE `TreeNodeTypes`
  ADD PRIMARY KEY (`treeNodeTypeID`),
  ADD UNIQUE KEY `treeNodeTypeHandle` (`treeNodeTypeHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `Trees`
--
ALTER TABLE `Trees`
  ADD PRIMARY KEY (`treeID`),
  ADD KEY `treeTypeID` (`treeTypeID`);

--
-- Indexes for table `TreeSearchQueryNodes`
--
ALTER TABLE `TreeSearchQueryNodes`
  ADD PRIMARY KEY (`treeNodeID`),
  ADD KEY `savedSearchID` (`savedSearchID`);

--
-- Indexes for table `TreeTypes`
--
ALTER TABLE `TreeTypes`
  ADD PRIMARY KEY (`treeTypeID`),
  ADD UNIQUE KEY `treeTypeHandle` (`treeTypeHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `UserAttributeKeys`
--
ALTER TABLE `UserAttributeKeys`
  ADD PRIMARY KEY (`akID`);

--
-- Indexes for table `UserAttributeValues`
--
ALTER TABLE `UserAttributeValues`
  ADD PRIMARY KEY (`uID`,`akID`),
  ADD KEY `IDX_4DB68CA6FD71026C` (`uID`),
  ADD KEY `IDX_4DB68CA6B6561A7E` (`akID`),
  ADD KEY `IDX_4DB68CA6A2A82A5D` (`avID`);

--
-- Indexes for table `UserBannedIPs`
--
ALTER TABLE `UserBannedIPs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ipFrom` (`ipFrom`(32),`ipTo`(32));

--
-- Indexes for table `UserGroups`
--
ALTER TABLE `UserGroups`
  ADD PRIMARY KEY (`uID`,`gID`),
  ADD KEY `uID` (`uID`),
  ADD KEY `gID` (`gID`);

--
-- Indexes for table `UserPermissionEditPropertyAccessList`
--
ALTER TABLE `UserPermissionEditPropertyAccessList`
  ADD PRIMARY KEY (`paID`,`peID`);

--
-- Indexes for table `UserPermissionEditPropertyAttributeAccessListCustom`
--
ALTER TABLE `UserPermissionEditPropertyAttributeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`akID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `akID` (`akID`);

--
-- Indexes for table `UserPermissionViewAttributeAccessList`
--
ALTER TABLE `UserPermissionViewAttributeAccessList`
  ADD PRIMARY KEY (`paID`,`peID`),
  ADD KEY `peID` (`peID`);

--
-- Indexes for table `UserPermissionViewAttributeAccessListCustom`
--
ALTER TABLE `UserPermissionViewAttributeAccessListCustom`
  ADD PRIMARY KEY (`paID`,`peID`,`akID`),
  ADD KEY `peID` (`peID`),
  ADD KEY `akID` (`akID`);

--
-- Indexes for table `UserPointActions`
--
ALTER TABLE `UserPointActions`
  ADD PRIMARY KEY (`upaID`),
  ADD UNIQUE KEY `upaHandle` (`upaHandle`),
  ADD KEY `pkgID` (`pkgID`),
  ADD KEY `gBBadgeID` (`gBadgeID`);

--
-- Indexes for table `UserPointHistory`
--
ALTER TABLE `UserPointHistory`
  ADD PRIMARY KEY (`upID`),
  ADD KEY `upuID` (`upuID`),
  ADD KEY `upaID` (`upaID`);

--
-- Indexes for table `UserPrivateMessages`
--
ALTER TABLE `UserPrivateMessages`
  ADD PRIMARY KEY (`msgID`),
  ADD KEY `uAuthorID` (`uAuthorID`,`msgDateCreated`);

--
-- Indexes for table `UserPrivateMessagesTo`
--
ALTER TABLE `UserPrivateMessagesTo`
  ADD PRIMARY KEY (`msgID`,`uID`,`uAuthorID`,`msgMailboxID`),
  ADD KEY `uID` (`uID`),
  ADD KEY `uAuthorID` (`uAuthorID`),
  ADD KEY `msgFolderID` (`msgMailboxID`),
  ADD KEY `msgIsNew` (`msgIsNew`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`uID`),
  ADD UNIQUE KEY `UNIQ_D5428AED28459686` (`uName`),
  ADD KEY `uEmail` (`uEmail`);

--
-- Indexes for table `UserSearchIndexAttributes`
--
ALTER TABLE `UserSearchIndexAttributes`
  ADD PRIMARY KEY (`uID`);

--
-- Indexes for table `UserSignupNotifications`
--
ALTER TABLE `UserSignupNotifications`
  ADD PRIMARY KEY (`nID`),
  ADD KEY `IDX_7FB1DF5B7B18287E` (`usID`);

--
-- Indexes for table `UserSignups`
--
ALTER TABLE `UserSignups`
  ADD PRIMARY KEY (`usID`),
  ADD UNIQUE KEY `UNIQ_FEB5D909FD71026C` (`uID`),
  ADD KEY `IDX_FEB5D909D3564642` (`createdBy`);

--
-- Indexes for table `UserValidationHashes`
--
ALTER TABLE `UserValidationHashes`
  ADD PRIMARY KEY (`uvhID`),
  ADD KEY `uID` (`uID`,`type`),
  ADD KEY `uHash` (`uHash`,`type`),
  ADD KEY `uDateGenerated` (`uDateGenerated`,`type`);

--
-- Indexes for table `UserWorkflowProgress`
--
ALTER TABLE `UserWorkflowProgress`
  ADD PRIMARY KEY (`uID`,`wpID`);

--
-- Indexes for table `WorkflowProgress`
--
ALTER TABLE `WorkflowProgress`
  ADD PRIMARY KEY (`wpID`),
  ADD KEY `wpCategoryID` (`wpCategoryID`),
  ADD KEY `wfID` (`wfID`),
  ADD KEY `wrID` (`wrID`,`wpID`,`wpIsCompleted`);

--
-- Indexes for table `WorkflowProgressCategories`
--
ALTER TABLE `WorkflowProgressCategories`
  ADD PRIMARY KEY (`wpCategoryID`),
  ADD UNIQUE KEY `wpCategoryHandle` (`wpCategoryHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `WorkflowProgressHistory`
--
ALTER TABLE `WorkflowProgressHistory`
  ADD PRIMARY KEY (`wphID`),
  ADD KEY `wpID` (`wpID`,`timestamp`);

--
-- Indexes for table `WorkflowProgressNotifications`
--
ALTER TABLE `WorkflowProgressNotifications`
  ADD PRIMARY KEY (`nID`);

--
-- Indexes for table `WorkflowRequestObjects`
--
ALTER TABLE `WorkflowRequestObjects`
  ADD PRIMARY KEY (`wrID`);

--
-- Indexes for table `Workflows`
--
ALTER TABLE `Workflows`
  ADD PRIMARY KEY (`wfID`),
  ADD UNIQUE KEY `wfName` (`wfName`),
  ADD KEY `wftID` (`wftID`,`wfID`),
  ADD KEY `pkgID` (`pkgID`);

--
-- Indexes for table `WorkflowTypes`
--
ALTER TABLE `WorkflowTypes`
  ADD PRIMARY KEY (`wftID`),
  ADD UNIQUE KEY `wftHandle` (`wftHandle`),
  ADD KEY `pkgID` (`pkgID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AreaLayoutColumns`
--
ALTER TABLE `AreaLayoutColumns`
  MODIFY `arLayoutColumnID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `AreaLayoutCustomColumns`
--
ALTER TABLE `AreaLayoutCustomColumns`
  MODIFY `arLayoutColumnID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `AreaLayoutPresets`
--
ALTER TABLE `AreaLayoutPresets`
  MODIFY `arLayoutPresetID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `AreaLayouts`
--
ALTER TABLE `AreaLayouts`
  MODIFY `arLayoutID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `AreaLayoutThemeGridColumns`
--
ALTER TABLE `AreaLayoutThemeGridColumns`
  MODIFY `arLayoutColumnID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `Areas`
--
ALTER TABLE `Areas`
  MODIFY `arID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `atSelectedSocialLinks`
--
ALTER TABLE `atSelectedSocialLinks`
  MODIFY `avsID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `atSelectedTopics`
--
ALTER TABLE `atSelectedTopics`
  MODIFY `avTreeTopicNodeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `atSelectOptionLists`
--
ALTER TABLE `atSelectOptionLists`
  MODIFY `avSelectOptionListID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `atSelectOptions`
--
ALTER TABLE `atSelectOptions`
  MODIFY `avSelectOptionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `AttributeKeyCategories`
--
ALTER TABLE `AttributeKeyCategories`
  MODIFY `akCategoryID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `AttributeKeys`
--
ALTER TABLE `AttributeKeys`
  MODIFY `akID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `AttributeSets`
--
ALTER TABLE `AttributeSets`
  MODIFY `asID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `AttributeTypes`
--
ALTER TABLE `AttributeTypes`
  MODIFY `atID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `AttributeValues`
--
ALTER TABLE `AttributeValues`
  MODIFY `avID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;
--
-- AUTO_INCREMENT for table `AuthenticationTypes`
--
ALTER TABLE `AuthenticationTypes`
  MODIFY `authTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `authTypeConcreteCookieMap`
--
ALTER TABLE `authTypeConcreteCookieMap`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `BannedWords`
--
ALTER TABLE `BannedWords`
  MODIFY `bwID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Blocks`
--
ALTER TABLE `Blocks`
  MODIFY `bID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `BlockTypes`
--
ALTER TABLE `BlockTypes`
  MODIFY `btID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `BlockTypeSets`
--
ALTER TABLE `BlockTypeSets`
  MODIFY `btsID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `btFaqEntries`
--
ALTER TABLE `btFaqEntries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `btFormAnswers`
--
ALTER TABLE `btFormAnswers`
  MODIFY `aID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `btFormAnswerSet`
--
ALTER TABLE `btFormAnswerSet`
  MODIFY `asID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `btFormQuestions`
--
ALTER TABLE `btFormQuestions`
  MODIFY `qID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `btImageSliderEntries`
--
ALTER TABLE `btImageSliderEntries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `btShareThisPage`
--
ALTER TABLE `btShareThisPage`
  MODIFY `btShareThisPageID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `btSocialLinks`
--
ALTER TABLE `btSocialLinks`
  MODIFY `btSocialLinkID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `btSurveyOptions`
--
ALTER TABLE `btSurveyOptions`
  MODIFY `optionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `btSurveyResults`
--
ALTER TABLE `btSurveyResults`
  MODIFY `resultID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Collections`
--
ALTER TABLE `Collections`
  MODIFY `cID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;
--
-- AUTO_INCREMENT for table `ConversationDiscussions`
--
ALTER TABLE `ConversationDiscussions`
  MODIFY `cnvDiscussionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ConversationEditors`
--
ALTER TABLE `ConversationEditors`
  MODIFY `cnvEditorID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ConversationFlaggedMessageTypes`
--
ALTER TABLE `ConversationFlaggedMessageTypes`
  MODIFY `cnvMessageFlagTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ConversationMessageAttachments`
--
ALTER TABLE `ConversationMessageAttachments`
  MODIFY `cnvMessageAttachmentID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ConversationMessageRatings`
--
ALTER TABLE `ConversationMessageRatings`
  MODIFY `cnvMessageRatingID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ConversationMessages`
--
ALTER TABLE `ConversationMessages`
  MODIFY `cnvMessageID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ConversationRatingTypes`
--
ALTER TABLE `ConversationRatingTypes`
  MODIFY `cnvRatingTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Conversations`
--
ALTER TABLE `Conversations`
  MODIFY `cnvID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `DownloadStatistics`
--
ALTER TABLE `DownloadStatistics`
  MODIFY `dsID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ExpressEntityEntries`
--
ALTER TABLE `ExpressEntityEntries`
  MODIFY `exEntryID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ExpressEntityEntryAssociations`
--
ALTER TABLE `ExpressEntityEntryAssociations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ExpressFormFieldSets`
--
ALTER TABLE `ExpressFormFieldSets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `FeatureAssignments`
--
ALTER TABLE `FeatureAssignments`
  MODIFY `faID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `FeatureCategories`
--
ALTER TABLE `FeatureCategories`
  MODIFY `fcID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Features`
--
ALTER TABLE `Features`
  MODIFY `feID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `FileImageThumbnailTypes`
--
ALTER TABLE `FileImageThumbnailTypes`
  MODIFY `ftTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Files`
--
ALTER TABLE `Files`
  MODIFY `fID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `FileSetFiles`
--
ALTER TABLE `FileSetFiles`
  MODIFY `fsfID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `FileSets`
--
ALTER TABLE `FileSets`
  MODIFY `fsID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `FileStorageLocations`
--
ALTER TABLE `FileStorageLocations`
  MODIFY `fslID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `FileStorageLocationTypes`
--
ALTER TABLE `FileStorageLocationTypes`
  MODIFY `fslTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `FileVersionLog`
--
ALTER TABLE `FileVersionLog`
  MODIFY `fvlID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `GatheringConfiguredDataSources`
--
ALTER TABLE `GatheringConfiguredDataSources`
  MODIFY `gcsID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `GatheringDataSources`
--
ALTER TABLE `GatheringDataSources`
  MODIFY `gasID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `GatheringItemFeatureAssignments`
--
ALTER TABLE `GatheringItemFeatureAssignments`
  MODIFY `gafaID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `GatheringItems`
--
ALTER TABLE `GatheringItems`
  MODIFY `gaiID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `GatheringItemTemplateFeatures`
--
ALTER TABLE `GatheringItemTemplateFeatures`
  MODIFY `gfeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `GatheringItemTemplates`
--
ALTER TABLE `GatheringItemTemplates`
  MODIFY `gatID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `GatheringItemTemplateTypes`
--
ALTER TABLE `GatheringItemTemplateTypes`
  MODIFY `gatTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Gatherings`
--
ALTER TABLE `Gatherings`
  MODIFY `gaID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Groups`
--
ALTER TABLE `Groups`
  MODIFY `gID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `GroupSets`
--
ALTER TABLE `GroupSets`
  MODIFY `gsID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Jobs`
--
ALTER TABLE `Jobs`
  MODIFY `jID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `JobSets`
--
ALTER TABLE `JobSets`
  MODIFY `jsID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `JobsLog`
--
ALTER TABLE `JobsLog`
  MODIFY `jlID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Logs`
--
ALTER TABLE `Logs`
  MODIFY `logID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `MailImporters`
--
ALTER TABLE `MailImporters`
  MODIFY `miID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `MailValidationHashes`
--
ALTER TABLE `MailValidationHashes`
  MODIFY `mvhID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `MultilingualTranslations`
--
ALTER TABLE `MultilingualTranslations`
  MODIFY `mtID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `NotificationAlerts`
--
ALTER TABLE `NotificationAlerts`
  MODIFY `naID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Notifications`
--
ALTER TABLE `Notifications`
  MODIFY `nID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Packages`
--
ALTER TABLE `Packages`
  MODIFY `pkgID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `PageFeeds`
--
ALTER TABLE `PageFeeds`
  MODIFY `pfID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `PagePaths`
--
ALTER TABLE `PagePaths`
  MODIFY `ppID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;
--
-- AUTO_INCREMENT for table `PageTemplates`
--
ALTER TABLE `PageTemplates`
  MODIFY `pTemplateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `PageThemes`
--
ALTER TABLE `PageThemes`
  MODIFY `pThemeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `PageTypeComposerControlTypes`
--
ALTER TABLE `PageTypeComposerControlTypes`
  MODIFY `ptComposerControlTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `PageTypeComposerFormLayoutSetControls`
--
ALTER TABLE `PageTypeComposerFormLayoutSetControls`
  MODIFY `ptComposerFormLayoutSetControlID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `PageTypeComposerFormLayoutSets`
--
ALTER TABLE `PageTypeComposerFormLayoutSets`
  MODIFY `ptComposerFormLayoutSetID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `PageTypeComposerOutputBlocks`
--
ALTER TABLE `PageTypeComposerOutputBlocks`
  MODIFY `ptComposerOutputBlockID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `PageTypeComposerOutputControls`
--
ALTER TABLE `PageTypeComposerOutputControls`
  MODIFY `ptComposerOutputControlID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `PageTypePublishTargetTypes`
--
ALTER TABLE `PageTypePublishTargetTypes`
  MODIFY `ptPublishTargetTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `PageTypes`
--
ALTER TABLE `PageTypes`
  MODIFY `ptID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `PermissionAccess`
--
ALTER TABLE `PermissionAccess`
  MODIFY `paID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `PermissionAccessEntities`
--
ALTER TABLE `PermissionAccessEntities`
  MODIFY `peID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `PermissionAccessEntityGroups`
--
ALTER TABLE `PermissionAccessEntityGroups`
  MODIFY `pegID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `PermissionAccessEntityTypes`
--
ALTER TABLE `PermissionAccessEntityTypes`
  MODIFY `petID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `PermissionDurationObjects`
--
ALTER TABLE `PermissionDurationObjects`
  MODIFY `pdID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `PermissionKeyCategories`
--
ALTER TABLE `PermissionKeyCategories`
  MODIFY `pkCategoryID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `PermissionKeys`
--
ALTER TABLE `PermissionKeys`
  MODIFY `pkID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT for table `PileContents`
--
ALTER TABLE `PileContents`
  MODIFY `pcID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Piles`
--
ALTER TABLE `Piles`
  MODIFY `pID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `QueueMessages`
--
ALTER TABLE `QueueMessages`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;
--
-- AUTO_INCREMENT for table `Queues`
--
ALTER TABLE `Queues`
  MODIFY `queue_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `SavedFileSearchQueries`
--
ALTER TABLE `SavedFileSearchQueries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SavedPageSearchQueries`
--
ALTER TABLE `SavedPageSearchQueries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SavedUserSearchQueries`
--
ALTER TABLE `SavedUserSearchQueries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SignupRequests`
--
ALTER TABLE `SignupRequests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SiteLocales`
--
ALTER TABLE `SiteLocales`
  MODIFY `siteLocaleID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Sites`
--
ALTER TABLE `Sites`
  MODIFY `siteID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `SiteTrees`
--
ALTER TABLE `SiteTrees`
  MODIFY `siteTreeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `SiteTypes`
--
ALTER TABLE `SiteTypes`
  MODIFY `siteTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `SocialLinks`
--
ALTER TABLE `SocialLinks`
  MODIFY `slID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `Stacks`
--
ALTER TABLE `Stacks`
  MODIFY `stID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `StyleCustomizerCustomCssRecords`
--
ALTER TABLE `StyleCustomizerCustomCssRecords`
  MODIFY `sccRecordID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `StyleCustomizerInlineStylePresets`
--
ALTER TABLE `StyleCustomizerInlineStylePresets`
  MODIFY `pssPresetID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `StyleCustomizerInlineStyleSets`
--
ALTER TABLE `StyleCustomizerInlineStyleSets`
  MODIFY `issID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `StyleCustomizerValueLists`
--
ALTER TABLE `StyleCustomizerValueLists`
  MODIFY `scvlID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `StyleCustomizerValues`
--
ALTER TABLE `StyleCustomizerValues`
  MODIFY `scvID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SystemDatabaseQueryLog`
--
ALTER TABLE `SystemDatabaseQueryLog`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `TreeFileNodes`
--
ALTER TABLE `TreeFileNodes`
  MODIFY `treeNodeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `TreeGroupNodes`
--
ALTER TABLE `TreeGroupNodes`
  MODIFY `treeNodeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `TreeNodes`
--
ALTER TABLE `TreeNodes`
  MODIFY `treeNodeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `TreeNodeTypes`
--
ALTER TABLE `TreeNodeTypes`
  MODIFY `treeNodeTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `Trees`
--
ALTER TABLE `Trees`
  MODIFY `treeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `TreeSearchQueryNodes`
--
ALTER TABLE `TreeSearchQueryNodes`
  MODIFY `treeNodeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `TreeTypes`
--
ALTER TABLE `TreeTypes`
  MODIFY `treeTypeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `UserBannedIPs`
--
ALTER TABLE `UserBannedIPs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `UserPointActions`
--
ALTER TABLE `UserPointActions`
  MODIFY `upaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `UserPointHistory`
--
ALTER TABLE `UserPointHistory`
  MODIFY `upID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `UserPrivateMessages`
--
ALTER TABLE `UserPrivateMessages`
  MODIFY `msgID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `uID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `UserSignups`
--
ALTER TABLE `UserSignups`
  MODIFY `usID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `UserValidationHashes`
--
ALTER TABLE `UserValidationHashes`
  MODIFY `uvhID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `WorkflowProgress`
--
ALTER TABLE `WorkflowProgress`
  MODIFY `wpID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `WorkflowProgressCategories`
--
ALTER TABLE `WorkflowProgressCategories`
  MODIFY `wpCategoryID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `WorkflowProgressHistory`
--
ALTER TABLE `WorkflowProgressHistory`
  MODIFY `wphID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `WorkflowRequestObjects`
--
ALTER TABLE `WorkflowRequestObjects`
  MODIFY `wrID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `Workflows`
--
ALTER TABLE `Workflows`
  MODIFY `wfID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `WorkflowTypes`
--
ALTER TABLE `WorkflowTypes`
  MODIFY `wftID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `atAddress`
--
ALTER TABLE `atAddress`
  ADD CONSTRAINT `FK_DA949740A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`);

--
-- Constraints for table `atAddressSettings`
--
ALTER TABLE `atAddressSettings`
  ADD CONSTRAINT `FK_5A737B61B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `atBoolean`
--
ALTER TABLE `atBoolean`
  ADD CONSTRAINT `FK_5D5F70A9A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`);

--
-- Constraints for table `atBooleanSettings`
--
ALTER TABLE `atBooleanSettings`
  ADD CONSTRAINT `FK_78025F47B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `atDateTime`
--
ALTER TABLE `atDateTime`
  ADD CONSTRAINT `FK_DF75412AA2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`);

--
-- Constraints for table `atDateTimeSettings`
--
ALTER TABLE `atDateTimeSettings`
  ADD CONSTRAINT `FK_C6B3B63AB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `atDefault`
--
ALTER TABLE `atDefault`
  ADD CONSTRAINT `FK_3484F81EA2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`);

--
-- Constraints for table `atEmptySettings`
--
ALTER TABLE `atEmptySettings`
  ADD CONSTRAINT `FK_ED1BF189B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `atExpress`
--
ALTER TABLE `atExpress`
  ADD CONSTRAINT `FK_CFAF40F1A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`);

--
-- Constraints for table `atExpressSelectedEntries`
--
ALTER TABLE `atExpressSelectedEntries`
  ADD CONSTRAINT `FK_C9D404BB6DCB6296` FOREIGN KEY (`exEntryID`) REFERENCES `ExpressEntityEntries` (`exEntryID`),
  ADD CONSTRAINT `FK_C9D404BBA2A82A5D` FOREIGN KEY (`avID`) REFERENCES `atExpress` (`avID`);

--
-- Constraints for table `atExpressSettings`
--
ALTER TABLE `atExpressSettings`
  ADD CONSTRAINT `FK_E8F67F0FB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`),
  ADD CONSTRAINT `FK_E8F67F0FCE2D7284` FOREIGN KEY (`exEntityID`) REFERENCES `ExpressEntities` (`id`);

--
-- Constraints for table `atFile`
--
ALTER TABLE `atFile`
  ADD CONSTRAINT `FK_73D17D61A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`),
  ADD CONSTRAINT `FK_73D17D61E3111F45` FOREIGN KEY (`fID`) REFERENCES `Files` (`fID`);

--
-- Constraints for table `atFileSettings`
--
ALTER TABLE `atFileSettings`
  ADD CONSTRAINT `FK_EADD86C8B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `atNumber`
--
ALTER TABLE `atNumber`
  ADD CONSTRAINT `FK_41BA30B5A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`);

--
-- Constraints for table `atSelect`
--
ALTER TABLE `atSelect`
  ADD CONSTRAINT `FK_9CD8C521A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`);

--
-- Constraints for table `atSelectedSocialLinks`
--
ALTER TABLE `atSelectedSocialLinks`
  ADD CONSTRAINT `FK_10743709A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `atSocialLinks` (`avID`);

--
-- Constraints for table `atSelectedTopics`
--
ALTER TABLE `atSelectedTopics`
  ADD CONSTRAINT `FK_E42A7D5BA2A82A5D` FOREIGN KEY (`avID`) REFERENCES `atTopic` (`avID`);

--
-- Constraints for table `atSelectOptions`
--
ALTER TABLE `atSelectOptions`
  ADD CONSTRAINT `FK_797414B0CB59257C` FOREIGN KEY (`avSelectOptionListID`) REFERENCES `atSelectOptionLists` (`avSelectOptionListID`);

--
-- Constraints for table `atSelectOptionsSelected`
--
ALTER TABLE `atSelectOptionsSelected`
  ADD CONSTRAINT `FK_40C97EC3A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `atSelect` (`avID`),
  ADD CONSTRAINT `FK_40C97EC3E584C274` FOREIGN KEY (`avSelectOptionID`) REFERENCES `atSelectOptions` (`avSelectOptionID`);

--
-- Constraints for table `atSelectSettings`
--
ALTER TABLE `atSelectSettings`
  ADD CONSTRAINT `FK_5D514424B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`),
  ADD CONSTRAINT `FK_5D514424CB59257C` FOREIGN KEY (`avSelectOptionListID`) REFERENCES `atSelectOptionLists` (`avSelectOptionListID`);

--
-- Constraints for table `atSocialLinks`
--
ALTER TABLE `atSocialLinks`
  ADD CONSTRAINT `FK_1431EC8AA2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`);

--
-- Constraints for table `atTextareaSettings`
--
ALTER TABLE `atTextareaSettings`
  ADD CONSTRAINT `FK_A6EA10D6B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `atTextSettings`
--
ALTER TABLE `atTextSettings`
  ADD CONSTRAINT `FK_951A10CCB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `atTopic`
--
ALTER TABLE `atTopic`
  ADD CONSTRAINT `FK_BABDD1FAA2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`);

--
-- Constraints for table `atTopicSettings`
--
ALTER TABLE `atTopicSettings`
  ADD CONSTRAINT `FK_830FD2FEB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `AttributeKeyCategories`
--
ALTER TABLE `AttributeKeyCategories`
  ADD CONSTRAINT `FK_A2A0CC67CE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `AttributeKeys`
--
ALTER TABLE `AttributeKeys`
  ADD CONSTRAINT `FK_DCA32C62A12CFE33` FOREIGN KEY (`atID`) REFERENCES `AttributeTypes` (`atID`),
  ADD CONSTRAINT `FK_DCA32C62B059B76B` FOREIGN KEY (`akCategoryID`) REFERENCES `AttributeKeyCategories` (`akCategoryID`),
  ADD CONSTRAINT `FK_DCA32C62CE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `AttributeSetKeys`
--
ALTER TABLE `AttributeSetKeys`
  ADD CONSTRAINT `FK_222F72D8A463E8B6` FOREIGN KEY (`asID`) REFERENCES `AttributeSets` (`asID`),
  ADD CONSTRAINT `FK_222F72D8B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `AttributeSets`
--
ALTER TABLE `AttributeSets`
  ADD CONSTRAINT `FK_FCA02D5FB059B76B` FOREIGN KEY (`akCategoryID`) REFERENCES `AttributeKeyCategories` (`akCategoryID`),
  ADD CONSTRAINT `FK_FCA02D5FCE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `AttributeTypeCategories`
--
ALTER TABLE `AttributeTypeCategories`
  ADD CONSTRAINT `FK_49A9CABEA12CFE33` FOREIGN KEY (`atID`) REFERENCES `AttributeTypes` (`atID`),
  ADD CONSTRAINT `FK_49A9CABEB059B76B` FOREIGN KEY (`akCategoryID`) REFERENCES `AttributeKeyCategories` (`akCategoryID`);

--
-- Constraints for table `AttributeTypes`
--
ALTER TABLE `AttributeTypes`
  ADD CONSTRAINT `FK_53580A7FCE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `AttributeValues`
--
ALTER TABLE `AttributeValues`
  ADD CONSTRAINT `FK_DCCE7864B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `CollectionAttributeKeys`
--
ALTER TABLE `CollectionAttributeKeys`
  ADD CONSTRAINT `FK_1E3E5B79B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`) ON DELETE CASCADE;

--
-- Constraints for table `CollectionAttributeValues`
--
ALTER TABLE `CollectionAttributeValues`
  ADD CONSTRAINT `FK_BB9995FCA2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`),
  ADD CONSTRAINT `FK_BB9995FCB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `ConversationMessageNotifications`
--
ALTER TABLE `ConversationMessageNotifications`
  ADD CONSTRAINT `FK_559DE1CBED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;

--
-- Constraints for table `ExpressAttributeKeys`
--
ALTER TABLE `ExpressAttributeKeys`
  ADD CONSTRAINT `FK_8C881F181257D5D` FOREIGN KEY (`entity_id`) REFERENCES `ExpressEntities` (`id`),
  ADD CONSTRAINT `FK_8C881F1B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`) ON DELETE CASCADE;

--
-- Constraints for table `ExpressEntities`
--
ALTER TABLE `ExpressEntities`
  ADD CONSTRAINT `FK_BC772AA6547D6B2D` FOREIGN KEY (`default_view_form_id`) REFERENCES `ExpressForms` (`id`),
  ADD CONSTRAINT `FK_BC772AA6C7DEC56D` FOREIGN KEY (`default_edit_form_id`) REFERENCES `ExpressForms` (`id`),
  ADD CONSTRAINT `FK_BC772AA6CE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `ExpressEntityAssociations`
--
ALTER TABLE `ExpressEntityAssociations`
  ADD CONSTRAINT `FK_98A0F796B5910F71` FOREIGN KEY (`target_entity_id`) REFERENCES `ExpressEntities` (`id`),
  ADD CONSTRAINT `FK_98A0F796E9BBEE93` FOREIGN KEY (`source_entity_id`) REFERENCES `ExpressEntities` (`id`);

--
-- Constraints for table `ExpressEntityAssociationSelectedEntries`
--
ALTER TABLE `ExpressEntityAssociationSelectedEntries`
  ADD CONSTRAINT `FK_1F9C570CBF396750` FOREIGN KEY (`id`) REFERENCES `ExpressEntityEntryAssociations` (`id`),
  ADD CONSTRAINT `FK_1F9C570CC7B1F65C` FOREIGN KEY (`exSelectedEntryID`) REFERENCES `ExpressEntityEntries` (`exEntryID`);

--
-- Constraints for table `ExpressEntityEntries`
--
ALTER TABLE `ExpressEntityEntries`
  ADD CONSTRAINT `FK_B8AE3531AFC87D03` FOREIGN KEY (`exEntryEntityID`) REFERENCES `ExpressEntities` (`id`);

--
-- Constraints for table `ExpressEntityEntryAssociations`
--
ALTER TABLE `ExpressEntityEntryAssociations`
  ADD CONSTRAINT `FK_25B3A0826DCB6296` FOREIGN KEY (`exEntryID`) REFERENCES `ExpressEntityEntries` (`exEntryID`),
  ADD CONSTRAINT `FK_25B3A082EFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `ExpressEntityAssociations` (`id`);

--
-- Constraints for table `ExpressEntityEntryAttributeValues`
--
ALTER TABLE `ExpressEntityEntryAttributeValues`
  ADD CONSTRAINT `FK_6DB641546DCB6296` FOREIGN KEY (`exEntryID`) REFERENCES `ExpressEntityEntries` (`exEntryID`),
  ADD CONSTRAINT `FK_6DB64154A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`),
  ADD CONSTRAINT `FK_6DB64154B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `ExpressFormFieldSetAssociationControls`
--
ALTER TABLE `ExpressFormFieldSetAssociationControls`
  ADD CONSTRAINT `FK_E6DF21BBBF396750` FOREIGN KEY (`id`) REFERENCES `ExpressFormFieldSetControls` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E6DF21BBEFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `ExpressEntityAssociations` (`id`);

--
-- Constraints for table `ExpressFormFieldSetAttributeKeyControls`
--
ALTER TABLE `ExpressFormFieldSetAttributeKeyControls`
  ADD CONSTRAINT `FK_8481F9D1B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`),
  ADD CONSTRAINT `FK_8481F9D1BF396750` FOREIGN KEY (`id`) REFERENCES `ExpressFormFieldSetControls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ExpressFormFieldSetControls`
--
ALTER TABLE `ExpressFormFieldSetControls`
  ADD CONSTRAINT `FK_E42868A43ABF811A` FOREIGN KEY (`field_set_id`) REFERENCES `ExpressFormFieldSets` (`id`);

--
-- Constraints for table `ExpressFormFieldSets`
--
ALTER TABLE `ExpressFormFieldSets`
  ADD CONSTRAINT `FK_A33BBBEC5FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `ExpressForms` (`id`);

--
-- Constraints for table `ExpressFormFieldSetTextControls`
--
ALTER TABLE `ExpressFormFieldSetTextControls`
  ADD CONSTRAINT `FK_DB5A209ABF396750` FOREIGN KEY (`id`) REFERENCES `ExpressFormFieldSetControls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ExpressForms`
--
ALTER TABLE `ExpressForms`
  ADD CONSTRAINT `FK_8D09031A81257D5D` FOREIGN KEY (`entity_id`) REFERENCES `ExpressEntities` (`id`);

--
-- Constraints for table `FileAttributeKeys`
--
ALTER TABLE `FileAttributeKeys`
  ADD CONSTRAINT `FK_BC5C7BBB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`) ON DELETE CASCADE;

--
-- Constraints for table `FileAttributeValues`
--
ALTER TABLE `FileAttributeValues`
  ADD CONSTRAINT `FK_BBECEAA4A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`),
  ADD CONSTRAINT `FK_BBECEAA4B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `Files`
--
ALTER TABLE `Files`
  ADD CONSTRAINT `FK_C7F46F5DB81D3903` FOREIGN KEY (`fslID`) REFERENCES `FileStorageLocations` (`fslID`),
  ADD CONSTRAINT `FK_C7F46F5DFD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`);

--
-- Constraints for table `FileVersions`
--
ALTER TABLE `FileVersions`
  ADD CONSTRAINT `FK_D7B5A13AE3111F45` FOREIGN KEY (`fID`) REFERENCES `Files` (`fID`);

--
-- Constraints for table `LegacyAttributeKeys`
--
ALTER TABLE `LegacyAttributeKeys`
  ADD CONSTRAINT `FK_740BA2BBB6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`) ON DELETE CASCADE;

--
-- Constraints for table `NotificationAlerts`
--
ALTER TABLE `NotificationAlerts`
  ADD CONSTRAINT `FK_E11C7408ED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`),
  ADD CONSTRAINT `FK_E11C7408FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`);

--
-- Constraints for table `PrivateMessageNotifications`
--
ALTER TABLE `PrivateMessageNotifications`
  ADD CONSTRAINT `FK_1AB97592ED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;

--
-- Constraints for table `QueueMessages`
--
ALTER TABLE `QueueMessages`
  ADD CONSTRAINT `FK_7C04D76477B5BAE` FOREIGN KEY (`queue_id`) REFERENCES `Queues` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `SiteAttributeKeys`
--
ALTER TABLE `SiteAttributeKeys`
  ADD CONSTRAINT `FK_63D1E182B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`) ON DELETE CASCADE;

--
-- Constraints for table `SiteAttributeValues`
--
ALTER TABLE `SiteAttributeValues`
  ADD CONSTRAINT `FK_67658AF7521D8435` FOREIGN KEY (`siteID`) REFERENCES `Sites` (`siteID`),
  ADD CONSTRAINT `FK_67658AF7A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`),
  ADD CONSTRAINT `FK_67658AF7B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`);

--
-- Constraints for table `SiteLocales`
--
ALTER TABLE `SiteLocales`
  ADD CONSTRAINT `FK_2527AB2C521D8435` FOREIGN KEY (`siteID`) REFERENCES `Sites` (`siteID`),
  ADD CONSTRAINT `FK_2527AB2CF9431B4B` FOREIGN KEY (`siteTreeID`) REFERENCES `SiteTreeTrees` (`siteTreeID`);

--
-- Constraints for table `Sites`
--
ALTER TABLE `Sites`
  ADD CONSTRAINT `FK_7DC18567E9548DF7` FOREIGN KEY (`siteTypeID`) REFERENCES `SiteTypes` (`siteTypeID`);

--
-- Constraints for table `SiteTreeTrees`
--
ALTER TABLE `SiteTreeTrees`
  ADD CONSTRAINT `FK_A4B9696EACD624CD` FOREIGN KEY (`siteLocaleID`) REFERENCES `SiteLocales` (`siteLocaleID`),
  ADD CONSTRAINT `FK_A4B9696EF9431B4B` FOREIGN KEY (`siteTreeID`) REFERENCES `SiteTrees` (`siteTreeID`) ON DELETE CASCADE;

--
-- Constraints for table `SiteTypes`
--
ALTER TABLE `SiteTypes`
  ADD CONSTRAINT `FK_7CBFE975CE45CBB0` FOREIGN KEY (`pkgID`) REFERENCES `Packages` (`pkgID`);

--
-- Constraints for table `SocialLinks`
--
ALTER TABLE `SocialLinks`
  ADD CONSTRAINT `FK_84EBA2B4521D8435` FOREIGN KEY (`siteID`) REFERENCES `Sites` (`siteID`);

--
-- Constraints for table `UserAttributeKeys`
--
ALTER TABLE `UserAttributeKeys`
  ADD CONSTRAINT `FK_28970033B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`) ON DELETE CASCADE;

--
-- Constraints for table `UserAttributeValues`
--
ALTER TABLE `UserAttributeValues`
  ADD CONSTRAINT `FK_4DB68CA6A2A82A5D` FOREIGN KEY (`avID`) REFERENCES `AttributeValues` (`avID`),
  ADD CONSTRAINT `FK_4DB68CA6B6561A7E` FOREIGN KEY (`akID`) REFERENCES `AttributeKeys` (`akID`),
  ADD CONSTRAINT `FK_4DB68CA6FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`);

--
-- Constraints for table `UserSignupNotifications`
--
ALTER TABLE `UserSignupNotifications`
  ADD CONSTRAINT `FK_7FB1DF5B7B18287E` FOREIGN KEY (`usID`) REFERENCES `UserSignups` (`usID`),
  ADD CONSTRAINT `FK_7FB1DF5BED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;

--
-- Constraints for table `UserSignups`
--
ALTER TABLE `UserSignups`
  ADD CONSTRAINT `FK_FEB5D909D3564642` FOREIGN KEY (`createdBy`) REFERENCES `Users` (`uID`),
  ADD CONSTRAINT `FK_FEB5D909FD71026C` FOREIGN KEY (`uID`) REFERENCES `Users` (`uID`);

--
-- Constraints for table `WorkflowProgressNotifications`
--
ALTER TABLE `WorkflowProgressNotifications`
  ADD CONSTRAINT `FK_EC39CA81ED024EFD` FOREIGN KEY (`nID`) REFERENCES `Notifications` (`nID`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
