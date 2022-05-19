package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.saeyan.dao.BoardDAO;
import com.saeyan.dto.BoardVo;


public class BoardUpdateAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		ServletContext context = request.getServletContext();
		String path = context.getRealPath("upload");
		String encType = "UTF-8";
		int sizeLimit = 20 * 1024 *1024;
		
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());

		String pictureUrl = multi.getFilesystemName("pictureUrl");
		
		if(pictureUrl == null) {
			pictureUrl=multi.getParameter("nomakeImg");
		}
		
		BoardVo bVo = new BoardVo();
			
		bVo.setbNum(Integer.parseInt(multi.getParameter("bNum")));
		bVo.setUserid(multi.getParameter("userid"));
		bVo.setbTitle(multi.getParameter("bTitle"));
		bVo.setbContent(multi.getParameter("bContent"));
		bVo.setPictureUrl(multi.getFilesystemName("pictureUrl"));

		BoardDAO bDao = BoardDAO.getInstance();
		bDao.updateBoard(bVo);

		new BoardListAction().execute(request, response);

	}
}