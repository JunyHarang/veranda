<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<%
	/* position for grid system */	
	int offset = 2 ;
	int mywidth = twelve - 2 * offset ;
	int formleft = 3 ;
	int formright = twelve - formleft ;
	int rightButton = 2 ;
%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>베란다에서 온 파프리카에 가입하기</title>
<style type="text/css">
</style>
	<script type="text/javascript">
		
		function idCheck() { /* 아이디 유효성 검사 */
			var id = document.joinform.id.value;
				
			if (id.length < 5 || id.length > 15) { /* 아이디 길이 확인 */
				alert('아이디는 5글자 이상 15글자 이하로 입력 해 주세요!');
				document.joinform.id.focus();
				return false;
			} // 아이디 길이 확인 if문 끝
			
			var url = '<%=FormNo%>meIdcheck&id='+id;
			window.open(url,'mywin','height=150,width=300');
			
			
		} // 아이디 유효성 검사 끝
		
		function handleOnInput(e) { /* 아이디 입력란에 영(대,소)숫자만 입력하게 설정 */
			e.value = e.value.replace(/[^A-Za-z0-9]/ig, '')
		}
		
		function isCheckFalse() { /* 아이디 유효성 검사 실패 시 */
			document.joinform.isCheck.valuse = false;
		}
		
		function checkForm() {
			var isCheck = document.joinform.isCheck.value;
			if (isCheck == 'false') {
				alert('아이디 중복 체크를 해 주세요!');
				return false;
			}
		}

		function pwdCheck() { /* 패스워드 유효성 검사 */
			
			var id = document.joinform.id.value;
			
			var pwd = document.joinform.pwd.value;
			
			var checkpwd = document.joinform.checkpwd.value;
			
			var chk_num = pwd.search(/[0-9]/g);		// 숫자 비교 시 사용될 변수
			   
		    var chk_eng = pwd.search(/[a-z]/ig);	// 영어(소문자) 비교 시 사용될 변수
			
			var pwd = document.joinform.pwd.value;
		    
			var overlappwd = document.joinform.overlappwd;
			
			    if(!/^[a-zA-Z0-9]{10,20}$/.test(pwd)){
			        alert("비밀번호는 숫자와 영문자 조합으로 10~20자리를 사용해야 합니다.");
			        document.joinform.pwd.focus();
			        return false;
			    }
			   
			    if(chk_num < 0 || chk_eng < 0){ /* 영소문자 + 숫자 조합 여부 검사 */
			        alert("비밀번호는 숫자와 영문자를 혼용하여야 합니다.");
			        document.joinform.pwd.focus();
			        return false;
			    } // if문 끝
			    
			    if(/(\w)\1\1\1/.test(pwd)){
			        alert("비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다.");
			        document.joinform.pwd.focus();
			        return false;
			    }
			    
			    if(pwd.search(id) > -1){
			        alert("ID가 포함된 비밀번호는 사용하실 수 없습니다.");
			        document.joinform.pwd.focus();
			        return false;
			    }
			
			if (pwd.length < 10 || pwd.length > 20) { /* 패스워드 길이 검사 */
				
				window.alert('비밀번호는 최소 10자리 20자리 이하여야 합니다!');
			
				document.joinform.pwd.focus();
	
				
				return false;
			} // 패스워드 길이 유효성 검사 if문 끝
			
			if (document.getElementById('pwd').value!='' && document.getElementById('checkpwd').value != '') { /* 패스워드 빈란 여부 검사 */
				
				if (document.getElementById('pwd').value==document.getElementById('checkpwd').value) { /* 패스워드가 같은지 검사 */
				
					document.getElementById('same').innerHTML='정상입니다!';
				
					document.getElementById('same').style.color='blue';
				
				} else {
					document.getElementById('same').innerHTML='다시 한번 확인 부탁 드립니다!';
					
					document.getElementById('same').style.color='red';
					
					return false;
				} // if-else문 끝
				
			} // 패스워드 공백 검사 if문 끝
			
			return true;
			
		} // 패스워드 유효성 검사 끝
		
		function handleOnInputPwd(e) { /* 패스워드 입력란에 영(대,소)숫자, 특문(!, @, #, $, %)만 입력하게 설정 */
			e.value = e.value.replace(/[^A-Za-z0-9!@#$%]/ig, '')
		}
		
		function handleOnInputPwdCheck(e) { /* 패스워드 확인 입력란에 영(대,소)숫자, 특문(!, @, #, $, %)만 입력하게 설정 */
			e.value = e.value.replace(/[^A-Za-z0-9!@#$%]/ig, '')
		}
		
		function isCheckFalse() { /* 비밀번호 유효성 검사 실패 시 */
			document.joinform.isCheck.valuse = false;
		}
		
		function nickCheck() {
			var nickname = document.joinform.nickname.value;
		
			if (nickname.length < 3 || nickname.length > 8) { /* 닉네임 길이 확인 */
				alert('닉네임은 3글자 이상 8글자 이하로 입력 해 주세요!');
				document.joinform.nickname.focus();
				return false;
			} // 닉네임 길이 확인 if문 끝
			
			if (document.joinform.nickname.value == 'false') { /* 중복 체크 확인 */
				alert('중복 확인을 눌러 주세요!');
				document.joinform.nickname.focus();
				return false;
			} // 중복 체크 if문 끝
			
			function nickisCheckFalse() { /* 닉네임 유효성 검사 실패 시 */
				document.joinform.nickisCheck.valuse = false;
			}
			
			var url = '<%=FormNo%>meNickcheck&nickname='+nickname;
			window.open(url,'mywin','height=150,width=300');
		} // nickname 중복 체크 끝
		
		function sexcheck() {
			var idnumber = document.joinform.idnumber.value.substring(0,1);
			
			if (idnumber == 1 || idnumber == 3) {
				joinform.sex[0].click();
			} else {
				joinform.sex[1].click();
			}
		} // 성별 유효성 검사 끝
		
		function emailcheck() {
			
			var email = document.joinform.email.value;
			var isCheck = document.joinform.emailcheck;
			var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if (email != regex) { /* 이메일 형식 검사 */
				alert('email 형식에 맞게 입력 해 주세요!!');
				document.joinform.email.focus();
				return false;
			} // 중복 체크 if문 끝
		}
		
				
		function service() {
			alert('죄송합니다. 서비스 준비 중 입니다.');
			return false;
		}
			
		/* $(document).ready(function(){
			$('select').niceSelect();
		}); */
		
				
	</script>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
    
    
</script>

</head>
<body>
 
<!-- CSS Form 받아오기 -->
<link rel="stylesheet" href="css/joinForm.css">

<div class="container">
<br>
<hr>

<div class="card bg-light">
<article class="card-body mx-auto" style="max-width: 400px;">
	<h4 class="card-title mt-3 text-center">회원 가입</h4>
	<p class="text-center">베란다에서 온 파프리카에 오신 것을 환영 합니다!</p>
	
	<p>
		<a href="" class="btn btn-block btn-naver" onclick="service();"> 
			<i class="fab fa-naver"></i>   네이버 인증하기</a>
		
		<a href="" class="btn btn-block btn-facebook" onclick="service();"> 
			<i class="fab fa-facebook-f"></i>   페이스북 인증하기</a>
		
		<a href="" class="btn btn-block btn-google" onclick="service();"> 
			<i class="fab fa-google"></i>		구글 인증하기</a>
		   
	</p>
	
	<p class="divider-text">
        <span class="bg-light">OR</span>
    </p>
    
	<form name="joinform" action="<%=FormYes%>" method="post">
	
	<%-- 아이디 입력란 --%>
	<div class="form-group input-group">
	
		<div class="input-group-prepend">
		
		    <span class="input-group-text"> 
		    	<i class="fa fa-user"></i> 
		    </span>
		 
		 </div>
		 
		  <input type="hidden" name="command" value="meInsert">
        <input type="hidden" name="isCheck" value="false">
        
        <input name="id" class="form-control" placeholder="아이디를 입력 해 주세요!" type="text" oninput="handleOnInput(this)" pattern="[A-Za-z0-9]+" data-toggle="tooltip" onkeyup="isCheckFalse();" value="${bean.user_id}" title="아이디는 5글자 이상 10글짜 이하로 입력 해 주세요!">
        
    	<input type="button" value="중복 확인" class="btn btn-info" onclick="idCheck();">
    
    </div> 
    
    <%-- 비밀번호 입력란 --%>
    <div class="form-group input-group">
	
		<div class="input-group-prepend">
		
		    <span class="input-group-text"> 
		    	<i class="fa fa-lock"></i> 
		    </span>
		 
		 </div>
        
        <input id="pwd" name="pwd" class="form-control" placeholder="비밀번호를 입력 해 주세요!" type="password" oninput="handleOnInputPwd(this)" onchange="pwdCheck();">
        &nbsp;&nbsp;
        <span id="same"></span>
        <br>
    </div>
    
     <div class="form-group input-group">
	
		<div class="input-group-prepend">
		
		    <span class="input-group-text"> 
		    	<i class="fa fa-lock"></i> 
		    </span>
		 
		 </div>
        
        <input id="checkpwd" name="checkpwd" class="form-control" placeholder="비밀번호를 한번 더 입력 해 주세요!" type="password" oninput="handleOnInputPwdCheck(this)" onchange="pwdCheck();">
        
    </div>
    
    <%-- 닉네임 입력란 --%>
	<div class="form-group input-group">
	
		<div class="input-group-prepend">
		
		    <span class="input-group-text"> 
		    	<i class="fa fa-user-o"></i> 
		    </span>
		 
		 </div>
        
        <input name="nickname" class="form-control" placeholder="닉네임을 입력 해 주세요!" type="text">
        
        <input type="hidden" name="command" value="meInsert">
        <input type="hidden" name="nickisCheck" value="false">
        
    	<input type="button" value="중복 확인" class="btn btn-nickcheck" onclick="nickCheck();">
    
    </div> 
    
    <%-- 이름 입력란 --%>
	<div class="form-group input-group">
	
		<div class="input-group-prepend">
		
		    <span class="input-group-text"> 
		    	<i class="fa fa-user-circle"></i> 
		    </span>
		 
		 </div>
        
        <input name="name" class="form-control" placeholder="이름을 입력 해 주세요!" type="text">
    
    </div> 
    
    <%-- 생년월일 & 주민번호 뒤 1자리 입력란 --%>
	<div class="form-group input-group">
	
		<div class="input-group-prepend">
		
		    <span class="input-group-text"> 
		    	<i class="fa fa-birthday-cake"></i> 
		    </span>
		 
		 </div>
        
        <input id="birth" name="birth" class="form-control" data-toggle="toggle" title="생년월일을 선택 해 주세요!" type="date">
    	&nbsp;&nbsp;
    	<input type="number" name="idnumber" class="form-control" placeholder="주민번호 뒤 1자리" data-toggle="toggle" title="주민번호 뒤 한자리를 입력 해 주세요! 1~4까지만 입력 해 주세요!" size="1" min="1" max="4" onclick="sexcheck();">
    </div> 
    
    
    <%-- 성별 입력란 --%>
	<div class="form-group input-group">
	
		<div class="input-group-prepend">
		
		    <span class="input-group-text"> 
		    	<i class="fa fa-venus-mars"></i> 
		    </span>
		 
		 </div>
        
        <input name="sex" class="form-control" type="radio">남자
        <input name="sex" class="form-control" type="radio">여자
    </div> 
    
    <%-- e-mail 입력란 --%>
	<div class="form-group input-group">
	
		<div class="input-group-prepend">
		
		    <span class="input-group-text"> 
		    	<i class="fa fa-mail-reply"></i> 
		    </span>
		 
		 </div>
        
        <input id="email" name="email" class="form-control" type="email" placeholder="이메일 주소를 입력 해 주세요!" onclick="emailcheck();">
       
        &nbsp;&nbsp;
        
        <span id="emailsame"></span>
    </div> 
    
    <%-- 주소 --%>
    <div class="form-group input-group">
	
		<div class="input-group-prepend">
		
		    <span class="input-group-text"> 
		    	<i class="fa fa-map-o"></i> 
		    </span>
		 
		 </div>
        
        <input type="text" id="sample2_postcode" name="sample2_postcode" placeholder="우편번호" readonly="readonly">
			<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample2_address" name="sample2_address" placeholder="주소" readonly="readonly"><br>
		<input type="text" id="sample2_detailAddress" name="sample2_detailAddress" placeholder="상세주소">
		<input type="text" id="sample2_extraAddress" name="sample2_extraAddress" placeholder="참고항목" readonly="readonly">
		 	
		 </div>
    
    <%-- 연락처 입력란 --%>
    <div class="form-group input-group">
   		 
    	 <div class="input-group-prepend">
		    
		    <span class="input-group-text"> 
		    	<i class="fa fa-phone"></i> 
		 	</span>
		 <select id="phone" name="phone" class="form-select">
		    <option value="-">-- 지역 번호--</option>
		    <option value="010">010</option>
		    <option value="02">02</option>
		    <option value="032">032</option>
		    <option value="051">051</option>
		    <option value="053">053</option>
		    <option value="062">062</option>
		    <option value="042">042</option>
		    <option value="052">052</option>
		    <option value="044">044</option>
		    <option value="031">031</option>
		    <option value="033">033</option>
		    <option value="043">043</option>
		    <option value="041">041</option>
		    <option value="063">063</option>
		    <option value="061">061</option>
		    <option value="054">054</option>
		    <option value="055">055</option>
		    <option value="064">064</option>
		</select>
		
	<%--	<input id="phone" name="phone" class="form-contorl" min="011" max="099" type="text"> --%>
    	<input id="phone1" name="phone1" class="form-control" min="111" max="9999" type="number">
    	<input id="phone2" name="phone2" class="form-control" min="1111" max="9999" type="number">
    </div> 
    </div> 
    <%-- 회원가입 버튼 --%>                                      
    <div class="form-group">
        <button type="submit" class="btn btn-warning btn-block" onclick="return overlapid();"> 회원가입  </button>
    </div> 
    
    <%-- 로그인으로 돌아가기 --%>      
    <p class="text-center">이미 가입하셨습니까? 
    	<a href="http://localhost/veranda/veranda?command=meLogin">로그인</a>
    </p>                                                                 
</form>

</article>
</div> <!-- card.// -->

</div> 
<!--container end.//-->

<br><br>
<article class="bg-secondary mb-3">  
<div class="card-body text-center">
    <h3 class="text-white mt-3">Bootstrap 4 UI KIT</h3>
<p class="h5 text-white">Components and templates  <br> for Ecommerce, marketplace, booking websites 
and product landing pages</p>   <br>
<p><a class="btn btn-warning" target="_blank" href="http://bootstrap-ecommerce.com/"> Bootstrap-ecommerce.com  
 <i class="fa fa-window-restore "></i></a></p>
</div>
<br><br>
</article>
</body>
</html>
<jsp:include page="/common/footer.jsp"></jsp:include>