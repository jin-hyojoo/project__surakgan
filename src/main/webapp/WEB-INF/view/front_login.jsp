<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="utf-8" />
<title>수락간 :: 로그인</title>
<link rel="stylesheet" type="text/css" href="css/front_login.css"/>
<link rel="stylesheet" type="text/css" href="css/front_common.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<script type="text/javascript" src="js/front_login.js"></script>
</head>
<body>
<!-- header -->
 <%@ include file="/inc/front_header.jsp"%> 
 
<div class="front_login_wrap">
  <div class="login_wrap">
  <h2>수락간 입장하기</h2>
   <form id="loginfrm">
    <input class="u_id" id="user_id" name='user_id' placeholder='아이디 입력' type='text'/>
    <input class="u_pw" id="user_pw" name='user_pw' placeholder='비밀번호 입력' type='password'/>
    
    
    <input id="id_save" name='id_save' type="checkbox" value='아이디 저장'><span>아이디 저장</span>
    <input id="login_btn" type='submit' value='로그인'/>
    <a href="findid.do" class="id_find">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="findpw.do" class="pw_find">비밀번호 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="agreeForm.do" class="join">회원가입</a>
    
  </form>
  
  </div>
</div>

<!-- footer -->
 <%@ include file="/inc/front_footer.jsp"%> 
</body>
</html>