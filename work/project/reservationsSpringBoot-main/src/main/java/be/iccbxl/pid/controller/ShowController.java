package be.iccbxl.pid.controller;

import be.iccbxl.pid.model.RepresentationService;
import be.iccbxl.pid.model.Show;
import be.iccbxl.pid.model.ShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shows")
public class ShowController {

    @Autowired
    private ShowService showService;

    @Autowired
    private RepresentationService representationService;

    @GetMapping("")
    public String index(Model model) {
        model.addAttribute("title", "Liste des spectacles");
        model.addAttribute("shows", showService.getAllShows());
        return "show/index";
    }

    @GetMapping("/{id}")
    public String show(Model model, @PathVariable Long id) {
        Show show = showService.getShow(id);
        model.addAttribute("show", show);
        model.addAttribute("representations", representationService.getRepresentationsByShow(id));
        return "show/show";
    }

}
