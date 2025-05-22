package org.example.chemistrybe.Model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "ExperimentCondition")
@Data
public class ExperimentCondition {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String conditionName;
}