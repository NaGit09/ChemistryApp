package org.example.chemistrybe.service;

import org.example.chemistrybe.model.Answer;
import org.example.chemistrybe.repository.AnswesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnswerService {
    @Autowired
    public AnswesRepository answeRepository;
    public Answer getAnswerById(int id){
        return answeRepository.findById(id).orElse(null);
    }
}
