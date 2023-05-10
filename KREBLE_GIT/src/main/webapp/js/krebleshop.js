$(function(){

// 참고용사진2article

	$('#art_no1_bg_img > img').hide();
	$('#art_no1_bg_img > img:first-child').show();

	$('.ben_no1').hover(function(){
		$('#art_no1_bg_img > img').hide();
		$('.benner1').show();
		$('.ben_no2, .ben_no3, .ben_no4').removeClass('black');
		$('.ben_no1').addClass('black');
	})
	$('.ben_no2').hover(function(){
		$('#art_no1_bg_img > img').hide();
		$('.benner2').show();
		$('.ben_no1, .ben_no3, .ben_no4').removeClass('black');
		$('.ben_no2').addClass('black');
	});
	$('.ben_no3').hover(function(){
		$('#art_no1_bg_img > img').hide();
		$('.benner3').show();
		$('.ben_no2, .ben_no1, .ben_no4').removeClass('black');
		$('.ben_no3').addClass('black');
	})
	$('.ben_no4').hover(function(){
		$('#art_no1_bg_img > img').hide();
		$('.benner4').show();
		$('.ben_no2, .ben_no3, .ben_no1').removeClass('black');
		$('.ben_no4').addClass('black');
	})
	$('.prd_list').hide();
	$('.prd_list.list_no1').show();
	$('.prd_list.list_no3').show();
	
	$('input[name=bt_uni]').click(function(){
		$('.list_no2').hide();
		$('.list_no1').show();
	});
	$('input[name=bt_sue]').click(function(){
		$('.list_no1').hide();
		$('.list_no2').show();
	});
	$('input[name=bt_ball]').click(function(){
		$('.list_no4').hide();
		$('.list_no3').show();
	});
	$('input[name=bt_etc]').click(function(){
		$('.list_no3').hide();
		$('.list_no4').show();
	});
	
});