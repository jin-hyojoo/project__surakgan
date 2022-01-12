<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 
<form id="frm" name="frm" method="get" action="write.sb">
	<input type="submit" id="btnWrite" value="글쓰기"/>
</form> -->
<link rel="stylesheet" type="text/css" href="css/user.css" />
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/Board.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■  -->
  <!-- header -->
 <%@ include file="/inc/front_header.jsp"%>
 
		<!-- BoardCrumb -->
		<h1 class="subtlt_h1">공지사항</h1>
	    <h5 class="subinfo_h5">수락간의 공지사항입니다</h5>
<!--
  			<ul class="breadcrumb_sub_items">
 			   <li class="breadcrumb-item"><a href="#">홈</a></li>
  			   <li class="breadcrumb-item"><a href="#">고객센터</a></li>
  			   <li class="breadcrumb-item active" aria-current="#">질문과 답변</li>
		  </ul>
		
 -->
<div class="board_search">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td class="s_left">
			<form name="Nform1" id="Nsearchform" method="post" action="NoticeList.do">
				<input type="button" value="전체" class="btn_white1" id="Noticetag_all" style="width:60px;height:25px;line-height:25px;"/>
				<input type="button" value="공지" class="btn_white1" id="Noticetag_notice" style="width:60px;height:25px;line-height:25px;"/>
				<input type="button" value="이벤트" class="btn_white1" id="Noticetag_event" style="width:60px;height:25px;line-height:25px;"/>
				
				<input type="hidden" name="head" value="${head}"/>
				<input type="hidden" name="option2" value="${option2}"/>
				<input type="hidden" name="keyword2" value="${keyword2}"/>
				
				<select name="option" style="width: 7%">
					<!-- 검색창  -->
					<option value="all" >전체보기</option>
					<option value="n_title" >제목</option>
					<option value="n_content" >내용</option>
					<option value="n_writer" > 작성자</option>
				</select> &nbsp; 
				<!-- <input type="text" class="txt" name="" /> &nbsp; -->
				<input type="text" name="keyword" value="${map.keyword}"> &nbsp;
				<input type="submit" value="검색" class="btn_red" id="NoticebtnSearch" style="width:60px;height:25px;line-height:25px;"/>
			</form>	
			</td>
			<td class="s_right">
				<!--  글쓰기 버튼 -->
				<div class="dv_btnWrite">
					<form name="form2" method="get" action="#">
						<!-- <button type="button" class="btn_white1" id="btn_NoticeWrite">
							<img src="images/ico-btn-write.gif" alt="글쓰기" />&nbsp;글쓰기 
						</button>-->
					</form>
				</div>
			</td>
		</tr>
	</table>
</div>
<fieldset>
	<legend>리스트</legend>
	<!-- DB에 저장된 게시글 리스트 뿌리기  -->
	<div class="board_tbl1">
		<table>
			<caption>리스트</caption>
			<thead>
				<tr>
					<th style="color:#fff">번호</th>
					<th style="color:#fff">분류</th>
					<th style="color:#fff">제목</th>
					<th style="color:#fff">작성자</th>
					<th style="color:#fff">작성일</th>
					<th style="color:#fff">조회수</th>
				</tr>
			</thead>
			<c:forEach items="${requestScope.aList }" var="ndto">
				<tr>
					<td>${ndto.n_no }</td>
					<td>${ndto.n_head }</td>
					<td><c:url var="n_content" value="NoticeView.do">
							<c:param name="currentPage" value="${pdto.currentPage }" />
							<c:param name="num" value="${ndto.n_no }" />
						</c:url> 
						<!-- 0이 아니면 답변글 -->
						<c:if test="${ndto.n_level!=0 }">
							<img src="images/level.gif" width="${20*ndto.n_level }" height="15" />
							<img src="images/re.gif" />
						</c:if> <a href="${n_content }">
							${ndto.n_title } </a></td>
					<td>${ndto.n_writer }</td>
					
					<td><fmt:formatDate value="${ndto.n_regdate }" pattern="yyyy/MM/dd"/></td>
					<td>${ndto.n_readcount }</td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- 페이징  -->
		<c:if test="${pdto.startPage>0}">
				<div class="wrap_paging_out">
					<div style='text-align:center;'  class='paging' >
						<c:choose>
							<c:when test="${requestScope.pdto.startPage>1}">
								 <a href='NoticeList.do?currentPage=${pdto.startPage-pdto.blockPage}'>◀이전</a> 
							</c:when>
							<c:otherwise>			
							<span style="font-size:11px;color:#555;">◀</span>
							</c:otherwise>
						</c:choose>
							
						<c:forEach begin="${requestScope.pdto.startPage}" end="${requestScope.pdto.endPage}" var="i" >
							<c:choose>
								<c:when test="${i==requestScope.pdto.currentPage}">
									<strong>${i}</strong>
								</c:when>
								<c:otherwise>
									<a href='NoticeList.do?currentPage=${i}'>${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>	
						<c:choose>
							<c:when test="${requestScope.pdto.endPage < requestScope.pdto.totalPage}">
								<a href='NoticeList.do?currentPage=${pdto.startPage+pdto.blockPage}
										<%-- &searchKey=${param.searchKey}&searchWord=${param.searchWord} --%>'>다음▶</a>
							</c:when>
							<c:otherwise>			
							<span style="font-size:11px;color:#555;">▶</span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				</c:if>
 		</div>
</fieldset>

  <!-- footer -->
 <%@ include file="/inc/front_footer.jsp"%>