package com.restaurant.entities;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class MenuItem {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer fid;
	
	@Column
	private String fname;
	
	@Column
	private String fdesc;
	
	@Column
	private Integer famt;
	
	@ManyToOne
	@JoinColumn(name="rest_menu_id")
	private Restaurant restaurant;
	
	 @OneToMany(mappedBy = "menuItem", cascade = CascadeType.ALL)
	    private Set<OrderItem> orderItems;


	//Getters and Setters
	
	
	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	public Integer getFid() {
		return fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFdesc() {
		return fdesc;
	}

	public void setFdesc(String fdesc) {
		this.fdesc = fdesc;
	}

	public Integer getFamt() {
		return famt;
	}

	public void setFamt(Integer famt) {
		this.famt = famt;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}
	
	
}
