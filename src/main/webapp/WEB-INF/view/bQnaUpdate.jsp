<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<!-- 에디터 적용  시작 ----------------------------------->
<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script type="text/javascript" src="js/config.js"></script>


<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>

<script src="summernote-0.8.9-dist/dist/lang/summernote-ko-KR.js"></script>


<!-- 에디터 적용 끝 ----------------------------------->
<link rel="stylesheet" type="text/css" href="css/user.css" />
<script type="text/javascript" src="js/bBoard.js"></script>

<!-- header -->
 <%@ include file="/inc/front_header.jsp"%>
 
<div class="index_wrap wrap_center">

	<h1 class="subtlt_h1">글 수정</h1>
	<h5 class="subinfo_h5">궁금하신 내용을 문의해주세요</h5>
	
	
	<form name="QnaUpdateForm" id="QnaUpdateForm" method="post"  action="QnaUpdate.do">
			
		<input type="hidden" name="currentPage" value="${currentPage}" />
		<input type="hidden" name="q_no" value="${qdto.q_no}" /> 
 		
	
		<fieldset>
			<legend>글수정</legend>
			<div class="qnotic_tb1">
					<table>
						<caption>게시글 수정</caption>
						<colgroup>						
							<col width="140" />		
						</colgroup>							
						<tbody>
							<tr>
								<th scope="row"><span>닉네임</span></th>
								<td><strong>${sessionScope.u_name}</strong></td>
							</tr>
							<tr>
								<th scope="row"><label for="fb_title"><span>제목</span></label></th>
								
								
								<td>
									<!-- name으로 값을 찾기때문에 값 적을 때 주의하기 !! -->
									<select style="height:60%" name="q_head" id="q_head" >
 										 <option value="choice" <c:out value="${qdto.q_head == 'choice'?'selected':''}"/>>말머리 선택</option>
  									     <option value="상품" <c:out value="${qdto.q_head == '상품'?'selected':''}"/>>상품문의</option>
 										 <option value="주문" <c:out value="${qdto.q_head == '주문'?'selected':''}"/>>주문문의</option>
  										 <option value="결제" <c:out value="${qdto.q_head == '결제'?'selected':''}"/>>결제문의</option>
									</select>
									
									<!-- DB에 저장된 제목 Textbox에 불러오기 -->
									<input type="text" name="q_title"  id="q_title" class="txt name" 
									       style="width:45%; height:60%;" maxlength="50" value="${qdto.q_title }" />
								</td>
							</tr>
							<tr>
								<th scope="row"><span>내용</span></th>
								<td>
									<section>
										<textarea id="summernote" name="q_content"  <%-- value="${qdto.q_content }" --%> >
											 <c:out value="${qdto.q_content}" /> 
										</textarea>
									</section>
								</td>
							</tr>
						</tbody>
					</table>
			</div>
		<!-- 	<div class="btn" style="padding:20px;"> -->
<!-- 				<button type="submit" id="QnsUpdate" class="btn_white1" style="width:90px;height:35px;"> 수 정 </button>
				&nbsp;
				<button type="button" id="QnaList" class="btn_white1" style="width:90px;height:35px;"> 목 록 </button> -->
				
				<input type="submit" id="QnaUpdate" class="btn_white1" value=" 수 정 " style="width: 90px; height: 35px;" /> &nbsp; 
				<input type="button" id="QnaList" class="btn_white1" value=" 목 록 " style="width: 90px; height: 35px;" />
			<!-- </div> -->
		</fieldset>
	</form>
</div>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			lang : 'ko-KR',
			height : 300,
			minHeight : null,
			maxHeight : null,
			focus : true,
		});
	});

	var postForm = function() {
		var contents = $('textarea[name="q_content"]').html(
				$('#summernote').code());
	}
</script>

  <!-- footer -->
 <%@ include file="/inc/front_footer.jsp"%>
