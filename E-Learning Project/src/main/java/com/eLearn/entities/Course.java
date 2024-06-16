package com.eLearn.entities;


import java.sql.Date;
import java.time.LocalDate;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Course {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer cid;
	@Column
	private String title;
	@Column
	private String cdesc;
	@Column(columnDefinition="DATE")
	private Date startDate;
	@Column(columnDefinition="DATE")
	private Date endDate;
	
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@ManyToOne
    @JoinColumn(name = "teacher_id")
    private Teacher teacher;

	@ManyToMany
	@JoinTable(name="student_course",
				joinColumns=@JoinColumn(name="course_id"),
				inverseJoinColumns=@JoinColumn(name="stud_id"))
	private Set<Student> student;
	
	public Set<Student> getStudent() {
		return student;
	}

	public void setStudent(Set<Student> student) {
		this.student = student;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDesc() {
		return cdesc;
	}

	public void setDesc(String cdesc) {
		this.cdesc = cdesc;
	}


	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
}
