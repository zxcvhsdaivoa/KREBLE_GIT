$(function(){
	$('#sb_art_no4').hide();
	$('.pay_bill').hide();
	$('input[name=in_addr]').hide();
	
	//계속 쇼핑하기
	$('.go_shop').click(function(event) {
	    event.preventDefault();
	    
	    if (confirm("상품 페이지로 이동합니다")) {
	        window.location.href = "shop_list_action.sp";
	    }
	});
	
	//캐시부족 여부
	var uh_cash = parseInt(document.getElementById("hav_cash").innerText);
	var pay_cash = parseInt(document.getElementById("payment").innerText);
	if(pay_cash <= uh_cash){
		$('#cash_charge').hide();
	}else{
		$('#cash_charge').show();
	}
	
	
	//받는사람 배송지 정보
	$('input[type=radio]').on("change",function(){
	  if ($('.input_order').is(":checked")) {
	    $('input[name=buy_name]').val($("#ord_name").val()).prop('readonly', true);
	    $('input[name=buy_addr]').val($("#ord_addr").val()).prop('readonly', true);
	    $('input[name=buy_call]').val($("#ord_call").val()).prop('readonly', true);
	    $('input[name=in_addr]').hide();
	  }
	  else if($('.input_new').is(":checked")){
	    $('input[name=buy_name]').val("").prop('readonly', false);
	    $('input[name=buy_addr]').val("").prop('readonly', false);
	    $('input[name=buy_call]').val("").prop('readonly', false);
	    $('input[name=in_addr]').show();
	  }
	});
	
	
	//  배송지 입력 /장바구니 목록
	$('.inp_addr').click(function(){
		$('#sb_art_no3').hide();
		$('#sb_art_no4').show();
		$('#prd_ls').removeClass('no2_on');
		$('#prd_ls').addClass('no2_off');
		$('#in_adrs').removeClass('no2_off');
		$('#in_adrs').addClass('no2_on');
		$('.pay_bill').show();
		$('.inp_addr').hide()
	})
	
	$('#in_adrs').click(function(){
		$('#sb_art_no3').hide();
		$('#sb_art_no4').show();
		$('#prd_ls').removeClass('no2_on');
		$('#prd_ls').addClass('no2_off');
		$('#in_adrs').removeClass('no2_off');
		$('#in_adrs').addClass('no2_on');
		$('.pay_bill').show();
		$('.inp_addr').hide()
	})
	
	$('#prd_ls').click(function(){
		$('#sb_art_no3').show();
		$('#sb_art_no4').hide();
		$('#prd_ls').removeClass('no2_off');
		$('#prd_ls').addClass('no2_on');
		$('#in_adrs').removeClass('no2_on');
		$('#in_adrs').addClass('no2_off');
		$('.pay_bill').hide();
		$('.inp_addr').show()
	})
	
	
	// 캐시충전
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
});

function inputcheck(){
	var b_name = document.getElementsByName("buy_name")[0].value;
	var b_addr = document.getElementsByName("buy_addr")[0].value;
	var b_call = document.getElementsByName("buy_call")[0].value;
	var payM = document.getElementById("balance").innerText;
	
	if(b_name!=""&&b_addr!=""&&b_call!=""&&payM>=0){
		alert("정상적으로 주문이 완료되었습니다.")
		
	return true;	
	}else{
		if(payM<0){
		alert("보유금액이 적습니다. 캐시를 충전해주세요")
		}else{
		alert("배송지를 정확히 입력해주세요")
		}
	return false;	
	}
	
}

function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                
                } else {
                }
                
                var p_ad = "("+data.zonecode +") " + addr;
                document.getElementById("buy_addr").value = p_ad;
                document.getElementById("buy_call").focus();
            }
        }).open();
    }