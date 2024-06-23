package com.restaurant.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class OrderItem {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer orid;
	
	@Column
	private Integer oquant;
	
	@Column
	private Integer oamt;
	
	@ManyToOne
	@JoinColumn(name="order_id")
	private Order order;
	
	 @ManyToOne
	    @JoinColumn(name = "menu_item_id")
	    private MenuItem menuItem;
	//Getters and Setters

	public MenuItem getMenuItem() {
		return menuItem;
	}

	public void setMenuItem(MenuItem menuItem) {
		this.menuItem = menuItem;
	}

	public Integer getOrid() {
		return orid;
	}

	public void setOrid(Integer orid) {
		this.orid = orid;
	}

	public Integer getOquant() {
		return oquant;
	}

	public void setOquant(Integer oquant) {
		this.oquant = oquant;
	}

	public Integer getOamt() {
		return oamt;
	}

	public void setOamt(Integer oamt) {
		this.oamt = oamt;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
	
}
