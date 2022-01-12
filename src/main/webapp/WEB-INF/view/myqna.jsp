<%@page import="dto.QnaDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<% List<QnaDTO> list = (List<QnaDTO>)request.getAttribute("aList"); %>

<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link rel="stylesheet" type="text/css" href="css/mypage_tab.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<script type="text/javascript" src="js/mypage_tab.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수락간 :: 마이페이지 > 나의 질문</title>
</head>
<body>
<!-- header -->
 <%@ include file="/inc/front_header.jsp"%>
 
       <div class="qnainfo">
          <h2>${sessionScope.u_name}님의 질문</h2>
          <div class="qnawrap">
           <table>
             <tr>
				<th style="width:10%">번호</th>
				<th style="width:10%">분류</th>
				<th style="width:50%">제목</th>
				<th style="width:20%">작성일</th>
				<th style="width:10%">조회수</th>
			 </tr>
			 
			<%for(int i=0; i<list.size(); i++){ %>
			 <tr >
              <td style="height: 30px; border-bottom: 1px solid lightgray"><%=list.get(i).getQ_no()%></td>
             <td style="height: 30px; border-bottom: 1px solid lightgray"><%=list.get(i).getQ_head()%></td>
              <td style="height: 30px; border-bottom: 1px solid lightgray">
<%--               <c:url var="q_content" value="QnaView.do">
		   <c:param name="num" value="${qdto.q_no }" /></c:url>  --%>

		   <a href="mypageQnaView.do?q_no=<%=list.get(i).getQ_no()%>"><%=list.get(i).getQ_title()%> </a></td>
             <td style="height: 30px; border-bottom: 1px solid lightgray"><fmt:formatDate value="<%=list.get(i).getQ_regdate()%>" pattern="yyyy/MM/dd"/></td>
           <td style="height: 30px; border-bottom: 1px solid lightgray"><%=list.get(i).getQ_readcount()%></td>
            </tr>
          <%} %>
           
         </table>
          </div>
         </div>
  <!-- footer -->
 <%@ include file="/inc/front_footer.jsp"%> 
</body>
</html>