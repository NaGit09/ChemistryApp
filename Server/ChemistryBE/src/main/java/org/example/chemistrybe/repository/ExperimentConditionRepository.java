package org.example.chemistrybe.repository;

import org.example.chemistrybe.model.ExperimentCondition;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ExperimentConditionRepository extends JpaRepository<ExperimentCondition, Integer> {
}
