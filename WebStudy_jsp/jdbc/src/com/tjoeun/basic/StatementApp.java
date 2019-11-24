package com.tjoeun.basic;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

//Ű����� �μ������� �Է¹޾� DEPT ���̺� �����ϴ� JDBC ���α׷� �ۼ� 
public class StatementApp {
	public static void main(String[] args) throws Exception {
		//Ű���� �Է½�Ʈ�� ����
		BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
		
		//Ű���带 �̿��Ͽ� �μ������� �Է¹޾� ����
		System.out.println("<<�μ����� �Է�>>");
		System.out.print("�μ���ȣ >> ");
		int deptno=Integer.parseInt(br.readLine());
		System.out.print("�μ��̸� >> ");
		String dname=br.readLine();
		System.out.print("�μ���ġ >> ");
		String loc=br.readLine();
		
		//DEPT ���̺� �Է¹��� �μ����� ����
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="scott";
		String password="tiger";
		Connection con=DriverManager.getConnection(url, user, password);
		
		Statement stmt=con.createStatement();
		
		String sql="insert into dept values("+deptno+", '"+dname+"', '"+loc+"')";
		int rows=stmt.executeUpdate(sql);
		
		System.out.println("[���]"+rows+"���� �μ������� ���� �Ͽ����ϴ�.");
		
		if(stmt!=null) stmt.close();
		if(con!=null) con.close();
	}
}











