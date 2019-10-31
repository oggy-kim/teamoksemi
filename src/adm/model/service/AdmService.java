package adm.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import adm.model.dao.AdmDao;
import board.model.vo.QnA;
import member.model.vo.Member;
import shop.model.vo.Shop;

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
		
		ArrayList<Member> mlist = new AdmDao().selectMList(conn, currentPage, boardLimit);
		close(conn);
		return mlist;
	}

	
	public int getQListCount() {
		Connection conn = getConnection();
		int listCount = new AdmDao().getQListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<QnA> selectQList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<QnA> list = new AdmDao().selectQList(conn, currentPage, boardLimit);
		close(conn);
		return list;
	}

	
	public int getSListCount() {
		Connection conn = getConnection();
		int listCount = new AdmDao().getSListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Shop> selectSList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Shop> list = new AdmDao().selectSList(conn, currentPage, boardLimit);
		close(conn);
		return list;
	}

	
}
