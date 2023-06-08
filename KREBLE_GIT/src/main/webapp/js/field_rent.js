$(function(){	 
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
		
		var title_option_text =  document.createTextNode("경기장 목록");
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
		deadline = deadlines.split("/"); // 문자열을 해당 /을 기준으로 분할
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
				  			html += "<td class='date_hover'><a href='#info_box'><span>" + i + "일</span>"+"<p class='possible'>가능</p></a></td>";
				  			break;
				  		}
					}
				}
				else {
		  			html += "<td class='date_hover'><a href='#info_box'><span>" + i + "일</span>"+"<p class='possible'>가능</p></a></td>";
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
	  
	  	// 가능 날짜 클릭 이벤트
		$(".day2 td:has(p.possible)").click(function() {
			$(".day2 td").removeClass("on");
			$(this).addClass("on");
			var day= $(this).find('span').text().replace("일","");
			$("#rentDate").attr("value",$(this).find("span").text().trim())
			var renttime=[];
			$.ajax({
				type : "POST",
				url : "field_rent_time.jsp?loca="+loca+"&month="+month+"&day="+day,
				async: false,
				success :function(re){
					renttimedata = re.trim();
				},
				error:function(e){   
	                alert(e.responseText); 
	            }
			});
			// 문자열을 해당 /을 기준으로 분할
			renttime= renttimedata.split("/");
			
			// 구장 별 파트 예약 시간,가격 출력
			for(z=0; z<renttime.length-1; z++){
				$(".box_inner2 > input[name='rent_time']").prop('checked',false);
				$(".box_inner2 > span:eq("+z+")").text(renttime[z]);
				
				if(renttime[z]=="마감"){ // 마감일때 disabled로 선택 불가능
					$(".box_inner2 > input[name='rent_time']:eq("+z+")").attr('disabled',true)
					// :eq= 선택한 요소들 중에서 특정 인덱스의 요소를 선택 ex__ eq(1)=요소 중에서 1번째 요소
				}else {
					$(".box_inner2 > input[name='rent_time']:eq("+z+")").attr('disabled',false);
					$(".box_inner2 > input[name='rent_time']:eq("+z+")").attr('data-price',renttime[z].substr(24).trim()); // 해당 문자열에서 가격을 추출
					$(".box_inner2 > input[name='rent_time']:eq("+z+")").val(renttime[z].substr(0,3)) // 해당 문제열에서 시간을 추출 ex) 09시
				}
			}
			$(".hide_box2").addClass("show");
 		});
 		
 		// 예악 마감 클릭했을 때 버튼들 hide
 		$(".day2 td:has(p.impossible)").click(function() {
			$(".day2 td").removeClass("on");
			$(".hide_box2").removeClass("show");
		});
	});	
	
	// radio(예약 파트) 클릭했을 때 해당 가격으로 바꾸기 
	$("input[name='rent_time']").click(function(){
		var price = $(this).attr('data-price');
		$("input[name=rent_price]").val(price.replace("원",""))
		$(".box_text span").text(price);
		$(".hide_box3").addClass("show");
	});
  
		
});		
	
	//예약 날짜 등록 구 버전(submit 변경 전 a태그로 이동하는 방법)
//	$(".payment_btn").click(function(){
//		var time = $("input[type=radio][name=rent_time]:checked").val();
//		var daychoice = $("#month option:selected").text()+$(".day2 td.on").text().trim()+time+"00분";
//		location.href="rent_agree.choi?rent_date="+daychoice
//	});








