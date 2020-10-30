<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String name = request.getParameter("name");
	String number = request.getParameter("number");
	String id = request.getParameter("id");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>get방식으로 주소에 담겨 넘어온 값</h2>
	
	이름: <%=name %><br>
	번호 : <%= number %> <br>
	아이디 : <%= id %> <br>

</body>
</html>