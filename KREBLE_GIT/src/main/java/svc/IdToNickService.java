package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.User_Mypage;

public class IdToNickService {
	public String getNickname(String id) throws Exception {
		String nick = null;
		Connection con = getConnection();
		User_Mypage mpage = User_Mypage.getInstance();
		mpage.setConnection(con);
		nick = mpage.userinfo(id,"nick");
		close(con);
		return nick;
	}
}
