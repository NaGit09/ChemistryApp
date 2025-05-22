package org.example.chemistrybe.Repository;

import org.example.chemistrybe.Model.ExperimentCondition;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ExperimentConditionRepository extends JpaRepository<ExperimentCondition, Integer> {
}
