package use_data;

import java.sql.ResultSet;
import java.util.ArrayList;

public class Db_method_commu extends Db_method_conn {

	public ArrayList<CommunityData> commu_all(int page, int limit) throws Exception { // 커뮤니티 호출 메소드
		ArrayList<CommunityData> si = new ArrayList<CommunityData>();
		conn();
		int startrow = (page - 1) * 15;
		try {
			ResultSet rs = stm.executeQuery(
					"select * from community order by commu_no desc limit " + startrow + ", " + limit + ";");
			while (rs.next()) {
				CommunityData cdb = new CommunityData();
				cdb.setComu_num(rs.getInt("commu_no"));
				cdb.setId(rs.getString("user_id"));
				cdb.setCategory(rs.getString("category"));
				cdb.setComu_title(rs.getString("commu_title"));
				cdb.setComu_write(rs.getString("commu_write"));
				cdb.setComu_file(rs.getString("commu_file"));
				cdb.setComu_date(rs.getString("commu_wrday"));
				cdb.setCount(rs.getInt("commu_readcount"));
				si.add(cdb);
			}
		} finally {
			diconn();
		}
		return si;
	}

	public ArrayList<CommunityData> commu_cate(String cate, int page, int limit) throws Exception { // 커뮤니티 카테고리별 호출 메소드
		ArrayList<CommunityData> si = new ArrayList<CommunityData>();
		conn();
		int startrow = (page - 1) * 15;
		try {
			ResultSet rs = stm.executeQuery("select * from community where category='" + cate
					+ "' order by commu_no desc limit " + startrow + ", " + limit + ";");
			while (rs.next()) {
				CommunityData cdb = new CommunityData();
				cdb.setComu_num(rs.getInt("commu_no"));
				cdb.setId(rs.getString("user_id"));
				cdb.setCategory(rs.getString("category"));
				cdb.setComu_title(rs.getString("commu_title"));
				cdb.setComu_write(rs.getString("commu_write"));
				cdb.setComu_file(rs.getString("commu_file"));
				cdb.setComu_date(rs.getString("commu_wrday"));
				cdb.setCount(rs.getInt("commu_readcount"));
				si.add(cdb);
			}
		} finally {
			diconn();
		}
		return si;
	}

	public ArrayList<CommunityData> commu_mycommu(String mycommu, String id, String cate, int page, int limit)
			throws Exception { // 커뮤니티 나의커뮤 호출 메소드
		ArrayList<CommunityData> si = new ArrayList<CommunityData>();
		conn();
		int startrow = (page - 1) * 15;
		try {
			StringBuilder commandBuilder = new StringBuilder();
			commandBuilder.append("select * from community where ");
			if (!cate.equals("all")) {
				commandBuilder.append("category ='" + cate + "' and ");
			}

			if (mycommu.equals("board")) {
				commandBuilder.append("user_id='" + id + "'");
			} else if (mycommu.equals("comment")) {
				commandBuilder.append("commu_no in (select commu_no from commu_comment where user_id='" + id + "')");
			}
			commandBuilder.append(" order by commu_no desc limit " + startrow + ", " + limit + ";");
			String aa = commandBuilder.toString();
			ResultSet rs = stm.executeQuery(aa);
			while (rs.next()) {
				CommunityData cdb = new CommunityData();
				cdb.setComu_num(rs.getInt("commu_no"));
				cdb.setId(rs.getString("user_id"));
				cdb.setCategory(rs.getString("category"));
				cdb.setComu_title(rs.getString("commu_title"));
				cdb.setComu_write(rs.getString("commu_write"));
				cdb.setComu_file(rs.getString("commu_file"));
				cdb.setComu_date(rs.getString("commu_wrday"));
				cdb.setCount(rs.getInt("commu_readcount"));
				si.add(cdb);
			}
		} finally {
			diconn();
		}
		return si;
	}

	public ArrayList<CommunityData> commu_search(String mycommu, String id, String select, String text, String cate,
			int page, int limit) throws Exception { // 커뮤니티 검색 메소드
		conn();
		ArrayList<CommunityData> si = new ArrayList<CommunityData>();
		int startrow = (page - 1) * 15;
		try {
			StringBuilder commandBuilder = new StringBuilder();
			commandBuilder.append("select * from community where ");
			if (!cate.equals("all")) {
				commandBuilder.append("category ='" + cate + "' and ");
			}

			if (mycommu.equals("board")) {
				commandBuilder.append("user_id='" + id + "' and ");
			} else if (mycommu.equals("comment")) {
				commandBuilder
						.append("commu_no in (select commu_no from commu_comment where user_id='" + id + "') and ");
			}

			if (select.equals("search_title")) {
				commandBuilder.append("commu_title like '%" + text + "%'");
			} else if (select.equals("search_title_write")) {
				commandBuilder.append("(commu_title like '%" + text + "%' or commu_write like '%" + text + "%')");
			} else if (select.equals("search_name")) {
				commandBuilder.append("user_id='" + text + "'");
			}
			commandBuilder.append(" order by commu_no desc limit " + startrow + ", " + limit + ";");
			String aa = commandBuilder.toString();
			ResultSet rs = stm.executeQuery(aa);
			while (rs.next()) {
				CommunityData cdb = new CommunityData();
				cdb.setComu_num(rs.getInt("commu_no"));
				cdb.setId(rs.getString("user_id"));
				cdb.setCategory(rs.getString("category"));
				cdb.setComu_title(rs.getString("commu_title"));
				cdb.setComu_write(rs.getString("commu_write"));
				cdb.setComu_file(rs.getString("commu_file"));
				cdb.setComu_date(rs.getString("commu_wrday"));
				cdb.setCount(rs.getInt("commu_readcount"));
				si.add(cdb);
			}
		} finally {
			diconn();
		}
		return si;
	}

	public int commu_all_count() throws Exception { // 커뮤니티 전체 갯수
		int count = 0;
		conn();
		try {
			ResultSet rs = stm.executeQuery("select count(*) from community order by commu_no desc;");
			if (rs.next()) {
				count = rs.getInt("count(*)");
			}
		} finally {
			diconn();
		}
		return count;
	}

	public int commu_cate_count(String cate) throws Exception { // 커뮤니티 카테고리별 갯수
		int count = 0;
		conn();
		try {
			ResultSet rs = stm.executeQuery(
					"select count(*) from community where category='" + cate + "' order by commu_no desc;");
			if (rs.next()) {
				count = rs.getInt("count(*)");
			}
		} finally {
			diconn();
		}
		return count;
	}

	public int commu_mycommu_count(String mycommu, String id, String cate) throws Exception { // 커뮤니티 나의커뮤 갯수
		conn();
		int count = 0;
		try {
			StringBuilder commandBuilder = new StringBuilder();
			commandBuilder.append("select count(*) from community where ");
			if (!cate.equals("all")) {
				commandBuilder.append("category ='" + cate + "' and ");
			}

			if (mycommu.equals("board")) {
				commandBuilder.append("user_id='" + id + "'");
			} else if (mycommu.equals("comment")) {
				commandBuilder.append("commu_no in (select commu_no from commu_comment where user_id='" + id + "')");
			}
			commandBuilder.append(" order by commu_no desc;");
			String aa = commandBuilder.toString();
			ResultSet rs = stm.executeQuery(aa);
			if (rs.next()) {
				count = rs.getInt("count(*)");
			}
		} finally {
			diconn();
		}
		return count;
	}

	public int commu_search_count(String mycommu, String id, String select, String text, String cate) throws Exception { // 커뮤니티
																															// 검색
																															// 갯수
		conn();
		int count = 0;
		try {
			StringBuilder commandBuilder = new StringBuilder();
			commandBuilder.append("select count(*) from community where ");
			if (!cate.equals("all")) {
				commandBuilder.append("category ='" + cate + "' and ");
			}

			if (select.equals("search_title")) {
				commandBuilder.append("commu_title like '%" + text + "%'");
			} else if (select.equals("search_title_write")) {
				commandBuilder.append("(commu_title like '%" + text + "%' or commu_write like '%" + text + "%')");
			} else if (select.equals("search_name")) {
				commandBuilder.append("user_id='" + text + "'");
			}
			commandBuilder.append(" order by commu_no desc;");
			String aa = commandBuilder.toString();
			ResultSet rs = stm.executeQuery(aa);
			if (rs.next()) {
				count = rs.getInt("count(*)");
			}
		} finally {
			diconn();
		}
		return count;
	}

	public CommunityData commu_one(int comu_no) throws Exception { // 커뮤니티 페이지1개 호출 메소드
		conn();
		CommunityData cdb = new CommunityData();
		try {
			ResultSet rs = stm.executeQuery("select * from community where commu_no=" + comu_no + ";");
			if (rs.next()) {
				cdb.setComu_num(rs.getInt("commu_no"));
				cdb.setId(rs.getString("user_id"));
				cdb.setCategory(rs.getString("category"));
				cdb.setComu_title(rs.getString("commu_title"));
				cdb.setComu_write(rs.getString("commu_write"));
				cdb.setComu_file(rs.getString("commu_file"));
				cdb.setComu_date(rs.getString("commu_wrday"));
				cdb.setCount(rs.getInt("commu_readcount"));
			}
		} finally {
			diconn();
		}
		return cdb;
	}

	public CommunityData next_board(int comu_no) throws Exception { // 커뮤니티 다음글 호출 메소드
		conn();
		CommunityData cdb = new CommunityData();
		try {
			ResultSet rs = stm.executeQuery(
					"select * from community where commu_no>" + comu_no + " order by commu_no ASC LIMIT 1;");
			if (rs.next()) {
				cdb.setComu_num(rs.getInt("commu_no"));
				cdb.setComu_title(rs.getString("commu_title"));
			}
		} finally {
			diconn();
		}
		return cdb;
	}

	public CommunityData prev_board(int comu_no) throws Exception { // 커뮤니티 다음글 호출 메소드
		conn();
		CommunityData cdb = new CommunityData();
		try {
			ResultSet rs = stm.executeQuery(
					"select * from community where commu_no<" + comu_no + " order by commu_no desc LIMIT 1;");
			if (rs.next()) {
				cdb.setComu_num(rs.getInt("commu_no"));
				cdb.setComu_title(rs.getString("commu_title"));
			}
		} finally {
			diconn();
		}
		return cdb;
	}

	public void commu_write(CommunityData cmd) throws Exception { // 커뮤니티 글 작성
		try {
			conn();
			String command = String.format("insert into community values('" + cmd.getId() + "',default,'"
					+ cmd.getCategory() + "','" + cmd.getComu_title() + "','" + cmd.getComu_write() + "','"
					+ cmd.getComu_file() + "',0,now());");
			int rowNum = stm.executeUpdate(command);
			if (rowNum < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}
		} finally {
			diconn();
		}
	}

	public void commu_change(CommunityData cmd) throws Exception { // 커뮤니티 글 수정
		try {
			conn();
			String command = null;
			if (cmd.getComu_file() == null || cmd.getComu_file().equals("null") || cmd.getComu_file() == "null") {
				command = String.format(
						"update community set category:='%s',commu_title:='%s',commu_write:='%s' where commu_no=%s AND user_id='%s'",
						cmd.getCategory(), cmd.getComu_title(), cmd.getComu_write(), cmd.getComu_num(), cmd.getId());
			} else {
				command = String.format(
						"update community set category:='%s',commu_title:='%s',commu_write:='%s',commu_file:='%s' where commu_no=%s AND user_id='%s'",
						cmd.getCategory(), cmd.getComu_title(), cmd.getComu_write(), cmd.getComu_file(),
						cmd.getComu_num(), cmd.getId());
			}
			int rowNum = stm.executeUpdate(command);
			if (rowNum < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}
		} finally {
			diconn();
		}
	}

	public int getReadCount(int commu_no) {// 커뮤니티 기존 조회수 가져오기
		int readcount = 0;
		try {
			conn();
			ResultSet rs = stm.executeQuery("select commu_readcount from community where commu_no =" + commu_no);
			if (rs.next())
				readcount = rs.getInt("commu_readcount") + 1;
		} catch (Exception ex) {
		} finally {
			diconn();
		}
		return readcount;
	}

	public void updateReadCount(int count, int commu_no) {// 커뮤니티 조회수 증가
		try {
			conn();

			String command = String.format("update community set commu_readcount=%s where commu_no=%s", count,
					commu_no);
			int rowNum = stm.executeUpdate(command);
			if (rowNum < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}
		} catch (Exception ex) {
		} finally {
			diconn();
		}
	}

	public void commu_delete(String no, String id) throws Exception { // 커뮤니티 글 삭제
		try {
			conn();
			String command = String.format("delete from commu_comment where commu_no='%s';", no);
			stm.executeUpdate(command);

			String command2 = String.format("delete from community where commu_no='%s' and user_id='%s';", no, id);
			int rowNum2 = stm.executeUpdate(command2);
			if (rowNum2 < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}
		} finally {
			diconn();
		}
	}

	public int comment_write(CommuCommentData ccd) throws Exception { // 커뮤니티 댓글 작성
		int rowNum = 0;
		try {
			conn();
			String command = String.format("insert into commu_comment values('" + ccd.getUser_id() + "','"
					+ ccd.getCommu_no() + "','" + ccd.getCommuComment() + "',now(),default);");
			rowNum = stm.executeUpdate(command);
			if (rowNum < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}
		} finally {
			diconn();
		}
		return rowNum;
	}

	public ArrayList<CommuCommentData> comment_list(int commu_no) throws Exception { // 커뮤니티 댓글 조회 가져오기
		ArrayList<CommuCommentData> ccd_list = new ArrayList<CommuCommentData>();
		conn();
		try {
			ResultSet rs = stm.executeQuery("select * from commu_comment where commu_no =" + commu_no + ";");
			while (rs.next()) {
				CommuCommentData ccd = new CommuCommentData();
				ccd.setUser_id(rs.getString("user_id"));
				ccd.setCommu_no(rs.getInt("commu_no"));
				ccd.setCommuComment(rs.getString("comment"));
				ccd.setComment_wrdate(rs.getString("comment_date"));
				ccd_list.add(ccd);
			}
		} finally {
			diconn();
		}
		return ccd_list;
	}

	public CommunityData hot_commu(String cate) throws Exception {
		CommunityData hot_commu = new CommunityData();
		conn();
		try {
			ResultSet rs = stm.executeQuery("select * from community where category='" + cate
					+ "' and commu_readcount=(select max(commu_readcount) from community where category='" + cate
					+ "') order by commu_wrday desc, commu_no desc limit 0,1;;");
			if (rs.next()) {
				hot_commu.setId(rs.getString("user_id"));
				hot_commu.setComu_title(rs.getString("commu_title"));
				hot_commu.setComu_write(rs.getString("commu_write"));
			}
		} finally {
			diconn();
		}
		return hot_commu;
	}
}
