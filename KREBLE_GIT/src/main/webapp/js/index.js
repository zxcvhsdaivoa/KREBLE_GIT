$(function(){
	
	var match_info;
	$.ajax({
		type : "GET",
		url : "https://api.odcloud.kr/api/15044128/v1/uddi:4e117440-ded5-42bd-9c58-a1e7c7a979d6",
		data:{ page:8 , perPage:31, returnType:"JSON"},
		async: false,
		headers: {Authorization: "Infuser ZGbGzyKcYk1MaYGEUebqgNRVjNcdIkTzlxjud5/GgabCs+Qu0vt6ZNthZcdUeETuD244gPHIXIuoPQu8L0nF6g=="}
	})
	.done (function (msg) {
		match_info=msg;
	});
	
	//console.log(match_info);
	for(p=0; p<match_info.currentCount;p++){
		var match= match_info.data[p]
		var match_title = match[Object.keys(match)[0]].slice(0,-7)
		var match_time = match[Object.keys(match)[1]]
		var match_team1 = match[Object.keys(match)[0]].slice(-2)
		var match_team2 = match[Object.keys(match)[0]].slice(-6,-4)
		var team1_eng
		var team2_eng
		if(match_team1=="서울"){
			team1_eng="seoul"
		}else if(match_team1=="울산"){
			team1_eng="ulsan"
		}else if(match_team1=="인천"){
			team1_eng="incheon"
		}else if(match_team1=="포항"){
			team1_eng="pohang"
		}else if(match_team1=="강원"){
			team1_eng="gangwon"
		}else if(match_team1=="상주"){
			team1_eng="sangju"
		}else if(match_team1=="부산"){
			team1_eng="busan"
		}else if(match_team1=="수원"){
			team1_eng="suwon"
		}else if(match_team1=="대구"){
			team1_eng="daegu"
		}else if(match_team1=="광주"){
			team1_eng="gwangju"
		}else if(match_team1=="전북"){
			team1_eng="jeonbuk"
		}else if(match_team1=="성남"){
			team1_eng="seongnam"
		}
		
		
		if(match_team2=="서울"){
			team2_eng="seoul"
		}else if(match_team2=="울산"){
			team2_eng="ulsan"
		}else if(match_team2=="인천"){
			team2_eng="incheon"
		}else if(match_team2=="포항"){
			team2_eng="pohang"
		}else if(match_team2=="강원"){
			team2_eng="gangwon"
		}else if(match_team2=="상주"){
			team2_eng="sangju"
		}else if(match_team2=="부산"){
			team2_eng="busan"
		}else if(match_team2=="수원"){
			team2_eng="suwon"
		}else if(match_team2=="대구"){
			team2_eng="daegu"
		}else if(match_team1=="광주"){
			team1_eng="gwangju"
		}else if(match_team1=="전북"){
			team1_eng="jeonbuk"
		}else if(match_team1=="성남"){
			team1_eng="seongnam"
		}
		
		if(p%2==0){
			$(".slick_box.even_slick").append("<div class='match'><span class='left_box'><img src='image/team_logo/"+team2_eng+".jpg'>"+match_team2+"</span><span class='right_box'><img src='image/team_logo/"+team1_eng+".jpg'>"+match_team1+"</span><div><h4>"+match_title+"</h4><img src='image/VStext.png'><span class='match_place'>서울월드컵경기장</span><span class='match_time'>"+match_time+"</span></div>")
		}else if(p%2==1){
			$(".slick_box.odd_slick").append("<div class='match'><span class='left_box'><img src='image/team_logo/"+team2_eng+".jpg'>"+match_team2+"</span><span class='right_box'><img src='image/team_logo/"+team1_eng+".jpg'>"+match_team1+"</span><div><h4>"+match_title+"</h4><img src='image/VStext.png'><span class='match_place'>서울월드컵경기장</span><span class='match_time'>"+match_time+"</span></div></div>")
		}
	}
	
	
	
	
	
	$('.slick_box').slick({
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  arrows: false,
	  autoplay:true,
	  autoplaySpeed:5000,
	  speed:1000
	  //asNavFor: '.small_slick'
	});
	$(".slickbox").slick({
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  autoplay:true,
	  autoplaySpeed:7000,
	  speed:1000,
	  dots:false,
	  draggable:true,
	  array:false
	})
	//shop 랜덤한 배너 넣기
	var rand = Math.floor(Math.random() * 2)
	if(rand==1){
		$("#content4 .content_inner .wrap4").css({"background-image":"url(image/shopimg/shop_bot_benner0.jpg)"});
	}
	else {
		$("#content4 .content_inner .wrap4").css({"background-image":"url(image/shopimg/shop_bot_benner1.jpg)"});
	}


	$('.matchup > span').hide();
	$('.matchup > span:first-child').show();
	
	$('.match_bt1').click(function(){
		$('.matchup > span').hide();
		$('.match_bt2, .match_bt3').removeClass('black');
		$('.matchup > span:first-child').show();
		$('.match_bt1').addClass('black');
	});

	$('.match_bt2').click(function(){
		$('.matchup > span').hide();
		$('.match_bt1, .match_bt3').removeClass('black');
		$('.matchup > span:nth-child(2)').show();
		$('.match_bt2').addClass('black');
	});

	$('.match_bt3').click(function(){
		$('.matchup > span').hide();
		$('.match_bt1, .match_bt2').removeClass('black');
		$('.matchup > span:last-child').show();
		$('.match_bt3').addClass('black');
	});

	
})




////달력
//
//// 웹 페이지가 로드되면 buildCalendar 실행
//window.onload = function () { buildCalendar(); }
//
//let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
//let today = new Date();     // 페이지를 로드한 날짜를 저장
//today.setHours(0,0,0,0);    // 비교 편의를 위해 today의 시간을 초기화
//
//// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
//function buildCalendar() {
//
//    let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
//    let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날
//
//    let tbody_Calendar = document.querySelector(".Calendar > tbody");
//    document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
//    document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신
//
//    while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
//        tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
//    }
//
//    let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           
//
//    for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
//        let nowColumn = nowRow.insertCell();        // 열 추가
//    }
//
//    for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  
//
//        let nowColumn = nowRow.insertCell();        // 새 열을 추가하고
//        nowColumn.innerText = leftPad(nowDay.getDate());      // 추가한 열에 날짜 입력
//
//    
//        if (nowDay.getDay() == 0) {                 // 일요일인 경우 글자색 빨강으로
//            nowColumn.style.color = "#DC143C";
//        }
//        if (nowDay.getDay() == 6) {                 // 토요일인 경우 글자색 파랑으로 하고
//            nowColumn.style.color = "#0000CD";
//            nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
//        }
//
//
//        if (nowDay < today) {                       // 지난날인 경우
//            nowColumn.className = "pastDay";
//        }
//        else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
//            nowColumn.className = "today";
//            nowColumn.onclick = function () { choiceDate(this); }
//        }
//        else {                                      // 미래인 경우
//            nowColumn.className = "futureDay";
//            nowColumn.onclick = function () { choiceDate(this); }
//        }
//    }
//}
//
//// 날짜 선택
//function choiceDate(nowColumn) {
//    if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
//        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
//    }
//    nowColumn.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
//}
//
//// 이전달 버튼 클릭
//function prevCalendar() {
//    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
//    buildCalendar();    // 달력 다시 생성
//}
//// 다음달 버튼 클릭
//function nextCalendar() {
//    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
//    buildCalendar();    // 달력 다시 생성
//}
//
//// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
//function leftPad(value) {
//    if (value < 10) {
//        value = "0" + value;
//        return value;
//    }
//    return value;
//}