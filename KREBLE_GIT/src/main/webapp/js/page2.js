var idck,pwck,nulltf,info;

$(document).ready(function(){
	$("#birth").attr("max", new Date().toISOString().split("T")[0]);
		
	$("input:text[onlynum]").on("keyup", function() {
      $(this).val($(this).val().replace(/[^0-9]/g,""));
  	});

	$("#uid").on("change keyup paste", function(){
		idck=false;
	});
	$("#repw").on("change keyup paste", function(){
		var pass=joinmember.getElementsByClassName('pass');
		if(pass.item(0).value==pass.item(1).value){
			$("#pwck_text").text("비밀번호가 일치합니다");
			$("#pwck_text").css("color","green");
			pwck=true;
		}
		else{
			$("#pwck_text").text("비밀번호가 일치하지 않습니다");
			$("#pwck_text").css("color","red");
			pwck=false;
		}
	});

	$("#checkid").click(function(){
		var result="";
		var tr="true";
		var fal="false";
		var id= document.joinmember.uid.value;
		if(id.length>=4&& id.length<=12){
			$.ajax({
				type : "POST",
				url : "join_member_idcheck.jsp?ID="+id,
				async: false,
				success :function(re){
					result=re.trim();
				},
				error:function(e){   
                    alert(e.responseText); 
                }
			});
			if(result==tr){	
				idck=true;
				alert("사용 가능한 아이디입니다");
			}
			else if(result==fal) {
				alert("중복된 아이디가 있습니다");
			}
		}
		else{
			alert("아이디는 4글자 이상, 12글자 이하로 설정해주세요");
			joinmember.uid.value="";
			joinmember.uid.focus();
		}
	})
	$('.page').hide();
	$('.page1').show();
	$(".next_button").click(function(){
		if($(this).parent().hasClass("page1")==true) {
			var ck1 = joinmember.querySelector("#agree1");
			var ck2 = joinmember.querySelector("#agree2");
			if(ck1.checked!=true) {
				alert("이용약관 동의를 체크해주세요");
			}
			else if(ck2.checked!=true) {
				alert("개인정보 수집 및 이용 동의에 체크해주세요");
			}
			else {
				page2show();
			}
		}
		else if($(this).parent().hasClass("page2")==true) {
			var nonull=joinmember.querySelectorAll('.page2 input');
			for(var i=0; i<nonull.length; i++){
				var nn= nonull.item(i);
				if(nn.value==''){
					alert("빈칸이 존재합니다");
					nonull.item(i).focus();
					return false;
				}
				else if (i==nonull.length-1){
					if(idck==true){	
						if(pwck==true){
							page3show();
						}
						else{
							alert("비밀번호 재확인이 일치하지 않습니다");
							joinmember.repw.focus();
							return false;
						}
					}
					else{
						alert("아이디 확인을 완료해주세요");
						joinmember.checkid.focus();
						return false;
					}
				}
			}
		} 
	})
	$(".prev_button").click(function(){
		if($(this).parent().hasClass("page2")==true) {
			$('.page2').hide();
			$('.page1').show();
		}
		else if($(this).parent().hasClass("page3")==true) {
			$('.page3').hide();
			$('.page2').show();
		} 
	})

})
function memberjoin(){
	var nonull=joinmember.querySelectorAll('.page3 input');
	for(var i=0; i<nonull.length; i++){
		var nn= nonull.item(i);
		console.log(nn.value);
		if(nn.value==''){
			alert("빈칸이 존재합니다");
			nonull.item(i).focus();
			return false;
		}
		
		else if (i==nonull.length-1){
			alert("회원가입이 완료되었습니다")
		}
	}		
}
function page1show(){
	$('.page').hide();
	$('.page1').show();
}
function page2show(){
	$('.page').hide();
	$('.page2').show();
}
function page3show(){
	$('.page').hide();
	$('.page3').show();
}