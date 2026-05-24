-- --------------------------------------------------------
-- Dump SQL de la base de données : reservations
-- Date : 2026-05-24
-- --------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- --------------------------------------------------------
-- Structure de la table `shows`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `shows`;
CREATE TABLE `shows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Données de la table `shows`
-- --------------------------------------------------------

INSERT INTO `shows` (`id`, `title`, `description`, `location`) VALUES
(1, 'Hamlet', 'La pièce classique de Shakespeare revisitée.', 'Théâtre Royal, Bruxelles'),
(2, 'Le Misanthrope', 'Comédie de Molière sur la condition humaine.', 'Théâtre du Parc, Bruxelles'),
(3, 'Roméo et Juliette', 'Tragédie romantique intemporelle.', 'Palais des Beaux-Arts, Bruxelles'),
(4, 'Attente', 'Spectacle de danse contemporaine.', 'Halles de Schaerbeek, Bruxelles'),
(5, 'La Nuit des Rois', 'Comédie musicale inspirée de Shakespeare.', 'Théâtre 140, Bruxelles'),
(6, 'Macbeth', 'Drame historique de Shakespeare.', 'Théâtre National, Bruxelles'),
(7, 'Tartuffe', 'Comédie satirique de Molière.', 'Théâtre de Poche, Bruxelles'),
(8, 'Phèdre', 'Tragédie classique de Racine.', 'Théâtre Royal, Bruxelles');

-- --------------------------------------------------------
-- Structure de la table `tags`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Données de la table `tags`
-- --------------------------------------------------------

INSERT INTO `tags` (`id`, `tag`) VALUES
(1, 'théâtre'),
(2, 'classique'),
(3, 'shakespeare'),
(4, 'molière'),
(5, 'danse'),
(6, 'contemporain'),
(7, 'comédie'),
(8, 'tragédie'),
(9, 'musical');

-- --------------------------------------------------------
-- Structure de la table `show_tag`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `show_tag`;
CREATE TABLE `show_tag` (
  `show_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`show_id`, `tag_id`),
  KEY `fk_show_tag_tag` (`tag_id`),
  CONSTRAINT `fk_show_tag_show` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `fk_show_tag_tag` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Données de la table `show_tag`
-- --------------------------------------------------------

INSERT INTO `show_tag` (`show_id`, `tag_id`) VALUES
(1, 1), (1, 2), (1, 3), (1, 8),
(2, 1), (2, 4), (2, 7),
(3, 1), (3, 3), (3, 8),
(4, 5), (4, 6),
(5, 1), (5, 7), (5, 9),
(6, 1), (6, 2), (6, 3), (6, 8),
(7, 1), (7, 4), (7, 7),
(8, 1), (8, 2), (8, 8);

-- --------------------------------------------------------
-- Structure de la table `artists`
-- --------------------------------------------------------

DROP TABLE IF EXISTS `artists`;
CREATE TABLE `artists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------
-- Données de la table `artists`
-- --------------------------------------------------------

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
-- Mot de passe : 12345678 (hashé BCrypt $2Y)
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
