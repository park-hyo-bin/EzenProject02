package com.saeyan.controller.action;

import java.io.IOException;

import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class PublicfacilitiesViewAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String SVCID = request.getParameter("SVCID");
		
		ApiExplorer apiexplorer = new ApiExplorer();
		apiexplorer.execute(request, response);
		
		
		//캘린더
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		
		String paramYear = request.getParameter("year");
		String paramMonth = request.getParameter("month");
		
		if(paramYear != null) {
			year = Integer.parseInt(paramYear);
		}
		
		if(paramMonth != null) {
			month = Integer.parseInt(paramMonth);
		}
		
		if(month>12) {
			month=1;
			year++;
		}
		
		if(month<1) {
			month=12;
			year--;
		}
		
		//요청받은 년도와 월의 일자로 캘린더 클래스 세팅
		cal.set(year, month-1,1);
	
		//매월 1일의 요일
		int dayOfweek = cal.get(Calendar.DAY_OF_WEEK);
		//월의 최대 일수
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		
//		for(int i=0; i<dayOfweek-1;i++){
//				System.out.print("<td>&nbsp;</td>");
//			}
//				
//		for(int i=1; i<=lastDay;i++){
//			System.out.print("<td>"+i+"</td>");
//			;
//			
//				if((dayOfweek-1+i)%7==0){
//					System.out.print("</tr><tr>"); ;
//				}
//			}
//		
//		for(int i=0; i< (7-(dayOfweek-1+lastDay)%7)%7;i++){
//			System.out.print("<td>&nbsp;</td>");
//			}
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("dayOfweek", dayOfweek);
		request.setAttribute("lastDay", lastDay);
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/public/publicView.jsp");
		dispatcher.forward(request, response);
		
	}
	
}
