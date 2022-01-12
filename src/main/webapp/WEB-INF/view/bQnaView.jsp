<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link rel="stylesheet" type="text/css" href="css/user.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/bBoard.js"></script>
 <script type="text/javascript" src="js/config.js"></script>   
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  -->
<!-- header -->
 <%@ include file="/inc/front_header.jsp"%>
 
		<!-- BoardCrumb -->
		<h1 class="subtlt_h1">질문과 답변</h1>
		<h5 class="subinfo_h5">궁금하신 내용을 문의해주세요</h5>
<!--   			
				<ul class="breadcrumb_sub_items">
 			   <li class="breadcrumb-item"><a href="#">홈</a></li>
  			   <li class="breadcrumb-item"><a href="#">고객센터</a></li>
  			   <li class="breadcrumb-item active" aria-current="#">질문과 답변</li>
		  </ul>
 -->
<fieldset>
	<legend>Qna view 영역</legend> 
	<div class="qnotic_tb1">
		<table border="0">
			<caption>Qna</caption>
			<tbody>
				<tr>
					<th><span class="title">작성자</span></th>
					<td width="100%"><span id="atv_writer"></span>${qdto.u_name}</td>
					<th><span class="title">등록일</span></th>
					<td width="100%"><span id="atv_regdate"></span>
					<fmt:formatDate value="${qdto.q_regdate }" pattern="yyyy/MM/dd"/></td>	
					<th><span class="title">조회수</span></th>
					<td width="50px"><span id="atv_hit"></span>${qdto.q_readcount }</td>
				</tr>
				<tr >
					<th><span class="title">제목</span></th>
					<td colspan="5"><%-- <strong id="atv_title">${qdto.q_head }&nbsp;</strong> --%>${qdto.q_title }</td>
				</tr>
				<tr class="last">
					<th><span class="title">내용</span></th>
					<td id="atv_content" colspan="5	">${qdto.q_content }</td>
				</tr>
			</tbody>
		</table>
	</div>
	<table cellpadding="0" cellspacing="0" width="100%" border="0">
		<tr>
			<td>
				<div class="viewbtn" style="text-align:right;">	
				
				<form name="QnaForm" id="QnaForm" method="get">
					<input type="hidden" name="num" value="${qdto.q_no}" />
					<%-- <input type="hidden" name="head" value="${qdto.q_head}" /> --%>
					<input type="hidden" name="ref" value="${qdto.q_ref}" />
					<input type="hidden" name="re_step" value="${qdto.q_step}" />
					<input type="hidden" name="re_level" value="${qdto.q_level}" />
					<input type="hidden" name="currentPage" value="${param.currentPage}" />
		
					<%-- <c:if test="${!empty sessionScope.u_no}">	 --%>			
					<!-- <input type="button" value="답글" class="btn_white1"  style="width:60px;height:25px;line-height:25px;  float:left; " id="btnReply"/>	 -->
					<input type="button" value="수정" class="btn_white1" id="QnaUpdateView"  style="width:60px;height:25px;line-height:25px;" />	
					<input type="button" value="삭제" class="btn_white1" id="QnaDelete"  style="width:60px;height:25px;line-height:25px;" />
					<%-- </c:if> --%>
					<input type="button" value="목록 돌아가기" class="btn_white1" id="QnaList"  style="width:100px;height:25px;line-height:25px;" />								
				</form>
				</div>
			</td>
		</tr>
	</table>
</fieldset>
<br>
<%-- <%@ include file="Comment.jsp" %> --%>

 
  <!-- footer -->
 <%@ include file="/inc/front_footer.jsp"%> 