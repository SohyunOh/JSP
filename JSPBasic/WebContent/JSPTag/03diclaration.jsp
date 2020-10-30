<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	//선언자는 전역의 의미로 사용되고, 메서드 선언이 가능
	int i =10;
	String str = "WEB";
	
	public int method(int a, int b){
		return a+b;		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 out.println("i값:"+i);
 out.println("str값:"+str);
 out.println("메소드호출:"+ method(10,5));
%>


</body>
</html>