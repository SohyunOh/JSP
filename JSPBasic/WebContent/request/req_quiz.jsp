<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--
	1. form 를 이용헤서 post형식으로 이름,국,영,수 값을 입력받습니다. (태그에서 반드시 값을 입력하도록 = required )
	2. req_quiz_result.jsp 로 전송
	3. 해당 페이지에서는 평균, 합계를 구하고, 80점이상 =고득점, 60점 이상은 = 중간, 60점아래 = 저득점 출력

  --> 

<form action=" req_quiz_result.jsp" method="post">

 	이름: <input type="text" name="name" required ><br>
 	국어 : <input type="text" name="kor" pattern="[0-9]{2,3}" required  > <br>
 	영어 : <input type="text" name="eng" pattern="[0-9]{2,3}" required  > <br>
 	수학 : <input type="text" name="meth" pattern="[0-9]{2,3}" required > <br>
 	<!-- pattern="[0-9]{2,3}" 은  숫자0-9까지 , 2자리에서 3자리 까지만 가능 -->
 	<input type="submit" value="확인"> 


</form>




</body>
</html>