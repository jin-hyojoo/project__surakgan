
$(function () {
    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });

    
    //////////////////////////////////정보수정 완료
    $('#update_btn').on('click', function(){
    	if($('#u_pw').val() == ""){  
        alert('비밀번호를 입력해주세요');
        }else if($('#u_pw2').val() == ""){
  		  alert('비밀번호 재입력을 해주세요');
  	    }else if($('#u_hp2').val() == ""){
  		  alert('전화번호를 입력을해주세요');
  	    }else if($('#u_hp3').val() == ""){
  		  alert('전화번호를 입력을해주세요');
  	    }else{
  			alert('수정이 완료되었습니다. 다시 로그인해주세요');
  			$('#infofrm').attr('method','post');
  			$('#infofrm').attr('action','infoupdatePro.do');
  	    }
    })
    
    $('#del_btn').on('click',function(){
    	if($('#u_pw').val() == ""){  
            alert('비밀번호를 입력해주세요');
            }else if($('#u_pw2').val() == ""){
      		  alert('비밀번호 재입력을 해주세요');
      	    }else{
      			alert('탈퇴가 완료되었습니다. 그동안 수락간을 사랑해주셔서 감사드립니다');
      			$('#infofrm').attr('action','infodelPro.do');
      	    }
    
    })
});
