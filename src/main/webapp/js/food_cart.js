$(document).ready(function(){
	
	$('#cart_list').click(function(){
		if($('#cart_list').prop("checked")){
			$('input[type=checkbox]').prop("checked",true);
		}else{
			$('input[type=checkbox]').prop("checked",false);
		}
	})

 	$('#delete_select').on('click',function(){
 		var ischk = false;
 		var val = new Array();
 		var cnt = 0;
 		
		$("input[name=cart_item]:checked").each(function() {
	 		 val[cnt] = $(this).val();
	 		 cnt++;
		});
				
		console.log(val);
 		$.ajax({
			type:'POST',
			dataType:'json',
			url:'cartselectdel.do',
			data:{itemNo:val},
			success:function(res){
				$('.cart_item_list'+res).remove();
				location.reload();
			},
			error:function(res){
				alert("삭제할 목록을 선택하세요");
			}
		});

	}) 


	
});

function cartcnt(cnt){
	var cart_cnt = $('.buy_cnt_'+cnt).val();
	var cart_price = $('.cart_price'+cnt).text();
	var cart_sum_price = $('.cart_sum_price'+cnt).text();
	$.ajax({
		type:'GET',
		dataType:'text',
		url:'cartcnt.do',
		data:'cart_cnt='+cart_cnt+'&price='+cart_price+'&cnt='+cnt,
		success:function(res){
			console.log(res);
/* 			$('.cart_sum_price'+cnt).empty();
			$('.cart_sum_price'+cnt).html(res); */
			location.reload();
		},
		error:function(res){
			console.log(res);
		}
	})
}

function cartdel(itemNo){
	console.log(itemNo);
	$.ajax({
		type:'GET',
		dataType:'text',
		url:'cartdel.do',
		data:'itemNo='+itemNo,
		contentType:"Content-Type:text/plain; charset=utf-8",
		success:function(res){
			$('.cart_item_list'+res).remove();
			location.reload();
		},
		error:function(res){
			console.log(res);
		}
	})
}


	function Today(year,mon,day){
	     if(year == "null" && mon == "null" && day == "null"){       
	     today = new Date();
	     this_year=today.getFullYear();
	     this_month=today.getMonth();
	     this_month+=1;
	     if(this_month <10) this_month="0" + this_month;
	 
	     this_day=today.getDate();
	     if(this_day<10) this_day="0" + this_day;     
	 }
	 else{  
	     var this_year = eval(year);
	     var this_month = eval(mon); 
	     var this_day = eval(day);
	     }
	 
	  montharray=new Array(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31); 
	  maxdays = montharray[this_month-1]; 
	// 아래는 윤달을 구하는 것
	  if (this_month==2) { 
	      if ((this_year/4)!=parseInt(this_year/4)) maxdays=28; 
	      else maxdays=29; 
	  } 
	 
	 document.writeln("<select name='year' size=1 onChange='dateSelect(this.form,this.form.month.selectedIndex);'>");
	     for(i=this_year-5;i<this_year+6;i++){// 현재 년도에서 과거로 5년까지 미래로 5년까지를
												// 표시함
	         if(i==this_year) document.writeln("<OPTION VALUE="+i+ " selected >" +i); 
	         else document.writeln("<OPTION VALUE="+i+ ">" +i); 
	     }    
	 document.writeln("</select>년");      

	 
	 document.writeln("<select name='month' size=1 onChange='dateSelect(this.form,this.selectedIndex);'>");
	     for(i=1;i<=12;i++){ 
	         if(i<10){
	             if(i==this_month) document.writeln("<OPTION VALUE=0" +i+ " selected >0"+i); 
	             else document.writeln("<OPTION VALUE=0" +i+ ">0"+i);
	         }         
	         else{
	             if(i==this_month) document.writeln("<OPTION VALUE=" +i+ " selected >" +i);  
	             else document.writeln("<OPTION VALUE=" +i+ ">" +i);  
	         }                     
	    }         
	 document.writeln("</select>월");
	 
	 document.writeln("<select name='day' size=1>");
	     for(i=1;i<=maxdays;i++){ 
	         if(i<10){
	             if(i==this_day) document.writeln("<OPTION VALUE=0" +i+ " selected >0"+i); 
	             else document.writeln("<OPTION VALUE=0" +i+ ">0"+i); 
	         }
	         
	         else{
	             if(i==this_day) document.writeln("<OPTION VALUE=" +i+ " selected } >"+i); 
	             else document.writeln("<OPTION VALUE=" +i+ ">" +i);  
	         }                     
	    }         
	 document.writeln("</select>일"); 
	   
	}