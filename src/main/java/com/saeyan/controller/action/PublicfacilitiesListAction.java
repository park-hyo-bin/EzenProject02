package com.saeyan.controller.action;


import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.PublicDAO;
import com.saeyan.dto.PublicVo;


	public class PublicfacilitiesListAction implements Action {
		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			
			ApiExplorer apiexplorer = new ApiExplorer();
			apiexplorer.execute(request, response);

			String field_ = request.getParameter("f");
			String query_ = request.getParameter("q");
			String page_ = request.getParameter("p");

			String field = "svcid";
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

		
			PublicDAO pDao = PublicDAO.getInstance();
//			List<PublicVo> publicList = pDao.getPublicList(field, query, page);
//
//			request.setAttribute("publicList", publicList);

//			int count = pDao.getPublicCount(field, query);
//			request.setAttribute("count", count);

			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/public/publicList.jsp");
			dispatcher.forward(request, response);

		}
	}

