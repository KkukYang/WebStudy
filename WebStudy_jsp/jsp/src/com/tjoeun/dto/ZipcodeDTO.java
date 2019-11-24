package com.tjoeun.dto;

/*
http://www.postman.pe.kr/zipcode/index.html ���� �����ȣ �������� �ٿ�ε�(zip����)

�����ȣ ���������� csv ����(zipcode.csv)�� ��ȯ�Ͽ� ���� - Excel �̿�
 
create table zip(zipcode varchar2(40),sido varchar2(46)
	,gugun varchar2(40),dong varchar2(40),ri varchar2(45)
	,bldg varchar2(70),bunji varchar2(20),seq varchar2(15));

zipcode.csv ������ �̿��� zip ���̺� ����Ÿ ����Ʈ

create table zipcode(zipcode, dong, address) as select zipcode,DONG,
	SIDO||' '||GUGUN||' '||DONG||' '||RI||' '||BLDG||' '||BUNJI from zip;
*/

public class ZipcodeDTO {
	private String zipcode;
	private String dong;
	private String address;
	
	public ZipcodeDTO() {
		// TODO Auto-generated constructor stub
	}

	public ZipcodeDTO(String zipcode, String dong, String address) {
		super();
		this.zipcode = zipcode;
		this.dong = dong;
		this.address = address;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}
