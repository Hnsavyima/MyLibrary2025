package be.iccbxl.pid.model;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "locations")
@Data
public class Location {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String name;

    @Column(length = 255)
    private String address;

    @OneToMany(mappedBy = "location")
    private List<Room> rooms;

    public Location() {}

    public Location(String name, String address) {
        this.name = name;
        this.address = address;
    }

}
