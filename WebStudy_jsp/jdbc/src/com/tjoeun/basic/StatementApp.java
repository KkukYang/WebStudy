package com.tjoeun.basic;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

//키보드로 부서정보를 입력받아 DEPT 테이블에 저장하는 JDBC 프로그램 작성 
public class StatementApp {
	public static void main(String[] args) throws Exception {
		//키보드 입력스트림 생성
		BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
		
		//키보드를 이용하여 부서정보를 입력받아 저장
		System.out.println("<<부서정보 입력>>");
		System.out.print("부서번호 >> ");
		int deptno=Integer.parseInt(br.readLine());
		System.out.print("부서이름 >> ");
		String dname=br.readLine();
		System.out.print("부서위치 >> ");
		String loc=br.readLine();
		
		//DEPT 테이블에 입력받은 부서정보 저장
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		Connection con=DriverManager.getConnection(url, user, password);
		
		Statement stmt=con.createStatement();
		
		String sql="insert into dept values("+deptno+", '"+dname+"', '"+loc+"')";
		int rows=stmt.executeUpdate(sql);
		
		System.out.println("[결과]"+rows+"개의 부서정보를 저장 하였습니다.");
		
		if(stmt!=null) stmt.close();
		if(con!=null) con.close();
	}
}











