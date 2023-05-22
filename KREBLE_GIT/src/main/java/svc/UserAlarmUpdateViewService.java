package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.User_Mypage;

public class UserAlarmUpdateViewService {
	public void updateView(String user_id,int no) throws Exception {
		Connection con = getConnection();
		User_Mypage um = User_Mypage.getInstance();
		um.setConnection(con);
		int result = um.updateAlarmView(user_id,no);
		if(result > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		close(con);
	}
}
