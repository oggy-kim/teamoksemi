package closet.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

import closet.model.vo.Closet;
import static common.JDBCTemplate.*;

public class ClosetDao {
	
	private Properties prop = new Properties();
	
	public ClosetDao() {
		String fileName = ClosetDao.class.getResource("/sql/closet/closet-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Closet> selectMyCloset(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Closet> list = new ArrayList<>();
		
		String sql = prop.getProperty("selectMyCloset");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Closet c = new Closet(rset.getInt(2), rset.getInt(3), rset.getString(4), rset.getInt(5),
									  rset.getString(6), rset.getString(7), rset.getString(8), rset.getString(9),
									  rset.getString(10), rset.getDate(11), rset.getString(12), rset.getString(13),
									  rset.getString(14), rset.getDate(15));
				list.add(c);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	// 상의 총갯수
	public int getTopCount(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String sql = prop.getProperty("getTopCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	// 하의 총갯수
	public int getBottomCount(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String sql = prop.getProperty("getBottomCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}
	// 악세사리 총갯수
	public int getAccCount(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String sql = prop.getProperty("getAccCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				count = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

}