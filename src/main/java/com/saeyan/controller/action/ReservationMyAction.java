package com.saeyan.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saeyan.dao.BookDAO;
import com.saeyan.dto.BookVo;

	public class ReservationMyAction implements Action {
		
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			String userid = (String) session.getAttribute("USERID");
			
//			String userid = request.getParameter("userid");
//			다른 아이디인 사람이 접근하면 안되니까 세션과 아이디가 일치하는지 확인

//				HttpSession session = request.getSession();
//				if(!userid.equals((String) session.getAttribute("userid"))) {
//					session.setAttribute("messageType", "오류메시지");
//					session.setAttribute("messageContent", "접근할 수 없습니다.");
//					response.sendRedirect("/BoardServlet?command=main_page");
//					return;
//				}
				
			String page_ = request.getParameter("p");
		
			int page = 1;
			if (page_ != null && !page_.equals("")) {
				page = Integer.parseInt(page_);
			}

			BookDAO rDao = BookDAO.getInstance();
			List<BookVo> RLi = rDao.getBookList(userid, page);
			request.setAttribute("RLi", RLi);
			
			int count = rDao.getRListCount(userid);
			request.setAttribute("count", count);
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/reservation/reservationMyForm.jsp");
			dispatcher.forward(request, response);
			
		}
	}

