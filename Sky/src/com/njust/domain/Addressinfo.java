package com.njust.domain;

/**
 * Addressinfo entity. @author MyEclipse Persistence Tools
 */

public class Addressinfo implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Fields
	private Integer addressid;
	private String district;
	private String street;
	private String community;
	// Constructors

	/** default constructor */
	public Addressinfo() {
	}

	/** full constructor 
	 * @param city */
	public Addressinfo(Integer addressid, String community, String street, String district) {
		this.addressid = addressid;
		this.district = district;
		this.street = street;
		this.community = community;
	}

	// Property accessors
	public Integer getAddressid() {
		return this.addressid;
	}

	public void setAddressid(Integer addressid) {
		this.addressid = addressid;
	}
	public String getCommunity() {
		return this.community;
	}

	public void setCommunity(String community) {
		this.community = community;
	}

	public String getStreet() {
		return this.street;
	}

	public void setStreet(String street) {
		this.street = street;
	}
	
	public String getDistrict() {
		return this.district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}

}