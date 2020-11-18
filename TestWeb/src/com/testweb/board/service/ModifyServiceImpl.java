package com.testweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.user.model.UserVO;

public class ModifyServiceImpl implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		//로그인 id
		UserVO login =  (UserVO) session.getAttribute("login");
		String id = login.getId();
		
		//작성하 id
		String checkId = request.getParameter("id");
		
		if(id.equals(checkId)) {//같음
			request.setAttribute("modify", 1);
		} else {//다름
			request.setAttribute("modify", 0);
		}
		
		

	}

}
