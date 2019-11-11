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
            
            // System.out.println("list="+list); ok
            
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
                                   rset.getString(6), rset.getString(7), rset.getString(8),
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
	public int insertQnA(Connection conn, QnA q) {
		PreparedStatement pstmt = null;
		int result = 0; 
		
		String sql = prop.getProperty("insertQnA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q.getMemberNo());
			pstmt.setString(2, q.getQnaTitle());
			pstmt.setString(3, q.getQnaContents());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
    // QnA 세부내역 불러오기
    public QnA detailQnA(Connection conn, int qnaNo) {
        PreparedStatement pstmt = null;
        ResultSet rset = null;
        QnA q = null;

        String sql = prop.getProperty("detailQnA");

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, qnaNo);

            rset = pstmt.executeQuery();

            if(rset.next()) {
                q = new QnA(rset.getInt(1), rset.getInt(2), rset.getDate(3),
                            rset.getString(4), rset.getString(5), rset.getString(6), rset.getString(7));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rset);
            close(pstmt);
        }

        return q;
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


	public ArrayList<Attachment> selectList(Connection conn, int currentPage, int boardLimit) {
	      ArrayList<Attachment> list = new ArrayList<>();
	      
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
	        	 Attachment at = new Attachment();
	        	 at.setArticleNo(rset.getInt("article_no"));
	        	 at.setChangeName(rset.getString("change_name"));
	        	 at.setFilePath(rset.getString("file_path"));
	        	 
	        	 list.add(at);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	      }
	      return list;
	   }

	// 찜게시판 목록 불러오기 dao
	public int getWishListCount(Connection conn, int memberNo) {
	      int listCount = 0;
	      
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("getWishListCount");
	      
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

	public ArrayList<WishList> selectWishList(Connection conn, int currentPage, int boardLimit, int memberNo) {
		ArrayList<WishList> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectWishList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (currentPage-1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				WishList w = new WishList();
				
				w.setWishNo(rset.getInt("wish_no"));
				w.setMemberNo(rset.getInt("member_no"));
				w.setArticleNo(rset.getInt("article_no"));
				w.setWishDate(rset.getDate("wish_date"));
				w.setWishMemo(rset.getString("wish_memo"));
				w.setWishStatus(rset.getString("wish_status"));
				w.setChangeName(rset.getString("change_name"));
				
				list.add(w);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	   // 찜목록 삭제 dao
	   public int deleteWish(Connection conn, int aNo, String[] arr) {
	      int result = 0;
	      
	      PreparedStatement pstmt = null;
	      String sql = prop.getProperty("deleteWish");
	      
	      int[] arrInt = new int[arr.length];
	      for(int i = 0; i < arrInt.length; i++) {
	         arrInt[i] = Integer.parseInt(arr[i]);
	      }
	      
	      try {
	         for(int i = 0; i < arrInt.length; i++) {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, aNo);
	            pstmt.setInt(2, arrInt[i]);
	            
	            result += pstmt.executeUpdate();
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      return result;
	   }

	public int deleteMyList(Connection conn, String[] deleteList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("deleteMyList");
		
		int[] deleteListInt = new int[deleteList.length];
		for(int i = 0; i < deleteList.length; i++) {
			deleteListInt[i] = Integer.parseInt(deleteList[i]);
		}		
		try {
			for(int i = 0; i < deleteListInt.length; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, deleteListInt[i]);		
				result += pstmt.executeUpdate();
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Board> searchResult(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> blist = new ArrayList<>();
		
		String sql = prop.getProperty("searchResult");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				blist.add(new Board(rset.getInt(2),
									rset.getInt(3),
									rset.getInt(4),
									rset.getInt(5),
									rset.getString(6),
									rset.getString(7),
									rset.getString(8),
									rset.getString(9)));				
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		return blist;
	}


	public Board searchDetail(Connection conn, int articleNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String sql = prop.getProperty("searchDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, articleNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt(2),
							  rset.getInt(3),
							  rset.getInt(4),
							  rset.getInt(5),
							  rset.getString(6),
							  rset.getString(7),
							  rset.getString(8),
							  rset.getString(9));
				
				
					
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}
    
	// 조회수 증가 dao
	public int increaseCount(Connection conn, int aNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, aNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 게시판 상세보기 dao
	public Board selectBoard(Connection conn, int aNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String sql = prop.getProperty("selectBoardDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, aNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt(2),
							rset.getString(4),
							  rset.getString(3),
							  rset.getDate(5),
							  rset.getInt(6),
							  rset.getInt(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}

	public ArrayList<BoardComment> selectCommentList(Connection conn, int currentPage, int boardLimit, int aNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardComment> rlist = null;
		
		String sql = prop.getProperty("selectCommentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (currentPage-1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, aNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			rlist = new ArrayList<BoardComment>();
			while(rset.next()) {
				rlist.add(new BoardComment(rset.getInt(2),
						   				   rset.getInt(3),
						   				   rset.getString(4),
						   				   rset.getString(5),
						   				   rset.getString(6)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rlist;
	}

	public int insertComment(Connection conn, BoardComment c) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getArticleNo());
			pstmt.setString(2, c.getMemberNick());
			pstmt.setString(3, c.getCommentContents());
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int getCommentList(Connection conn, int aNo) {
		int listCount = 0;
	      
	    PreparedStatement pstmt = null;
	    ResultSet rset = null;
	      
	    String sql = prop.getProperty("getCommentList");
	    
	    try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, aNo);
			
			rset = pstmt.executeQuery();

            if(rset.next()) {
                listCount = rset.getInt(1);
            }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listCount;
	}


	public int insertWish(Connection conn, WishList w) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertWish");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, w.getMemberNo());
			pstmt.setInt(2, w.getArticleNo());
			pstmt.setString(3, w.getWishMemo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, b.getMemberNo());
			pstmt.setString(2, b.getArticleContents());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("insertAttachment");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				Attachment at = fileList.get(i);
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public Attachment selectChangeName(Connection conn, int aNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment at = null;
		
		String sql = prop.getProperty("selectChangeName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, aNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment(rset.getInt(1),
						rset.getInt(2),
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getDate(6),
						rset.getString(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}


	public int increaseCountt(Connection conn, int aNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("increaseCountt");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, aNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Board selectMainBoard(Connection conn) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      Board board = null;
	      
	      String sql = prop.getProperty("selectMainBoard");
	      
	      try {
	         pstmt=conn.prepareStatement(sql);
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            board = new Board(rset.getInt("ARTICLE_NO"),
	                  rset.getInt("MEMBER_NO"),
	                  rset.getInt("ARTICLE_VIEWS"),
	                  rset.getInt("ARTICLE_WISHES"),
	                  rset.getString("ARTICLE_CONTENTS"),
	                  rset.getDate("ARTICLE_DATE"),
	                  rset.getString("ARTICLE_STATUS"));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	         
	      }
	      return board;
	   }

        
}
