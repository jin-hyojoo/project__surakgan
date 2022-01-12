<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Cart_ListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ArrayList<Cart_ListDTO> list = (ArrayList<Cart_ListDTO>) request.getAttribute("list");
	int total_price = 0;

	//오늘 날짜 저장.
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(todayCal.getTime());
	String day = null;
	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");


	//다음달 마지막날
	todayCal.add(Calendar.MONTH, 1);
	int maxdate = todayCal.getMaximum(Calendar.DAY_OF_MONTH) - (todayCal.get(Calendar.DAY_OF_MONTH) + 1);
	todayCal.add(Calendar.DAY_OF_MONTH, maxdate);
	String maxday = sdf.format(todayCal.getTime());
%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link href="css/cart_list.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/header.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<script type="text/javascript" src="js/my_food_cart.js"></script>
<style type="text/css">
.tb_order_style {
	width: 100%;
}

.tb_order_style tbody td {
	padding: 5px 0;
	font-size: 13px;
	text-align: center !important;
	line-height: 1.6em;
	color: #444;
	vertical-align: middle;
}

.tb_order_style td .prd_account {
	margin-right: 5px;
}

.prd_account {
	position: relative;
	width: 67px;
	height: 31px;
	border: 1px solid #ccc;
	background: #fff;
	overflow: hidden;
	float: left;
}

.tb_order_style tbody td {
	padding: 18px 0;
	font-size: 13px;
	text-align: center !important;
	line-height: 1.6em;
	color: #444;
	vertical-align: middle;
}

.prd_account input {
	display: block;
	float: left;
	border: none;
	width: 47px;
	height: 31px;
	padding: 0;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 14px;
	text-align: center;
	vertical-align: middle;
}

.prd_account span {
	position: absolute;
	right: 0;
	top: 0;
	display: block;
	float: left;
	width: 19px;
	height: 31px;
	border-left: 1px solid #ccc;
	overflow: hidden;
}

.prd_account span a.up {
	background-image: url(images/prd_account_up.png);
	background-position: center 2px;
	border-bottom: 1px solid #ccc;
}

.prd_account span a.down {
	background-image: url(images/prd_account_down.png);
	background-position: center 0px;
	background-position-x: 1px;
}

.prd_account span a {
	display: block;
	float: left;
	width: 19px;
	height: 15px;
	text-indent: -3000px;
}

/* ▶▶▶▶▶▶▶ 삭제하기 버튼영역  ◀◀◀◀◀◀◀ */
.cart_list_del {
	padding: 10px 10px 9px 9px;
}
/* 버튼배경 */
.cart_list_del {
	background: #fff;
	color: #000;
}

/*  */
.cart_list_del {
	border: 1px solid #dddddd;
	padding: 10px;
	font-weight: bold;
	line-height: 12px;
	font-size: inherit;
	text-align: center;
}

.btn {
	display: inline-block;
	*zoom: 1:;
	cursor: pointer;
	-moz-user-select: none;
	-khtml-user-select: none;
	-webkit-user-select: none;
	-o-user-select: none;
	user-select: none;
	zoom: 1;
	*display: inline:;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- header -->
	<%@ include file="/inc/front_header.jsp"%> 
 
	<!-- 메인 광고  -->
	<%@ include file="/inc/front_ad.jsp"%>

	<div class="title" id="title">
	<table>
		<tr id="hd_carrier">
			<img src="images/head1_1.png" class="head_image1"
				style="width: 300px; height: 75px;" />
		</tr>
		<tr>
			<img src="images/head2_2.png" class="head_image"
				style="width: 300px; height: 75px;" />
		</tr>
		<tr>
			<img src="images/head3_2.png" class="head_image"
				style="width: 300px; height: 75px;" />
		</tr>
		</table>
	</div>

	<div id="container">
	<input type="hidden" id="listsize" value="<%=list.size()%>">
		<div class="content" id="content">
			<div id="cart">
				<h2 class="cart_tit">장바구니</h2>
				<hr size="3" width="100%" color="black" align="left">
				<input type="hidden" name="exec"> <input type="hidden"
					name="extend_mode" value="subscription">
				<table class="tb_order_style cart">
					<tr>
						<th><input type="checkbox" id="cart_list"
							class="bf hidden_chk"></th>
						<th colspan="2" style="width: 50px;">상품</th>
						<th>판매가</th>
						<th>수량</th>
						<th>주문 금액</th>
						<th>날짜</th>
						<th>주문 관리</th>
					</tr>
					<%
						if (list == null || list.size() <= 0) {
					%>
					<tr>
						<td>장바구니 물건이 없습니다.</td>
					</tr>
					<%
						} //end if
						else {
					%>
					<%
						for (int i = 0; i < list.size(); i++) {
								Cart_ListDTO res = list.get(i);
					%>
					<%
						if (res.getCl_gubun() == 0) {
					%>
					<tr class="cart_item_list<%=i%>">
						<td><input type="checkbox" id="cart_item" name="cart_item"
							class="bf hidden_chk" value="<%=i%>"></td>
						<td style="text-align: right !important;"><a href="foodDetail.do?i_no=<%=res.getI_no()%>"><img
								src="product/<%=res.getCl_img()%>"
								style="width: 50px; hight: 40px;"></a></td>
						<td class="cart_menu<%=i%>" style="text-align: left !important;"><%=res.getCl_menu()%></td>
						<td class="cart_price<%=i%>"><%=res.getCl_price()%></td>
						<td><label> <input type="number"
								class="buy_cnt_<%=i%>" min="1" max="999"
								value="<%=res.getCl_quantity()%>" />
						</label> <span> <a href="#" title="수량 더하기" class="up"></a> <a
								href="#" title="수량 빼기" class="down"></a>
						</span> <a class="cart_list_btn" href="javascript:cartcnt(<%=i%>)"><span>변경</span></a>
						</td>
						<td class="cart_sum_price<%=i%>"><%=res.getCl_totalprice()%></td>
						<td>
							<div class="bill_date">
								<input type="hidden" name="cl_no<%=i%>" value="<%=res.getCl_no()%>">
								<input type="date" name="order_day<%=i%>" value="<%=today%>"
									min="<%=today%>" max="<%=maxday%>"> 
									<select	name="order_time<%=i%>">
									<option value="moning">아침</option>
									<option value="lunch">점심</option>
									<option value="dinner">저녁</option>
								</select>
							</div>
						</td>
						<td><a class="cart_list_del btn"
							href="javascript:cartdel(<%=i%>)">삭제하기</a></td>
					</tr>
					<%
						total_price += res.getCl_totalprice();
								} //end if(res.getCl_gubun() == 0)
							} //end for
						} //end else
					%>
				</table>
				<div class="btn-area">
					<button id="delete_select" type="button"
						class="btn btn_white btn-select-delete"
						onmouseover="this.style.background='#f2f2f2';"
						onmouseout="this.style.background='#fff';">선택상품 삭제</button>
				</div>

				<h3 class="cart_tit">나만의 도시락</h3>
				<hr size="3" width="100%" color="black" align="left">
				<table class="tb_order_style cart">
					<tr>
						<th><input type="checkbox" id="my_cart_list"
							class="bf hidden_chk"></th>
						<th colspan="2" style="width: 50px;">상품</th>
						<th>주문 금액</th>
						<th>날짜</th>
						<th>주문 관리</th>
					</tr>
						<%for(int j=0;j<list.size();j++){ %>
						<%	Cart_ListDTO res = list.get(j); 
						if(res.getCl_gubun() == 1){%>
						<tr class="cart_item_list<%=j%>">
						
						<td><input type="checkbox" id="my_cart_item" name="my_cart_item"
							class="bf hidden_chk" value="<%=j%>"></td>
						<td style="text-align: right !important;"></td>
						<td class="cart_menu<%=j%>" style="text-align: left !important;"><%=res.getCl_menu()%></td>
						<td class="cart_sum_price<%=j%>"><%=res.getCl_totalprice()%></td>
						<td>
							<div class="bill_date">
							<%day = transFormat.format(res.getCl_day()); %>
								<input type="hidden" name="cl_no<%=j%>" value="<%=res.getCl_no()%>">
								<input type="date" name="order_day<%=j%>" value="<%=day%>"
									min="<%=today%>" max="<%=maxday%>"> 
									<select	name="order_time<%=j%>">
									<option value="moning" <%if(res.getCl_when().equals("아침")){%> selected<%}%>>아침</option>
									<option value="lunch" <%if(res.getCl_when().equals("점심")){%> selected<%}%>>점심</option>
									<option value="dinner" <%if(res.getCl_when().equals("저녁")){%> selected<%}%>>저녁</option>									
								</select>
							</div>
						</td>
						<td><a class="cart_list_del btn"
							href="javascript:cartdel(<%=j%>)">삭제하기</a></td>
					</tr>
					
					<%
					total_price += res.getCl_totalprice();
						}
						}
						%>
				</table>
				
				<div class="btn-area">
					<button id="delete_select" type="button"
						class="btn btn_white btn-select-delete"
						onmouseover="this.style.background='#f2f2f2';"
						onmouseout="this.style.background='#fff';">선택상품 삭제</button>
				</div>
				
				<div class="purchase_box">

						<div class="purchase_guide">
							<h3>포장 수령일</h3>
							<hr size="3" width="100%" color="black" align="left">
							<div class="box">
								<h4>[방문포장 안내]</h4>
								<p class="dlv_msg">
									지금 주문결제 시, <strong class="purchase_date">다음날 오후 1시 이후
										포장수령이 가능합니다.</strong><br>(매일 오후 1시까지 주문하면 다음날 포장수령 가능)
								</p>
								<h4>[서비스 안내]</h4>
								<p class="purchaseOnceOnly"></p>
							</div>
						</div>
						<div class="purchase_price">
							<h3>구매 가격</h3>
							<hr size="3" width="100%" color="black" align="left">
							<div class="box">

								<dl class="total">
									<dt>구매 내역</dt>
									<dd>
										<span class="number" id="totalPrice"><%=total_price%></span> <span
											class="won">원</span>
									</dd>
								</dl>
							</div>
						</div>
					</div>
					<div class="btn-area cart">
						<a href="foodindex.do" class="btn_white"
							onmouseover="this.style.background='#f2f2f2';"
							onmouseout="this.style.background='#fff';">계속 쇼핑 </a> 
							<a class="btn_mint" id="btn_select_receipt_date"
							href="payment.do"
							onmouseover="this.style.background='#3399ff';"
							onmouseout="this.style.background='#80bfff';">주문하기</a>
					</div>
				</div>
			</div>
	</div>
		<!-- footer -->
 	<%@ include file="/inc/front_footer.jsp"%> 
</body>
</html>