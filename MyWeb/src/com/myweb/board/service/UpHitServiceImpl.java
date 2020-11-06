package com.myweb.board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;

public class UpHitServiceImpl implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		String bno = request.getParameter("bno");
		System.out.println(bno);
		//화면에서 넘어온 쿠키를 받아서, 현재 조회번호와 같은지 검사해서 실행여부 결정
		Cookie[] arr = request.getCookies();
		boolean flag = true;
		if(arr != null) {
			for(Cookie c :arr) {
				if(c.getName().equals(bno)){ // (bno와 조회번호bno가  같은 사람 = 쿠키가 있는사람)
					//쿠키이름이 게시글조회번호와 동일한지 검사 
					flag= false;// 중복의 의미
					break;
				}
			}
		}
		if(flag) { //중복이 없다면
			BoardDAO dao = BoardDAO.getInstance(); 
			dao.upHit(bno);//조회수 증가	
		}
		//쿠기 생성하여 보내주고 브라우저를 실행햇을때 다시 쿠키를 확인하기
		//쿠키를 이용해서 조회된 번호를 클라이언트측으로 전달
		Cookie cookie = new Cookie(bno, bno);//(이름을 번호로 생성시킴)
		//쿠키형식 1:1 , 2:2 , 3:3 7:7.......
		
		cookie.setMaxAge(30); // 시간설정
		response.addCookie(cookie);//보내기
	}

}
