$(function(){
	$(window).resize(function(){
		var win_h = $(window).height()
		if(win_h<=780){
			$('section').css('height','510px')
		}
		else{
			$('section').css('height','calc(100vh - 270px)')
		}
	})

	function login(){
		if(user_login.id.value==null) {
			alert("아이디를 입력해주세요");
			return false;
		}
		else if(user_login.passward.value==null){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		else {
			
		}
	}
	
	
	$(".ka_lo > img").click(function(){
	})
	
	
})


//로그인 된 토큰 삭제
//Kakao.Auth.logout()
//  .then(function(response) {
//    console.log(Kakao.Auth.getAccessToken()); // null
//  })
//  .catch(function(error) {
//    console.log('Not logged in.');
//  });


