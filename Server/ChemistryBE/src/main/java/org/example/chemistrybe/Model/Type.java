package org.example.chemistrybe.Model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "Types")
@Data
public class Type {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
    private String description;
}
