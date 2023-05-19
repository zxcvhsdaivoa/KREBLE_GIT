package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.User_Mypage;
import vo.AlarmInfo;

public class UserAlarmInsertService {
	public boolean insertAlarm(AlarmInfo ai, String alarm_type) throws Exception {
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		User_Mypage um = User_Mypage.getInstance();
		um.setConnection(con);
		ai.setAlarm_type(alarm_type);
		int result = um.setAlarm(ai);
		if(result > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		close(con);
		return isWriteSuccess;
	}
}
