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
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("nickCheck");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,nickname);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
				
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int emailcheck(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("emailCheck");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int updatePwd(Connection conn, String memberId, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, newPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member selectemail(Connection conn, String id) {
		Member mem = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectemail");
		
		
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
		System.out.println("select : " + mem);
		return mem;
	}

	   public int resetPwd(Connection conn,  Member m) {
		   PreparedStatement pstmt = null;
		      int result = 0;
		      
		      String query = prop.getProperty("resetPwd");
		      
		      try {
		    	  System.out.println("비번 : " + m.getMemberPwd() + ", 아이디 : " + m.getMemberId());
		         pstmt = conn.prepareStatement(query);
		         pstmt.setString(1, m.getMemberPwd());
		         pstmt.setString(2, m.getMemberId());
		         result = pstmt.executeUpdate();
		         System.out.println("update : " + result);
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }finally {
		         close(pstmt);
		      }
		      System.out.println("update : " + result);
		      return result;
		   }

}
