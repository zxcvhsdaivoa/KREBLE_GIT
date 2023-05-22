$(document).ready(function(){
	
	//상품 합계 + 배송비 = 총 구매금액
	$("input[type=checkbox]").on("change", function() {
		var totalVar = parseInt(document.getElementById("prd_tot").innerText);
		if($(this).hasClass("ck_cked")){
		  if ($(this).is(":checked")) {
			var getVar = $(this).val();
			var spVar = getVar.split("/");
			var toVar = parseInt(spVar[4]);
			totalVar = totalVar+toVar;
			document.getElementById("prd_tot").innerHTML = totalVar;
		  } else {
			var getVar = $(this).val();
			var spVar = getVar.split("/");
			var toVar = parseInt(spVar[4]);
			totalVar = totalVar-toVar;
			document.getElementById("prd_tot").innerHTML = totalVar;
		  }
		  
		}
		else if($(this).hasClass("all_ck")){
			var prd = document.getElementsByClassName("ck_cked");
			  if ($(this).is(":checked")) {
			    $(".ck_cked").prop("checked", true);
			    for(var i=0; i<prd.length; i++){
					var spVar= prd.item(i).value
					var getVar=spVar.split("/")
					var toVar= parseInt(getVar[4])
					totalVar = totalVar+toVar;
				}
			  } else {
			    $(".ck_cked").prop("checked", false);
			    for(i=0; i<prd.length; i++){
					var spVar= prd.item(i).value
					var getVar=spVar.split("/")
					var toVar= parseInt(getVar[4])
					totalVar = totalVar-toVar;
			  }
		  }
		}
		
		document.getElementById("prd_tot").innerHTML = totalVar;
		
		if(totalVar<=100000){
			document.getElementById("prd_delv").innerHTML = 3000;
			document.getElementById("to_cart").innerHTML = totalVar + 3000;
		}else{
			document.getElementById("prd_delv").innerHTML = "무료";
			document.getElementById("to_cart").innerHTML = totalVar;  
		}
	  
	});	
	
	
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


//구매버튼 눌렀을 시 보유캐시<상품총합계일때 경고(만들고보니 장바구니에선 필요없음.)
function moneycheck(){
	var id_cash = parseInt(document.getElementById("iid").value);
	var buy_cash = parseInt(document.getElementById("to_cart").innerText);
	if(id_cash < buy_cash){
		alert("보유한 금액이 부족합니다");
		return false;
	}
}