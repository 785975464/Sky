package com.njust.domain;

/**
 * Authorizerelation entity. @author MyEclipse Persistence Tools
 */

public class Authorizerelation implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String specialistName;
	private String isAgreed;

	// Constructors

	/** default constructor */
	public Authorizerelation() {
	}

	/** full constructor */
	public Authorizerelation(String username, String specialistName,
			String isAgreed) {
		this.username = username;
		this.specialistName = specialistName;
		this.isAgreed = isAgreed;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSpecialistName() {
		return this.specialistName;
	}

	public void setSpecialistName(String specialistName) {
		this.specialistName = specialistName;
	}

	public String getIsAgreed() {
		return this.isAgreed;
	}

	public void setIsAgreed(String isAgreed) {
		this.isAgreed = isAgreed;
	}

}