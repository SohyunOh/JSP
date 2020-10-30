<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- form 에 작성된 테이터를 서버로 전송 할 때,받아서 처리 할 URL 정보를  action속성에 적습니다.  -->


<form  action="req_get_parameter.jsp">
	<h3>회원양식</h3>
	<hr/>
	아이디 <input type="text" name="id" placeholder="아이디를 입력하세요 " required><br/>
	비밀번호: <input type="password" neme="pw"> <br/>
	이메일 : <input type="email" name ="email"><br/> <!-- html5 형식 -->

	<!-- radio는 name으로 통일시켜야, 여러개의 버튼을 하나의 그룹으로 보고 다중 선택이 가능합니다.  -->
	전공 : 
	<input type="radio" name ="major" value="경영">경영학
	<input type="radio" name ="major" value="컴퓨터">컴퓨터
	<input type="radio" name ="major" value="전기">전기전자
	<input type="radio" name ="major" value="기공">기계공학

	<br/>
	관심분야 :
	<input type="checkbox" name="inter" value="자바">자바
	<input type="checkbox" name="inter" value="DB">DB
	<input type="checkbox" name="inter" value="JSP" >JSP
	<input type="checkbox" name="inter" value="JavaScript">JavaScript

	<br/>
	통신사:
	<select name = "phone1">
		<option>SKT</option>
		<option>KT</option>
		<option>LGU+</option>
	</select>
	
	
	<br/>
	<!-- 장문의 글 을 담을수있는 박스-->
	자기소개:
	<br/>
	<textarea rows="5" cols="30" name="txt"></textarea>
	
	<br/>
	<!--submit은 폼안에 있는데이터를 서버로 전송 -->
	<input type="submit" value="가입하기"> 
	<input type="button" value="그냥 버튼">

	</form>

</body>
</html>