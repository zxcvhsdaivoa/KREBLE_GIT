$(function(){
	$(".box_inner2").hide();	
	$(".box_text > span").hide();
	 
	$(".selc_list select.loca").change(function(){
		var loca= $(this).val();
		var loca_list=[];
		$.ajax({
			type : "POST",
			url : "field_rent_location.jsp?loca="+loca,
			async: false,
			success :function(re){
				loca_all = re.trim();
			},
			error:function(e){   
                alert(e.responseText); 
            }
		});
		loca_list=loca_all.split("/");
		var select_box = document.querySelector(".starlist");
		if(document.querySelector(".starlist").hasChildNodes()==true){
			$(".starlist option").remove();
		}
		var title_option = document.createElement('option');
		var title_option_text =  document.createTextNode("경기장목록");
		title_option.appendChild(title_option_text);
		title_option.selected = 'selected'
		title_option.disabled = 'disabled'
		select_box.appendChild(title_option);
		for(i=0; i<loca_list.length-1;i++){
			var select_option = document.createElement('option');
			var option_text =  document.createTextNode(loca_list[i]);
			select_option.appendChild(option_text);
			select_option.value=loca_list[i];
			select_box.appendChild(select_option);
		}
	});
	$(".starlist").change(function(){
		$(".hide_box").addClass("show");
	})
	//달력 생성
	$("#month").change(function() {
		var loca = $('#field_selc').val();
	  	var month = $("#month option:selected").attr("data-month")
	  	var calendar = document.getElementById("calendar");
	  	var days = ["일", "월", "화", "수", "목", "금", "토"];
		var deadline =[];
		$.ajax({
			type : "POST",
			url : "field_rent_deadline.jsp?month="+month+"&loca="+loca,
			async: false,
			success :function(re){
				deadlines = re.trim();
			},
			error:function(e){   
                alert(e.responseText); 
            }
		});
		deadline = deadlines.split("/");
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
	      		html += "<td class='date_hover'><span>" + i + "일</span>"+"<p class='impossible'>마감</p></td>";
	  		}
	  		else {
				if(deadline[0]!=0){
					for(x=0; x<deadline.length-1;x++){
						if(deadline[x]==i){
							html += "<td class='date_hover'><span>" + i + "일</span>"+"<p class='impossible'>마감</p></td>";
							break;
						}
						
						else if(deadline[x]!=i&&deadline[x]==0) {
				  			html += "<td class='date_hover' onclick='box_show()'><a href='#info_box'><span>" + i + "일</span>"+"<p class='possible'>가능</p></a></td>";
				  			break;
				  		}
					}
				}
				else {
		  			html += "<td class='date_hover' onclick='box_show()'><a href='#info_box'><span>" + i + "일</span>"+"<p class='possible'>가능</p></a></td>";
		  		}
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
	 	}
	 	else {
	   		calendar.style.display = "block";
	 	}
	  
	  	// 선택한 날짜 호버
	 $(".day2 td").click(function() {
		$(".day2 td").removeClass("on");
		$(this).addClass("on");
		$("#rentDate").attr("value",$(this).find("span").text().trim())
 		});
 		
	});	
	
	// 예약 중복체크 (미완성)  
	$(".payment_btn").click(function(event){
		var time = $("input[type=radio][name=rent_time]:checked").val();
		const selcfield = document.getElementById("field_selc");
		const field_name = selcfield.value;
		console.log(time);
		console.log(field_name); // 이거 아직 출력안됨
		
		$.ajax({
			type : "POST",
			url : "rent_finish.choi",
			success :function(re){
				var rent_field = $(re).find("#field_name").text();
        		var rent_part = $(re).find("#rent_part").text();
        		alert(rent_field);
        		alert(rent_part);
		    },
		    error:function(e){   
		        alert(e);
		    }
		});
		if(rent_part != time || field_name != rent_field){
			event.preventDefault();
			alert("체크체크");
		}
	});
		
});		
	
	//예약 날짜 등록 구 버전(submit 변경 전 a태그로 이동하는 방법)
//	$(".payment_btn").click(function(){
//		var time = $("input[type=radio][name=rent_time]:checked").val();
//		var daychoice = $("#month option:selected").text()+$(".day2 td.on").text().trim()+time+"00분";
//		location.href="rent_agree.choi?rent_date="+daychoice
//	});


function box_show(){ // 눌렀을때 정보 보이기
	$(".box_inner2").show();
}
	
function timechoice(){
	$(".box_text > span").show();
}
	
		
		
	
	
	
		
	
