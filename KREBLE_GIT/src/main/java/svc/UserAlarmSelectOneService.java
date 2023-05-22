package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.User_Mypage;
import vo.AlarmInfo;

public class UserAlarmSelectOneService {
	public AlarmInfo selectAlarm(String user_id,int no) throws Exception {
		AlarmInfo alarm = null;
		Connection con = getConnection();
		User_Mypage um = User_Mypage.getInstance();
		um.setConnection(con);
		alarm = um.getAlarm(user_id,no);

		close(con);
		return alarm;
	}
}
