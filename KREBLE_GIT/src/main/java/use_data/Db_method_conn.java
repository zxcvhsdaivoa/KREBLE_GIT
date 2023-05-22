package use_data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Db_method_conn {

	Connection con = null;
	Statement stm = null;

	public void conn() throws Exception {// 연결 메소드
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://52.78.61.168:3306/kreble", "kreble", "kreble");
			if (con == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			stm = con.createStatement();
		} catch (ClassNotFoundException e) {

		}
	}

	public void diconn() {// 연결 해제 메소드
		try {
			stm.close();
			con.close();
		} catch (Exception ignored) {

		}
	}
}
