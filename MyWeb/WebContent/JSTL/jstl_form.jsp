<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>if절 확인하기</h2>
	<form action="jstl_if.jsp">
		이름:<input type="text" name="name"> <br/>
		나이 : <input type="text" name="age"> <br/>
	
		<input type="submit" value="확인"> 
	
	</form>
	
	<h2>chose절 확인하기</h2>
	<form action="jstl_chose.jsp">
		이름:<input type="text" name="name"> <br/>
		나이 : <input type="text" name="age"> <br/>
	
		<input type="submit" value="확인"> 
	</form>
	
	
	<h2>chose2절 확인하기</h2>
	<form action="jstl_chose2.jsp">
		점수:<input type="text" name="score"> <br/>
		<input type="submit" name="확인"> <br/>
	
	</form>
</body>
</html>