<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>req_quiz02.jsp</h2>
	<p> 다음을 구현하고 a태그 클릭시 req_quiz02_result 에 학생변호를 출력하세요. </p>
	

	<% for(int i = 1; i <= 30 ; i++){%>
		
		<a href="req_quiz02_result.jsp?no=<%=i%>"> <%= i %>번 학생 </a> <br>
	
	<% } %>


</body>
</html>