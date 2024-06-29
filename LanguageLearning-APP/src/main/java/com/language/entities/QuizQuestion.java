package com.language.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class QuizQuestion {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer quizQuestionId;

    private String questionText;
    private String options; // Store as JSON
    private String correctAnswer;
    private Integer seq;

	@ManyToOne
    @JoinColumn(name = "quiz_id")
    private Quiz quiz;


	public Integer getQuizQuestionId() {
		return quizQuestionId;
	}

	public void setQuizQuestionId(Integer quizQuestionId) {
		this.quizQuestionId = quizQuestionId;
	}

	public String getQuestionText() {
		return questionText;
	}

	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public String getCorrectAnswer() {
		return correctAnswer;
	}

	public void setCorrectAnswer(String correctAnswer) {
		this.correctAnswer = correctAnswer;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public Quiz getQuiz() {
		return quiz;
	}

	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}
	
	
}
