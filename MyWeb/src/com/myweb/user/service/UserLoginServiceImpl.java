package com.myweb.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myweb.user.model.UserDAO;
import com.myweb.user.model.UserVO;

public class UserLoginServiceImpl implements UserService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		
		//아이디 비밀번호를 받습니다.
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDAO dao = UserDAO.getInstance();
		UserVO user = dao.login(id, pw); //로그인 실패시 null
		
		if(user != null) { //로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("user", user); //세션에 회원정보 저장
			return 1;
		} else { //로그인 실패
			return 0;
		}
		
	}

	
}
