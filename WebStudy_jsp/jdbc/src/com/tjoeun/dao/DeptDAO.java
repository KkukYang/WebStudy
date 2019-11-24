package com.tjoeun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//DAO(Data Access Object) 클래스 : DataSource(File, DBMS 등)에 접근하여 정보(행)의 저장
//, 삭제, 변경, 검색 기능을 메소드로 제공하는 클래스 - 인터페이스를 상속받아 작성
// => 싱글톤 클래스로 작성하는 것을 권장
//싱글톤 클래스 : 프로그램에 객체를 하나만 제공되도록 작성된 클래스
public class DeptDAO extends AbstractDAO {
	//클래스의 객체를 저장하기 위한 필드 선언
	private static DeptDAO _dao;
	
	//생성자 은닉화 선언 >> 클래스 외부에서 객체 생성 불가
	private DeptDAO() {
		// TODO Auto-generated constructor stub
	}

	//객체를 생성하여 시스템 필드에 저장
	static {
		_dao=new DeptDAO();		
	}
	
	//시스템 필드에 저장된 객체를 반환하는 메소드
	public static DeptDAO getDAO() {
		return _dao;
	}
	
	//부서정보를 전달받아 DEPT 테이블에 저장하고 삽입행의 갯수를 반환하는 메소드
	public int insertDept(DeptDTO dept) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into dept values(?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, dept.getDeptno());
			pstmt.setString(2, dept.getDname());
			pstmt.setString(3, dept.getLoc());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertDept() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//부서정보를 전달받아 DEPT 테이블에 저장된 부서정보를 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateDept(DeptDTO dept) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update dept set dname=?,loc=? where deptno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dept.getDname());
			pstmt.setString(2, dept.getLoc());
			pstmt.setInt(3, dept.getDeptno());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateDept() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//부서코드를 전달받아 DEPT 테이블에 저장된 부서정보를 삭제하고 삭제행의 갯수를 반환하는 메소드
	public int deleteDept(int deptno) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from dept where deptno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteDept() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//부서코드를 전달받아 DEPT 테이블에 저장된 해당 부서정보를 검색하여 반환하는 메소드 => 단일행 검색
	public DeptDTO selectDept(int deptno) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DeptDTO dept=null;
		try {
			con=getConnection();
			
			String sql="select * from dept where deptno=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {//검색행이 있는 경우
				//DTO 객체를 생성하여 검색행의 컬럼값을 이용하여 필드값 변경
				dept=new DeptDTO();
				dept.setDeptno(rs.getInt("deptno"));
				dept.setDname(rs.getString("dname"));
				dept.setLoc(rs.getString("loc"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectDept() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return dept;
	}
	
	//DEPT 테이블에 저장된 모든 부서정보를 검색하여 반환하는 메소드 => 다중행 검색
	public List<DeptDTO> selectAllDept() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<DeptDTO> deptList=new ArrayList<DeptDTO>();
		try {
			con=getConnection();
			
			String sql="select * from dept order by deptno";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				DeptDTO dept=new DeptDTO();
				dept.setDeptno(rs.getInt("deptno"));
				dept.setDname(rs.getString("dname"));
				dept.setLoc(rs.getString("loc"));
				//DTO 객체를 List 객체에 추가
				deptList.add(dept);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllDept() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return deptList;
	}
}










