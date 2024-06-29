package com.language.entities;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Progress {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long progressId;

    private String completionStatus;
    private Integer score;
    private LocalDate lastAccessed;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "lesson_id")
    private Lesson lesson;

	public Long getProgressId() {
		return progressId;
	}

	public void setProgressId(Long progressId) {
		this.progressId = progressId;
	}

	public String getCompletionStatus() {
		return completionStatus;
	}

	public void setCompletionStatus(String completionStatus) {
		this.completionStatus = completionStatus;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public LocalDate getLastAccessed() {
		return lastAccessed;
	}

	public void setLastAccessed(LocalDate lastAccessed) {
		this.lastAccessed = lastAccessed;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Lesson getLesson() {
		return lesson;
	}

	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}
    
    

}
