-- --------------------------------------------------------
-- Dump SQL de la base de données : reservations
-- Date : 2026-05-24
-- --------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- --------------------------------------------------------
-- Structure de la table `troupes`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `troupes`;
CREATE TABLE `troupes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Données de la table `troupes`
-- --------------------------------------------------------

INSERT INTO `troupes` (`id`, `name`, `logo_url`) VALUES
(1, 'Les Comédiens Réunis', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/200px-Placeholder_view_vector.svg.png'),
(2, 'Théâtre du Soleil', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/200px-Placeholder_view_vector.svg.png'),
(3, 'Compagnie des Arts', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/200px-Placeholder_view_vector.svg.png'),
(4, 'La Troupe Magique', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/200px-Placeholder_view_vector.svg.png'),
(5, 'Ensemble Classique', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/200px-Placeholder_view_vector.svg.png');

-- --------------------------------------------------------
-- Structure de la table `artists`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `artists`;
CREATE TABLE `artists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `troupe_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_artists_troupe` (`troupe_id`),
  CONSTRAINT `fk_artists_troupe` FOREIGN KEY (`troupe_id`) REFERENCES `troupes` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Données de la table `artists`
-- --------------------------------------------------------

INSERT INTO `artists` (`id`, `firstname`, `lastname`, `troupe_id`) VALUES
(1, 'Daniel', 'Marcelin', 1),
(2, 'Philippe', 'Laurent', 1),
(3, 'Marius', 'Von Mayenburg', 1),
(4, 'Olivier', 'Boudon', 2),
(5, 'Anne Marie', 'Loop', 2),
(6, 'Pietro', 'Varasso', 3),
(7, 'Laurent', 'Caron', 3),
(8, 'Élena', 'Perez', 4),
(9, 'Guillaume', 'Alexandre', 4),
(10, 'Claude', 'Semal', 4),
(11, 'Laurence', 'Warin', 5),
(12, 'Pierre', 'Wayburn', 5),
(13, 'Gwendoline', 'Gauthier', 5);

-- --------------------------------------------------------
-- Structure de la table `users`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `langue` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('ADMIN','MEMBER','AFFILIATE','PRESS','PRODUCER','') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Données de la table `users`
-- --------------------------------------------------------

INSERT INTO `users` (`id`, `login`, `password`, `firstname`, `lastname`, `email`, `langue`, `role`, `created_at`) VALUES
(1, 'bob', '$2a$12$EyDxX5wWsrJGIyo2MFIRR.LqLmmqssUdPgwasMrG7TvZmjW9ECeLW', 'Bob', 'Sull', 'bob@sull.com', 'fr', 'ADMIN', NOW()),
(2, 'anna', '$2a$12$EyDxX5wWsrJGIyo2MFIRR.LqLmmqssUdPgwasMrG7TvZmjW9ECeLW', 'Anna', 'Lyse', 'anna.lyse@sull.com', 'en', 'MEMBER', NOW());

-- --------------------------------------------------------
-- Structure de la table `personal_access_tokens`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `token` uuid NOT NULL,
  `user_id` int(11) NOT NULL,
  `expires_at` datetime NOT NULL,
  UNIQUE KEY `token` (`token`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Structure de la table `flyway_schema_history`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `flyway_schema_history`;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
