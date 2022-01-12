<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/comment.css"/>
<script src="../js/fb.at.comment.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="sfont2" style="padding-bottom:3px;">댓글&nbsp;<span id="cmt_cnt">0</span></div>
	<div class="cmt_write_wrap">
	<!-- 댓글 입력폼 -->
	<form  method="post" name="atWriteCmt" id="atWriteCmt" onsubmit="return false;">	
	<input type="hidden" name="u_no" value="${sessionScope.u_no}"/>
	<input type="hidden" name="fb_no"/>
	<fieldset class="cmt_write">
		<legend>댓글 입력 영역</legend>
		<div class="cmt_title">댓글쓰기</div>
		<dl class="writing">
        	<dt>댓글</dt>
            <dd>
            	<textarea cols="85" rows="3" title="댓글 입력" name="fbc_content" id="fbc_content" maxlength="300" wrap="hard"></textarea>
            	<img alt="댓글입력" src="images/btn_confirm02.gif" alt="확인" id="btnCmtWrite">
            </dd>
		</dl>		
	</fieldset>
	</form>
</div>

</body>
</html>