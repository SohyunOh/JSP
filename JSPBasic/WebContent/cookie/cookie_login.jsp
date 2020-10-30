<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	//id_check쿠키를 확인하고, 아이티태그 value 옵션에 값을 넣으면 됩니다
 	
 	Cookie[] coo_check = request.getCookies();
 	String id_check = " "; //id를 저장할 변수	
 
 	if(coo_check != null){
	 	for(Cookie c : coo_check){
	 		if(c.getName().equals("id_check")){
	 			
	 			id_check = c.getValue();	
	 		}
	 	}
 		
 	}
 
 
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>쿠키연습</h2>
	
	<form action="cookie_login_ok.jsp" method="post">
		아이디 : <input type="text" name="id" value="<%=id_check %>" required><br>
		비밀번호 : <input type="password" name="pw" required><br>
		<input type="submit" value="로그인">
		<input type="checkbox" name="idCheck" value="y">아이디기억하기
	</form>

</body>
</html>