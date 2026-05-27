CREATE TABLE `artist_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT `fk_artist_type_artist` FOREIGN KEY (`artist_id`) REFERENCES `artists`(`id`),
  CONSTRAINT `fk_artist_type_type` FOREIGN KEY (`type_id`) REFERENCES `types`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
