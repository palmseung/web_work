package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import test.todo.dto.ToDoDto;
import test.util.DbcpBean;

/*
 * 
 * Application 전역에서 오직 한 개의 객체만 생성되어서 사용되는 구조로 
 * Dao 클래스 설계하기
 * 
 * 
 * 1.외부에서 객체 생성할 수 없도록 생성자의 접근 지정자를 private으로 지정
 * 2.자신의 참조값을 담을 static 필드 선언
 * 
 * 
 */
public class ToDoDao {
	//2.
	private static ToDoDao dao;
	//1.
	private ToDoDao() {}
	//3.
	public static ToDoDao getInstance() {
		if(dao==null) {//최초 호출 될 때는 null 이다.
			//null 이면 객체를 생성해서 static 참조값을 필드에 저장한다.
			dao=new ToDoDao();
		}
		return dao;
	}
	
	//할 일 전체 목록을 리턴하는 메소드
	public List<ToDoDto> getList(){
		//회원 목록을 담을 객체 생성
		List<ToDoDto> list=new ArrayList<>();
		//필요한 객체를 담을 지역변수 만들기
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connetion Pool에서 Connection 객체 하나 갖고 오기
			conn=new DbcpBean().getConn();  
			String sql="SELECT num, content, regdate FROM todo"
					+ " ORDER BY num desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ToDoDto dto=new ToDoDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
						
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				//connection pool에 connection 객체 반납
				if(conn!=null)conn.close();
			}catch (Exception e) {}
		}
		return list;
	}
	//회원 한 명의 정보 추가
	public boolean insert(ToDoDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();  
			String sql="INSERT INTO todo"
					+ " (num, content, regdate)"
					+ " VALUES(todo_seq.NEXTVAL, ?, sysdate)";
			pstmt=conn.prepareStatement(sql);
			
			int num=dto.getNum();
			String content=dto.getContent();
			String regdate=dto.getRegdate();
			
			// ?에 필요한 값 바인딩 하기
			pstmt.setString(1, content);
			flag=pstmt.executeUpdate();  // flag에는 메소드 수행 결과로 영향받은 row 갯수가 리턴됨. 이게 0보다 크면 작업 성공
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
			}
		}//finally
		
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	//회원 한 명의 정보 수정
	public boolean update(ToDoDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();  
			//실행할 sql 문의 뼈대 구성하기
			String sql = "UPDATE todo"
					+ " SET content=?"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);

			// ? 에 값 바인딩하기
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getNum());
			
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		} //finally
		
		
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	//회원 한 명의 정보 삭제
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();  
			//실행할 sql 문의 뼈대 구성하기
			String sql = "DELETE FROM todo"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			
			// ? 에 값 바인딩하기
			pstmt.setInt(1, num);

			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		} //finally

		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	//회원 한 명의 정보 리턴
	public ToDoDto getData(int num) {
		//Select 된 결과를 저장해서 리턴할 객체를 저장할 지역변수 선언
		ToDoDto dto=null;
				
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=new DbcpBean().getConn();  
			//실행할 SELECT 문 구성하기
			String sql="SELECT content, regdate"
					+ " FROM todo"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			//?에 값 바인딩 하기
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			//ResultSet 객체에서 필요한 값 얻어내기
			while(rs.next()) {
				//setter 메소드 이용하여 select 된 회원정보를 MemberDto 에 저장
				dto=new ToDoDto(); //객체 생성을 생략하면 nullpointexception 발생
				dto.setNum(num);
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		//회원정보가 담긴 ToDoDto 객체의 참조값을 리턴해준다.
		return dto;
		}
}
	
	
	
	
