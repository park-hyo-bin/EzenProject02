package com.saeyan.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.QuestionDAO;
import com.saeyan.dto.QuestionVo;


public class QuestionAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "question/questionList.jsp";

		String field_ = request.getParameter("f");
		String query_ = request.getParameter("q");
		String page_ = request.getParameter("p");

		String field = "qTitle";
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

	
		QuestionDAO qDao = QuestionDAO.getInstance();
		List<QuestionVo> QuestionList = qDao.getQuestionList(field, query, page);

		request.setAttribute("QList", QuestionList);

		int count = qDao.getQuestionListCount(field, query);
		request.setAttribute("count", count);

		
		
		String qNum = request.getParameter("qNum");
		QuestionVo qVo = qDao.selectOneQuestionByNum(qNum);
		request.setAttribute("OneQuestion", qVo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		

	}
}
