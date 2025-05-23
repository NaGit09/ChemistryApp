package org.example.chemistrybe.utils;

import org.example.chemistrybe.dto.AnswerDTO;
import org.example.chemistrybe.dto.QuestionDTO;
import org.example.chemistrybe.model.Question;

import java.util.List;
import java.util.stream.Collectors;

public class ConvertQuestionDTO {
    public static QuestionDTO convertQuestionToQuestionDTO(Question questions){
        QuestionDTO dto = new QuestionDTO();
        dto.setId(questions.getId());
        dto.setContent(questions.getContent());
        dto.setCategoryName(questions.getCategory().getName());

        List<AnswerDTO> answerDTOs = questions.getAnswers().stream().map(a -> {
            AnswerDTO aDto = new AnswerDTO();
            aDto.setId(a.getId());
            aDto.setContent(a.getContent());
            aDto.setCorrect(a.isCorrect());
            return aDto;
        }).collect(Collectors.toList());

        dto.setAnswers(answerDTOs);
        return dto;
    }
}
