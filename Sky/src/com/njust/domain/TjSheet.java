package com.njust.domain;

/**
 * TjSheet entity. @author MyEclipse Persistence Tools
 */

public class TjSheet implements java.io.Serializable {

	// Fields

	private String sheetid;
	private String sheetname;
	private String creatime;
	private String creator;

	// Constructors

	/** default constructor */
	public TjSheet() {
	}

	/** minimal constructor */
	public TjSheet(String sheetid, String creator) {
		this.sheetid = sheetid;
		this.creator = creator;
	}

	/** full constructor */
	public TjSheet(String sheetid, String sheetname, String creatime,
			String creator) {
		this.sheetid = sheetid;
		this.sheetname = sheetname;
		this.creatime = creatime;
		this.creator = creator;
	}

	// Property accessors

	public String getSheetid() {
		return this.sheetid;
	}

	public void setSheetid(String sheetid) {
		this.sheetid = sheetid;
	}

	public String getSheetname() {
		return this.sheetname;
	}

	public void setSheetname(String sheetname) {
		this.sheetname = sheetname;
	}

	public String getCreatime() {
		return this.creatime;
	}

	public void setCreatime(String creatime) {
		this.creatime = creatime;
	}

	public String getCreator() {
		return this.creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

}