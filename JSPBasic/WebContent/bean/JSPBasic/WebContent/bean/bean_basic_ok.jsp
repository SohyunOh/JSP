<%@page import="com.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 값을 따로따로 전송하면 setAttribute가 4개나 나올꺼다  >> 비효율적-->

<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");

	//아래 생성과 동일한 형태
	User u = new User(id, pw, name, email);
	//★jsp에서는 자바코드를 사용하면 된다
	out.println(u.getId());
	out.println(u.getPw());
	out.println(u.getName());
	out.println(u.getEmail());
	
	
%>
<%-- bean은 액션태그를 이용해 생성 --%>
<%-- setter의 사용 --%>
<jsp:useBean id="user" class="com.bean.User"><%-- class=경로, id=변수명 --%>
	<%-- 변수명이 아닌 setter와 getter를 보고 실행된다 --%>
	<%-- name=bean의id, property=속성명(ex..setId가 실행되는것) --%>
	<jsp:setProperty property="id" name="user" value="<%=id %>"/>
	<jsp:setProperty property="pw" name="user" value="<%=pw %>"/>
	<jsp:setProperty property="name" name="user" value="<%=name %>"/>
	<jsp:setProperty property="email" name="user" value="<%=email %>"/>
	<%-- 이러한 모형의 형태를 기억해보자 --%>
</jsp:useBean>
    
 <%-- getter의 사용 --%>
<jsp:getProperty property="id" name="user"/>
<jsp:getProperty property="pw" name="user"/>
<jsp:getProperty property="name" name="user"/>
<jsp:getProperty property="email" name="user"/>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    