package org.example.chemistrybe.repository;

import org.example.chemistrybe.model.QuestionCategory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionCategoryRepository extends JpaRepository<QuestionCategory, Integer> {
}
