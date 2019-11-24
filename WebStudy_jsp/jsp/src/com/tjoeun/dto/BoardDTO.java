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
	private int num;//글번호(자동증가) - 게시글 조회,삭제,변경을 위한 고유값(미입력)
	private String writer;//작성자 => 로그인 회원의 아이디 저장(미입력) : 아이디를 이용하여 회원 이름을 검색하여 사용
	private String email;//이메일 => 로그인 회원의 아이디 저장(생략) : 아이디를 이용하여 회원 이메일을 검색하여 사용
	private String subject;//제목 => 필수 입력
	private String passwd;//비밀번호 => 게시글의 변경 또는 삭제시 사용(생략) : 로그인 사용자와 작성자가 같은 경우 변경 또는 삭제
	private String regDate;//작성일자 => 미입력
	private int readCount;//조횟수 => 미입력
	private int ref;//답글 그룹 => 미입력
	private int reStep;//답글 순서 => 미입력
	private int reLevel;//답글 깊이 => 미입력
	private String content;//내용 => 필수 입력
	private String ip;//게시글 작성 클라이언트의 IP 주소 => 미입력
	private int remove;//삭제 여부(0:존재,1:삭제) => 미입력  
	
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