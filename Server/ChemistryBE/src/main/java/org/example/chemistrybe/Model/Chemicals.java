package org.example.chemistrybe.Model;

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
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private double atomic_weight;
    private String SYMBOL;
    private int type_id;
    private String hazard_infor ;
    private String status;
    private String description;
}
