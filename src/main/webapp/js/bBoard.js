document.write('<script src="js/back.js"></script>');


$(document).ready(function(){

		/* QNA 게시판 */
//		//LIST페이지  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 
//		//글쓰기 작성 버튼 클릭
//		$('#btn_QnaWrite').on('click',function(){
//			$('form').attr('action','QnaWrite.do');
//			$('form').submit();
//		});
		
		//VIEW페이지   ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		//목록 돌아가기 버튼 (write 페이지 버튼도 동일 기능)
		$('#QnaList').on('click',function(){
			window.location.href = "admin.do?";
		});
		
		//질문과 답변 글 수정
		$('#QnaUpdateView').on('click',function(){
			/*넘기는 값 하나일 떄 아래와 같은 방법으로 url에서 전달하는 데이터 갖고 옴
			var urldata = $(location).attr('search').slice($(location).attr('search').indexOf('=') + 1);*/
			
			// 넘기는 값 두개일 떄 url나누는 코드
		    var q_no = [], hash;
		    var urldata = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
		    for(var i = 0; i < urldata.length; i++)
		    {
		        hash = urldata[i].split('=');
		        q_no.push(hash[1]);
		        q_no[hash[0]] = hash[1];
		    }
			window.location.href = "QnaUpdate.do?num=" + q_no[0];
		});
		
		
		//QNA글 삭제버튼
 		$('#QnaDelete').on('click',function(){
 			var n_no = [], hash;
		    var urldata = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
		    for(var i = 0; i < urldata.length; i++)
		    {
		        hash = urldata[i].split('=');
		        n_no.push(hash[1]);
		        n_no[hash[0]] = hash[1];
		    }
		    
		    //컨트롤러로 이동
 			window.location.href = "QnaDelete.do?num=" + n_no[0];
		}); 
		
 		
 		//WRITIE페이지  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
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
		
		
		
//		--------------------------------------------------------------------------------------------------
		
		
		/* Notice 게시판 */
 		//WRITIE페이지  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
 		//글쓰기 폼  -> /\n/gi(엔터) 를 요소 <br/>로 변경
		$('#NoticeWriteForm').on('click',function(){
			$('[name=content]').val($('[name=content]').val().replace(/\n/gi,'<br/>')); 
		});
		
		
		$('#NoticeWrite').on('click',function(){
			var head = $('#n_head').val();
			var title= $('#n_title').val();
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
			document.NoticeWriteForm.submit();
		});
		
		/* UPDATE페이지 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ */
		//공지글 수정
		$('#NoticeUpdate').on('click',function(){
			var head = $('#n_head').val();
			var title= $('#n_title').val();
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
			document.NoticeUpdateForm.submit();
		});
		
		//공지글 삭제버튼
 		$('#NoticeDelete').on('click',function(){
 			var n_no = [], hash;
		    var urldata = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
		    for(var i = 0; i < urldata.length; i++)
		    {
		        hash = urldata[i].split('=');
		        n_no.push(hash[1]);
		        n_no[hash[0]] = hash[1];
		    }
		    
		    //컨트롤러로 이동
 			window.location.href = "NoticeDelete.do?num=" + n_no[0];
		}); 
 		
 		
 		//공지글  - 목록 돌아가기
 		$('#NoticeList').on('click',function(){
 			window.location.href = "admin.do?";
		});
 	
});
	