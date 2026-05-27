ALTER TABLE `representations` ADD COLUMN `room_id` int(11) NOT NULL;
ALTER TABLE `representations` ADD CONSTRAINT `fk_repr_room` FOREIGN KEY (`room_id`) REFERENCES `rooms`(`id`);

UPDATE `representations` SET `room_id` = 1 WHERE `id` = 1;
UPDATE `representations` SET `room_id` = 3 WHERE `id` = 2;
UPDATE `representations` SET `room_id` = 2 WHERE `id` = 3;
UPDATE `representations` SET `room_id` = 5 WHERE `id` = 4;
