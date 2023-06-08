package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.Field_insert_rentinfo_Service;
import svc.Field_rent_findinfo_Service;
import svc.Field_rent_insr_Service;
import svc.Field_update_rentinfo_Service;
import vo.ActionForward;
import vo.Rent_situation;



public class Field_rent_insr_action implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean success2=false;
		ActionForward forward=null;
		Rent_situation rent_insr=null;
		HttpSession session = request.getSession();//세션에 등록된 아이디를 사용하기 위해 세션 설정 
		rent_insr = new Rent_situation();
		rent_insr.setRent_location(request.getParameter("location"));
		rent_insr.setRent_date(request.getParameter("rent_date"));
		rent_insr.setField_name(request.getParameter("field_name"));
		rent_insr.setRent_price(Integer.parseInt(request.getParameter("rent_price")));
		rent_insr.setUser_id((String)session.getAttribute("ID"));
		Field_rent_insr_Service rentinsrService = new Field_rent_insr_Service();
		boolean isinsrSuccess = rentinsrService.field_rentinsr(rent_insr);//메소드 호출
		// BoardWriteProService 클래스를 이용하여 게시물을 데이터베이스에 등록. 
		// issaveSuccess 변수는 게시물 등록에 성공하면 true, 실패하면 false 값을 가짐.
		// System.out.println(isinsrSuccess);// 인서트 내용 확인 출력
		
		
		int i=0;
		int time = Integer.parseInt(rent_insr.getRent_date().substring(11,13));
		// 문자 11부터 13 이전까지의 부분 문자열을 추출
		if(time==9) { // 예약 9시 파트에 해당 i=1로 지정
			i=1;
		}else if(time==11) { // 예약 11시, i=2
			i=2;
		}else if(time==14) { // 예약 14시, i=3
			i=3;
		}else if(time==16) { // 예약 16시, i=4
			i=4;
		}else if(time==18) { // 예약 18시, i=5
			i=5;
		}
		
		Field_rent_findinfo_Service frfs= new Field_rent_findinfo_Service();
		int is=frfs.fint_info(rent_insr); // rent_time 정보 셀렉트
		
		if(is==1) { // 구장 예약된 데이터 정보가 있으면 즉 1로 값이 존재 할 때 업데이트 실행
			Field_update_rentinfo_Service furs = new Field_update_rentinfo_Service();
			success2=furs.update_rentinfo(i, rent_insr);
		}else { // 위에 해당하지 않으면 인서트 실행
			Field_insert_rentinfo_Service firs = new Field_insert_rentinfo_Service();
			success2=firs.insert_rentinfo(i, rent_insr);
		}
		
		if(!isinsrSuccess||!success2){ //등록에 실패할 경우
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인, 예약 사항을 모두 확인해주세요!')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{ //등록에 성공할 경우
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("rent_finish.choi");
		}

		return forward;
		
	}  	
}

