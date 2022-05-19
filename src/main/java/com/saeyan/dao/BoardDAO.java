package com.saeyan.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.saeyan.dto.BoardVo;

import util.DBManager;

public class BoardDAO {
	
	private BoardDAO() {

	}
	
	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}
	
	public void insertBoard(BoardVo bVo) {
		String sql = "insert into pjboard(" + "bnum, btitle, name, bcontent, pictureUrl)"+ "values(pjboard_seq.nextval, ?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bVo.getbTitle());
			pstmt.setString(2, bVo.getUserid());
			pstmt.setString(3, bVo.getbContent());
			pstmt.setString(4, bVo.getPictureUrl());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public void updateReadCount(String bnum) {
		String sql = "update pjboard set readcount = readcount+1 where bnum=?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bnum);
		
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

	}
	
	public BoardVo selectOneBoardByNum(String bNum) {
		String sql = "select * from pjboard where bnum = ?";
		BoardVo bVo = null;

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bNum);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					bVo = new BoardVo();
					bVo.setbNum(rs.getInt("bNum"));
					bVo.setUserid(rs.getString("userid"));
					bVo.setbTitle(rs.getString("bTitle"));
					bVo.setbContent(rs.getString("bContent"));
					bVo.setPictureUrl(rs.getString("pictureUrl"));
					bVo.setWritedate(rs.getTimestamp("writedate"));
					bVo.setReadcount(rs.getInt("readcount"));
				
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
		return bVo;
	}
	
	public void updateBoard(BoardVo bVo) {
		String sql = "update pjboard set bTitle=?, bContent=? where bNum=?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bVo.getbTitle());
			pstmt.setString(2, bVo.getbContent());
			pstmt.setInt(3, bVo.getbNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

	}

	public void deleteBoard(String bNum) {
		String sql = "delete from pjboard where bNum = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bNum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

	}
	

//	------------------------
	
	public List<BoardVo> getBoardList(){
		return getBoardList("bTitle","",1);
	}
	
	public List<BoardVo> getBoardList(int page){
		return getBoardList("bTitle","",page);
	}
	
	public List<BoardVo> getBoardList(String field, String query, int page){
		List<BoardVo> list = new ArrayList<>();
		
		String sql =  
				"SELECT * From ( "
				+ " select Rownum num, newpj.* "
				+ " FROM (select * FROM pjboard where "+ field +" like ? ORDER BY writedate desc) newpj "
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
				BoardVo bVo = new BoardVo();
				bVo.setbNum(rs.getInt("bNum"));
				bVo.setUserid(rs.getString("userid"));
				bVo.setbTitle(rs.getString("bTitle"));
				bVo.setbContent(rs.getString("bContent"));
				bVo.setPictureUrl(rs.getString("pictureUrl"));
				bVo.setWritedate(rs.getTimestamp("writedate"));
				bVo.setReadcount(rs.getInt("readcount"));
			
				list.add(bVo);
			}
	}catch (Exception e) {
		e.printStackTrace();
	}
	return list;

}
		
	
	public int getListCount() {
		return getListCount("bTitle","");
	}
	
	public int getListCount(String field, String query) {
		int count = 0;
		
		String sql = "SELECT COUNT(bnum) COUNT FROM ( "
				+ " select rownum num, newpj.* " 
				+ " from (select * from pjboard where "+field+" like ? "
				+ " ORDER BY writedate desc) newpj " +" )";
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
	
	
	public BoardVo getNextList(int bNum) {
		BoardVo bVo = null;
		String sql = "select * from pjboard "
				+ " where bnum = ( " 
				+ " select bnum from pjboard where writedate > "
				+ " (select writedate from pjboard where bnum=?) "
				+ " and rownum = 1)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bVo = new BoardVo();
				bVo.setbNum(rs.getInt(1));
				bVo.setUserid(rs.getString(2));
				bVo.setbTitle(rs.getString(3));
				bVo.setbContent(rs.getString(4));
				bVo.setPictureUrl(rs.getString(5));
				bVo.setWritedate(rs.getTimestamp(6));
	
			}
	}catch (Exception e) {
		e.printStackTrace();
	}
		return bVo;
	}
	
	public BoardVo getPrevList(int bNum) {
		BoardVo bVo = null;
		String sql=
				"select * from (select * from pjboard order by writedate desc) "
				+" where writedate < (select writedate from pjboard where bnum = ?) "
				+" and rownum = 1";
				
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bVo = new BoardVo();
				bVo.setbNum(rs.getInt(1));
				bVo.setUserid(rs.getString(2));
				bVo.setbTitle(rs.getString(3));
				bVo.setbContent(rs.getString(4));
				bVo.setPictureUrl(rs.getString(5));
				bVo.setWritedate(rs.getTimestamp(6));
	
			}
	}catch (Exception e) {
		e.printStackTrace();
	}
		return bVo;
	}
	
	
	
	
	

	
}