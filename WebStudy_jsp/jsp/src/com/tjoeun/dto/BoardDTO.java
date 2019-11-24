package com.tjoeun.dto;

/*
create table board(
	num number(4) primary key, writer varchar2(10), email varchar2(20),
	subject varchar2(50), passwd varchar2(12), reg_date date, 
	readcount number(4), ref number(4), re_step number(4), 
	re_level number(4),	content varchar2(4000),	ip varchar2(20),
	remove number(1));
	
create sequence board_seq;	
*/

public class BoardDTO {
	private int num;//�۹�ȣ(�ڵ�����) - �Խñ� ��ȸ,����,������ ���� ������(���Է�)
	private String writer;//�ۼ��� => �α��� ȸ���� ���̵� ����(���Է�) : ���̵� �̿��Ͽ� ȸ�� �̸��� �˻��Ͽ� ���
	private String email;//�̸��� => �α��� ȸ���� ���̵� ����(����) : ���̵� �̿��Ͽ� ȸ�� �̸����� �˻��Ͽ� ���
	private String subject;//���� => �ʼ� �Է�
	private String passwd;//��й�ȣ => �Խñ��� ���� �Ǵ� ������ ���(����) : �α��� ����ڿ� �ۼ��ڰ� ���� ��� ���� �Ǵ� ����
	private String regDate;//�ۼ����� => ���Է�
	private int readCount;//��Ƚ�� => ���Է�
	private int ref;//��� �׷� => ���Է�
	private int reStep;//��� ���� => ���Է�
	private int reLevel;//��� ���� => ���Է�
	private String content;//���� => �ʼ� �Է�
	private String ip;//�Խñ� �ۼ� Ŭ���̾�Ʈ�� IP �ּ� => ���Է�
	private int remove;//���� ����(0:����,1:����) => ���Է�  
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getReStep() {
		return reStep;
	}

	public void setReStep(int reStep) {
		this.reStep = reStep;
	}

	public int getReLevel() {
		return reLevel;
	}

	public void setReLevel(int reLevel) {
		this.reLevel = reLevel;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getRemove() {
		return remove;
	}

	public void setRemove(int remove) {
		this.remove = remove;
	}
}