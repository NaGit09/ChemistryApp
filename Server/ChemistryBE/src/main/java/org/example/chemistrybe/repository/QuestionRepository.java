package org.example.chemistrybe.repository;

import org.example.chemistrybe.model.Question;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionRepository extends JpaRepository<Question, Integer> {
    @Query("SELECT q FROM Question q LEFT JOIN FETCH q.answers")
    List<Question> findAllWithAnswers();
    @EntityGraph(attributePaths = "answers")
    List<Question> findAll();
    Question findById(int id);

}