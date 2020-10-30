<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/*
	1. Date클래스를 이용해서 xxxx년 xx월 xx일 형태로 날짜를 생성
	쿠키이름은 show쿠키로 생성해주세요
	
	*/
	
	//String 타입으로 날짜생성
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일"); //포맷형식
	String str = sdf.format(today);
	
	//쿠키생성
	Cookie cookie = new Cookie("show", str); //쿠키의 값은 공백을 받을 수 없습니다 !
	
	//쿠키set
	cookie.setMaxAge(60); 
	
	//쿠키 전송
	response.addCookie(cookie);
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href ="cookie02.jsp">cookie02 로 이동(쿠키확인!)</a>

</body>
</html>





