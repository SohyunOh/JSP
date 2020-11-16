<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	/* 
	String id = request.getParameter("id");	
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- param.태그이름 으로 한번에 받아서 사용합니다 -->
	이름: ${param.name }
	아이디: ${param.id }
	비밀번호: ${param.pw }
	
	
</body>
</html>