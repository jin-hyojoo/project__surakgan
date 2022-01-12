$(document).ready(function(){
	$('#morebtn').on('click',function(){
		$('#moreImg').css('display','inline-block');
	});
	
/*	$(this).on('click',function(){
		console.log("클릭했슈");
		var title = $('dt.food_title a').next().text();
		console.log(title);
	});*/
	var cnt = $('#foodcnt').val();
	var more = 0;
	var listcnt = 1;
	$.ajax({
		type:'GET',
		dataType:'json',
		url:'foodMenuList.do',
		data:'c_type='+$('[name=c_type]').val(),
		success:function(res){
			foodMenu(res,listcnt);
		}
	});
	
	$.ajax({
		type:'GET',
		dataType:'json',
		url:'foodList.do',
		data:'c_type='+$('[name=c_type]').val()+'&more='+more,
		success:function(res){
			foodList(res);
			var morebtn ='<a class="morebtn" href="javascript:foodListMore(12)"><span>더보기</span><img id="moreImg" src="images/ajax-loader.gif" style="display: none;"/></a>';
			$('.morebtn').remove();	
			$('#morebtn').append(morebtn);
		}
	});
	
});

//메뉴 목록 
function foodList(res){
	$.each(res,function(index,value){
		var list ='<li><input type="hidden" id="i_no'+value.i_no+'" value="'+value.i_no+'"/><div class="food_img">';
        	list+='<a href="foodDetail.do?i_no='+value.i_no+'"><img alt="" src="product/'+value.i_img+'"></a>';
        	list+='<input type="hidden" id="food_img'+value.i_no+'" value="'+value.i_img+'"/>';
            list+='</div>';
			/*	  <a href="#"><div class="img_discount">	
				  <span class="num">10</span>
        		  <span class="unit">%</span></a></div>	 */	
        	list+='<dl class="foods_list_info">';
        	list+='<dt class="food_title">';
        	list+='<a href="foodDetail.do?i_no='+value.i_no+'"><span id="i_menu'+value.i_no+'">'+value.i_menu+'</span></a></dt>';
        	list+='<dd class="star-rating-box"><span><span></span></span><div class="reivew-count"></div></dd>';
        	list+='<dd class="food_price">';
        	list+='<p class="selling-price'+value.i_no+'"><span id="price'+value.i_no+'">'+value.i_price+'</span><span class="won">원</span></p>';
        	/* <p class="origin-price"><del>8,000원</del></p> */
        	list+='</dd>';
        	list+='<dd class="food_basket">';
        	list+='<div class="food_account">';
        	list+='<label><input type="text" value="1" id="foodcnt'+value.i_no+'"></label>';
        	list+='<span><a class="up" title="수량 더하기" href="javascript:foodCnt(1,'+value.i_no+');">수량 더하기</a>';
        	list+='<a class="down" title="수량 빼기" href="javascript:foodCnt(-1,'+value.i_no+');">수량 빼기</a></span>';
        	list+='</div>';
        	list+='<button class="food_btn" onclick="cart('+value.i_no+');"<span id="food_btn">담기</span></button>';
        $('.foods_list').append(list);	
        /*<a href="javascript:cart('+value.i_no+')"</a>*/
	});
}

//음식 목록 장바구니 저장 이벤트
function cart(i_no){
	var i_no = $('#i_no'+i_no).val();
	var foodcnt = $('#foodcnt'+i_no).val();
	var i_menu = $('span#i_menu'+i_no).text();
	var i_price = $('#price'+i_no).text();
	var i_img = $('#food_img'+i_no).val();
	console.log( i_menu + i_price + i_img + foodcnt +"  :"+i_no);

		$.ajax({
			type:'POST',
			dataType:'json',
			url:'cartsession.do',
			data:JSON.stringify({i_menu:i_menu,i_price:i_price,i_img:i_img,foodcnt:foodcnt,i_gubun:"0",i_no:i_no}),
			contentType:'application/json; charset=utf-8',
			success:function(res){
				alert('장바구니 등록되었습니다.')
				console.log(res);
			},
			error: function(res){
				console.log("error")
			}
		})
}

//음식 메뉴목록 이벤트
function foodMenu(res,listcnt){
	var listcnt = listcnt;
		$.each(res,function(index,value){

			if(value.c_type=="complete"){			
					$('.food_menu').append('<li><a id='+listcnt+' href=javascript:foodSelectList('+listcnt+')>'+'<span>'+value.c_title+'</span></a></li>');
					listcnt++;
		 	}else if(value.c_type=="side"){
		 		var sidecnt = 4;
		 		if(listcnt >4){
					$('.food_menu').append('<li><a id='+listcnt+' href=javascript:foodSelectList('+listcnt+')>'+'<span>'+value.c_title+'</span></a></li>');
					listcnt++;
				}else{
					listcnt = sidecnt;
					$('.food_menu').append('<li><a id='+listcnt+' href=javascript:foodSelectList('+listcnt+')>'+'<span>'+value.c_title+'</span></a></li>');
					listcnt++;
				}
			}else if(value.c_type=="mine"){
				var minecnt = 7;
				if(listcnt > 7){				
					$('.food_menu').append('<li><a id='+listcnt+' href=javascript:foodSelectList('+listcnt+')>'+'<span>'+value.c_title+'</span></a></li>');
					listcnt++;
				}else{
					listcnt = minecnt;
					$('.food_menu').append('<li><a id='+listcnt+' href=javascript:foodSelectList('+listcnt+')>'+'<span>'+value.c_title+'</span></a></li>');
					listcnt++;
				}
			}
	}); 
}

//음식 메뉴 클릭 후 목록 이벤트
function foodSelectList(listcnt){
	var listcnt = listcnt;
	var more = $('#morecnt').val();
	$('.foods_list').empty();
	$.ajax({
		type:'GET',
		dataType:'json',
		url:'foodSelectList.do',
		contentType : 'application/json',
//		data:'c_type='+$('[name=c_type]').val()+'&i_gubun='+listcnt+'&more=0',
		data : {
			c_type : $('[name=c_type]').val(),
			i_gubun : listcnt,
			more : 0
		},
		success:function(res){
			foodList(res);
			var morebtn ='<a class="morebtn" href="javascript:foodSelectListMore(12,'+listcnt+')"><span>더보기</span><img id="moreImg" src="images/ajax-loader.gif" style="display: none;"/></a>';
			$('.morebtn').remove();	
			$('#morebtn').append(morebtn);
			
			$('#morecnt').empty();
			$('#morecnt').val(12);
		}
		
	})
}

//음식 수량 증가 이벤트
function foodCnt(cnt,select){
	var foodcnt =$('#foodcnt'+select).val(); 	
	if(isNaN(foodcnt)){
		alert('숫자만 입력가능 합니다.');
		$('#foodcnt'+select).focus();
		$('#foodcnt'+select).val(1);
		return;
	}else if(foodcnt<1){
		alert('0이하 수량을 입력할 수 없습니다.');
		$('#foodcnt'+select).focus();
		$('#foodcnt'+select).val(1);
		return;
	}
	var cnt = parseInt(foodcnt)+parseInt(cnt);
	$("#foodcnt"+select).val(cnt);
	
};

//음식 더보기 버튼 이벤트
function foodListMore(morecnt){
	var more = $('#morecnt').val();
	$.ajax({
		type:'GET',
		dataType:'json',
		url:'foodList.do',
		data:'c_type='+$('[name=c_type]').val()+'&more='+more,
		success:function(res){
			  foodList(res);
			  var morebtn ='<a class="morebtn" href="javascript:foodListMore(12)"><span>더보기</span><img id="moreImg" src="images/ajax-loader.gif" style="display: none;"/></a>';
			  $('.morebtn').remove();	
			  $('#morebtn').append(morebtn);		  
			}
	})
	var morecnt = parseInt(more)+parseInt(morecnt);
	$('#morecnt').val(morecnt);
}

function foodSelectListMore(morecnt, listcnt){
	var more = $('#morecnt').val();
	$.ajax({
		type:'GET',
		dataType:'json',
		url:'foodSelectList.do',
		data:'c_type='+$('[name=c_type]').val()+'&i_gubun='+listcnt+'&more='+more,
		success:function(res){
			  foodList(res);
				var morebtn ='<a class="morebtn" href="javascript:foodSelectListMore(12,'+listcnt+')"><span>더보기</span><img id="moreImg" src="images/ajax-loader.gif" style="display: none;"/></a>';
				$('.morebtn').remove();	
				$('#morebtn').append(morebtn);
			}
	})
	var morecnt = parseInt(more)+parseInt(morecnt);
	$('#morecnt').val(morecnt);
}