<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

<%
	if(session.getAttribute("id") == null) { //로그인이 되어있지 않는 유저
		response.sendRedirect("session_login.jsp");// 로그인화면으로
	}

	String id = (String) session.getAttribute("id");
	String nick = (String)session.getAttribute("nick");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h2><%=id%>(<%=nick %>)님 환영 합니다.</h2>
	<a href="session_logout.jsp">로그아웃 하기</a>


</body>
</html>