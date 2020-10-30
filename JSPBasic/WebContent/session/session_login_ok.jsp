<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/*
	1.아이디, 비밀번호,nick을 받습니다,
	2. 아이디, 비밀번호 동일하면 아이디정보, 이름정보를 저장하는 세션 생성
		session_welcome으로 페이지 이동 id(이름)  님 환영합니다.
	3.틀린경우는 로그인 페이지로
	*/
	
	// 파라미터를 불러올때 한글 지정 필요
	request.setCharacterEncoding("utf-8");	
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nick = request.getParameter("nick");
	if(id.equals("aaa") && pw.equals("123")){ //로그인 성공
		session.setAttribute("id",id); //만들때는 변수 건언 필요 없음
		session.setAttribute("nick", nick);
		response.sendRedirect("session_welcome.jsp");	
		
	}else { 
	%>
		<script>
			alert ("아이디 비밀번호를 확인하세요");
			location.href = "session_login.jsp"; //Redirect와 깉은기능
		
		</script>
	
	<%	
	//response.sendRedirect("session_login.jsp");//로그인실페- 다시로그인화면
	} 

%>