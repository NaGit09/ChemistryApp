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
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer chemical_1;
    private Integer chemical_2;
    private Integer condition_id;
    private String description;
    @JsonManagedReference
    @OneToMany(mappedBy = "experiment", cascade = CascadeType.PERSIST)
    private List<experimentresult> results;
}
