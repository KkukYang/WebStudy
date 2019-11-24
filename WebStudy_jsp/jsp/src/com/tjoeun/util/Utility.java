package com.tjoeun.util;

import java.security.MessageDigest;
import java.util.Random;
import java.util.UUID;

//프로그램 작성에 필요한 기능을 제공하는 클래스
public class Utility {
	//문자열을 전달받아 암호화하여 반환하는 메소드 - 단방향 암호화 알고리즘 사용
	// => 단방향 암호화 알고리즘 : MD5, SHA-1, SHA-256, SHA-512 등
	// => MessageDigest 클래스를 이용하여 문자열 암호화 처리
	public static String encrypt(String source) {
		String password="";
		try {
			//MessageDigest 클래스로 객체 생성 - 싱글톤
			// => 단방향 암호화 알고리즘을 선택하여 객체 생성
			// => 존재하지 않는 알고리즘 선택시 NoSuchAlgorithmException 발생
			MessageDigest md=MessageDigest.getInstance("SHA-256");
			
			//MessageDigest.update(byte[] source) : 암호화 하고자 하는 문자열을
			//byte 배열로 전달받아 저장하는 메소드
			//String.getBytes() : String 객체를 byte 배열로 변환하여 반환하는 메소드
			md.update(source.getBytes());
			
			//MessageDigest.digest() : MessageDigest 객체에 저장된 정보로 암호화 
			//처리하여 byte 배열로 반환하는 메소드 
			byte[] digest=md.digest();
			
			//byte 배열의 요소값으로 문자열로 변환하여 저장
			for(int i=0;i<digest.length;i++) {
				//byte 배열의 요소값을 문자로 변환 처리 후 문자열에 추가
				password+=Integer.toHexString(digest[i]&0xff);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return password;
	}
	
	//새로운 비밀번호를 생성하여 반환하는 메소드
	public static String newPasswordOne() {
		String password="";
		
		String temp="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		//Random : 난수 관련 기능을 제공하는 클래스
		Random random=new Random();
		
		for(int i=1;i<=10;i++) {
			//0~35 범위의 난수를 발생하여 문자열의 문자를 반환받아 비밀번호 추가
			password+=temp.charAt(random.nextInt(36));
		}
		
		return password;
	}
	
	public static String newPasswordTwo() {
		//UUID : 범용적으로 사용되는 고유값 관련 기능을 제공하는 클래스
		//UUID.randomUUID() : 범용적으로 사용되는 고유값 정보한 객체를 반환하는 메소드
		// => 영문자(소문자), 숫자, - 문자(4)로 구성된 36Byte의 고유값 
		//UUID.toString() : UUID 객체에 저장된 고유값을 문자열로 변환하여 반환하는 메소드
		return UUID.randomUUID().toString()
				.replace("-", "").toUpperCase().substring(0, 10);
	}
}