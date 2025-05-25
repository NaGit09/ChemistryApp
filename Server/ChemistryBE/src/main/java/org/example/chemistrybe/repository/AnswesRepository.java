package org.example.chemistrybe.repository;

import org.example.chemistrybe.model.answer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AnswesRepository extends JpaRepository <answer, Integer> {
}
