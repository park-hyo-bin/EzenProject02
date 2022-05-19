package com.saeyan.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BookDAO;
import com.saeyan.dto.BookVo;


public class ReservationViewAction implements Action {
	
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rNum = request.getParameter("rNum");
		
		System.out.println(rNum);
		
		BookDAO rDao = BookDAO.getInstance();

		BookVo rVo = rDao.selectOneBookByNum(rNum);

		request.setAttribute("reserV", rVo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("BoardServlet?command=reservation_my_form");
		dispatcher.forward(request, response);
		

	}
}
