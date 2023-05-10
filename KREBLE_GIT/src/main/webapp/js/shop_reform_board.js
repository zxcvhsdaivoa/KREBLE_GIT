function aaa(){
	
	var tr = document.getElementById("search2").value;
	var title = document.getElementById("search3").value;
	
	if(tr == "" && title == ""){
		location.href="shop_reform_board.jsp";
	}
	
	location.href="shop_reform_search.jsp?re_tr="+tr+"&re_title="+title;


}