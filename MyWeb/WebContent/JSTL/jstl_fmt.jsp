<%@page import="java.sql.Timestamp"%>
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

	<h2>formatNunber, formatDate, parseDate, parsNumber</h2>
	<h3> formatNunber -> 숫자의 자릿수를 지정합니다.</h3>
	<c:set var="d01" value="2020"/>
	<fmt:formatNumber var="v01" value="${d01}" pattern="000000" />
	<fmt:formatNumber var="v02" value="${d01}" pattern="0000.00" />
	${v01 } <br/>
	${v02 } <br/>

	<hr/>
	
	<h3> ★ formatDate -> 날짜 형을 지정된 날짜형태로 변경  </h3>
	<c:set var="d02" value="<%= new Date() %>"/>
	<fmt:formatDate var="v03" value="${d02 }" pattern="yyyyMMdd HHmmss"/>
	<fmt:formatDate var="v04" value="${d02 }" pattern="yyy년 MM월 dd일"/>
	<fmt:formatDate var="v05" value="${d02 }" pattern="yyyy-MM-dd"/>
	${d02 } <br/>
	${v03 } <br/>
	${v04 } <br/>
	${v05 } <br/>
	<hr/>
	
	<h3> ★ parseDatr -> 문자를 날짜 (java.util.Date)로 변환</h3>
		<!-- to_date와 같음. -->
		
	<c:set var="d03" value="2020/11/04"/>
	<!-- 날짜 패턴 형식 똑같이 맞추기 -->
	<fmt:parseDate var="v06" value="${d03 }" pattern="yyyy/MM/dd"/>
	${v06 }<br/>
	<c:set var ="d04" value="2020-11-04 23:12:34"/>
	<fmt:parseDate var="v07" value="${d04 }" pattern="yyyy-MM-dd HH:mm:ss"/>
	${v07 } <br/>
	
	<hr/>
	<h3> parseNumber -> 문자를 숫자형으로 변경 </h3>
	<%--
	<h3>(날짜를 밀리초로 변경)</h3>
	<c:set var="d05" value="<%= new Date() %>"/>
	<%= new Date().getTime() %>
	<fmt:parseNumber var="v08" value="${d05.time}"/>
	${v08 }
	 --%>
	 
	<fmt:parseNumber var="d06" value="1,100.00" pattern="0,000.00"/>
	${d06}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>