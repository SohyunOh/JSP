<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
 	/*
 	1. 아이디, 비밀번호를 받습니다
 	2. id = abc, pw = 1234라면 로그인성공이라고 간주(user_id, id)를 저장하는 
 		쿠키생성을 하고 cookie_welcom페이지로 리다이렉트
 	3. 아이디와 비밀번호가 다르다면, 다시 로그인페이지로 리다이렉트
 	4. welcome페이지 에서는 쿠키값을 꺼내서 "id님 환영합니다"를 출력
 	
 	*/
 	
 	request.setCharacterEncoding("utf-8");
 
 	//id, pw받기
 	String id = request.getParameter("id");
 	String pw = request.getParameter("pw");
 	String idCheck = request.getParameter("idCheck"); //아이디 기억하기 checkbox
 	
 	if(id.equals("abc") && pw.equals("1234")){ //id = abc, pw = 1234 로그인성공 !
 		
 		//쿠키생성
 		Cookie cookie = new Cookie("user_id", id);
 	
 		//쿠키 set
 		cookie.setMaxAge(60);
 		
 		//쿠키전송
 		response.addCookie(cookie);
 		
 		//idcheck값이 y라면 기억하기에 대한 쿠키생성
 		if(idCheck != null){
	 		Cookie cookie2 = new Cookie("id_check", id);
	 		cookie2.setMaxAge(60 * 60 * 24); //하루
	 		response.addCookie(cookie2); 			
 		}
 		
 		
 		//cookie_welcom페이지로 리다이렉트
 		response.sendRedirect("cookie_welcom.jsp");

 	}else{ //로그인 실패
 		response.sendRedirect("cookie_login.jsp"); //로그인페이지로 리다이렉트
 	}
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>