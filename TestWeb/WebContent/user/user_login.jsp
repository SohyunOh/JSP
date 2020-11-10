<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

    <!--login만 적용되는 css-->   
    <style>
        .table-striped>tbody>tr {
            background-color: #f9f9f9
        }

        .join-form {
            margin: 100px auto;
            padding: 20px;
            width: 50%;
            float: none;
            background-color: white;
        }
    </style>


    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-9 col-sm-12 join-form">
                    <h2>로그인<small>(가운데정렬)</small></h2>
                    
                    
                    <form action="loginForm.user" method="post" name="regForm">
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <input type="text" class="form-control" id="id" name="id" placeholder="아이디">
                        </div>
                        <div class="form-group">
                            <label for="password">비밀번호</label>
                            <input type="password" class="form-control" id="password" name="pw" placeholder="비밀번호 ">
                        </div>
                        
                        <div class="form-group">
                            <input type="button" class="btn btn-lg btn-success btn-block" value="회원가입" onclick="location.href='join.user'">
                        </div>
			
                        <div class="form-group">
                            <input type="button" class="btn btn-lg btn-info btn-block" value="로그인" onclick="login()" />
                        </div>
                    
                    <span>${msg}</span>
                    </form>
                </div>
            </div>
        </div>
        
 <!-- 버튼 타입은 스크립트 함수를 활용해서 보내주기  -->
<script type="text/javascript">
	function login() {
		document.regForm.submit();
	}
</script>

</section>



<%@ include file="../include/footer.jsp" %>