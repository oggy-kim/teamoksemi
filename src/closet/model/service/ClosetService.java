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
	public ArrayList<Closet> selectMyCloset(int memberNo, String likeStatus) {
		Connection conn = getConnection();
		ArrayList<Closet> list = new ClosetDao().selectMyCloset(conn, memberNo, likeStatus);
		
		close(conn);
		return list;
	}

	

	public int getTopCount(int memberNo) {
		Connection conn = getConnection();
		int count = new ClosetDao().getTopCount(conn, memberNo); 
		
		close(conn);
				
		return count;
	}
	public int getTopCount(int memberNo, String likeStatus) {
		Connection conn = getConnection();
		int count = new ClosetDao().getTopCount(conn, memberNo, likeStatus); 
		
		close(conn);
				
		return count;
	}

	public int getBottomCount(int memberNo) {
		Connection conn = getConnection();
		int count = new ClosetDao().getBottomCount(conn, memberNo); 
		
		close(conn);
				
		return count;
	}
	public int getBottomCount(int memberNo, String likeStatus) {
		Connection conn = getConnection();
		int count = new ClosetDao().getBottomCount(conn, memberNo, likeStatus); 
		
		close(conn);
				
		return count;
	}

	public int getAccCount(int memberNo) {
		Connection conn = getConnection();
		int count = new ClosetDao().getAccCount(conn, memberNo); 
		
		close(conn);
				
		return count;
	}
	public int getAccCount(int memberNo, String likeStatus) {
		Connection conn = getConnection();
		int count = new ClosetDao().getAccCount(conn, memberNo, likeStatus); 
		
		close(conn);
				
		return count;
	}
	
	// 새 옷 추가 
	public int addNewCloth(Closet c) {
		Connection conn = getConnection();
		int result = new ClosetDao().addNewCloth(conn, c);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
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
	public int deleteMyCloth(int[] deleteList) {
		Connection conn = getConnection();
		
		int result = new ClosetDao().deleteMyCloth(conn, deleteList);
		
		if(result == deleteList.length) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}



}
