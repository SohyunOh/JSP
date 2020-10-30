<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// param 태그는 requset,setAttribute() 와 같은 기능이 같음
	request.setCharacterEncoding("utf-8");
%>

<jsp:forward page="param_ex03.jsp">
	<jsp:param value="홍길자" name="name"/>
</jsp:forward>

