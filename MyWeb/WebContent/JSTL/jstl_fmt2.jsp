<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>아래값들을 2020년 05월 03일  형식으로 변경해서 출력</h2>
	<c:set var="TIME_A" value="2020-05-03"/>
	<c:set var="TIME_B" value="2020/05/03"/>
	<c:set var="TIME_C" value="2020-05-03 21:30:22"/>
	<c:set var="TIME_D" value="<%= new Date() %>"/>
	
	<input type="date" >
	<hr/>
	
	<fmt:parseDate var="P_TIME_A" value="${TIME_A} " pattern="yyyy-MM-dd"/>
	<fmt:formatDate var="A1" value="${P_TIME_A }" pattern="yyyy년 MM월  dd일" />
	${A1 } <br/>
	<hr/>
	
	<fmt:parseDate var="P_TIME_B" value="${TIME_B} " pattern="yyyy/MM/dd"/>
	<fmt:formatDate var="B1" value="${P_TIME_B }" pattern="yyyy년 MM월  dd일" />
	${B1 }<br/>
	<hr/>
	
	<fmt:parseDate var="P_TIME_C" value="${TIME_C} " pattern="yyyy-MM-dd HH:mm:ss"/>
	<fmt:formatDate var="C1" value="${P_TIME_C }" pattern="yyyy년 MM월  dd일 HH시mm분ss초" />	
	${C1 }<br/>
	<hr/>
	
	<fmt:formatDate var="D1" value="${TIME_D }" pattern="yyyy년 MM월  dd일"/>
	${D1 }
	 


	

	

</body>
</html>