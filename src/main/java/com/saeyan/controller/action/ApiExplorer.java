package com.saeyan.controller.action;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class ApiExplorer {
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
//체육시설
			StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088");
			urlBuilder.append("/" + URLEncoder.encode("744c4b5741686f6f3132327361764b65", "UTF-8")); 
			urlBuilder.append("/" + URLEncoder.encode("json", "UTF-8")); 
			urlBuilder.append("/" + URLEncoder.encode("ListPublicReservationSport", "UTF-8"));
			urlBuilder.append("/" + URLEncoder.encode("1", "UTF-8")); 
			urlBuilder.append("/" + URLEncoder.encode("20", "UTF-8"));
		
			
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

				JSONObject jsonMain = (JSONObject) obj.get("ListPublicReservationSport");

				JSONArray jsonArr = (JSONArray) jsonMain.get("row");

				if (jsonArr.size() > 0) {
					for (int i = 0; i < jsonArr.size(); i++) {

						JSONObject jsonObj = (JSONObject) jsonArr.get(i);	
	
					}
					request.setAttribute("jsonArray", jsonArr);
				
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		
	
	}
	
}



