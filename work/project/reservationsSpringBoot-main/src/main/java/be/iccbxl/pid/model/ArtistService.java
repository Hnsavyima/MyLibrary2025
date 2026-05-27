package be.iccbxl.pid.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArtistService {

    @Autowired
    private ArtistRepository artistRepository;

    public List<Artist> getAllArtists() {
        return (List<Artist>) artistRepository.findAll();
    }

    public Artist getArtist(String id) {
        return artistRepository.findById(Long.parseLong(id)).orElse(null);
    }

    public void addArtist(Artist artist) {
        artistRepository.save(artist);
    }

    public void updateArtist(String id, Artist artist) {
        artist.setId(Long.parseLong(id));
        artistRepository.save(artist);
    }

    public void deleteArtist(String id) {
        artistRepository.deleteById(Long.parseLong(id));
    }

}
