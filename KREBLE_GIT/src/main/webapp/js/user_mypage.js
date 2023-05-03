$(function(){
	$('.p_update').click(function(){
		alert("ㅋ? 낙장불입이야");
	})
	
	$('.p_delete').click(function(){
		alert("들어올땐 마음대로였지만 나갈땐 아니란다 Boy~");
	})
	
	$('.cash_re').click(function(){
		if(confirm("포인트를 충전하시겠습니까?")){
			 $.ajax({
	            type : "POST",
	            url : "cashupd.kb",
	            success :function(re){
	                result=re.trim();
	                if(result == "true"){
	                    alert("충전이 완료되었습니다.");
	                    location.reload(); // 새로고침
	                }else{
	                    alert("충전불가. 관리자에게 문의하십시요.")
	                }
	            },
	            error:function(e){   
	                alert(e.responseText); 
	            }
        }); 
		}else{
			alert("취소하셨습니다.")
		}
	})
	//스쿼드로 이동
	$('.no1_td2').click(function(){
		location.href = "squadList.sq";
	})
	//경기장임대로 이동
	$('.no1_td3').click(function(){
		location.href = "fieldInfo.choi";
	})
	//관심상품으로 이동
	$('.no1_td4').click(function(){
		location.href = "shop_list_action.sp";
	})
	//장바구니로 이동
	$('.no1_td5').click(function(){
		location.href = "shop_back_page.sp";
	})
})