package com.tjoeun.basic;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

//키보드로 부서정보를 입력받아 DEPT 테이블에 저장하는 JDBC 프로그램 작성 
public class PreparedStatementApp {
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
			
		//PreparedStatement : 객체에 저장된 SQL 명령을 전달하여 실행된 결과를 반환하는 객체
		// => SQL 명령에 InParameter(? : 외부값을 전달받기 위한 기호)를 이용하여 작성
		String sql="insert into dept values(?,?,?)";
		//Connection.prepareStatement(String sql) : SQL 명령이 저장된 PreparedStatement 객체를 반환하는 메소드
		PreparedStatement pstmt=con.prepareStatement(sql);
		//PreparedStatement.setXXX(int index, XXX value) : PreparedStatement 객체에
		//저장된 SQL 명령의 InParameter에 값을 전달하는 메소드
		// => XXX : Java 자료형
		// => InParameter 갯수만큼 메소드 호출해야만 SQL 명령 완성
		pstmt.setInt(1, deptno);
		pstmt.setString(2, dname);
		pstmt.setString(3, loc);
		
		//PreparedStatement.executeUpdate() 메소드 또는 PreparedStatement.executeQuery()
		//메소드를 호출하여 PreparedStatement 객체에 저장된 SQL 명령 전달
		int rows=pstmt.executeUpdate();
		
		System.out.println("[결과]"+rows+"개의 부서정보를 저장 하였습니다.");
		
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
	}
}





