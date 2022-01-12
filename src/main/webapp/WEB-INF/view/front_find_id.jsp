<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수락간 :: 아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="css/front_find_id.css"/>
<link rel="stylesheet" type="text/css" href="css/front_common.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	 
	 $('#find_id').on('click',function(){
		
		 if($('#user_name').val()==""){
			 alert('이름을 입력해주세요');
			 $('#user_name').focus();
		 }else if($('#u_hp2').val()==""){
			alert('전화번호를 입력해주세요'); 
			$('#u_hp2').focus();
		 }else if($('#u_hp3').val()==""){
			alert('전화번호를 입력해주세요'); 
			$('#u_hp3').focus();
		 }else{
		 
		 var u_hp1 = $('#u_hp1 option:selected').val();
	     var u_hp2 = $('#u_hp2').val();
	     var u_hp3 = $('#u_hp3').val();
	     var u_hp = u_hp1+"-"+u_hp2+"-"+u_hp3;
		 var u_name=$('input#user_name').val();
         
		 $.ajax({
			 type:'POST',
			 dataType:'json',
			 url:'findproid.do',
			 data:JSON.stringify({u_name:u_name, u_hp:u_hp}),
			 contentType:'application/json; charset=utf-8',
			 success: function(res){
				 console.log(res);
				 var json = JSON.stringify(res);
				 var obj = JSON.parse(json);
				 
				 $('#findid').remove();
				 $('#find_res').append('<p>귀하의 아이디는 '+obj.u_id+'입니다</p>');
                 $('#find_id').remove();
				 $('#find_btn').append('<a href="loginform.do" style="margin-left:32%">로그인하기 </a>|<a href="findpw.do"> 비밀번호 찾기</a>');
				 
			 },
			 error : function(res){
				 console.log("error"+res);
			 }
		 })
	 }
	 })
	 
 })
</script>
</head>
<body>
<!-- header -->
 <%@ include file="/inc/front_header.jsp"%> 
<div class="find_id_wrap">
<div class="front_find_id_wrap">
 <h2>아이디 찾기</h2>
  <p id="find_res"></p>
  <form id="findid" method="post">
         이름<input id="user_name" type="text" value="" /><br>
         전화번호<select name="u_hp1" id="u_hp1">
			    <option>010</option>
				<option>011</option>
		        <option>016</option>
		        <option>017</option>
			    <option>019</option>
				</select>
				-
			    <input type="text" name="u_hp2" id="u_hp2"/>
			    -
			    <input type="text" name="u_hp3" id="u_hp3"/>
			    
  </form> 
   <div id="find_btn"></div>
    <input id="find_id" type="submit" value='아이디 찾기'>
  </div>
</div>
<!-- footer -->
 <%@ include file="/inc/front_footer.jsp"%> 
</body>
</html>