package be.iccbxl.pid.model;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "shows")
@Data
public class Show {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 150)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    @ManyToMany
    @JoinTable(
        name = "show_artist",
        joinColumns = @JoinColumn(name = "show_id"),
        inverseJoinColumns = @JoinColumn(name = "artist_id")
    )
    private List<Artist> artists;

    @OneToMany(mappedBy = "show")
    private List<Representation> representations;

    public Show() {}

    public Show(String title, String description) {
        this.title = title;
        this.description = description;
    }

}
