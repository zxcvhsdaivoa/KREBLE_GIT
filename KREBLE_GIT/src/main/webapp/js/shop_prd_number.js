$(document).ready(function(){
	
	var imgElement = document.getElementById("sold_del");
	if(imgElement != null){
	imgElement.addEventListener("mouseenter", function() {
	  imgElement.src = "image/gerbage1.png";
	});
	
	imgElement.addEventListener("mouseout", function() {
	  imgElement.src = "image/gerbage2.png";
	});
	}
	
	
	//품절상품 삭제
	$('#sold_del').click(function(){
		var prd_no = $(this).prev().val();
		var id = $(this).next().val();
		 $.ajax({
				url: 'shop_bak_one_delete.sp',
				type: 'POST',
				async: false,
				data: { code: prd_no, ID: id },
				success: function(response) {
				   re = response.trim();
				},
				error: function(error) {
					alert(error);
				}
				});
				if(re == "true"){
					alert("선택상품이 삭제되었습니다");
					location.reload();
				}else{
					alert("오류. 관리자에게 문의하세요");
				}
	})
		
	
	
	//선택상품 단일상제
		$('#select_del').click(function() {
		  var list = document.getElementsByName("prd_ck");
		  var id = document.getElementById("ID").value;
		  var cnt=0;
		  var del_ls = [];
		  var del_list ="";
		  var re="";
		    for (var i = 0; i < list.length; i++) {
		      if ($(list[i]).is(":checked")) {
				  var value = list[i].value;
				  var sp = value.split("/");
				  var code = sp[0];
				  del_ls.push(code);
				  cnt++;
		      }
		    }
		    for(var i = 0; i<del_ls.length; i++){
				if(i==0){
				del_list = del_ls[0]
				}else{
				del_list = del_list+"/"+del_ls[i];
				}
			}
		    if(cnt<1){
				alert("선택된 상품이 없습니다.");
			}else{
			    $.ajax({
				url: 'shop_bak_one_delete.sp',
				type: 'POST',
				async: false,
				data: { code: del_list, ID: id },
				success: function(response) {
				   re = response.trim();
				},
				error: function(error) {
					alert(error);
				}
				});
				if(re == "true"){
					alert("선택상품이 삭제되었습니다");
					location.reload();
				}else{
					alert("오류. 관리자에게 문의하세요");
				}
		    }
		});
	
	
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
function cb_click(){
    var ckbox = document.getElementsByName("prd_ck");
    var length = ckbox.length;
    var ck = 0;
    
    for (var i = 0; i < length; i++) {
        if (ckbox[i].checked) {
			ck++
        }
    }
    if(ck == 0){
		alert("선택된 상품이 없습니다.");
		return false;
	}
	return true;    
}
