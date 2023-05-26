$(function(){
	var page=2;
	
	
	
//					<colgroup>
//						<col style="width: 140px;">
//						<col style="width: 180px;">
//						<col style="width: 120px;">
//						<col style="width: 120px;">
//						<col style="width: 390px;">
//					</colgroup>
//					<tr>
//						<th class="border_t border_b" colspan="2">주문번호</th>
//						<th class="border_t border_b" colspan="3"><%=articleList.get(i).getPrd_odnum()%></th>
//					</tr>
//					<tr>
//						<th class="border_b" rowspan="2">상품사진</th>
//						<th class="border_b" rowspan="2">주문일자</th>
//						<th class="border_b" colspan="2">상품명</th>
//						<th class="border_b" rowspan="2">배송지</th>
//					</tr>
//					<tr>
//						<th class="border_b">수량</th>
//						<th class="border_b">가격</th>
//					</tr>
//	<tr>
//		<td rowspan="2"><img onerror="this.src='image/no_image.PNG'" src="<%=impt + articleList.get(i).getPrd_no()%>.jpg"></td>
//		<td rowspan="2"><%=articleList.get(i).getPrd_date()%></td>
//		<td colspan="2" class="f_bold"><%=articleList.get(i).getPrd_name()%></td>
//		<td rowspan="2"><%=articleList.get(i).getPrd_addr()%></td>
//	</tr>
//	<tr>
//		<td><%=articleList.get(i).getPrd_qant()%>개</td>
//		<td><%=articleList.get(i).getPrd_price()%>원</td>
//	</tr>
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
		});
		buylist=buylist_all.split(";");
		for(i=0; i<buylist.length-1;i++){
			buy=buylist[i].split("|");
			
			$("sb_art_no3 div").append("<table><colgroup><col style='width: 140px;'><col style='width: 180px;'><col style='width: 120px;'><col style='width: 120px;'><col style='width: 390px;'></colgroup>"+
			"<tr><th class='border_t border_b' colspan='2'>주문번호</th><th class='border_t border_b' colspan='3'>"+buy[0]+"</th></tr>"+
			"<tr><th class='border_b' rowspan='2'>상품사진</th><th class='border_b' rowspan='2'>주문일자</th><th class='border_b' colspan='2'>상품명</th><th class='border_b' rowspan='2'>배송지</th></tr>"+
			"<tr><th class='border_b'>수량</th><th class='border_b'>가격</th></tr>"+
			"<tr><td rowspan='2'><img onerror='this.src="+errorimgtext+"' src='"+buy[3]+".jpg'></td><td rowspan='2'>"+buy[1]+"</td><td colspan='2' class='f_bold'>"+buy[4]+"</td><td rowspan='2'>"+buy[7]+"</td></tr>"+
			"</table>")
			
			
			
			
//			var alarm_box = document.querySelector('.alarm_box')
//			var li = document.createElement('li');
//			var hidden = document.createElement('span');
//			var hidden_no = document.createTextNode(alarm[3]);
//			var alarm_title_span = document.createElement('span');
//			var alarm_title =  document.createTextNode(alarm[1]);
//			var x_bu = document.createElement('span');
//			if(alarm[0]==1){
//				li.classList.add('noread')
//			}else {
//				li.classList.add('read')
//			}
//			hidden.classList.add('hidden');
//			hidden.appendChild(hidden_no);
//			alarm_title_span.classList.add('alarm_title');
//			alarm_title_span.appendChild(alarm_title);
//			x_bu.classList.add('x_bu');
//			
//			li.appendChild(hidden)
//			li.appendChild(alarm_title_span)
//			li.appendChild(x_bu)
//			
//			alarm_box.appendChild(li);
		}
		page+=1;
	});
});
