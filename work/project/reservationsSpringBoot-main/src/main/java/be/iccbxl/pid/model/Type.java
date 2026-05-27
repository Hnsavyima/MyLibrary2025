package be.iccbxl.pid.model;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "types")
@Data
public class Type {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 60)
    private String type;

    @ManyToMany(mappedBy = "types")
    private List<Artist> artists;

    public Type() {}

    public Type(Long id, String type) {
        this.id = id;
        this.type = type;
    }

}
