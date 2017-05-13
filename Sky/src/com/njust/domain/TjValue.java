package com.njust.domain;

/**
 * TjValue entity. @author MyEclipse Persistence Tools
 */

public class TjValue implements java.io.Serializable {

	// Fields

	private Integer vid;
	private String sheetid;
	private String sheetvalue;
	private Integer sequence;
	private String username;

	// Constructors

	/** default constructor */
	public TjValue() {
	}

	/** full constructor 
	 * @param username */
	public TjValue(String sheetid, String sheetvalue, Integer sequence, String username) {
		this.sheetid = sheetid;
		this.sheetvalue = sheetvalue;
		this.sequence = sequence;
		this.username = username;
	}

	// Property accessors

	public Integer getVid() {
		return this.vid;
	}

	public void setVid(Integer vid) {
		this.vid = vid;
	}

	public String getSheetid() {
		return this.sheetid;
	}

	public void setSheetid(String sheetid) {
		this.sheetid = sheetid;
	}

	public String getSheetvalue() {
		return this.sheetvalue;
	}

	public void setSheetvalue(String sheetvalue) {
		this.sheetvalue = sheetvalue;
	}

	public Integer getSequence() {
		return this.sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}