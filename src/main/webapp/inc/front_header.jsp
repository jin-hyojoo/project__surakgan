<%@page import="service.InformationService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Cart_ListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	<!-- 로그인 영역 -->
	  <c:choose>
	   <c:when test="${sessionScope.u_id==null}">
	    <div class="top">
	     <a href="loginform.do" class="login">로그인</a>&nbsp;&nbsp;|&nbsp;
         <a href="agreeForm.do" class="join">회원가입</a>&nbsp;|&nbsp;
         <a href="cartform.do">장바구니 </a>
	     <a href="https://www.instagram.com/king_of_lunch/" class="insta"><img alt="인스타그램" src="images/insta_logo.png"></a>
	     <a href="#" class="face"><img alt="페이스북" src="images/face_logo.png"></a>
	    </div> 
	   </c:when>
	   
	   <c:otherwise>
	    <div class="logintop" style="margin-left: 55%; font-size: 17px; margin-bottom: 10px;margin-top: 10px;">
	     ${sessionScope.u_name}님 오늘도 수락간과 건강한하루 보내세요 :)&nbsp;&nbsp;|&nbsp;<a href="membercartform.do">장바구니 </a>
	     &nbsp;|&nbsp;<a href="mypage.do">마이페이지 </a>
	     &nbsp;|&nbsp;<a href="logout.do">로그아웃 </a>
	     <a href="#" class="insta"><img alt="인스타그램" src="images/insta_logo.png"></a>
	     <a href="#" class="face"><img alt="페이스북" src="images/face_logo.png"></a>
	    </div>
	   </c:otherwise>
	  </c:choose>
   
   <div class="wrap">
	    <!-- 헤더 -->
		<div id="header" class="front_header">
			<div class="front_header_wrap">
				<div class="king_nav_wrap">
					<!-- gnb -->
					<ul class="king_nav" id="gnb">
				    <li class="king_logo">
						    	<a href="foodindex.do"><img src="images/header_logo.PNG"
						     		alt="KING" /></a>
						</li>
						<li class="king_menu">
							<a href="#"><img src="images/dot.PNG">&nbsp;차림표</a>
						</li>
						<li class="king_store">
							<a href="foodstore.do"><img src="images/dot.PNG"/>&nbsp;수락간 찾기</a>
						</li>
						<li class="king_event">
							<a href="#"><img src="images/dot.PNG"/>&nbsp;특식</a>
						</li>
						<li class="king_qna">
							<a href="#"><img src="images/dot.PNG"/>&nbsp;고객센터</a>
						</li>
				 		
						    
					</ul>
					<!-- gnb - 펼침 -->
					<div id="nav_total">
						<div id="nav_total_in"> 
							<ul class="king_menu_list">
								<li><a href="foodListIndex.do?c_type=complete">도시락</a></li>
				          		<li><a href="foodListIndex.do?c_type=side">사이드메뉴</a></li>
								
							</ul>
							
							<ul class="king_store_list">
								<li><a href="foodstore.do">수락간 찾기</a></li>
							</ul>
							
							<ul class="king_event_list">
								<li>						<c:choose>
									<c:when test="${sessionScope.u_id==null}">
									<li><a id="myfood" href="loginform.do">나만의 도시락</a>
									</c:when>
									<c:otherwise>
									<li><a id="myfood" href="mylunchbox.do">나만의 도시락</a>
									</c:otherwise>
								</c:choose>
								</li>
							</ul>
							
							<ul class="king_event_qna">
								<li><a href="NoticeList.do">공지사항</a></li>
								<li><a href="QnaList.do">질문과 답변</a></li>
							</ul>
							
						</div>
					</div>
				</div>
				
				
			</div>
			<span class="haeder_bg"></span>
		</div>
	</div>
	
	