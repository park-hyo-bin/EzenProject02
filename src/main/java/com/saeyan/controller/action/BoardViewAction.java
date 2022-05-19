package com.saeyan.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BCommentDAO;
import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BCommentVo;
import com.saeyan.dto.BoardVo;

public class BoardViewAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
	
		String bNum = request.getParameter("bNum");
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		bDao.updateReadCount(bNum);
		
		BoardVo bVo = bDao.selectOneBoardByNum(bNum);

		request.setAttribute("board", bVo);

		BoardVo bVo2 = bDao.getNextList(Integer.parseInt(bNum));
		request.setAttribute("next", bVo2);
		
		BoardVo bVo3 = bDao.getPrevList(Integer.parseInt(bNum));
		request.setAttribute("prev", bVo3);
		
		
		BCommentDAO cDao = BCommentDAO.getInstance();

		List<BCommentVo> commentList = cDao.selectAllComment(bNum);

		request.setAttribute("commentList", commentList);
		
		
		String CNum = request.getParameter("CNum");

		BCommentVo cVO = cDao.selectOneCommentByNum(CNum);

		request.setAttribute("selectComment", cVO);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/board/boardView.jsp");
		dispatcher.forward(request, response);
		
	}
}