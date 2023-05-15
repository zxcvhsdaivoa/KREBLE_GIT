$(function(){
	 $(".box_inner2").hide();	
	 $(".box_text > span").hide();
	 
	 $(".selc_list select.loca").change(function(){
		var loca= $(this).val();
		location.href="fieldrent.choi?location="+loca;
		 
	 }) 
	 //달력 생성
	 $("#month").change(function() {
	  var month = $("#month option:selected").attr("data-month")
	  var calendar = document.getElementById("calendar");
	  var days = ["일", "월", "화", "수", "목", "금", "토"];
	
	  var date = new Date(2023, month-1, 1); // (2023, month-1, 1) == (년도,월,일)
	  // 선택한 월의 첫 날짜, 0은 1월을 나타내고, 11은 12월을 나타내므로 month에 -1을 한 것. 
	  var lastDate = new Date(2023, month, 0).getDate(); // 선택한 월의 마지막 날짜
	
	  var html = "<table class='tb_calendar'>";
	  html += "<tr class='day'>";
	  for (var i = 0; i < days.length; i++) {
	    html += "<td>" + days[i] + "</td>";
	  }
	  html += "</tr>";
	
	  // 첫 주의 공백 칸 만들기
	  html += "<tr class='day2'>";
	  for (var i = 0; i < date.getDay(); i++) {
			html += "<td></td>";
	  }
	 
	 // 날짜 채우기
	  for (var i = 1; i <= lastDate; i++) {
		  if (date.getDay() === 0) { // 일요일이면 새로운 주 시작
	    	html += "</tr><tr class='day2'>";
	  }
	  var currentDate = new Date(); // 현재 날짜 가져오기
	  var currentMonth = currentDate.getMonth()+1;
	  var currentDay = currentDate.getDate();
	
	  if ((parseInt(month) < currentMonth ) || (currentMonth === parseInt(month) && i < currentDay)){
	      // 선택한 날짜가 현재 날짜보다 작거나, 일치하면 마감처리 조건문
	      html += "<td class='date_hover' onclick='box_show()'><a href='#info_box'><span>" + i + "일</span>"+"<p class='impossible'>마감</p></a></td>";
	  } 
	  else {
		  html += "<td class='date_hover' onclick='box_show()'><a href='#info_box'><span>" + i + "일</span>"+"<p class='possible'>가능</p></a></td>";
	  }
	  date.setDate(date.getDate() + 1);
	}
			
	 // 마지막 주의 공백 칸 만들기
	 for(var i = date.getDay(); i < days.length; i++) {
	    html += "<td></td>";
	 }
	 html += "</tr>";
	 html += "</table>";
	
	 calendar.innerHTML = html;
	  
	  // 예외처리: month 인자가 없는 경우, 스타일 none해서 출력x , 있는경우 스타일 block으로 적용해서 출력
	 if (!month) {
	   calendar.style.display = "none"; 
	 }else {
	   calendar.style.display = "block";
	 }
	  
	  // 선택한 날짜 호버
	 $(".day2 td").click(function() {
		$(".day2 td").removeClass("on");
		$(this).addClass("on");
		$("#rentDate").attr("value",$(this).text().trim())
 		});
 		
	});	
		
	
	//예약 날짜 등록 구 버전(submit 변경 전 a태그로 이동하는 방법)
//	$(".payment_btn").click(function(){
//		var time = $("input[type=radio][name=rent_time]:checked").val();
//		var daychoice = $("#month option:selected").text()+$(".day2 td.on").text().trim()+time+"00분";
//		location.href="rent_agree.choi?rent_date="+daychoice
//	});

});
	function box_show(){ // 눌렀을때 정보 보이기
		$(".box_inner2").show();
		
	}
	
	function timechoice(){
		$(".box_text > span").show();
	}
	
	
	
		
	
