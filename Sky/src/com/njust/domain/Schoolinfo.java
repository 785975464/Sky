package com.njust.domain;

/**
 * Schoolinfo entity. @author MyEclipse Persistence Tools
 */

public class Schoolinfo implements java.io.Serializable {

	// Fields

	private Integer schoolid;
	private String schoolname;
	private Integer addressid;
	// Constructors

	/** default constructor */
	public Schoolinfo() {
	}

	/** full constructor */
	public Schoolinfo(Integer schoolid, String schoolname,Integer addressid) {
		this.schoolid = schoolid;
		this.schoolname = schoolname;
		this.addressid = addressid;
	}

	// Property accessors

	public Integer getSchoolid() {
		return this.schoolid;
	}

	public void setSchoolid(Integer schoolid) {
		this.schoolid = schoolid;
	}

	public String getSchoolname() {
		return this.schoolname;
	}

	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}
	
	public Integer getAddressid() {
		return this.addressid;
	}
	public void setAddressid(Integer addressid) {
		this.addressid = addressid;
	}
}