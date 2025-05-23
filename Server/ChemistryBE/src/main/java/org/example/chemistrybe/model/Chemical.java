package org.example.chemistrybe.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Chemicals")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class Chemical {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
    private Double atomic_weight;
    private String symbol;

    @ManyToOne
    @JoinColumn(name = "type_id")
    private Type type;

    private String hazard_infor;
    private String status;
    private String description;
    private String category;
    private String image;
}