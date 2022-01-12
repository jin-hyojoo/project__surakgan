<%@page import="dto.NoticeDTO"%>
<%@page import="dto.InformationDTO" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% List<NoticeDTO> list = (List<NoticeDTO>)request.getAttribute("list"); 
   List<InformationDTO> ilist = (List<InformationDTO>)request.getAttribute("ilist");
   List<InformationDTO> blist = (List<InformationDTO>)request.getAttribute("blist");
   List<InformationDTO> slist = (List<InformationDTO>)request.getAttribute("slist");
%>
<html>
<head>
<meta charset="UTF-8">
<title>수락간 :: 하루세끼 든든한 도시락</title>
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link href="css/jquery.bxslider.css" rel="stylesheet" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/config.js"></script>
</head>
<body>
 
  <!-- header -->
 <%@ include file="/inc/front_header.jsp"%> 
 
  <!-- 메인 광고  -->
 <%@ include file="/inc/front_ad.jsp"%>
  
<!-- 공지 사항  -->
 <div class="content">
   <div class="king_notice_wrap">
     <div class="king_notice">
       <div class="category">
          <span class="category_name">공지사항</span>
       </div>
       <div class="notice_bx">
         <ul class="noticeList">
          <%for(int i=0;i<list.size();i++){ %>
          <li><a href="mynoticeView.do?n_no=<%=list.get(i).getN_no()%>"><%=list.get(i).getN_title()%></a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
          &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
          <fmt:formatDate value="<%=list.get(i).getN_regdate()%>" pattern="yyyy-MM-dd"/></li>
          <%} %>
         </ul>
       </div>
       
     <a href="NoticeList.do" class="more_btn">더보기 <img src="images/more_arrow_ico.png" /></a>
     </div>
   </div>
 </div> 
 
  <!--best 메뉴-->	
<div id="best_list_wrap">
  <div class="title_big">
    <h2>최고의 수락간</h2>
 </div>
 <div class="title_small">
    <p>수락간 최고의 메뉴를 소개합니다</p>
    </div>
 <div class="best_img" >
      <ul class="best_bx">
      <li>
      <ul>
     <%for(int i=0;i<4;i++){ %>
     	<li class="slide_li"><a href="foodDetail.do?i_no=<%= ilist.get(i).getI_no()%>">
		<div class="food_img">
		<img src="product/<%= ilist.get(i).getI_img() %>">
		</div>
		<dl class="foods_list_info">
		<span><%= ilist.get(i).getI_menu() %></span>
		<dt class="food_title"></dt>
		<dd class="food_price">
    	<p class="selling-price"><%=ilist.get(i).getI_price() %><span class="won">원</span></p>
    	</dd></dl></a><li>
      <%} %> 
      </ul>
      </li>
      <li>
      <ul>
     <%for(int i=4;i<8;i++){ %>
     	<li class="slide_li"><a href="foodDetail.do?i_no=<%= ilist.get(i).getI_no()%>">
		<div class="food_img">
		<img src="product/<%= ilist.get(i).getI_img() %>">
		</div>
		<dl class="foods_list_info">
		<span><%= ilist.get(i).getI_menu() %></span>
		<dt class="food_title"></dt>
		<dd class="food_price">
    	<p class="selling-price"><%=ilist.get(i).getI_price() %><span class="won">원</span></p>
    	</dd></dl></a><li>
      <%} %> 
      </ul>     
      </li>
      <li>
      <ul>
     <%for(int i=8;i<12;i++){ %>
     	<li class="slide_li"><a href="foodDetail.do?i_no=<%= ilist.get(i).getI_no()%>">
		<div class="food_img">
		<img src="product/<%= ilist.get(i).getI_img() %>">
		</div>
		<dl class="foods_list_info">
		<span><%= ilist.get(i).getI_menu() %></span>
		<dt class="food_title"></dt>
		<dd class="food_price">
    	<p class="selling-price"><%=ilist.get(i).getI_price() %><span class="won">원</span></p>
    	</dd></dl></a><li>
      <%} %> 
      </ul>
      </li>
      </ul>
 </div>    
     <a href="bestlistview.do" class="best_more">
        <span>최고의 수락간 더보기</span>
     </a>  
     </div>
 
<!-- 고기메뉴 -->
 <div class="gogi">
   <a href="foodListIndex.do?c_type=complete"><img src="images/front_gogi.png"></a>
 </div>
    
  <!--도시락 -->
		<div id="box_list_wrap" >
		 <div class="title_big">
		    <h2>새로운 도시락</h2>
		 </div>
		 <div class="title_small">
		    <p>수락간의 새로운 도시락을 소개합니다</p>
		 </div>
		   
		     <div class="box_img" >
		     <ul class="box_bx">
		      <li>
		      <ul>
		     <%for(int i=0;i<4;i++){ %>
		     	<li class="slide_li"><a href="foodDetail.do?i_no=<%= blist.get(i).getI_no()%>">
				<div class="food_img">
				<img src="product/<%= blist.get(i).getI_img() %>">
				</div>
				<dl class="foods_list_info">
				<span><%= blist.get(i).getI_menu() %></span>
				<dt class="food_title"></dt>
				<dd class="food_price">
		    	<p class="selling-price"><%=blist.get(i).getI_price() %><span class="won">원</span></p>
		    	</dd></dl></a><li>
		      <%} %> 
		      </ul>
		      </li>
		      <li>
		      <ul>
		     <%for(int i=4;i<8;i++){ %>
		     	<li class="slide_li"><a href="foodDetail.do?i_no=<%= blist.get(i).getI_no()%>">
				<div class="food_img">
				<img src="product/<%= blist.get(i).getI_img() %>">
				</div>
				<dl class="foods_list_info">
				<span><%= blist.get(i).getI_menu() %></span>
				<dt class="food_title"></dt>
				<dd class="food_price">
		    	<p class="selling-price"><%=blist.get(i).getI_price() %><span class="won">원</span></p>
		    	</dd></dl></a><li>
		      <%} %> 
		      </ul>     
		      </li>
		      <li>
		      <ul>
		     <%for(int i=8;i<12;i++){ %>
		     	<li class="slide_li"><a href="foodDetail.do?i_no=<%= blist.get(i).getI_no()%>">
				<div class="food_img">
				<img src="product/<%= blist.get(i).getI_img() %>">
				</div>
				<dl class="foods_list_info">
				<span><%= blist.get(i).getI_menu() %></span>
				<dt class="food_title"></dt>
				<dd class="food_price">
		    	<p class="selling-price"><%=blist.get(i).getI_price() %><span class="won">원</span></p>
		    	</dd></dl></a><li>
		      <%} %> 
		      </ul>
		      </li>
		      </ul>
		    
		     </div>  
		     
		         </div>	
  <!-- 채식메뉴 -->
 <div class="veg">
    <a href="foodSelectList.do?c_type=complete&i_gubun=2"><img src="images/front_veg.png"></a>
 </div>
 
  <!--곁들임 -->
 <div id="side_list_wrap" >
 <div class="title_big">
    <h2>새로운 곁들임</h2>
 </div>
 <div class="title_small">
    <p>수락간의 새로운 곁들임을 소개합니다</p>
 </div>
   
       <div class="side_img" >
		     <ul class="side_bx">
		      <li>
		      <ul>
		     <%for(int i=0;i<3;i++){ %>
		     	<li class="slide_li"><a href="foodDetail.do?i_no=<%= slist.get(i).getI_no()%>">
				<div class="food_img">
				<img src="product/<%= slist.get(i).getI_img() %>">
				</div>
				<dl class="foods_list_info">
				<span><%= slist.get(i).getI_menu() %></span>
				<dt class="food_title"></dt>
				<dd class="food_price">
		    	<p class="selling-price"><%=slist.get(i).getI_price() %><span class="won">원</span></p>
		    	</dd></dl></a><li>
		      <%} %> 
		      </ul>
		      </li>
		      <li>
		      <ul>
		     <%for(int i=4;i<8;i++){ %>
		     	<li class="slide_li"><a href="foodDetail.do?i_no=<%= slist.get(i).getI_no()%>">
				<div class="food_img">
				<img src="product/<%= slist.get(i).getI_img() %>">
				</div>
				<dl class="foods_list_info">
				<span><%= slist.get(i).getI_menu() %></span>
				<dt class="food_title"></dt>
				<dd class="food_price">
		    	<p class="selling-price"><%=slist.get(i).getI_price() %><span class="won">원</span></p>
		    	</dd></dl></a><li>
		      <%} %> 
		      </ul>     
		      </li>
		      <li>
		      <ul>
		     <%for(int i=8;i<12;i++){ %>
		     	<li class="slide_li"><a href="foodDetail.do?i_no=<%= slist.get(i).getI_no()%>">
				<div class="food_img">
				<img src="product/<%= slist.get(i).getI_img() %>">
				</div>
				<dl class="foods_list_info">
				<span><%= slist.get(i).getI_menu() %></span>
				<dt class="food_title"></dt>
				<dd class="food_price">
		    	<p class="selling-price"><%=slist.get(i).getI_price() %><span class="won">원</span></p>
		    	</dd></dl></a><li>
		      <%} %> 
		      </ul>
		      </li>
		      </ul>
		    
		     </div>  
     
         </div>
   <!-- footer -->
 <%@ include file="/inc/front_footer.jsp"%> 
</body>
</html>