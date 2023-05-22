package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.User_Mypage;
import vo.AlarmInfo;

public class UserAlarmSelectListService {

	public ArrayList<AlarmInfo> selectAlarm(String user_id) throws Exception {
		ArrayList<AlarmInfo> alarm = null;
		Connection con = getConnection();
		User_Mypage um = User_Mypage.getInstance();
		um.setConnection(con);
		alarm = um.getAlarmList(user_id);

		close(con);
		return alarm;
	}
}
