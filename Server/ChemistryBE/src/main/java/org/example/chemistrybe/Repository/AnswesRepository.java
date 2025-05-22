package org.example.chemistrybe.Repository;

import org.example.chemistrybe.Model.Answer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AnswesRepository extends JpaRepository <Answer, Long> {
}
