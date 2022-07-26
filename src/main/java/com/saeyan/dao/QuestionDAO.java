package com.saeyan.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.saeyan.dto.QuestionVo;

import util.DBManager;

public class QuestionDAO {
	
	private QuestionDAO() {

	}
	
	private static QuestionDAO instance = new QuestionDAO();

	public static QuestionDAO getInstance() {
		return instance;
	}
	
//	public void insertBoard(BoardVo bVo) {
//		String sql = "insert into pjboard(" + "bnum, btitle, userid, bcontent, uploadFile01, uploadFile02, uploadFile03)"+ "values(pjboard_seq.nextval, ?,?,?,?,?,?)";
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		try {
//			conn = DBManager.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, bVo.getbTitle());
//			pstmt.setString(2, bVo.getUserid());
//			pstmt.setString(3, bVo.getbContent());
//			pstmt.setString(4, bVo.getUploadFile01());
//			pstmt.setString(5, bVo.getUploadFile02());
//			pstmt.setString(6, bVo.getUploadFile03());
//			pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBManager.close(conn, pstmt);
//		}
//	}
//	
//	public void updateReadCount(String bnum) {
//		String sql = "update pjboard set readcount = readcount+1 where bnum=?";
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//
//		try {
//			conn = DBManager.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, bnum);
//		
//			pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBManager.close(conn, pstmt);
//		}
//
//	}
	
	public QuestionVo selectOneQuestionByNum(String qNum) {
		String sql = "select * from questionboard where qnum = ?";
		QuestionVo qVo = null;

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, qNum);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					qVo = new QuestionVo();
					qVo.setqNum(rs.getInt("qNum"));
					qVo.setUserid(rs.getString("userid"));
					qVo.setqTitle(rs.getString("qTitle"));
					qVo.setqContent(rs.getString("qContent"));
				
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
		return qVo;
	}
	
//	public void updateBoard(BoardVo bVo) {
//		String sql = "update pjboard set bTitle=?, bContent=? where bNum=?";
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//
//		try {
//			conn = DBManager.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, bVo.getbTitle());
//			pstmt.setString(2, bVo.getbContent());
//			pstmt.setInt(3, bVo.getbNum());
//			pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManager.close(conn, pstmt);
//		}
//
//	}
//
//	public void deleteBoard(String bNum) {
//		String sql = "delete from pjboard where bNum = ?";
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//
//		try {
//			conn = DBManager.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, bNum);
//			pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManager.close(conn, pstmt);
//		}
//
//	}
	

//	------------------------
	
	public List<QuestionVo> getQuestionList(){
		return getQuestionList("qTitle","",1);
	}
	
	public List<QuestionVo> getQuestionList(int page){
		return getQuestionList("qTitle","",page);
	}
	
	public List<QuestionVo> getQuestionList(String field, String query, int page){
		List<QuestionVo> list = new ArrayList<>();
		
		String sql =  
				"SELECT * From ( "
				+ " select Rownum num, newq.* "
				+ " FROM (select * FROM questionboard where "+ field +" like ? ORDER BY qnum desc) newq "
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
				QuestionVo qVo = new QuestionVo();
				qVo.setqNum(rs.getInt("qNum"));
				qVo.setUserid(rs.getString("userid"));
				qVo.setqTitle(rs.getString("qTitle"));
				qVo.setqContent(rs.getString("qContent"));
			
				list.add(qVo);
			}
	}catch (Exception e) {
		e.printStackTrace();
	}
	return list;

}
		
	
	public int getQuestionListCount() {
		return getQuestionListCount("qTitle","");
	}
	
	public int getQuestionListCount(String field, String query) {
		int count = 0;
		
		String sql = "SELECT COUNT(qnum) COUNT FROM ( "
				+ " select rownum num, newq.* " 
				+ " from (select * from questionboard where "+field+" like ? "
				+ " ORDER BY qnum desc) newq " +" )";
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
	

	
	
//	public BoardVo getNextList(int bNum) {
//		BoardVo bVo = null;
//		String sql = "select * from pjboard "
//				+ " where bnum = ( " 
//				+ " select bnum from pjboard where writedate > "
//				+ " (select writedate from pjboard where bnum=?) "
//				+ " and rownum = 1)";
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			conn = DBManager.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, bNum);
//
//			rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				bVo = new BoardVo();
//				bVo.setbNum(rs.getInt(1));
//				bVo.setUserid(rs.getString(2));
//				bVo.setbTitle(rs.getString(3));
//				bVo.setbContent(rs.getString(4));
//				bVo.setWritedate(rs.getTimestamp(5));
//				bVo.setUploadFile01(rs.getString(7));
//				bVo.setUploadFile02(rs.getString(8));
//				bVo.setUploadFile03(rs.getString(9));
//	
//			}
//	}catch (Exception e) {
//		e.printStackTrace();
//	}
//		return bVo;
//	}
//	
//	public BoardVo getPrevList(int bNum) {
//		BoardVo bVo = null;
//		String sql=
//				"select * from (select * from pjboard order by writedate desc) "
//				+" where writedate < (select writedate from pjboard where bnum = ?) "
//				+" and rownum = 1";
//				
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			conn = DBManager.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, bNum);
//
//			rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				bVo = new BoardVo();
//				bVo.setbNum(rs.getInt(1));
//				bVo.setUserid(rs.getString(2));
//				bVo.setbTitle(rs.getString(3));
//				bVo.setbContent(rs.getString(4));
//				bVo.setWritedate(rs.getTimestamp(5));
//				bVo.setUploadFile01(rs.getString(7));
//				bVo.setUploadFile02(rs.getString(8));
//				bVo.setUploadFile03(rs.getString(9));
//	
//			}
//	}catch (Exception e) {
//		e.printStackTrace();
//	}
//		return bVo;
//	}
	
	public List<QuestionVo> getNewsQuestionList(){//메인화면의  목록
		List<QuestionVo> list = new ArrayList<>();
		
		String sql =  
				"SELECT * From ( "
				+ " select Rownum num, newq.* "
				+ " FROM (select * FROM questionboard ORDER BY qnum desc) newq "
				+ ") "
				+ " where num between 1 and 5";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				QuestionVo qVo = new QuestionVo();
				qVo.setqNum(rs.getInt("qNum"));
				qVo.setUserid(rs.getString("userid"));
				qVo.setqTitle(rs.getString("qTitle"));
				qVo.setqContent(rs.getString("qContent"));

			
				list.add(qVo);
			}
	}catch (Exception e) {
		e.printStackTrace();
	}
	return list;

}

	
}