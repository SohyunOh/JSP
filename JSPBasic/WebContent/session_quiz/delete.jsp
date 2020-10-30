<%@page import="com.session.UserRepository"%>
<%@page import="com.session.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User user = (User)session.getAttribute("login");
	UserRepository.delete(user.getId()); //삭제
	
	session.invalidate();
	
	response.sendRedirect("login01.jsp"); //로그인 페이지로 이동

%>