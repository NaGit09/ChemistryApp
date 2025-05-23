package org.example.chemistrybe.dto;

import lombok.Data;

import java.util.List;
@Data
public class QuestionDTO {
    private Integer id;
    private String content;
    private String categoryName;
    private List<AnswerDTO> answers;
}