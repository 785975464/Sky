package com.njust.domain;

/**
 * Messagetext entity. @author MyEclipse Persistence Tools
 */

public class Messagetext implements java.io.Serializable {

	// Fields

	private Integer messageId;
	private String text;
	private String pdate;
	private String sender;
	private String receiver;
	private String senderlevel;
	private String receiverlevel;
	private String visionlevel;
	private String isrecheck;
	// Constructors

	/** default constructor */
	public Messagetext() {
	}

	public Messagetext(String text, String pdate, String sender, String receiver,
			String senderlevel, String receiverlevel, String visionlevel, String isrecheck) {
		this.text = text;
		this.pdate = pdate;
		//新增字段，发送者。接收者 2016-1-4
		this.sender = sender;
		this.receiver = receiver;
		this.senderlevel = senderlevel;
		this.receiverlevel = receiverlevel;
		this.visionlevel = visionlevel;
		this.isrecheck = isrecheck;
	}

	// Property accessors

	public Integer getMessageId() {
		return this.messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getPdate() {
		return this.pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	//新增字段，发送者。接收者 2016-1-4
	public String getSender() {
		return this.sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return this.receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	public String getSenderlevel() {
		return this.senderlevel;
	}
	public void setSenderlevel(String senderlevel) {
		this.senderlevel = senderlevel;
	}
	public String getReceiverlevel() {
		return this.receiverlevel;
	}
	public void setReceiverlevel(String receiverlevel) {
		this.receiverlevel = receiverlevel;
	}

	public String getVisionlevel() {
		return visionlevel;
	}

	public void setVisionlevel(String visionlevel) {
		this.visionlevel = visionlevel;
	}

	public String getIsrecheck() {
		return isrecheck;
	}

	public void setIsrecheck(String isrecheck) {
		this.isrecheck = isrecheck;
	}
}