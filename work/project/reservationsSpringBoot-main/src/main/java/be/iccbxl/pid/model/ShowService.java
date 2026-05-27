package be.iccbxl.pid.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShowService {

    @Autowired
    private ShowRepository showRepository;

    public List<Show> getAllShows() {
        return (List<Show>) showRepository.findAll();
    }

    public Show getShow(Long id) {
        return showRepository.findById(id).orElse(null);
    }

}
