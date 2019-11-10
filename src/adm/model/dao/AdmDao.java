package adm.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Board;
import board.model.vo.QnA;
import member.model.vo.Member;
import shop.model.vo.Shop;

import static common.JDBCTemplate.*;

public class AdmDao {
	
	private Properties prop = new Properties();
	
	public AdmDao() {
		String fileName = AdmDao.class.getResource("/sql/adm/adm-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e){
			e.printStackTrace();
		}
	}
	
	// 1. 회원리스트갯수조회용 dao
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

	// 2. 회원리스트조회용 dao
	public ArrayList<Member> selectMList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<Member> mlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				mlist.add(new Member(rset.getInt(2), //no
									rset.getString(3), //id
									rset.getString(4), // nick
									rset.getString(5), // grade
									rset.getDate(6))); // entry_date
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mlist;
	}

	// 3. QNA리스트갯수조회용 dao
	public int getQListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getQListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
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

	// 4. QNA리스트조회용 dao
	public ArrayList<QnA> selectQList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<QnA> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectQList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) { // qnaNo, qnaTitle, memberNick, enrollDate, answerStatus 
				list.add(new QnA(rset.getInt(2), 
									rset.getString(5), 
									rset.getString(3),
									rset.getDate(4), 
									rset.getString(7)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	
	public ArrayList<QnA> sortQList(Connection conn, int sortId, int currentPage, int boardLimit) {
		ArrayList<QnA> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		
		if(sortId == 1){ // 답변여부
			sql = prop.getProperty("sortQList1");
		} else if (sortId == 2){ // 오래된 순
			sql = prop.getProperty("sortQList2");
		} else { // 최신순
			sql = prop.getProperty("selectQList");
		}
		

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {  // qnaNo, qnaTitle, memberNick, enrollDate, answerStatus 
				list.add(new QnA(rset.getInt(2), 
						rset.getString(5), 
						rset.getString(3),
						rset.getDate(4), 
						rset.getString(7)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 5. SHOP리스트갯수조회용 dao
	public int getSListCount(Connection conn) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
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

	// 6. SHOP리스트조회용 dao
	public ArrayList<Shop> selectSList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<Shop> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			// 쇼핑몰 번호, 쇼핑몰이름, 상태, 등급, 계약일, 만료일, 계약금, 연락처
			while(rset.next()) {
				list.add(new Shop(rset.getInt(2), 
									rset.getString(3),
									rset.getString(4),
									rset.getString(5),
									rset.getDate(6),
									rset.getDate(7),
									rset.getInt(8),
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

	// 7. BOARD리스트갯수조회용 dao
	public int getBListCount(Connection conn) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getBListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
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

	// 8. BOARD리스트조회용 dao
	public ArrayList<Board> selectBList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			// 게시글 번호, 게시글 내용, 작성자, 작성일, 찜수, 조회수
			while(rset.next()) {
				list.add(new Board(rset.getInt(2), // ARTICLE_NO
									rset.getString(8), // ARTICLE_CONTENTS
									rset.getString(3), // MEMBER_NICK
									rset.getDate(9), // ARTICLE_DATE
									rset.getInt(7), // ARTICLE_WISHES 
									rset.getInt(6))); // ARTICLE_VIEWS
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public int sortSList(Connection conn, String sort) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String sql = prop.getProperty("sortSList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sort);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Board> sortBList(Connection conn, int sortId, int currentPage, int boardLimit) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		
		if(sortId == 1){ // 찜갯수
			sql = prop.getProperty("sortBList1");
		} else if (sortId == 2){ // 조회수
			sql = prop.getProperty("sortBList2");
		} else { // 작성일
			sql = prop.getProperty("selectBList");
		}
		

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt(2), // ARTICLE_NO
						rset.getString(8), // ARTICLE_CONTENTS
						rset.getString(3), // MEMBER_NICK
						rset.getDate(9), // ARTICLE_DATE
						rset.getInt(7), // ARTICLE_WISHES 
						rset.getInt(6))); // ARTICLE_VIEWS
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Shop> sortSList(Connection conn, int sortId, int currentPage, int boardLimit) {
		ArrayList<Shop> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		
		if(sortId == 1){ // 계약금
			sql = prop.getProperty("sortSList1");
		} else { // 계약상태
			sql = prop.getProperty("selectSList");
		}
		

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Shop(rset.getInt(2), 
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getDate(6),
						rset.getDate(7),
						rset.getInt(8),
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

	public ArrayList<Member> sortMList(Connection conn, int sortId, int currentPage, int boardLimit) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		
		if(sortId == 1){ // member_nick
			sql = prop.getProperty("sortMList1");
		} else if(sortId == 2){ // grade 
			sql = prop.getProperty("sortMList2");
		} else if(sortId == 3) { // entry_date
			sql = prop.getProperty("sortMList3");
		} else { // member_no
			sql = prop.getProperty("selectMList");
		}
		

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt(2), //no
						rset.getString(3), //id
						rset.getString(4), // nick
						rset.getString(5), // grade
						rset.getDate(6)));
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<QnA> searchQList(Connection conn, int sortId, String keyword, int currentPage, int boardLimit) {
		ArrayList<QnA> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		
		if(sortId == 1){ // title --> ok
			sql = prop.getProperty("searchQList1");
		} else if (sortId == 2){ // writer 
			sql = prop.getProperty("searchQList2");
		} else { // 그 외
			sql = prop.getProperty("selectBList");
		}

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, keyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QnA( // qnaNo, qnaTitle, memberNick, enrollDate, answerStatus 
						rset.getInt(2), 
						rset.getString(5), 
						rset.getString(3),
						rset.getDate(4), 
						rset.getString(7)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Shop> searchSList(Connection conn, int sortId, String keyword, int currentPage, int boardLimit) {
		ArrayList<Shop> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		
		if(sortId == 1){ // shopName
			sql = prop.getProperty("searchSList");
		} 

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, keyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Shop(rset.getInt(2), 
						rset.getString(3),
						rset.getString(4),
						rset.getString(5),
						rset.getDate(6),
						rset.getDate(7),
						rset.getInt(8),
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

	public ArrayList<Board> searchBList(Connection conn, int sortId, String keyword, int currentPage, int boardLimit) {
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		
		if(sortId == 1){ // contents
			sql = prop.getProperty("searchBList1");
		} else if (sortId == 2) { // writer
			sql = prop.getProperty("searchBList2");
		} else { // 그 외
			System.out.println("selectBList");
		}

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, keyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt(2), // ARTICLE_NO
						rset.getString(8), // ARTICLE_CONTENTS
						rset.getString(3), // MEMBER_NICK
						rset.getDate(9), // ARTICLE_DATE
						rset.getInt(7), // ARTICLE_WISHES 
						rset.getInt(6))); // ARTICLE_VIEWS	
			}
			System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Member> searchMList(Connection conn, int sortId, String keyword, int currentPage, int boardLimit) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = null;
		
		if(sortId == 1){ // member_no
			sql = prop.getProperty("searchMList1");
		} else if (sortId == 2){ // member_id
			sql = prop.getProperty("searchMList2");
		} else { // member_nick
			sql = prop.getProperty("searchMList3");
		}

		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, keyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt(2), //no
						rset.getString(3), //id
						rset.getString(4), // nick
						rset.getString(5), // grade
						rset.getDate(6))); // entry_date
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public Shop detailShop(Connection conn, int shopNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Shop s = null;
		
		String sql = prop.getProperty("detailShop");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, shopNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				s = new Shop(rset.getInt(2), rset.getString(3),
                            rset.getString(4), rset.getString(5), rset.getDate(6), rset.getDate(7),
							rset.getInt(8), rset.getString(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return s;
	}

	public Member detailMember(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String sql = prop.getProperty("detailMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt(1), //no
						rset.getString(2), // gradeCode
						rset.getString(3), //id
						rset.getString(5), // nick
						rset.getString(6), // gender
						rset.getString(7), // profile
						rset.getString(8), // likeStyle
						rset.getInt(9), // birthYear
						rset.getDate(10), // entryDate
						rset.getString(11)); // memberStatus
 			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	public QnA detailQnA(Connection conn, int qnaNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		QnA q = null;
		
		String sql = prop.getProperty("detailQNA");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qnaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new QnA(rset.getInt(2), // qna글번호
							rset.getString(5), // 제목
							rset.getString(3), // 회원닉네임
							rset.getDate(4), // 글 등록일
							rset.getString(6), // 내용
							rset.getString(7), // 답변여부
							rset.getString(8)); // 답변내용			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return q;
	}
	
	
	public Board detailBoard(Connection conn, int articleNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String sql = prop.getProperty("detailBoard");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, articleNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board(rset.getInt(2), // ARTICLE_NO 
						rset.getString(3), // ARTICE_NICK
						rset.getString(4), // PROFILE
						rset.getString(5), // LIKE_STYLE
						rset.getInt(6), // ARTICLE_VIEWS
						rset.getInt(7), // ARTICLE_WISHES
						rset.getString(8), // ARTICLE_CONTENTS
						rset.getDate(9), // ARTICLE_DATE
						rset.getString(10)); // ARTICLE_STATUS
			}
			
			System.out.println(b);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}

	public int deleteShop(Connection conn, int shopNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteShop");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, shopNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateShop(Connection conn, Shop shop) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateShop");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, shop.getShopGradeCode());
			pstmt.setInt(2, shop.getShopNo());
			// shopName, contractMoney, shopPIC
			// , shopContract, cdate, edate 추가 예정
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Shop selectShop(Connection conn, int shopNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Shop s = null;

		String query = prop.getProperty("selectShop");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, shopNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				s = new Shop(rset.getInt(2), rset.getString(3),
                        rset.getString(4), rset.getString(5), rset.getDate(6), rset.getDate(7),
						rset.getInt(8), rset.getString(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return s;
	}

	

	public int deleteMember(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteMember");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Member selectMember(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;

		String query = prop.getProperty("selectMember");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, memberNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				m = new Member(rset.getInt(1), //no
						rset.getString(2), // gradeCode
						rset.getString(3), //id
						rset.getString(5), // nick
						rset.getString(6), // gender
						rset.getString(7), // profile
						rset.getString(8), // likeStyle
						rset.getInt(9), // birthYear
						rset.getDate(10), // entryDate
						rset.getString(11)); // memberStatus
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMember");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, member.getGradeCode());
			pstmt.setInt(2, member.getMemberNo());
			// 나머지도 추가 예정
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteBoard(Connection conn, int articleNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteBoard");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	

}
