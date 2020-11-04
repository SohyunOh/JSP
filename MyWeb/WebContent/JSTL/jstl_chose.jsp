<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:choose>
		<c:when test="${param.name eq '홍길동'}">
			<h4>홍길동임</h4>
		</c:when>
		<c:when test="${param.name eq '이순신'}">
			<h4>이순신임</h4>
		</c:when>
		<c:otherwise> 
			<h4>홍길동, 이순신이 아닙니다.</h4>
		</c:otherwise>
	</c:choose>
	<!--  20세 이사으 20미만 성이느 미성년자 -->
	
	<c:choose>
		<c:when test="${param.age >= 20 } ">
			<h4>20세 이상 성인</h4>
		</c:when>
			<c:otherwise test="${param.age < 20 } ">
			<h4>20세 미만 미성년자</h4>
		</c:otherwise>
	</c:choose>

</body>
</html>