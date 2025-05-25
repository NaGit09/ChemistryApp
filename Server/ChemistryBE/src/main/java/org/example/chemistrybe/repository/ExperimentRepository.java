package org.example.chemistrybe.repository;

import org.example.chemistrybe.model.Experiment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ExperimentRepository   extends JpaRepository<Experiment, Integer> {
    @Query("SELECT e FROM Experiment e WHERE " +
            "(e.chemical_1= :id1 AND e.chemical_2 = :id2) OR " +
            "(e.chemical_1= :id2 AND e.chemical_2 = :id1)")
    Experiment getExperimentRegardlessOfOrder(@Param("id1") Integer id1, @Param("id2") Integer id2);



}
