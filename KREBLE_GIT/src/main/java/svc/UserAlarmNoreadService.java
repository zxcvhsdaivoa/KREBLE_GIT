package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.User_Mypage;

public class UserAlarmNoreadService {
	public int noread(String user_id) throws Exception {
		int i =0;
		Connection con = getConnection();
		User_Mypage um = User_Mypage.getInstance();
		um.setConnection(con);
		i = um.noreadAlarm(user_id);

		close(con);
		return i;
	}
}
