var ajaxConfig = [
{no:0, gubun: "userList", type:"get", dataType:"json", alt:"유저리스트", URL:"adminUserList.do", ajaxHandler : "userList"},
{no:1, gubun: "productList", type:"get", dataType:"json", alt:"상품리스트", URL:"adminProductList.do", ajaxHandler : "productList"},
{no:2, gubun: "boardList", type:"get", dataType:"text", alt:"게시판리스트", URL:"adminBoardList.do", ajaxHandler : "boardList"},
{no:3, gubun: "userUptGrade", type:"post", dataType:"text", alt:"유저등급수정", URL:"userUptGrade.do", ajaxHandler : "userUptGrade"},
/* 게시판 ajax */
{no:4, gubun: "qnaList", type:"get", dataType:"json", alt:"질문과답변리스트", URL:"adminQnaList.do", ajaxHandler : "qnaList"},
{no:5, gubun: "noticeList", type:"get", dataType:"json", alt:"공지리스트", URL:"adminNoticeList.do", ajaxHandler : "noticeList"},
{no:6, gubun: "qnaHeadList", type:"get", dataType:"json", alt:"Q말머리리스트", URL:"qnaHeadList.do", ajaxHandler : "qnaList"},
{no:7, gubun: "noticeHeadList", type:"get", dataType:"json", alt:"N말머리리스트", URL:"noticeHeadList.do", ajaxHandler : "noticeList"},
{no:8, gubun: "qnareply", type:"post", dataType:"json", alt:"질문과답변작성", URL:"adminNoticeView.do", ajaxHandler : "qnawrite"},
//상품삭제
{no:9, gubun: "productDel", type:"post", dataType:"text", alt:"상품삭제", URL:"productDel.do", ajaxHandler : "productDel"}
];
var pageConfig = {pageNum:1, startPage:1, endPage:1, blockPage:5, totalPage:1, searchKey:'', searchWord:'', head:''};
var th;
var thisNode;
$(document).ready(function() {
	//회원등급수정
	$(document).on('click','#upt_grade', function(){
		thisNode = $(this);
		ajaxAdmin(ajaxConfig[3].gubun, ajaxConfig[3]);
	}); 
	
	//상품등록
	$(document).on('click', '.board_list input[value=상품등록]', function(){
		$('.regProduct').css({'top':'200px'});
	});
	//상품삭제
	$(document).on('click', '.board_list input[value=상태변경]', function(){
		
		thisNode = $(this);
		ajaxAdmin(ajaxConfig[9].gubun, ajaxConfig[9]);
	});
	
	//Notice게시판 글쓰기
	$(document).on('click', '#btn_NoticeWrite', function(){
		window.location.href = "NoticeWrite.do?";
	});
	
	//게시판선택
	$('#board_user').on('click', function(){
		$('.board_list').show();
		$('.orderWrap').hide();
		th='<th>no</th><th>ID</th><th>이름</th><th>전화번호</th><th>등급</th><th>상태</th>';
		$(".board_search #searchWrap .userList").show();	
		$(".board_search #searchWrap .productList").hide();
		$(".board_search #searchWrap .boardList").hide();
			
		$(".board_search #searchWrap select[name=searchKey]").val("");
		$(".board_search #searchWrap input[name=searchWord]").val("");
		reset();
		
		ajaxAdmin(ajaxConfig[0].gubun, ajaxConfig[0]);
	});
	
	$('#board_product').on('click', function(){
		$('.board_list').show();
		$('.orderWrap').hide();
		th='<th>no</th><th>이미지</th><th>상품명</th><th>구분</th><th>가격</th><th>등록일</th><th>상태</th><th><input type="button" value="상품등록" /></th>';
		$(".board_search #searchWrap .userList").hide();	
		$(".board_search #searchWrap .productList").show();
		$(".board_search #searchWrap .boardList").hide();
		
		$(".board_search #searchWrap select[name=searchKey]").val("");
		$(".board_search #searchWrap input[name=searchWord]").val("");
		reset();
		
		ajaxAdmin(ajaxConfig[1].gubun, ajaxConfig[1]);	
	});
	
	$('#board_board').on('click', function(){
		$('.board_list').show();
		$('.orderWrap').hide();
		
	});
	
	$('#customer_order').on('click', function(){
		$('.board_list').hide();
		$('.orderWrap').show();
	});
	
	//게시판목록 ------------------------------------------------------------------------------------------
	$('#board_board').on('click', function(){
		$(".board_search #searchWrap .userList").hide();
		$(".board_search #searchWrap .productList").hide();
		$(".board_search #searchWrap .boardList").show();
		
		
		$('.Board_addBtn').remove(); 
		$('.Board_QnaHead').remove();
		$('.Board_NoticeHead').remove();
		$('.btn_write').remove();
		
			
		//■■■■  Qna & 공지 게시판 이동 버튼 생성   /*#cd2846*/빨강색코드
		var btnadd = '<button type="button" class="Board_addBtn" id="QnaBtn" style="background-color:#3e6cae; color:white;">Qna게시판</button>'
				   + '<button type="button" class="Board_addBtn" id="NoticeBtn" style="background-color:#3e6cae; color:white;">공지게시판</button>';
		$('.board_search').append(btnadd);
	});
	
	//생성한 Qna버튼 클릭 (동적으로 생성된 태그 처리) -------------------------------------------------------------------
	$(document).on("click","#QnaBtn",function(){
		$('#QnaBtn').css("background-color","#cd2846");
		$('#NoticeBtn').css("background-color","#3e6cae");
		
		//qna,notice말머리와 글쓰기 버튼 삭제(초기화)
		$('.Board_QnaHead').remove();
		$('.Board_NoticeHead').remove();
		$('.btn_write').remove();
		
		//# Qna게시판의 말머리 버튼 생성
		var QnaHead =/*'<button type="button" class="Board_QnaHead" id="QnaHead_all">전체</button>'
					+'<button type="button" class="Board_QnaHead" id="QnaHead_item">상품</button>'
					+'<button type="button" class="Board_QnaHead" id="QnaHead_order">주문</button>'
					+'<button type="button" class="Board_QnaHead" id="QnaHead_pay">결제</button>';*/
					 '<input type="button" class="Board_QnaHead" id="QnaHead_all" value="전체">'
					+'<input type="button" class="Board_QnaHead" id="QnaHead_item" value="상품">'
					+'<input type="button" class="Board_QnaHead" id="QnaHead_order" value="주문">'
					+'<input type="button" class="Board_QnaHead" id="QnaHead_pay" value="결제">';
			
		$(".board_search").append(QnaHead); 
		
		th='<th>no</th><th>분류</th><th>제목</th><th>이름</th><th>작성일</th><th>조회수</th>';
		$(".board_search #searchWrap select[name=searchKey]").val("");
		$(".board_search #searchWrap input[name=searchWord]").val("");
		reset();
	
		ajaxAdmin(ajaxConfig[4].gubun, ajaxConfig[4]);
	});
	

	//생성한 Notice버튼 클릭 (동적으로 생성된 태그 처리) -------------------------------------------------------------------
	$(document).on("click","#NoticeBtn",function(){
		$('#NoticeBtn').css("background-color","#cd2846");
		$('#QnaBtn').css("background-color","#3e6cae");
		
			//qna,notice말머리와 글쓰기 버튼 삭제(초기화)
			$('.Board_QnaHead').remove();
			$('.Board_NoticeHead').remove();
			$('.btn_write').remove();
			
			//# Notice게시판의 말머리 버튼 생성
			var NoticeHead =/*'<button type="button" class="Board_NoticeHead" id="NoticeHead_all">전체</button>'
						   +'<button type="button" class="Board_NoticeHead" id="NoticeHead_notice">공지</button>'
						   +'<button type="button" class="Board_NoticeHead" id="NoticeHead_event">이벤트</button>'*/
							'<input type="button" class="Board_NoticeHead" id="NoticeHead_all" value="전체">'
						    +'<input type="button" class="Board_NoticeHead" id="NoticeHead_notice" value="공지">'
						    +'<input type="button" class="Board_NoticeHead" id="NoticeHead_event" value="이벤트">'
						    +'<button type="button" class="btn_write" id="btn_NoticeWrite"' 
					     	+'style="background-color:#fff;color:#747474;font-weight: normal; border:1px solid #B8B8B8; border-radius: 8px; cursor: pointer;">'
							+'<img src="images/ico-btn-write.gif" alt="글쓰기" />&nbsp;글쓰기</button>';
			$(".board_search").append(NoticeHead);
			
			
			
			th='<th>no</th><th>분류</th><th>제목</th><th>이름</th><th>작성일</th><th>조회수</th>';
			$(".board_search #searchWrap select[name=searchKey]").val("");
			$(".board_search #searchWrap input[name=searchWord]").val("");
			reset();
			
			ajaxAdmin(ajaxConfig[5].gubun, ajaxConfig[5]);
	});
	
	
	/* 말머리 */
	//QNA말머리 클릭 시 리스트 
	$(document).on('click', '.Board_QnaHead', function(){
		qhead=$(this).val();
		headset(qhead);

		//window.location.href = "adminQnaList.do?qhead="+$(this).val()+"&pagenum="+pageConfig.pageNum;
		ajaxAdmin(ajaxConfig[6].gubun, ajaxConfig[6]);
	});
	
	//Notice말머리 클릭 시 리스트 
	$(document).on('click', '.Board_NoticeHead', function(){
		nhead=$(this).val();
		headset(nhead);
		ajaxAdmin(ajaxConfig[7].gubun, ajaxConfig[7]);
	});
	
	
	//검색  --------------------------------------------------------------------------------------------------------
	$('.board_search #searchWrap input[type=button]').on('click', function(){
		reset();
		var gubun=$('.board_search #gubun').val()
		if(gubun==''){
			return false;
		}else if(gubun=='userList'){
			ajaxAdmin(ajaxConfig[0].gubun, ajaxConfig[0]);
		}else if(gubun=='productList'){
			ajaxAdmin(ajaxConfig[1].gubun, ajaxConfig[1]);
		}else if(gubun=='qnaList'){
			ajaxAdmin(ajaxConfig[4].gubun, ajaxConfig[4]);
		}else if(gubun=='noticeList'){
			ajaxAdmin(ajaxConfig[5].gubun, ajaxConfig[5]);
		}else if(gubun=='qnaHeadList'){
			ajaxAdmin(ajaxConfig[6].gubun, ajaxConfig[6]);
		}else if(gubun=='noticeHeadList'){
			ajaxAdmin(ajaxConfig[7].gubun, ajaxConfig[7]);
		}
	});
	
	//페이지이벤트
	$(document).on('click', '#paging a', function(){
		var gubun=$(this).attr('class');
		var pageNum=$(this).text();
		if(pageNum=='<이전'){
			pageNum = pageConfig.startPage-pageConfig.blockPage;
		}else if(pageNum=='다음>'){
			pageNum = pageConfig.startPage+pageConfig.blockPage;
		}
		pageConfig.pageNum = pageNum;
			
		if(gubun=='userList'){
			ajaxAdmin(ajaxConfig[0].gubun, ajaxConfig[0]);
		}else if(gubun=='productList'){
			ajaxAdmin(ajaxConfig[1].gubun, ajaxConfig[1]);
		}else if(gubun=='qnaList'){
			ajaxAdmin(ajaxConfig[4].gubun, ajaxConfig[4]);
		}else if(gubun=='noticeList'){
			ajaxAdmin(ajaxConfig[5].gubun, ajaxConfig[5]);
		}else if(gubun=='qnaHeadList'){
			ajaxAdmin(ajaxConfig[6].gubun, ajaxConfig[6]);
		}else if(gubun=='noticeHeadList'){
			ajaxAdmin(ajaxConfig[7].gubun, ajaxConfig[7]);
		}
		
		return false;
	});
	
});

function userList(res){
	$('.board_list tbody').empty();
	
	$.each(res.alist, function(index, value) {
		var grade=null;
		var state=null;
		if(value.u_grade==0)	grade="회원";
		else if(value.u_grade==1)	grade="직원";
		else if(value.u_grade==2)	grade="관리자";
		if(value.u_state==0)	state='활동중';
		else	state='탈퇴';
		var source = '<tr><td>'+value.u_no+'</td><td>'+value.u_id+'</td><td>'+value.u_name+'</td><td>'+value.u_hp+'</td><td>'
		if($('#u_grade').val()==2){
			source+='<select name="grade" style="height:25px;"><option value="2"';
				if(grade=="관리자")	source += 'selected="selected"';
			source += '>관리자</option><option value="1"';
				if(grade=="직원")	source += 'selected="selected"';
			source += '>직원</option><option value="0"';
				if(grade=="회원")	source += 'selected="selected"';
			source += '>회원</option></select><input type="button" value="수정" id="upt_grade">';
		}
		else{
			source += grade;
		}
		
		source+='</td><td>'+state+'</td>';
		var template = Handlebars.compile(source);
         $('.board_list tbody').append(template(value));
	});
	
	paging(res.pdto, res.gubun);
}

function productList(res){
	$('.board_list tbody').empty();
	$.each(res.alist, function(index, value) {
		//날짜
		var d = new Date(value.i_regdate);
		var month = '' + (d.getMonth() + 1);
		var day = '' + d.getDate();
		var year = d.getFullYear();
		if (month.length < 2) month = '0' + month;
		if (day.length < 2) day = '0' + day;
		var date = year+"-"+month+"-"+day; 
		
		//상태
		var state;
		if(value.i_state==0){
			state="판매중";
		}else if(value.i_state==1){
			state="판매종료";
		}
		
		var source = '<tr><td>'+value.i_no+'</td><td><img src="product/'+value.i_img+'" alt="상품" /></td><td>'+value.i_menu+'</td><td>'
			+value.c_type+'/'+value.c_gubun+'</td><td>'+value.i_price+'</td><td>'+date+'</td><td>'+state+'</td><td><input type="button" value="상태변경" alt="'+value.i_state+'"/></td>';
		var template = Handlebars.compile(source);
         $('.board_list tbody').append(template(value));
	});
	
	paging(res.pdto, res.gubun);
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//회원등급수정
function userUptGrade(res){
	$(".board_search #searchWrap select[name=searchKey]").val("");
	$(".board_search #searchWrap input[name=searchWord]").val("");
	reset();
	ajaxAdmin(ajaxConfig[0].gubun, ajaxConfig[0]);
}
//상품상태수정
function productDel(res){
	$(".board_search #searchWrap select[name=searchKey]").val("");
	$(".board_search #searchWrap input[name=searchWord]").val("");
	reset();
	ajaxAdmin(ajaxConfig[1].gubun, ajaxConfig[1]);
}
//Qna게시판 리스트   --------------------------------------------------------------------------------------------------------
function qnaList(res){
	$('.board_list tbody').empty();

	$.each(res.alist, function(index, value) {
		var d = new Date(value.q_regdate);
		var month = '' + (d.getMonth() + 1);
		var day = '' + d.getDate();
		var year = d.getFullYear();
		if (month.length < 2) month = '0' + month;
		if (day.length < 2) day = '0' + day;
		var date = year+"-"+month+"-"+day; 

		//no	분류	제목	이름	작성일	조회수  "&pagenum="+pageConfig.pageNum
		var source = '<tr><td>'+value.q_no+'</td><td>'+value.q_head+'</td><td>'+'<a href="bQnaView.do?num='+value.q_no+'&pagenum='+pageConfig.pageNum+'";>'
				   + value.q_title+'</a></td><td>'+value.u_name+'</td><td>'+date+'</td><td>'+value.q_readcount+'</td>';
	
		var template = Handlebars.compile(source);
		$('.board_list tbody').append(template(value));
	});

	paging(res.pdto, res.gubun);
	
}

//Notice게시판 리스트   --------------------------------------------------------------------------------------------------------
function noticeList(res){
	$('.board_list tbody').empty();

	$.each(res.alist, function(index, value) {
		var d = new Date(value.n_regdate);
		var month = '' + (d.getMonth() + 1);
		var day = '' + d.getDate();
		var year = d.getFullYear();
		if (month.length < 2) month = '0' + month;
		if (day.length < 2) day = '0' + day;
		var date = year+"-"+month+"-"+day; 
		
		//no	분류	제목	이름	작성일	조회수   
		var source ='<tr><td>'+value.n_no+'</td><td>'+value.n_head+'</td><td>'+'<a href="NoticeUpdate.do?num='+value.n_no
				   +'&currentpage='+ pageConfig.pageNum +'">'
				   + value.n_title+'</a></td><td>'+value.n_writer+'</td><td>'+date+'</td><td>'+value.n_readcount+'</td>';

		var template = Handlebars.compile(source);
		$('.board_list tbody').append(template(value));
	});
	paging(res.pdto, res.gubun);
}



//초기화
function reset(){
	pageConfig.pageNum=1;
	pageConfig.startPage=1;
	pageConfig.endPage=1;
	pageConfig.totalPage=1;
	pageConfig.searchKey=$('#searchWrap select[name=searchKey]').val();
	pageConfig.searchWord=$('#searchWrap input[name=searchWord]').val();
}
function headset(boardhead){
	pageConfig.head=boardhead;
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*페이징*/
function paging(res, gubun){
	pageConfig.startPage=res.startPage;
	pageConfig.endPage=res.endPage;
	pageConfig.totalPage=res.totalPage;
	$('.board_list #paging center').empty();
	var source='';
	if(res.startPage!=1){
		source+='<span><a href="#" class='+gubun+'>&lt;이전</a></span>';
	}
	for(var i=res.startPage; i<=res.endPage; i++){
		source+='<span><a href="#" class='+gubun+'>&nbsp;'+i+'&nbsp;</a></span>';
	}
	if(res.endPage!=res.totalPage){
		source+='<span><a href="#" class='+gubun+'>다음&gt;</a></span>';
	}
    $('.board_list #paging center').append(source);
	$('.board_list #paging').show();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*ajax*/
function ajaxAdmin(gubun, ele){
	if(gubun=="userList" || gubun=="productList" || gubun=="qnaList" || gubun=="noticeList"|| gubun=="qnaHeadList"|| gubun=="noticeHeadList"){
		$('.board_list thead tr').empty();
		$('.board_list thead tr').append(th);
		$('.board_search #gubun').val(gubun);
	}
	
	var params = ajaxParams(gubun);
	$.ajax({
		type:ele.type,
		dataType:ele.dataType,
		url:ele.URL,
		data:params,
		success:eval(ele.ajaxHandler)
	});
}

//파라미터 값 
function ajaxParams(gubun) {
	var params = null;
	if(gubun == "userList" || gubun == "productList" || gubun =="qnaList"  || gubun =="noticeList"|| gubun=="qnaHeadList"|| gubun=="noticeHeadList"){
		params = {pageNum:eval(pageConfig.pageNum),
				searchKey:pageConfig.searchKey,
				searchWord:pageConfig.searchWord,
				head:pageConfig.head};
	}else if(gubun == "userUptGrade"){
		params = {no:$(thisNode).parents('tr').children().first().text(),
				grade:$(thisNode).prev().val()};
	}else if(gubun == "productDel"){
		params = {no:$(thisNode).parents('tr').children().first().text(),
				state:$(thisNode).attr('alt')};
	}
	console.log(params);
	return params;
}

//에러 확인용 
var gOnException = function (xhr, status, error) {
	var eMsg = "code : " + xhr.status + "\n"+"message : "+ xhr.responseText+"\n"+"error : "+ error;		
	alert(eMsg); 
}