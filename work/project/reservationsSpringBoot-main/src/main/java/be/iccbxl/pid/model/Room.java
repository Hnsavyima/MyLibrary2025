package be.iccbxl.pid.model;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "rooms")
@Data
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 60)
    private String name;

    @Column(nullable = false)
    private short seats;

    @ManyToOne
    @JoinColumn(name = "location_id", nullable = false)
    private Location location;

    @OneToMany(mappedBy = "room")
    private List<Representation> representations;

    public Room() {}

    public Room(String name, short seats, Location location) {
        this.name = name;
        this.seats = seats;
        this.location = location;
    }

}
