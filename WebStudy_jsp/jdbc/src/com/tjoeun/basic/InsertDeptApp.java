package com.tjoeun.basic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

//DEPT 테이블에 새로운 부서정보를 저장하는 JDBC 프로그램 작성
public class InsertDeptApp {
	public static void main(String[] args) {
		//JDBC 관련 자원정보를 저장하기 위한 참조변수는 try 영역 밖에서 선언
		// => 다른 영역에서 참조변수를 이용하여 객체 사용 가능
		Connection con=null;
		Statement stmt=null;
		try {
			//1.Driver 객체를 생성하여 JDBC Driver 객체로 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//2.DBMS 서버에 접속하여 접속정보를 반환받아 저장
			//DriverManager.getConnection(String url, String user, String password) : 
			//DBMS 서버에 접속하여 Connection 객체(접속정보)를 반환하는 메소드
			//URL : 인터넷에 존재하는 자원을 표현하기 위한 주소
			//Oracle URL >> jdbc:oracle:thin:@ServerName:Port:SID
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user="scott";
			String password="tiger";
			con=DriverManager.getConnection(url, user, password);
			//System.out.println("Connection 객체 = "+con);
			
			//3.SQL 명령을 전달하기 위한 객체를 반환받아 저장
			//Connection.createStatement() : SQL 명령을 전달하기 위한 Statement 객체를 반환하는 메소드
			stmt=con.createStatement();
			
			//4.SQL 명령을 전달하여 실행된 결과를 반환받아 저장
			//Statement.executeUpdate(String sql) : SQL 명령(DML - INSERT,UPDATE,DELETE)을  
			//전달하여 실행된 결과(조작행의 갯수 - int)를 반환하는 메소드
			//Statement.executeQuery(String sql) : SQL 명령(DQL - SELECT)을 전달하여 실행된
			//결과(검색행 - ResultSet 객체)를 반환하는 메소드
			String sql="insert into dept values(90,'총무부','수원시')";
			int rows=stmt.executeUpdate(sql);
			
			//5.반환받은 결과를 이용한 처리 작업
			System.out.println("[결과]"+rows+"개의 부서정보를 저장 하였습니다.");
		} catch (ClassNotFoundException e) {
			System.out.println("[에러]드라이버 클래스를 찾을 수 없습니다.");
		} catch (SQLException e) {
			System.out.println("[에러]SQL 오류 = "+e.getMessage());
		} finally {
			//6.JDBC 관련 객체 제거 - Connection 객체 필수 제거
			// => 생성 순서 반대로 객체 제거
			try {
				if(stmt!=null) stmt.close();
				if(con!=null) con.close();
			} catch (SQLException e) {	}
		}
		
	}
}







