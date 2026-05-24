package be.iccbxl.pid.reservations_springboot.service;

import be.iccbxl.pid.reservations_springboot.model.Troupe;
import be.iccbxl.pid.reservations_springboot.repository.TroupeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TroupeService {

    @Autowired
    private TroupeRepository troupeRepository;

    public List<Troupe> getAllTroupes() {
        List<Troupe> troupes = new ArrayList<>();
        troupeRepository.findAll().forEach(troupes::add);
        return troupes;
    }

    public Troupe getTroupe(long id) {
        return troupeRepository.findById(id);
    }
}
