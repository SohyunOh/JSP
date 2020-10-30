<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%

	request.setCharacterEncoding("utf-8"); //한글화

	String name = request.getParameter("name");
	int kor = Integer.parseInt( request.getParameter("kor"));
	int eng = Integer.parseInt( request.getParameter("eng"));
	int  meth = Integer.parseInt( request.getParameter("meth"));

	 int sum = kor+eng+meth;
	 double avg = (double)sum/3;
	 
	 String result =String.format("%.2f", avg);
	 
	 String str = "";
	 
	 if(avg >= 80){
		str="고득점";
	 }else if( avg >=60){
		 str="중간";
	 }else{
		str="저득점";
	 }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>결과</h2>
<hr>
이름: <%=name %> <br>
합계 : <%=sum %><br>
평균 : <%=result %><br>
 등급 : <%= str %> 

</body>
</html>