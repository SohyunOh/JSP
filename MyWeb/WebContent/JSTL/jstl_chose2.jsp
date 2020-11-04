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
	choose를 이용해서 90이상이면 A, 80이상이면 B , 70이상은 C, 나머지 F
	90점 이상일떄 중접 if 구문의 형태로 A+, A로 나누어 표현
	 -->
<c:choose>
	<c:when test="${param.score >=90 }">
		<c:choose>
			<c:when test="${param.score >= 95 }">
			A+
			</c:when>
			<c:otherwise>
			A
			</c:otherwise>
		</c:choose>
		
	</c:when>
	<c:when test="${param.score >=80 }">
		<h4>B </h4>
	</c:when>
	<c:when test="${param.score >=70 }">
		<h4>C </h4>
	</c:when>
	<c:otherwise >
		<h4>F</h4>
	</c:otherwise>

</c:choose>


</body>
</html>