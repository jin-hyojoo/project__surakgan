$(document).ready(function() {
	var detail = $('#imgs_bg ul').bxSlider({
		mode : "horizontal", // 가로 수평으로 슬라이드 됩니다.
		speed : 300, // 이동 속도를 설정합니다.
		pager : false, // 현재 위치 페이징 표시 여부 설정.
		moveSlides : 1, // 슬라이드 이동시 갯수 설정.
		slideWidth : 82, // 슬라이드 마다 너비 설정.
		minSlides : 4, // 최소 노출 개수를 설정합니다.
		maxSlides : 4, // 최대 노출 개수를 설정합니다.
		slideMargin : 10, // 슬라이드간의 간격을 설정합니다.
		auto : false, // 자동으로 흐를지 설정합니다.
		autoHover : true, // 마우스 오버시 정시킬지 설정합니다.
		controls : false // 이전 다음 버튼 노출 여부 설정합니다.
	});
	
	$('.prev_btn').on('click', function() {
		detail.goToPrevSlide();
		return false;
	});
	$('.next_btn').on('click', function() {
		detail.goToNextSlide();
		return false;
	});
	
	$('#imgs_bg li a').on("mouseover", function() {
		$('#photo>img').attr('src', $(this).children().attr('src'));
		return false;
	});
	$('#imgs_bg li a').on("click", function() {
		return false;
	});
	//end bxSlider
	
	//수량 up, down
	$('#up').on('click', function(){
		var price = parseInt($('#one_price').text());
		var amount = parseInt($('#amount').val())+1;
		$('#amount').val(amount);
		$('#tot_price').text(amount*price);
		
		return false
	});
	
	$('#down').on('click', function(){
		var price = parseInt($('#one_price').text());
		var amount = parseInt($('#amount').val())-1;
		if(amount<1){
			alert("수량을 선택해주세요");
			return false;
		}
		$('#amount').val(amount);
		$('#tot_price').text(amount*price);
		
		return false;
	});
	
	//후기
	var star=0;
	
	$('#event_star').on('mousemove', function(e){
		//console.log(e.pageX - $(this).offset().left);
		var x = e.pageX - $(this).offset().left;
		
        if(x>2 && x<22){
        	$('#write_star').css({'width':'20%'});
        	star=1;
        }else if(x>26 && x<46){
        	$('#write_star').css({'width':'40%'});
        	star=2;
        }else if(x>49 && x<69){
        	$('#write_star').css({'width':'60%'});
        	star=3;
        }else if(x>72 && x<92){
        	$('#write_star').css({'width':'80%'});
        	star=4;
        }else if(x>96 && x<116){
        	$('#write_star').css({'width':'100%'});
        	star=5;
        }
    });
	
	//후기작성
	$('#ic_write').on('click', function(){
		if(star==0){
			alert("별점을 선택해주세요.");
			return false;
		}
		
		if($('#ic_content').val()==""){
			alert("후기를 작성해주세요.");
			$('#ic_content').focus();
			return false;
		}
		
		$.ajax({
			type:'POST',
			dataType:'json',
			url:'comment.do',
			data:'i_no='+$('#i_no').val()+'&u_no='+$('#u_no').val()+'&ic_star='+star+'&ic_content='+$('#ic_content').val(),
			success:function(res){
				$('#comment_box li').remove();
				
				$.each(res, function(index, value) {
					var d = new Date(value.ic_regdate);
					var date = d.getFullYear()+"-"+d.getMonth()+"-"+d.getDate();
					var source = '<li>'
						+'<div class="left_comment">'
						+'<div class="starscore_bg">'
						+'<div class="starscore" style="width: '+value.ic_star*20+'%;"></div>'
						+'</div>'
						+'<div class="c_id">'+value.u_id+'</div>'						
						+'</div>'
						+'<div class="right_comment">'
						+'<div class="c_content">'+value.ic_content+'</div>'
						+'<div class="reg_date">'+date+'</div>'
						+'</div>'
						+'</li>';
					var template = Handlebars.compile(source);
			         $('#comment_box').append(template(value));
				});
				
				star=0;
				$('#write_star').css({'width':'0'});
				$('#ic_content').val('');
			}//end success
		
		});//end ajax
		
	})
	
});

