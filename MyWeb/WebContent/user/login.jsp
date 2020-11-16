<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<section>
	<div align="center">
		<h2>로그인 연습</h2>
		<hr/>
		
		<form action="loginForm.user" method="post">
			
			<input type="text" name="id" placeholder="아이디" required ><br/><br/>
			<input type="password" name="pw" placeholder="비밀번호" required ><br/><br/>
			<input type="submit" value="로그인" class="btn btn-default" >
			<input type="button" value="취소" class="btn btn-primary" onclick="location.href='join.jsp' ">				
			
			<br/>
			<span style="color:red;">${msg }</span>
			
		</form>
	</div>
</section>


<%@ include file="../include/footer.jsp" %>