$(function(){
	var pl_img_src="image/player_img/";
	var pl_count= ($('.player_list ul li').length);
	var sq_count= ($('.squad_wrap ul li').length);
	$(".sub_wrap").hide();
	$(".sub_wrap").addClass("z_in");
	$(".squad_wrap ul li:last").addClass("onlyGK");
	//$('.mysquad .squad_wrap ul li').draggable();

	//기본 이미지 지정
	for(var i=1; i<=pl_count; i++){
		var enname = $(".player_list ul li:nth-of-type("+i+")").find(".name_eng").text();
		$(".player_list ul li:nth-of-type("+i+")").find("img").attr("src",pl_img_src+enname+".jpg");
	}

	//n번 선수 선택
	$(".squad_wrap ul > li").click(function(){
		//선수선택페이지 오픈
		if($(this).find("span").hasClass("plus")==true){
			$(".squad_wrap ul > li").removeClass("on")
			$(this).addClass("on")
			if($(this).hasClass("director")==true) {
				$(".director_wrap").show()
			}
			else {
				$(".player_wrap").show()
			}
		}
		//등록된 선수 제거
		else if($(this).find("span").hasClass("x_bu")==true){
			$(this).find(".player_image").attr("src","image/player_img/null_image.png");
			for(var i=0; i<=sq_count; i++){
				if($(this).find("p.ko_name").text()==$(".squad_wrap ul li:nth-of-type("+i+")").find("p.ko_name").text()){
					if(i==1){
						$(this).find("p.ko_name").text("감독")
					}
					else {
						$(this).find("p.ko_name").text("선수"+(i-1))
					}
				}
				$(this).find("p.eng_name").text("")
				$(this).find("p.posi").text("")
				$(this).find("input[type=hidden]").val("");
			}
			$(this).find("span.x_bu").addClass("plus");
			$(this).find("span.x_bu").removeClass("x_bu");
			$(this).removeClass("on");
			$(this).find("p.posi").removeClass('on');
		}
	})
	//선수 선택
	$(".select_list li").click(function(){
		var pl_img=$(this).find("img").attr("src");
		var pl_name_ko=$(this).find(".name_ko").text();
		var pl_name_eng=$(this).find(".name_eng").text();
		var pl_position=$(this).find(".p_position").text();
		
		if($(".squad_wrap ul li.on").hasClass("onlyGK")==true){
			if(pl_position!="GK"){
				alert("해당 자리에는 골키퍼만 등록할 수 있습니다");
				return false;
			}
		}
		else {
			if(pl_position=="GK"){
				alert("골기퍼는 해당 자리에 등록할 수 없습니다");
				return false;
			}
		}
		
		$(".squad_wrap ul li.on .player_image").attr("src",pl_img);
		$(".squad_wrap ul li.on p.ko_name").text(pl_name_ko);
		$(".squad_wrap ul li.on p.eng_name").text(pl_name_eng);
		$(".squad_wrap ul li.on input[type=hidden]").val(pl_name_eng);
		$(".squad_wrap ul li.on p.posi").text(pl_position);
		$(".squad_wrap ul li.on span.plus").addClass("x_bu");
		$(".squad_wrap ul li.on span.plus").removeClass("plus");
		$(".squad_wrap ul li.on p.posi").addClass('on');
		$(".squad_wrap ul li.on").removeClass("on")
		$(".player_wrap").hide();
	})
	//창 닫기
	$(".exit").click(function(){
		$(".squad_wrap ul li.on").removeClass("on");
		$(".sub_wrap").hide();
		if($(this).parent().hasClass("player_inner")==true){
			$(".player_list ul li").show();
		}
	})


	//포지션별로 표시
	$(".list_header ul li").click(function(){
		var fosi = $(this).text();
		if(fosi == "All Players") {
			$(".player_list ul li").show();
		}
		else {
			for(var i=1; i<=pl_count; i++){
				var pl_posi=$(".player_list ul li:nth-of-type("+i+") .p_position").text();
				if(pl_posi==fosi){
					$(".player_list ul li:nth-of-type("+i+")").show();
				}
				else {
					$(".player_list ul li:nth-of-type("+i+")").hide();
				}
			}
		}
	})

	//포메이션
	$("#formation").change(function(){
		var forma=$("#formation option:selected").val();
		$(".squad_wrap ul li:nth-of-type(1)").css({'top':'0','left':'-30px'})
		$(".squad_wrap ul li:nth-of-type(12)").css({'top':'580px','left':'555px'})
		if(forma=="4-3-3") {
			forma433();
		}
		else if(forma=="4-2-3-1") {
			forma4231();
		}
		else if(forma=="4-2-2-2") {
			forma4222();
		}
		else if(forma=="4-1-2-3") {
			forma4123();
		}
		else if(forma=="5-2-3") {
			forma523();
		}
	})
	

	//스쿼드 저장
	$(".save_squad").click(function(){
		var sq_mem_ko = document.querySelectorAll(".ko_name");
		var sq_mem_eng = document.querySelectorAll(".eng_name");
		for(var i=0; i<sq_mem_eng.length; i++){
			var null_ch =sq_mem_eng.item(i).innerText;
			if(null_ch == ''){
				alert('비어있는 칸이 없도록 선택해주세요');
				return false;
			}
			else if(i==sq_mem_ko.length-1) {
				for(var j=1; j<sq_mem_ko.length; j++){
					var ckj=sq_mem_ko.item(j).innerText;
					for(var k=0; k<j; k++) {
						var ckk=sq_mem_ko.item(k).innerText;
						if(ckj == ckk) { 
							alert('선수가 중복되지 않게 선택해주세요\n현재 중복된 선수 : '+ckj)
							return false;
				        } else if(j==sq_mem.length-1 && k==j-1) {
				            
				        }
					}
				}
			}
		}
	})
	
	//스쿼드 페이지 오픈
	$(".open_squad").click(function(){
		$(".mysquad_wrap").show();
	})
	
	
	//공개여부 버튼 동작
	$(".toggle_button").click(function(){
		var squad_no = $(this).attr("data-squadNo");
		var disclose = $(this).attr("data-disclose");
		
		$.ajax({
			type : "POST",
			url : "squadDisclose.sq?squad_no="+squad_no+"&disclose="+disclose,
			async: false,
			success :function(re){
				result=re.trim();
			},
			error:function(e){   
                alert(e.responseText); 
            }
		});
		if(result=="success"){
			if($(this).hasClass("yes")==true) {
				$(this).removeClass("yes");
				$(this).addClass("no");
				$(this).attr("data-disclose","no");
				$(this).parent().prev().text("no");
			}
			else if($(this).hasClass("no")==true){
				$(this).removeClass("no");
				$(this).addClass("yes");
				$(this).attr("data-disclose","yes");
				$(this).parent().prev().text("yes");
			}
		}
		else if(result=="fail") {
			alert("설정을 변경하는데 실패했습니다");
		}
	})
	
	//삭제버튼
	$(".delete_squad").click(function(){
		var squad_no = $(this).attr("data-squadNo");
		var deleteConfirm = confirm('스쿼드를 삭제하시겠습니까?');
		if (deleteConfirm) {
			$.ajax({
				type : "POST",
				url : "squadDeletePro.sq?squad_no="+squad_no,
				async: false,
				success :function(re){
					result=re.trim();
				},
				error:function(e){   
	                alert(e.responseText); 
	            }
			});
			if(result=="success"){
				$(this).parents("tr").remove();
				alert("스쿼드를 삭제가 완료되었습니다");
			}
			else if(result=="fail") {
				alert("스쿼드를 삭제하는데 실패했습니다");
			}
		}
		else {
			
		}
		
	})
})
//


function forma433() {
	$(".squad_wrap ul li:nth-of-type(1)").css({'top':'0','left':'-30px'})
	$(".squad_wrap ul li:nth-of-type(12)").css({'top':'580px','left':'555px'})
	$(".squad_wrap ul li:nth-of-type(2)").css({'top':'35px','left':'230px'})
	$(".squad_wrap ul li:nth-of-type(3)").css({'top':'35px','left':'555px'})
	$(".squad_wrap ul li:nth-of-type(4)").css({'top':'35px','left':'880px'})
	$(".squad_wrap ul li:nth-of-type(5)").css({'top':'240px','left':'310px'})
	$(".squad_wrap ul li:nth-of-type(6)").css({'top':'275px','left':'555px'})
	$(".squad_wrap ul li:nth-of-type(7)").css({'top':'240px','left':'800px'})
	$(".squad_wrap ul li:nth-of-type(8)").css({'top':'420px','left':'160px'})
	$(".squad_wrap ul li:nth-of-type(9)").css({'top':'435px','left':'390px'})
	$(".squad_wrap ul li:nth-of-type(10)").css({'top':'435px','left':'720px'})
	$(".squad_wrap ul li:nth-of-type(11)").css({'top':'420px','left':'960px'})
}
function forma4231(){
	$(".squad_wrap ul li:nth-of-type(1)").css({'top':'0','left':'-30px'})
	$(".squad_wrap ul li:nth-of-type(12)").css({'top':'580px','left':'555px'})
	$(".squad_wrap ul li:nth-of-type(2)").css({'top':'15px','left':'555px'})
	$(".squad_wrap ul li:nth-of-type(3)").css({'top':'135px','left':'310px'})
	$(".squad_wrap ul li:nth-of-type(4)").css({'top':'165px','left':'555px'})
	$(".squad_wrap ul li:nth-of-type(5)").css({'top':'135px','left':'800px'})
	$(".squad_wrap ul li:nth-of-type(6)").css({'top':'290px','left':'400px'})
	$(".squad_wrap ul li:nth-of-type(7)").css({'top':'290px','left':'710px'})
	$(".squad_wrap ul li:nth-of-type(8)").css({'top':'390px','left':'160px'})
	$(".squad_wrap ul li:nth-of-type(9)").css({'top':'450px','left':'400px'})
	$(".squad_wrap ul li:nth-of-type(10)").css({'top':'450px','left':'710px'})
	$(".squad_wrap ul li:nth-of-type(11)").css({'top':'390px','left':'950px'})
}
function forma4222(){
	$(".squad_wrap ul li:nth-of-type(1)").css({'top':'0','left':'-30px'})
	$(".squad_wrap ul li:nth-of-type(12)").css({'top':'580px','left':'555px'})
	$(".squad_wrap ul li:nth-of-type(2)").css({'top':'30px','left':'455px'})
	$(".squad_wrap ul li:nth-of-type(3)").css({'top':'30px','left':'655px'})
	$(".squad_wrap ul li:nth-of-type(4)").css({'top':'200px','left':'230px'})
	$(".squad_wrap ul li:nth-of-type(5)").css({'top':'200px','left':'880px'})
	$(".squad_wrap ul li:nth-of-type(6)").css({'top':'290px','left':'435px'})
	$(".squad_wrap ul li:nth-of-type(7)").css({'top':'290px','left':'675px'})
	$(".squad_wrap ul li:nth-of-type(8)").css({'top':'390px','left':'170px'})
	$(".squad_wrap ul li:nth-of-type(9)").css({'top':'450px','left':'435px'})
	$(".squad_wrap ul li:nth-of-type(10)").css({'top':'450px','left':'675px'})
	$(".squad_wrap ul li:nth-of-type(11)").css({'top':'390px','left':'940px'})
}
function forma4123(){
	$(".squad_wrap ul li:nth-of-type(1)").css({'top':'0','left':'-30px'})
	$(".squad_wrap ul li:nth-of-type(12)").css({'top':'580px','left':'555px'})
	$(".squad_wrap ul li:nth-of-type(2)").css({'top':'20px','left':'230px'})
	$(".squad_wrap ul li:nth-of-type(3)").css({'top':'40px','left':'555px'})
	$(".squad_wrap ul li:nth-of-type(4)").css({'top':'20px','left':'880px'})
	$(".squad_wrap ul li:nth-of-type(5)").css({'top':'230px','left':'380px'})
	$(".squad_wrap ul li:nth-of-type(6)").css({'top':'230px','left':'730px'})
	$(".squad_wrap ul li:nth-of-type(7)").css({'top':'305px','left':'555px'})
	$(".squad_wrap ul li:nth-of-type(8)").css({'top':'400px','left':'190px'})
	$(".squad_wrap ul li:nth-of-type(9)").css({'top':'430px','left':'380px'})
	$(".squad_wrap ul li:nth-of-type(10)").css({'top':'430px','left':'730px'})
	$(".squad_wrap ul li:nth-of-type(11)").css({'top':'400px','left':'920px'})
}
function forma523(){
	$(".squad_wrap ul li:nth-of-type(1)").css({'top':'0','left':'-30px'})
	$(".squad_wrap ul li:nth-of-type(12)").css({'top':'580px','left':'555px'})
	$(".squad_wrap ul li:nth-of-type(2)").css({'top':'20px','left':'200px'})
	$(".squad_wrap ul li:nth-of-type(3)").css({'top':'10px','left':'555px'})
	$(".squad_wrap ul li:nth-of-type(4)").css({'top':'20px','left':'910px'})
	$(".squad_wrap ul li:nth-of-type(5)").css({'top':'210px','left':'420px'})
	$(".squad_wrap ul li:nth-of-type(6)").css({'top':'210px','left':'700px'})
	$(".squad_wrap ul li:nth-of-type(7)").css({'top':'330px','left':'200px'})
	$(".squad_wrap ul li:nth-of-type(8)").css({'top':'390px','left':'350px'})
	$(".squad_wrap ul li:nth-of-type(9)").css({'top':'390px','left':'555px'})
	$(".squad_wrap ul li:nth-of-type(10)").css({'top':'390px','left':'760px'})
	$(".squad_wrap ul li:nth-of-type(11)").css({'top':'330px','left':'910px'})
}

function forma_change(forma){
	if(forma=="4-3-3") {
		forma433();
	}
	else if(forma=="4-2-3-1") {
		forma4231();
	}
	else if(forma=="4-2-2-2") {
		forma4222();
	}
	else if(forma=="4-1-2-3") {
		forma4123();
	}
	else if(forma=="5-2-3") {
		forma523();
	}
}




