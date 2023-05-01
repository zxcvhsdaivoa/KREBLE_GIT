$(function(){
	$('#pl_art_no1 > div > input[type=button]').click(function(){
			 location.href = "shop_prd_insert.sp";
	});
	
	$('.like_bt, .like_on').click(function(){
		var pno = $(this).prev().val();
		var pid = $(this).next().val();
//		jquery안에 적어야됨
		
		$.ajax({
			url: "prd_like_ck.sp?p_no="+pno+"&p_id="+pid,
			type : "POST",
			async: false,
			success :function(re){
				result=re.trim();
			},
			error:function(e){   
                alert(e.responseText); 
            }
			});
			
		if(result === "del") {
				$(this).removeClass('like_on');
				$(this).addClass('like_bt');
				alert("관심상품에서 해제되었습니다.")
			} else if(result === "in") {
				$(this).removeClass('like_bt');
				$(this).addClass('like_on');
				alert("관심상품으로 등록되었습니다.")
			}else{
			alert("로그인이 필요합니다.");
			location.href="login.jsp";
			}
	});
})