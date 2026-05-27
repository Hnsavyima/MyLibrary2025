package be.iccbxl.pid.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LocationService {

    @Autowired
    private LocationRepository locationRepository;

    public List<Location> getAllLocations() {
        return (List<Location>) locationRepository.findAll();
    }

    public Location getLocation(Long id) {
        return locationRepository.findById(id).orElse(null);
    }

}
