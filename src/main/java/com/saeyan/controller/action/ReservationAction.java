package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BookDAO;
import com.saeyan.dto.BookVo;


	public class ReservationAction implements Action {
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			BookVo rVo = new BookVo();
			rVo.setUserId(request.getParameter("writerID"));
			rVo.setPublicName(request.getParameter("PublicName"));
			rVo.setSvcDate(request.getParameter("PublicDate"));
			
			BookDAO bDao = BookDAO.getInstance();
			bDao.insertReservation(rVo);

			response.sendRedirect("BoardServlet?command=reservation_my_form");
			
			
			
		}
	}

