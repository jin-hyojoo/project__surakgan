var star=0;
$(document).ready(function(){
	$('.etc .edit').on('click', function(){
		$(this).parents('.right_comment').hide();
		$(this).parents('.right_comment').next().show();
		$(this).parents('li').css({'padding':0});
		
		$(this).parents('.right_comment').prev().children(':eq(1)').attr('id','event_star');
		star =$(this).parents('.right_comment').prev().children(':eq(2)').val();
		
		return false;
	});
	$('.etc .submit').on('click', function(){
		var eventNode = $(this).parents('.right_comment');
		$(this).attr('href','reviewUpt.do?ic_no='+$(eventNode).prev().children('input').val()+'&ic_star='+star+'&ic_content='+$(eventNode).children().children('textarea').val());
		$(this).submit();
	});
	$('.etc .cancel').on('click', function(){
		$(this).parents('.right_comment').hide();
		$(this).parents('.right_comment').prev().show();
		$(this).parents('li').css({'padding':'0 0 40px'});
		
		$(this).parents('.right_comment').prev().prev().children(':eq(1)').attr('id','');
		
		return false;
	});

	//별점이벤트
	$(document).on('mousemove','#event_star', function(e){
		//console.log(e.pageX - $(this).offset().left);
		var x = e.pageX - $(this).offset().left;
		
        if(x>2 && x<22){
        	$(this).children().css({'width':'20%'});
        	star=1;
        }else if(x>26 && x<46){
        	$(this).children().css({'width':'40%'});
        	star=2;
        }else if(x>49 && x<69){
        	$(this).children().css({'width':'60%'});
        	star=3;
        }else if(x>72 && x<92){
        	$(this).children().css({'width':'80%'});
        	star=4;
        }else if(x>96 && x<116){
        	$(this).children().css({'width':'100%'});
        	star=5;
        }
    });
});

