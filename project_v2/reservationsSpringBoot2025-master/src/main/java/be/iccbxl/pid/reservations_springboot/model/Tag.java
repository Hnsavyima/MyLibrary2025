package be.iccbxl.pid.reservations_springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Data
@NoArgsConstructor
@Entity
@Table(name = "tags")
public class Tag {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Le mot-clé ne doit pas être vide.")
    @Size(min = 1, max = 30, message = "Le mot-clé doit être entre 1 et 30 caractères.")
    @Column(unique = true, length = 30)
    private String tag;

    @ToString.Exclude
    @ManyToMany(mappedBy = "tags")
    private List<Show> shows;
}
