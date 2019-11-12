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
    

	public ArrayList<Board> selectMyList(int memberNo) {
		Connection conn = getConnection();

        ArrayList<Board> list = new BoardDao().selectMyList(conn, memberNo);

        close(conn);
        return list;
	}
    

	public ArrayList<QnA> selectQnAList(int currentPage, int boardLimit, int memberNo) {
        Connection conn = getConnection();

        ArrayList<QnA> list = new BoardDao().selectQnAList(conn, currentPage, boardLimit, memberNo);

        close(conn);
        return list;
	}
	// mypage 메인용
	public ArrayList<QnA> selectQnAList(int memberNo) {
		Connection conn = getConnection();

        ArrayList<QnA> list = new BoardDao().selectQnAList(conn, memberNo);

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

	public ArrayList<Attachment> selectList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> flist = new BoardDao().selectList(conn, currentPage, boardLimit);
		
		// 이후 SQL Developer에 데이터 만들기 server.sql
		
		close(conn);
		
		return flist;
	}

	// 찜게시판 목록 불러오기
	public int getWishListCount(int memberNo) {
		Connection conn = getConnection();
		
        int listCount = new BoardDao().getWishListCount(conn, memberNo);

        close(conn);
        
		return listCount;
	}

	public ArrayList<WishList> selectWishList(int currentPage, int boardLimit, int memberNo) {
		Connection conn = getConnection();
		
		ArrayList<WishList> list = new BoardDao().selectWishList(conn, currentPage, boardLimit, memberNo);
		
		return list;
	}
	
	// 찜게시판 선택 삭제
	   public int deleteWish(int aNo, String[] arr) {
	      Connection conn = getConnection();
	      
	      int result = new BoardDao().deleteWish(conn, aNo, arr);
	      
	      if(result > 0) {
	         commit(conn);
	      } else {
	         rollback(conn);
	      }
	      close(conn);
	      return result;
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
	
	public int deleteMyList(String[] deleteList) {
		Connection conn = getConnection();
		int result = new BoardDao().deleteMyList(conn, deleteList);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 검색 조회
	public ArrayList<Board> searchResult(String keyword) {
		Connection conn = getConnection();
		ArrayList<Board> blist = new BoardDao().searchResult(conn, keyword);
		
		close(conn);
		
		
		return blist;
	}

	public Board searchDetail(int articleNo) {
		Connection conn = getConnection();
		Board b = new BoardDao().searchDetail(conn, articleNo);
		
		close(conn);
		
		return b;
	}

	// 게시판 상세보기 서비스(조회수 증가)
	public Board selectBoard(int aNo) {
		Connection conn = getConnection();
		
		BoardDao bDao = new BoardDao();
		
		int result = bDao.increaseCount(conn, aNo);
		
		Board b = null;
		
		if(result > 0) {
			b = bDao.selectBoard(conn, aNo);
			commit(conn);
		}  else {
			rollback(conn);
		}
		close(conn);
		return b;
	}

	// 게시글 선택해오기(조회수 증가 x)
	public Board selectBoardNoCnt(int aNo) {
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, aNo);
		
		close(conn);
		
		return b;
	}

	// 선택한 게시글의 댓글 리스트 조회용 서비스
	/*public ArrayList<BoardComment> selectCommentList(int aNo) {
		Connection conn = getConnection();
		
		ArrayList<BoardComment> rlist = new BoardDao().selectCommentList(conn, aNo);
		
		close(conn);
		
		return rlist;
	}*/
	
	public ArrayList<BoardComment> selectCommentList(int currentPage, int boardLimit, int aNo) {
		Connection conn = getConnection();
		
		ArrayList<BoardComment> rlist = new BoardDao().selectCommentList(conn, currentPage, boardLimit, aNo);
		
		close(conn);
		
		return rlist;
	}

	public ArrayList<BoardComment> insertComment(BoardComment c) {
		Connection conn = getConnection();
		
		BoardDao bDao = new BoardDao();
		
		int result = bDao.insertComment(conn, c);
		
		ArrayList<BoardComment> rlist = null;
		
		if(result > 0) {
			commit(conn);
			rlist = bDao.selectCommentList(conn, 1, 5, c.getArticleNo());
		} else {
			rollback(conn);
		}
		close(conn);
		return rlist;
	}

	public int getCommentList(int aNo) {
		Connection conn = getConnection();
		
        int listCount = new BoardDao().getCommentList(conn, aNo);

        close(conn);
        
		return listCount;
	}

	public int insertWish(WishList w) {
		Connection conn = getConnection();
		
		int result = new BoardDao().insertWish(conn, w);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/*public int insertWish(WishList w) {
		Connection conn = getConnection();
		
		BoardDao bDao = new BoardDao();
		
		int result = bDao.increaseCountt(conn, w);
		
		WishList w = null;
		
		if(result > 0) {
			w = bDao.insertWish(conn, w);
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}*/

	public int insertThumbnail(Board b, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		BoardDao bDao = new BoardDao();
		
		int result1 = bDao.insertBoard(conn, b);
		int result2 = bDao.insertAttachment(conn, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result1;
	}

	public Attachment selectChangeName(int aNo) {
		Connection conn = getConnection();
		
		Attachment at = new BoardDao().selectChangeName(conn, aNo);
		
		close(conn);
		
		return at;
	}

	public int increaseCountt(int aNo) {
		Connection conn = getConnection();
		
		int result = new BoardDao().increaseCountt(conn, aNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Board selectMainBoard() {
	      Connection conn = getConnection();
	      
	      Board board = new BoardDao().selectMainBoard(conn);
	      
	      close(conn);
	      
	      
	      return board;
	   }




}
