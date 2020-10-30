<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- a태그를 이용해서 req_video페이지로 상대경로, 절대경로 이동 -->

	<!-- img 태그를 사용해서 jave.png참조 -->
	
	<!-- a태그를 이용해서 TestServlet 페이지로 상대경로, 절대경로 이동 -->


	<a href="../../request/req_video.jsp"> req_video페이지로 상대경로 이동</a> <br>
	<a href="/JSPBasic/request/req_video.jsp"> req_video페이지로  절대경로 이동</a> <br>
	<img src="/JSPBasic/request/img/java.png" width="200px" alt="자바"> <br>
	<img src="../../request/img/java.png" width="200px" alt="자바"> <br>
	
	<a href="../../banana"> testServlet 페이지로 상대경로 이동</a><br>
	<a href="/JSPBasic/banana"> testServlet 페이지로 절대경로 이동</a>
	
	<%
	out.print("<h1>안녕!<h1>");
	out.print("<h2>반가워</h2>");
	%>



</body>
</html>