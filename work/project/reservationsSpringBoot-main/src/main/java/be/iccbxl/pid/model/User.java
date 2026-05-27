package be.iccbxl.pid.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "users")
@Data
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 60)
    private String login;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false, length = 20)
    private String role;

    public User() {}

    public User(String login, String password, String role) {
        this.login = login;
        this.password = password;
        this.role = role;
    }

}
