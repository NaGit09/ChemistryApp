package org.example.chemistrybe.repository;

import org.example.chemistrybe.model.Answer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AnswesRepository extends JpaRepository <Answer, Integer> {
}
