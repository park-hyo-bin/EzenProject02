package com.saeyan.dto;
 
import java.sql.Timestamp;

public class BookVo {
	private int rNum;
	private String userId;
	private String publicName;
	private Timestamp rDate;
	private String svcDate;
		
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPublicName() {
		return publicName;
	}
	public void setPublicName(String publicName) {
		this.publicName = publicName;
	}
	public Timestamp getrDate() {
		return rDate;
	}
	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}
	public String getSvcDate() {
		return svcDate;
	}
	public void setSvcDate(String svcDate) {
		this.svcDate = svcDate;
	}
	

	
	
}
