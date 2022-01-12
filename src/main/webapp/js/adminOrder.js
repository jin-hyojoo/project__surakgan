$(document).ready(function(){
	var present="";
	$('#calendar_table a').on('click', function(){
		//alert($(this).parents('tr')[0].nodeName);
		var today = $(this).children('.day').text();
		var thisNode =$(this);
		
		$(present).css({'background':'transparent'});
		present = $(thisNode).parent();
		$(thisNode).parent().css({'background':'#fbc560'});
		
		//주문내역없는날 이벤트효과취소
		if($(thisNode).children('.schedule').children().children().text()==''){
			$(thisNode).parents('.orderWrap').children('fieldset').remove();
			return false;
		}
		
		$(thisNode).parents('.orderWrap').children('fieldset').remove();
		var source = "<fieldset class='orderList'><legend>주문내역</legend>"
			+"<input type='button' value='X' id='close'>"
			+"<table><tr id='before' style='display:none;'><th colspan='5'>-------------------------------- 입금 전 --------------------------------</th></tr>"
			+"<tr id='after' style='display:none;'><th colspan='5'>-------------------------------- 입금 후 --------------------------------</th></tr></table></fieldset>";
		$(thisNode).parents('.orderWrap').append(source);
		
		$.ajax({
			type:'get',
			dataType:'json',
			url:'detailOrder.do',
			data:{today:today},
			success:function(res){
				$.each(res, function(index, value) {
					var schedule;
					if(value.o_state==0){
						schedule = "<tr><td colspan='2'><input type='hidden' value='"+value.o_no+"'/>"+value.i_name+" X "+value.on_cnt+"</td><td>"+value.on_time+"</td><td>"+value.u_name+"</td><td style='text-align:right;'><input type='button' value='입금확인' class='deposit'/></td></tr>";
						$('.orderWrap fieldset #before').show();
						$('.orderWrap fieldset #before').after(schedule);
					}else if(value.o_state==1){
						schedule = "<tr><td colspan='2'><input type='hidden' value='"+value.on_no+"'/>";
						if(value.i_no==0){
							schedule +="<a href='#'>"+value.i_name+" X "+value.on_cnt+"<span>▼</span></a>";
						}else{
							schedule +=value.i_name+" X "+value.on_cnt;
						}
						schedule +="</td><td>"+value.on_time+"</td><td>"+value.u_name+"</td><td style='text-align:right;'>";
						if(value.on_state==0){
							schedule += "수령전&nbsp;&nbsp;<input type='button' class='on_state' value='수령완료' />";
						}else if(value.on_state==1){
							schedule += "수령완료";
						}
						schedule+="</td></tr>";
						$('.orderWrap fieldset #after').show();
						$('.orderWrap fieldset #after').after(schedule);
					}
				});
				
			}     
		});  
		
		return false;
	});
	
	$(document).on('click', '#close', function(){
		$(this).parents('.orderWrap').children('fieldset').remove();
	});
	$(document).on('click', '.board_search', function(){
		$('.orderList').remove();
	});
	
	$(document).on('click', 'fieldset table a', function(){
		var thisNode = $(this);
		if($(thisNode).children('span').text()=='▼'){
			$(thisNode).children('span').text('▲');
			$.ajax({
				type:'get',
				dataType:'json',
				url:'lunchboxOrderList.do',
				data:{on_no:$(thisNode).prev().val()},
				success:function(res){
					var source = "<tr><td colspan='2'><ul>"
					$.each(res, function(index, value) {
						source+="<li> └"+value+"</li>";
					});
					source+="</ul></td></tr>";
					$(thisNode).parents('tr').after(source);
				}     
			});  
		}else{
			$(thisNode).children('span').text('▼');
			$(thisNode).parents('tr').next().remove();
		}
		
		return false;
	});
	$(document).on('click', 'fieldset table .on_state', function(){
		var thisNode = $(this);
		$.ajax({
			type:'get',
			dataType:'text',
			url:'lunchboxStateUpt.do',
			data:{on_no:$(this).parents('tr').children().children('input[type="hidden"]').val()},
			success:function(res){
				$(thisNode).parent().html("수령완료");
			}     
		});  
		
		return false;
	});
	$(document).on('click', 'fieldset table .deposit', function(){
		var thisNode = $(this);
		$.ajax({
			type:'get',
			dataType:'json',
			url:'depositChk.do',
			data:{o_no:$(this).parents('tr').children().children('input[type="hidden"]').val()},
			success:function(res){
				//입금후에 tr생성
				var schedule = "<tr><td colspan='2'><input type='hidden' value='"+res.on_no+"'/>";
				if(res.i_no==0){
					schedule +="<a href='#'>"+res.i_name+" X "+res.on_cnt+"<span>▼</span></a>";
				}else{
					schedule +=res.i_name+" X "+res.on_cnt;
				}
				schedule +="</td><td>"+res.on_time+"</td><td>"+res.u_name+"</td><td style='text-align:right;'>";
				if(res.on_state==0){
					schedule += "수령전&nbsp;&nbsp;<input type='button' class='on_state' value='수령완료' />";
				}else if(res.on_state==1){
					schedule += "수령완료";
				}
				schedule+="</td></tr>";
				
				$('.orderWrap fieldset #after').after(schedule);
				
				//입금전 tr삭제
				$(thisNode).parents('tr').remove();
				if($('.orderWrap fieldset #before').next().attr('id')=='after'){
					$('.orderWrap fieldset #before').hide();
				}
				
			}     
		});  
		
		return false;
	});
});