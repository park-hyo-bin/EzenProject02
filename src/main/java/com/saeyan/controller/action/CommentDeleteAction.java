package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BCommentDAO;

public class CommentDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		String cNum = request.getParameter("CNum");
	
		BCommentDAO cDao = BCommentDAO.getInstance();
		cDao.deleteComment(cNum);
		
		int bNum= Integer.parseInt(request.getParameter("bNum"));
		
		String sql = "BoardServlet?command=board_view&bNum="+ bNum;
		RequestDispatcher dispatcher = request.getRequestDispatcher(sql);
		dispatcher.forward(request, response);

	}
}