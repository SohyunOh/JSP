<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String no = request.getParameter("no");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 앞에서 어떤 동영상을 클릭하냐에 따라,
	가가 알맞은 동영상이 보여지도록 처리 -->



	<div align="center"><!-- 블록안에 가운데 정렬  -->
		<h2>강의영상</h2>
		<hr/>
		<% if(no == null){ %>
		<p> 잘못된 접근입니다 </p>
		<% }else if(no.equals("1")){ %>
		<p>자바 수업 소개</p>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/L0a6N-rj-CI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		<% }else if(no.equals("2")){ %>
		<p>자바스크립트수업 소개</p>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/nOTpuof2YG8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		<% }else if(no.equals("3")){ %>
		<p>오라클 설치 소개</p>
		<iframe width="560" height="315" src="https://www.youtube.com/embed/DEVR_R2Hva0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		<% }else{ %>
		<p> 잘못된 접근입니다 </p>
		<% } %>
</div>
	


</body>
</html>