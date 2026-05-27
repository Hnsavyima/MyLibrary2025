CREATE TABLE `representations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `hour` time NOT NULL,
  `show_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY(id),
  CONSTRAINT `fk_repr_show` FOREIGN KEY (`show_id`) REFERENCES `shows`(`id`),
  CONSTRAINT `fk_repr_location` FOREIGN KEY (`location_id`) REFERENCES `locations`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
