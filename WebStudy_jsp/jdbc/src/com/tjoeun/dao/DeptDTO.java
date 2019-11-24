package com.tjoeun.dao;

//DTO(Data Transfer Object) Ŭ���� : DAO Ŭ������ �޼ҵ忡 ������ �����ϰų� ��ȯ�ϱ� ���� �ۼ��ϴ� Ŭ����
// => �ʵ忡 �ʿ��� ���� �����ϱ� ���� Ŭ����
// => ���̺��� �÷��� 1:1�� ��Ī�Ǵ� �ʵ� ����

/*
desc dept; 
�̸�     ��?       ����           
------ -------- ------------ 
DEPTNO NOT NULL NUMBER(2)    
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13) 
 */
public class DeptDTO {
	private int deptno;
	private String dname;
	private String loc;
	
	//Default Constructor ���� : Ctrl+Space >> Constructor ���� >> ����
	public DeptDTO() {
		// TODO Auto-generated constructor stub
	}

	//Constructor ���� : Alt+Shift+S >> O >> �ʵ� ���� >> Generate
	public DeptDTO(int deptno, String dname, String loc) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
	}

	//Getter & Setter ���� : Alt+Shift+S >> R >> �ʵ� ���� >> Generate
	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}
}










