<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	//자바에서의 쿠키생성
 	//1. 생성자의 매개변수의(쿠키이름, 쿠키값)을 지정 --- 매개변수는 String만 가능
 	Cookie cookie = new Cookie("choco", "초코칩쿠키");
 	Cookie cookie2 = new Cookie("banana", "바나나쿠키");
 
 	//2. 쿠키의 setter메서드로 쿠키속성 설정
 	cookie.setMaxAge(60 * 60); //만료기간 --- 초단위 : 60*60 = 3600초
 	cookie2.setMaxAge(20); //20초
 	
 	//3. 응답객체에 쿠키를 담아서 브라우저에 전송
 	response.addCookie(cookie);
 	response.addCookie(cookie2);
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href ="cookie_basic_get.jsp">쿠키 사용하기</a>

</body>
</html>