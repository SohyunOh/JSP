<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp"%>
<style>
.table-striped>tbody>tr {
	background-color: rgba(255, 255, 255)
}

.row h2 {
	color: aliceblue;
}

.pagination-sm {
	margin: 0;
}
</style>


<section>

	<div class="container">
		<div class="row">

			<h2>게시판 목록</h2>
			<table class="table table-striped"
				style="text-align: center; border: 2px solid #737373">
				<thead>
					<tr>
						<th style="background-color: #9DCAFF; text-align: center;">번호</th>
						<th style="background-color: #9DCAFF; text-align: center;">제목</th>
						<th style="background-color: #9DCAFF; text-align: center;">작성자</th>
						<th style="background-color: #9DCAFF; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><a>Test</a></td>
						<td>Min</td>
						<td>2019-09-14 08:05</td>
					</tr>
					<tr>
						<td>2</td>
						<td><a>Lorem Ipsum is simply dummy text of the printing
								and typesetting industry.</a></td>
						<td>MBW</td>
						<td>2019-09-15 13:05</td>
					</tr>
					<tr>
						<td>3</td>
						<td><a>Test Text</a></td>
						<td>박인욱</td>
						<td>2019-09-15 19:05</td>
					</tr>

					<c:forEach var="vo" items="${list }">
						<tr>
							<td>${vo.bno }</td>
							<td><a href="content.board?bno=${vo.bno }">${vo.title }</a>
							</td>
							<td>${vo.writer }</td>
							<td><fmt:formatDate value="${vo.regdate }"
									pattern="yyyy월 MM월dd일" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<%-- 페이지번호 --%>
			<div class="text-center">
				<ul class="pagination pagination-sm">

					<li><a href="#">이전</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					
					<c:if test="${pageVO.prev }">
						<li><a
							href="list.bbs?pageNum=${pageVO.startPage - 1}&amount=${pageVO.amount}">이전</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageVO.startPage }"
						end="${pageVO.endPage }">
						<li class="${num eq pageVO.pageNum ? 'active' : '' }"><a
							href="list.board?pageNum=${num }&amount=${pageVO.amount}">${num }</a>
							<%-- 서버에서 넘버를 받음 --%></li>
					</c:forEach>

					<c:if test="${pageVO.next }">
						<li><a
							href="list.board?pageNum=${pageVO.endPage +1}&amount=${pageVO.amount}">다음</a>
						</li>
					</c:if>
				</ul>
				<button type="button" class="btn btn-info pull-right"
					onclick="location.href='bbs_modify.bbs'">글쓰기</button>
			</div>

		</div>
	</div>
</section>

<%@ include file="../include/footer.jsp"%>
