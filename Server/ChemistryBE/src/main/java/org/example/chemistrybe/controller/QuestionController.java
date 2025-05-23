package org.example.chemistrybe.controller;

import org.example.chemistrybe.dto.QuestionDTO;
import org.example.chemistrybe.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/Question")
public class QuestionController {
    @Autowired
    public QuestionService service;
    @GetMapping("/")
    public List<QuestionDTO> getQuestionById(){
        return service.getAllQuestions();
    }
    @GetMapping("/{id}")
    public QuestionDTO getQuestionById(@PathVariable int id){
        return service.getQuestion(id);
    }
}
