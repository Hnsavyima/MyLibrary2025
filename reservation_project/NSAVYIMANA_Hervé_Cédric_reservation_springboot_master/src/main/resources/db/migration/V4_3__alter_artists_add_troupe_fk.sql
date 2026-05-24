ALTER TABLE `artists`
  ADD COLUMN `troupe_id` int(11) DEFAULT NULL;

ALTER TABLE `artists`
  ADD CONSTRAINT `fk_artists_troupe`
  FOREIGN KEY (`troupe_id`) REFERENCES `troupes` (`id`)
  ON UPDATE CASCADE
  ON DELETE RESTRICT;
