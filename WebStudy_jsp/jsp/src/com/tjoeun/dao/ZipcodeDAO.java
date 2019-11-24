package com.tjoeun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tjoeun.dto.ZipcodeDTO;

public class ZipcodeDAO extends JdbcDAO {
	private static ZipcodeDAO _dao;
	
	private ZipcodeDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public static ZipcodeDAO getZipcodeDAO() {
		if(_dao==null) {
			_dao=new ZipcodeDAO();
		}
		return _dao;
	}
	
	//동이름을 전달받아 우편번호 및 주소 목록을 검색하여 반환하는 메소드
	public List<ZipcodeDTO> selectZipcodeList(String dong) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ZipcodeDTO> zipcodeList=new ArrayList<ZipcodeDTO>();
		try {
			con=getConnection();
			
			String sql="select * from zipcode where dong like ?||'%'";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dong);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ZipcodeDTO zipcode=new ZipcodeDTO();
				zipcode.setZipcode(rs.getString("zipcode"));
				zipcode.setDong(rs.getString("dong"));
				zipcode.setAddress(rs.getString("address"));
				zipcodeList.add(zipcode);
			}
		} catch (SQLException e) {
			System.out.println("getZipcodeList() 메소드 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);	
		}
		return zipcodeList;
	}
}