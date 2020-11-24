<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<section>
        <div class="container">
            <div class="row join-wrap">
                <!--join-form을 적용한다 float해제 margin:0 auto-->
                <div class="col-xs-12 col-md-9 join-form">
                    
                    <div class="titlebox">
                        MEMBER INFO                    
                    </div>
                    
                    <p>*표시는 필수 입력 표시입니다</p>
                    <form action="updateForm.user" method="post" name="regform">
                    <table class="table">
                        <tbody class="m-control">
                            <tr>
                                <td class="m-title">*ID</td>
                                <td><input class="form-control input-sm" name="id" value="${sessionScope.user.id }" readonly ></td>
                            </tr>
                            <tr>
                                <td class="m-title">*이름</td>
                                <td><input class="form-control input-sm" name="name" value="${sessionScope.user.name }"></td>
                            </tr>
                            <tr>
                                <td class="m-title">*비밀번호</td>
                                <td><input class="form-control input-sm" name="pw" ></td>
                            </tr>
                            <tr>
                                <td class="m-title">*비밀번호확인</td>
                                <td><input class="form-control input-sm" name="pwCheck"></td>
                            </tr>
                            <tr>
                                <td class="m-title">*E-mail</td>
                                <td>
                                    <input class="form-control input-sm" name="email" value="${sessionScope.user.email }">@
                                    <select class="form-control input-sm sel" name="email2" value="${sessionScope.user.email2}">
                                    </select>
                              <!--    <button class="btn btn-info">중복확인</button>  -->   
                                </td>
                            </tr>
                            <tr>
                                <td class="m-title">*휴대폰</td>
                                <td>
                                    <input class="form-control input-sm sel" name="ph1" value="${sessionScope.user.ph1 }"> -
                                    <input class="form-control input-sm sel" name="ph2" value="${sessionScope.user.ph2 }"> -
                                    <input class="form-control input-sm sel" name="ph3" value="${sessionScope.user.ph3}">
                                </td>
                            </tr>
                            <tr>
                                <td class="m-title">*주소</td>
                                <td><input class="form-control input-sm add" name="address" value="${sessionScope.user.address }"></td>
                            </tr>
                            <tr>
                                <td class="m-title">*상세주소</td>
                                <td><input class="form-control input-sm add" name="addressinfo" value="${sessionScope.user.addressinfo }"></td>
                            </tr>
                        </tbody>
                    </table>
                    </form>
                    
                    <div class="titlefoot">
                        <button class="btn"  onclick="update()" >수정</button>
                        <button type="button" class="btn" onclick="history.go(-1)'">목록</button>
                    </div>
                    
                </div>


            </div>

        </div>
        
        
        <script type="text/javascript">
        function update() {
			document.regform.submit();
		}
        
        
        </script>
        
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
    </section>
    
  <%@ include file="../include/footer.jsp" %>