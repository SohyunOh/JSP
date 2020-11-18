package com.testweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.user.model.UserVO;

public class ModifyCheckServiceImpl implements  BoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		//작성자 
		String writer = request.getParameter("writer");
		//로그인 id
		HttpSession session = request.getSession();
		UserVO login = (UserVO) session.getAttribute("login");
		String id = login.getId();
		
		if(writer.equals(id)) {//작성자 = 로그인
			request.setAttribute("check", 1);
		} else {//작성자 != 로그인
			request.setAttribute("check", 0);
		}
		
			

	}

}
