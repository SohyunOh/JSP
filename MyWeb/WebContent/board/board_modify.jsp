<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>



<div align="center" class="div_center">
	<h3>게시판 글 수정 페이지</h3>
	<hr>
	
	<form action="update.board" method="post">
		
		<!-- form 안에서 화면에 보이지 않지만 , 반드시 넘겨줘야 되는 값을 숨겨서 보낼 때  hidden 을 사용  -->
		<input type="hidden" name="bno" value="${vo.bno }">
		<input type="hidden" name="writer" value="${vo.writer }">
		
		<table border="1" width="500">
			
			<tr>
				<td>글 번호</td>
				<td><input type="text" value="${vo.bno }" disabled></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" value="${vo.writer }" disabled></td>
			</tr>
			<tr>
				<td>글 제목</td>
				<td>
					<input type="text" name="title" value="${vo.title}"></td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td>
					<textarea rows="10" style="width: 95%;" name="content">${vo.content}
					</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정 하기" onclick="">&nbsp;&nbsp;
					<input type="button" value="목록" onclick="location.href='list.board'">        
				</td>
			</tr>
			
		</table>
	</form>
	
</div>



<%@ include file="../include/footer.jsp" %>

