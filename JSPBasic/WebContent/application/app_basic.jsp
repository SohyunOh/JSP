<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//application은 session 과 사용이 거의 동일하며,
	//생명주기가 톰캣을  stop할때 까지 1개 우지가 됩니다.

	int total =0;

	if(application.getAttribute("total") != null){
		total = (int)application.getAttribute("total");
	}

	total++;
	
	//증가된값을 세션에 저장
	application.setAttribute("total", total); //덮어 씌기가 되기에 저장하고 가져오기가 됨.
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

값 : <%=total %>

</body>
</html>