package com.tjoeun.basic;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//키보드로 부서이름을 입력받아 DEPT 테이블에 저장된 해당 부서정보를 검색하여 출력하는 JDBC 프로그램 작성
public class DeptSearchApp {
	public static void main(String[] args) throws Exception {
		BufferedReader br=new BufferedReader(new InputStreamReader(System.in));

		System.out.println("<<부서정보 검색>>");
		System.out.print("검색할 부서이름 >> ");
		String dname=br.readLine();
		
		//DEPT 테이블에 저장된 부서정보를 검색하여 출력
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		Connection con=DriverManager.getConnection(url, user, password);
		
		/*
		Statement stmt=con.createStatement();
		
		//Statement 객체는 InSQL 공격에 취약
		// => InSQL : 입력값으로 SQL 구문을 전달하여 SQL 명령을 조작하는 공격 방법
		String sql="select * from dept where dname='"+dname+"'";
		ResultSet rs=stmt.executeQuery(sql);
		*/
		
		//InSQL 공격을 대비하기 위해 PreparedStatement 객체를 이용하는 것을 권장
		String sql="select * from dept where dname=?";
		PreparedStatement stmt=con.prepareStatement(sql);
		stmt.setString(1, dname);
		
		ResultSet rs=stmt.executeQuery();
		
		if(rs.next()) {
			do {
				System.out.println("[결과]부서번호 = "+rs.getInt("deptno")
					+", 부서이름 = "+rs.getString("dname")+", 부서위치 = "+rs.getString("loc"));
			} while(rs.next());
		} else {
			System.out.println("[결과]검색된 부서정보가 없습니다.");
		}
		
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		if(con!=null) con.close();
	}
}
