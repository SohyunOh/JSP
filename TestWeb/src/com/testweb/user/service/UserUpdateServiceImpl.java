package com.testweb.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.user.model.UserDAO;
import com.testweb.user.model.UserVO;

public class UserUpdateServiceImpl implements UserService {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String Allphone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("adress");
		String addressinfo = request.getParameter("adressinfo");
		
		
//		String[] phone = Allphone.split("-");
//		String ph1 = phone[0];
//		String ph2 = phone[1];
//		String ph3 = phone[2];
//		String[] emails =  Allemail.split("@");
//		String email  = emails[0];  
		
		UserVO vo = new UserVO(id, pw, name, Allphone, email, address, addressinfo, null);
		UserDAO dao = UserDAO.getInstance();
		int result =  dao.update(vo);
		
	
		return result;
		
	
	}

}
