package com.saeyan.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVo;

public class BoardListAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		String page_ = request.getParameter("p");

		String field = "bTitle";
		if (field_ != null && !field_.equals("")) {
			field = field_;
		}

		String query = "";
		if (query_ != null && !query_.equals("")) {
			query = query_;
		}
		
		int page = 1;
		if (page_ != null && !page_.equals("")) {
			page = Integer.parseInt(page_);
		}

	
		BoardDAO bDao = BoardDAO.getInstance();
		List<BoardVo> boardList = bDao.getBoardList(field, query, page);

		request.setAttribute("boardList", boardList);

		int count = bDao.getListCount(field, query);
		request.setAttribute("count", count);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/board/boardList.jsp");
		dispatcher.forward(request, response);
		

	}
}
