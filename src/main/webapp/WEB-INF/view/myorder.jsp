<%@page import="dto.OderDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link href="css/myorder.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script type="text/javascript" src="js/header.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<script type="text/javascript" src="js/myorder.js"></script>

</head>
<body>

	<!-- header -->
	<%@ include file="/inc/front_header.jsp"%> 
 
	<!-- 주문내역 -->
	<%@ include file="orderform.jsp"%>
	
	<!-- footer -->
 	<%@ include file="/inc/front_footer.jsp"%> 
</body>
</html>