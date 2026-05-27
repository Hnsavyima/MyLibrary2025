package be.iccbxl.pid.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Service
public class RepresentationService {

    @Autowired
    private RepresentationRepository representationRepository;

    public List<Representation> getAllRepresentations() {
        return (List<Representation>) representationRepository.findAll();
    }

    public List<Representation> getRepresentationsByShow(Long showId) {
        return representationRepository.findByShowId(showId);
    }

    public List<Representation> getRepresentationsByRoom(Long roomId) {
        return representationRepository.findByRoomId(roomId);
    }

    public boolean isRoomOccupied(Long roomId, LocalDate date, LocalTime hour) {
        return representationRepository.existsByRoomIdAndDateAndHour(roomId, date, hour);
    }

    public void addRepresentation(Representation representation) {
        representationRepository.save(representation);
    }

}
