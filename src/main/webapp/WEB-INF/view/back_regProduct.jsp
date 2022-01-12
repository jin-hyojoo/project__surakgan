<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/back_regProduct.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="js/back_regProduct.js"></script>
</head>
<body>
	<form onsubmit="return false" name="regProduct" class="regProduct">
		<fieldset>
			<legend>상품등록</legend>
			<input type="button" value="X" id="close">
			<table>
				<tr>
					<th><label for="i_menu">상품명</label></th>
					<td><input type="text" name="i_menu" id="i_menu" /></td>
				</tr>
				<tr>
					<th><label for="i_gubun">구분</label></th>
					<td><select name="i_gubun" id="i_gubun">
							<option value="1">완제품 - 육류</option>
							<option value="2">완제품 - 채식</option>
							<option value="3">완제품 - 프리미엄</option>
							<option value="4">사이드 - 반찬</option>
							<option value="5">사이드 - 음료</option>
							<option value="6">사이드 - 빵</option>
							<option value="7">나만의 - 국</option>
							<option value="8">나만의 - 밥</option>
							<option value="9">나만의 - 김치</option>
							<option value="10">나만의 - 고기</option>
							<option value="11">나만의 - 야채</option>
						</select></td>
				</tr>
				<tr>
					<th><label for="i_price">가격</label></th>
					<td><input type="text" name="i_price" id="i_price" /></td>
				</tr>
				<tr>
					<th><label for="i_kcal">칼로리</label></th>
					<td><input type="text" name="i_kcal" id="i_kcal" /></td>
				</tr>
				<tr>
					<th>메인이미지</th>
					<td><input type="file" name="i_img" id="i_img" /></td>
				</tr>
				<tr>
					<th rowspan="2">상세이미지</th> 
					<td><input type="button" id="i_sub" value="이미지 선택"/></td>
				</tr>
				<tr>
					<td><div id="subDiv"> </div></td>
				</tr>
				<tr>
					<th rowspan="2">설명이미지</th> 
					<td><input type="button" id="i_ct" value="이미지 선택"/></td>
				</tr>
				<tr>
					<td><div id="ctDiv"> </div>
						<input type="button" value="상품등록" id="regBtn"/></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>