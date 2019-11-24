package com.tjoeun.util;

import java.security.MessageDigest;
import java.util.Random;
import java.util.UUID;

//���α׷� �ۼ��� �ʿ��� ����� �����ϴ� Ŭ����
public class Utility {
	//���ڿ��� ���޹޾� ��ȣȭ�Ͽ� ��ȯ�ϴ� �޼ҵ� - �ܹ��� ��ȣȭ �˰��� ���
	// => �ܹ��� ��ȣȭ �˰��� : MD5, SHA-1, SHA-256, SHA-512 ��
	// => MessageDigest Ŭ������ �̿��Ͽ� ���ڿ� ��ȣȭ ó��
	public static String encrypt(String source) {
		String password="";
		try {
			//MessageDigest Ŭ������ ��ü ���� - �̱���
			// => �ܹ��� ��ȣȭ �˰����� �����Ͽ� ��ü ����
			// => �������� �ʴ� �˰��� ���ý� NoSuchAlgorithmException �߻�
			MessageDigest md=MessageDigest.getInstance("SHA-256");
			
			//MessageDigest.update(byte[] source) : ��ȣȭ �ϰ��� �ϴ� ���ڿ���
			//byte �迭�� ���޹޾� �����ϴ� �޼ҵ�
			//String.getBytes() : String ��ü�� byte �迭�� ��ȯ�Ͽ� ��ȯ�ϴ� �޼ҵ�
			md.update(source.getBytes());
			
			//MessageDigest.digest() : MessageDigest ��ü�� ����� ������ ��ȣȭ 
			//ó���Ͽ� byte �迭�� ��ȯ�ϴ� �޼ҵ� 
			byte[] digest=md.digest();
			
			//byte �迭�� ��Ұ����� ���ڿ��� ��ȯ�Ͽ� ����
			for(int i=0;i<digest.length;i++) {
				//byte �迭�� ��Ұ��� ���ڷ� ��ȯ ó�� �� ���ڿ��� �߰�
				password+=Integer.toHexString(digest[i]&0xff);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return password;
	}
	
	//���ο� ��й�ȣ�� �����Ͽ� ��ȯ�ϴ� �޼ҵ�
	public static String newPasswordOne() {
		String password="";
		
		String temp="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		//Random : ���� ���� ����� �����ϴ� Ŭ����
		Random random=new Random();
		
		for(int i=1;i<=10;i++) {
			//0~35 ������ ������ �߻��Ͽ� ���ڿ��� ���ڸ� ��ȯ�޾� ��й�ȣ �߰�
			password+=temp.charAt(random.nextInt(36));
		}
		
		return password;
	}
	
	public static String newPasswordTwo() {
		//UUID : ���������� ���Ǵ� ������ ���� ����� �����ϴ� Ŭ����
		//UUID.randomUUID() : ���������� ���Ǵ� ������ ������ ��ü�� ��ȯ�ϴ� �޼ҵ�
		// => ������(�ҹ���), ����, - ����(4)�� ������ 36Byte�� ������ 
		//UUID.toString() : UUID ��ü�� ����� �������� ���ڿ��� ��ȯ�Ͽ� ��ȯ�ϴ� �޼ҵ�
		return UUID.randomUUID().toString()
				.replace("-", "").toUpperCase().substring(0, 10);
	}
}