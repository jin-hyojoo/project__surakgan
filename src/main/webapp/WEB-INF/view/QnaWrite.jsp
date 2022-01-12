<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 에디터 적용  시작 ----------------------------------->
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	  rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="css/front_common.css">
<script type="text/javascript" src="js/config.js"></script>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="summernote-0.8.9-dist/dist/summernote.js"></script>
<script src="summernote-0.8.9-dist/dist/lang/summernote-ko-KR.js"></script> 


<!-- 에디터 적용 끝 ----------------------------------->

<link rel="stylesheet" type="text/css" href="css/user.css" />
<script type="text/javascript" src="js/Board.js"></script>
<!-- header -->
 <%@ include file="/inc/front_header.jsp"%>

	<div class="index_wrap wrap_center">
	<!-- BreadCrumb -->
	<h1 class="subtlt_h1">질문과 답변</h1>
	<h5 class="subinfo_h5">궁금하신 내용을 문의해주세요</h5>
<!-- 	
		<ul class="breadcrumb_sub_items">
		<li class="breadcrumb-item"><a href="#">홈</a></li>
		<li class="breadcrumb-item"><a href="#">고객센터</a></li>
		<li class="breadcrumb-item active" aria-current="#">질문과 답변</li>
	</ul>
-->
	<form name="QnaWriteForm" id="QnaWriteForm" method="post"  action="QnaWrite.do">
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
								<td><strong>${sessionScope.u_name}</strong></td>
							</tr>
							<tr>
								<th scope="row"><label for="fb_title"><span>제목</span></label></th>
								<td>
									<select style="height:60%" name="q_head" id="q_head">
 										 <option value="choice">말머리 선택</option>
  									     <option value="상품">상품문의</option>
 										 <option value="주문">주문문의</option>
  										 <option value="결제">결제문의</option>
									</select>
									<input type="text" name="q_title"  id="q_title" class="txt name" style="width:45%;height:60%;" maxlength="50" />
								</td>
							</tr>
							<tr>
								<th scope="row"><span>내용</span></th>
								<td>
									<!-- 에디터 시작 -->
									<section>
											<textarea id="summernote" name="q_content" cols="150" rows="30"></textarea>
									</section>
									<!-- 에디터 끝-->								
								</td>
							</tr>
						</tbody>
					</table>
			</div>
			<div class="btnWrap" style="margin:0 auto; padding-top: 20px;">
				<input type="submit" id="QnaWrite" class="btn_white1" value="등록" style="width: 90px; height: 35px;" />
				<input type="button" id="QnaList" class="btn_white1" value="돌아가기" style="width: 90px; height: 35px;" />
			</div>
		</fieldset>
	</form>
</div>

  <!-- footer -->
 <%@ include file="/inc/front_footer.jsp"%> 
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			lang : 'ko-KR',
			height : 300,
			minHeight : null,
			maxHeight : null,
			focus : true,
			
			/* //이미지 업로드 위한 콜백함수 (이미지 업로드시 이벤트 발생시킴)
			callbacks: {
				onImageUpload: function(files, editor, welEditable) {
 					for (var i = files.length - 1; i >= 0; i--) 
		            	sendFile(files[i], this); 
				}
			} */
		});
	});
	
/* 		
		function sendFile(file,el){
			//이미지 파일 전송하기 위해 폼 객체 생성
			var form_data = new FormData();
			form_data.append('file',file);
			$.ajax({  //파일 업로드 처리
				data:form_data,
				type:"POST",
				url:"/image",
				cache:false,
				contentType:false,
			    enctype: 'multipart/form-data',
				processData:false,
				success:function(url){
					//summernote의 editor.insertImage기능 -> 이미지 삽입
					 $(el).summernote('editor.insertImage', url);
			         // $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
				 }
			})
		}
	}); */
</script>