package be.iccbxl.pid.controller;

import be.iccbxl.pid.model.Artist;
import be.iccbxl.pid.model.ArtistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/artists")
public class ArtistController {

    @Autowired
    ArtistService service;

    @GetMapping("")
    public String index(Model model) {
        model.addAttribute("title", "Liste des artistes");
        model.addAttribute("artists", service.getAllArtists());
        return "artist/index";
    }

    @GetMapping("/{id}")
    public String show(Model model, @PathVariable String id) {
        Artist artist = service.getArtist(id);
        model.addAttribute("artist", artist);
        return "artist/show";
    }

}
