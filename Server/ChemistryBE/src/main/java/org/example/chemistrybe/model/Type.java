package org.example.chemistrybe.model;

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
