<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>

<!-- 에디터 적용  시작 ----------------------------------->
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	  rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="summernote-0.8.9-dist/dist/summernote.js"></script>
<script src="summernote-0.8.9-dist/dist/lang/summernote-ko-KR.js"></script> 

<!-- 에디터 적용 끝 ----------------------------------->


<link rel="stylesheet" type="text/css" href="css/user.css" />
<script type="text/javascript" src="js/bBoard.js"></script>


<div class="index_wrap wrap_center">
	<form name="NoticeUpdateForm" id="NoticeUpdateForm" method="post"  action="NoticeUpdate.do">
			
		<input type="hidden" name="currentPage" value="${currentPage}" />
		<input type="hidden" name="n_no" value="${ndto.n_no}" /> 
 		
	
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
								<th scope="row"><span>작성자</span></th>
								<td><strong>${sessionScope.u_name }</strong></td>
							</tr>
							<tr>
								<th scope="row"><label for="fb_title"><span>제목</span></label></th>
								
								
								<td>
									<!-- name으로 값을 찾기때문에 값 적을 때 주의하기 !! -->
									<select style="height:60%" name="n_head" id="n_head" >
 										 <option value="choice" <c:out value="${ndto.n_head == 'choice'?'selected':''}"/>>말머리 선택</option>
  									     <option value="공지" <c:out value="${ndto.n_head == '공지'?'selected':''}"/>>공지</option>
  										 <option value="이벤트" <c:out value="${ndto.n_head == '이벤트'?'selected':''}"/>>이벤트</option>
									</select>
									
									<!-- DB에 저장된 제목 Textbox에 불러오기 -->
									<input type="text" name="n_title"  id="n_title" class="txt name" 
									       style="width:45%; height:60%;" maxlength="50" value="${ndto.n_title }" />
								</td>
							</tr>
							<tr>
								<th scope="row"><span>내용</span></th>
								<td>
									<section>
										<textarea id="summernote" name="n_content" >
											 <c:out value="${ndto.n_content}" /> 
										</textarea>
									</section>
								</td>
							</tr>
						</tbody>
					</table>
			</div>
				<input type="submit" id="NoticeUpdate" class="btn_white1" value=" 수 정 " style="width: 90px; height: 35px;" /> &nbsp; 
				<!-- NoticeDelete 버튼의 input type을 submit에서 button으로 바꿈 (원하는 noticedelete.do 컨트롤러에 올바르게 들어감)-->
				<input type="button" id="NoticeDelete" class="btn_white1" value=" 삭 제  " style="width: 90px; height: 35px;" /> &nbsp; 
				<input type="button" id="NoticeList" class="btn_white1" value=" 목 록 " style="width: 90px; height: 35px;" />
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
