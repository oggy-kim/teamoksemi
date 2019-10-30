package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.*;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {

	public Member loginMember(String id, String pwd) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, id, pwd);
		
		close(conn);
		
		return loginUser;
	}

	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		
		if(result > 0) {
			commit(conn);
			
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
}
