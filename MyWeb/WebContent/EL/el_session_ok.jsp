<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 
	UserVO vo = (UserVO)session.getAttribute("vo");
	String auth = (String)session.getAttribute("auth");
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 세션값도 sessionSocope를 생략할 수 있지만, 붙여주는 편이 좋습니다 -->
	auth: ${sessionScope.auth }<br/>
	아이디: ${sessionScope.vo.id }<br/>
	이름: ${sessionScope.vo.name }<br/>
	
	
</body>
</html>