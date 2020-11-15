package com.testweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.board.model.BoardDAO;



public class DeletsServiceImpl implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bno = request.getParameter("bno");
		BoardDAO dao = BoardDAO.getInstance(); 
		//BoardDAO 객체에서  getInstance() 메소드를 불러온것
		dao.delete(bno);

	}

}
