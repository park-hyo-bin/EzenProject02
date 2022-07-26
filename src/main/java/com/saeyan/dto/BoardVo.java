package com.saeyan.dto;

import java.sql.Timestamp;

public class BoardVo {
	private int bNum;
	private String userid;
	private String bTitle;
	private String bContent;
	private Timestamp writedate;
	private int readcount;
	private String uploadFile01;
	private String uploadFile02;
	private String uploadFile03;
	
	
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getUploadFile01() {
		return uploadFile01;
	}
	public void setUploadFile01(String uploadFile01) {
		this.uploadFile01 = uploadFile01;
	}
	public String getUploadFile02() {
		return uploadFile02;
	}
	public void setUploadFile02(String uploadFile02) {
		this.uploadFile02 = uploadFile02;
	}
	public String getUploadFile03() {
		return uploadFile03;
	}
	public void setUploadFile03(String uploadFile03) {
		this.uploadFile03 = uploadFile03;
	}
	public Timestamp getWritedate() {
		return writedate;
	}
	public void setWritedate(Timestamp writedate) {
		this.writedate = writedate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
	
	
	
	
}
