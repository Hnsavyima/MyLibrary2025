CREATE TABLE `show_tag` (
  `show_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`show_id`, `tag_id`),
  KEY `fk_show_tag_tag` (`tag_id`),
  CONSTRAINT `fk_show_tag_show` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `fk_show_tag_tag` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
