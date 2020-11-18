package com.testweb.board.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.testweb.util.JdbcUtil;


public class BoardDAO {

	//싱글톤
	private static BoardDAO instance = new BoardDAO();

	private BoardDAO() {
		//드라이버 로드
		try {
			InitialContext ctx = new InitialContext(); // 초기 설정 정보가 저장되는 객체
			ds= (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");

		} catch (Exception e) {
			System.out.println("드라이버 호출 에러");
		}
	}

	//외부에서 사용하기 위한 생성자 
	public static BoardDAO getInstance() {
		return instance;
	}


	private DataSource ds;

	private Connection conn = null;
	private PreparedStatement pstmt= null;
	private ResultSet rs = null;

	
	
	//글등록 메서드
	public void regist(String writer,String title, String content) {
		String sql = "insert into testboard (bno,writer,title,content) values(board_seq.nextval,?,?,?)";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);

			pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, null);
		}

	}
	

	//목록조회
	public ArrayList<BoardVO> getList( int pageNum, int amount) {
		ArrayList<BoardVO> list= new ArrayList<>();

		String sql = "SELECT *" + 
				"FROM(" + 
				"        SELECT rownum rn," + 
				"                    bno," + 
				"                    writer," + 
				"                    title," + 
				"                    content," + 
				"                    regdate" + 
				"        FROM (" + 
				"            SELECT *" + 
				"            FROM  bbs " + 
				"            ORDER BY bno DESC  ) " + 
				")where rn > ? and rn <= ? ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNum -1 )* amount );//(페이지번호-1) * 데이터 갯수
			pstmt.setInt(2, pageNum * amount);
			rs = pstmt.executeQuery(); 

			while (rs.next()) {
				int bno = rs.getInt("bno");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");


				//vo에 넣어주고
				BoardVO vo = new BoardVO(bno, writer, title, content, regdate);

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

	//전체 게시글 수 
	public int getTotal() {
		int total = 0;

		String sql = "SELECT count(*)  as total FROM testboard ";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();

			if(rs.next()) {
				total =rs.getInt("total");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}

		return total;
	}


	//글 상세보기
	public BoardVO getContent (String bno) {

		BoardVO vo = new BoardVO();
		String sql = "SELECT * FROM testboard WHERE bno = ? " ;

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

			}


		} catch (SQLException e) {
			System.out.println("상세보기 오류 ");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}


		return vo ;
	}

	//게사글 수정 처리
	public void update(String bno, String title, String content) {

		String sql = "update testboard set title = ? , content = ? where bno = ?";			

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, bno);

			int result =pstmt.executeUpdate(); 
			//rs는 1또는 0인 값을 리턴해주기에 사용하지 않음

			
			if(result ==1) {
				System.out.println("수정성공");
			}else {
				System.out.println("수정실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}

	}


	
	//메인화면 최신 공지글 10개 출력
		public ArrayList<BoardVO> mainList() {
			ArrayList<BoardVO> list = new ArrayList<>();
			
			String sql = "SELECT * \r\n" + 
					"FROM(\r\n" + 
					"    SELECT ROWNUM r, \r\n" + 
					"           bno,\r\n" + 
					"           writer,\r\n" + 
					"           title,\r\n" + 
					"           content,\r\n" + 
					"           regdate\r\n" + 
					"    FROM (SELECT *\r\n" + 
					"          FROM bbs\r\n" + 
					"          ORDER BY bno DESC)\r\n" + 
					"    ) \r\n" + 
					"WHERE r > 0 AND r <= 10";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					int bno = Integer.parseInt(rs.getString("bno")); 
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String content = rs.getString("content");
					Timestamp regdate = rs.getTimestamp("regdate");
					
					
					BoardVO vo = new BoardVO (bno, writer, title, content, regdate);
					list.add(vo);
				}
			} catch (Exception e) {
				System.out.println("mainList()메서드 에러 발생");
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, pstmt, rs);
			}
			
			return list;
			
		}

	
	
	//삭제
	public void delete(String bno) {
		String sql = "delete from testboard WHERE bno = ?";

		try {
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno );

			int result= pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}

		return result;
	}





		
		//페이징 처리, 게시글
		public ArrayList<BoardVO> getList(int pageNum, int amount){
				
			ArrayList<BoardVO> list = new ArrayList<>();
			
			//sql 생성
			String sql = "SELECT * FROM( "+ 
					"    SELECT ROWNUM rn," + 
					"           bno," + 
					"           writer," + 
					"           title," + 
					"           content," + 
					"           regdate" + 
					"    FROM (" + 
					"    SELECT * FROM bbs " + 
					"    ORDER BY bno DESC)" + 
					"    )" + 
					"WHERE RN > ? AND RN <= ?";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, (pageNum - 1)*amount);
				pstmt.setInt(2, pageNum*amount);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					int bno = rs.getInt("bno");
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String content = rs.getString("content");
					Timestamp regdate = rs.getTimestamp("regdate");
					
					BoardVO  vo = new BoardVO (bno, writer, title, content, regdate);
					list.add(vo);
				}	
			} catch (Exception e) {
				System.out.println("getList()메서드 에러 발생");
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, pstmt, rs);
			}
			return list;	
		}
		
		
		public ArrayList<BoardVO > mypage(String id) {
			ArrayList<BBoardVO > list = new ArrayList<>();
			
			String sql = "SELECT * " + 
						"FROM bbs b\r\n" + 
						"LEFT OUTER JOIN members m\r\n" + 
						"ON b.writer = m.id\r\n" + 
						"where b.writer = ?\r\n" + 
						"ORDER BY b.bno DESC";
			
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					int bno = Integer.parseInt(rs.getString("bno")); 
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String content = rs.getString("content");
					Timestamp regdate = rs.getTimestamp("regdate");
					
					
					BoardVO  vo = new BoardVO (bno, writer, title, content, regdate);
					list.add(vo);
					
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
			
			//전체 게시글 조회 sql
			String sql = "SELECT count(*) as total FROM bbs";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					total = rs.getInt("total");
				}
				
			} catch (Exception e) {
				System.out.println("getTotal()메서드 에러 발생");
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, pstmt, rs);
				
			}
			return total;
		
		
		
}
