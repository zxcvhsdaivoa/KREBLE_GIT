package dao;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.sql.DataSource;

import use_data.Shop_prd;

public class Shop_DAO {
	DataSource ds;
	Connection con;
	private static Shop_DAO shop_DAO;

	private Shop_DAO() {
	}

	public static Shop_DAO getInstance() {
		if (shop_DAO == null) {
			shop_DAO = new Shop_DAO();
		}
		return shop_DAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	//장바구니 등록개수
	public int cart_cnt(String user_id){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int sc=0;
		try{
			pstmt = con.prepareStatement("select count(sb_buy_id) from shop_back where sb_buy_id = ?;");
			pstmt.setString(1, user_id);
			rs= pstmt.executeQuery();
			if(rs.next()){
				sc = rs.getInt("count(sb_buy_id)");
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return sc;
	}

	//관심상품 등록개수
	public int like_cnt(String user_id){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int sc=0;
		try{
			pstmt = con.prepareStatement("select count(u_id) from shop_prd_like where u_id = ?;");
			pstmt.setString(1, user_id);
			rs= pstmt.executeQuery();
			if(rs.next()){
				sc = rs.getInt("count(u_id)");
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			close(rs);
			close(pstmt);
		}
		return sc;
	}
	
	// 상품리스트 갯수
	public int selectListCount() {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("select count(*) from shop_product");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {

		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	// 카테고리 상품리스트 갯수
	public int CaSelectListCount(String cata) {
		String prd_cata = "";
		switch (cata) {
		case "uni":
			prd_cata = "유니폼";
			break;
		case "ball":
			prd_cata = "축구공";
			break;
		case "sho":
			prd_cata = "축구화";
			break;
		default:
			prd_cata = "기타용품";
			break;
		}

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select count(*) from shop_product where prd_cata=?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prd_cata);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {

		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	// 카테고리 상품리스트
	public ArrayList<Shop_prd> caSelectArticleList(String cata, int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String shop_list_sql = "select * from shop_product where prd_cata=? order by prd_no desc limit ?,5";
		ArrayList<Shop_prd> articleList = new ArrayList<Shop_prd>();
		Shop_prd shop_prd = null;
		int startrow = (page - 1) * 5;
		String prd_cata = "";
		if(cata.equals("유니폼")||cata.equals("축구공")||cata.equals("축구화")||cata.equals("기타용품")) {
			prd_cata = cata;
		}else {
		switch (cata) {
		case "uni":
			prd_cata = "유니폼";
			break;
		case "ball":
			prd_cata = "축구공";
			break;
		case "sho":
			prd_cata = "축구화";
			break;
		default:
			prd_cata = "기타용품";
			break;
		}
		}
		try {
			pstmt = con.prepareStatement(shop_list_sql);
			pstmt.setString(1, prd_cata);
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				shop_prd = new Shop_prd();
				shop_prd.setPrd_no(rs.getString("prd_no"));
				shop_prd.setPrd_id(rs.getString("prd_id"));
				shop_prd.setPrd_color(rs.getString("prd_color"));
				shop_prd.setPrd_date(rs.getString("prd_date"));
				shop_prd.setPrd_img(rs.getString("prd_img"));
				shop_prd.setPrd_price(rs.getInt("prd_price"));
				shop_prd.setPrd_name(rs.getString("prd_name"));
				shop_prd.setPrd_note(rs.getString("prd_note"));
				shop_prd.setPrd_qant(rs.getInt("prd_qant"));
				articleList.add(shop_prd);
			}

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	// 상품리스트
	public ArrayList<Shop_prd> selectArticleList(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String shop_list_sql = "select * from shop_product order by prd_no desc limit ?,5";
		ArrayList<Shop_prd> articleList = new ArrayList<Shop_prd>();
		Shop_prd shop_prd = null;
		int startrow = (page - 1) * 5;

		try {
			pstmt = con.prepareStatement(shop_list_sql);
			pstmt.setInt(1, startrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				shop_prd = new Shop_prd();
				shop_prd.setPrd_no(rs.getString("prd_no"));
				shop_prd.setPrd_id(rs.getString("prd_id"));
				shop_prd.setPrd_color(rs.getString("prd_color"));
				shop_prd.setPrd_date(rs.getString("prd_date"));
				shop_prd.setPrd_img(rs.getString("prd_img"));
				shop_prd.setPrd_price(rs.getInt("prd_price"));
				shop_prd.setPrd_name(rs.getString("prd_name"));
				shop_prd.setPrd_note(rs.getString("prd_note"));
				shop_prd.setPrd_qant(rs.getInt("prd_qant"));
				articleList.add(shop_prd);
			}

		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	// 상품리스트 개별선택
	public Shop_prd selectArticle(String prd_no) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Shop_prd shop_prd = null;

		try {
			pstmt = con.prepareStatement("select * from shop_product where prd_no = ?");
			pstmt.setString(1, prd_no);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				shop_prd = new Shop_prd();
				shop_prd.setPrd_no(rs.getString("prd_no"));
				shop_prd.setPrd_cata(rs.getString("prd_cata"));
				shop_prd.setPrd_id(rs.getString("prd_id"));
				shop_prd.setPrd_meter(rs.getString("prd_meter"));
				shop_prd.setPrd_note(rs.getString("prd_note"));
				shop_prd.setPrd_size(rs.getString("prd_size"));
				shop_prd.setPrd_color(rs.getString("prd_color"));
				shop_prd.setPrd_date(rs.getString("prd_date"));
				shop_prd.setPrd_create(rs.getString("prd_create"));
				shop_prd.setPrd_qaul(rs.getString("prd_qaul"));
				shop_prd.setPrd_as(rs.getString("prd_as"));
				shop_prd.setPrd_img(rs.getString("prd_img"));
				shop_prd.setPrd_content(rs.getString("prd_content"));
				shop_prd.setPrd_name(rs.getString("prd_name"));
				shop_prd.setPrd_price(rs.getInt("prd_price"));
				shop_prd.setPrd_qant(rs.getInt("prd_qant"));
			}
		} catch (Exception ex) {
		} finally {
			close(rs);
			close(pstmt);
		}

		return shop_prd;

	}

	// 상품등록
	@SuppressWarnings("resource")
	public int insertArticle(Shop_prd article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;
		String g = article.getPrd_cata();
		String formattedNum = "";
		String se_sql = "SELECT max(right(prd_no,4)) FROM shop_product where prd_cata='" + g + "';";
		try {
			pstmt = con.prepareStatement(se_sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt("max(right(prd_no,4))");
				formattedNum = String.format("%04d", num + 1);
			} else {
				num = 0001;
			}
			String p_no = "";
			switch (g) {
			case "축구화":
				p_no = "s" + formattedNum;
				break;
			case "축구공":
				p_no = "b" + formattedNum;
				break;
			case "유니폼":
				p_no = "u" + formattedNum;
				break;
			case "기타용품":
				p_no = "e" + formattedNum;
				break;

			}

			sql = "insert into shop_product (prd_no , prd_name, prd_cata, prd_id, prd_meter, prd_note, prd_price, prd_size, prd_color, prd_date, prd_create, prd_qaul, prd_as, prd_qant, prd_img, prd_content) values(?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_no);
			pstmt.setString(2, article.getPrd_name());
			pstmt.setString(3, g);
			pstmt.setString(4, article.getPrd_id());
			pstmt.setString(5, article.getPrd_meter());
			pstmt.setString(6, article.getPrd_note());
			pstmt.setInt(7, article.getPrd_price());
			pstmt.setString(8, article.getPrd_size());
			pstmt.setString(9, article.getPrd_color());
			// prd_date now()
			pstmt.setString(10, article.getPrd_create());
			pstmt.setString(11, article.getPrd_qaul());
			pstmt.setString(12, article.getPrd_as());
			pstmt.setInt(13, article.getPrd_qant());
			pstmt.setString(14, p_no + ".jpg");
			pstmt.setString(15, article.getPrd_content());

			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	// 상품리플등록
	public int reInsertArticle(Shop_prd article) {
		PreparedStatement pstmt = null;
		int insertCount = 0;

		String sql = "insert into shop_prd_re values(default,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getPrd_re_id());
			pstmt.setString(2, article.getPrd_re_text());
			pstmt.setInt(3, article.getPrd_re_sc());
			pstmt.setString(4, article.getPrd_re_no());
			insertCount = pstmt.executeUpdate();

			if (insertCount > 0) {
				System.out.println(insertCount);
			}

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}

		return insertCount;

	}

	// 상품수정
	@SuppressWarnings("resource")
	public int PrdmodyArticle(Shop_prd article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;
		String g = article.getPrd_cata();
		String formattedNum = "";
		String n = article.getPrd_no();
		String p_no = "";
		String no_sql = "select prd_cata from shop_product where prd_no='" + n + "';";

		try {
			pstmt = con.prepareStatement(no_sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String nc = rs.getString("prd_cata");
				if (nc.equals(g)) {
					p_no = n;
				} else {
					String se_sql = "SELECT max(right(prd_no,4)) FROM shop_product where prd_cata='" + g + "';";
					pstmt = con.prepareStatement(se_sql);
					rs = pstmt.executeQuery();

					if (rs.next()) {
						num = rs.getInt("max(right(prd_no,4))");
						formattedNum = String.format("%04d", num + 1);
					} else {
						num = 0001;
					}
					switch (g) {
					case "축구화":
						p_no = "s" + formattedNum;
						break;
					case "축구공":
						p_no = "b" + formattedNum;
						break;
					case "유니폼":
						p_no = "u" + formattedNum;
						break;
					case "기타용품":
						p_no = "e" + formattedNum;
						break;

					}
				}
			}

			sql = "update shop_product set prd_no =?, prd_name=?, ";
			sql += "prd_cata=?, prd_meter=?, prd_note=?, prd_price=?, ";
			sql += "prd_size=?, prd_color=?, prd_create=?, prd_qaul=?, ";
			sql += "prd_as=?, prd_qant=?, prd_img=?, prd_content=? where prd_no = '" + n + "';";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_no);
			pstmt.setString(2, article.getPrd_name());
			pstmt.setString(3, g);
			// prd_id = default
			pstmt.setString(4, article.getPrd_meter());
			pstmt.setString(5, article.getPrd_note());
			pstmt.setInt(6, article.getPrd_price());
			pstmt.setString(7, article.getPrd_size());
			pstmt.setString(8, article.getPrd_color());
			// prd_date now()
			pstmt.setString(9, article.getPrd_create());
			pstmt.setString(10, article.getPrd_qaul());
			pstmt.setString(11, article.getPrd_as());
			pstmt.setInt(12, article.getPrd_qant());
			pstmt.setString(13, p_no + ".jpg");
			pstmt.setString(14, article.getPrd_content());
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	// 상품삭제
	public int prddeleteArticle(String p_no) {
		PreparedStatement pstmt = null;
		int insertCount = 0;

		String sql = "delete from shop_product where prd_no=?;";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_no);
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}

		return insertCount;

	}

	// 관심상품 체크
	public boolean prd_like_ck(String p_no, String p_id) {
		PreparedStatement pstmt = null;
		boolean lc = false;
		ResultSet rs = null;

		String sql = "select * from shop_prd_like where u_id = ? and p_no = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_id);
			pstmt.setString(2, p_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				lc = true;
				System.out.println(lc);
			}
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}
		return lc;

	}

	// 관심상품 등록
	public String prd_like_in(String p_no, String p_id) {
		PreparedStatement pstmt = null;
		String lc = "";

		String sql = "insert into shop_prd_like values(?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_id);
			pstmt.setString(2, p_no);
			pstmt.executeUpdate();
			lc = "in";

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}

		return lc;

	}

	// 관심상품 삭제
	public String prd_like_del(String p_no, String p_id) {
		PreparedStatement pstmt = null;
		String lc = "";
		String sql = "delete from shop_prd_like where u_id = ? and p_no = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_id);
			pstmt.setString(2, p_no);
			pstmt.executeUpdate();
			lc = "del";

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}

		return lc;

	}

	// 상품리플삭제
	public int deleteArticle(String p_no) {
		PreparedStatement pstmt = null;
		int insertCount = 0;

		String sql = "delete from shop_prd_re where prd_re_num=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_no);
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}

		return insertCount;

	}

	// 장바구니 갯수
	public int selectbackCount(String id) {

		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement("select count(*) from shop_back where sb_buy_id= ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {

		} finally {
			close(rs);
			close(pstmt);
		}

		return listCount;

	}

	// 장바구니리스트
	public ArrayList<Shop_prd> selectbackArticle(String id, int page, int limit) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String prd_qant = "select prd_qant from shop_product where prd_no=?";
		ArrayList<Shop_prd> articleList = new ArrayList<Shop_prd>();

		Shop_prd shop_prd = null;
		int startrow = (page - 1) * 10;

		try {
			pstmt = con.prepareStatement("select * from shop_back where sb_buy_id = ? order by sb_prd desc limit ?,10");
			pstmt.setString(1, id);
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				shop_prd = new Shop_prd();
				shop_prd.setPrd_name(rs.getString("sb_name"));
				shop_prd.setPrd_id(rs.getString("sb_prd_id"));
				shop_prd.setPrd_no(rs.getString("sb_prd"));
				shop_prd.setPrd_qant(Integer.parseInt(rs.getString("sb_qunt")));
				shop_prd.setPrd_img(rs.getString("sb_img"));
				shop_prd.setPrd_re_id(rs.getString("sb_buy_id"));
				shop_prd.setPrd_color(rs.getString("sb_color"));
				shop_prd.setPrd_price(Integer.parseInt(rs.getString("sb_price")));
				pstmt2 = con.prepareStatement(prd_qant);
				pstmt2.setString(1, rs.getString("sb_prd"));
				rs2 = pstmt2.executeQuery();
				if (rs2.next()) {
					shop_prd.setPrd_total(rs2.getInt("prd_qant"));
				}
				articleList.add(shop_prd);

			}

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return articleList;

	}

	// 장바구니등록
	public int prdbackInsertArticle(Shop_prd article, String b_id) {
		PreparedStatement pstmt = null;
		int insertCount = 0;

		String sql = "insert into shop_back values(default,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getPrd_name());
			pstmt.setString(2, article.getPrd_id());
			pstmt.setString(3, article.getPrd_no());
			pstmt.setInt(4, 1);
			pstmt.setString(5, article.getPrd_img());
			pstmt.setString(6, b_id);
			pstmt.setString(7, article.getPrd_color());
			pstmt.setInt(8, article.getPrd_price());
			pstmt.setInt(9, article.getPrd_price());
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}

		return insertCount;

	}

	// 장바구니용 상품 최대개수 제한
	public int prdqantCheck(String q_ck) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int i = 0;
		String sql = "select * from shop_product where prd_no = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, q_ck);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				i = Integer.parseInt(rs.getString("prd_qant"));
			}

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return i;

	}

	// 장바구니 단일삭제
	public int deleteBackArticle(String p_no, String b_id) {
		PreparedStatement pstmt = null;
		int insertCount = 0;

		String sql = "delete from shop_back where sb_prd=? and sb_buy_id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_no);
			pstmt.setString(2, b_id);
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}

		return insertCount;

	}

	// 장바구니 전체삭제
	public int clearBackArticle(String b_id) {
		PreparedStatement pstmt = null;
		int insertCount = 0;

		String sql = "delete from shop_back where sb_buy_id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b_id);
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}
		return insertCount;
	}

	// 장바구니 수량변경 체크
	public int qantCheck(String q_ck, String p_no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertCount = 0;
		String sql = "select * from shop_product where prd_no = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int nc = Integer.parseInt(rs.getString("prd_qant"));
				int ck = Integer.parseInt(q_ck);
				if (ck > nc) {
					insertCount = 0;
				} else {
					insertCount = 1;
				}
			}

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}

	// 장바구니 수량 변경
	public int updateBackArticle(String p_no, String b_id, String prd_qant) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertCount = 0;
		String sql = "update shop_back set sb_qunt=? where sb_prd=? and sb_buy_id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, prd_qant);
			pstmt.setString(2, p_no);
			pstmt.setString(3, b_id);
			insertCount = pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(rs);
			close(pstmt);
		}

		return insertCount;

	}
	
	//주문번호 코드생성
	public String mk_code() {
		String code ="";
		PreparedStatement pstmt = null;
		ResultSet rs11 = null;
		//오늘날자를 000000 형식으로 저장
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
        String formattedDate = today.format(formatter).trim();
		try {
			String sql = "select max(mid(shopb_no,4)) as maxN from shop_buy_list";
			pstmt = con.prepareStatement(sql);
			rs11 = pstmt.executeQuery();
			if (rs11.next()) {
			
				if(rs11.getString("maxN")==null||rs11.getString("maxN")==""||rs11.getString("maxN")=="null") {
					code = "spb"+formattedDate+"001";
				}else {
						String number = rs11.getString("maxN").trim();
						String extractedDigits = number.substring(0, 6);
						String extractedDigits1 = number.substring(7);
						if(extractedDigits.equals(formattedDate)) {
							String st = String.format("%03d", Integer.parseInt(extractedDigits1)+1);
							code = "spb"+formattedDate+st;
						}else {
							code = "spb"+formattedDate+"001";
						}
				}
			}
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(rs11);
			close(pstmt);
		}
		return code;
	}
	

	// 장바구니->구매테이블 입력(상품만)
	@SuppressWarnings("resource")
	public int shopb_prd_in(ArrayList<Shop_prd> aa, String id, String code) {
		PreparedStatement pstmt = null;
		String sql = "";
		int insertCount = 0;

		sql = "insert into shop_buy_list (shopb_no, shopb_date, shopb_p_no, shopb_p_name, shopb_p_qant, shopb_p_price, shopb_u_id, shopb_pay) VALUES (?,now(),?,?,?,?,?, 1)";
		try {
				pstmt = con.prepareStatement(sql);
			
			for(int i = 0; i<aa.size(); i++) {
				pstmt.setString(1, code);
				pstmt.setString(2, aa.get(i).getPrd_no());
				pstmt.setString(3, aa.get(i).getPrd_name());
				pstmt.setInt(4, aa.get(i).getPrd_qant());
				pstmt.setInt(5, aa.get(i).getPrd_price());
				pstmt.setString(6, id);
				insertCount = pstmt.executeUpdate();
			}
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}

		return insertCount;

	}


	// 배송지 입력
	public void shop_in_pay(String ord_code,String name,String addr,String call) {
		PreparedStatement pstmt = null;
		String sql = "";

		sql = "UPDATE shop_buy_list SET shopb_u_name = ?, shopb_u_address = ?, shopb_u_call = ?, shopb_pay = 0 WHERE shopb_no LIKE ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, addr);
			pstmt.setString(3, call);
			pstmt.setString(4, ord_code);
			pstmt.executeUpdate();
				
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}


	}
	
	// 상품 남은 수량 확인
	public HashMap<String, Integer> reQ(ArrayList<Shop_prd> alsp) {
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		HashMap<String, Integer> req = new HashMap<String, Integer>();
		sql = "select prd_qant from shop_product where prd_no like ?";
		try {
			for(int i = 0 ; i< alsp.size(); i++) {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, alsp.get(i).getPrd_no());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					req.put(alsp.get(i).getPrd_no(), rs.getInt("prd_qant"));
				}
			}
				
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}

		return req;

	}


	// 상품수량감소
	public void shop_prdM(ArrayList<Shop_prd> alsp, HashMap<String, Integer> reQ) {
		PreparedStatement pstmt = null;
		String sql = "";

		sql = "update shop_product set prd_qant = ? where prd_no like ?";
		try {
			for(int i = 0 ; i< alsp.size(); i++) {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, (reQ.get(alsp.get(i).getPrd_no())-alsp.get(i).getPrd_qant()));
				pstmt.setString(2, alsp.get(i).getPrd_no());
				pstmt.executeUpdate();
			}	
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}


	}
	
	//구매내역 shopb_pay =1 필드 삭제
	public void del_buy1(String id) {
		PreparedStatement pstmt = null;
		String sql = "";
		sql = "delete from shop_buy_list where shopb_u_id like ? and shopb_pay = 1;";	try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}
	}
	
	//장바구니에서 구매한 품목만 삭제
	public void del_cart(ArrayList<Shop_prd> alsp, String id) {
		PreparedStatement pstmt = null;
		String sql = "";
		sql = "delete from shop_back where sb_prd like ? and sb_buy_id like ?";
		try {
			for(int i = 0 ; i < alsp.size() ; i++) {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, alsp.get(i).getPrd_no());
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			}
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}
	}


	// 캐시감소
	public void shop_caM(String id, String reC) {
		PreparedStatement pstmt = null;
		String sql = "";
		int reCa = Integer.parseInt(reC);

		sql = "update user set user_cash = ? where user_id like ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reCa);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}


	}
	
	
	//구매내역
	public ArrayList<Shop_prd> shop_buylistD(String id) {
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		Shop_prd re = new Shop_prd();
		ArrayList<Shop_prd> req = new ArrayList<Shop_prd>();
		sql = "SELECT * FROM shop_buy_list where shopb_u_id like ? ORDER BY shopb_no DESC, shopb_date DESC;";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeQuery();

			while(rs.next()) {
				re.setPrd_odnum(rs.getString("shopb_no")); //주문번호
				re.setPrd_date(rs.getString("shopb_date"));//주문일
				re.setPrd_name(rs.getString("shopb_p_name")); //상품명
				re.setPrd_no(rs.getString("shopb_p_no")); //상품코드
				re.setPrd_qant(rs.getInt("shopb_p_qant")); //상품수량
				re.setPrd_price(rs.getInt("shopb_p_price")); //상품금액
				re.setPrd_addr(rs.getString("shopb_u_address")); //배송지
				req.add(re);
			}
		} catch (Exception ex) {
			System.out.println(ex);
		} finally {
			close(pstmt);
		}

		return req;
	}

//	// 주문번호
//	public String order_num(String id) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "";
//		String odnum ="";
//
//		sql = "select DISTINCT shopb_no from shop_buy_list where shopb_no like (select max(shopb_no) from shop_buy_list where shopb_u_id like ?);";
//		try {
//				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, id);
//				rs = pstmt.executeQuery();
//				
//				if(rs.next()) {
//					odnum = rs.getString("shopb_no");
//				}
//				
//		} catch (Exception ex) {
//			System.out.println(ex);
//		} finally {
//			close(pstmt);
//		}
//
//		return odnum;
//	}
	
}
