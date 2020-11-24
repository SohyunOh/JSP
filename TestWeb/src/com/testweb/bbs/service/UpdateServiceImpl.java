package com.testweb.bbs.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.bbs.model.BoardDAO;
import com.testweb.user.model.UserDAO;
import com.testweb.user.model.UserVO;


public class UpdateServiceImpl implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bno = request.getParameter("bno");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		

		BoardDAO dao = BoardDAO.getInstance(); //싱글톤
		dao.update(bno, title, content);
	

	}

}
