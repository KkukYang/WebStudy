package com.tjoeun.basic;

import java.sql.Driver;
import java.sql.DriverManager;
import java.util.Enumeration;

public class OracleDriverApp {
	public static void main(String[] args) {
		//Driver 객체가 불필요하게 많이 생성되어 등록 가능 >> 비권장
		/*
		//OracleDriver 클래스를 이용하여 Driver 객체 생성
		OracleDriver driver=new OracleDriver();
		
		//생성된 Driver 객체를 JDBC Driver 객체로 등록 처리
		//DriverManager.registerDriver(Driver driver) : Driver 객체를 JDBC Driver 객체로 등록하기 위한 메소드
		try {
			DriverManager.registerDriver(driver);
		} catch (SQLException e) {
			System.out.println("[에러]Driver 객체를 등록할 수 없습니다.");
			System.exit(0);
		}
		*/
		
		//Class.forName(String className) : 패키지가 포함된 클래스를 문자열 상수로 전달받아 
		//ClassLoader 프로그램으로 클래스를 메모리에 저장하는 메소드 => 메모리에 저장된 클래스(Clazz)
		// => ClassNotFoundException 예외가 발생되므로 반드시 예외처리
		// => Clazz 생성 후 정적영역(Static Block) 안에 명령이 자동 실행
		//OracleDriver 클래스를 읽어 메모리에 저장된 후 자동으로 객체가 생성되어 JDBC Driver 객체로 등록 
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("[에러]Driver 객체를 등록할 수 없습니다.");
			System.exit(0);
		}
		
		//DriverManager.getDrivers() : JDBC Driver 객체로 등록된 Driver 객체들을 반환하는 메소드
		Enumeration<Driver> driverList=DriverManager.getDrivers();
		
		while(driverList.hasMoreElements()) {
			Driver element=driverList.nextElement();
			System.out.println("JDBC Driver 객체 = "+element);
		}
	}
}









