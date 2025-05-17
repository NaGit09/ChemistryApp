package org.example.chemistrybe.Repository;

import org.example.chemistrybe.Model.experimentresult;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface experimentresultRepository extends JpaRepository<experimentresult, Long> {
    List<experimentresult> findByExperimentId(Long experimentId);
}
