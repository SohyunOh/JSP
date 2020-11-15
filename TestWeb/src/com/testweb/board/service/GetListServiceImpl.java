package com.testweb.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testweb.board.model.BoardDAO;
import com.testweb.board.model.BoardVO;
import com.testweb.util.PageVO;



public class GetListServiceImpl implements BoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDAO dao = BoardDAO.getInstance();

		//1. 첫번째 페이징처리 진입할 때 값
		int pageNum = 1;
		int amount = 10;
		
		//pageNum가 넘어올때 pageNum, amount 값 세팅
		if(request.getParameter("pageNum") != null || request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		
		//2. PageVO() 생성
		ArrayList<BoardVO> list= dao.getList(pageNum, amount); //화면에 보여질 데이터
		int total = dao.getTotal(); // 토탈 번호(전체 게시물 수) 얻어오기
		PageVO pageVO = new PageVO(pageNum, amount, total);
		
		//화면으로 가져가기 위해 request에 list 저장
		request.setAttribute("list", list);
		
		//페이지네이션을 화면에 전달
		 request.setAttribute("pageVO", pageVO);
		
		
	}

}
