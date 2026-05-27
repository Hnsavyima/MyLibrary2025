package be.iccbxl.pid.model;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "artists")
@Data
public class Artist {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 60)
    private String firstname;

    @Column(nullable = false, length = 60)
    private String lastname;

    @ManyToMany
    @JoinTable(
        name = "artist_type",
        joinColumns = @JoinColumn(name = "artist_id"),
        inverseJoinColumns = @JoinColumn(name = "type_id")
    )
    private List<Type> types;

    protected Artist() {}

    public Artist(String firstname, String lastname) {
        this.firstname = firstname;
        this.lastname = lastname;
    }

}
