package org.example.chemistrybe.Model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Table(name = "experiment")
@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Experiment {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "chemical_1")
    private Chemical chemical1;

    @ManyToOne
    @JoinColumn(name = "chemical_2")
    private Chemical chemical2;

    @ManyToOne
    @JoinColumn(name = "condition_id")
    private ExperimentCondition condition;

    private String description;
}

