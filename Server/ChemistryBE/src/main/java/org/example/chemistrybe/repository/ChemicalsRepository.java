package org.example.chemistrybe.repository;

import org.example.chemistrybe.model.Chemicals;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChemicalsRepository extends JpaRepository<Chemicals, Integer> {
    Chemicals findByName(String name);


}
