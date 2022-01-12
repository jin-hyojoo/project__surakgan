<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/paymentCompleted.css" rel="stylesheet">
<link href="css/jquery.bxslider.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<script type="text/javascript" src="js/config.js"></script>


<script type="text/javascript">
	function show_paymente() {

		if ($('#gender').prop('checked')) {
			window.document.location.href = "indexview.do";
			return;
		} else {

			alert('약관에 동의해 주세요.');
			return false;
		}
	}
	$(document).ready(function() {
		$("input:radio[name=pay_type]").click(function() {
			var radioVal = $('input[name="pay_type"]:checked').val();
			if (radioVal == "무통장입금") {
				document.getElementById('pay_box').style.display = "";
			} else {
				alert("무통장 입금으로 결제 해주시기 바랍니다.");
				document.getElementById('pay_box').style.display = "none";
			}
		})

	});
</script>
</head>
<%@ include file="/inc/front_header.jsp"%>
<body>

	<div id="head">
		<div class="title" id="title">
			<tr id="hd_carrier">
				<img src="images/head1_2.png" class="head_image1"
					style="width: 150px; height: 75px;" />
			</tr>
			<tr>
				<img src="images/head2_2.png" class="head_image"
					style="width: 150px; height: 75px;" />
			</tr>
			<tr>
				<img src="images/head3_1.png" class="head_image"
					style="width: 150px; height: 75px;" />
			</tr>
		</div>
	</div>
	<div id="container">
		<div class="content" id="content">
			<div id="cart">
				<h2 class="cart_tit">결제완료</h2>
				<!-- <hr size="3" width="100%" color="black" align="left" /> -->
				<div class="content_box">
					<table class="contents">
						<colgroup>
							<col width="150px">
							<col width="*">
						</colgroup>
						<%-- <c:forEach var="dto" items="${oderlist}"> --%>
							<c:if test="${oderlist.u_no eq sessionScope.u_no}">
							<c:set var="dto" value="${o_no}"/>
								<tr>
									<th>주문번호</th>
									<td>${date}++${oderlist.o_no}</td>
								</tr>
								<tr>
									<th>입금계좌</th>
									<td>${oderlist.o_bank}</td>
								</tr>
								<tr>
									<th>결제금액</th><td><fmt:formatNumber pattern="#,###">
											${oderlist.o_total}
										</fmt:formatNumber>원</td>
								</tr>
								<tr>
									<th>주문상품</th>
									<td>${oderlist.o_name}</td>
								</tr>
							</c:if>
						<%-- </c:forEach> --%>
					</table>
				</div>

				<div class="btn-area cart">
					<a href="foodindex.do" onclick="showPopup()" class="btn_mint"
						id="btn_select_receipt_date"
						onmouseover="this.style.background='#3399ff';"
						onmouseout="this.style.background='#80bfff';">계속 쇼핑하기</a>
				</div>

			</div>
		</div>
	</div>
</body>
<%@ include file="/inc/front_footer.jsp"%>
</html>