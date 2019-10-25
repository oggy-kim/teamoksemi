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
									   rset.getString("GENDER").charAt(0),
									   rset.getString("PROFILE"),
									   rset.getString("LIKE_STYLE"),
									   rset.getInt("AGE"),
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

}