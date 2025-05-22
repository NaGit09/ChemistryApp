package org.example.chemistrybe.Repository;

import org.example.chemistrybe.Model.QuestionCategory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionCategoryRepository extends JpaRepository<QuestionCategory, Integer> {
}
