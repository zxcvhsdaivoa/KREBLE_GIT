$(function(){
	$(".del_check").click(function(){
		if(confirm("댓글을 삭제하겠습니까?")){
		}else{
			return false;
		}
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