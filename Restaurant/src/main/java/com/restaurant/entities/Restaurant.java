package com.restaurant.entities;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Restaurant {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer rid;
	
	@Column
	private String rname;
	
	@Column
	private String rtype;
	
	@Column
	private LocalTime otime;

	@Column
	private LocalTime ctime;
	
	@Column
	private String radd;
	
	@Column
	private String rmail;
	


	@Column 
	private String rpass;
	
	@Column 
	private String rcity;

	 /*@ManyToMany(mappedBy = "restaurant")
	    private Set<Customer> customers;*/


	@OneToMany(mappedBy="restaurant",cascade=CascadeType.ALL,orphanRemoval = true)
		Set<Order> order;
	
	 @OneToMany(mappedBy="restaurant",cascade=CascadeType.ALL,orphanRemoval = true)
		Set<MenuItem> menuItem;

	 //Getters and Setters

	 
	 public String getRcity() {
		return rcity;
	}

	public void setRcity(String rcity) {
		this.rcity = rcity;
	}
	
	 public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getRadd() {
		return radd;
	}

	public void setRadd(String radd) {
		this.radd = radd;
	}

	public String getRmail() {
		return rmail;
	}

	public void setRmail(String rmail) {
		this.rmail = rmail;
	}

	public String getRpass() {
		return rpass;
	}

	public void setRpass(String rpass) {
		this.rpass = rpass;
	}

	public Set<Order> getOrder() {
		return order;
	}

	public void setOrder(Set<Order> order) {
		this.order = order;
	}

	public Set<MenuItem> getMenuItem() {
		return menuItem;
	}

	public void setMenuItem(Set<MenuItem> menuItem) {
		this.menuItem = menuItem;
	}
	
	public String getRtype() {
		return rtype;
	}

	public void setRtype(String rtype) {
		this.rtype = rtype;
	}

	public LocalTime getOtime() {
		return otime;
	}

	public void setOtime(LocalTime otime) {
		this.otime = otime;
	}

	public LocalTime getCtime() {
		return ctime;
	}

	public void setCtime(LocalTime ctime) {
		this.ctime = ctime;
	}


}
