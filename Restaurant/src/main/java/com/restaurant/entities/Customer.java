package com.restaurant.entities;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Customer {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer cid;
	
	@Column
	private String cname;
	
	@Column
	private String cmail;
	
	@Column
	private Integer phn;
	
	@Column
	private String pass;
	
	@Column
	private String addr;
	
	@Column
	private String city;
	
	/*@ManyToMany
	@JoinTable(name="cust_rest",
				joinColumns=@JoinColumn(name="cust_id"),
				inverseJoinColumns=@JoinColumn(name="rest_id"))
	private Set<Restaurant> restaurant;*/

	@OneToMany(mappedBy="customer",cascade=CascadeType.ALL,orphanRemoval = true)
	private Set<Order> order;
	
	//Getters and Setters
	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCmail() {
		return cmail;
	}

	public void setCmail(String cmail) {
		this.cmail = cmail;
	}

	public Integer getPhn() {
		return phn;
	}

	public void setPhn(Integer phn) {
		this.phn = phn;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Set<Order> getOrder() {
		return order;
	}

	public void setOrder(Set<Order> order) {
		this.order = order;
	}
	
	/*@OneToMany(mappedBy="order",cascade=CascadeType.ALL,orphanRemoval = true)
	private Set<Order> order;*/
	//Getters & Setters

	
}
