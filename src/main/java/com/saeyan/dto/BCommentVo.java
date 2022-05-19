package com.saeyan.dto;

import java.sql.Timestamp;

public class BCommentVo {
	private int bNum;
	private int CNum;
	private String userid;
	private String bComment;
	private Timestamp writedate;
	
	
	
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public int getCNum() {
		return CNum;
	}
	public void setCNum(int cNum) {
		CNum = cNum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String name) {
		this.userid = name;
	}
	public String getbComment() {
		return bComment;
	}
	public void setbComment(String bComment) {
		this.bComment = bComment;
	}
	public Timestamp getWritedate() {
		return writedate;
	}
	public void setWritedate(Timestamp writedate) {
		this.writedate = writedate;
	}
	
}
