package org.example.chemistrybe.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "chemicals")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class Chemicals {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
    private Double atomic_weight;
    private String symbol;
    private Integer type_id;

    private String hazard_infor;
    private String status;
    private String description;
    private String category;
    private String image;
}