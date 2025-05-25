package org.example.chemistrybe.model;
import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@Table(name = "questions")
@Data
public class Question {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(columnDefinition = "TEXT")
    private String content;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private QuestionCategory category;
    @OneToMany(mappedBy = "question", fetch = FetchType.LAZY)
    private List<answer> answers;

}

