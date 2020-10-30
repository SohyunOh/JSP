package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/OutServlet")
public class OutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public OutServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//서블릿에서 out 객체를 이용해서 브라우저 화면으로 문자열 데이터를 전송할 수 있습니다.
		//브라우저에 out 객체를 이용해서 데이터를 보낼 떄, 브라우저한테 해석할 수 있는 힌트를 줘야 합니다 (ContentType)
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out= response.getWriter();// 브라우저화면에 출력할 PrintWriter 갹체를  얻는방법
		
		out.println("Hello 안녕안녕 니하오 나마스테~~~");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
