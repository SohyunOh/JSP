<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	/*
	1.id,pw 를 받아서 처리
	2. id abc123, 비밀번호 xxx123 라면 로그인 성공, res_ex02_welcome.jsp리다이렉트
	3. id가 틀린경우 res_ex02_id_fail 로 다이렉트
	3. pw가 틀린경우 res_ex02_pw_fail 로 다이렉트
	
	*/

	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");


	if(id.equals("abc123") && pw.equals("xxx123")){ //로그인 성공
		response.sendRedirect( "res_ex02_welcome.jsp");
		
	}else if (!id.equals("abc123") ){//아이디가 아닌 경우
		
		response.sendRedirect( "res_ex02_id_fail.jsp");
	}
	
	else if (!pw.equals("xxx123")){//비번이 아닌 경우
		response.sendRedirect( "res_ex02_pw_fail.jsp");
	}
	




%>