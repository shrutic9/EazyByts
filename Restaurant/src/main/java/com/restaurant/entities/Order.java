package com.restaurant.entities;

import java.time.LocalDateTime;
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

@Entity(name="Orders")
public class Order {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer oid;
	
	@Column
	private Integer oAmt;
	
	@Column
	private LocalDateTime dtime;
	
	@ManyToOne
	@JoinColumn(name="cust_id")
	private Customer customer;
	
	@ManyToOne
	@JoinColumn(name="rest_id")
	private Restaurant restaurant;
	
	@OneToMany(mappedBy="order",cascade=CascadeType.ALL,orphanRemoval = true)
	private Set<OrderItem> orderItem;
	
	//Getters and Setters

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public Integer getoAmt() {
		return oAmt;
	}

	public void setoAmt(Integer oAmt) {
		this.oAmt = oAmt;
	}

	public LocalDateTime getDtime() {
		return dtime;
	}

	public void setDtime(LocalDateTime dtime) {
		this.dtime = dtime;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

	public Set<OrderItem> getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(Set<OrderItem> orderItem) {
		this.orderItem = orderItem;
	}
	
	
	
}
