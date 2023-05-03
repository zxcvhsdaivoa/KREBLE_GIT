$(function(){
	$('.p_update').click(function(){
		alert("ㅋ? 낙장불입이야");
	})
	
	$('.p_delete').click(function(){
		alert("들어올땐 마음대로였지만 나갈땐 아니란다 Boy~");
	})
	
	$('.cash_re').click(function(){
		if(confirm("포인트를 충전하시겠습니까?")){
			var u_id = $(this).prev().val();
			$.ajax({
			type : "POST",
			url : "cashupd.kb?u_id="+u_id,
			async: false,
			success :function(re){
				result=re.trim();
			},
			error:function(e){   
                alert(e.responseText); 
            }
			});	
		}else{
			alert("취소하셨습니다.")
		}
	})
})