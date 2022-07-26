package com.saeyan.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BoardDAO;
import com.saeyan.dao.QuestionDAO;
import com.saeyan.dto.BoardVo;
import com.saeyan.dto.QuestionVo;


public class MainPageAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/main.jsp";
		
		BoardDAO bDao = BoardDAO.getInstance();
		List<BoardVo> boardNewsList = bDao.getNewBoardList();

		request.setAttribute("boardNewsList", boardNewsList);
		
		
		

		
		QuestionDAO qDao = QuestionDAO.getInstance();
		List<QuestionVo> NewsquestionList = qDao.getNewsQuestionList();

		request.setAttribute("NQList", NewsquestionList);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
