package com.testweb.util.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.user.model.UserVO;



//게시글 수정 삭제
@WebFilter({"/board/modify.board","/board/update.board","/board/delete.board" })
public class BoardFilter2 implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		//1.드록화면에서는 작성자를 id값으로 고정
		//2.각 요청으로 id가 prameter로 전달되는지 확인
		//3.writer화면에서 작성자를 id 값으로 고정
		//4. modify.board, /update.board,delete.board 요청으로 넘어갈 떄 writer를 담아서 보내주도록 처리
		request.setCharacterEncoding("utf-8");//한글인코딩
		
		HttpSession session = req.getSession();
		UserVO user =(UserVO)session.getAttribute("user");
		
		if(user == null) {
			res.sendRedirect("/MyWeb/user/login.user");
			return;
		}
		
		String id = user.getId(); //세션에서 넘오온 아이디
		
		String writer = request.getParameter("writer");//화면에서 넘어온 파라미터 값
		
//		System.out.println("넘어온 writer:" + writer) ;//- 다시 확인하기 ㅜㅜ
		
		
		if( writer == null || !id.equals(writer)) { //권한이 없는 경우
			res.setContentType("text/html; charset=UTF-8");//응답 문서 실행
			PrintWriter out= res.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다');");
			out.println("location.href='/MyWeb/user/login.user'"); //로그인화면
			out.println("</script>");
			return ; // 필터종료
		}
		
		
		chain.doFilter(request, response); // 컨트롤러릐 실행
		
	}

}
