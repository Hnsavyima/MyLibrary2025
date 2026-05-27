package be.iccbxl.pid.controller;

import be.iccbxl.pid.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalTime;

@Controller
@RequestMapping("/representations")
public class RepresentationController {

    @Autowired
    private RepresentationService representationService;

    @Autowired
    private ShowService showService;

    @Autowired
    private RoomService roomService;

    @GetMapping("/add")
    @PreAuthorize("hasRole('ADMIN')")
    public String addForm(Model model) {
        model.addAttribute("shows", showService.getAllShows());
        model.addAttribute("rooms", roomService.getAllRooms());
        model.addAttribute("representation", new Representation());
        return "representation/add";
    }

    @PostMapping("/add")
    @PreAuthorize("hasRole('ADMIN')")
    public String addSubmit(
            @RequestParam Long showId,
            @RequestParam Long roomId,
            @RequestParam String date,
            @RequestParam String hour,
            Model model) {

        LocalDate localDate = LocalDate.parse(date);
        LocalTime localTime = LocalTime.parse(hour);

        if (representationService.isRoomOccupied(roomId, localDate, localTime)) {
            model.addAttribute("shows", showService.getAllShows());
            model.addAttribute("rooms", roomService.getAllRooms());
            model.addAttribute("representation", new Representation());
            model.addAttribute("error", "Cette salle est déjà occupée à ce moment.");
            return "representation/add";
        }

        Show show = showService.getShow(showId);
        Room room = roomService.getRoom(roomId);
        Representation representation = new Representation(localDate, localTime, show, room);
        representationService.addRepresentation(representation);

        return "redirect:/shows/" + showId;
    }

}
