$(function(){
	var cate = document.getElementsByClassName("replace_cate");
	for(var i=0 ; i<cate.length; i++){
		var eng_cate= cate.item(i).innerText;
		var kor_cate = eng_cate.replace('free','자유').replace('debate','토론').replace('qna','질문').replace('info','정보');
		cate.item(i).innerText=kor_cate;
	}
})

function comment_write(){
	var commu_no=document.getElementById("commu_no").value;
	var comment=document.getElementById("comment").value;
	$.ajax({
		type : "POST",
		url : "commu_comment_write.jsp?commu_no="+commu_no+"&comment="+comment,
		async: false,
		success :function(re){
			result=re.trim();
		},
		error:function(e){   
            alert(e.responseText); 
        }
	});
	if(result=="success"){
		location.reload();
		alert("댓글이 작성되었습니다");
	}
	else if(result=="fail") {
		alert("댓글 작성에 실패했습니다")
		
	}
}

function setThumbnail(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var thumbnail = document.querySelector("div.thumbnail")
      thumbnail.innerHTML="<span class='thumb'><img></span>";
      var thumb_img = document.querySelector("div.thumbnail .thumb img")
      thumb_img.setAttribute("src", event.target.result);
    };

    reader.readAsDataURL(event.target.files[0]);
}

$(document).ready(function(){
	$(".btn_delete").click(function(){
		var no = $(this).attr("data-communo");
		var deleteConfirm = confirm('게시글을 삭제하시겠습니까?');
		if(deleteConfirm){
			location.href="community_deleting.jsp?no="+no;
		}
		else {
			
		}
	})
})