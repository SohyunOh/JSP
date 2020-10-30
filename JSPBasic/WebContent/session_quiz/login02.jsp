<%@page import="com.session.UserRepository"%>
<%@page import="com.session.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/* login02.jsp
 	1. 입력된 회원 정보를 가져오세요.
 		
 	2. 로그인을 시도하는 회원의 모든 정보를 얻어오세요. (getUser() 만들어 주세요.)
 	getUser() -> 아이디를 전달받아 해당 아이디와 일치하는 객체가 있는지
 	확인 후, 있다면 그 객체를 리턴. (UserRepository 클래스에 메서드를 선언하세요.)
 	일치하는 객체가 없다면 null을 리턴.
 		
 	3. 조건문을 사용하여 getUser()의 리턴값이 null인지 아닌지를 확인하여
 	 null값을 받았다면 회원가입이 되어있지 않은 사람이 로그인을 시도한 것이므로
 	로그인 페이지로 보내주세요. (script로 경고창 띄운 후 로그인 페이지로. location.href)
 		  
 	4. getUser()의 리턴값이 null이 아닌 경우
 	회원 가입 당시에 작성했던 비밀번호가 로그인할 때 작성한 비밀번호와
 	일치하는지를 확인하여 같다면 세션에 로그인 데이터를 저장해 주세요.
 	("login", User객체)
 		
 	5. 세션을 만든 후 "login03.jsp"로 페이지를 이동시켜 주세요.
 		
 	6. 비밀번호가 일치하지 않는다면 script태그로 "비밀번호가 일치하지 않습니다."
 	 경고창 하나 띄워 주시고 다시 로그인 페이지로 이동시켜 주세요.
 	*/


   
    request.setCharacterEncoding("utf-8");
    
   	String id = request.getParameter("id");
    String pw = request.getParameter("pw");
   
    //아이디가 있다면 user 샛체가 번환, 없다면 null 반환
    User user =UserRepository.getUser(id);
    
    if(user != null){ //아이디가 있는경우
    	if(user.getPw().equals(pw)){//비밀번호 일치
    		session.setAttribute("login", user); //usre객체 통체로 저장
    		response.sendRedirect("login03.jsp");
    	}else{//비밀번호  불일치 경우
%>
    		<script>
    		alert("비밀번호를 입력하세요");
    		loaction.href = "login01.jsp";
    		</script>
    		
<%  } } else{//아이디가 없는 경우 %>
	    <script>
		alert("아이디를 확인하세요");
		loaction.href = "login01.jsp";
		</script>
<%  } %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>