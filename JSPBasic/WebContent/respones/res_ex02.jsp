<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 디자인 문법을 적응 영역 -->
<!--  선택자 . 은 태그의class에 접근하는 문법 -->

<style>
 .form-content{margin: 0 auto; width: 200px;} /*margin : 여백  */
 .form-group {text-align: center; width: 200px;}
 .form-control {width : 100%;  box-sizing: border-box;}
</style>

</head>
<body>


	<!-- css를 지정하는 방법에 3가지 , 인라인시트, 내부스타일시트, 외부스타일시트 -->
	<!--  내부 스타일 시트는 캐그에 class속성을 이름을 부여하고, head안에서 css 문법으로 디자인을 활용-->
	
	<section>
		<div class="form-content">
			<form action="res_ex02_result.jsp" method="post" class="form-group">
			<span>로그인 폼</span>
				<input type="text" name="id" placeholder="아이디" class="form-control"> <br>
				<input type="password" name="pw" placeholder="비밀번호" class="form-control"> <br>
			
				<input type="submit" value="로그인" class="form-control">
			</form>
		</div>
	
	</section>

</body>
</html>