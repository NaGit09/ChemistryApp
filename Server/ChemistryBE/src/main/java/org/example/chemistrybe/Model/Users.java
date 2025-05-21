package org.example.chemistrybe.Model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.chemistrybe.Constant.Role;

import java.time.LocalDateTime;

@Entity
@Table(name = "users")
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
// Mapping to users' table in db
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long user_id;
    private String full_name;
    @Email(message = "Email invalid")
    private String email;
    @Size(min = 6 , message = "Password must be at least 6 characters")
    private String password_hash;
@Enumerated(EnumType.STRING)
    private Role role;
    private LocalDateTime created_at;
}
