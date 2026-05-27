package be.iccbxl.pid.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "representations")
@Data
public class Representation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate date;

    @Column(nullable = false)
    @DateTimeFormat(pattern = "HH:mm")
    private LocalTime hour;

    @ManyToOne
    @JoinColumn(name = "show_id", nullable = false)
    private Show show;

    @ManyToOne
    @JoinColumn(name = "room_id", nullable = false)
    private Room room;

    public Representation() {}

    public Representation(LocalDate date, LocalTime hour, Show show, Room room) {
        this.date = date;
        this.hour = hour;
        this.show = show;
        this.room = room;
    }

}
