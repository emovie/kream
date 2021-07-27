<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
		display: flex;
		justify-content: center;
	} 
	div, .help_title, .help_notice, .notice_txt, form.login-form {
		width: 400px;
	}
	div {
		height: 361px;
	}
	.help_title {
		border-bottom: 2px solid black;
		height: 81px;
		text-align: center;
		font-size: 30px;
	}
	#logo_img {
		margin: 40px 0px 40px 0px;
	}
	
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
	input[type="submit"]:disabled {
		background-color: #e2e2e2;
		cursor: default;
	}
	input:focus::-webkit-input-placeholder {
	 	color: transparent;
	}
	form.login-form .pnum, .mail {
		font-size: 13px;
		font-weight: 900;
		margin: 0;
		padding: 0;
	}
</style>
</head>
<body>


<div>
	<h2 class="help_title">로그인</h2>
	
	<form action="${cpath }/member/loginPost" method="POST" class="login_form">
		<p id="logo_img">
			logo_img
		</p>
		
		<p><h4>이메일 주소</h4></p>
		<p><input type="text" name="email" oninput="funcCheckEmail()" placeholder="예)itbank@itbank.co.kr" required autofocus></p>
		<p><span id="checkEmailMsg"></span></p>
		<p><h4>비밀번호</h4></p>
		<p><input type="password" name="pw" oninput="funcCheckPw()"  placeholder="영문, 숫자, 특수문자 조합 8~16자" required></p>
		<span id="checkPwMsg"></span>
		<input type="submit" value="로그인">
		
		<div id="naver_id_login">
		<a href="${cpath }/member/naver_login">
		<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
		</a>
		</div>
		<p>
			<a href="${cpath }/member/register">이메일 가입</a> |
			<a href="${cpath }/member/findId">아이디 찾기</a> |
			<a href="${cpath }/member/findPw">비밀번호 찾기</a>
		</p>
	
</form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var idPass;
	function funcCheckEmail(){
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		var color;
		var ans;
		
		var email = $('input[name=email]').val();
		if(!reg_email.test(email)){
			ans = '이메일 주소를 정확히 입력해주세요';
			color ='red';
		}else {
			ans = '';
			color = 'blue';
			idpass = true;
		}
			$('#checkEmailMsg').text(ans);
			$('#checkEmailMsg').css('color', color);	
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
			color = 'blue';
			pwpass = true;
		}
	$('#checkPwMsg').text(ans);
	$('#checkPwMsg').css('color', color);
	}

	/* $('#register_submit').click(function(){
		event.preventDefault();
		
	})	 */
</script>

</body>
</html>