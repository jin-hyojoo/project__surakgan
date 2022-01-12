<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link href="css/mypage.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#mypagemenu a').on('mouseover', function(){
		$(this).children().css({'background':'#FFF2E6'})
	})
	$('#mypagemenu a').on('mouseout', function(){
		$(this).children().css({'background':'#fff'})
	})
});
</script>
</head>
<body>
  <!-- header -->
 <%@ include file="/inc/front_header.jsp"%> 
 
  <!-- 메인 광고  -->
 <%@ include file="/inc/front_ad.jsp"%>
 
<div id="content">
	<div id="mypagemenu">
		<c:if test="${sessionScope.u_grade!=0}">
		<a href="admin.do">
			<div>
				<h3><strong>ADMIN</strong>관리자페이지</h3>
				<p>관리자페이지입니다.</p>
			</div>
		</a>
		</c:if>
		<a href="mypagetab.do">
			<div>
				<h3><strong>MODIFY</strong>회원정보 수정</h3>
				<p>고객님의 개인정보를 관리하는 공간입니다.</p>
			</div>
		</a>
		<a href="myorder.do">
			<div>
				<h3><strong>ORDER</strong>주문내역 조회</h3>
				<p>고객님께서 주문하신 도시락의 주문내역을 확인하실 수 있습니다.</p>
			</div>
		</a>
		<a href="membercartform.do">
			<div>
				<h3><strong>CART</strong>장바구니</h3>
				<p>고객님께서 담아두신 장바구니를 확인하실 수 있습니다.</p>
			</div>
		</a>
		<a href="qnainfo.do">
			<div>
				<h3><strong>Q/A</strong>내 질문</h3>
				<p>고객님께서 작성하신 질문들을 관리하는 공간입니다.</p>
			</div>
		</a>
		<a href="myreview.do">
			<div>
				<h3><strong>REVIEW</strong>내 후기</h3>
				<p>고객님께서 작성하신 후기들을 관리하는 공간입니다.</p>
			</div>
		</a>
	</div>
	
</div>
	<!-- footer -->
 	<%@ include file="/inc/front_footer.jsp"%> 
</body>
</html>