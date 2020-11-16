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
	
	<!-- 
	choose태그를 이용해서 90이상이면 A, 80이상 B, 70이상 C, 나머지 F
	
	90점 이상일 때는 중첩if구문의 형태로 A+, A로 나누어 표현
	-->
	<c:choose>
		<c:when test="${param.score >= 90 }">
			<c:choose>
			<c:when test="${param.score >= 95 }">
				A+입니다
			</c:when>
			<c:otherwise>
				A입니다
			</c:otherwise>
			</c:choose>
		</c:when>
		<c:when test="${param.score >= 80 }">
			B입니다
		</c:when>
		<c:when test="${param.score >= 70 }">
			C입니다
		</c:when>
		<c:otherwise>
			F입니다
		</c:otherwise>
	</c:choose>
	
	
</body>
</html>