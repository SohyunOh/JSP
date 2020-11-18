<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %> 
    
     <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 col-sm-12 join-form">
                    <h2>게시판 수정<small>(디자인이궁금하세요?)</small></h2>

                    <form action="update.bbs" method="post" name="regForm">
                        <div class="form-group">
                            <label>글번호</label>
                            <input type="text" class="form-control" id="bno" name="bno" value="${vo.bno }" readonly>
                        </div>
                        <div class="form-group">
                            <label>글쓴이</label>
                            <input type="text" class="form-control" name="writer" placeholder="자유" value="${vo.writer }" readonly>
                        </div>
                        <div class="form-group">
                            <label>제목</label>
                            <input type="text" class="form-control" name="title" placeholder="자유" value="${vo.title }">
                        </div>
                        <div class="form-group">
                            <label>내용</label>
                            <textarea class="form-control" rows="5" name="content">${vo.content }</textarea>
                        </div>

                        <!--구현로직: 버튼은 온클릭을 사용하던 자바스크립트를 이용해야 합니다-->
                        <div class="form-group">
                            <button type="button" class="btn btn-success" onclick="location.href='list.bbs'">목록</button>
                             <button type="submit" class="btn btn-info" onclick="location.href='modiForm.bbs?bno=${vo.bno }&writer=${vo.writer }'">수정</button>
                            
                            <button type="button" class="btn btn-default"onclick="location.href='delete.bbs?bno=${vo.bno }&writer=${vo.writer }'">삭제</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>


        </section>
<script type="text/javascript">
	function update(){
		document.regForm.submit();
	}
</script>

<%@ include file="../include/footer.jsp" %>