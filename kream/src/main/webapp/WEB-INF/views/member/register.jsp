<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" /> 
<%@ include file="../header.jsp" %>

<link rel="stylesheet" href="${cpath }/resources/css/style.css?ver=1">
<style>

input[type="text"], input[type="password"] {
		all: unset;
		width: 400px;
		border-bottom: 2px solid black;
		padding-bottom: 8px;
		margin : 0;
	}
	
	input[type="submit"] {
		all: unset;
		font-size: 15px;
 		width: 400px;
		height: 40px;
		margin-top: 50px;
 		padding: 5px 0;
		text-align: center;
		font-weight: bold;
		cursor: pointer;
		color: white;
		background-color: #e2e2e2;
		border-radius: 12px;
		
	}
	input[type="submit"] {
		background-color: #e2e2e2;
		cursor: default;
	}
	input:focus::-webkit-input-placeholder {
	 	color: transparent;
	}
	form.regi-form .pnum, .mail {
		font-size: 13px;
		font-weight: 900;
		margin: 0;
		padding: 0;
	} */
</style>
</head>
<body>
<div class="register-box">
	<h2 class="help_title">회원가입 </h2>
	
	<div class="register-box-body">
		<p class="login-box-msg">회원가입 페이지</p>
		<form method="post"  class="regi_form">
			<div>
			<div class=""><h4>이메일 주소</h4></div>
			<div class=""><input type="text" name="email" oninput="funcCheckEmail()" placeholder="예)itbank@itbank.co.kr"  required autofocus></div>
			<span id="checkEmailMsg"></span>
			</div>
			<div>
			<div class=""><h4>비밀번호</h4></div>
			<div><input type="password" name="pw" oninput="funcCheckPw()" placeholder="영문, 숫자, 특수문자 조합 8~16자" required></div>
			<span id="checkPwMsg"></span>
			</div>
			<div>
			<input type="submit" id="register_submit" value="가입">
			</div>
			
			<div class="checkbox_group">
			<input type="checkbox" id="check_1" class="normal">
			<label for="check_all">[필수] 만14세 이상이며 모두 동의합니다.</label>
			
			<input type="checkbox" id="check_all_1" class="normal">
			<label for="check_all_1">이용약관</label>
			
			<input type="checkbox" id="check_all_2" class="normal">
			<label for="check_all_2">개인정보처리방침</label>
			</div>
			
			
			<div class="checkbox_group2">
			<input type="checkbox" id="check_all2">
			<label for="check_all2">[선택] 광고성 정보 수신에 모두 동의합니다.</label>
			<input type="checkbox" id="check_all2_1">
			<label for="check_all2_1">앱 푸시</label>
			<input type="checkbox" id="check_all2_2">
			<label for="check_all2_2">문자 메시지</label>
			<input type="checkbox" id="check_all2_3">
			<label for="check_all2_3">이메일</label>  
			</div>
		</form>
		
	
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(".checkbox_group").on("click", "#check_all", function() {
		
		// $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
	});
	
	$(".checkbox_group").on("click", ".normal", function() {
		var is_checked = true;
		$(".checkbox_group .normal").each(function(){
			is_checked = is_checked && $(this).is(":checked");
		});
		$("#check_all").prop("checked", is_checked);
	});
	
</script>
<script type="text/javascript">
	var idpass;
	function funcCheckEmail(){
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		var color;
		var ans;
		
		var email = $('input[name=email]').val();
		if(reg_email.test(email)){
			$.ajax({
				url:'emailCheck?userEmail='+email,
				type:'GET',
				success:function(data){
					if (data > 0) {
						ans = '이미 사용중인 이메일입니다.';
						color = 'red';
						idpass = false;
					}else{
						ans = '';
						color = 'black';
						idpass = true;
					}
					$('#checkEmailMsg').text(ans);
					$('#checkEmailMsg').css('color', color);
					$('input[name=email]').css('border-bottom-color', color);
				}
			})			
		 } else {
			ans = '이메일 주소를 정확히 입력해주세요';
			color ='red';
			$('#checkEmailMsg').text(ans);
			$('#checkEmailMsg').css('color', color);
			$('input[name=email]').css('border-bottom-color');
		}
	}                 


	var pwpass;
	function funcCheckPw() {
		var pwRegex = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var pw = $('input[name=pw]').val();
		var color;
		var ans;
		
		if(!pwRegex.test(pw)) {
			ans = '영문, 숫자, 특수문자를 조합하여 입력해주세요 (8~16자)';
			color ='red';
			pwpass = false;
		}
		else {
			ans = '';
			color = '';
			pwpass = true;
		}
	$('#checkPwMsg').text(ans);
	$('#checkPwMsg').css('color', color);
	$('input[name=pw]').css('border-bottom-color', color);
	$('intput[type=submit]').css('background-color', color);
	}

	
	if (idpass && pwpass) {
		$('intput[type=submit]').css('background-color', color);
	}
	/* $('#register_submit').click(function(){
		event.preventDefault();
		
	})	 */
	
	
</script>
<%@ include file="../footer.jsp" %>