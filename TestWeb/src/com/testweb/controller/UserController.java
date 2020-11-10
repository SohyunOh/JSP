package com.testweb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testweb.user.service.UserDeleteServiceImpl;
import com.testweb.user.service.UserJoinServiceImpl;
import com.testweb.user.service.UserLoginServiceImpl;
import com.testweb.user.service.UserService;
import com.testweb.user.service.UserUpdateServiceImpl;




@WebServlet("*.user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UserController() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doActionsServlet(request, response);
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doActionsServlet(request, response);
	}
	
	
	protected void doActionsServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//요청분기
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		
		System.out.println(command);
		
		//부모타입선언
		UserService service;
		
		//회원가입 화면 처리
		if(command.equals("/user/join.user")) {
			request.getRequestDispatcher("user_join.jsp").forward(request, response);
			
			
		} else if (command.equals("/user/login.user")) { //로그인 화면처리
			request.getRequestDispatcher("user_login.jsp").forward(request, response);
				
		
		
		}else if (command.equals("/user/joinFrom.user")) { //회원가입 요청
			
			service = new UserJoinServiceImpl();
			int result = service.execute(request, response);//중복시 1, 성공시0;
			
			if(result == 1 ) { //중복	
				request.setAttribute("msg", "이미존재하는 회원입니다.");
				request.getRequestDispatcher("user_join.jsp").forward(request, response);
				
			} else { //성공 --로그인화면으로 
				response.sendRedirect("/user/login.user");
				
			}
		}
		
		
		else if (command.equals("/user/loginForm.user")) {//로그인화면처리	
			service = new UserLoginServiceImpl();
			int result  = service.execute(request, response);
			
			if(result ==1) { //로그인 성공
				response.sendRedirect("user_mypage.user");
			}else { //로그인 실패
				request.setAttribute("msg",  "아이디 비밀번호를 확인하세요");
				request.getRequestDispatcher("user_login.jsp").forward(request, response);
			}
						
		} else if(command.equals("/user/user_mypage.user")) { //마이페이지 화면처리 
			request.getRequestDispatcher("user_mypage.jsp").forward(request, response);
		
		} else if (command.equals("/user/user_logout.user")) {//로그아웃
			HttpSession session = request.getSession();
			session.invalidate(); // 무효화 
			
			response.sendRedirect(request.getContextPath());//홈화면으로
			
		}else if (command.equals("/user/update.user")) { //수정화면 이동
			//세션에 값이 들어있음.
			request.getRequestDispatcher("update.jsp").forward(request, response);
			
		} else if(command.equals("/user/updateForm.user")) {
			/*
			 * 1. UserUpdateServiceImpl() 생성호출
			 * 2. execute메서드에서는 update()메서드 실행
			 * 
			 */
			service = new UserUpdateServiceImpl();
			int result = service.execute(request, response);
			
			if(result ==1) { //업데이트 성공 1
				//문자열의 형태로 스크립트를 작성해서 Out.println()화면에 전달
				response.setContentType("text/html; charset=UTF-8");//html로 전달
				PrintWriter out = response.getWriter(); //응답객체 , 출력스트림
				out.println("<script>");
				out.println("alert('회원정보 수정이 정상 처리되었습니다.');");
				out.println("location.href='mypage.jsp';");
				out.println("</script>");
			}else {//실패0
				response.sendRedirect("mypage.user");//실패시 마이페이지로
			}
					
		}else if (command.equals("/user/delete.user")) {//삭제화면 요청
			request.getRequestDispatcher("delete.jsp").forward(request, response);
		
		}else if (command.equals("/user/deleteForm.user")) {//회원탈퇴요청
			/*
			 * 1.UserDeleteServiceImpl() 로 생성, 연결
			 * 2.delete() 메서드를 통해 삭제 처리
			 * 3. 성공실패결과를 컨트로롤러로 받아와서 성공시엔, 세션삭제후 홈화면으로 리다이렉트
			 * 4. 실패시엔 실패메시지를 delete.jsp로 처리해주세요
			 */
			
			service = new UserDeleteServiceImpl();
			int result = service.execute(request, response);
			
			if(result == 1) {//회원탈퇴성공
			response.sendRedirect(request.getContextPath());
			
			}else { //실패
				request.setAttribute("msg", "비밀번호를 확인하세요");
				request.getRequestDispatcher("delete.jsp").forward(request, response);
			}
			
			
		
			
		}
	
	
		
	}


	

}