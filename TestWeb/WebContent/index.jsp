<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "include/header.jsp" %> 
        <!--메인만 적용되는 css영역-->   
        <style>
            body {
                background-image: url(images/main.jpg);
                background-repeat: no-repeat;
                background-size: cover
            }
        </style>
   
    
    <section>
    
    <div class="container" id="mainCon">
        <div class="jumbotron" id="jbDiv">
            <div class="container" id="introArea">
                <h1>게시판 사이트</h1>
                <p>해당 사이트는 교육용 사이트로써, 학생 여러분들이 알아서 수정, 추가, 삭제 해보시기 바랍니다.</p>
                <p>글을 써도 되고, 사진을 넣어도 되는 영역 입니다.</p>

            </div>

        </div>
        
        <div class="col-md-6 col-xs-12" style="padding: 0px 0px;">
            <h2 style="color:black">공지사항</h2>
            <table class="table table-striped" style="text-align: center; border: 2px solid #737373">
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
                </tbody>
            </table>
        </div>
<%@ include file="include/footer.jsp" %>   
        
    </div>
    </section>
    
