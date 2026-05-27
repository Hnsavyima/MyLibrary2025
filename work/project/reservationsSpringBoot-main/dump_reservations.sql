-- ============================================================
-- DUMP SQL - Base de données: reservations
-- Projet: ReservationsSpringBoot
-- ============================================================

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `reservations` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `reservations`;

-- ============================================================
-- Table: artists
-- ============================================================
CREATE TABLE `artists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `artists` (`id`, `firstname`, `lastname`) VALUES
(1, 'Daniel', 'Marcelin'),
(2, 'Philippe', 'Laurent'),
(3, 'Marius', 'Von Mayenburg'),
(4, 'Olivier', 'Boudon'),
(5, 'Anne Marie', 'Loop'),
(6, 'Pietro', 'Varasso'),
(7, 'Laurent', 'Caron'),
(8, 'Élena', 'Perez'),
(9, 'Guillaume', 'Alexandre'),
(10, 'Claude', 'Semal'),
(11, 'Laurence', 'Warin'),
(12, 'Pierre', 'Wayburn'),
(13, 'Gwendoline', 'Gauthier');

-- ============================================================
-- Table: types
-- ============================================================
CREATE TABLE `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `types` (`id`, `type`) VALUES
(1, 'scénographe'),
(2, 'comédien'),
(3, 'auteur');

-- ============================================================
-- Table: artist_type
-- ============================================================
CREATE TABLE `artist_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_artist_type_artist` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  CONSTRAINT `fk_artist_type_type` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `artist_type` (`id`, `artist_id`, `type_id`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 2, 2),
(4, 2, 3);

-- ============================================================
-- Table: locations
-- ============================================================
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `locations` (`id`, `name`, `address`) VALUES
(1, 'Théâtre National', 'Boulevard Émile Jacqmain 111-115, 1000 Bruxelles'),
(2, 'Palais des Beaux-Arts', 'Rue Ravenstein 23, 1000 Bruxelles'),
(3, 'Théâtre de la Monnaie', 'Place de la Monnaie 1, 1000 Bruxelles');

-- ============================================================
-- Table: shows
-- ============================================================
CREATE TABLE `shows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `shows` (`id`, `title`, `description`) VALUES
(1, 'Hamlet', 'La célèbre pièce de Shakespeare revisitée par une mise en scène contemporaine.'),
(2, 'Le Misanthrope', 'Comédie de Molière sur l\'hypocrisie sociale et la sincérité.'),
(3, 'Les Trois Sœurs', 'Pièce de Tchekhov sur les rêves et les désillusions.');

-- ============================================================
-- Table: show_artist
-- ============================================================
CREATE TABLE `show_artist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `show_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_show_artist_show` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`),
  CONSTRAINT `fk_show_artist_artist` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `show_artist` (`id`, `show_id`, `artist_id`) VALUES
(1, 1, 4),
(2, 1, 7),
(3, 2, 2),
(4, 2, 5),
(5, 3, 8),
(6, 3, 11);

-- ============================================================
-- Table: rooms
-- (Salle d'un lieu de spectacle - ajoutée suite au cahier de charges)
-- ============================================================
CREATE TABLE `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seats` smallint(6) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_rooms_name` (`name`),
  CONSTRAINT `fk_rooms_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `chk_rooms_seats` CHECK (`seats` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `rooms` (`id`, `name`, `seats`, `location_id`) VALUES
(1, 'Grande Salle', 600, 1),
(2, 'Salle Studio', 120, 1),
(3, 'Salle Henry Le Bœuf', 2200, 2),
(4, 'Salle M', 700, 2),
(5, 'Salle Principale', 1200, 3),
(6, 'Salle de Chambre', 300, 3);

-- ============================================================
-- Table: representations
-- (La relation avec locations (location_id) a été supprimée,
--  remplacée par la relation avec rooms (room_id))
-- ============================================================
CREATE TABLE `representations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `hour` time NOT NULL,
  `show_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_repr_show` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`),
  CONSTRAINT `fk_repr_room` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `representations` (`id`, `date`, `hour`, `show_id`, `room_id`) VALUES
(1, '2022-03-10', '20:00:00', 1, 1),
(2, '2022-03-11', '15:00:00', 1, 3),
(3, '2022-04-05', '20:30:00', 2, 2),
(4, '2022-05-20', '19:00:00', 3, 5);

-- ============================================================
-- Table: users
-- ============================================================
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_users_login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Mot de passe: admin/admin, user/user (BCrypt)
INSERT INTO `users` (`id`, `login`, `password`, `role`) VALUES
(1, 'admin', '$2b$12$kY9zLykrZIDHaGxm/1o5Zej5I5i/RaD6GykU5s.PL5.q3UuFYzaXS', 'ADMIN'),
(2, 'user', '$2b$12$xo10g4CmZaltilfdO26ClOnxWU3j5eiyUTCYQ2zdxjWKGSxXw0yHu', 'USER');

-- ============================================================
-- Table Flyway (schema_version)
-- ============================================================
CREATE TABLE IF NOT EXISTS `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
