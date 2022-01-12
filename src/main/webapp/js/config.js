$(document).ready(function(){
	 /*네비 - 마우스 오버시, gnb 이미지 교체 */
	var beforeEl;
	$(".king_nav>li>a").on('mouseover',function(){
	  $('img',this).attr('src',$('img',this).attr('src').replace("out.png","over.png"));
	  beforeEl =$(this);
	});
	 
	 $(".king_nav>li>a").on('mouseout',function(){
		 if(beforeEl){
	        $('img',beforeEl).attr('src',$('img',beforeEl).attr('src')
	        		.replace("over.png","out.png"));
	     }
	});
	 
	 
	 /* 네비 - 마우스 오버시, 메뉴 펼침 */
	 $(".king_nav_wrap").hover(
		function() {
		        $("#nav_total").stop().slideDown('fast');},
		function() {
		        $("#nav_total").stop().slideUp('fast');}
	);

	$("#nav_total").hover(
		      function() {
		        $("#nav_total").stop().slideDown('fast');
		      },
		      function() {
		        $("#nav_total").stop().slideUp('fast');
		      }
		    );
	var zoomx = 100;    
	function body_zoomin() {
		  zoomx = zoomx + 10;
		  $("body").css("zoom",zoomx + "%");
	}
	function body_zoomout() {
		zoomx = zoomx - 10;
		$("body").css("zoom",zoomx + "%");
	}
	function body_zoomdef() {
		zoomx = 100;
		$("body").css("zoom",zoomx + "%");
	}
	function newWin(url,w,h) {
	window.open(url,'new_win','width='+w+',height='+h+',toolbars=no,menubars=no,scrollbars=auto');
	}
	
	///////////////////////////공지사항 bxsilder
	$('.noticeList').bxSlider({
		mode:"vertical",
	    speed: 1000,
	    auto: true,
	    pager: false
	});
	
	/////////////////////////////최고의 도시락 bxsilder
	$('.best_bx').bxSlider({
		mode: "horizontal",
		speed: 2000,
		auto:true,
		pager: false
	});
	
	/////////////////////////////새로운 도시락 bxsilder
	$('.box_bx').bxSlider({
		mode: "horizontal",
		speed: 2000,
		auto:true,
		pager: false
	});
	
/////////////////////////////새로운 도시락 bxsilder
	$('.side_bx').bxSlider({
		mode: "horizontal",
		speed: 2000,
		auto:true,
		pager: false
	});
});