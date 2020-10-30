<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//쿠키확인
	Cookie[] cookies = request.getCookies();
	String id = null; //넘어온 쿠키의 값을 받을 변수
	
	if(cookies != null){
		for(Cookie c : cookies){
			if(c.getName().equals("user_id")){
				id = c.getValue();
			}
		}
	}
	
	if(id == null){
		response.sendRedirect("cookie_login.jsp"); //쿠키가 만료되었을 경우, 로그인페이지로 이동
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<% if(id != null){ %>
		<h2><%=id %>님 환영합니다 !</h2>
<%	} %>


</body>
</html>