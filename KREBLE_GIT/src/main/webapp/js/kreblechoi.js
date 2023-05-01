$(function(){
	var listfield=1;
	
	const urlParams = new URLSearchParams(window.location.search);
	const field_no = urlParams.get('field_id');
	$("#"+field_no).parents(".local").addClass("on");
	$("#"+field_no).addClass("on");
	
	$(".local").click(function(){
		$(".local").removeClass("on");
		$(this).addClass("on");
	})
	
	$('.local ul li').click(function(){
		$('.local ul li').removeClass('on');
		$(this).addClass("on");
		if($('.favorite_stadium > ul li:nth-child('+ listfield +')').hasClass('select')==true) {
			$('.select a').text($(this).find('a').text())
			$('.favorite_stadium > ul .default:nth-child('+ listfield +')').addClass('favorite');
			$('.favorite_stadium > ul .favorite').removeClass('select');
			$('.favorite_stadium > ul .favorite').removeClass('default');
			listfield+=1;
			
			console.log(listfield);
		}
		else {
			//$('ul.local_stadium > li > ul > li').click(function(){
			// 같은 위치에 클릭이벤트가 2개 걸려있어서 더블클릭해야 밑에 코드가 실행 됐던거 이 코드를 지워야 한번 클릭시
			// 정보가 바뀜
			   var fieldlistfield=$(this).attr('id');
			    location.href="fieldInfo.choi?field_id="+fieldlistfield;
		}
	});
	
	$(".rent_btn").click(function(){
		$.ajax({
		    type : "POST",
		    url : "login_check.jsp",
		    success :function(re){
		        login_id=re.trim();
		    },
		    error:function(e){   
		        alert(e.responseText); 
		    }
		});
		
		if(login_id=="null"){
			var result= confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?")
			if (result==true) {
				location.replace("login.jsp");
			}
			else if(result==false){
				
			}
		}else{
			location.replace("fieldrent.choi");
		}
	});

	$('#plusbu').click(function(){
	    $.ajax({
		    type : "POST",
		    url : "login_check.jsp",
		    success :function(re){
		        login_id=re.trim();
		    },
		    error:function(e){   
		        alert(e.responseText); 
		    }
		});
		
		if(login_id=="null"){
			var result= confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?")
			if (result==true) {
				location.replace("login.jsp");
			}
			else if(result==false){
				
			}
		}
		else if(login_id!=="null"){
			if (listfield==5){
//				console.log(listfield);
				alert('더이상 추가할수 없습니다');
			}
			else {
//				console.log(listfield);
				$('.favorite_stadium > ul li:nth-child('+ listfield +')').addClass('select');
				}
			}
		
	});
	$('#minusbu').click(function(){
		$.ajax({
		    type : "POST",
		    url : "login_check.jsp",
		    success :function(re){
		        login_id=re.trim();
		    },
		    error:function(e){   
		        alert(e.responseText); 
		    }
		});
		
		if(login_id=="null"){
			var result= confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?")
			if (result==true) {
				location.replace("login.jsp");
			}
			else if(result==false){
				
			}
		}
		else if(login_id!=="null"){
			if (listfield==1){
//				console.log(listfield);
				alert('더이상 제거할수 없습니다');
			}
			else {
//				console.log(listfield);
				if(listfield==5) {
					listfield=4;
				}
				else {
					listfield-=1;
				}
//				console.log(listfield);
//				console.log(listfield);
				$('.favorite_stadium > ul li:nth-child('+ listfield +')').addClass('delete');
				$('.delete a').text("구장"+listfield);
				$('.delete').addClass('default');
				$('.delete').removeClass('favorite');
				$('.delete').removeClass('delete');
				}
			}
		});	
});
