<%@page import="com.session.UserRepository"%>
<%@page import="org.omg.CORBA.UserException"%>
<%@page import="com.session.User"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	/*
    	1.사용자 객체를 받은 다음에 User 객체를 생성하고 사용자의 입력값을 지정한 후에
       		UsreRepository클래스에 저장해 주세요.
       		
       	2.join03페이지 이동
        */
           
    	//한글처리
        request.setCharacterEncoding("utf-8");
        
        //파라미터값 받아오기
       	String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String name = request.getParameter("name");
        String birth = (String)request.getParameter("birth");
        
        
        //user 객체를 이용해 4가지 값을 받아서 저장하기
        User user = new User(id, pw, name, birth);
        //유저정보 저장
        UserRepository.setUser(user);    

        // 페이지 이동   
        response.sendRedirect("join03.jsp");
    %>
    
    