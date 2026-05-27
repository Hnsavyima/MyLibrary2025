package be.iccbxl.pid.model;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface RoomRepository extends CrudRepository<Room, Long> {

    List<Room> findByLocationId(Long locationId);

}
