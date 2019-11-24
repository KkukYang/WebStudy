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
	
	//Sequence 객체의 자동 증가값을 반환하는 메소드
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
			System.out.println("getAutoIncrement() 메소드 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return incrementNum;
	}
	
	//board 테이블에 저장된 ref 컬럼값이 같은 게시글 중 부모글의 
	//reStep 보다 큰 기존 게시글의 re_step 컬럼값을 1 증가하여
	//변경 후 결과를 반환하는 메소드
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
			System.out.println("setReStepArticle() 메소드 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//신규글 또는 답글을 전달받아 board 테이블에 저장 후 결과를 반환하는 메소드
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
			System.out.println("insertArticle() 메소드 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//board 테이블에 저장된 전체 게시글의 갯수를 검색하여 반환하는 메소드
	// => 검색 메뉴와 키워드를 전달 받아 검색 게시글의 갯수를 검색하여 반환하는 메소드
	public int getTotalArticle(String search,String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalArticle=0;
		try {
			con=getConnection();
			
			if(search.equals("")) { //전체 게시글의 갯수 검색
				String sql="select count(*) from board";
				pstmt=con.prepareStatement(sql);
			} else {//검색 게시글의 갯수 검색
				String sql="select count(*) from board where "+search+ " like '%'||?||'%'";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				totalArticle=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("getTotalArticle() 메소드 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return totalArticle;
	}
	
	//시작 행번호와 마지막 행번호를 전달받아 board 테이블에서 시작
	//행부터 마지막 행까지의 게시글 목록을 검색하여 반환하는 메소드
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
			System.out.println("getArticleList() 메소드 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return articleList;
	}
	
	//글번호를 전달받아 board 테이블에 저장된 해당 게시글을 검색하여 반환하는 메소드
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
			System.out.println("getArticle 메소드 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return article;
	}
	
	//글번호를 전달받아 board 테이블에 저장된 해당 게시글의 조회수를 1 증가하는 메소드
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
			System.out.println("updateReadCount() 메소드 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//게시글을 전달받아 board 테이블에 저장된 기존 게시글을 변경 후 결과를 반환하는 메소드
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
			System.out.println("updateArticle() 메소드 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//글번호을 전달받아 board 테이블에 저장된 해당 게시글을 삭제 후 결과를 반환하는 메소드
	// => remove 컬럼값을 1로 변경
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
			System.out.println("deleteArticle() 메소드 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
}