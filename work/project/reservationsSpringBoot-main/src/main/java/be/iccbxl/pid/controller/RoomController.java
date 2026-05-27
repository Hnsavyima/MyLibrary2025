package be.iccbxl.pid.controller;

import be.iccbxl.pid.model.RepresentationService;
import be.iccbxl.pid.model.Room;
import be.iccbxl.pid.model.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/rooms")
public class RoomController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private RepresentationService representationService;

    @GetMapping("/{id}/shows")
    public String showsByRoom(Model model, @PathVariable Long id) {
        Room room = roomService.getRoom(id);
        List<be.iccbxl.pid.model.Show> shows = representationService.getRepresentationsByRoom(id)
                .stream()
                .map(r -> r.getShow())
                .distinct()
                .collect(Collectors.toList());
        model.addAttribute("room", room);
        model.addAttribute("shows", shows);
        return "room/shows";
    }

}
