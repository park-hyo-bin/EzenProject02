package com.saeyan.controller.action;

import java.io.*;
import java.net.*;


import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.json.simple.*;
import org.json.simple.parser.JSONParser;


public class ApiExplorer {
	
	// 공공시설 리스트
	public void execute(int page, String Code, String category, String field, String query, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088");
		urlBuilder.append("/" + URLEncoder.encode("52716b686a686f6f33357a6a436e47", "UTF-8"));
		urlBuilder.append("/" + URLEncoder.encode("json", "UTF-8"));
		urlBuilder.append("/" + URLEncoder.encode("ListPublicReservation" + Code, "UTF-8"));
		urlBuilder.append("/" + URLEncoder.encode(Integer.toString(1 + (page - 1) * 10), "UTF-8"));
		urlBuilder.append("/" + URLEncoder.encode(Integer.toString(page * 10), "UTF-8"));
		urlBuilder.append("/" + URLEncoder.encode(category, "UTF-8"));

		try {

			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			BufferedReader rd;

			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();

			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(new StringReader(sb.toString()));

			JSONObject jsonMain = (JSONObject) obj.get("ListPublicReservation" + Code);
			Object list_total_count = jsonMain.get("list_total_count");
			
			JSONArray jsonArr = (JSONArray) jsonMain.get("row");
			
			request.setAttribute("count", list_total_count);
			request.setAttribute("jsonArray", jsonArr);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	

	//공공시설 상세보기
		public void execute(String SVCID, HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088");
			urlBuilder.append("/" + URLEncoder.encode("52716b686a686f6f33357a6a436e47", "UTF-8"));
			urlBuilder.append("/" + URLEncoder.encode("json", "UTF-8"));
			urlBuilder.append("/" + URLEncoder.encode("ListPublicReservationDetail", "UTF-8"));
			urlBuilder.append("/" + URLEncoder.encode("1", "UTF-8"));
			urlBuilder.append("/" + URLEncoder.encode("5", "UTF-8"));
			urlBuilder.append("/" + URLEncoder.encode(SVCID, "UTF-8"));

			try {

				URL url = new URL(urlBuilder.toString());
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Content-type", "application/json");
				System.out.println("Response code: " + conn.getResponseCode());
				BufferedReader rd;

				if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
					rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				} else {
					rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
				}
				StringBuilder sb = new StringBuilder();
				String line;
				while ((line = rd.readLine()) != null) {
					sb.append(line);
				}
				rd.close();
				conn.disconnect();

				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(new StringReader(sb.toString()));

				JSONObject jsonMain = (JSONObject) obj.get("ListPublicReservationDetail");

				JSONArray DjsonArr = (JSONArray) jsonMain.get("row");

				Object SVCNM = null;
				if (DjsonArr.size() > 0) {
					for (int i = 0; i < DjsonArr.size(); i++) {

						JSONObject jsonObj = (JSONObject) DjsonArr.get(i);
						
						SVCNM = jsonObj.get("SVCNM");

					}
					request.setAttribute("Djson", DjsonArr);
					request.setAttribute("SVCNM", SVCNM);

				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		
	}

}
