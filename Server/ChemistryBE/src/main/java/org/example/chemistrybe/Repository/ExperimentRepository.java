package org.example.chemistrybe.Repository;

import org.example.chemistrybe.Model.Experiment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ExperimentRepository   extends JpaRepository<Experiment, Integer> {
    public Experiment findById(int id);
    @Query("SELECT e FROM Experiment e WHERE e.chemical_1 = :id1 AND e.chemical_2 = :id2")
    Experiment getExperiment(@Param("id1") Integer id1, @Param("id2") Integer id2);



}
