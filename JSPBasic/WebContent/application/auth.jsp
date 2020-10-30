<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

	UUID uuid = UUID.randomUUID();
	System.out.println(uuid);
	//16진수의 랜덤값을 나타냄
	
	//문자열 자르기
	String[] arr =uuid.toString().split("-");
	
	
	//인증값을 세션에 저장
	session.setAttribute("auth", arr[1]);
%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>인증페이지</h2>
	
	<form action="auth_ok.jsp" method="post" >
		인증문자 : <b><i><del><%=arr[1] %></del></i></b> <br>
		
		인증문자를 입력하세요 : <input type="text" name="code" > <br>
		<input type="submit" value="확인">
	</form>

</body>
</html>