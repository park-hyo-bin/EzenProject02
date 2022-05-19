package com.saeyan.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.saeyan.dto.PublicVo;

import util.DBManager;


public class PublicDAO {
	
	private PublicDAO() {

	}
	
	private static PublicDAO instance = new PublicDAO();

	public static PublicDAO getInstance() {
		return instance;
	}
	

	
	public List<PublicVo> getPublicList(){
		return getPublicList("svcid","",1);
	}
	
	public List<PublicVo> getPublicList(int page){
		return getPublicList("svcid","",page);
	}
	
	public List<PublicVo> getPublicList(String field, String query, int page){
		List<PublicVo> list = new ArrayList<>();
		
		String sql =  
				"SELECT * From ( "
				+ " select Rownum num, newp.* "
				+ " FROM (select * FROM publicList where "+ field +" like ? ORDER BY svcid desc) newp "
				+ ") "
				+ " where num between ? and ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "%"+query+"%");
			pstmt.setInt(2, 1+(page-1)*10);
			pstmt.setInt(3, page*10);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PublicVo pVo = new PublicVo();
				pVo.setSvcid(rs.getString("svcid"));
				list.add(pVo);
			}
	}catch (Exception e) {
		e.printStackTrace();
	}
	return list;

}

	
	public int getPublicCount() {
		return getPublicCount("pNum","");
	}
	
	public int getPublicCount(String field, String query) {
		int count = 0;
		
		String sql = "SELECT COUNT(svcid) COUNT FROM ( "
				+ " select rownum num, newp.* " 
				+ " from (select * from publicList where "+field+" like ? "
				+ " ORDER BY svcid desc) newp " +" )";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+query+"%");
			rs = pstmt.executeQuery();

			if(rs.next()) {
				count = rs.getInt("count");
			}
			
			
	}catch (Exception e) {
		e.printStackTrace();
	}
		return count;
	}
	
	

}