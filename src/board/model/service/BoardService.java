package board.model.service;

import board.model.dao.BoardDao;
import board.model.vo.*;

import java.sql.*;
import java.util.ArrayList;

import static common.JDBCTemplate.*;

public class BoardService {

    public int getListCount(int memberNo) {
        Connection conn = getConnection();
        int listCount = new BoardDao().getMyListCount(conn, memberNo);

        close(conn);

        return listCount;
    }

    public ArrayList<Board> selectMyList(int currentPage, int boardLimit, int memberNo) {
        Connection conn = getConnection();

        ArrayList<Board> list = new BoardDao().selectMyList(conn, currentPage, boardLimit, memberNo);

        close(conn);
        return list;
    }

	public ArrayList<QnA> selectQnAList(int currentPage, int boardLimit, int memberNo) {
        Connection conn = getConnection();

        ArrayList<QnA> list = new BoardDao().selectQnAList(conn, currentPage, boardLimit, memberNo);

        close(conn);
        return list;
	}

	public int getQnAListCount(int memberNo) {
		Connection conn = getConnection();
        int listCount = new BoardDao().getQnAListCount(conn, memberNo);

        close(conn);

        return listCount;
	}
  
  	// 스타일 게시판 목록 불러오기
	public int getListCount() {
		Connection conn = getConnection();
        int listCount = new BoardDao().getListCount(conn);

        close(conn);
		return listCount;
	}

	public ArrayList<Board> selectList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn, currentPage, boardLimit);
		
		// 이후 SQL Developer에 데이터 만들기 server.sql
		
		close(conn);
		
		return list;
	}

	// 찜게시판 목록 불러오기
	public int getWishListCount(int mNo) {
		Connection conn = getConnection();
		
        int listCount = new BoardDao().getWishListCount(conn, mNo);

        close(conn);
        
		return listCount;
	}

	public ArrayList<WishList> selectWishList(int currentPage, int boardLimit, int mNo) {
		Connection conn = getConnection();
		
		ArrayList<WishList> list = new BoardDao().selectWishList(conn, currentPage, boardLimit, mNo);
		
		return list;
	}
	// QnA 게시판 문의글 등록 service
	public int insertQnA(QnA q) {
		Connection conn = getConnection();
		int result = new BoardDao().insertQnA(conn, q);
		
		if(result > 0) {
			commit(conn);
		}
		else {
			rollback(conn);
		}

		close(conn);
		
		return result;
	}
	// QnA 게시판 세부내용 조회
	public QnA detailQnA(int qnaNo) {
		Connection conn = getConnection();
		QnA q = new BoardDao().detailQnA(conn, qnaNo);

		close(conn);
		return q;
	}
	// 검색 조회
	public ArrayList<Board> searchResult(String keyword) {
		Connection conn = getConnection();
		ArrayList<Board> blist = new BoardDao().searchResult(conn, keyword);
		
		close(conn);
		
		
		return blist;
	}
}