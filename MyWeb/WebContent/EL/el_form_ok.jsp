<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
/*	
	String id =request.getParameter("id");
	String name =request.getParameter("name");
	String pw =request.getParameter("pw"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- param.태그 이름으로 한번에 받아서 사용 , mvc2방식-->
	이름: ${param.name}<br/>
	아이디 : ${param.id }<br/>
	비번 : ${ param.pw }

</body>
</html>