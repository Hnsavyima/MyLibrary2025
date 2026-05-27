package be.iccbxl.pid.controller;

import be.iccbxl.pid.model.Location;
import be.iccbxl.pid.model.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/locations")
public class LocationController {

    @Autowired
    private LocationService locationService;

    @GetMapping("")
    public String index(Model model) {
        model.addAttribute("title", "Liste des lieux de spectacle");
        model.addAttribute("locations", locationService.getAllLocations());
        return "location/index";
    }

    @GetMapping("/{id}")
    public String show(Model model, @PathVariable Long id) {
        Location location = locationService.getLocation(id);
        model.addAttribute("location", location);
        model.addAttribute("rooms", location.getRooms());
        return "location/show";
    }

}
