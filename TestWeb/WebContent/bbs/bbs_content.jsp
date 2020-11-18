<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %> 
    
     <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 col-sm-12 join-form">
                    <h2>게시판 상세보기<small>(디자인이궁금하세요?)</small></h2>

                    <form action="modify.bbs" method="post" name="regForm">
                        
                    
                        
                        <div class="form-group" >
                            <label>등록일</label>
                            <input type="text" class="form-control" value="${vo.regdate }" readonly>
                        </div>
                        <div class="form-group">
                            <label>글번호</label>
                            <input type="text" name="bno" class="form-control" value="${vo.bno }" readonly>
                        </div>
                        <div class="form-group">
                            <label>글쓴이</label>
                            <input type="text" name="writer" class="form-control" value="${vo.writer }" placeholder="자유" readonly>
                        </div>
                        <div class="form-group">
                            <label>제목</label>
                            <input type="text" name="title" class="form-control" value="${vo.title }" placeholder="자유" readonly>
                        </div>
                        <div class="form-group">
                            <label>내용</label>
                            <textarea name="content" class="form-control" rows="5" readonly>${vo.content }</textarea>
                        </div>
                        
                        <!--구현로직: 버튼은 온클릭을 사용하던 자바스크립트를 이용해야 합니다-->
                        <div class="form-group">
                            <button type="button" class="btn btn-success" onclick="location.href='list.bbs'">목록</button>
                            <button type="button" class="btn btn-info"
                           
                             onclick="ㄷ'modify.bbs?bno=${vo.bno}&writer=${vo.writer}'">수정      
                            </button>
                            <!-- 모디 파일 로 이동   -->
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <!-- 
	<script type="text/javascript">
			function modify() {
				document.regForm.submit();
				
			}
		</script>
-->
        </section>
    
<%@ include file="../include/footer.jsp" %>