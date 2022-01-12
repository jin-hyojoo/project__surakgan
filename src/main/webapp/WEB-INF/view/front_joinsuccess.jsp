<%@page import="dto.UsersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link rel="stylesheet" type="text/css" href="css/front_joinsuccess.css">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수락간 :: 회원가입을 축하드립니다</title>

</head>
<body>
<!-- header -->
 <%@ include file="/inc/front_header.jsp"%>
 
  <div class="state_a">약관동의</div><div class="state_b">회원가입</div><div class="state_c">가입완료</div> 
  <div class="index_wrap wrap_center" style="font-size:13px;">
	
	<div class="myinfo">		
		<div class="intro">
		   <div class="join_info">
               <img class="intro_pic_01" alt="intro" src="images/front_join_final_01.png">
		       <span>${u_name}님 회원가입을 축하드립니다!!</span>
		       <br>&nbsp;<br>
		       <img class="intro_pic_02" alt="intro" src="images/front_join_final_02.png">

		   </div>
		   
		  
		</div>
			<a href="loginform.do" class="login_btn"><span class="login_btn2">수락간 입장하기</span></a>
	</div>
</div>
 
 
  <!-- footer -->
 <%@ include file="/inc/front_footer.jsp"%> 
</body>
</html>