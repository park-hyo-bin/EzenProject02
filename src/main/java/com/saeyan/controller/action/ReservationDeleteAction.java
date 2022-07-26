package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saeyan.dao.BookDAO;

public class ReservationDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		String rNum = request.getParameter("rNum");
		
		BookDAO rDao = BookDAO.getInstance();
		rDao.deleteReservation(rNum);
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("USERID");
		
		String sql = "/BoardServlet?command=reservation_my_form&userid="+ userid;
		RequestDispatcher dispatcher = request.getRequestDispatcher(sql);
		dispatcher.forward(request, response);
	}
}
