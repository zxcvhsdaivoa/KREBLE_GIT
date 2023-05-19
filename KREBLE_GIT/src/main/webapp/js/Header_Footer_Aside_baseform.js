$(document).ready(function(){
	var alarm_count=0;
    $(".sub").hide();
    $(".nav_back").hide();
    $(".top_nav").mouseenter(function(){
        $(".sub").stop().slideDown(100);
        $(".nav_back").stop().slideDown(100);
    })
    $(".top_nav").mouseleave(function(){
        $(".sub").stop().slideUp(100);
        $(".nav_back").stop().slideUp(100);
    })
    
    $(".alarm").click(function(){
		if(alarm_count==0){
			var alarm_all;
			var alarm_list = [];
			var alarm=[];
			$.ajax({
				type : "POST",
				url : "alarm_list.jsp",
				async: false,
				success :function(re){
					alarm_all = re.trim();
				},
				error:function(e){   
	                alert(e.responseText); 
	            }
			});
			alarm_list=alarm_all.split(";");
			for(i=0; i<alarm_list.length-1;i++){
				alarm=alarm_list[i].split("/");
				var alarm_box = document.querySelector('.alarm_box')
				var li = document.createElement('li');
				var hidden = document.createElement('span');
				var hidden_no = document.createTextNode(alarm[6]);
				var alarm_title_span = document.createElement('span');
				var alarm_title =  document.createTextNode(alarm[3]);
				var x_bu = document.createElement('span');
				if(alarm[1]==1){
					li.classList.add('noread')
				}else {
					li.classList.add('read')
				}
				hidden.classList.add('hidden');
				hidden.appendChild(hidden_no);
				alarm_title_span.classList.add('alarm_title');
				alarm_title_span.appendChild(alarm_title);
				x_bu.classList.add('x_bu');
				
				li.appendChild(hidden)
				li.appendChild(alarm_title_span)
				li.appendChild(x_bu)
				
				alarm_box.appendChild(li);
			}
			//$(".alarm_box").html("<li class="+alarm[1]+"><span class='alarm_title' data-link="+alarm[2]+alarm[4]+">"+alarm[3]+"</span><span class='x_bu'></span></li>")
			alarm_count=1;
		}
		$('.alarm_wrap').removeClass("hide");
	})
	$('.close').click(function(){
		$('.alarm_wrap').addClass("hide");
	})
})