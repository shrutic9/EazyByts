package com.language.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Lesson {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer lessonId;

    private String lessonTitle;
    private String content;
    private String videoURL;
    private String audioURL;
    private int seq;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    @OneToMany(mappedBy = "lesson", cascade = CascadeType.ALL)
    private List<Exercise> exercises;

	public Integer getLessonId() {
		return lessonId;
	}

	public void setLessonId(Integer lessonId) {
		this.lessonId = lessonId;
	}

	public String getLessonTitle() {
		return lessonTitle;
	}

	public void setLessonTitle(String lessonTitle) {
		this.lessonTitle = lessonTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getVideoURL() {
		return videoURL;
	}

	public void setVideoURL(String videoURL) {
		this.videoURL = videoURL;
	}

	public String getAudioURL() {
		return audioURL;
	}

	public void setAudioURL(String audioURL) {
		this.audioURL = audioURL;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public List<Exercise> getExercises() {
		return exercises;
	}

	public void setExercises(List<Exercise> exercises) {
		this.exercises = exercises;
	}


}
