package org.example.chemistrybe.Repository;

import org.example.chemistrybe.Model.UserAnswer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserAnswerRepository extends JpaRepository<UserAnswer, Integer> {
//    List<UserAnswer> findByUserId(Integer userId);
}