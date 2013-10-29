-- --------------------------------------------------------
-- Host:                         Coruscant
-- Server version:               5.5.31 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table test.files
CREATE TABLE IF NOT EXISTS `files` (
  `fileId` int(11) unsigned NOT NULL,
  `filePath` text COLLATE latin1_general_ci NOT NULL,
  `uploadDate` date NOT NULL,
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='a list of files';

-- Data exporting was unselected.


-- Dumping structure for table test.sharedfiles
CREATE TABLE IF NOT EXISTS `sharedfiles` (
  `fileId` int(10) unsigned NOT NULL,
  `userId` int(10) unsigned NOT NULL COMMENT 'Id of the user that the file is shared with',
  `permissions` int(10) unsigned NOT NULL COMMENT 'bitfield:  1=read, 2=write, 4=delete, 8=share',
  KEY `FK_file` (`fileId`),
  KEY `FK_user` (`userId`),
  CONSTRAINT `FK_file` FOREIGN KEY (`fileId`) REFERENCES `files` (`fileId`),
  CONSTRAINT `FK_user` FOREIGN KEY (`userId`) REFERENCES `users` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='maps which files are shared with which users and what permissions.';

-- Data exporting was unselected.


-- Dumping structure for table test.userfiles
CREATE TABLE IF NOT EXISTS `userfiles` (
  `userId` int(10) unsigned NOT NULL COMMENT 'user who owns the file',
  `fileId` int(11) unsigned NOT NULL,
  KEY `FK_users` (`userId`),
  KEY `FK_files` (`fileId`),
  CONSTRAINT `FK_files` FOREIGN KEY (`fileId`) REFERENCES `files` (`fileId`),
  CONSTRAINT `FK_users` FOREIGN KEY (`userId`) REFERENCES `users` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Maps which files belong to which users.';

-- Data exporting was unselected.


-- Dumping structure for table test.users
CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `lastLogin` datetime NOT NULL,
  `createdOn` datetime NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='This holds the user related data.';

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

