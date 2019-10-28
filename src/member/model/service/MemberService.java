package member.model.service;

import java.sql.*;
import static common.JDBCTemplate.*;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {

	public Member loginMember(String id, String pwd) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, id, pwd);
		
		close(conn);
		
		return loginUser;
	}

	public int withdrawMember(int memberNo) {
		Connection conn = getConnection();

		int result = new MemberDao().withdrawMember(conn, memberNo);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

}
