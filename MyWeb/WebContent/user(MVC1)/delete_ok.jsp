<%@page import="com.myweb.user.model.UserDAO"%>
<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. 사용자가 입력한 pw값과 id를 기반으로 login() 메서드를 실행시켜서
	   비밀번호가 맞는지 검증합니다.
	   
	2. login() 가 null을 반환하면 "현재 비밀번호를 확인하세요" 출력 뒤로가기
	   login() 가 값을 가진다면 delete()메서드를 호출해서 삭제를 진행하면 됩니다.	
	
	3. 삭제 성공시에는 세션을 전부 지우고 index페이지로 리다이렉트
	   삭제 실패시에는 마이페이지로 리다이렉트
	*/
	
	request.setCharacterEncoding("utf-8");

	//id는 세션에서 얻음.
	UserVO vo = (UserVO)session.getAttribute("user");
	String id = vo.getId();
	
	//pw는 화면에서 받음.
	String pw = request.getParameter("pw");
	
	//로그인 메서드 재활용
	UserDAO dao = UserDAO.getInstance();
	UserVO result = dao.login(id, pw); 
	
	if(result == null) { //비밀번호가 틀린경우
%>
	<script>
		alert("현재 비밀번호를 확인하세요");
		history.go(-1);
	</script>
<%
	} else { //비밀번호가 일치하는 경우
		int result2 = dao.delete(id);
		
		if(result2 == 1) { //삭제 성공
			session.invalidate();
			response.sendRedirect( request.getContextPath() );
		} else { //삭제 실패
%>
		<script>
			alert("회원 탈퇴에 실패했습니다");
			location.href = "mypage.jsp";
		</script>
<%			
		}
	}
%>





    
    