package com.tjoeun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tjoeun.dto.BoardDTO;

public class BoardDAO extends JdbcDAO {
	private static BoardDAO _dao;
	
	private BoardDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public static BoardDAO getBoardDAO() {
		if(_dao==null) {
			_dao=new BoardDAO();
		}
		return _dao;
	}
	
	//Sequence ��ü�� �ڵ� �������� ��ȯ�ϴ� �޼ҵ�
	public int getAutoIncrement() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int incrementNum=0;
		try {
			con=getConnection();
			
			String sql="select board_seq.nextval from dual";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				incrementNum=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("getAutoIncrement() �޼ҵ� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return incrementNum;
	}
	
	//board ���̺� ����� ref �÷����� ���� �Խñ� �� �θ���� 
	//reStep ���� ū ���� �Խñ��� re_step �÷����� 1 �����Ͽ�
	//���� �� ����� ��ȯ�ϴ� �޼ҵ�
	public int setReStepArticle(int ref, int reStep) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update board set re_step=re_step+1 where ref=? and re_step>?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, reStep);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("setReStepArticle() �޼ҵ� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//�űԱ� �Ǵ� ����� ���޹޾� board ���̺� ���� �� ����� ��ȯ�ϴ� �޼ҵ�
	public int insertArticle(BoardDTO article) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into board values(?,?,?,?,?,sysdate,0,?,?,?,?,?,0)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, article.getNum());
			pstmt.setString(2, article.getWriter());
			pstmt.setString(3, article.getEmail());
			pstmt.setString(4, article.getSubject());
			pstmt.setString(5, article.getPasswd());
			pstmt.setInt(6, article.getRef());
			pstmt.setInt(7, article.getReStep());
			pstmt.setInt(8, article.getReLevel());
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			
			rows=pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("insertArticle() �޼ҵ� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//board ���̺� ����� ��ü �Խñ��� ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	// => �˻� �޴��� Ű���带 ���� �޾� �˻� �Խñ��� ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	public int getTotalArticle(String search,String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalArticle=0;
		try {
			con=getConnection();
			
			if(search.equals("")) { //��ü �Խñ��� ���� �˻�
				String sql="select count(*) from board";
				pstmt=con.prepareStatement(sql);
			} else {//�˻� �Խñ��� ���� �˻�
				String sql="select count(*) from board where "+search+ " like '%'||?||'%'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				totalArticle=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("getTotalArticle() �޼ҵ� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return totalArticle;
	}
	
	//���� ���ȣ�� ������ ���ȣ�� ���޹޾� board ���̺��� ����
	//����� ������ ������� �Խñ� ����� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	public List<BoardDTO> getArticleList(int startRow,int endRow,String search,String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<BoardDTO> articleList=new ArrayList<BoardDTO>();
		try {
			con=getConnection();
			
			if(search.equals("")) {
				String sql="select * from (select rownum rn,temp.* from"
					+ " (select * from board order by ref desc"
					+ ",re_step) temp) where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else {
				String sql="select * from (select rownum rn,temp.* from"
					+ " (select * from board where "+search+" like '%'||?||'%' and remove=0"
					+ " order by ref desc,re_step) temp) where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO article=new BoardDTO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setRegDate(rs.getString("reg_date"));
				article.setReadCount(rs.getInt("readCount"));
				article.setRef(rs.getInt("ref"));
				article.setReStep(rs.getInt("re_step"));
				article.setReLevel(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
				article.setRemove(rs.getInt("remove"));
				articleList.add(article);
			}
		} catch (SQLException e) {
			System.out.println("getArticleList() �޼ҵ� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return articleList;
	}
	
	//�۹�ȣ�� ���޹޾� board ���̺� ����� �ش� �Խñ��� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
	public BoardDTO getArticle(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardDTO article=null;
		try {
			con=getConnection();
			
			String sql="select * from board where num=? and remove=0";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				article=new BoardDTO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setRegDate(rs.getString("reg_date"));
				article.setReadCount(rs.getInt("readCount"));
				article.setRef(rs.getInt("ref"));
				article.setReStep(rs.getInt("re_step"));
				article.setReLevel(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
				article.setRemove(rs.getInt("remove"));
			}
		} catch (SQLException e) {
			System.out.println("getArticle �޼ҵ� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return article;
	}
	
	//�۹�ȣ�� ���޹޾� board ���̺� ����� �ش� �Խñ��� ��ȸ���� 1 �����ϴ� �޼ҵ�
	public int updateReadCount(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update board set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rows=pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("updateReadCount() �޼ҵ� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//�Խñ��� ���޹޾� board ���̺� ����� ���� �Խñ��� ���� �� ����� ��ȯ�ϴ� �޼ҵ�
	public int updateArticle(BoardDTO article) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update board set writer=?,email=?"
				+ ",subject=?,content=? where num=? and passwd=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getContent());
			pstmt.setInt(5, article.getNum());
			pstmt.setString(6, article.getPasswd());
			
			rows=pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("updateArticle() �޼ҵ� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//�۹�ȣ�� ���޹޾� board ���̺� ����� �ش� �Խñ��� ���� �� ����� ��ȯ�ϴ� �޼ҵ�
	// => remove �÷����� 1�� ����
	public int deleteArticle(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update board set remove=1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rows=pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("deleteArticle() �޼ҵ� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
}