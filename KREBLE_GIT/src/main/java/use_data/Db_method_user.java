package use_data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Db_method_user extends Db_method_conn {
	// 캐시 호출 코드
	// <jsp:useBean id="cash" class="use_data.Db_method_user"></jsp:useBean>
	// <%
	// int uc = cash.u_cash(id);
	// %>

	// 캐쉬호출
	public int u_cash(String id) throws Exception {
		int h_cash = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_cash from user where user_id = ?";

		try {
			conn();
			if (con == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				h_cash = Integer.parseInt(rs.getString("user_cash"));
			}
		} catch (Exception ignored) {

		} finally {
			diconn();
		}
		return h_cash;
	}

	public String login_data(String id, String pw) throws Exception {
		String login;
		try {
			conn();
			ResultSet rs = stm
					.executeQuery("select user_id from user where user_id='" + id + "' AND user_pass='" + pw + "';");
			if (rs.next()) {
				login = "true";
			} else {
				login = "false";
			}
		} finally {
			diconn();
		}
		return login;
	}

	public ArrayList<String> join_member_idcheck() throws Exception {
		ArrayList<String> idList = new ArrayList<String>();
		try {
			conn();
			ResultSet rs = stm.executeQuery("select user_id from user;");
			while (rs.next()) {
				idList.add(rs.getString("user_id"));
			}
		} finally {
			diconn();
		}
		return idList;
	}

	public void join_member_succass(UserData ud) throws Exception {
		try {
			conn();
			String command = String.format("insert into user values('" + ud.getId() + "','" + ud.getNick() + "' ,'"
					+ ud.getName() + "','" + ud.getPw() + "','" + ud.getPh() + "','" + ud.getEmail() + "','"
					+ ud.getAddress() + "','" + ud.getGender() + "',now(), now(), default, 'p.jpg');");
			int rowNum = stm.executeUpdate(command);
			if (rowNum < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}
		} finally {
			diconn();
		}
	}

}
