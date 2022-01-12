<%@page import="java.util.StringTokenizer"%>
<%@page import="dto.UsersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<% UsersDTO dto = (UsersDTO)request.getAttribute("list"); 
String hp = dto.getU_hp();
String arr[] = hp.split("-");

String mail=dto.getU_mail();
String marr[] = mail.split("-");

String address = dto.getU_address();
String aarr[] = address.split("-");
%>

<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link rel="stylesheet" type="text/css" href="css/mypage_tab.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<script type="text/javascript" src="js/mypage_tab.js"></script>
<script type="text/javascript" src="js/front_join.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수락간 :: 마이페이지 > 정보수정</title>
</head>
<body>
<!-- header -->
 <%@ include file="/inc/front_header.jsp"%>
          	<div class="myinfo">
          	 <h2> ${sessionScope.u_name}님의 회원정보수정</h2>
		<div>
			<form name="infofrm" id="infofrm">	
				<input type="hidden" name="u_id_val" id="u_id_val" value="<%=dto.getU_no()%>">					
				<div class="info_wrap">
					<table>
						<tbody>
							<tr>
								<th><label for="u_id"><img class="check" src="images/front_notcheck.jpg"><span>아이디</span></label></th>
								<td>
									<input type=text class = u_id value=" ${sessionScope.u_id}" disabled="disabled">	
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
								<th><label for="u_name"><img class="check" src="images/front_notcheck.jpg"><span>이름</span></label></th>
								<td>
									<%-- <input type=text id=u_name value=" ${sessionScope.u_name}" disabled="disabled"> --%>
									<input type=text id=u_name value="<%=dto.getU_name() %>" disabled="disabled">										
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
									<input type="text" value="<%=arr[1]%>" name="u_hp2" id="u_hp2" onfocus="this.value='';return true;" style="width:50px;" maxlength="4" class="txt">&nbsp;-&nbsp;
									<input type="text" value="<%=arr[2]%>"name="u_hp3" id="u_hp3" onfocus="this.value='';return true;" style="width:50px;" maxlength="4" class="txt">
									&nbsp;&nbsp;
									<span class="sfont3" id="phchk" style="color:gray;"></span>
									<!-- <button class="Check_phone"  id="Check_phone">중복확인</button> -->	
									&nbsp;
								</td>
							</tr>
							<c:choose>
							<c:when test="${requestScope.u_mail==null}">
							<tr>
								<th><label for="u_mail1"><img class="check" src="images/front_notcheck.jpg"><span>이메일</span></label></th>
								<td>
									<input type="text" name="u_mail1" id="u_mail1" class="txt">&nbsp;@&nbsp;
									<input type="text"  name="u_mail2" id="u_mail2" class="txt" size="20">&nbsp;
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
							</c:when>
							<c:otherwise>
							<tr>
								<th><label for="u_mail1"><img class="check" src="images/front_notcheck.jpg"><span>이메일</span></label></th>
								<td>
									<input type="text" value="<%= marr[0]%>" name="u_mail1" id="u_mail1" class="txt" onfocus="this.value='';return true;">&nbsp;@&nbsp;
									<input type="text" value="<%= marr[1]%>" name="u_mail2" id="u_mail2" class="txt" size="20" onfocus="this.value='';return true;">&nbsp;
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
							</c:otherwise>
							</c:choose>
							
							
							<c:choose>
							<c:when test="${requestScope.u_address==null}">
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
							</c:when>
							<c:otherwise>
							<tr>
							  <th><label for="u_address"><img class="check" src="images/front_notcheck.jpg"><span>주소</span></label></th>
							   <td>
	                            <input type="text" value="<%=aarr[0]%>" onfocus="this.value='';return true;" name="u_address1" id="sample4_postcode" placeholder="우편번호">&nbsp;&nbsp;&nbsp;
								<input type="button" id="btn_address" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" value="<%=aarr[1]%>" onfocus="this.value='';return true;" name="u_address2"id="sample4_roadAddress" placeholder="도로명주소" ><br>
								<input type="text" value="<%=aarr[2]%>" onfocus="this.value='';return true;" name="u_address3"id="sample4_jibunAddress" placeholder="지번주소" >
								<span id="guide" style="color:#999"></span>
							  </td>
						 </tr>
						 </c:otherwise>
						 </c:choose>
						</tbody>
					</table>
				</div>
				<div class="btn" style="padding:40px 0">
					<span>
					  <input type="submit" id="update_btn" value="수정 완료"/>
					  <button class="btn_red" onclick="history.back(); return false;">수정 취소</button>
					  <input type="submit" id="del_btn" value="회원 탈퇴"/>
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