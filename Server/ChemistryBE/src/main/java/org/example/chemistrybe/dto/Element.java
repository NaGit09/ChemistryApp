package org.example.chemistrybe.dto;

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
public class Element {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private double atomic_weight;
    private String SYMBOL;
    private int type_id;
}
