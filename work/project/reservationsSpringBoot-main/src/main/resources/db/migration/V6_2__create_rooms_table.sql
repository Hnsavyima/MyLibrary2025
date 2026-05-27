CREATE TABLE `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seats` smallint(6) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE KEY `uk_rooms_name` (`name`),
  CONSTRAINT `fk_rooms_location` FOREIGN KEY (`location_id`) REFERENCES `locations`(`id`),
  CONSTRAINT `chk_rooms_seats` CHECK (`seats` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
