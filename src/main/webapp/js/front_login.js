 $(document).ready(function(){
	 if (getCookie("id")) { // getCookie함수로 id라는 이름의 쿠키를 불러와서 있을경우
		 $('#user_id').val(getCookie("id"));//input 이름이 id인곳에 getCookie("id")값을 넣어줌
		 $('input:checkbox[id="id_save"]').attr("checked", true);
     }
	 
	 $('#login_btn').click(function(){
		 
		 var u_id=$('#user_id').val();
		 var u_pw=$('#user_pw').val();
		 if(u_id==""){
			 alert("아이디를 입력하세요");
			 $('#user_id').focus();
		 }else if(u_pw==""){
			 alert("비밀번호를 입력하세요");
			 $('#user_pw').focus();
			 return;
		 }else{
			if( $('input:checkbox[name="id_save"]').is(":checked") == true){
				   setCookie("id", $('#user_id').val(), 7); //쿠키이름을 id로 아이디입력필드값을 7일동안 저장
	        } else { // 아이디 저장을 체크 하지 않았을때
	            setCookie("id", $('#user_id').val(), 0); //날짜를 0으로 저장하여 쿠키삭제
	        }			 
			 $('#loginfrm').attr('method','post');
			 $('#loginfrm').attr('action','logincheck.do');
			 }
		}
		 
 );
	 });
 
 
 ////////////////////////////////////////////쿠키 함수
 function setCookie(name, value, expiredays) //쿠키 저장함수
 {
     var todayDate = new Date();
     todayDate.setDate(todayDate.getDate() + expiredays);
     document.cookie = name + "=" + escape(value) + "; path=/; expires="
             + todayDate.toGMTString() + ";"
 }

 function getCookie(Name) { // 쿠키 불러오는 함수
     var search = Name + "=";
     if (document.cookie.length > 0) { // if there are any cookies
         offset = document.cookie.indexOf(search);
         if (offset != -1) { // if cookie exists
             offset += search.length; // set index of beginning of value
             end = document.cookie.indexOf(";", offset); // set index of end of cookie value
             if (end == -1)
                 end = document.cookie.length;
             return unescape(document.cookie.substring(offset, end));
         }
     }
 }

