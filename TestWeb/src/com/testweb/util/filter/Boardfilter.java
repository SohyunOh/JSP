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

//1. Filter 인터페이스를 상속하고, doFilter 메서드를 오버라이딩 합니다.
//2. 필터를 등록하는 방봅 @WebFilter 어노테이션 or Web.xml에 필터 설정
//3.@WebFilter("/*") - 모든 요청
//@WebFilter("*.board") //보드로 끝나는 요청은 다 적용
@WebFilter({"/bbs/write.bbs" , "/bbs/regist.bbs"}) //글 쓰기화면,글 등록시에만 필터걸음
public class Boardfilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//ServletRequest은  HttpServletRequest 의 부모타입
		//형변환을 통해서 자식형태로 변환
		HttpServletRequest req= (HttpServletRequest)request;
		HttpServletResponse res= (HttpServletResponse)response; //파라미터 값, 세션 등을 얻을 수있음
		
		//세션은 얻어서 권한 확인
		HttpSession session = req.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		
		if(user==null) {//세션이 존재하지 않는다는 것은 권한이 없음.
//			res.sendRedirect("list.board");
			
			res.setContentType("text/html; charset=UTF-8");//응답 문서 실행
			PrintWriter out= res.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스입니다')");
			out.println("location.href='/TestWeb/user/login.user'");//로그인화면
			out.println("</script>");
			return;//컨트롤러를 실행하디 않음.
			
		}
				
		chain.doFilter(request, response); //서블릿이나, 연결되어 있는 다른 필터를 실행

	}

}
