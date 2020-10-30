<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%! int total = 0; //누적
Random ran = new Random();//선언
%>
<%

	int num = ran.nextInt(8)+2; //2~9 
	total++; //증감
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<p>
		
	<%= total %>번째 방문자 입니다.
		<% if(total %10 ==0){ %>
	당첨되었습니다.
	<% } %>
	</p>
	<hr/>
	
	<h2> 랜덤 구구단 <%= num %></h2>
	<p>
	이번에 나온 구구단  <%= num%>단 입니다. <br/>
	
	<% for(int i =1 ; i <= 9 ; i++){ %>
		 <%= num %> X <%= i %> = <%= i*num %> <br/>
	<% } %>
	</p>



</body>
</html>


