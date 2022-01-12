	$(document).ready(function() {

		$('#cart_list').click(function() {
			if ($('#cart_list').prop("checked")) {
				$('[name=cart_item]').prop("checked", true);
			} else {
				$('[name=cart_item]').prop("checked", false);
			}
		})
		
		$('#my_cart_list').click(function() {
			if ($('#my_cart_list').prop("checked")) {
				$('[name=my_cart_item]').prop("checked", true);
			} else {
				$('[name=my_cart_item]').prop("checked", false);
			}
		})

		$('#delete_select').on('click', function() {
			var ischk = false;
			var val = new Array();
			var cnt = 0;
			var cart_menu = null;
			$("input[name=cart_item]:checked").each(function() {
				cart_menu = $('.cart_menu' + $(this).val()).text();
				val[cnt] = cart_menu;
				cnt++;
			});

			jQuery.ajaxSettings.traditional = true;

			console.log(val);
			$.ajax({
				type : 'POST',
				dataType : 'json',
				url : 'memcartselectdel.do',
				data : {
					cl_manu : val
				},
				success : function(res) {
					location.reload();
				},
				error : function(res) {
					alert("삭제할 목록을 선택하세요");
				}
			});

		})
		
		$('#btn_select_receipt_date').click(function(){
			var total=$('#totalPrice').text();
			var listsize = $('[name=cart_item]').is(":checked").length + $('[name=my_cart_item]').is(":checked").length;
			var order_day = new Array();
			var order_time = new Array();
			var listsize = $('#listsize').val();
			var cl_no = new Array();
			
			for(var i=0;i<listsize;i++){
				order_day[i] = $('[name=order_day'+i+']').val();
				order_time[i] = $('[name=order_time'+i+'] option:selected').text();
				cl_no[i] = $('[name=cl_no'+i+']').val();				
			}
			
			jQuery.ajaxSettings.traditional = true; //ajax Array()배열로 보낼때 설정
						
			$.ajax({
				type:'POST',
				dataType:'JSON',
				url:'payment.do',
				data:{order_day:order_day,
					order_time:order_time,
					total:total,
					cl_no:cl_no,
					size:listsize}
			})
		})
	
	});

	function cartcnt(cnt) {
		var cart_cnt = $('.buy_cnt_' + cnt).val();
		var cart_price = $('.cart_price' + cnt).text();
		var cart_sum_price = $('.cart_sum_price' + cnt).text();
		var cart_menu = $('.cart_menu' + cnt).text();
		$.ajax({
			type : 'GET',
			dataType : 'text',
			url : 'memcartcnt.do',
			data : 'cart_cnt=' + cart_cnt + '&price=' + cart_price + '&cnt='
					+ cnt + '&menu=' + cart_menu,
			success : function(res) {
				console.log(res);

				location.reload();
			},
			error : function(res) {
				console.log(res);
			}
		})
	}

	function cartdel(itemNo) {
		var cart_menu = $('.cart_menu' + itemNo).text();
		var name = $('.cart_menu' + itemNo).text();
		var menu = escape($('.cart_menu' + itemNo).text());
		var str = name.replace("&","%26");
		
		$.ajax({
			type : 'GET',
			dataType : 'text',
			url : 'memcartdel.do',
			data : 'itemNo=' + itemNo + '&cl_menu=' + cart_menu+ '&menu=' + str,
			contentType : "Content-Type:text/plain; charset=utf-8",
			success : function(res) {
				$('.cart_item_list' + res).remove();
				location.reload();
			},
			error : function(res) {
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