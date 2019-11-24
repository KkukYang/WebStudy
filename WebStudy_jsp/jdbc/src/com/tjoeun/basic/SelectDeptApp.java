package com.tjoeun.basic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//DEPT 테이블에 저장된 모든 부서정보를 검색하여 출력하는 JDBC 프로그램 작성
public class SelectDeptApp {
	public static void main(String[] args) {
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user="scott";
			String password="tiger";
			con=DriverManager.getConnection(url, user, password);
			
			stmt=con.createStatement();
			
			String sql="select * from dept order by deptno";
			//ResultSet : 검색행 정보를 저장하기 위한 객체
			// => 커서를 이용하여 하나의 행만 처리 가능
			// => 커서는 ResultSet 객체의 BOF(Before Of File) 영역에 위치
			rs=stmt.executeQuery(sql);
			
			//ResultSet.next() : 커서를 다음행으로 이동하는 메소드
			// => 이동된 커서 위치에 EOF(End Of File)가 존재할 경우 false 반환
			// => 이동된 커서 위치에 검색행이 존재할 경우 true 반환
			/*
			if(rs.next()) {
				System.out.println("[결과]검색된 부서정보가 있습니다.");
			} else {
				System.out.println("[결과]검색된 부서정보가 없습니다.");
			}
			*/
			
			while(rs.next()) {
				//ResultSet.getXXX({int columnIndex|String columnName) : 커서 위치의 검색행에 대한 컬럼값을 반환하는 메소드
				// => XXX : Java 자료형 - Oracle 자료형에 상관없이 getString() 메소드를 이용하여 문자열로 반환
				// => columnIndex : 검색대상에 대한 순서(Index)
				// => columnName : 검색대상에 대한 이름(columnName, AliasName) - 권장
				//int deptno=rs.getInt(1);
				int deptno=rs.getInt("deptno");
				String dname=rs.getString("dname");
				String loc=rs.getString("loc");
				
				System.out.println("부서번호 = "+deptno+", 부서이름 = "+dname+", 부서위치 = "+loc);
			}
		} catch (ClassNotFoundException e) {
			System.out.println("[에러]드라이버 클래스를 찾을 수 없습니다.");
		} catch (SQLException e) {
			System.out.println("[에러]SQL 오류 = "+e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(con!=null) con.close();
			} catch (SQLException e) {}
		}
	}
}





