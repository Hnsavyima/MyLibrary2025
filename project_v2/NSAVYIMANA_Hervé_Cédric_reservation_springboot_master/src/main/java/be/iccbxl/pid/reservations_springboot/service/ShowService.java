package be.iccbxl.pid.reservations_springboot.service;

import be.iccbxl.pid.reservations_springboot.model.Show;
import be.iccbxl.pid.reservations_springboot.repository.ShowRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ShowService {

    @Autowired
    private ShowRepository showRepository;

    public List<Show> getAllShows() {
        List<Show> shows = new ArrayList<>();
        showRepository.findAll().forEach(shows::add);
        return shows;
    }

    public Show getShow(long id) {
        return showRepository.findById(id);
    }

    public void save(Show show) {
        showRepository.save(show);
    }

    public List<Show> searchByKeyword(String keyword) {
        return showRepository.findByKeyword(keyword);
    }

    public List<Show> getShowsWithoutTag(String tag) {
        return showRepository.findShowsWithoutTag(tag);
    }
}
