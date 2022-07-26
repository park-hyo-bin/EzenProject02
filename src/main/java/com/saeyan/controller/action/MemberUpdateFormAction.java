package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saeyan.dao.MemberDAO;
import com.saeyan.dto.MemberVo;

public class MemberUpdateFormAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("USERID");
		
//		String userid = request.getParameter("userid");
	
//		다른 아이디인 사람이 접근하면 안되니까 세션과 아이디가 일치하는지 확인

//			HttpSession session = request.getSession();
//			if(!userid.equals((String) session.getAttribute("userid"))) {
//				session.setAttribute("messageType", "오류메시지");
//				session.setAttribute("messageContent", "접근할 수 없습니다.");
//				response.sendRedirect("/BoardServlet?command=main_page");
//				return;
//			}

		MemberDAO mDao = MemberDAO.getInstance();
		
		MemberVo mVO = mDao.getMember(userid);
		
		request.setAttribute("mVO", mVO);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/memberUpdate.jsp");
		dispatcher.forward(request, response);

	}
}
