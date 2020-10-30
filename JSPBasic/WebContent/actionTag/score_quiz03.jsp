<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String name = (String) request.getAttribute("name");
	double avg = (double) request.getAttribute("avg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2><%=name%>의 평균 점수:
		<%=avg%>입니다.
	</h2>

</body>
</html>