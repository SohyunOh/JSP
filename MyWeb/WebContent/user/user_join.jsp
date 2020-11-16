<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

    <!--회원가입 폼만 적용되는 css-->
    <style type="text/css">
        .table-striped>tbody>tr {
            background-color: #f9f9f9
        }

        .join-form {
            margin: 0 auto;
            padding: 20px;
            width: 50%;
            float: none;
            background-color: white;
        }
        
        
        .form-group > .sel {
            width: 120px;
            display: inline-block;
            
        }
    </style>
    

    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-9 col-sm-12 join-form">
                    <h2>회원가입<small>(가운데정렬)</small></h2>

                    <form action="joinFrom.user" method="post" name ="regForm" >
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 (영문포함 4~12자 이상)" required >
                        </div>
                        <div class="form-group">
                            <label for="password">비밀번호</label>
                            <input type="password" class="form-control" id="password" name="pw" placeholder="비밀번호 (영 대/소문자, 숫자, 특수문자 3종류 이상 조합 8자 이상)" required>
                        </div>
                        <div class="form-group">
                            <label for="password-confrim">비밀번호 확인</label>
                            <input type="password" class="form-control" id="password-confrim" name="pwCheck" placeholder="비밀번호를 확인해주세요." required >
                        </div>
                        <div class="form-group">
                            <label for="name">이름</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요." required >
                        </div>
                        <!--input2탭의 input-addon을 가져온다 -->
                        <div class="form-group">
                            <label for="pw">휴대폰번호</label><br>
                            
                            <input class="form-control sel" name="ph1" placeholder="010" required > -
                            <input class="form-control sel" name="ph2" placeholder="xxxx" required > -
                            <input class="form-control sel" name="ph3" placeholder="xxxx" required >
                        
                        </div>
                        <div class="form-group">
                             <label for="hp">이메일</label><br>
                            <input class="form-control sel" name="email" required >@
                            <select class="form-control sel" name="email2" required >
                                <option>naver.com</option>
                                <option>gmail.com</option>
                                <option>daum.net</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="addr-num">주소</label>
                            <input type="text" class="form-control" name="addr-basic" placeholder="기본주소" required >
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="addr-detail" placeholder="상세주소" required >
                        </div>
                        
                        <p>${msg}</p>
                        <div class="form-group">
                            <input type="submit" value="회원가입" class="btn btn-lg btn-success btn-block" />
                        </div>
                        <div class="form-group">
                            <input type="button" value="로그인" class="btn btn-lg btn-info btn-block" onclick="location.href='user_login.jsp'"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    
<!--  
<script>

	var idppt = /^[a-z0-9]{4,12}$/;
	var pwppt = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$*%^&+=]).*$/;
	var ph1ppt = /^\d{3}$/;
	var ph2ppt = /^\d{3,4}$/;
	var ph3ppt = /^\d{4}$/;
	var emailppt = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*$/i;
	
	
	 function check(){
		if(!idppt.test(document.regForm.id.value)){
			alert('영문포함 4자리 필수 입력입니다.');
			return;
		}else if(!pwppt.test(document.regForm.pw.value)){
			alert("영 대/소문자, 숫자, 특수문자 3종류 이상 조합 8자 이상 입력하세요.");
			return;
		}else if(pwppt.test(document.regForm.pw.value) != pwppt.test(document.regForm.pwCheck.value ) ){
			alert("비밀번호 다시 확인하세요");
			return;
		}else if(!ph1ppt.test(document.regForm.ph1.value)){
			alert("앞번호 형식에 맞춰주세요 ");
			return;
		}else if(!ph2ppt.test(document.regForm.ph2.value)){
			alert("중간번호 3-4자리 형식에 맞춰주세요 ");
			return;
		}else if(!ph3ppt.test(document.regForm.ph3.value)){
			alert("뒷번호 4자리 형식에 맞춰주세요 ");
			return;
		}else if(!emailppt.test(document.regForm.email.value)){
			alert("이메일 앞자리를 입력해주세요 ");
			return;	

		}else{
			//submit()은 자바스크립트의 서브밋기능 
			document.regForm.submit();
		}
	}
	
</script>
-->
    
<%@ include file="../include/footer.jsp" %>
