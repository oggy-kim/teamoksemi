package member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

import static common.JDBCTemplate.*;

import member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String id, String pwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(rset.getInt("MEMBER_NO"),
									   rset.getString("GRADE_CODE"),
									   rset.getString("MEMBER_ID"),
									   rset.getString("MEMBER_PWD"),
									   rset.getString("MEMBER_NICK"),
									   rset.getString("GENDER"),
									   rset.getString("PROFILE"),
									   rset.getString("LIKE_STYLE"),
									   rset.getInt("BIRTH_YEAR"),
									   rset.getDate("ENTRY_DATE"),
									   rset.getString("MEMBER_STATUS"));
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
	}
	
	public int insertMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPwd());
			pstmt.setString(3, m.getMemberNick());
			pstmt.setString(4, m.getGender());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, m.getBirthYear());
			pstmt.setString(2, m.getLikeStyle());
			pstmt.setString(3, m.getMemberId());
			
			result = pstmt.executeUpdate();
//			MEMBER_NO
//			GRADE_CODE
//			MEMBER_ID
//			MEMBER_PWD
//			MEMBER_NICK
//			GENDER
//			PROFILE
//			LIKE_STYLE
//			BIRTH_YEAR
//			ENTRY_DATE
//			MEMBER_STATUS
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int withdrawMember(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
	    int result = 0;

	    String sql = prop.getProperty("withdrawMember");

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, memberNo);

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
	}

	public Member selectMember(Connection conn, String id) {
		Member mem = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectMember");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mem = new Member(rset.getInt("MEMBER_NO"),
									   rset.getString("GRADE_CODE"),
									   rset.getString("MEMBER_ID"),
									   rset.getString("MEMBER_PWD"),
									   rset.getString("MEMBER_NICK"),
									   rset.getString("GENDER"),
									   rset.getString("PROFILE"),
									   rset.getString("LIKE_STYLE"),
									   rset.getInt("BIRTH_YEAR"),
									   rset.getDate("ENTRY_DATE"),
									   rset.getString("MEMBER_STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return mem;
	}

	public int nickcheck(Connection conn, String nickname) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("idCheck");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,nickname);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
