<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    UserVO vo  = new UserVO();
    vo.setId("hhh123");
    vo.setName("홍길숙");
    vo.setEmail("hhh123@naver.com");
    
    request.setAttribute("vo", vo);//리퀘스트에 강제 저장
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

아이디:${requestScope.vo.id} <br/><!--  마지막애 들어있는 값이 실행됨.--> 
이름:${requestScope.vo.name}<br/> 
이메일:${requestScope.vo.email} <br/>

<!-- 는 생략을 많이 하고 사용 -->
아이디:${vo.id} <br/><!--  마지막애 들어있는 값이 실행됨.--> 
이름:${vo.name} <br/>
이메일:${vo.email} 
</body>
</html>