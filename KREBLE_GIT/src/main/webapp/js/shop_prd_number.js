$(document).ready(function(){
	
	//상품 합계 + 배송비 = 총 구매금액
	
	if($(".ck_cked").is(":checked")){
		var ck_pr = $(this).val()
		alert(ck_pr);
	}else{
		alert("해제");
	}
	
	//timer
  	setInterval(updateTimer, 1000);//1초마다 주기적으로 업데이트 해서 타이머 갱신
	function updateTimer() {
	  $.ajax({
	    url: "shop_timer.jsp",
	    success: function(time) {
	      $(".timer").text(time);
	    }
	  });
	}
	
	//전체선택
	$(".all_ck").on("change", function() {
	  if ($(this).is(":checked")) {
	    $(".ck_cked").prop("checked", true);
	  } else {
	    $(".ck_cked").prop("checked", false);
	  }
	});	
  	
  	//상품수량 변경시
	$(".prd_qant").on("change keyup paste", function(){
		var qant_val=$(this).val();
		$(this).attr("value",qant_val);
	});
	
	
	//최대구매 갯수 = 상품 갯수ajax
	$(".prd_button").click(function(){
		var prd_no = $(this).prev().val();
		var sb_qant = parseInt($(this).prev().prev().val());
		var b_id = $(this).next().val();
		var maxQ = parseInt($(this).next().next().val());
		if(sb_qant > maxQ){
			alert("최대수량은 "+maxQ+"입니다");
			return false;
		}else{
		$.ajax({
			type : "POST",
			url : "bak_qant_updat.sp?prd_no="+prd_no+"&sb_qant="+sb_qant+"&b_id="+b_id,
			async: false,
			success :function(re){
				result=re.trim();
			},
			error:function(e){   
                alert(e.responseText); 
            }
		});
		if(result=="success"){
			location.reload();
		}
		else if(result=="fail") {
		}
		}
	})
	
})


//구매버튼 눌렀을 시 보유캐시<상품총합계일때 경고
function moneycheck(){
	var id_cash = parseInt(document.getElementsByName("iid")[0].value);
	var buy_cash = parseInt(document.getElementsByName("total")[0].value);
	if(id_cash < buy_cash){
		alert("보유한 금액이 부족합니다");
		return false;
	}
}