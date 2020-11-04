<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>자바코드로 빈 이용하기</h2>
	
	<form action="bean_basic_ok.jsp" method="post">
		<table border="1">
			<tr>
				<%-- colspan - 왼쪽에서 오른쪽으로 컬럼을 확장 --%>
				<%-- rowspan - 위에서 아래로 row를 확장--%>
				<td>아이디:</td>
				<td><input type="text" name="id"><br /></td>
			</tr>
			<tr>
				<td>비밀번호:</td>
				<td><input type="password" name="pw"><br /></td>
			</tr>
			<tr>
				<td>이름:</td>
				<td><input type="text" name="name"><br /></td>
			</tr>
			<tr>
				<td>이메일:</td>
				<%-- type="email"은 email양식으로 사용해준다 --%>
				<td><input type="email" name="email"><br /></td>
			</tr>
			<tr>
				<td ><input type="submit" value="확인" ></td>
			</tr>
		</table>
		
	</form>
</body>
</html>