var subList=new Array();
var ctList=new Array();
$(document).ready(function(){
	$('#close').on('click', function(){
		$('.regProduct').css({'top':'-3000px'});
	});
	$('.board_search').on('click', function(){
		$('.regProduct').css({'top':'-3000px'});
	});
	
	$('#regBtn').on('click', function(){
		var params = new FormData();		
		params.append('i_gubun', $('#i_gubun').val());
		params.append('i_menu', $('#i_menu').val());
		params.append('i_price', $('#i_price').val());
		params.append('i_kcal', $('#i_kcal').val());
		params.append('main_img', $('#i_img')[0].files[0]);
		for (var i = 0; i < subList.length; i++) {
			params.append('subList',subList[i], subList[i].name);
		}
		for (var i = 0; i < ctList.length; i++) {
			params.append('ctList',ctList[i], ctList[i].name);
		}
		console.log(params);
		$.ajax({
			type:'POST',
			dataType:'text',
	        url:'productInsert.do',
	        data:params,
	        contentType:false,
	        enctype:'multipart/form-data',
	        processData:false,
	        success:function(res){
	        	$('.regProduct').css({'top':'-3000px'});
	        	$(".board_search #searchWrap select[name=searchKey]").val("");
	     		$(".board_search #searchWrap input[name=searchWord]").val("");
	     		reset();
	     		
	     		ajaxAdmin(ajaxConfig[1].gubun, ajaxConfig[1]);
	         }     
		});  
	});
	
	//내PC 첨부파일 시작
	var subfile='';
	var scnt=0;
	$('#i_sub').on('click', function(){
		subfile=$('<input type="file" id="userfile" />');
		subfile.click();
		subfile.change(function(){
	   		var partname=$(subfile[0]).val().substring($(subfile[0]).val().lastIndexOf("\\")+1);
	   		var str='<input type="checkbox" name=checkList />'
	   			+'<input type="text" name="subList" class="subList" value="'+partname+'" readonly="readonly"/>';
	   		$('#subDiv').append(str);
	   		var dataList=subfile[0].files[0];
	   		subList[scnt]=dataList;
	   		scnt++;
		});
	});
	
	var ctfile='';
	var ccnt=0;
	$('#i_ct').on('click', function(){
		ctfile=$('<input type="file" id="userfile" />');
		ctfile.click();
		ctfile.change(function(){
	   		var partname=$(ctfile[0]).val().substring($(ctfile[0]).val().lastIndexOf("\\")+1);
	   		var str='<input type="checkbox" name=checkList />'
	   			+'<input type="text" name="ctList" class="ctList" value="'+partname+'" readonly="readonly"/>';
	   		$('#ctDiv').append(str);
	   		var dataList=ctfile[0].files[0];
	   		ctList[ccnt]=dataList;
	   		ccnt++;
		});
	});
	//내PC 첨부파일 끝
	    
    //첨부 파일 삭제 시작
	$(document).on('click', '#subDiv input[type=checkbox]', function(){
	  	 if($(this).prop('checked')){
	  		 $(this).next().remove();
	  		 $(this).remove();
	  	 }
    });
	$(document).on('click', '#ctDiv input[type=checkbox]', function(){
	  	 if($(this).prop('checked')){
	  		 $(this).next().remove();
	  		 $(this).remove();
	  	 }
   });
    //첨부 파일 삭제 끝
});