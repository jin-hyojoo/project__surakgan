<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link href="css/jquery.bxslider.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/foodList.css">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<script type="text/javascript" src="js/foodList.js"></script>		

<title>Insert title here</title>
<style type="text/css">
.morebtn {
    bottom: 0px;
}

.morebtn {
    position: absolute;
    width: 100%;
    max-width: 150px;
    margin: auto;
    margin-bottom: -10px;
    text-align: center;
    background: #DD3522;
    color: #fff;
    padding: 10px 0;
    font-size: 13px;
    left: 0px;
    right: 0px;
    cursor: pointer;
}
#moreImg{
	position: relative;
	width: 20px;
	height: 10px;
}

</style>
</head>
<body>
<div>
<input type="hidden" value="12" id="morecnt">
<input type="hidden" name="c_type" value="${c_type}">
  <!-- header -->
 <%@ include file="/inc/front_header.jsp"%> 
 
  <!-- 메인 광고  -->
 <%@ include file="/inc/front_ad.jsp"%>

  <div class="wrap">
    <div class="content">
	   <ul class="food_menu">
	   	 <li class="foodListMenu"><a href="foodListIndex.do?c_type=${c_type}"><span>전체목록</span></a></li>
	   </ul>
	   <h2 class="food_title">${c_title.c_title}</h2>	   
	   <ul class="foods_list" id="products">
	   
		<!-- foodlist print -->
		
	   </ul>
    </div> 
 	<div id="morebtn">
	      
	</div>   
  </div>
</div>

   <!-- footer -->
 <%@ include file="/inc/front_footer.jsp"%> 	
</body>
</html>