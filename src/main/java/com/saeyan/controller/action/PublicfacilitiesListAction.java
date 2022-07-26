package com.saeyan.controller.action;


import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;


	public class PublicfacilitiesListAction implements Action {
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
	
			String Code = request.getParameter("Code");
			request.setAttribute("Code", Code);	
			
			String field_ = request.getParameter("f");
			String query_ = request.getParameter("q");
			String page_ = request.getParameter("p");
			String category_=request.getParameter("c");
			
			String category = "";
			if (category_ != null && !category_.equals("")) {
				category = category_;
			}
			
			String field = "SVCNM";
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

			ApiExplorer apiexplorer = new ApiExplorer();
			apiexplorer.execute(page, Code, category, field, query,  request, response);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/public/publicList.jsp");
			dispatcher.forward(request, response);

		}
	}

