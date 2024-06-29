package com.language.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity	
public class Achievement {
	 @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long achievementId;

    private String achievementName;
    private String description;
    private String criteria;
    private String badgeIcon;

    @OneToMany(mappedBy = "achievement", cascade = CascadeType.ALL)
    private List<UserAchievement> userAchievements;

	public Long getAchievementId() {
		return achievementId;
	}

	public void setAchievementId(Long achievementId) {
		this.achievementId = achievementId;
	}

	public String getAchievementName() {
		return achievementName;
	}

	public void setAchievementName(String achievementName) {
		this.achievementName = achievementName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCriteria() {
		return criteria;
	}

	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}

	public String getBadgeIcon() {
		return badgeIcon;
	}

	public void setBadgeIcon(String badgeIcon) {
		this.badgeIcon = badgeIcon;
	}

	public List<UserAchievement> getUserAchievements() {
		return userAchievements;
	}

	public void setUserAchievements(List<UserAchievement> userAchievements) {
		this.userAchievements = userAchievements;
	}
    
    

}
