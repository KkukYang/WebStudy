package com.tjoeun.dao;

//DTO(Data Transfer Object) 클래스 : DAO 클래스의 메소드에 정보를 전달하거나 반환하기 위해 작성하는 클래스
// => 필드에 필요한 값을 저장하기 위한 클래스
// => 테이블의 컬럼과 1:1로 매칭되는 필드 선언

/*
desc dept; 
이름     널?       유형           
------ -------- ------------ 
DEPTNO NOT NULL NUMBER(2)    
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13) 
 */
public class DeptDTO {
	private int deptno;
	private String dname;
	private String loc;
	
	//Default Constructor 생성 : Ctrl+Space >> Constructor 선택 >> 엔터
	public DeptDTO() {
		// TODO Auto-generated constructor stub
	}

	//Constructor 생성 : Alt+Shift+S >> O >> 필드 선택 >> Generate
	public DeptDTO(int deptno, String dname, String loc) {
		super();
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
	}

	//Getter & Setter 생성 : Alt+Shift+S >> R >> 필드 선택 >> Generate
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










