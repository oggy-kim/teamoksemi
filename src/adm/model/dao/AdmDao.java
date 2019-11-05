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

import board.model.vo.Board;
import board.model.vo.QnA;
import member.model.vo.Member;
import shop.model.vo.Shop;

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
				mlist.add(new Member(rset.getInt(2), 
									rset.getString(3), 
									rset.getString(4),
									rset.getString(5), 
									rset.getDate(6)));
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

	// 4. QNA리스트조회용 dao
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

	
	public ArrayList<QnA> sortQList(Connection conn, int sortId, int currentPage, int boardLimit) {
		ArrayList<QnA> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		
		if(sortId == 1){ // 답변여부
			sql = prop.getProperty("sortQList1");
		} else if (sortId == 2){ // 오래된 순
			sql = prop.getProperty("sortQList2");
		} else { // 최신순
			sql = prop.getProperty("selectQList");
		}
		

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
	
	
	
	
	// 5. SHOP리스트갯수조회용 dao
	public int getSListCount(Connection conn) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSListCount");
		
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

	// 6. SHOP리스트조회용 dao
	public ArrayList<Shop> selectSList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<Shop> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			// 쇼핑몰 번호, 쇼핑몰이름, 상태, 등급, 계약일, 만료일, 계약금, 연락처
			while(rset.next()) {
				list.add(new Shop(rset.getInt(2), 
									rset.getString(3),
									rset.getString(4),
									rset.getString(5),
									rset.getDate(6),
									rset.getDate(7),
									rset.getInt(8),
									rset.getString(9)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 7. BOARD리스트갯수조회용 dao
	public int getBListCount(Connection conn) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getBListCount");
		
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

	// 8. BOARD리스트조회용 dao
	public ArrayList<Board> selectBList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			// 게시글 번호, 게시글 내용, 작성자, 작성일, 찜수, 조회수
			while(rset.next()) {
				list.add(new Board(rset.getInt(2), 
									rset.getString(3),
									rset.getString(4),
									rset.getDate(5),
									rset.getInt(6),
									rset.getInt(7)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// shop sorting 
	public int sortSList(Connection conn, String sort) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("sortSList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sort);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Board> sortBList(Connection conn, int sortId, int currentPage, int boardLimit) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		
		if(sortId == 1){ // 찜갯수
			sql = prop.getProperty("sortBList1");
		} else if (sortId == 2){ // 조회수
			sql = prop.getProperty("sortBList2");
		} else { // 작성일
			sql = prop.getProperty("selectBList");
		}
		

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt(2), 
						rset.getString(3),
						rset.getString(4),
						rset.getDate(5),
						rset.getInt(6),
						rset.getInt(7)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Shop> sortSList(Connection conn, int sortId, int currentPage, int boardLimit) {
		ArrayList<Shop> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		
		if(sortId == 1){ // 계약금
			sql = prop.getProperty("sortSList1");
		} else { // 계약상태
			sql = prop.getProperty("selectSList");
		}
		

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Shop(rset.getInt(2), 
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getDate(6),
						rset.getDate(7),
						rset.getInt(8),
						rset.getString(9)));
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
