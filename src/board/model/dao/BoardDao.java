package board.model.dao;

import board.model.dao.BoardDao;
import board.model.vo.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

import static common.JDBCTemplate.close;

public class BoardDao {

    private Properties prop = new Properties();

    public BoardDao() {

        String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();

        try {
            prop.load(new FileReader(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public int getMyListCount(Connection conn, int memberNo) {
        int listCount = 0;

        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("getMyListCount");

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, memberNo);

            rset = pstmt.executeQuery();

            if(rset.next()) {
                listCount = rset.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return listCount;
    }

    public ArrayList<Board> selectMyList(Connection conn, int currentPage, int boardLimit, int memberNo) {
        ArrayList<Board> list = new ArrayList<>();

        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("selectMyList");

        try {
            pstmt = conn.prepareStatement(sql);
            int startRow = (currentPage - 1) * boardLimit + 1;
            int endRow = startRow + boardLimit - 1;

            pstmt.setInt(1, memberNo);
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, endRow);

            rset = pstmt.executeQuery();

            while(rset.next()) {
                list.add(new Board(rset.getInt(2), rset.getInt(3), rset.getInt(5),
                                   rset.getInt(6), rset.getString(7), rset.getDate(9),
                                   rset.getString(8)));
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }

        return list;
    }


	public ArrayList<QnA> selectQnAList(Connection conn, int currentPage, int boardLimit, int memberNo) {
		ArrayList<QnA> list = new ArrayList<>();

        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("selectQnAList");

        try {
            pstmt = conn.prepareStatement(sql);
            int startRow = (currentPage - 1) * boardLimit + 1;
            int endRow = startRow + boardLimit - 1;

            pstmt.setInt(1, memberNo);
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, endRow);

            rset = pstmt.executeQuery();

            while(rset.next()) {
                list.add(new QnA(rset.getInt(2), rset.getInt(3), rset.getDate(5),
                                   rset.getString(6), rset.getString(7), rset.getString(8).charAt(0),
                                   rset.getString(9)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return list;
	}


	public int getQnAListCount(Connection conn, int memberNo) {
		int listCount = 0;

        PreparedStatement pstmt = null;
        ResultSet rset = null;

        String sql = prop.getProperty("getQnAListCount");

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, memberNo);

            rset = pstmt.executeQuery();

            if(rset.next()) {
                listCount = rset.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }
        return listCount;
	}

	// 스타일 게시판 dao
	public int getListCount(Connection conn) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}


	public ArrayList<Board> selectList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (currentPage-1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt(2), rset.getInt(3), rset.getInt(4), rset.getInt(5), 
								   rset.getString(6), rset.getDate(7), rset.getString(8)));
				
            }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
		}
		return list;
	}

	// 찜게시판 목록 불러오기 dao
	public int getWishListCount(Connection conn, int mNo) {
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getWishListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public ArrayList<WishList> selectWishList(Connection conn, int currentPage, int boardLimit, int mNo) {
		ArrayList<WishList> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWishList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (currentPage-1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new WishList(rset.getInt(2),
									  rset.getInt(3),
									  rset.getDate(4),
									  rset.getString(5),
									  rset.getString(6)));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
