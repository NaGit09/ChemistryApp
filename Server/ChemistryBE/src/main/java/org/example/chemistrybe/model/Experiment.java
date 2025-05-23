package org.example.chemistrybe.model;

import jakarta.persistence.*;
import lombok.*;

@Table(name = "experiment")
@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Experiment {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private int  chemical_1;
    private int  chemical_2;
    private String description;
}

