package com.testweb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.bbs.service.BoardService;
import com.testweb.bbs.service.ContentServiceImlp;
import com.testweb.bbs.service.DeletsServiceImpl;
import com.testweb.bbs.service.GetListServiceImpl;
import com.testweb.bbs.service.WriteServiceImpl;
import com.testweb.bbs.service.UpdateServiceImpl;
import com.testweb.bbs.service.UserListServiceImpl;



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
		
		
		
		
		
		
		
		//게시판 목록 요청
		if(command.equals("/bbs/list.bbs")) {//들어올때 경로
					
			service = new GetListServiceImpl();
			service.execute(request, response);
			
			request.getRequestDispatcher("bbs.jsp").forward(request, response);
	
		
			
			//작성화면			
		}else if(command.equals("/bbs/write.bbs")) {
			request.getRequestDispatcher("bbs_write.jsp").forward(request, response);
			
			
		
			//등록요청
		}else if(command.equals("/bbs/writeForm.bbs")) {
			service = new WriteServiceImpl();
			service.execute(request, response);
			
			request.getRequestDispatcher("/bbs/list.bbs").forward(request, response);	
			
			
			
			
			
			
			//게시물 상세보기 요청
		} else if (command.equals("/bbs/content.bbs")) { //상세보기 이동
			//조회수 관련 작업
				
			service = new ContentServiceImlp();
			service.execute(request, response);
			
			request.getRequestDispatcher("bbs_content.jsp").forward(request, response);
			
					
		
			
			//글 수정 화면
			} else if (command.equals("/bbs/modify.bbs")) {
				service = new ContentServiceImlp();
				service.execute(request, response);
				
				request.getRequestDispatcher("bbs_modify.jsp").forward(request, response);
	

				//글 수정 요청
			}else if(command.equals("/bbs/modifyForm.bbs")) {
				service = new UpdateServiceImpl();
				service.execute(request, response);
				
				int result = (int) request.getAttribute("update");

				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				if (result == 1) {// 성공
					out.println("<script>");
					out.println("alert('글이 수정되었습니다');");
					out.println("</script>");
					response.sendRedirect("list.bbs");
					//bno를 필요로하기에content에 실어서 보내주기
					//response.sendRedirect("content.bbs?bno=" + request.getParameter("bno"));
				}
				
				
				
				
				
				
				//글삭제
			}else if(command.equals("/bbs/bbs")) {
				service = new DeletsServiceImpl();
				service.execute(request, response);
				
				response.sendRedirect(request.getContextPath());
						
				
				//유저리스트
			}else if(command.equals("/user/userList.bbs")) {
				service = new UserListServiceImpl();
				service.execute(request, response);
				
		
				request.getRequestDispatcher("user_mypage.jsp").forward(request, response);
				
				
			}
			
			
			 
			 
		}

				
				
			
}
