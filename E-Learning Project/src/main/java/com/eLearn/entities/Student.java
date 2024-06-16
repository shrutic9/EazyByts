package com.eLearn.entities;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Student {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer sid;
	@Column
	private String name;
	@Column
	private String sclass;
	@Column
	private String college;
	@Column
	private String semail;
	@Column
	private String spass;
	
	@ManyToMany(mappedBy = "student")
	private Set<Course> scourse;
	
	public Set<Course> getScourse() {
		return scourse;
	}
	public void setScourse(Set<Course> scourse) {
		this.scourse = scourse;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getSclass() {
		return sclass;
	}
	public void setSclass(String sclass) {
		this.sclass = sclass;
	}
	
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	
	public String getSemail() {
		return semail;
	}
	public void setSemail(String semail) {
		this.semail = semail;
	}
	
	public String getSpass() {
		return spass;
	}
	public void setSpass(String spass) {
		this.spass = spass;
	}
	
	
}
