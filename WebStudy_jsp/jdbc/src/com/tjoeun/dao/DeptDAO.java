package com.tjoeun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//DAO(Data Access Object) Ŭ���� : DataSource(File, DBMS ��)�� �����Ͽ� ����(��)�� ����
//, ����, ����, �˻� ����� �޼ҵ�� �����ϴ� Ŭ���� - �������̽��� ��ӹ޾� �ۼ�
// => �̱��� Ŭ������ �ۼ��ϴ� ���� ����
//�̱��� Ŭ���� : ���α׷��� ��ü�� �ϳ��� �����ǵ��� �ۼ��� Ŭ����
public class DeptDAO extends AbstractDAO {
	//Ŭ������ ��ü�� �����ϱ� ���� �ʵ� ����
	private static DeptDAO _dao;
	
	//������ ����ȭ ���� >> Ŭ���� �ܺο��� ��ü ���� �Ұ�
	private DeptDAO() {
		// TODO Auto-generated constructor stub
	}

	//��ü�� �����Ͽ� �ý��� �ʵ忡 ����
	static {
		_dao=new DeptDAO();		
	}
	
	//�ý��� �ʵ忡 ����� ��ü�� ��ȯ�ϴ� �޼ҵ�
	public static DeptDAO getDAO() {
		return _dao;
	}
	
	//�μ������� ���޹޾� DEPT ���̺� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
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
			System.out.println("[����]insertDept() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//�μ������� ���޹޾� DEPT ���̺� ����� �μ������� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
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
			System.out.println("[����]updateDept() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//�μ��ڵ带 ���޹޾� DEPT ���̺� ����� �μ������� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
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
			System.out.println("[����]deleteDept() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//�μ��ڵ带 ���޹޾� DEPT ���̺� ����� �ش� �μ������� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ� => ������ �˻�
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
			
			if(rs.next()) {//�˻����� �ִ� ���
				//DTO ��ü�� �����Ͽ� �˻����� �÷����� �̿��Ͽ� �ʵ尪 ����
				dept=new DeptDTO();
				dept.setDeptno(rs.getInt("deptno"));
				dept.setDname(rs.getString("dname"));
				dept.setLoc(rs.getString("loc"));
			}
		} catch (SQLException e) {
			System.out.println("[����]selectDept() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return dept;
	}
	
	//DEPT ���̺� ����� ��� �μ������� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ� => ������ �˻�
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
				//DTO ��ü�� List ��ü�� �߰�
				deptList.add(dept);
			}
		} catch (SQLException e) {
			System.out.println("[����]selectAllDept() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return deptList;
	}
}










