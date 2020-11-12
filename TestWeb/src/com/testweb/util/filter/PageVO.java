package com.testweb.util.filter;

public class PageVO {
	
	//화면에 보여질 pagrNation을 계산하느 ㄴ클래스(pageNum와 전체게시글 수, amount를 가지고 다님
	
	private int startPage; //게시판 화면에 보여질 첫페이지 번호
	private int endPage; //게시판 화면에 보여질 끝페이지 번호
	private boolean prev, next; //다음 이전 활성화 여부

	private int pageNum = 1; //현재 조회하는 페이지 번호
	private int amount = 10; //한 페이지에서 몇개의 데이터를 보여줄건가
	private int total; //총 계시물 수


	
	//생성자 (초기화 역활)- 생산될때 계산처리
	public PageVO(int pageNum, int amount ,int total) {
		
		this.pageNum = pageNum; //현재 조회하는 페이지 번호
		this.amount = amount; //한 페이지에서 몇개의 데이터를 보여줄건가
		this.total = total; //전체게시글 수
		
		
		//1.endPage 계산
		//현재페이지 번호 1~10 이다 -> 화면에 보여질 끝번호 10
		//현재페이지 번호 14번 이다 -> 화면에 보여질 끝번호 20
		//공식(int) MAth.ceil(페이지번호 /화면에 보여질 페이지 수) X 화면에 보여질 페이지 수
		this.endPage = (int)Math.ceil(this.pageNum /(double) 10) * 10 ;
		
		//2.startPage계산
		//공식 : 긑페이지 - 회면에보여질 페이지 수 +1
		this.startPage = this.endPage -10 +1;
		
		//3.realEnd실제 번호
		// 만약에 게시글이 52개면?  -> 끝체이지번호 6
		// 만약에 게시글이 105개면?  -> 끝체이지번호 11
		//공식 : (int)Math.ceil(전체 게시글 수/ 페이지는 데이터 개수)
		int realEnd = (int)Math.ceil(this.total / (double)this.amount);
		
		//마지막 페이지 도달시 보여져야 하는 끝 번호가 달라집니다.
		//ex:131 개 게시물
		//1번 페이지클릭스 -> endPage  : 10, realEnd -> 14 (endpage로 세팅)
		//11번 페이지클릭스 -> endPage  : 20, realEnd -> 14 (realEnd로 세팅)
		// 결론 endPage > realEnd 라면   realEnd 를 보여주면 됨
		if( endPage > realEnd ) {
			this.endPage = realEnd;
		}
		
		//4. 이전버튼 활성화 여부
		//startPage 점핑값 1,11,21,31,.. 형태로 표기
		this.prev = this.startPage > 1;
		
		//5. 다음버튼 활성화 여부
		//위   realEnd 와 endPage 서로 연관이 있는데,
		//ex:131 게시물
		//1~10번 페이지 조회시 endPage =10, realEnd 14 -> 다음버튼 활성화 true
		//11 번 페이지 조회시 endPage =14, realEnd 14 -> 다음버튼 활성화 false
		this.next =  realEnd > this.endPage;
	
	//확인
		System.out.println("시작페이지:" +this.startPage + ", 끝페이지:" + this.endPage);
		
	}


	
	//게터 ,셋터

	public int getStartPage() {
		return startPage;
	}



	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}



	public int getEndPage() {
		return endPage;
	}



	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}



	public boolean isPrev() {
		return prev;
	}



	public void setPrev(boolean prev) {
		this.prev = prev;
	}



	public boolean isNext() {
		return next;
	}



	public void setNext(boolean next) {
		this.next = next;
	}



	public int getPageNum() {
		return pageNum;
	}



	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}



	public int getAmount() {
		return amount;
	}



	public void setAmount(int amount) {
		this.amount = amount;
	}



	public int getTotal() {
		return total;
	}



	public void setTotal(int total) {
		this.total = total;
	}
	
	
	
	
}
