package use_data;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Db_method_shop extends Db_method_conn {

//	관심상품 true/false 저장된값 호출
	public HashMap<String, String> prd_like(String pid) {
		HashMap<String, String> prlk = new HashMap<>();
		try {
			conn();
			String command = String.format("select * from shop_prd_like where u_id='" + pid + "';");
			ResultSet rs = stm.executeQuery(command);
			boolean hasResult = false;
			while (rs.next()) {
				hasResult = true;
				String p_no = rs.getString("p_no");
				prlk.put(p_no, pid);
			}
			if (!hasResult) {
				prlk = null; // 결과가 없으면 null로 설정
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			diconn();
		}
		return prlk;
	}

	// 관심상품 등록수 많은 상위 4개 데이터 가져오기
	public ArrayList<Shop_prd> prd_like_top4() {
		ArrayList<Shop_prd> board = new ArrayList<Shop_prd>();
		String get_no = "a";
		try {
			conn();
			String command = String
					.format("select p_no from shop_prd_like group by p_no order by count(p_no) desc limit 0,4;");
			ResultSet rs = stm.executeQuery(command);
			while (rs.next()) {
				get_no = rs.getString("p_no");
				try {
					conn();
					String command2 = String.format("select * from product where prd_no='" + get_no + "';");
					ResultSet rs2 = stm.executeQuery(command2);
					if (rs2.next()) {
						Shop_prd aa = new Shop_prd();
						aa.setPrd_no(rs2.getString("prd_no"));
						aa.setPrd_cata(rs2.getString("prd_cata"));
						aa.setPrd_img(rs2.getString("prd_img"));
						aa.setPrd_name(rs2.getString("prd_name"));
						aa.setPrd_price(rs2.getInt("prd_price"));
						aa.setPrd_color(rs2.getString("prd_color"));
						aa.setPrd_id(rs2.getString("prd_id"));
						aa.setPrd_note(rs2.getString("prd_note"));
						aa.setPrd_date(rs2.getString("prd_date"));
						board.add(aa);
					}
				} finally {
					diconn();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			diconn();
		}
		return board;
	}

	// 평점 제일 높은 제품 가져오기
	public Shop_prd prd_re_best() {
		Shop_prd prd = new Shop_prd();
		try {
			conn();
			String command = String.format(
					"select * from product where prd_no = (SELECT prd_re_no FROM prd_re GROUP BY prd_re_no order by avg(prd_re_sc) desc limit 1);");
			ResultSet rs = stm.executeQuery(command);
			while (rs.next()) {
				prd.setPrd_no(rs.getString("prd_no"));
				prd.setPrd_cata(rs.getString("prd_cata"));
				prd.setPrd_img(rs.getString("prd_img"));
				prd.setPrd_name(rs.getString("prd_name"));
				prd.setPrd_price(rs.getInt("prd_price"));
				prd.setPrd_color(rs.getString("prd_color"));
				prd.setPrd_id(rs.getString("prd_id"));
				prd.setPrd_note(rs.getString("prd_note"));
				prd.setPrd_date(rs.getString("prd_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			diconn();
		}
		return prd;
	}

//	상품평점 호출
	public HashMap<String, Integer> re_score() {
		HashMap<String, Integer> resc = new HashMap<>();
		try {
			conn();
			String command = String
					.format("SELECT prd_re_no as p_no, round(avg(prd_re_sc)) AS avg FROM prd_re GROUP BY prd_re_no");

			ResultSet rs = stm.executeQuery(command);
			while (rs.next()) {
				String p_no = rs.getString("p_no");
				int avg_score = rs.getInt("avg");
				resc.put(p_no, avg_score);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			diconn();
		}

		return resc;
	}

//	상품판매량 순위
	public String[] rank_seller() throws Exception {
		String[] aa = new String[3];
		try {
			conn();
			String command = String
					.format("SELECT prd_id as id, COUNT(prd_no) AS cnt FROM product GROUP BY prd_id ORDER BY cnt DESC");
			ResultSet rs = stm.executeQuery(command);
			int index = 0;
			if (rs.next()) {
				while (index < 3) {
					aa[index] = rs.getString("id");
					index++;
					if (!rs.next())
						break;
				}
			} else {
				while (index < 3) {
					aa[index] = "";
					index++;
				}
			}
		} catch (Exception e) {

		} finally {
			diconn();
		}
		return aa;
	}

//		상품리스트 로드
	public ArrayList<Shop_prd> shop_prd_list() throws Exception {
		ArrayList<Shop_prd> board = new ArrayList<Shop_prd>();
		try {
			conn();
			if (con == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}

			stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select * from product;");

			while (rs.next()) {
				Shop_prd aa = new Shop_prd();
				aa.setPrd_no(rs.getString("prd_no"));
				aa.setPrd_cata(rs.getString("prd_cata"));
				aa.setPrd_img(rs.getString("prd_img"));
				aa.setPrd_name(rs.getString("prd_name"));
				aa.setPrd_price(rs.getInt("prd_price"));
				aa.setPrd_color(rs.getString("prd_color"));
				aa.setPrd_id(rs.getString("prd_id"));
				aa.setPrd_note(rs.getString("prd_note"));
				aa.setPrd_date(rs.getString("prd_date"));
				board.add(aa);
			}
		} catch (Exception ignored) {

		} finally {
			diconn();
		}

		return board;
	}

//	상품디테일 로드
	public Shop_prd shop_prd_detail(String p_no) throws Exception {
		Shop_prd aa = new Shop_prd();
		try {
			conn();
			if (con == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select * from product where prd_no = '" + p_no + "';");
			if (rs.next()) {
				aa.setPrd_img(rs.getString("prd_img"));
				aa.setPrd_name(rs.getString("prd_name"));
				aa.setPrd_cata(rs.getString("prd_cata"));
				aa.setPrd_id(rs.getString("prd_id"));
				aa.setPrd_meter(rs.getString("prd_meter"));
				aa.setPrd_note(rs.getString("prd_note"));
				aa.setPrd_price(rs.getInt("prd_price"));
				aa.setPrd_size(rs.getString("prd_size"));
				aa.setPrd_color(rs.getString("prd_color"));
				aa.setPrd_date(rs.getString("prd_date"));
				aa.setPrd_create(rs.getString("prd_create"));
				aa.setPrd_qaul(rs.getString("prd_qaul"));
				aa.setPrd_as(rs.getString("prd_as"));
				aa.setPrd_qant(rs.getInt("prd_qant"));
				aa.setPrd_content(rs.getString("prd_content"));
			}
		} catch (Exception ignored) {

		} finally {
			diconn();
		}
		return aa;
	}
//	  상품디테일_댓글로드

	public ArrayList<Shop_prd> shop_prde_reply(String p_no) throws Exception {
		ArrayList<Shop_prd> pr = new ArrayList<Shop_prd>();
		boolean hasResult = false;
		try {
			conn();
			if (con == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			stm = con.createStatement();
			ResultSet rs = stm.executeQuery(
					"select * from prd_re where prd_re_no = '" + p_no + "'order by prd_re_num desc limit 5;");
			while (rs.next()) {
				hasResult = true;
				Shop_prd aa = new Shop_prd();
				aa.setPrd_re_id(rs.getString("prd_re_id"));
				aa.setPrd_re_text(rs.getString("prd_re_text"));
				aa.setPrd_re_no(rs.getString("prd_re_no"));
				aa.setPrd_re_num(rs.getInt("prd_re_num"));
				aa.setPrd_re_sc(rs.getInt("prd_re_sc"));
				pr.add(aa);
			}
			if (!hasResult) {
				pr = null; // 결과가 없으면 null로 설정
			}
		} catch (Exception ignored) {
			System.out.println(ignored);

		} finally {
			diconn();
		}
		return pr;
	}

	// 게시판 로드
	public ArrayList<Shop_reform_db> shop_board() throws Exception {
		ArrayList<Shop_reform_db> board = new ArrayList<Shop_reform_db>();
		try {
			conn();
			if (con == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select * from shop_reform;");
			while (rs.next()) {
				Shop_reform_db ob = new Shop_reform_db();
				ob.setRenum(rs.getInt("shop_renum"));
				ob.setRecata(rs.getString("shop_recata"));
				ob.setRetitle(rs.getString("shop_retitle"));
				ob.setReid(rs.getString("shop_reid"));
				ob.setRetrade(rs.getString("shop_retrade"));
				ob.setRedate(rs.getString("shop_redate"));
				board.add(ob);
			}
		} catch (Exception ignored) {

		} finally {
			diconn();
		}

		return board;
	}

//	  게시판 서치
	public ArrayList<Shop_reform_db> shop_board_sc(String re_trade, String re_title) throws Exception {
		ArrayList<Shop_reform_db> board = new ArrayList<Shop_reform_db>();
		if (re_title != "") {
			re_title.trim().toLowerCase();
		}
		try {
			conn();
			if (con == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			stm = con.createStatement();

			StringBuilder commandBuilder = new StringBuilder();
			commandBuilder.append("select * from shop_reform");
			if (re_trade != "" || re_title != "") {
				commandBuilder.append(" where ");
			}
			if (re_trade != "") {
				commandBuilder.append("shop_retrade='" + re_trade + "'");
			}

			if (re_trade != "" && re_title != "") {
				commandBuilder.append("and shop_retitle like '%" + re_title + "%'");
			} else if (re_trade == "" && re_title != "") {
				commandBuilder.append("shop_retitle like '%" + re_title + "%'");
			}
			commandBuilder.append(";");

			String aa = commandBuilder.toString();
			ResultSet rs = stm.executeQuery(aa);
			while (rs.next()) {
				Shop_reform_db ob = new Shop_reform_db();
				ob.setRenum(rs.getInt("shop_renum"));
				ob.setRecata(rs.getString("shop_recata"));
				ob.setRetitle(rs.getString("shop_retitle"));
				ob.setReid(rs.getString("shop_reid"));
				ob.setRetrade(rs.getString("shop_retrade"));
				ob.setRedate(rs.getString("shop_redate"));
				board.add(ob);
			}
			while (rs.next()) {
			}
		} catch (Exception ignored) {

		} finally {
			diconn();
		}
		return board;
	}

	// 카테고리 서치
	public ArrayList<Shop_reform_db> shop_board_casc(String cata) throws Exception {
		ArrayList<Shop_reform_db> board = new ArrayList<Shop_reform_db>();
		try {
			conn();
			if (con == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select * from shop_reform where shop_recata = '" + cata + "';");
			while (rs.next()) {
				Shop_reform_db ob = new Shop_reform_db();
				ob.setRenum(rs.getInt("shop_renum"));
				ob.setRecata(rs.getString("shop_recata"));
				ob.setRetitle(rs.getString("shop_retitle"));
				ob.setReid(rs.getString("shop_reid"));
				ob.setRetrade(rs.getString("shop_retrade"));
				ob.setRedate(rs.getString("shop_redate"));
				board.add(ob);
			}
		} catch (Exception ignored) {

		} finally {
			diconn();
		}
		return board;
	}

	// 게시글 로드
	public Shop_reform_db shop_board_1(String aa) throws Exception {
		Shop_reform_db board = new Shop_reform_db();
		try {
			conn();
			if (con == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select * from shop_reform where shop_renum = " + aa + ";");
			if (rs.next()) {
				board.setRequnt(rs.getInt("shop_requnt"));
				board.setRecata(rs.getString("shop_recata"));
				board.setRetitle(rs.getString("shop_retitle"));
				board.setReid(rs.getString("shop_reid"));
				board.setRetrade(rs.getString("shop_retrade"));
				board.setRedate(rs.getString("shop_redate"));
				board.setRetext(rs.getString("shop_retext"));
			}
		} catch (Exception ignored) {
		} finally {
			diconn();
		}

		return board;
	}

	// 입력메소드
	public void board_input(Shop_reform_db aal) throws Exception {
		String cata = aal.getRecata();
		String title = aal.getRetitle();
		String id = aal.getReid();
		String trade = aal.getRetrade();
		int qunt = aal.getRequnt();
		String text = aal.getRetext();
		String date = aal.getRedate();
		try {
			conn();
			if (con == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			stm = con.createStatement();
			String command = String.format("insert into shop_reform values(default,'%s','%s','%s','%s',%s,%s,'%s')",
					cata, title, id, trade, qunt, date, text);
			int rowNum = stm.executeUpdate(command);
			if (rowNum < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}

		} catch (Exception ignored) {
		} finally {
			diconn();
		}
	}

	// 수정메소드
	public void board_mody(Shop_reform_db aal) throws Exception {
		try {
			conn();
			if (con == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			stm = con.createStatement();
			String command = String
					.format("update shop_reform set shop_recata = '" + aal.getRecata() + "',shop_retitle= '"
							+ aal.getRetitle() + "',shop_retrade='" + aal.getRetrade() + "',shop_requnt = " + aal.requnt
							+ ",shop_retext = '" + aal.getRetitle() + "' where shop_renum=" + aal.getRenum() + ";");
			int rowNum = stm.executeUpdate(command);
			if (rowNum < 1) {
				throw new Exception("데이터를 DB에 입력할 수 없습니다.");
			}
		} catch (Exception ignored) {
		} finally {
			diconn();
		}
	}

	// 삭제메소드
	public void dbdelete(String renum) throws Exception {
		try {
			conn();
			if (con == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			stm = con.createStatement();
			String command = String.format("delete from shop_reform where shop_renum = " + renum + ";");
			int comm = stm.executeUpdate(command);
			if (comm < 1) {
				throw new Exception("데이터를 삭제할 수 없습니다.");
			}

		} catch (Exception ignored) {
		} finally {
			diconn();
		}
	}

	public ArrayList<Shop_reform_db> no_trade_latest5() throws Exception {
		ArrayList<Shop_reform_db> board = new ArrayList<Shop_reform_db>();
		try {
			conn();
			if (con == null) {
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			stm = con.createStatement();
			ResultSet rs = stm.executeQuery(
					"select * from shop_reform where shop_retrade='미체결' order by shop_renum desc limit 5;");
			while (rs.next()) {
				Shop_reform_db ob = new Shop_reform_db();
				ob.setRenum(rs.getInt("shop_renum"));
				ob.setRecata(rs.getString("shop_recata"));
				ob.setRetitle(rs.getString("shop_retitle"));
				ob.setReid(rs.getString("shop_reid"));
				ob.setRetrade(rs.getString("shop_retrade"));
				ob.setRequnt(rs.getInt("shop_requnt"));
				ob.setRedate(rs.getString("shop_redate"));
				ob.setRetext(rs.getString("shop_retext"));
				board.add(ob);
			}
		} catch (Exception ignored) {

		} finally {
			diconn();
		}

		return board;
	}

	// 이미지 경로
	public String img_link(String no) {
		String impath = "";
		char p_no = no.charAt(0);
		switch (p_no) {
		case 's':
			impath = "image/shopimg/sue/";
			break;
		case 'u':
			impath = "image/shopimg/uni/";
			break;
		case 'b':
			impath = "image/shopimg/ball/";
			break;
		case 'e':
			impath = "image/shopimg/etc/";
			break;
		}
		return impath;
	}
}
