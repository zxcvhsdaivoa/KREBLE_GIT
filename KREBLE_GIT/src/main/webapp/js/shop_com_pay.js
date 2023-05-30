$(function(){
	var page=2;
	
	var errorimgtext="image/no_image.PNG";
	
	$(".thethe").click(function(){
		$.ajax({
			type : "POST",
			url : "shop_com_pay2.jsp?page="+page,
			async: false,
			success :function(re){
				buylist_all = re.trim();
			},
			error:function(e){   
                alert(e.responseText); 
            }
		});//ajax 종료
		buylist=buylist_all.split(";");
		var prei ="";
		for(i=0; i<buylist.length-1;i++){
			buy=buylist[i].split("|");
			if(i>0){
				prevbuy = buylist[i-1].split("|");
			}
			if(i==0){
				$("#sb_art_no3 div").append("<table><colgroup><col style='width: 140px;'><col style='width: 180px;'><col style='width: 120px;'><col style='width: 120px;'><col style='width: 390px;'></colgroup><tr><th class='border_t border_b' colspan='2'>주문번호</th><th class='border_t border_b' colspan='3'>"+buy[0]+"</th></tr><tr><th class='border_b' rowspan='2'>상품사진</th><th class='border_b' rowspan='2'>주문일자</th><th class='border_b' colspan='2'>상품명</th><th class='border_b' rowspan='2'>배송지</th></tr><tr><th class='border_b'>수량</th><th class='border_b'>가격</th></tr><tr><td rowspan='2'><img onerror='this.src='"+errorimgtext+"' src='"+buy[3]+".jpg'></td><td rowspan='2'>"+buy[1]+"</td><td colspan='2' class='f_bold'>"+buy[2]+"</td><td rowspan='2'>"+buy[7]+"</td></tr><tr><td>"+buy[6]+"개</td><td>"+buy[5]+"원</td></tr>");
				prei = buy[0];
			}
			else if(i!=0&& buy[0]==prei){
				$("#sb_art_no3 div").append("<tr><td rowspan='2'><img onerror='this.src='image/no_image.PNG' src='"+buy[3]+".jpg'></td><td rowspan='2'>"+buy[1]+"</td><td colspan='2' class='f_bold'>"+buy[2]+"</td><td rowspan='2'>"+buy[7]+"</td></tr><tr><td>"+buy[6]+"개</td><td>"+buy[5]+"원</td></tr>")
				prei = buy[0];
			}
			else if(i!=0&& buy[0]!=prei){
				$("#sb_art_no3 div").append("</table><table><col style='width: 140px;'><col style='width: 180px;'><col style='width: 120px;'><col style='width: 120px;'><col style='width: 390px;'></colgroup><tr><th class='border_t border_b' colspan='2'>주문번호</th><th class='border_t border_b' colspan='3'>"+buy[0]+"</th></tr><tr><th class='border_b' rowspan='2'>상품사진</th><th class='border_b' rowspan='2'>주문일자</th><th class='border_b' colspan='2'>상품명</th><th class='border_b' rowspan='2'>배송지</th></tr><tr><th class='border_b'>수량</th><th class='border_b'>가격</th></tr><tr><td rowspan='2'><img onerror='this.src='"+errorimgtext+"' src='"+buy[3]+".jpg'></td><td rowspan='2'>"+buy[1]+"</td><td colspan='2' class='f_bold'>"+buy[2]+"</td><td rowspan='2'>"+buy[7]+"</td></tr><tr><td>"+buy[6]+"개</td><td>"+buy[5]+"원</td></tr>");
				prei = buy[0];
			}
			else if(i>=buylist.length){
				$("#sb_art_no div").append("</table>")
			}
		}//for문 종료
		page+=1;
		
	})//thethe 클릭 종료
});//jquery종료
