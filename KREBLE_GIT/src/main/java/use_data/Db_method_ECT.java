package use_data;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	public static String login_check(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		String login_id = (String) session.getAttribute("ID");
		
		return login_id;
	}
	
	public static void not_login(String id,HttpServletResponse response) throws Exception {
		if(id==null||id=="null"||id.equals(null)||id.equals("null")) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 이용해주세요')");
			out.println("location.href='login.jsp'");
			out.println("</script>");
			out.flush();
			out.close();
		}
		else {
			return;
		}
	}
	
	public String alarm_text(String alarm) {
		String alarm_text="A";
		if(alarm.equals("commu_comment")){
			alarm_text="내 게시글에 댓글이 달렸습니다";
		}else if (alarm.equals("clup_notice")){
			alarm_text="내 클럽에 공지사항이 작성되었습니다";
		}else if(alarm.equals("clup_join")){
			alarm_text="클럽에 가입되었습니다";
		}
		return alarm_text;
	}
	
	public String alarm_link(String alarm) {
		String alarm_text="A";
		if(alarm.equals("commu_comment")){
			alarm_text="community_borde.jsp?no=";
		}else if (alarm.equals("clup_notice")){
			alarm_text="clup.do?command=roomnotice&clup_no=";
		}else if(alarm.equals("clup_join")){
			alarm_text="clup.do?command=room&clup_no=";
		}
		return alarm_text;
	}
	
	public String rent_time(int no, int bool,int price) {
		String text="마감";
		if(no==1&&bool==0) {
			text="09시(09:00~11:00), 대여료 : "+price+"원";
		}
		if(no==2&&bool==0) {
			text="11시(11:00~13:00), 대여료 : "+price+"원";
		}
		if(no==3&&bool==0) {
			text="14시(14:00~16:00), 대여료 : "+price+"원";
		}
		if(no==4&&bool==0) {
			text="16시(16:00~18:00), 대여료 : "+price+"원";
		}
		if(no==5&&bool==0) {
			text="18시(18:00~20:00), 대여료 : "+price+"원";
		}
		
		return text;
	}
}
