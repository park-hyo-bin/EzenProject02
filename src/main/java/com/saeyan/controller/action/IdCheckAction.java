package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.MemberDAO;


	public class IdCheckAction implements Action{
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException{
			String userid = request.getParameter("userid");
			
			MemberDAO mDao = MemberDAO.getInstance();
			
			int result = mDao.confirmID(userid);
			
			request.setAttribute("userid", userid);
			request.setAttribute("result", result);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("member/idcheck.jsp");
			dispatcher.forward(request, response);
		}
}
