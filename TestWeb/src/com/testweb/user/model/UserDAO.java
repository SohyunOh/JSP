package com.testweb.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.testweb.util.JdbcUtil;

public class UserDAO {
	
	//1개로 제한
	private static UserDAO instance = new UserDAO();
	
	
	private UserDAO() {
		//드라이버 로드 -- 커넥트 풀
		try {
			
			InitialContext ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
			
		} catch (Exception e) {
			System.out.println("드라이버 호출 에러");
		}
		
	}
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	private DataSource ds;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	//화원가입 메서드 -- 성공 실패 여부
	public int join(UserVO vo) {
		
		int result = 0;
		
		String sql = "INSERT INTO testuser (id,pw,name,ph1,ph2,ph3,email,email2,address,addressinfo) "
				+ "VALUES (?,?,?,?,?,?,?,?,?,?) ";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPh1());
			pstmt.setString(5, vo.getPh2());
			pstmt.setString(6, vo.getPh3());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getEmail2());
			pstmt.setString(9, vo.getAddress());
			pstmt.setString(10, vo.getAddressinfo());
			
			result = pstmt.executeUpdate(); //결과 여부
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, null);
			
		}
		
		
		return result;
		
	}
	

	//중복검사 메서드 , (조건) where id =? 
	public int checkId(String id) {
		int result =0;
		
		String sql = "select * from testuser where id =?";
		
		try {
		// conn=DriverManager.getConnection(url, uid, upw);
			conn=ds.getConnection();
			
		 pstmt = conn.prepareStatement(sql);
		 pstmt.setString(1, id);
		 
		 //select 구문인 경우의 실행 
		 rs = pstmt.executeQuery();// rs 결과로 반환
		 
		 //rs가 한줄인 경우와 아닌경우
		 if(rs.next()) { //rs.next() 존재한다는 것은 중복
			 result = 1 ; 
		 }else {//존재하지 않는다면 중복이 아님
			 result = 0;
		 }
		 
		} catch (Exception e) {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	//로그인
		public UserVO login(String id, String pw) {
			UserVO vo = null;
			
			String sql = "SELECT * FROM testuser "
							+ "where id = ? and pw = ? ";
			
			try {
				//연결
//				conn =DriverManager.getConnection(url, uid, upw);
				conn = ds.getConnection();
				
				// 생성
				pstmt = conn.prepareStatement(sql);
				//문자형으로 순서대로  
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				
				//셀렉트구분 실행
				rs = pstmt.executeQuery();
				
				if(rs.next()) { //다음이 존재한다는건 id,pw가 일치 = 로그인 검증 됨.
					
					//rs에 담긴 결과를 뽑을 때는, rs.getString(컬럼명),rs.getInt(컬럼명),rs.getTimestamp(컬럼명)
					//비번을 알수 없는 결과이므로 뽑지 않음
					vo = new UserVO();
					vo.setId( rs.getString("id") );
					vo.setName( rs.getString("name"));
					vo.setPh1 (rs.getString("ph1"));
					vo.setPh2 (rs.getString("ph2"));
					vo.setPh3 (rs.getString("ph3"));
					vo.setEmail( rs.getString("email") );
					vo.setEmail2( rs.getString("email2") );
					vo.setAddress( rs.getString("address") );
					vo.setAddressinfo( rs.getString("addressinfo") );
					
					
				}else {// 로그인 검증 실패
					vo = null;
					
				}
				
			} catch (Exception e) { 
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, pstmt, rs);
			}
			
			return vo;
		}
		
		//회원수정 
		public int update(UserVO vo) {
			int result = 0;
			String sql = "update testuser "
					   + "set pw = ?, "
						   + "name = ?, "
						   + "ph1 = ?, "
						   + "ph2 = ?, "
						   + "ph3 = ?, "
						   + "email= ?, "
						   + "email2= ?, "
						   + "address = ?, "
						   + "addressinfo = ? "
					   + "where id = ?";
			
			try {
				//연결
				conn = ds.getConnection();
				
				//pstmt 생성 -- spl 전달 
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getPw());
				pstmt.setString(2, vo.getName());
				pstmt.setString(3, vo.getPh1());
				pstmt.setString(4, vo.getPh2());
				pstmt.setString(5, vo.getPh3());
				pstmt.setString(6, vo.getEmail());
				pstmt.setString(7, vo.getEmail2());
				pstmt.setString(8, vo.getAddress());
				pstmt.setString(9, vo.getAddressinfo());
				pstmt.setString(10, vo.getId());
				
				
				//성공시 1, 실패시 0
				result = pstmt.executeUpdate();
				
				
			} catch (Exception e) {
				System.out.println("에러발생");
				e.printStackTrace();
			} finally {// 성공하든 실패하든 클로즈로 닿아주기
				JdbcUtil.close(conn, pstmt, rs);
			}
		
			return result;
		}
		
		//회원 탈퇴
		public int delete(String id) {
			int result = 0;
			String sql = "DELETE FROM testuser where id = ? " ; 
			
			try {

				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				
				//성공시 1, 실패0
				result = pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println("삭제 에러 발생");
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, pstmt, rs);
			}
		
			return result;
		}
		
	}


