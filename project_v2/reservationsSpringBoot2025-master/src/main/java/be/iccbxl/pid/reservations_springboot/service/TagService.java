package be.iccbxl.pid.reservations_springboot.service;

import be.iccbxl.pid.reservations_springboot.model.Tag;
import be.iccbxl.pid.reservations_springboot.repository.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TagService {

    @Autowired
    private TagRepository tagRepository;

    public List<Tag> getAllTags() {
        List<Tag> tags = new ArrayList<>();
        tagRepository.findAll().forEach(tags::add);
        return tags;
    }

    public Tag findOrCreate(String tagName) {
        Tag existing = tagRepository.findByTagIgnoreCase(tagName);
        if (existing != null) {
            return existing;
        }
        Tag newTag = new Tag();
        newTag.setTag(tagName.toLowerCase());
        tagRepository.save(newTag);
        return newTag;
    }
}
