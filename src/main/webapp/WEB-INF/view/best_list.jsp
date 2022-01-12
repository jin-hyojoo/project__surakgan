<%@page import="dto.InformationDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<InformationDTO> vlist = (List<InformationDTO>)request.getAttribute("vlist"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link rel="stylesheet" type="text/css" href="css/foodList.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/config.js"></script>

<script type="text/javascript">

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

function cart(i_no){
	var foodcnt = $('#foodcnt'+i_no).val();
	var i_menu = $('span#i_menu'+i_no).text();
	var i_price = $('#price'+i_no).text();
	var i_img = $('#food_img'+i_no).val();
	console.log( i_menu + i_price + i_img + foodcnt);

		$.ajax({
			type:'POST',
			dataType:'json',
			url:'cartsession.do',
			data:JSON.stringify({i_menu:i_menu,i_price:i_price,i_img:i_img,foodcnt:foodcnt,i_gubun:"0"}),
			contentType:'application/json; charset=utf-8',
			success:function(res){
				console.log(res);
			},
			error: function(res){
				console.log("error")
			}
		})
}
</script>
<title>수락간 :: 최고의 수락간</title>
</head>
<body>
  <!-- header -->
 <%@ include file="/inc/front_header.jsp"%> 

<div class="best_list_wrap">
<!-- <h2>최고의 수락간</h2>
<p>가장 인기있는 수락간의 메뉴를 선보입니다</p> -->
<div class="wrap">
    <div class="content"> 
	   <ul class="foods_list" id="products">
        <%for(int i=0; i<vlist.size(); i++){ %>
		 <li><div class="food_img">
        	<img alt="" src="product/<%= vlist.get(i).getI_img() %>">
        	<input type="hidden" id="food_img'+value.i_no+'" value="<%= vlist.get(i).getI_img() %>"/>
            </div>
<!-- 			<a href="#"><div class="img_discount">	
			<span class="num">10</span>
        	<span class="unit">%</span></a></div> -->
        	<dl class="foods_list_info">
        	<dt class="food_title">
        	<a href="foodDetail.do?i_no='+value.i_no+'"><span id="i_menu'+value.i_no+'"><%= vlist.get(i).getI_menu() %></span></a></dt>
        	<!-- <dd class="star-rating-box"><span><span></span></span><div class="reivew-count"></div></dd> -->
        	<dd class="food_price">
        	<p class="selling-price'+value.i_no+'"><span id="price'+value.i_no+'"><%= vlist.get(i).getI_price() %></span><span class="won">원</span></p>
        	</dd>
        	<dd class="food_basket">
        	<div class="food_account">
        	<label><input type="text" value="1" id="foodcnt'+value.i_no+'"></label>
        	<span><a class="up" title="수량 더하기" href="javascript:foodCnt(1,'+value.i_no+');">수량 더하기</a>
        	<a class="down" title="수량 빼기" href="javascript:foodCnt(-1,'+value.i_no+');">수량 빼기</a></span>
        	</div>
        	<button class="food_btn"><a href="javascript:cart('+value.i_no+')"><span id="food_btn">담기</span></a></button>
        	</dd></dl></li>
      <%} %>  
     </ul>
    </div> 
    </div>
</div>    
    
    
     <!-- header -->
 <%@ include file="/inc/front_footer.jsp"%> 

</body>
</html>