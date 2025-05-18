package org.example.chemistrybe.Repository;

import org.example.chemistrybe.Model.Chemicals;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChemicalsRepository extends JpaRepository<Chemicals, Long> {
    Chemicals findByName(String name);


}
