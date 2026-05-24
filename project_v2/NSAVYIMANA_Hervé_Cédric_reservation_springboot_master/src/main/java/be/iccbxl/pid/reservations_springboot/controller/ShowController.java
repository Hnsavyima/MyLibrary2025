package be.iccbxl.pid.reservations_springboot.controller;

import be.iccbxl.pid.reservations_springboot.model.Show;
import be.iccbxl.pid.reservations_springboot.model.Tag;
import be.iccbxl.pid.reservations_springboot.service.ShowService;
import be.iccbxl.pid.reservations_springboot.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class ShowController {

    @Autowired
    private ShowService showService;

    @Autowired
    private TagService tagService;

    @GetMapping("/shows")
    public String index(Model model, @RequestParam(required = false) String keyword) {
        List<Show> shows;
        if (keyword != null && !keyword.trim().isEmpty()) {
            shows = showService.searchByKeyword(keyword.trim());
            model.addAttribute("keyword", keyword.trim());
            model.addAttribute("totalResults", shows.size());
        } else {
            shows = showService.getAllShows();
        }
        model.addAttribute("shows", shows);
        model.addAttribute("title", "Liste des spectacles");
        return "show/index";
    }

    @GetMapping("/shows/{id}")
    public String show(Model model, @PathVariable long id) {
        Show show = showService.getShow(id);
        List<Tag> allTags = tagService.getAllTags();
        model.addAttribute("show", show);
        model.addAttribute("allTags", allTags);
        model.addAttribute("title", "Fiche du spectacle");
        return "show/show";
    }

    @GetMapping("/shows/without-tag/{tag}")
    public String withoutTag(Model model, @PathVariable String tag) {
        List<Show> shows = showService.getShowsWithoutTag(tag);
        model.addAttribute("shows", shows);
        model.addAttribute("tag", tag);
        model.addAttribute("title", "Spectacles sans le mot-clé : " + tag);
        return "show/without-tag";
    }

    @PostMapping("/shows/{id}/tags")
    @PreAuthorize("hasRole('ADMIN')")
    public String addTag(@PathVariable long id,
            @RequestParam String tagName,
            RedirectAttributes redirAttrs) {
        Show show = showService.getShow(id);
        if (show == null) {
            return "redirect:/shows";
        }
        String trimmed = tagName.trim().toLowerCase();
        if (!trimmed.isEmpty()) {
            Tag tag = tagService.findOrCreate(trimmed);
            if (!show.getTags().contains(tag)) {
                show.getTags().add(tag);
                showService.save(show);
                redirAttrs.addFlashAttribute("successMessage", "Mot-clé ajouté avec succès.");
            } else {
                redirAttrs.addFlashAttribute("errorMessage", "Ce mot-clé est déjà associé au spectacle.");
            }
        }
        return "redirect:/shows/" + id;
    }
}
