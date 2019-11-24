package com.tjoeun.dto;

/*
create table member(id varchar2(30) primary key, passwd varchar2(200)
    , name varchar2(30), email varchar2(50), mobile varchar2(20)
    , zipcode varchar2(10) ,address1 varchar2(100)
    , address2 varchar2(100),status number(1));
 */

/*
�̸�       ��?       ����            
-------- -------- ------------- 
ID       NOT NULL VARCHAR2(30)  
PASSWD            VARCHAR2(200) 
NAME              VARCHAR2(30)  
EMAIL             VARCHAR2(50)  
MOBILE            VARCHAR2(20)  
ZIPCODE           VARCHAR2(10)  
ADDRESS1          VARCHAR2(100) 
ADDRESS2          VARCHAR2(100) 
STATUS            NUMBER(1)       ���� : 1(�Ϲ� - �⺻), 9(������)
*/

//ȸ�������� �����Ͽ� �����ϱ� ���� Ŭ����
public class MemberDTO {
	private String id;
	private String passwd;
	private String name;
	private String email;
	private String mobile;
	private String zipcode;
	private String address1;
	private String address2;
	private int status;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}







