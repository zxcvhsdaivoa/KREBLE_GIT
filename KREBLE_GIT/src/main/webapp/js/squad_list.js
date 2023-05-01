$(document).ready(function(){
	$(".search_select").change(function(){
		var search_val = $(this).val();
		if(search_val=="formation"){
			$(".search_formation").removeClass("hide");
			$(".search_text").addClass("hide");
		}
		else if(search_val == "user_id") {
			$(".search_formation").addClass("hide");
			$(".search_name").addClass("hide");
			$(".search_user").removeClass("hide");
		}
		else if(search_val=="mysquad_name") {
			$(".search_formation").addClass("hide");
			$(".search_user").addClass("hide");
			$(".search_name").removeClass("hide");
			
		}
	})
})