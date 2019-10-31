package adm.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.QnA;
import member.model.vo.Member;

import static common.JDBCTemplate.*;

public class AdmDao {
	
	private Properties prop = new Properties();
	
	public AdmDao() {
		String fileName = AdmDao.class.getResource("/sql/adm/adm-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e){
			e.printStackTrace();
		}
	}
	
	// 1. 회원리스트갯수조회용 dao
	public int getListCount(Connection conn) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	// 2. 회원리스트조회용 dao
	public ArrayList<Member> selectMList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<Member> mlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				mlist.add(new Member(rset.getInt("MEMBER_NO"), 
									rset.getString("MEMBER_ID"), 
									rset.getString("MEMBER_NICK"),
									rset.getString("GRADE_CODE"), 
									rset.getDate("ENTRY_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mlist;
	}

	// 3. QNA리스트갯수조회용 dao
	public int getQListCount(Connection conn) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getQListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<QnA> selectQList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<QnA> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QnA(rset.getInt(2), 
									rset.getString(3), 
									rset.getString(4),
									rset.getDate(5), 
									rset.getString(6).charAt(0)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
