package com.myweb.user.service;

import java.io.DataOutput;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.myweb.user.model.UserDAO;
import com.myweb.user.model.UserVO;

public class UserDeleteServiceImpl implements UserService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		
		//비밀번호는 화면에서 넘어옵니다.
		String pw = request.getParameter("pw");
		//아이디는 세션
		HttpSession session = request.getSession();
		UserVO vo = (UserVO)session.getAttribute("user");
		String id =vo.getId();
		
		//1. login메서드로 유효성 확인		
		UserDAO dao = UserDAO.getInstance();
		UserVO result = dao.login(id, pw); //실패시 null반환
		
		
		if(result != null) { //비밀번호가 맞는 경우 (회원탈퇴진행)
			dao.delete(id); //삭제라고 가정
			session.invalidate();
			return 1;
		}else {
			return 0;
		}
		
		
	}

}
