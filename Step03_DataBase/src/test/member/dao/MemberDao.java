package test.member.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	//1.자신의 참조값을 담을 static 필드
	private static MemberDao dao;
	//2.외부에서 객체 생성할 수 없도록, 생성자의 접근 지정자를 private로 
	private MemberDao() {}
	//3.자신의 참조값을 리턴해주는 공개(public) 메소드 정의
	public static MemberDao getInstance() {
		//최초 호출될 때는 dao 필드는 null 이다.
		if(dao==null) {
			dao=new MemberDao(); // 객체 생성해서 static 참조값을 필드에 저장
		}
		return dao; //static 필드에 있는 참조값 리턴해 주기
	}
	
	//회원 전체 목록을 리턴하는 메소드
	public List<MemberDto> getList(){
		//회원 목록을 담을 객체 생성
		List<MemberDto> list=new ArrayList<>();
		//필요한 객체를 담을 지역변수 만들기
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connetion Pool에서 Connection 객체 하나 갖고 오기
			conn=new DbcpBean().getConn();  
			String sql="SELECT num, name, addr FROM member"
					+ " ORDER BY num desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberDto dto=new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				list.add(dto);
			}
						
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				//connection pool에 connection 객체 반납
				// close() 메소드를 호출하면 사용한 객체가 자동 반납됨
				if(conn!=null)conn.close();
			}catch (Exception e) {}
		}
		return list;
	}
	//회원 한 명의 정보 추가
	public boolean insert(MemberDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();  
			String sql="INSERT INTO member"
					+ " (num, name, addr)"
					+ " VALUES(member_seq.NEXTVAL, ?, ?)";
			pstmt=conn.prepareStatement(sql);
			
			//Map 객체에 저장된 value 불러오기
			int num=dto.getNum();
			String name=dto.getName();
			String addr=dto.getAddr();
			
			// ?에 필요한 값 바인딩 하기
			pstmt.setString(1, name);
			pstmt.setString(2, addr);
			flag=pstmt.executeUpdate();
			
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
	public boolean update(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();  
			//실행할 sql 문의 뼈대 구성하기
			String sql = "UPDATE member"
					+ " SET name=?, addr=?"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);

			// ? 에 값 바인딩하기
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			
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
			String sql = "DELETE FROM member"
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
	public MemberDto getData(int num) {
		//Select 된 결과를 저장해서 리턴할 객체를 저장할 지역변수 선언
		MemberDto dto=null;
				
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=new DbcpBean().getConn();  
			//실행할 SELECT 문 구성하기
			String sql="SELECT name, addr"
					+ " FROM member"
					+ " WHERE num=?";
			pstmt=conn.prepareStatement(sql);
			//?에 값 바인딩 하기
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			//ResultSet 객체에서 필요한 값 얻어내기
			while(rs.next()) {
				//setter 메소드 이용하여 select 된 회원정보를 MemberDto 에 저장
				dto=new MemberDto(); //객체 생성을 생략하면 nullpointexception 발생
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
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
		//회원정보가 담긴 MemberDto 객체의 참조값을 리턴해준다.
		return dto;
		}
	
	
}
