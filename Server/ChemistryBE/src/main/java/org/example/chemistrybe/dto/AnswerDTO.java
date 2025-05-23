package org.example.chemistrybe.dto;

import lombok.Data;

@Data
public class AnswerDTO {
    private Integer id;
    private String content;
    private boolean isCorrect;
}