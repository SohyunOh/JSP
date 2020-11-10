package com.testweb.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.user.model.UserDAO;
import com.testweb.user.model.UserVO;


public class UserJoinServiceImpl implements UserService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("ph1")+ "-" + request.getParameter("ph2")+ "-" +request.getParameter("ph3");
		String email = request.getParameter("email") + "@" + request.getParameter("email2");
		String address = request.getParameter("addr-basic");
		String addressinfo = request.getParameter("addr-detail");
		
//		System.out.println(id);
//		System.out.println(pw);
//		System.out.println(name);
//		System.out.println(phone);
//		System.out.println(email);
//		System.out.println(address);
//		System.out.println(addressinfo);

		//중복검사
				UserDAO dao = UserDAO.getInstance();
				int result = dao.checkId(id); //중복시1, 중복 x 0

				if(result == 1) { //이미 존재하는 회원
					return 1;
				} else {
					UserVO vo = new UserVO (id,pw,name,phone,email, address, addressinfo, null);
					dao.join(vo); //성공이라고 가정 
					return 0;
				}

			}

}
