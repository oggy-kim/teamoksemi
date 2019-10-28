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
}