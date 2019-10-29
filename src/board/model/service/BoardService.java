package board.model.service;

import board.model.dao.BoardDao;
import board.model.vo.*;

import java.sql.*;
import java.util.ArrayList;

import static common.JDBCTemplate.*;

public class BoardService {

    public int getListCount(int memberNo) {
        Connection conn = getConnection();
        int listCount = new BoardDao().getListCount(conn, memberNo);

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
}