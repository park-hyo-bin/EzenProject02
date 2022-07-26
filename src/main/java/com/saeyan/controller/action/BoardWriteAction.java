package com.saeyan.controller.action;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVo;

public class BoardWriteAction implements Action {
@Override
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String savePath = "upload";
	int uploadFileSizeLimit = 5 * 1024 * 1024;
	String encType = "UTF-8";
	
	ServletContext context= request.getServletContext();
	String uploadFilePath = context.getRealPath(savePath);
	
	try {
		MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
		Enumeration<?> files = multi.getFileNames();
			
		while(files.hasMoreElements()) {
			String file =(String) files.nextElement();
			String file_name = multi.getFilesystemName(file);
			String ori_file_name = multi.getOriginalFileName(file);
			
			System.out.print("파일 업로드 완료(업로드 파일명 : "+file_name+" 원본 파일명 : "+ori_file_name+")");
			
		}
		
		BoardVo bVo = new BoardVo();
		
		bVo.setUserid(multi.getParameter("userid"));
		bVo.setbTitle(multi.getParameter("bTitle"));
		bVo.setbContent(multi.getParameter("bContent"));
		bVo.setUploadFile01(multi.getFilesystemName("uploadFile01"));
		bVo.setUploadFile02(multi.getFilesystemName("uploadFile02"));
		bVo.setUploadFile03(multi.getFilesystemName("uploadFile03"));
	
		
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.insertBoard(bVo);
		
		new BoardListAction().execute(request, response);
		
		
		
	}catch(Exception e) {
		System.out.print("예외발생 : "+ e);
	}
	
//	ServletContext context = request.getServletContext();
//	String path = context.getRealPath("upload");
//	String encType = "UTF-8";
//	int sizeLimit = 20 * 1024 * 1024;
//
//	MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());

//	BoardVo bVo = new BoardVo();
//
//	bVo.setUserid(multi.getParameter("userid"));
//	bVo.setbTitle(multi.getParameter("bTitle"));
//	bVo.setbContent(multi.getParameter("bContent"));
//	bVo.setPictureUrl(multi.getFilesystemName("pictureUrl"));
//
//	
//	BoardDAO bDao = BoardDAO.getInstance();
//	bDao.insertBoard(bVo);
//	
//	new BoardListAction().execute(request, response);

}



}
