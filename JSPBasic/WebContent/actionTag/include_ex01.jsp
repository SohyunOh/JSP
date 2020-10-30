<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>1번페이지</h2>
디렉티브 태그의 인클루드는 자바코드를 포함해서 전부 가지고 들어오는 방면 <br>
액션태그의 인클류드는 UI 만 가지고 돌아온다. 


<%@ include file="include_ex02.jsp" %> <br>
<%=total %>

<%--
<jsp:include page="include_ex02.jsp"/>
<%= total %>
 --%>
</body>
</html>