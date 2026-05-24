package be.iccbxl.pid.reservations_springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
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
@Table(name = "troupes")
public class Troupe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Le nom ne doit pas être vide.")
    @Size(min = 2, max = 60, message = "Le nom doit être entre 2 et 60 caractères.")
    @Column(unique = true, length = 60)
    private String name;

    @Column(name = "logo_url", length = 255)
    private String logoUrl;

    @ToString.Exclude
    @OneToMany(mappedBy = "troupe")
    private List<Artist> artists;
}
