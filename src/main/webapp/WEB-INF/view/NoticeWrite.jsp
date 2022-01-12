<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<script type="text/javascript" src="js/Board.js"></script>
<script type="text/javascript" src="js/back.js"></script>


	<div class="index_wrap wrap_center">
	<form name="NoticeWriteForm" id="NoticeWriteForm" method="post"  action="NoticeWrite.do">
		<!-- 글 등록 영역 시작  -->
		<fieldset>
			<legend>글등록</legend>
			<div class="qnotic_tb1">
					<table>
						<caption>게시글 등록</caption>
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
									<select style="height:60%" name="n_head" id="n_head">
 										 <option value="choice">말머리 선택</option>
  									     <option value="공지">공지</option>
 										 <option value="이벤트">이벤트</option>
									</select>
									<input type="text" name="n_title"  id="n_title" class="txt name" style="width:45%;height:60%;" maxlength="50" />
								</td>
							</tr>
							<tr>
								<th scope="row"><span>내용</span></th>
								<td>
									<!-- 에디터 시작 -->
									<section>
											<textarea id="summernote" name="n_content"></textarea>
									</section>
									<!-- 에디터 끝-->								
								</td>
							</tr>
						</tbody>
					</table>
			</div>
			<div class="btnWrap" style="margin:0 auto; padding-top: 20px;">
				<input type="submit" id="NoticeWrite" class="btn_white1" value="등록" style="width: 90px; height: 35px;" />
				<input type="button" id="NoticeList" class="btn_white1" value="돌아가기" style="width: 90px; height: 35px;" />
			</div>
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
</script>