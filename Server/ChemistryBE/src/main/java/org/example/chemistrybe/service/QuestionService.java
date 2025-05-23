package org.example.chemistrybe.service;

import org.example.chemistrybe.dto.QuestionDTO;
import org.example.chemistrybe.model.Question;
import org.example.chemistrybe.repository.QuestionRepository;
import org.example.chemistrybe.utils.ConvertQuestionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class QuestionService {
    @Autowired
    public QuestionRepository questionRepository;

    public QuestionDTO getQuestion(int id) {
        return ConvertQuestionDTO.convertQuestionToQuestionDTO(questionRepository.findById(id));
    }

    public List<QuestionDTO> getAllQuestions() {
        List<Question> questions = questionRepository.findAllWithAnswers();
        return questions.stream().map(ConvertQuestionDTO::convertQuestionToQuestionDTO).collect(Collectors.toList());
    }


}
