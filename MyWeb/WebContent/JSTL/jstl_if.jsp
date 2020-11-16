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
	<!-- 변수선언(el로 참조가 가능합니다) -->
	<c:set var="num1" value="1"/> 
	<!-- 변수출력 -->
	<c:out value="${num1 }" />
	<hr/>
	<!-- test는 조건이 들어갑니다 -->
	<% if(true) { %>
		무조건 실행되는 문장<br/>
	<% } %>
	
	<c:if test="true">
		무조건 실행되는 문장<br/>
	</c:if>
	<hr/>
	
	
	<% if(request.getParameter("name").equals("홍길동") ) { %>
		이름이 홍길동 입니다<br/>
	<% } %>	
	
	<c:if test="${param.name eq '홍길동' }">
		이름이 홍길동 입니다<br/>
	</c:if>
	
	<c:if test="${param.name == '이순신' }">
		이름이 이순신 입니다<br/>
	</c:if>
	
	
	<hr/>
	
	
	<!-- age파라미터 값이 20이상이면 성인입니다, 20미만이면 미성년자입니다 -->
	<% if( Integer.parseInt(request.getParameter("age")) >= 20 )  {%>
		성인입니다<br/>
	<% } %>
	<c:if test="${param.age >= 20 }">
		성인입니다<br/>
	</c:if>
	
	<c:if test="${param.age < 20 }">
		미성년자입니다<br/>
	</c:if>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>