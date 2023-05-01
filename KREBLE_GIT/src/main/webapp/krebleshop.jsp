<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="use_data.Shop_reform_db"%>
<% request.setCharacterEncoding("utf-8"); %>
<!doctype html>
<html>
 <head>
   <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="css/Header_Footer_Aside_baseform.css">
    <link rel="stylesheet" type="text/css" href="css/krebleshop.css">

<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&family=Jua&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap" rel="stylesheet">
   <title>
    Kreble Shop
   </title>
 </head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript" src="slick/slick.min.js"></script>
<script src="js/Header_Footer_Aside_baseform.js"></script>
<script src="js/krebleshop.js"></script>
 <body>
  <div id="shopmain1">

    <!-- header -->
  
  <jsp:include page="Header_baseform.jsp"/>

  <!--section-->
  <section>

    <!-- section body 센터 맞춤용 -->
    <div id = "section_body"> 

      <form>

      <!-- 참고용사진2 article -->
      <article id = "article_no1">

        <div id= "art_no1_bg_img">
          <img src="image/shopimg/benner/bargain_sale_1.jpg" class = "benner1">
          <img src="image/shopimg/benner/bargain_sale_2.jpg" class = "benner2">
          <img src="image/shopimg/benner/bargain_sale_3.jpg" class = "benner3">
          <img src="image/shopimg/benner/bargain_sale_5.jpg" class = "benner4">
        </div>
        <div class= "art_no1_div1">
          <div class="art_no1_div2 ben_no1">
          70%세일
          </div>
          <div class="art_no1_div2 ben_no2">
          특가대방출
          </div>
          <div class="art_no1_div2 ben_no3">
          폭탄세일
          </div>
          <div class="art_no1_div2 ben_no4">
          한정특가
          </div>
        </div>
      </article>



      <!-- 카테고리(2번) article -->
      <article id = "article_no2">
        
        <!-- 카테고리 중간정렬 -->
        <div id = "article_no2_div1">
          <div class="art_no3_cata bgno1">
            <a href="#article_no4">유니폼</a>
          </div>
          <div class="art_no2_cata bgno2">
            <a href="#article_no8">축구화</a>
          </div>
          <div class="art_no2_cata bgno3">
          	<a href="#article_no9"> 축구공</a>
          </div>
          <div class="art_no2_cata bgno4">
          	<a href="#article_no4"> 축구가방</a>
          </div>
          <div class="art_no2_cata bgno5">
          	<a href="#article_no4">보조식품</a>
          </div>
          <div class="art_no2_cata bgno6">
          	<a href="#article_no10">기타용품</a>
          </div>
        </div>
      </article>



      <!-- 인기브랜드(3번) article -->
      <article id = "article_no3">
        
        <!-- 카테고리 중간정렬 -->
        <div id = "article_no3_div1">
          <div class="brand_label">
            인 &emsp;기 &emsp;브 &emsp;랜 &emsp;드
          </div>
          <div class="art_no3_brand">
            <img src="image/shopimg/logo/logo_adidas.png">
          </div>
          <div class="art_no3_brand">
            <img src="image/shopimg/logo/logo_nike.png">
          </div>
          <div class="art_no3_brand">
            <img src="image/shopimg/logo/logo_puma.png">
          </div>
          <div class="art_no3_brand">
            <img src="image/shopimg/logo/logo_star.png">
          </div>
        </div>
      </article>
      
      <!-- 상품 보기 -->
      <article id = "article_no4">
      	<div><!-- 상품보기 1(유니폼/축구화) -->
      		<div><font style="font-family: gothic; font-size: 20px; font-weight: bold;">야 너도? 야 나도! 국대 될끄니까!</font></div><a href="#"><input type="button" value="상품 바로가기"></a>
      		<div class="benner_2">
      			<span>
      				<img alt="bot_benner" src="image/shopimg/shop_bot_benner0.jpg">
      			</span>
      		</div>
      		<div class="bt_prd">
      			<input type="button" value="유니폼" name="bt_uni"><input type="button" value="축구화" name="bt_sue">
      		</div>
      		<div class="prd_list list_no1">
      			<div>
      				<img src="image/shopimg/uni/uni2_1.png" class="img_siz">
      				<div class="fl_lf">색상 검정 <br> <font style="font-weight: bold">\39,000</font></div>
      				<img src="image/shopimg/uni/uni2_2.png" class="img_siz">
      				<div class="fl_lf">색상 흰색 <br> <font style="font-weight: bold">\39,000</font></div>
      			</div>
      			<div>
	      			<img src="image/shopimg/uni/uni3_1.png" class="img_siz">
	      			<div class="fl_lf">색상 빨강 <br> <font style="font-weight: bold">\32,000</font></div>
	      			<img src="image/shopimg/uni/uni4_2.png" class="img_siz">
	      			<div class="fl_lf">색상 검정 <br> <font style="font-weight: bold">\42,000</font></div>
      			</div>
      			<div>
      				<img src="image/shopimg/uni/uni6_2.png" class="img_siz">
      				<div class="fl_lf">색상 흰색 <br> <font style="font-weight: bold">\120,000</font></div>
      				<img src="image/shopimg/uni/uni7_5.png" class="img_siz">
      				<div class="fl_lf">색상 검정 <br> <font style="font-weight: bold">\150,000</font></div>
      			</div>
      		</div>
      		<div class="prd_list list_no2">
      			<div>
      				<img src="image/shopimg/sue/sue4_1.png" class="img_siz">
      				<div class="fl_lf">색상 빨강 <br> <font style="font-weight: bold">\99,000</font></div>
      				<img src="image/shopimg/sue/sue7_2.png" class="img_siz">
      				<div class="fl_lf">색상 파랑 <br> <font style="font-weight: bold">\99,000</font></div>
      			</div>
      			<div>
      				<img src="image/shopimg/sue/sue3_1.png" class="img_siz">
      				<div class="fl_lf">색상 흰색 <br> <font style="font-weight: bold">\69,000</font></div>
      				<img src="image/shopimg/sue/sue8_1.png" class="img_siz">
      				<div class="fl_lf">색상 흰색 <br> <font style="font-weight: bold">\79,000</font></div>
      			</div>
      			<div>
      				<img src="image/shopimg/sue/sue6_2.png" class="img_siz">
      				<div class="fl_lf">색상 노랑 <br> <font style="font-weight: bold">\89,000</font></div>
      				<img src="image/shopimg/sue/sue8_3.png" class="img_siz">
      				<div class="fl_lf">색상 하늘 <br> <font style="font-weight: bold">\79,000</font></div>
      			</div>
      		</div>
      		<div class="shop_go">
      			<a href="#">
      				<input type="button" value="더 많은 상품정보 보러가기">
      			</a>
      		</div>
      	</div>
      	
      	<div><!-- 상품보기 2(축구공/기타용품) -->
      		<div><font style="font-family: gothic; font-size: 20px; font-weight: bold;">이거없이 축구하려고?</font></div><a href="#"><input type="button" value="상품 바로가기"></a>
      		<div class="benner_2">
      			<span>
      				<img alt="bot_benner" src="image/shopimg/shop_bot_benner1.jpg">
      			</span>
      		</div>
      		<div class="bt_prd">
      			<input type="button" value="축구공" name="bt_ball"><input type="button" value="기타용품" name="bt_etc">
      		</div>
      		<div class="prd_list list_no3">
      			<div>
      				<img src="image/shopimg/ball/ball1_1.png" class="img_siz">
      				<div class="fl_lf">색상 은색 <br> <font style="font-weight: bold">\77,000</font></div>
      				<img src="image/shopimg/ball/ball1_2.png" class="img_siz">
      				<div class="fl_lf">색상 주황 <br> <font style="font-weight: bold">\77,000</font></div>
      			</div>
      			<div>
      				<img src="image/shopimg/ball/ball3_2.png" class="img_siz">
      				<div class="fl_lf">색상 흰색 <br> <font style="font-weight: bold">\54,000</font></div>
      				<img src="image/shopimg/ball/ball4_1.png" class="img_siz">
      				<div class="fl_lf">색상 검정 <br> <font style="font-weight: bold">\69,000</font></div>
      			</div>
      			<div>
      				<img src="image/shopimg/ball/ball5_1.png" class="img_siz">
      				<div class="fl_lf">색상 흰색 <br> <font style="font-weight: bold">\88,000</font></div>
      				<img src="image/shopimg/ball/ball6_1.png" class="img_siz">
      				<div class="fl_lf">색상 주황 <br> <font style="font-weight: bold">\149,000</font></div>
      			</div>
      		</div>
      		<div class="prd_list list_no4">
      			<div>
      				<img src="image/shopimg/etc/etc_armband1_1.png" class="img_siz">
      				<div class="fl_lf">색상 검정 <br> <font style="font-weight: bold">\14,000</font></div>
      				<img src="image/shopimg/etc/etc_armband1_2.png" class="img_siz">
      				<div class="fl_lf">색상 빨강 <br> <font style="font-weight: bold">\14,000</font></div>
      			</div>
      			<div>
      				<img src="image/shopimg/etc/etc_armband1_4.png" class="img_siz">
      				<div class="fl_lf">색상 초록 <br> <font style="font-weight: bold">\14,000</font></div>
      				<img src="image/shopimg/etc/etc_armband1_6.png" class="img_siz">
      				<div class="fl_lf">색상 파랑 <br> <font style="font-weight: bold">\14,000</font></div>
      			</div>
      			<div>
      				<img src="image/shopimg/etc/etc_ballcart_1_1.png" class="img_siz">
      				<div class="fl_lf">품목 카트 <br> <font style="font-weight: bold">\204,000</font></div>
      				<img src="image/shopimg/etc/etc_socks1_1.png" class="img_siz">
      				<div class="fl_lf">품목 양말 <br> <font style="font-weight: bold">\3,000</font></div>
      			</div>
      		</div>
      		<div class="shop_go">
      			<a href="#">
      				<input type="button" value="더 많은 상품정보 보러가기">
      			</a>
      		</div>
      	</div>
      </article>
     </form>
    </div>
  </section>

    <!-- footer -->
    <jsp:include page="Footer_baseform.jsp"/>
    </div>
 </body>
</html>