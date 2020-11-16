package com.myweb.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.myweb.util.JdbcUtil;

public class BoardDAO {
	//1. 나자신의 객체를 생성해서 1개로 제한합니다.
	private static BoardDAO instance = new BoardDAO();

	//2. 직접 객체를 생성할 수 없도록 생성자에도 private
	private BoardDAO() {
		//드라이버 로드
		try {
			//Class.forName("oracle.jdbc.driver.OracleDriver");
			//커넥션 풀을 얻는 작업
			InitialContext ctx = new InitialContext(); //초기 설정 정보가 저장되는 객체
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
			
		} catch (Exception e) {
			System.out.println("드라이버 호출 에러");
		}
	}
	//3. 외부에서 객체생성을 요구할 때 getter메서드를 통해 1번의 객체를 반환
	public static BoardDAO getInstance() {
		return instance;
	}
	//--------------------------------------------------------
	//DB연결 변수들을 상수로 선언
	private DataSource ds;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//글 등록 메서드
	public void regist(String writer, String title, String content) {
		
		String sql = "insert into board(bno, writer, title, content) values(board_seq.nextval, ?, ?, ?)";
		
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
	
	//글 조회 메서드
	/*
	public ArrayList<BoardVO> getList() {
		ArrayList<BoardVO> list = new ArrayList<>();

		//데이터베이스에서 번호를 내림차순으로 조회해서 리스트에
		//담는 코드를 작성.
		String sql = "select * from board order by bno desc";
		try {
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				int bno = rs.getInt("bno");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				
				BoardVO vo = new BoardVO(bno, writer, title, content, regdate, hit);//한 행을 vo에 저장
				list.add(vo); //리스트에 추가
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return list;
	}
	*/
	
	//게시글 페이지 조회
	public ArrayList<BoardVO> getList(int pageNum, int amount) {
		ArrayList<BoardVO> list = new ArrayList<>();
		
		String sql = "select *\r\n" + 
					"from(select rownum rn,\r\n" + 
					"            bno,\r\n" + 
					"            writer,\r\n" + 
					"            title,\r\n" + 
					"            content,\r\n" + 
					"            regdate,\r\n" + 
					"            hit\r\n" + 
					"     from (select *\r\n" + 
					"           from board\r\n" + 
					"           order by bno desc)\r\n" + 
					") where rn > ? and rn <= ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNum - 1) * amount  ); //(페이지번호 -1) * 데이터개수
			pstmt.setInt(2, pageNum * amount );
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				int bno = rs.getInt("bno");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				
				BoardVO vo = new BoardVO(bno, writer, title, content, regdate, hit);//한 행을 vo에 저장
				list.add(vo); //리스트에 추가
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
				
		
		return list;
	}
	
	//전체 게시글 수
	public int getTotal() {
		int total = 0;
		
		String sql = "select count(*) as total from board";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt("total");
			}
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return total;
	}
	
	
	
	//상세보기
	public BoardVO getContent(String bno) {
		BoardVO vo = new BoardVO();
		
		/*
		 * 번호 기준으로 select구문으로 조회해서 BoardVO에 저장하고,
		 * vo이름으로 화면에 데이터를 전달.
		 */
		String sql = "select * from board where bno = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno);//pstmt.setInt(1, Integer.parseInt(bno) );
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setBno( rs.getInt("bno") );
				vo.setWriter( rs.getString("writer") );
				vo.setTitle( rs.getString("title") );
				vo.setContent( rs.getString("content") );
				vo.setRegdate( rs.getTimestamp("regdate")  );
				vo.setHit( rs.getInt("hit") );
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return vo;
	}
	
	//글 업데이트 메서드
	public void update(String bno, String title, String content) {
		
		String sql = "update board set title = ?, content = ? where bno = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title );
			pstmt.setString(2, content);
			pstmt.setString(3, bno);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}

	}
	
	//글 삭제 메서드
	public void delete(String bno) {
		
		String sql = "delete from board where bno = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
	}
	
	//조회수 업데이트 메서드
	public void upHit(String bno) {
		
		String sql = "update board set hit = hit + 1 where bno = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);			
		}
		
	}
	
	
	
}




