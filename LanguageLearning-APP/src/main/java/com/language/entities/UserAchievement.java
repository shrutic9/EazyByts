package com.language.entities;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class UserAchievement {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long userAchievementId;

    private LocalDate dateAchieved;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "achievement_id")
    private Achievement achievement;

	public Long getUserAchievementId() {
		return userAchievementId;
	}

	public void setUserAchievementId(Long userAchievementId) {
		this.userAchievementId = userAchievementId;
	}

	public LocalDate getDateAchieved() {
		return dateAchieved;
	}

	public void setDateAchieved(LocalDate dateAchieved) {
		this.dateAchieved = dateAchieved;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Achievement getAchievement() {
		return achievement;
	}

	public void setAchievement(Achievement achievement) {
		this.achievement = achievement;
	}
    
    

}
