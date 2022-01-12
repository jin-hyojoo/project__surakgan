$(document).ready(function(){
	var present="";
	$('#calendar_table a').on('click', function(){
		//alert($(this).parents('tr')[0].nodeName);
		var today = $(this).children('.day').text();
		var thisNode =$(this);
		
		$(present).css({'background':'transparent'});
		present = $(thisNode).parent();
		$(thisNode).parent().css({'background':'#fbc560'});
		$('#oneday').remove();
		
		//주문내역없는날 이벤트효과취소
		if($(thisNode).children('.schedule').children().children().text()=='')
			return false;
		
		$.ajax({
			type:'get',
			dataType:'json',
			url:'detailOrder.do',
			data:{today:today},
			success:function(res){
				var schedule = "<ul>"
					$.each(res, function(index, value) {
						schedule+="<li><tr><td colspan='2'>"+value.i_name+" X "+value.on_cnt+"</td><td>"+value.on_time+"</td><td>";
						if(value.o_state==0){
							schedule+= "<a href='#' class='state'>입금전</a>"
						}else if(value.o_state==1){
							schedule+= "입금완료"
						}
					});
				schedule+="</td></tr></li></ul>";
				
				var source = "<tr>"
					+"<td id='oneday' colspan='7'>"
					+"<div><table>" 
					+schedule
					+"</table></div>"
					+"</td>";
				
				$(thisNode).parents('tr').after(source);
				$('#oneday').animate({height:'110px'});
			}     
		});  
		
		return false;
	});
});