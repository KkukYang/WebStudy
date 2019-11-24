package com.tjoeun.dao;

import java.util.List;

public class DeptDAOApp {
	public static void main(String[] args) {
		/*
		//DEPT 테이블에 부서정보 저장
		DeptDTO addDept=new DeptDTO(50, "회계부", "서울시");

		//싱글톤 클래스는 참조변수를 생성하지 않고 객체를 반환받아 메소드를 호출하는 것 권장
		//DeptDAO dao=DeptDAO.getDAO();
		//dao.insertDept(addDept);
		DeptDAO.getDAO().insertDept(addDept);
		*/
		
		/*
		//DEPT 테이블에 저장된 부서정보 변경
		DeptDTO modifyDept=DeptDAO.getDAO().selectDept(50);
		System.out.println("부서번호 = "+modifyDept.getDeptno()+", 부서이름 = "
				+modifyDept.getDname()+", 부서위치 = "+modifyDept.getLoc());
		modifyDept.setDname("관리부");
		DeptDAO.getDAO().updateDept(modifyDept);
		*/
		
		//DEPT 테이블에 저장된 부서정보 삭제
		DeptDAO.getDAO().deleteDept(50);
		
		//DEPT 테이블에 저장된 모든 부서정보 출력
		List<DeptDTO> deptList=DeptDAO.getDAO().selectAllDept();
		for(DeptDTO dept:deptList) {
			System.out.println("부서번호 = "+dept.getDeptno()+", 부서이름 = "
					+dept.getDname()+", 부서위치 = "+dept.getLoc());
		}
	}
}









