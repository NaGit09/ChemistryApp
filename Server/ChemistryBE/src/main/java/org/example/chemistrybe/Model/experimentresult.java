package org.example.chemistrybe.Model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name = "experimentresult")
@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class experimentresult {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String resultText;
    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "experiment_id")
    private Experiment experiment;

    // Getters and setters
}
