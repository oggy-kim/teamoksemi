package adm.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import adm.model.dao.AdmDao;
import member.model.vo.Member;

import static common.JDBCTemplate.*;

public class AdmService {
	
	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new AdmDao().getListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Member> selectMList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new AdmDao().selectMList(conn, currentPage, boardLimit);
		close(conn);
		return list;
	}

	
}
