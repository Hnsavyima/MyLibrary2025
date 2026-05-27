package be.iccbxl.pid.model;

import org.springframework.data.repository.CrudRepository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

public interface RepresentationRepository extends CrudRepository<Representation, Long> {

    List<Representation> findByShowId(Long showId);

    List<Representation> findByRoomId(Long roomId);

    boolean existsByRoomIdAndDateAndHour(Long roomId, LocalDate date, LocalTime hour);

}
