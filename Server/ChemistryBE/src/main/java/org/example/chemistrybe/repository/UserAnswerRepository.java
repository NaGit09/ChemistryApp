package org.example.chemistrybe.repository;

import org.example.chemistrybe.model.UserAnswer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserAnswerRepository extends JpaRepository<UserAnswer, Integer> {
//    List<UserAnswer> findByUserId(Integer userId);
}