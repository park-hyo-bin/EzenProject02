package com.saeyan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.saeyan.dto.BCommentVo;

import util.DBManager;

public class BCommentDAO {

	private BCommentDAO() {

	}
	
	private static BCommentDAO instance = new BCommentDAO();

	public static BCommentDAO getInstance() {
		return instance;
	}
	
	public List<BCommentVo> selectAllComment(String bNum) {
		String sql = "select * from boardcomment where bNum = ? order by writedate desc";
	List<BCommentVo> list = new ArrayList<BCommentVo>();
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		conn = DBManager.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bNum);
//		pstmt.setInt(1, pageNumber*10);
//		pstmt.setInt(2, (pageNumber-1)*10);
		
		rs = pstmt.executeQuery();

		while (rs.next()) {
			BCommentVo cVO = new BCommentVo();
			cVO.setbNum(rs.getInt("bNum"));
			cVO.setCNum(rs.getInt("cNum"));
			cVO.setUserid(rs.getString("userid"));
			cVO.setWritedate(rs.getTimestamp("writedate"));
			cVO.setbComment(rs.getString("bComment"));
			list.add(cVO);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		DBManager.close(conn, pstmt, rs);
	}
	return list;

}
	
	public BCommentVo selectOneCommentByNum(String CNum) {
		String sql = "select * from boardcomment where cNum = ?";
		BCommentVo cVO = null;

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, CNum);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					cVO = new BCommentVo();
					cVO.setbNum(rs.getInt("bNum"));
					cVO.setCNum(rs.getInt("CNum"));
					cVO.setUserid(rs.getString("userid"));
					cVO.setWritedate(rs.getTimestamp("writedate"));
					cVO.setbComment(rs.getString("bComment"));
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
		return cVO;
	}
	
	public void insertComment(BCommentVo cVo) {
		String sql = "insert into boardcomment( " + " bnum, cnum, userid, bComment) "+ " values(?, boardcomment_seq.nextval, ?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cVo.getbNum());
			pstmt.setString(2, cVo.getUserid());
			pstmt.setString(3, cVo.getbComment());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	
	public void updateComment(BCommentVo cVo) {
		String sql = "update boardcomment set userid=?, bComment=?, writedate = SYSDATE where cNum=?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cVo.getUserid());
			pstmt.setString(2, cVo.getbComment());
			pstmt.setInt(3, cVo.getCNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

	}

	public void deleteComment(String cNum) {
		String sql = "delete from boardcomment where cNum = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cNum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

	}
}
