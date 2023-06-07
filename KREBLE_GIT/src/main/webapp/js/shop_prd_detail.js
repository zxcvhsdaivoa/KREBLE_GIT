$(function(){
	$(".del_check").click(function(){
		if(confirm("댓글을 삭제하겠습니까?")){
		}else{
			return false;
		}
	})
	
	$("#pd_detail_no4").hide();
	$("#pd_detail_no7>.flex>.text_left").click(function(){
		$("#pd_detail_no4").show();
		$("#pd_detail_no6").hide();		
	})
	$("#pd_detail_no7>.flex>.text_right").click(function(){
		$("#pd_detail_no4").hide();
		$("#pd_detail_no6").show();
	})
	
	
	
})
  function log_ck() {
    var id = session.getAttribute("ID");
    if (id == null) {
      alert("로그인이 필요합니다");
      location.href = "login.jsp";
      return false;
    }
    return true;
  }
  
  
  function alertonly(){
	  alert("장바구니에 담겼습니다.");
  }