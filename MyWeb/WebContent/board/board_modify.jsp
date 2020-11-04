<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<style>
	.btn {
          
	border: 0; 
	border-radius: 0; /*윤곽 0*/
	padding: 5px 10px; 
	margin: 20px 0px;
        }
</style>


<div align="center" class="div_center">
	<h3>게시판 글 수정 페이지</h3>
	<hr>
	
	<form action="" method="post">
		
		<table border="1" width="500">
			
			<tr>
				<td>글 번호</td>
				<td>${vo.bno }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${vo.writer }</td>
			</tr>
			<tr>
				<td>글 제목</td>
				<td>
					<input type="text" name="title" value="${vo.title}">
				</td>
			</tr>
			<tr>
				<td>글 내용</td>
				<td>
					<textarea rows="10" style="width: 95%;" name="content">
					</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정 하기" onclick="">&nbsp;&nbsp;
					<input type="button" value="목록">        
				</td>
			</tr>
			
		</table>
	</form>
	
</div>



<%@ include file="../include/footer.jsp" %>

