CREATE TABLE `show_artist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `show_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT `fk_show_artist_show` FOREIGN KEY (`show_id`) REFERENCES `shows`(`id`),
  CONSTRAINT `fk_show_artist_artist` FOREIGN KEY (`artist_id`) REFERENCES `artists`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
