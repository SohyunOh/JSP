<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //form으로 전송된 테이터를 받음
    String id = request.getParameter("id");
	
	String pw = request.getParameter("pw");
	
	String email = request.getParameter("email");
	
	String major = request.getParameter("major");
	
	//여러값
	String[] inter = request.getParameterValues("inter");
	
	String phone = request.getParameter("phone1");
	
	String txt = request.getParameter("txt");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>rew_get_form에서 넘어온 파라미터값</h2>
	아이디:<%=id%><br>
	비밀번호:<%=pw%><br>
	메일:<%=email%><br>
	전공:<%=major%><br>
	관삼분야:<%=Arrays.toString(inter) %><br>
	통신사:<%=phone%><br>
	글:<%=txt %><br>

</body>
</html>