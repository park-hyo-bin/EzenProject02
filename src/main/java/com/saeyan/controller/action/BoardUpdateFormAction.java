package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVo;

public class BoardUpdateFormAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		String url = "/board/boardUpdate.jsp";
		
		String bNum = request.getParameter("bNum");
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		bDao.updateReadCount(bNum);
		
		BoardVo bVo = bDao.selectOneBoardByNum(bNum);
		
		request.setAttribute("board", bVo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}