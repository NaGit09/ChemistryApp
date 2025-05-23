package org.example.chemistrybe.repository;

import org.example.chemistrybe.model.Chemical;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChemicalsRepository extends JpaRepository<Chemical, Integer> {
    Chemical findByName(String name);


}
