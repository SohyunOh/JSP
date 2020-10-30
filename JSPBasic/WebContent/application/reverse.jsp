<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    //인증이 없는 사람은 첫번쩨 페이지로 
    if(session.getAttribute("authYN") == null){
    	response.sendRedirect("auth.jsp");
    }
    
    //application 갹체의 예약 정보를 얻습니다.
    List<String> list = new ArrayList<>();
    if(application.getAttribute("list") != null){
    	list = (List<String>) application.getAttribute("list");
    }
    
    %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		태그를 선택하지 못하도록 처리하는 옵션 disabled (디스에이블드)
		checkbox, radio를 선택을 하게하는 옵션 checked
		select 태그에서 미리 선택하게 하는 옵션은 selected
		input 태그에 반드시 값을 입력하세요 required
		input 태그를 읽기 속성 readonly	
	  -->


	<div align="center">
		<h2>영화 좌석 예약</h2>
		<h4>예약할 좌석을 체크하세요</h4>
		
		<form action="reserve_ok.jsp" method="post">
			&nbsp;&nbsp;
			<%for(char c = 'A'; c <= 'Z'; c++) {%>
			<small> <%=c%></small> &nbsp; <!-- 마크업 언어로 표현가능함  ex)<(꺽세) <-&Lt, &nbsp;(띄어쓰기) -->
			<% } %>
			<br/>
			
			<%for(int i = 1; i <= 6; i++) {%>
				<%= i %>
				<% for(char c = 'A'; c <= 'Z'; c++) {%>
						<input type="checkbox" name="seat" value="<%=c%>-<%=i%>" 
							<%=list.contains(c+ "-"+i)? "disabled" : "" %> >
						<!-- 3항연산식을 으로 list에 있으면  disabled로 체크를 금지 시킴  -->
					<%} %>
					
					
					<%= i == 3 ? "<br>" : "" %> <!--3 항연상식 자주 사용함 , 여기서는 행 띄어쓰기 용도로씀 --> 
					
					<br/>
			<% } %>
			
			<input type="submit"  value="예약" > 
			 <!-- 자바스크립트에 연결헤서 동적실행 기능부여하기 -->
			 <!-- onclick 클릭했을때 동작하는 자바 스크립트 -->
			<input type="button"  value="처음으로" onclick="location.href='auth.jsp'">
			
			
		</form>
	</div>

</body>
</html>