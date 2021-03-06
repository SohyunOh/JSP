package com.testweb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.board.service.BoardService;
import com.testweb.board.service.ContentServiceImlp;
import com.testweb.board.service.DeletsServiceImpl;
import com.testweb.board.service.GetListServiceImpl;
import com.testweb.board.service.RegistServiceImpl;
import com.testweb.board.service.UpdateServiceImpl;



@WebServlet("*.bbs")
public class BbsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BbsController() {
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

		//게시판 화면
		if(command.equals("/bbs/list.bbs")) {//들어올때 경로

			service = new GetListServiceImpl();
			service.execute(request, response);

			//목록을 가지고 forword이동
			request.getRequestDispatcher("bbs.jsp").forward(request, response);
			//			response.sendRedirect("board_list.jsp"); //나갈때 경로



			//게시물 상세보기
		} else if (command.equals("/bbs/content.bbs")) { //상세보기 이동
			System.out.println("상세보기로 이동하기");
			//조회수 관련 작업

			service = new ContentServiceImlp();
			service.execute(request, response);

			request.getRequestDispatcher("bbs_content.jsp").forward(request, response);


			// 게시물 작성 화면 처리
		} else if (command.equals("/bbs/modify.bbs")) {
			request.getRequestDispatcher("bbs_write.jsp").forward(request, response);

			// 게시물 상세보기
		} else if (command.equals("/bbs/content.bbs")) {
			service = new ContentServiceImlp();
			service.execute(request, response);

			request.getRequestDispatcher("bbs_content.jsp").forward(request, response);

			// 게시물 작성 화면 처리
		} else if (command.equals("/bbs/write.bbs")) {
			request.getRequestDispatcher("bbs_write.jsp").forward(request, response);


			// 게시물 작성 처리
		} else if (command.equals("/bbs/regist.bbs")) {
			service = new RegistServiceImpl();
			service.execute(request, response);

			response.sendRedirect("list.bbs");

			//게시물 수정
		} else if (command.equals("/bbs/modify.bbs")) {


			service = new ContentServiceImlp();
			service.execute(request, response);

			request.getRequestDispatcher("bbs_modify.jsp").forward(request, response);


		}else if (command.equals("/bbs/update.bbs")) {
			//넘어가는 값 확인 용
			System.out.println(request.getParameter("bno"));
			System.out.println(request.getParameter("writer"));
			System.out.println(request.getParameter("title"));

			/*
			 * 1. UpdateServiceImpl()을 생성하고 execute()메서드 생성
			 * 2. 서비스에서 bno, title, content를 받아서 update() 에서즈를 실행
			 * 3. update()는 sql문으로 수정을 진행
			 * 4. 컨트롤러에서는 페이지 이동을 content화면으로 이동
			 */

			service = new UpdateServiceImpl();
			service.execute(request, response);

			//request.getRequestDispatcher("board_content.jsp").forward(request, response);

			//content화면으로 
			int result = (int) request.getAttribute("update");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			if (result == 1) {// 성공
				out.println("<script>");
				out.println("alert('글이 수정되었습니다');");
				out.println("</script>");
				response.sendRedirect("content.bbs?bno=" + request.getParameter("bno"));
			}
			//bno를 필요로하기에content에 실어서 보내주기



		}else if (command.equals("/bbs/delete.bbs")) {//게시글 삭제
			/*
			 * 1. 화면에서 delete.board요청으로 필요한 값을get방식으로 넘겨줍니다
			 * 2.DeletsServiceImpl() 생성하고 dao의delete()메서드 실행
			 * 3.삭제 진행 후에 목록페이지로 이동
			 */

			service = new DeletsServiceImpl();
			service.execute(request, response);
			int result = (int) request.getAttribute("delete");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			if (result == 1) {// 성공ㅒ
				out.println("<script>");
				out.println("alert('글이 삭제되었습니다');");
				out.println("location.href='bbs.bbs';");


			} else {// 실패
				out.println("<script>");
				out.println("alert('글이 삭제되지 않았습니다');");

				out.println("location.href='bbs.bbs';");

				out.println("</script>");
			}

		}

	}

}
