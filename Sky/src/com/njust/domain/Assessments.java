package com.njust.domain;

/**
 * Assessments entity. @author MyEclipse Persistence Tools
 */

public class Assessments implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer tableId;
	private String specialistName;
	private String assessment;

	// Constructors

	/** default constructor */
	public Assessments() {
	}

	/** full constructor */
	public Assessments(Integer tableId, String specialistName, String assessment) {
		this.tableId = tableId;
		this.specialistName = specialistName;
		this.assessment = assessment;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTableId() {
		return this.tableId;
	}

	public void setTableId(Integer tableId) {
		this.tableId = tableId;
	}

	public String getSpecialistName() {
		return this.specialistName;
	}

	public void setSpecialistName(String specialistName) {
		this.specialistName = specialistName;
	}

	public String getAssessment() {
		return this.assessment;
	}

	public void setAssessment(String assessment) {
		this.assessment = assessment;
	}

}