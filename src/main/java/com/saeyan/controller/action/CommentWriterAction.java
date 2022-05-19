package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BCommentDAO;
import com.saeyan.dto.BCommentVo;

public class CommentWriterAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BCommentVo cVo = new BCommentVo();
		cVo.setbNum(Integer.parseInt(request.getParameter("bNum")));
		cVo.setUserid(request.getParameter("writer"));
		cVo.setbComment(request.getParameter("bComment"));

		BCommentDAO bDao = BCommentDAO.getInstance();
		bDao.insertComment(cVo);
		
		
		int bNum= Integer.parseInt(request.getParameter("bNum"));
		
		String sql = "BoardServlet?command=board_view&bNum="+ bNum;
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(sql);
		dispatcher.forward(request, response);
	}
}
