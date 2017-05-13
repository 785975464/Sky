package com.njust.domain;

/**
 * Message entity. @author MyEclipse Persistence Tools
 */

public class Message implements java.io.Serializable {

	// Fields

	private Integer mid;
	private String sendId;
	private String recId;
	private Integer messageId;
	private Integer statue;

	// Constructors

	/** default constructor */
	public Message() {
	}

	/** full constructor */
	public Message(String sendId, String recId, Integer messageId,
			Integer statue) {
		this.sendId = sendId;
		this.recId = recId;
		this.messageId = messageId;
		this.statue = statue;
	}

	// Property accessors

	public Integer getMid() {
		return this.mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getSendId() {
		return this.sendId;
	}

	public void setSendId(String sendId) {
		this.sendId = sendId;
	}

	public String getRecId() {
		return this.recId;
	}

	public void setRecId(String recId) {
		this.recId = recId;
	}

	public Integer getMessageId() {
		return this.messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public Integer getStatue() {
		return this.statue;
	}

	public void setStatue(Integer statue) {
		this.statue = statue;
	}

}