<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link rel="stylesheet" type="text/css" href="css/mypage_pwcheck.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>수락간 :: 마이페이지</title>
<script type="text/javascript">
$(document).ready(function(){
	$('#check_btn').on('click',function(){
		var chkpw = $('.checkpw').val();
		if(chkpw==""){
			alert('비밀번호를 입력해주세요');
		}else{
			$.ajax({
				type:'POST',
				dataType:'JSON',
				url:'pwcheckpro.do',
				data:{chkpw:chkpw},
				contentType:"Content-Type:text/plain; charset=utf-8",
				success: function(res){
					console.log(res)

/* 					if(chkpw == res){
						$('.chkfrm').attr('action','mypagetab.do');
						$('.chkfrm').submit();
					}else{
						alert("틀린 비밀번호다");
					} */
				
						
				}
			});
			
			
			
			
		}
	})
})
</script>
</head>
<body>
<!-- header -->
 <%@ include file="/inc/front_header.jsp"%>
<div class="pwcheck_wrap">
 <div class="check_wrap">
  <h2>비밀번호 확인</h2>
  <p class="warn">외부로부터 고객님의 정보를 안전하게 보호하기 위하여 비밀번호를 다시 한 번 확인합니다.<br>비밀번호가 타인에게 노출되지 않도록 항상 주의하여 주세요. </p>
  <form name="chkfrm" class="chkfrm" method="POST">
   <input type="password" name="checkpw" class="checkpw" placeholder="비밀번호 입력" />
   <input type="button" id="check_btn" value="확인"/>
   </form>
 </div>
</div> 
<!-- footer -->
 <%@ include file="/inc/front_footer.jsp"%> 
</body>
</html>