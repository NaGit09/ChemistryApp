package org.example.chemistrybe.model;
import jakarta.persistence.*;
import lombok.Data;
@Entity
@Table(name = "answers")
@Data
public class answer {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "question_id")
    private Question question;

    private String content;
    private boolean isCorrect;
}

