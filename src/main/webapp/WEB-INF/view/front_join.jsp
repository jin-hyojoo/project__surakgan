<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link rel="stylesheet" type="text/css" href="css/front_agree.css"/>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<script type="text/javascript" src="js/front_join.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>수락간 :: 회원가입</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	$('#join_btn').on('click',function(){
	  if($('#u_id').val() == ""){
		  alert('아이디를 입력해주세요');
	  }else if($('#u_pw').val() == ""){
		  alert('비밀번호를 입력해주세요');
	  }else if($('#u_pw2').val() == ""){
		  alert('비밀번호 재입력을 해주세요');
	  }else if($('#u_name').val() == ""){
		  alert('이름을 입력해주세요');
	  }else if($('#u_hp2').val() == ""){
		  alert('전화번호를 입력을해주세요');
	  }else if($('#u_hp3').val() == ""){
		  alert('전화번호를 입력을해주세요');
	  }else{
		alert('가입이 완료되었습니다');
		$('#frmJoin').attr('method','post');
		$('#frmJoin').attr('action','joinPro.do');
		}
	});
}); 
</script>
</head>
<body>
<!-- header -->
 <%@ include file="/inc/front_header.jsp"%>
 <div class="state_a">약관동의</div><div class="state_b">회원가입</div><div class="state_c">가입완료</div> 
 
 <div class="index_wrap wrap_center" style="font-size:13px;">
	<div class="myinfo">		
		<div>
			<form name="frmJoin" id="frmJoin">								
				<div class="member_tbl1">
					<table>
						<tbody>
							<tr>
								<th><label for="u_id"><img class="check" src="images/front_check.jpg"><span>아이디</span></label></th>
								<td>
									<input type="text" name="u_id" id="u_id" class="txt" >
									<!-- <input type="text" name="u_id1" id="u_id1" class="txt" value="">		 -->
									&nbsp;&nbsp;
									<!-- <button class="Check_id"  id="Check_id">중복확인</button>	
									&nbsp; -->
									<span class="sfont3" id="idchk" style="color:gray;">* 6~12자의 영소문자, 숫자만 사용가능합니다.</span>	
								</td>
							</tr>						
							<tr>
								<th><label for="u_pw"><img class="check" src="images/front_check.jpg"><span>비밀번호</span></label></th>
								<td>
									<input type="password" name="u_pw" id="u_pw" class="txt">		
									&nbsp;
									<span class="sfont3" id="pwchk" style="color:gray;">* 8~16자의 영소문자, 숫자만 사용가능합니다.</span>	
								</td>
							</tr>
							<tr>
								<th><label for="u_pw2"><img class="check" src="images/front_check.jpg"><span>비밀번호 확인</span></label></th>
								<td>
									<input type="password" name="u_pw2" id="u_pw2" class="txt">
									&nbsp;
									<font name="check" size="3"></font>
								</td>
							</tr>
							<tr>
								<th><label for="u_name"><img class="check" src="images/front_check.jpg"><span>이름</span></label></th>
								<td>
									<input type="text" name="u_name" id="u_name" maxlength="8" class="txt">											
								</td>
							</tr>
							<tr>
								<th><label for="u_hp2"><img class="check" src="images/front_check.jpg"><span>휴대폰</span></label></th>
								<td>
									<select name="u_hp1" id="u_hp1" style="height:23px;">
									 <option>010</option>
									 <option>011</option>
									 <option>016</option>
									 <option>017</option>
									 <option>019</option>
									</select>
									&nbsp;-&nbsp;		
									<input type="text" name="u_hp2" id="u_hp2" style="width:50px;" maxlength="4" class="txt">&nbsp;-&nbsp;
									<input type="text" name="u_hp3" id="u_hp3" style="width:50px;" maxlength="4" class="txt">
									&nbsp;&nbsp;
									<span class="sfont3" id="phchk" style="color:gray;"></span>
									<!-- <button class="Check_phone"  id="Check_phone">중복확인</button> -->	
									&nbsp;
								</td>
							</tr>
							<tr>
								<th><label for="u_mail1"><img class="check" src="images/front_notcheck.jpg"><span>이메일</span></label></th>
								<td>
									<input type="text" name="u_mail1" id="u_mail1" class="txt">&nbsp;@&nbsp;
									<input type="text" name="u_mail2" id="u_mail2" class="txt" size="20">&nbsp;
									<select name="u_mail3" id="u_mail3" style="height:21px;">
									  <option>선택해주세요</option>
									  <option value="1">직접입력</option>
									  <option>naver.com</option>
									  <option>gmail.com</option>
									  <option>hanmail.net</option>
									  <option>daum.net</option>
									  <option>nate.com</option>
									  <option>							
									</select>	
								</td>
							</tr>
							
							<tr>
							  <th><label for="u_address"><img class="check" src="images/front_notcheck.jpg"><span>주소</span></label></th>
							   <td>
	                            <input type="text" name="u_address1" id="sample4_postcode" placeholder="우편번호">&nbsp;&nbsp;&nbsp;
								<input type="button" id="btn_address" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" name="u_address2"id="sample4_roadAddress" placeholder="도로명주소" ><br>
								<input type="text" name="u_address3"id="sample4_jibunAddress" placeholder="지번주소" >
								<span id="guide" style="color:#999"></span>
							  </td>
						 </tr>
						</tbody>
					</table>
				</div>
				<div class="btn" style="padding:40px 0">
					<span>
					  <input type="submit" id="join_btn" value="가입 완료"/>
					  <button class="btn_red"  style="width:200px;height:70px;font-size:20px;" id="join_not_btn" onclick="history.back(); return false;">가입 취소</button>
					</span>
				</div>
			</form>
		</div>
	</div>
</div>
 <!-- footer -->
 <%@ include file="/inc/front_footer.jsp"%> 
</body>
</html>