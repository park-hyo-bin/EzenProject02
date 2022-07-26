package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BoardDAO;
 
public class BoardDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		String bNum = request.getParameter("bNum");
		
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.deleteBoard(bNum);
		
		new BoardListAction().execute(request, response);
	}
} 