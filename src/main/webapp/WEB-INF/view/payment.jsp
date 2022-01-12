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

<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link href="css/jquery.bxslider.css" rel="stylesheet" />
<script type="text/javascript" src="js/config.js"></script>

<style type="text/css">
#container {
	position: relative;
	overflow: hidden;
	height: 100%;;
	border: 1px solid #000;
	margin-right: 14%;
	margin-left: 14%;
}

.content {
	position: relative;
	width: 980px;
	margin: 0 auto;
	overflow: hidden;
}

#cart {
	overflow: hidden;
	background: #fff;
	height: 100%;
	margin-left: 5%;
	margin-right: 5%;
}
/*페이지의  hr,h2,h3,h4,label값 */
#cart hr {
	margin: 8px 0 8px 0;
}

#cart h2 {
	margin: 20px 0 20px 0;
}

#cart h3 {
	margin: 19px 0 19px 0;
}

#cart h4 {
	margin: 21px 0 21px 0;
}

#cart label {
	cursor: pointer;
}

/*01장바구니/02결제/03결제완료*/
.title {
	margin-left: 14%;
}

.title img {
	width: 150px;
	height: 75px;
}

.tb_order_style {
	width: 100%;
}
/*(주문자정보+결제/수령일)div의 dt,dd,dl값 */
.purchase_box {
	overflow: hidden;
	margin: 78px 0 10px;
	position: relative;
}

.purchase_box dt {
	float: left;
	clear: both;
	margin-bottom: 16px;
}

.purchase_box dd {
	position: relative;
	float: right;
	text-align: right;
	margin-bottom: 16px;
	padding-right: 10px;
}

.purchase_box dl {
	overflow: hidden;
	font-size: 14px;
	color: #000;
	padding-bottom: 14px;
}
/*주문자 정보 div*/
.purchase_guide {
	float: left;
	width: 48%;
}

.purchase_guide .box {
	border-bottom: 1px solid #777;
}

.pay_type label {
	font-size: 13px;
}

.pay_box {
	margin: 20px 0 0 0;
}

.payment_name {
	font-size: 12px;
	font-weight: bold;
}

/*결제/수령일 정보 div*/
.purchase_price {
	float: right;
	width: 48%;
}

.purchase_price dl {
	margin: 16px 0 16px 0;
}

.purchase_price .box {
	background: #f4f4f4;
	border-bottom: 1px solid #f4f4f4;
	padding: 30px 20px 30px 30px;
}

.purchase_price .total {
	border-bottom: none;
	margin: -3px 10px 6px 0;
	border-top: 1px solid #777;
	padding: 20px 0 0;
}

.purchase_price .total dt {
	font-size: 18px;
	color: #333;
	font-family: NanumEB, sans-serif;
	margin: 16px 0 0;
	font-weight: bold;
}

.purchase_price .total dd {
	color: #80bfff;
	padding-right: 0;
	margin-bottom: 0;
}

.purchase_price .total dd .number {
	font-size: 43px;
	font-weight: bold;
}

.purchase_price .total dd .won {
	font-size: 20px;
	font-family: NanumBold, sans-serif;
	display: inline-block;
	position: relative;
	top: -3px;
}
/*결제하기 버튼*/
#form1 {
	margin: 0 0 100px;
	overflow: hidden;
	text-align: center;
}

.btn_mint{
	display: inline-block;
	width: 300px;
	height: 66px;
	margin: 0 3px;
	font-size: 20px;
	font-family: NanumBold, sans-serif;
	text-align: center;
	line-height: 66px;
}

.btn_mint {
	background: #80bfff;
	color: #fff;
}
/*약관동의 체크박스*/
.check_box {
	font-size: 13px;
	margin: 20px 0 20px 0;
}
</style>


<script type="text/javascript">

	function getSelectValue() {
		var select = $("#pay_box option:selected").val();
		$("#bank").text(select);
	}
	
	$(document).ready(function() {
		$('#form1 input[type="button"].btn_mint').on('click', function() {	
			if ($('#gender').prop('checked')) {
				
				document.getElementById("first_menu").value = $("#menu_list td").filter(':eq(1)').text() + "&nbsp;外&nbsp;" + ${cartlist.size()-1} + "개";
				
				$('[name=o_bank]').val($("#pay_box option:selected").text()+":&nbsp;"+$("#pay_box option:selected").val());
				/* typeof = $("#pay_box option:selected").val(); */	
				/* alert($("#pay_box option:selected").val()); */
				
					
				$('#form1').attr('method','post');
				$('#form1').attr('action','paymentCompleted.do');
				document.form1.submit();
				
			} else {

				alert('약관에 동의해 주세요.');
				return false;
			}
		});
		
		$("input:radio[name=pay_type]").click(function() {
			var radioVal = $('input[name="pay_type"]:checked').val();
			if (radioVal == "무통장입금") {
				document.getElementById('pay_box').style.display = "";
			} else {
				alert("무통장 입금으로 결제 해주시기 바랍니다.");
				document.getElementById('pay_box').style.display = "none";
			}
		});

	});
</script>
</head>
<%@ include file="/inc/front_header.jsp"%>
<body>
	<div id="head">
		<div class="title" id="title">
			<tr>
				<img src="images/head1_2.png" class="head_image" />
			</tr>
			<tr>
				<img src="images/head2_1.png" class="head_image" />
			</tr>
			<tr>
				<img src="images/head3_2.png" class="head_image" />
			</tr>
		</div>
	</div>


	<div id="container">
		<div class="content" id="content">
			<div id="cart">
				<h2 class="cart_tit">주문 상세내역</h2>
				<hr size="3" width="100%" color="black" align="left">
				<input type="hidden" name="exec"> <input type="hidden"
					name="extend_mode" value="subscription">
				<table class="tb_order_style cart">
					<thead>
						<tr>
							<th style="width: 40px;"></th>
							<th>상품</th>
							<th>수령일</th>
							<th>수량</th>
							<th>상품 가격</th>
						</tr>
					</thead>
					<tbody id="menu_list">
					<c:set var="ddto" value="${day_list}"/>
						<c:forEach var="dto" items="${cartlist}">
							<c:if test="${dto.u_no eq sessionScope.u_no}">
								<tr>
									<td style="text-align: right !important;"><a href="#">
											<img src="${dto.cl_img}" style="width: 50px; hight: 40px;" />
									</a></td>
									<td style="text-align: left !important;">${dto.cl_menu}</td>
									<td style="text-align: center !important;">${dto.cl_day}</td>
									<td style="text-align: center !important;">${dto.cl_quantity}</td>
									<td style="text-align: center !important;"><fmt:formatNumber
											pattern="#,###">${dto.cl_totalprice}</fmt:formatNumber>원</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<div class="purchase_box">

					<div class="purchase_guide">
						<h3>주문자 정보</h3>
						<hr size="3" width="100%" color="black" align="left">
						<div class="box">
							<c:forEach var="dto" items="${user}">
								<c:if test="${dto.u_no eq sessionScope.u_no}">
									<h4>주문하시는분&nbsp;:&nbsp;&nbsp;${dto.u_name}</h4>
									<p class="user_name"></p>
									<h4>휴대전화 번호&nbsp;:&nbsp;&nbsp;${dto.u_hp}</h4>
									<p class="user_phn"></p>
								</c:if>
							</c:forEach>
						</div>

						<h3>결제수단</h3>
						<div class="pay_type">
							<input type="radio" name="pay_type" checked="checked"
								value="신용카드" /> <label for="pay_type1" class="lbl">신용카드</label>
							<input type="radio" name="pay_type" value="실시간계좌이체" /> <label
								for="pay_type1" class="lbl">실시간계좌이체</label> <input type="radio"
								name="pay_type" value="무통장입금" /> <label for="pay_type1"
								class="lbl">무통장 입금</label>
						</div>

						<div class="pay_box" id="pay_box" style="display: none">
							<select name="bank" onChange="getSelectValue()">
								<option value="수락간(주)  849-21-0228-607" selected="selected()">국민은행</option>
								<option value="수락간(주)  506-84-6292-865">기업은행</option>
								<option value="수락간(주)  9523-5423-245">농협은행</option>
								<option value="수락간(주)  563-26-5689-532">신한은행</option>
								<option value="수락간(주)  95-632-7693-238">우리은행</option>
							</select> <span class="payment_name">&nbsp;&nbsp;&nbsp;예금주&nbsp;:&nbsp;&nbsp;
								<span id="bank" text=""></p></span>
						</div>

					</div>
					<div class="purchase_price">
						<h3>결제/수령일 정보</h3>
						<hr size="3" width="100%" color="black" align="left">
						<div class="box">

							<dl>수령일&nbsp;:&nbsp;&nbsp;<c:out value="${cl_day}"/></dl>
							<dl class="price">
								<dt>상품 금액</dt>
								<dd>
									<span id="salePrice"> <c:set var="sum" value="0" /> <c:forEach
											var="dto" items="${cartlist}">
											<c:set var="sum" value="${sum + dto.cl_totalprice}" />
										</c:forEach> <input id="totalprice" type="hidden" value="${sum}" id="sum" />
										<fmt:formatNumber pattern="#,###">
											<c:out value="${sum}" />
										</fmt:formatNumber>
									</span>원
								</dd>
							</dl>

							<dl class="total">
								<dt>총 결제금액</dt>
								<dd>
									<span class="number"> <fmt:formatNumber pattern="#,###">
											<c:out value="${sum}"/>
										</fmt:formatNumber>
									</span> <span class="won">원</span>
								</dd>
							</dl>
						</div>
					</div>
				</div>
				<hr size="1" width="100%" color="#777" align="left">
				<div class="check_box">
					<input type="checkbox" id="gender" value="female" /> <span>주문할
						상품의 구매조건을 확인하였으며, 결제진행에 동의합니다.</span>
				</div>

				<!-- <div class="btn-area cart">
					<a onclick="show_paymente()" class="btn_mint"
						id="btn_select_receipt_date"
						onmouseover="this.style.background='#3399ff';"
						onmouseout="this.style.background='#80bfff';">결제하기</a>
				</div> -->
				
					<!-- var first_menu = $("#menu_list td").filter(':eq(1)').text() + "   外" + size + "개";-->
				<form name="form1" id="form1" method="post">
					<input type="hidden" name="o_bank" value="">
					<input type="hidden" name="select" value="${cartlist.size()-1}"/> 
					<input type="hidden" name="total_price" value="${sum}"/>
					<input type="hidden" name="first_menu" id="first_menu" value=""/>
					<input type="button" class="btn_mint" value="결제하기"/>
				</form>

			</div>
		</div>
	</div>
</body>
<%@ include file="/inc/front_footer.jsp"%>
</html>