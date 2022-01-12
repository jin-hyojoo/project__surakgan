<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/back.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script type="text/javascript" src="js/back.js"></script>
<script type="text/javascript" src="js/adminOrder.js"></script>
</head>
<body>
	<!-- header -->
	<%@ include file="back_regProduct.jsp"%> 
	<div id="wrap">
		<c:if test="${sessionScope.u_id!=null}">
			<div class="top" >
				${sessionScope.u_name}계정으로 로그인하였습니다.&nbsp;|&nbsp;<a href="logout.do">로그아웃 </a>
			</div>
		</c:if> 
		<c:choose>
			<c:when test="${sessionScope.u_id==null || sessionScope.u_grade==0}">
				<div>
					<center>
						<p style="margin-top: 100px;">관리자만 접근 가능합니다.</p>
						<input type="button" value="뒤로가기" onclick="javascript:history.back()" />
					</center>
				</div>
			</c:when>

			<c:otherwise>
				<div class="board_search">
					<a href="foodindex.do"><img src="images/header_logo.PNG" alt="KING" /></a>
					<input type="button" value="회원" class="board_btn" id="board_user" />
					<input type="button" value="상품" class="board_btn" id="board_product" /> 
					<input type="button" value="게시판" class="board_btn" id="board_board" /> 
					<input type="button" value="주문내역" id="customer_order" />
					<input type="hidden" id="gubun" />
					<input type="hidden" id="u_grade" value="${sessionScope.u_grade}" />
					<input type="hidden" id="head"/>
					
					<div id="searchWrap">
						<select name="searchKey">
							<option value="">선택</option>
							<option value="u_id" class="userList">ID</option>
							<option value="u_name" class="userList">이름</option>
							<option value="u_hp" class="userList">전화번호</option>
							<option value="i_menu" class="productList">상품명</option>
							<option value="i_gubun" class="productList">구분</option>
							<option value="b_all" class="boardList">전체보기</option>
							<option value="b_title" class="boardList" >제목</option>
							<option value="b_content" class="boardList" >내용</option>
							<option value="b_writer" class="boardList" > 작성자</option>
							
						</select> <input type="text" name="searchWord" /> <input type="button"
							value="검색" class="board_btn" />
					</div>
				</div>

				<div class="board_list">
					<table>
						<thead>
							<tr>
								<th></th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>

					<!-- 페이지 -->
					<div id="paging">
						<center></center>
					</div>
				</div>
				<div class="orderWrap">
					<!-- 주문내역 -->
					<%@ include file="orderform.jsp"%>
					
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>