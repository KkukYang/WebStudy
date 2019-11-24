package com.tjoeun.basic;

import java.sql.Driver;
import java.sql.DriverManager;
import java.util.Enumeration;

public class OracleDriverApp {
	public static void main(String[] args) {
		//Driver ��ü�� ���ʿ��ϰ� ���� �����Ǿ� ��� ���� >> �����
		/*
		//OracleDriver Ŭ������ �̿��Ͽ� Driver ��ü ����
		OracleDriver driver=new OracleDriver();
		
		//������ Driver ��ü�� JDBC Driver ��ü�� ��� ó��
		//DriverManager.registerDriver(Driver driver) : Driver ��ü�� JDBC Driver ��ü�� ����ϱ� ���� �޼ҵ�
		try {
			DriverManager.registerDriver(driver);
		} catch (SQLException e) {
			System.out.println("[����]Driver ��ü�� ����� �� �����ϴ�.");
			System.exit(0);
		}
		*/
		
		//Class.forName(String className) : ��Ű���� ���Ե� Ŭ������ ���ڿ� ����� ���޹޾� 
		//ClassLoader ���α׷����� Ŭ������ �޸𸮿� �����ϴ� �޼ҵ� => �޸𸮿� ����� Ŭ����(Clazz)
		// => ClassNotFoundException ���ܰ� �߻��ǹǷ� �ݵ�� ����ó��
		// => Clazz ���� �� ��������(Static Block) �ȿ� ����� �ڵ� ����
		//OracleDriver Ŭ������ �о� �޸𸮿� ����� �� �ڵ����� ��ü�� �����Ǿ� JDBC Driver ��ü�� ��� 
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("[����]Driver ��ü�� ����� �� �����ϴ�.");
			System.exit(0);
		}
		
		//DriverManager.getDrivers() : JDBC Driver ��ü�� ��ϵ� Driver ��ü���� ��ȯ�ϴ� �޼ҵ�
		Enumeration<Driver> driverList=DriverManager.getDrivers();
		
		while(driverList.hasMoreElements()) {
			Driver element=driverList.nextElement();
			System.out.println("JDBC Driver ��ü = "+element);
		}
	}
}









