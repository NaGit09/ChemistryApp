package org.example.chemistrybe.Model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "question_categories")
@Data
public class QuestionCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
}

