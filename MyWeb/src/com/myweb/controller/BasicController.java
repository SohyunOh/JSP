package com.myweb.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.service.BoardService;
import com.myweb.board.service.ContentServiceImlp;
import com.myweb.board.service.GetListServiceImpl;
import com.myweb.board.service.RegistSerViceImpl;

@WebServlet("*.board")
public class BasicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public BasicController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		didpatchServlet(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		didpatchServlet(request, response);
	}
	
	protected void didpatchServlet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8"); //한글처리
		//3.요청분기
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length()); //uri - 패스경로
		//conPath.length 만큼 길이 짜르기
		System.out.println(command);
		//*****************************************************************
		// MVC2에서는 기본적으로 포워드 이동
		// 다시 컨트롤러로 태울때는 리다이렉트 사용
		
		//service 의 부모타입 선언 -- 맴버변수 선언 -> 메서드로 사용 
		BoardService service;		
		System.out.println(request.getRemoteAddr());
		
		if(command.equals("/board/list.board")) {//들어올때 경로
			
			service = new GetListServiceImpl();
			service.execute(request, response);
			
			//목록을 가지고 forword이동
			request.getRequestDispatcher("board_list.jsp").forward(request, response);
//			response.sendRedirect("board_list.jsp"); //나갈때 경로
			
		} else if(command.equals("/board/write.board")) {//글화면 요청
			
//			response.sendRedirect("board_write.jsp");
			request.getRequestDispatcher("board_write.jsp").forward(request, response);
			
		} else if (command.equals("/board/regist.board")) {//글 등록 요청
			service = new RegistSerViceImpl();
			service.execute(request, response);
			//자식 생성 부모 저장
			
			//response.sendRedirect("board_list.jsp");//내가 원하는 페이지로 보내는 방식이라면
			//mvc2에서 보내는 방식 .board 로 보내면 컨트롤러가 요청을 다시 잡아외 실행
			response.sendRedirect("list.board");
			
			
		} else if (command.equals("/board/content.board")) { //상세보기 이동
			System.out.println("상세보기로 이동하기");
			
			service = new ContentServiceImlp();
			service.execute(request, response);
			
			request.getRequestDispatcher("board_content.jsp").forward(request, response);
			
			
		} else if (command.equals("/board/modify.board")) { //서블릿 , 수정화면 요청
			System.out.println("수정 화면으로 이동");
			/*
			 * 1. contentServiceImpl() 재활용합니다.
			 * 2. 포워드 형식으로  board_modify.ksp 로 이동
			 * 3. 화면에서는 태그안에 데이터 값 출력
			 */
			
			service = new ContentServiceImlp();
			service.execute(request, response);
			
			
			request.getRequestDispatcher("board_modify.jsp").forward(request, response);
			//페이지로 보내기
			
			
		}
	}
	
}
