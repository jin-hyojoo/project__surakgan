<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link rel="stylesheet" type="text/css" href="css/front_join.css"/>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>수락간 :: 회원가입</title>

<script type="text/javascript">
$(document).ready(function(){	
	$('#btnGoJoin').on('click', checkJoinTerms);  //약관 동의 버튼

});

//가입 약관 확인 및 회원가입 폼 이동
function checkJoinTerms(){
	if(!$('#chkrule1').prop('checked')){
		alert("서비스 이용약관에 동의해 주세요.");
		return false;
	}
	$('form').prop('action','joinform.do');
	$('form').submit();
}//end checkJoinTerms()
</script>
</head>
<body>
<!-- header -->
 <%@ include file="/inc/front_header.jsp"%>
  <div class="state_a">약관동의</div><div class="state_b">회원가입</div><div class="state_c">가입완료</div> 
 
 
<div class="index_wrap wrap_center" style="font-size:13px;">

<form method="post">
<div id='wrap_deed'> 
   <div id='wrap'>
	<div  class='coverbox' >
	<h3 style="font-size: 24px">※ 서비스 이용약관 동의(필수)</h3><br>
	<%@ include file="joinRule1.jsp" %>
	</div>
	<div style="text-align:right;padding:10px 0;">
	<input type="checkbox" id="chkrule1" name="chkrule1" value="1"><label for="chkrule1">서비스 이용약관에 동의합니다.(필수)</label>
	</div>
	<p></p>	
	<div class='coverbox' >
	<h3 style="font-size: 24px">※ 개인정보 수집 및 이용 동의(선택)</h3><br>
	<%@ include file="joinRule2.jsp" %>
	</div>
	<div style="text-align:right;padding-top:10px;">
	<input type="checkbox" id="chkrule2" name="chkrule2" value="1"><label for="chkrule2">개인정보 수집 및 이용에 동의합니다.(선택)</label>
	</div>
	
	<p>&nbsp;</p>
	<div class="btn">
		<button class="btn_red"  style="width:200px;height:70px;font-size:20px;" id="btnGoJoin">동의</button>
		<button class="btn_red"  style="width:200px;height:70px;font-size:20px;" id="btnNotJoin" onclick="history.back(); return false;">동의 안함</button>
	</div> 
</div>
</div>
</form>
	
</div>
<!-- footer -->
 <%@ include file="/inc/front_footer.jsp"%> 
</body>
</html>