package adm.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import adm.model.dao.AdmDao;
import board.model.dao.BoardDao;
import board.model.vo.Board;
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
	
	public ArrayList<QnA> sortQList(int sortId, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<QnA> list = new AdmDao().sortQList(conn, sortId, currentPage, boardLimit);
		close(conn);
		return list;
		
	}
	
	/* --------------------------------------------------------- */
	
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
	
	public int sortSList(String sort) {
		Connection conn = getConnection();
		int result = new AdmDao().sortSList(conn, sort);
		close(conn);
		return result;
	}
	
	
	/* --------------------------------------------------------- */

	public int getBListCount() {
		Connection conn = getConnection();
		int listCount = new AdmDao().getBListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Board> selectBList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Board> list = new AdmDao().selectBList(conn, currentPage, boardLimit);
		close(conn);
		return list;
	}

	public ArrayList<Board> sortBList(int sortId, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Board> list = new AdmDao().sortBList(conn, sortId, currentPage, boardLimit);
		close(conn);
		return list;
	}

	public ArrayList<Shop> sortSList(int sortId, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Shop> list = new AdmDao().sortSList(conn, sortId, currentPage, boardLimit);
		close(conn);
		return list;
	}

	public ArrayList<Member> sortMList(int sortId, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Member> list = new AdmDao().sortMList(conn, sortId, currentPage, boardLimit);
		close(conn);
		return list;
	}

	public ArrayList<QnA> searchQList(int sortId, String keyword, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<QnA> list = new AdmDao().searchQList(conn, sortId, keyword, currentPage, boardLimit);
		close(conn);
		return list;
	}

	public ArrayList<Shop> searchSList(int sortId, String keyword, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Shop> list = new AdmDao().searchSList(conn, sortId, keyword, currentPage, boardLimit);
		close(conn);
		return list;
	}

	public ArrayList<Board> searchBList(int sortId, String keyword, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Board> list = new AdmDao().searchBList(conn, sortId, keyword, currentPage, boardLimit);
		close(conn);
		return list;
	}

	public ArrayList<Member> searchMList(int sortId, String keyword, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Member> list = new AdmDao().searchMList(conn, sortId, keyword, currentPage, boardLimit);
		close(conn);
		return list;
	}

	
	public Shop detailShop(int shopNo) {
		Connection conn = getConnection();
		Shop s = new AdmDao().detailShop(conn, shopNo);
		close(conn);
		return s;
	}

	public Member detailMember(int memberNo) {
		Connection conn = getConnection();
		Member m = new AdmDao().detailMember(conn, memberNo);
		close(conn);
		return m;
	}

	public QnA detailQnA(int qnaNo) {
		Connection conn = getConnection();
		QnA q = new AdmDao().detailQnA(conn, qnaNo);
		close(conn);
		return q;
	}
	
	public Board detailBoard(int articleNo) {
		Connection conn = getConnection();
		Board b = new AdmDao().detailBoard(conn, articleNo);
		close(conn);
		return b;
	}

	public int deleteShop(int shopNo) {
		Connection conn = getConnection();
		int result = new AdmDao().deleteShop(conn, shopNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
			
		close(conn);
		return result;
	}

	public int updateShop(Shop shop) {
		Connection conn = getConnection();
		
		int result = new AdmDao().updateShop(conn, shop);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Shop selectShop(int shopNo) {
		Connection conn = getConnection();
		Shop s = new AdmDao().selectShop(conn, shopNo);
		System.out.println("s="+s);
		close(conn);
		return s;
	}

	public int deleteMember(int memberNo) {
		Connection conn = getConnection();
		int result = new AdmDao().deleteMember(conn, memberNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
			
		close(conn);
		return result;
	}

	public Member selectMember(int memberNo) {
		Connection conn = getConnection();
		Member m = new AdmDao().selectMember(conn, memberNo);
		System.out.println("m="+m);
		close(conn);
		return m;
	}

	public int updateMember(Member member) {
		Connection conn = getConnection();
		
		int result = new AdmDao().updateMember(conn, member);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteBoard(int articleNo) {
		Connection conn = getConnection();
		int result = new AdmDao().deleteBoard(conn, articleNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
			
		close(conn);
		return result;
	}

	public int deleteQNA(int qnaNo) {
		Connection conn = getConnection();
		int result = new AdmDao().deleteQNA(conn, qnaNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
			
		close(conn);
		return result;
	}

	


	
}
