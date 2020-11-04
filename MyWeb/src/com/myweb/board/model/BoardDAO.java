package com.myweb.board.model;

import java.io.Writer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.omg.CORBA.PUBLIC_MEMBER;

import com.myweb.user.model.UserDAO;
import com.myweb.util.JdbcUtil;

import oracle.net.aso.c;

public class BoardDAO {

	//1. 나 자신의 객체를 생성해서 1개로 제한합니다.
		private static BoardDAO instance = new BoardDAO();
		
		//2. 직접 객체를 생성할 수 없도록 생성자에도  private
		private BoardDAO() {
			//드라이버 로드
			try {
//				Class.forName("oracle.jdbc.driver.OracleDriver"); -- 톰캣이 대신해줌
				//커넥션 풀을 얻는 작업
				InitialContext ctx = new InitialContext(); // 초기 설정 정보가 저장되는 객체
				ds= (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
				
			} catch (Exception e) {
				System.out.println("드라이버 호출 에러");
			}
		}
		
		//3. 외부에서 객체생성을 요구할때 getter메서드를 통해 1번의 객체를 반환
		public static BoardDAO getInstance() {
			return instance;
		}
		
		
		//----------------------------------------------------
		
		//DB 연결 변수들을 상수로 선언

		//데이터 소스의 ds가 필요
		private DataSource ds;// ds에 연결 객체들이 들어감
	
		
		private Connection conn = null;
		private PreparedStatement pstmt= null;
		private ResultSet rs = null;
		
		//글등록 메서드
		public void regist(String writer,String title, String content) {
			String sql = "insert into board (bno,writer,title,content) values(board_seq.nextval,?,?,?)";
			
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			
			pstmt.executeUpdate(); //sql문 실행
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		}
		
		//글 조회 리스트
		public ArrayList<BoardVO> getList() {
			ArrayList<BoardVO> list= new ArrayList<>();
			/*
			 * 데이터베이스에서 번호를 내림차순으로 조회해서 리스트에
			 * 담는 코드를 작성
			 */
			
			String sql = "SELECT * FROM board ORDER BY bno DESC";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql); //sql 불러옴
				rs = pstmt.executeQuery(); 
				
				while (rs.next()) {
					int bno = rs.getInt("bno");
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String content = rs.getString("content");
					Timestamp regdate = rs.getTimestamp("regdate");
					int hit = rs.getInt("hit");
					
					//vo에 넣어주고
					BoardVO vo = new BoardVO(bno, writer, title, content, regdate, hit);
					
					list.add(vo); //리스트에 담아주기
					
				}
			
				
			} catch (Exception e) {
				System.out.println("글 조회 오류");
				e.printStackTrace();
				
			} finally {
				JdbcUtil.close(conn, pstmt, rs);
			}
			
			
			return list;
			
			
		}
		
		//상세보기
		public BoardVO getContent (String bno) {
			
			BoardVO vo = new BoardVO();
			/*
			 * 번호 기준으로 select 구분으로 조회해서 BoardVO에 저장하고,
			 * vo이름으로 화면에 데이터를 전달.
			 */
			
			String sql = "SELECT * FROM board WHERE bno = ? " ;
			 
			try {
				
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bno);
				
				rs = pstmt.executeQuery();
				
				//값이 하나이기에 if문도 가능
				while(rs.next()) {
					vo.setBno(rs.getInt("bno"));
					vo.setWriter(rs.getString("writer"));
					vo.setTitle(rs.getString("title"));
					vo.setContent(rs.getString("content"));
					vo.setRegdate(rs.getTimestamp("regdate"));
					vo.setHit(rs.getInt("hit"));
				}
			
				
			} catch (SQLException e) {
				System.out.println("상세보기 오류 ");
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, pstmt, rs);
			}
			
			
			return vo ;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
}
