$(document).ready(function(){
		/* QNA 게시판 */
		//LIST페이지  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 
		//글쓰기 작성 버튼 클릭
		$('#btn_QnaWrite').on('click',function(){
			$('form').attr('action','QnaWrite.do');
			$('form').submit();
		});
		
		//말머리 클릭
		$('#searchform input[type="button"].btn_white1').on('click',function(){
			$('#searchform input[name="head"]').val($(this).val());
			$('#searchform input[name="keyword"]').val('');
			document.form1.submit();
		});
		
		//검색
		$('#QnabtnSearch').on('click',function(){
			$('#searchform input[name="option2"]').val($('#searchform select[name="option"]').val());
			$('#searchform input[name="keyword2"]').val($('#searchform input[name="keyword"]').val());
			document.form1.submtit();
		});
		
		
		//VIEW페이지   ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		//목록 돌아가기 버튼 (write 페이지 버튼도 동일 기능)
		$('#QnaList').on('click',function(){
			$('form').attr('action','QnaList.do');
			$('form').submit();
		});
		
		
		//수정 버튼 (글 내용창에서 수정 원할 때) -> QnaUpdate.do로 이동해 QnaUpdate.jsp 불러옴
		$('#QnaUpdateView').on('click',function(){
			$('form').attr('action','QnaUpdate.do');
			$('form').submit();
		});
		
		
		//글 삭제버튼
 		$('#QnaDelete').on('click',function(){
			$('#QnaForm').attr('action','QnaDelete.do');
			$('#QnaForm').submit();
		}); 
		
 		
 		//WRITIE페이지  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
/* 			$('#summernote').summernote({
 				lang : 'ko-KR',
 				height : 300,
 				minHeight : null,
 				maxHeight : null,
 				focus : true,
 			});
*/
 		
 		//글쓰기 폼  -> /\n/gi(엔터) 를 요소 <br/>로 변경
		$('#QnaWriteForm').on('click',function(){
			$('[name=content]').val($('[name=content]').val().replace(/\n/gi,'<br/>')); 
		});
		
		
		$('#QnaWrite').on('click',function(){
			var head = $('#q_head').val();
			var title= $('#q_title').val();
			var content = $('#summernote').val();
			
			if(head=="choice"){
				alert("말머리를 선택해주세요");
				return false;
			}else if(title==""){
				alert("제목을 입력해주세요");
				return false;
			}else if(content==""){
				alert("내용을 입력해주세요");
				return false;
			}
			document.QnaWriteForm.submit();
		});
	
	
		/* UPDATE페이지 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
		$('#QnaUpdate').on('click',function(){
			var head = $('#q_head').val();
			var title= $('#q_title').val();
			var content = $('#summernote').val();
		
			if(head=="choice"){
				alert("말머리를 선택해주세요");
				return false;
			}else if(title==""){
				alert("제목을 입력해주세요");
				return false;
			}else if(content==""){
				alert("내용을 입력해주세요");
				return false;
			}
			document.QnaUpdateForm.submit();
		});
		
		
		
		/* Notice 게시판 */
		//LIST페이지  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		/* 글쓰기 작성 버튼 클릭
		$('#btn_NoticeWrite').on('click',function(){
			$('form').attr('action','QnaWrite.do');
			$('form').submit();
		});
		*/
		
		//말머리 클릭
		$('#Nsearchform input[type="button"].btn_white1').on('click',function(){
			$('#Nsearchform input[name="head"]').val($(this).val());
			$('#Nsearchform input[name="keyword"]').val('');
			document.Nform1.submit();
		});
		
		
		//VIEW페이지  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		//목록 돌아가기 버튼 (write 페이지 버튼도 동일 기능)
		$('#NoticeList').on('click',function(){
			$('form').attr('action','NoticeList.do');
			$('form').submit();
		});
});
	