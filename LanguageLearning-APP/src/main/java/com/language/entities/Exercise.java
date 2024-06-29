package com.language.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Exercise {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer exerciseId;

    private String exerciseType;
    private String question;
    private String options; // Store as JSON
    private String answer;
    private int seq;

    @ManyToOne
    @JoinColumn(name = "lesson_id")
    private Lesson lesson;

	public Integer getExerciseId() {
		return exerciseId;
	}

	public void setExerciseId(Integer exerciseId) {
		this.exerciseId = exerciseId;
	}

	public String getExerciseType() {
		return exerciseType;
	}

	public void setExerciseType(String exerciseType) {
		this.exerciseType = exerciseType;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public Lesson getLesson() {
		return lesson;
	}

	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}
    
    
}
