<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	//쿠키 사용하기
 	//쿠키는 서버에 요청이 들어올 때 자동으로 전송됩니다.
 	
 	//쿠키에대한 정보는 request를 통해 확인이 가능하다
 	Cookie[] cookies =  request.getCookies();
 
 if(cookies != null){ //쿠키가 없는 경우가 존재 하기 때문에
	 for(int i = 0; i < cookies.length; i++){
		 out.println(cookies[i].getName() + "<br>"); //쿠키이름 확인
		 out.println(cookies[i].getValue() + "<br>"); //쿠키값 확인
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

	

</body>
</html>