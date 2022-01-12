   //■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//주소 검색 API
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }


//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
//유효성 검사 패턴 관련
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
var ptnUserId =/^[a-z]{1}(?=.*\d)[a-z\d]{5,11}$/; //영소문자+숫자 6~12자 이내
var ptnHp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; //휴대폰 번호 체크
var ptnOnlyNum = /^[\d]+$/;
var ptnUserPw = /^(?=.*\d)(?=.*[a-z])[a-z\d]{8,16}$/; //(8~16 영소문자+숫자 형식)
var ptnMail = /[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+(\.[-!#$%&'*+\/^_~{}|0-9a-zA-Z]+)*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
var ptnUserName = /^[가-힣a-zA-Z]{2,8}$/; //사용자이름
var ptnLwEngNum = /^[a-z0-9+]*$/; //영소문자,숫자만 가능, 입력값없어도 ok


var idck = 0;
$(document).ready(function() {
	$("#u_mail2").val('');
	$("#u_id").attr("disabled",false);
	/**아이디 중복확인**/
	$('#u_id').on('change',function() {
        //userid 를 param.
        var u_id = $('#u_id').val(); 
        if(!ptnUserId.test(u_id)){
			$('#idchk').html('아이디를 확인해주세요. 6~12자의 영소문자, 숫자만 사용가능합니다.');
			$('#idchk').css('color','red');
			$('#u_id').val("");
			$('#u_id').focus();
        }else{
        $.ajax({
           	type:'GET',
        	dataType : 'json',
        	url :'idcheck.do',
            data :'u_id='+u_id,
            contentType: "application/json; charset=UTF-8",
            success:function(data){
            	console.log(data);
                if (data > 0) {
                	$('#idchk').empty();
                    $('#idchk').html('존재하는 아이디입니다. 새로운 아이디를 입력해주세요');
                    $('#idchk').css('color','red');
                    $('#u_id').val("");
        			$('#u_id').focus();
                } else {
                	 $('#idchk').empty();
                     $('#idchk').html('사용가능한 아이디입니다.');
                     $('#idchk').css('color','green');
                     //아이디가 중복하지 않으면  idck = 1 
                     idck = 1;
                    $("#u_id").attr("disabled",true);
                    $("#u_id").append('<input type="hidden" name="u_ID" id="u_ID" class="txt" value="'+u_id+'">');
                    $('#u_pw').focus();  
                    
                }

        },
        error : function(error) {
            
            alert("error : " + error);
        } 
        });
        }    
       
    });
    
    
    
    /**전화번호 중복체크**/
	$('#u_hp3').on('change',function() {
        
        //userid 를 param.
        var u_hp1 = $('#u_hp1 option:selected').val();
        var u_hp2 = $('#u_hp2').val();
        var u_hp3 = $('#u_hp3').val();
        var u_hp = u_hp1+"-"+u_hp2+"-"+u_hp3;
        
        if(!ptnHp.test(u_hp)){
        	$('#phchk').html('전화번호를 확인해주세요');
        	$('#u_hp2').val("");
        	$('#u_hp3').val("");
        	$('#u_hp2').focus();
        }else{
        $.ajax({
        	type:'GET',
        	dataType : 'json',
        	url :'hpcheck.do',
            data :'u_hp='+u_hp,
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data > 0) {                 
                    $('#phchk').empty();
                    $('#phchk').html('전화번호를 확인해주세요');
                    $('#phchk').css('color','red');
                    $('#u_hp2').val("");
                	$('#u_hp3').val("");
                	$('#u_hp2').focus();
                    
                } else {
                    $('#phchk').empty();
                    $('#phchk').html('사용가능한 전화번호입니다.');
                    $('#phchk').css('color','green');
                    //아이디가 중복하지 않으면  idck = 1 
                    idck = 1;
                    $('#u_mail1').focus();
                    
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
        }     
    });
	
    
    /**이메일**/
	$('#u_mail3').on('change',function(){
		$('#u_mail3 option:selected').each(function(){

			if($('#u_mail3').val() == 1){
				$("#u_mail2").attr("disabled",false);
			}else{
				$("#u_mail2").val($(this).text()); //선택값 입력
				$("#u_mail2").attr("disabled",true); //비활성화
	            $('#u_mail2').append('<input type="hidden" name="u_mail4" id="u_mail4" value="'+$("#u_mail2").val()+'">');
			}
		})
	});
	
	/**비밀번호 확인**/
	$('#u_pw').on('change keyup paste',function(){
		if(!ptnUserPw.test($('#u_pw').val())){
			$('#pwchk').empty();
			$('#pwchk').html('비밀번호를 확인해주세요.');
			$('#pwchk').css('color','red');
		}else{
			$('#pwchk').empty();
			$('#pwchk').html('사용가능한 비밀번호입니다.');
			$('#pwchk').css('color','green');
		};
	});
	
	$('#u_pw2').keyup(function(){
		if($('#u_pw').val()!=$('#u_pw2').val()){
			$('font[name=check]').html('비밀번호를 확인해주세요.');
			$('font[name=check]').attr('color','red');
		}else{
			$('font[name=check]').html('사용가능한 비밀번호입니다.');
			$('font[name=check]').attr('color','green');
		}
	});

});


 