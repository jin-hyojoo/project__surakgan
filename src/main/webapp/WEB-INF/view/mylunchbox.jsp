<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.InformationDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link href="css/mylunchbox.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script type="text/javascript" src="js/header.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<script type="text/javascript" src="js/mylunchbox.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#order').on('click',function(){
		var content = $('.bill_content').find('li').children('span:first-child').text();
		var price =$('.bill_price span strong').text();
		var day = $('[name=order_day]').val();
		var when = $('[name=order_time] option:selected').text();
		$.ajax({
			type:'POST',
			dataType:'json',
			url:'myfood.do',
			data:JSON.stringify({content:content,price:price,day:day,when:when}),
			contentType:"application/json; charset=utf-8",
			success:function(res){
				alert('담기 완료');
			}
		})
	});
});
</script>
</head>
<body>
  <!-- header -->
 <%@ include file="/inc/front_header.jsp"%> 
 
<%
	List<InformationDTO> aList = (ArrayList)request.getAttribute("aList");

	//오늘 날짜 저장.
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
	String today = sdf.format(todayCal.getTime());
	
	//다음달 마지막날
	todayCal.add(Calendar.MONTH, 1);
	int maxdate = todayCal.getMaximum(Calendar.DAY_OF_MONTH)-(todayCal.get(Calendar.DAY_OF_MONTH)+1);
	todayCal.add(Calendar.DAY_OF_MONTH, maxdate);
	String maxday = sdf.format(todayCal.getTime());
%>
	<div id="content">
		<div id="topWrap">
			<form action="/action_page.php">
				<div id="lunchbox">
					<p>주문하실 음식을 드래그해서 식판에 올려주세요</p>
					<img src="images/lunchbox.jpg" alt="도시락">
					<div id="menu1" ondrop="drop(this, event)" ondragover="return false"></div>
					<div id="menu2" ondrop="drop(this, event)" ondragover="return false"></div>
					<div id="menu3" ondrop="drop(this, event)" ondragover="return false"></div>
					<div id="menu4" ondrop="drop(this, event)" ondragover="return false"></div>
					<div id="menu5" ondrop="drop(this, event)" ondragover="return false"></div>
				</div> 
				<div id="bill">
					<div class="bill_date">
						<input type="date" name="order_day" value="<%=today%>" min="<%=today%>" max="<%=maxday%>">
						<select name="order_time">
							<option value="moning">아침</option>
							<option value="lunch">점심</option>
							<option value="dinner">저녁</option>
						</select>
					</div>
					<div class="bill_content">
						<ul>
						</ul>
					</div>
					<div class="bill_price">
						<span><strong>0</strong>원</span><button type="button" id="order">주문</button>
					</div>
				</div>
			</form>
		</div>

		<div id="bottomWrap">
			<ul class="foods_menu">
				<li><a href="#" class="gubun" id="0">전체보기</a></li>
				<li><a href="#" class="gubun" id="7">국/찌개/탕</a></li>
				<li><a href="#" class="gubun" id="8">밥/죽/면</a></li>
				<li><a href="#" class="gubun" id="9">김치</a></li>
				<li><a href="#" class="gubun" id="10">고기반찬</a></li>
				<li><a href="#" class="gubun" id="11">야채반찬</a></li>
			</ul>
			<ul class="foods_list" id="products">
				<%
					for(InformationDTO dto : aList){
				%>
				<li>
			        <div class="food_img">
			          <a href="#"><img alt="" src="product/<%=dto.getI_img()%>" id="<%=dto.getI_gubun()%>" draggable="true" ondragstart="drag(this, event)"></a>
			        </div>
			        
			       <div class="foods_list_info">
			         <div class="food_title">
			           <a href="#"><span><%=dto.getI_menu() %></span></a>
			         </div>
			         <div class="food_star">
			           <span>열량&nbsp;&nbsp;<strong><%=dto.getI_kcal() %></strong>kcal</span>
			           <div class="reivew-count"></div>
			         </div>
			         <div class="food_price">
			           <p class="selling-price"><span class="price"><%=dto.getI_price() %></span><span class="won">원</span></p>
			         </div>
			       </div>
				</li>
				<%	} %>
				
		    </ul>
		</div>
	</div>
	
	<!-- footer -->
 	<%@ include file="/inc/front_footer.jsp"%> 
</body>
</html>