package use_data;

import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Db_method_ECT extends Db_method_conn  {
	
	public int select_clup_member_count(int clup_no) throws Exception {
		conn();
		int count=0;
		try{
			ResultSet rs = stm.executeQuery("select count(*) from clup_member where clup_no="+clup_no+";");
			if(rs.next()){
				count=(rs.getInt("count(*)"));
			}
		}catch(Exception ex){
			System.out.println(ex);
		}finally{
			diconn();
		}
		return count;
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
	
	public String howjoin(String eng) {
		String trun="A";
		if(eng.equals("free")){
			trun="자동승인";
		}else if (eng.equals("password")){
			trun="비밀번호 입력";
		}else if(eng.equals("request")){
			trun="클럽장 승인시";
		}
		return trun;
	}
	
	public String date_format(String date,String formattype) throws ParseException {
		SimpleDateFormat toString = null;
		Date formatTime =null;
		SimpleDateFormat toDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(formattype.equals("kortotime")) {
			System.out.println(date);
			toDate = new SimpleDateFormat("yyyy년 MM월d일hh시");
			formatTime = toDate.parse(date);
			toString = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		}else {
			formatTime = toDate.parse(date);
			if(formattype.equals("yyyy-mm-dd")) {
				toString = new SimpleDateFormat("yyyy-MM-dd");
			}else if(formattype.equals("mm-dd")) {
				toString = new SimpleDateFormat("MM-dd");
			}else if(formattype.equals("hh:mm")) {
				toString = new SimpleDateFormat("HH:mm");
			}else if(formattype.equals("yyyy-mm-dd hh:mm")) {
				toString = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			}else if(formattype.equals("2day")) {
				Date now = new Date();
				long diff = now.getTime() - formatTime.getTime();
				int daysDiff = (int) (diff / (24 * 60 * 60 * 1000));
				if(daysDiff<2){
					toString = new SimpleDateFormat("HH:mm");
				}
				else {
					toString = new SimpleDateFormat("MM-dd");
				}
			}
		}
		return toString.format(formatTime);
	}
}
