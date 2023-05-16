$(function(){
	$(".payment_btn").click(function(event){
			var ruleck = document.querySelector("#rulecheck");
			var cautionck = document.querySelector("#cautioncheck");
			
			if(ruleck.checked!=true) {
				alert("이용규칙 동의를 체크해주세요");
				event.preventDefault(); //폼 제출 동작 중지
			}
			else if(cautionck.checked!=true) {
				alert("주의사항 동의를 체크해주세요");
				event.preventDefault();
			}
	});
});