<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.Information_CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link href="css/myreview.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<script type="text/javascript" src="js/header.js"></script>
<script type="text/javascript" src="js/config.js"></script>
<script type="text/javascript" src="js/myreview.js"></script>
</head>
<body>
<%
List<Information_CommentDTO> commList = (ArrayList)request.getAttribute("commList");
%>
	<!-- header -->
	<%@ include file="/inc/front_header.jsp"%> 
 
	<div id="content">
		<div id="comment">
		<p>리뷰관리</p>
		<hr>
		<input type="hidden" id="u_no" value="<%=session.getAttribute("u_no") %>" />
		
		<ul id="comment_box">
		<%
			for(Information_CommentDTO dto : commList) { 
				String pattern = "yyyy-MM-dd";
				SimpleDateFormat sdf = new SimpleDateFormat(pattern);
				String date = sdf.format(dto.getIc_regdate());
		%>
			<li>
				<div class="left_comment">
					<div class="i_menu"><a href="#"><%=dto.getI_menu()%></a></div>
					<div class="starscore_bg"> 
						<div class="starscore" style="width: <%=dto.getIc_star()*20 %>%;"></div>
					</div> 
					<input type="hidden" value="<%=dto.getIc_star() %>">
				</div>
				<div class="right_comment">
					<input type="hidden" value="<%=dto.getIc_no()%>">
					<div class="c_content"><span><%=dto.getIc_content() %></span></div>
					<div class="etc" align="right">
						<p><%=date %><p>
						<span><a href="#" class="edit">수정</a>&nbsp;|&nbsp;<a href="reviewDel.do?ic_no=<%=dto.getIc_no() %>" class="del">삭제</a></span>
					</div> 
				</div>
				<div class="right_comment hide">
					<div class="c_content">
						<textarea cols="70" rows="5" title="댓글 입력" name="ic_content" maxlength="300" wrap="hard"><%=dto.getIc_content() %></textarea>
					</div>
					<div class="etc" align="right">
						<p><%=date %><p>
						<span><a href="#" class="submit">완료</a>&nbsp;|&nbsp;<a href="#" class="cancel">취소</a></span>
					</div>
				</div>
			</li>
		<%	}	%>
		</ul>
		</div>
	
	</div>
</body>
</html>