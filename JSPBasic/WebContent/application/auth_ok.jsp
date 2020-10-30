<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

/*
	// 올바른 인증값을 적는 경우는  reverse.jsp 로 이동
	// 올바른 인증값을 적은 경우  authYN이름으로  인증 성공세션을 생성
	// 올바르지 않는 경우 가시 인증 페이지로 이동
		
*/
	request.setCharacterEncoding("utf-8");

	String auth = (String)session.getAttribute("auth");
	String code = request.getParameter("code");
	
	if(auth.equals(code)){
		
		//인증 성공세션
		session.setAttribute( "authYN" , "y" );
		response.sendRedirect("reverse.jsp");
		 
	}else{
		response.sendRedirect("auth.jsp");
	}

	
	
	


%>
