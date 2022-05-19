package com.saeyan.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.saeyan.dto.BookVo;

import util.DBManager;



public class BookDAO {
	
	private BookDAO() {

	}
	
	private static BookDAO instance = new BookDAO();

	public static BookDAO getInstance() {
		return instance;
	}

//	public List<BoardVo> selectAllBoards() {
////		String sql = "select * from pjboard where boardGroup > (select max(boardGroup) from pjboard) - ? AND boardGroup <=(select MAX(boardGroup) from pjboard) - ? order by boardGroup DESC, boardSequence asc";
//			String sql =	"select * from pjboard order by writedate desc";
//		List<BoardVo> list = new ArrayList<BoardVo>();
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//			conn = DBManager.getConnection();
//			pstmt = conn.prepareStatement(sql);
////			pstmt.setInt(1, pageNumber*10);
////			pstmt.setInt(2, (pageNumber-1)*10);
//			
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				BoardVo bVo = new BoardVo();
//				bVo.setbNum(rs.getInt("bNum"));
//				bVo.setName(rs.getString("Name"));
//				bVo.setbTitle(rs.getString("bTitle"));
//				bVo.setbContent(rs.getString("bContent"));
//				bVo.setPictureUrl(rs.getString("pictureUrl"));
//				bVo.setWritedate(rs.getTimestamp("writedate"));
//				bVo.setReadcount(rs.getInt("readcount"));
//				bVo.setBoardGroup(rs.getInt("boardGroup"));
//				bVo.setBoardSequence(rs.getInt("boardSequence"));
//				bVo.setAvailable(rs.getInt("Available"));
//				list.add(bVo);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManager.close(conn, pstmt, rs);
//		}
//		return list;
//
//	}
	
	
	public void insertReservation(BookVo rVo) {
		String sql = "insert into reservation(" + "rnum, userid, publicName, svcdate)"+ "values(reservation_seq.nextval, ?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rVo.getUserId());
			pstmt.setString(2, rVo.getPublicName());
			pstmt.setString(3, rVo.getSvcDate());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	
	public BookVo selectOneBookByNum(String rNum) {
		String sql = "select * from reservation where rnum = ?";
		BookVo rVo = null;

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, rNum);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					rVo = new BookVo();
					rVo.setrNum(rs.getInt("rNum"));
					rVo.setUserId(rs.getString("userid"));
					rVo.setPublicName(rs.getString("publicName"));
					rVo.setrDate(rs.getTimestamp("rDate"));
					rVo.setSvcDate(rs.getString("svcDate"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
		return rVo;
	}
	
	

	public void deleteReservation(String rNum) {
		String sql = "delete from reservation where rNum = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rNum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

	}
	

//	------------------------

	
	public List<BookVo> getBookList(String userid, int page){
		List<BookVo> list = new ArrayList<>();
		
		String sql =  
				"SELECT * From ( "
				+ " select Rownum num, newre.* "
				+ " FROM (select * FROM reservation where userid = ? ORDER BY rDate desc) newre "
				+ ") "
				+ " where num between ? and ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userid);
			pstmt.setInt(2, 1+(page-1)*10);
			pstmt.setInt(3, page*10);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BookVo rVo = new BookVo();
				rVo.setrNum(rs.getInt("rNum"));
				rVo.setUserId(rs.getString("userid"));
				rVo.setPublicName(rs.getString("publicName"));
				rVo.setrDate(rs.getTimestamp("rDate"));
				rVo.setSvcDate(rs.getString("svcDate"));
				list.add(rVo);
			}
	}catch (Exception e) {
		e.printStackTrace();
	}
	return list;

}
	
	

	
	public int getRListCount(String userid) {
		int count = 0;
		
		String sql = "SELECT COUNT(rnum) COUNT FROM ( "
				+ " select rownum num, newre.* " 
				+ " from (select * from reservation where userid= ?"
				+ " ORDER BY rDate desc) newre " +" )";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
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