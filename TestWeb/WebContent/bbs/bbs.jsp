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


			<div align="right">
				<select onchange="change(this)">
					<option value="10" ${PageVO.amount == 10? 'selected' : '' }>10개씩
						보기</option>
					<option value="20" ${PageVO.amount == 20? 'selected' : '' }>20개씩
						보기</option>
					<option value="50" ${PageVO.amount == 50? 'selected' : '' }>50개씩
						보기</option>
					<option value="100" ${PageVO.amount == 100? 'selected' : '' }>100개씩
						보기</option>
				</select>
			</div>


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


					<c:if test="${pageVO.prev }">
						<li><a
							href="list.bbs?pageNum=${pageVO.startPage - 1}&amount=${pageVO.amount}">이전</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageVO.startPage }"
						end="${pageVO.endPage }">
						<li class="${num eq pageVO.pageNum ? 'active' : '' }"><a
							href="list.bbs?pageNum=${num }&amount=${pageVO.amount}">${num }</a>
							<%-- 서버에서 넘버를 받음 --%></li>
					</c:forEach>

				  <c:if test="${pageVO.next }">
                        	<li><a href="list.bbs?pageNum=${pageVO.endPage + 1}&amount=${pageVO.amount}">다음</a></li>
                        </c:if>
                    </ul>
                    <button class="btn btn-info pull-right" 
                    onclick="location.href='write.bbs'">글쓰기</button>
                </div>
                
            </div>
        </div>
    </section>
		


</section>

<%@ include file="../include/footer.jsp"%>
