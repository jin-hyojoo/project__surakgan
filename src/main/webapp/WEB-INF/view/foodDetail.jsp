<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.Information_CommentDTO"%>
<%@page import="dto.Information_ImageDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.InformationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link href="css/foodDetail.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<script type="text/javascript" src="js/foodDetail.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('#put').on('click',function(){
		cart();
	});
	
});
function cart(){
	var i_no = $('#i_no').val();
	var cnt = $('#amount').val();
	var i_menu = $('#menu').text();
	var i_img = $('#img').val();
	var i_price = $('#tot_price').text();
	console.log(i_menu + i_price + i_img + cnt);
	
	$.ajax({
		type:'POST',
		dataType:'json',
		url:'cartsession.do',
		data:JSON.stringify({i_menu:i_menu,i_price:i_price,i_img:i_img,foodcnt:cnt,i_gubun:"0",i_no:i_no}),
		contentType:'application/json; charset=utf-8',
		success:function(res){
	            console.log(res);
	            alert('장바구니 등록되었습니다.')
		},
		error: function(res){
			console.log("error")
		}
	})
}
</script>
</head>
<body>
<%
	InformationDTO info_dto = (InformationDTO)request.getAttribute("InformationDTO");
	List<Information_ImageDTO> imgList = (ArrayList)request.getAttribute("imgList");
	List<Information_CommentDTO> commList = (ArrayList)request.getAttribute("commList");
	System.out.println(commList.size());
	
%>

	<!-- header -->
	<%@ include file="/inc/front_header.jsp"%> 
 
	<!-- 메인 광고  -->
	<%@ include file="/inc/front_ad.jsp"%>
	
	<div id="content">
		<div id="product_info">
			<div id="photo">
			<input type="hidden" id="i_no" value="<%=info_dto.getI_no()%>">
				<img src="product/<%=info_dto.getI_img() %>" alt="상품" />
				<input type="hidden" id="img" value="<%=info_dto.getI_img() %>">
				<div id="product_imgs">
					<div id="imgs_bg">
						<center>
						  
							<ul class="proBox">
							<%for(Information_ImageDTO dto : imgList) {
								if(dto.getIi_state() == 0){%>
								<li><a href="#"><img src="product/<%=dto.getIi_image() %>" alt="1" /></a></li>
							<%	}
							  }%>
							</ul>
						</center>
						<p class="prev_btn">
							<a href="#"> <img src="images/left_btn.png" alt="이전으로 이동" /></a>
						</p>
						<p class="next_btn">
							<a href="#"> <img src="images/right_btn.png" alt="다음으로 이동" /></a>
						</p>
					</div>
				</div>
			</div>
			<!-- end product_imgs -->
			<div id="text">
				<div id="info">
					<h1 id="menu"><%=info_dto.getI_menu() %></h1><p/>
					<table>
						<tr>
							<th>칼로리</th>
							<td><%=info_dto.getI_kcal() %></td>
						</tr>
						<tr>
							<td colspan="2"><label class="price"><h1 id="one_price"><%=info_dto.getI_price() %></h1>원</label></td>
						</tr>
					</table>
				</div>
				<hr />
				<form onsubmit="return false;">
					<table id="quantity">
						<tr>
							<th>수량</th>
							<td>
								<div>
									<label><input type="text" name="amount" id="amount" value="1" size="1px" /></label>
									<span>
										<a href="#" id="up">up</a>
										<a href="#" id="down">down</a>
									</span>
								</div>
							</td>
						</tr>
					</table>
					<!-- end quantity -->
					<hr />
					<div class="price">
						<span><strong>총 상품금액</strong>&nbsp;&nbsp;</span>
						<h1 id="tot_price"><%=info_dto.getI_price() %></h1>원
					</div>
					<!-- end tot_price -->
					<% if(info_dto.getI_state()==0){  %>
						<button type="button" id="put">담기</button>
					<% }else if(info_dto.getI_state()==1){ %>
						<button type="button" id="soldout">품절</button>
					<% } %>
				</form>
			</div>
			<!-- end text -->
		</div>
		<!-- end product_info -->

		<div id="content_detail">
			<center>
				<ul class="detailBox">
				<%for(Information_ImageDTO dto : imgList) {
					if(dto.getIi_state() == 1){%>
						<li><img src="product/<%=dto.getIi_image() %>" alt="1" /></li>
					<%	}
				 }%>
				</ul>
			</center>
		</div>
		<div id="comment">
		<p>후기</p>
		<hr>
		<input type="hidden" id="i_no" value="<%=info_dto.getI_no() %>" />
		<input type="hidden" id="u_no" value="<%=session.getAttribute("u_no") %>" />
		<div id="comment_write">
			<div id="left_write">
				<div class="starscore_bg" id="event_star">
					<div class="starscore" id="write_star" style="width: 0;"></div>
				</div>
			</div>
			<div id="right_write">
				<textarea cols="99" rows="4" title="댓글 입력" name="ic_content" id="ic_content" maxlength="300" wrap="hard"></textarea>
				<button type="button" id="ic_write" >쓰기</button>
			</div>
		</div>
		
		<ul id="comment_box">
		<%
			for(Information_CommentDTO dto : commList) { 
				String pattern = "yyyy-MM-dd";
				SimpleDateFormat sdf = new SimpleDateFormat(pattern);
				String date = sdf.format(dto.getIc_regdate());
		%>
			<li>
				<div class="left_comment">
					<div class="starscore_bg">
						<div class="starscore" style="width: <%=dto.getIc_star()*20 %>%;"></div>
					</div> 
					<div class="c_id"><%=dto.getU_id() %></div>
				</div>
				<div class="right_comment">
					<div class="c_content"><%=dto.getIc_content() %></div>
					<div class="reg_date"><%=date %></div>
				</div>
			</li>
		<%	}	%>
		</ul>
		</div>

	</div>
	
	<!-- footer -->
 	<%@ include file="/inc/front_footer.jsp"%> 

</body>
</html>