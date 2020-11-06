package com.myweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;

public class UpdateServiceImpl implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bno = request.getParameter("bno");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//DAO객체생성, 상세보기 메서드 실행
//			BoardDAO dao = BoardDAO.getInstance();
			//BoardVO vo = dao.update(bno, title, content);
			//request.setAttribute("vo", vo);

		BoardDAO dao = BoardDAO.getInstance(); //싱글톤
		dao.update(bno, title, content);
				
	
		

	}

}
