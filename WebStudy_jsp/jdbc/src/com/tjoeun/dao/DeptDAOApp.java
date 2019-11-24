package com.tjoeun.dao;

import java.util.List;

public class DeptDAOApp {
	public static void main(String[] args) {
		/*
		//DEPT ���̺� �μ����� ����
		DeptDTO addDept=new DeptDTO(50, "ȸ���", "�����");

		//�̱��� Ŭ������ ���������� �������� �ʰ� ��ü�� ��ȯ�޾� �޼ҵ带 ȣ���ϴ� �� ����
		//DeptDAO dao=DeptDAO.getDAO();
		//dao.insertDept(addDept);
		DeptDAO.getDAO().insertDept(addDept);
		*/
		
		/*
		//DEPT ���̺� ����� �μ����� ����
		DeptDTO modifyDept=DeptDAO.getDAO().selectDept(50);
		System.out.println("�μ���ȣ = "+modifyDept.getDeptno()+", �μ��̸� = "
				+modifyDept.getDname()+", �μ���ġ = "+modifyDept.getLoc());
		modifyDept.setDname("������");
		DeptDAO.getDAO().updateDept(modifyDept);
		*/
		
		//DEPT ���̺� ����� �μ����� ����
		DeptDAO.getDAO().deleteDept(50);
		
		//DEPT ���̺� ����� ��� �μ����� ���
		List<DeptDTO> deptList=DeptDAO.getDAO().selectAllDept();
		for(DeptDTO dept:deptList) {
			System.out.println("�μ���ȣ = "+dept.getDeptno()+", �μ��̸� = "
					+dept.getDname()+", �μ���ġ = "+dept.getLoc());
		}
	}
}









