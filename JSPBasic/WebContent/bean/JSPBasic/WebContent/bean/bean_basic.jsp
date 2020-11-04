<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="bean_basic_ok.jsp" method="post">
		<table>
			<tr>
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
				<!-- type="email"은 email양식으로 사용해준다 -->
				<td><input type="email" name="email"><br /></td>
			</tr>
		</table>
		<input type="submit" value="확인" style="">
	</form>

</body>
</html>










































