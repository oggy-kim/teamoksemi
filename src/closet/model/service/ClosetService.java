package closet.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import closet.model.dao.ClosetDao;
import closet.model.vo.Closet;

import static common.JDBCTemplate.*;

public class ClosetService {
	// 내 옷장 리스트 불러오기
	public ArrayList<Closet> selectMyCloset(int memberNo) {
		Connection conn = getConnection();
		ArrayList<Closet> list = new ClosetDao().selectMyCloset(conn, memberNo);
		
		close(conn);
		return list;
	}

	public int getTopCount(int memberNo) {
		Connection conn = getConnection();
		int count = new ClosetDao().getTopCount(conn, memberNo); 
		
		close(conn);
				
		return count;
	}

	public int getBottomCount(int memberNo) {
		Connection conn = getConnection();
		int count = new ClosetDao().getBottomCount(conn, memberNo); 
		
		close(conn);
				
		return count;
	}

	public int getAccCount(int memberNo) {
		Connection conn = getConnection();
		int count = new ClosetDao().getAccCount(conn, memberNo); 
		
		close(conn);
				
		return count;
	}

	public ArrayList<Closet> recommendWinter(int memberNo) {
		Connection conn = getConnection();
		
		ArrayList<Closet> clist = new ClosetDao().recommendWinter(conn, memberNo);
		
		close(conn);
		
		return clist;
	}

	public ArrayList<Closet> recommendSF(int memberNo) {
		Connection conn = getConnection();
		
		ArrayList<Closet> clist = new ClosetDao().recommendSF(conn, memberNo);
		
		close(conn);
		
		return clist;
	}

	public ArrayList<Closet> recommendSummer(int memberNo) {
		Connection conn = getConnection();
		
		ArrayList<Closet> clist = new ClosetDao().recommendSummer(conn, memberNo);
		
		close(conn);
		
		return clist;
	}

}
