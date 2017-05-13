package com.njust.domain;

/**
 * TjKey entity. @author MyEclipse Persistence Tools
 */

public class TjKey implements java.io.Serializable {

	// Fields

	private Integer kid;
	private String sheetid;
	private String sheetkey;
	private Integer keytype;
	private String choicevalue;
	private Integer keysequence;

	// Constructors

	/** default constructor */
	public TjKey() {
	}

	/** minimal constructor */
	public TjKey(String sheetid, String sheetkey, Integer keytype) {
		this.sheetid = sheetid;
		this.sheetkey = sheetkey;
		this.keytype = keytype;
	}

	/** full constructor */
	public TjKey(String sheetid, String sheetkey, Integer keytype,
			String choicevalue, Integer keysequence) {
		this.sheetid = sheetid;
		this.sheetkey = sheetkey;
		this.keytype = keytype;
		this.choicevalue = choicevalue;
		this.keysequence = keysequence;
	}

	// Property accessors

	public Integer getKid() {
		return this.kid;
	}

	public void setKid(Integer kid) {
		this.kid = kid;
	}

	public String getSheetid() {
		return this.sheetid;
	}

	public void setSheetid(String sheetid) {
		this.sheetid = sheetid;
	}

	public String getSheetkey() {
		return this.sheetkey;
	}

	public void setSheetkey(String sheetkey) {
		this.sheetkey = sheetkey;
	}

	public Integer getKeytype() {
		return this.keytype;
	}

	public void setKeytype(Integer keytype) {
		this.keytype = keytype;
	}

	public String getChoicevalue() {
		return this.choicevalue;
	}

	public void setChoicevalue(String choicevalue) {
		this.choicevalue = choicevalue;
	}

	public Integer getKeysequence() {
		return this.keysequence;
	}

	public void setKeysequence(Integer keysequence) {
		this.keysequence = keysequence;
	}

}