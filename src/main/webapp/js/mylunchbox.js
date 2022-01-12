$(document).ready(function() {
	$('.food_img a').on("click", function(){
		return false;
	});
	$('.food_title a').on("click", function(){
		return false;
	});
	
	$('a.gubun').on("click", function(){
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'mylunchboxList.do?i_gubun='+$(this).attr('id'),
			success:function(res){
				$('#products li').remove();
				
				$.each(res, function(index, value) {
					var source = '<li>'
					+'<div class="food_img">'
			        +'<a href="#"><img alt="" src="product/'+value.i_img+'" id="'+value.i_gubun+'" draggable="true" ondragstart="drag(this, event)"></a>'
			        +'</div>'
			        +'<div class="foods_list_info">'
			        +'<div class="food_title">'
			        +'<a href="#"><span>'+value.i_menu+'</span></a>'
			        +'</div>'
			        +'<div class="food_star">'
			        +'<span>열량&nbsp;&nbsp;<strong>'+value.i_kcal+'</strong>kcal</span>'
			        +'<div class="reivew-count"></div>'
			        +'</div>'
			        +'<div class="food_price">'
			        +'<p class="selling-price"><span class="price">'+value.i_price+'</span><span class="won">원</span></p>'
			        +'</div>'
			        +'</div>'
			        +'</li>';
					var template = Handlebars.compile(source);
			         $('#products').append(template(value));
				});
			}
		});
		
		return false;
	});// end ajax
	
	$(document).scroll(function(){
		//console.log($(this).scrollTop());	//106
		if($(this).scrollTop() >= 106){
			$('#topWrap').css({'position':'fixed'});
			$('#bottomWrap').css({'margin-top':'330px'});
		}else{
			$('#topWrap').css({'position':'static'});
			$('#bottomWrap').css({'margin-top':'0'});
		}
	})
});

var drag_img;
function drag(target, food) {
	food.dataTransfer.setData("Text", target.id);
	drag_img = $(target).parents('li');
}

function drop(target, food){
	var id = food.dataTransfer.getData("Text");
	if(id==7){
		if(target.id=="menu5"){
			makeMenu(target);
		}else
			return false;
	}else if(id==8){
		if(target.id=="menu4"){
			makeMenu(target);
		}else
			return false;
	}else{
		if(target.id=="menu4" || target.id=="menu5")
			return false; 
		else{
			makeMenu(target);
		}
	}
}

var menu = new Array();
for(var i=0; i<5; i++){
	menu[i] = new Array();
	menu[i][0] = "";
} 
function makeMenu(target){
	$(target).empty();
	drag_img.find('img').clone().appendTo(target);
	
	var name = drag_img.find('.food_title').find('span').text();
	var price = drag_img.find('.selling-price').find('.price').text();
	var index = target.id.substring(4)-1;
	menu[index][0]=name;
	menu[index][1]=price;
	
	var temp = new Array();
	for(var i=0; i<menu.length-2; i++){
		temp[i] = new Array();
		temp[i][0]="null";
	}
	
	for(var i=0; i<menu.length-2; i++){
		for(var cnt=0; cnt<=i; cnt++){
			if(menu[i][0]!=""){
				if(temp[cnt][0]==menu[i][0]){
					temp[cnt][1]++;
					temp[cnt][2] = menu[i][1] * temp[cnt][1];
					break;
				}else{
					if(temp[cnt][0]!="null")	continue;
					temp[cnt][0]=menu[i][0];
					temp[cnt][1]=1;
					temp[cnt][2]=menu[i][1];
					break;
				}
			}
		}
	}
	
	var tot_price=0;
	$('.bill_content').children().empty();
	for(var i=0; i<menu.length-2; i++){
		if(temp[i][0]!="null"){
			$('.bill_content').children().append('<li><span>'+temp[i][0]+'</span> X <span>'+temp[i][1]+'</span><span>'+temp[i][2]+'원</span></li>');
			tot_price += parseInt(temp[i][2]);
		}
	}
	for(var i=menu.length-2; i<menu.length; i++){
		if(menu[i][0]!=""){
			$('.bill_content').children().append('<li><span>'+menu[i][0]+'</span> X <span>1</span><span>'+menu[i][1]+'원</span></li>');
			tot_price += parseInt(menu[i][1]);
		}
	}
	$('.bill_price strong').text(tot_price);
}
