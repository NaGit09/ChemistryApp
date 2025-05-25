package org.example.chemistrybe.service;

import org.example.chemistrybe.model.answer;
import org.example.chemistrybe.repository.AnswesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnswerService {
    @Autowired
    public AnswesRepository answerRepository;
    public answer getAnswerById(int id){
        return answerRepository.findById(id).orElse(null);
    }
}
