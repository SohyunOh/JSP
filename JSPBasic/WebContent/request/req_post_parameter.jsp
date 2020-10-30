<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post방식은 request갹쳉서 값을 얻을 때 인코딩형식을 지정	
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	아이디 : <%= id %> <br>
	비밀번호 : <%= pw %> <br>
	

</body>
</html>