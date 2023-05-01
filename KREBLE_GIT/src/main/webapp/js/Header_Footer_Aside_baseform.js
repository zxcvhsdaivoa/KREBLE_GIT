$(document).ready(function(){
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
})
$(window).on("load",function(){
    $.ajax({
        type : "POST",
        url : "login_check.jsp",
        async: false,
        success :function(re){
            login_id=re.trim();
        },
        error:function(e){   
            alert(e.responseText); 
        }
    });
    if(login_id!="null"){
        $(".cate_login li.login_true").show();
        $(".cate_login li.login_false").hide(); 
        $(".login_true:eq(1) a").text(login_id +"의 페이지");
    }
    else if (login_id=="null"){
        $(".cate_login li.login_false").show();  
        $(".cate_login li.login_true").hide();  
        $(".login_true:eq(1) a").text("마이페이지");
    }
})