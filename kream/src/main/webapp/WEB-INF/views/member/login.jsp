<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />    

<%@ include file="../header.jsp" %>

<link rel="stylesheet" href="${cpath }/resources/css/style.css?ver=1">
<style>
	.loginWrap {
		width: 400px;
		height: auto;
		margin: auto;
		margin-top: 60px;
		margin-bottom: 60px;
	}
	.loginWrap > div:first-child {
		width: 300px;
		text-align: center;
		margin: auto;
		margin-bottom: 50px; 
	}
	.loginWrap img {
		width: 250px;
	}
	.login_form p {
		font-size: 13px;
		font-weight: 500;
		margin: 0;
	}
	.login_form div > p:first-child {
		margin-top: 20px; 
		margin-bottom: 5px;
	}
	.login_form input {
		width: 400px;
		height: 30px;
		border: none;
		border-bottom: 1px solid #ebebeb;
		outline: none;
		padding-left: 0;
		box-sizing: border-box;
	}
	.login_form input:focus {
		border-bottom: 2px solid black;
	}
	.login_form input::placeholder {
		color: #cecece;
		font-size: 15px;
		font-weight: 300;
	}
	.login_form > div:nth-child(2) {
		margin-bottom: 60px;
	}
	.login_form > div > p:last-child {
		height: 40px;
		box-sizing: border-box;
	}
	
	#login_submit, #naver_id_login {
		width: 400px;
		height: 50px;
		color: white;
		background-color: #cecece;
		border-radius: 15px;  
		border: none;
		cursor: pointer;
		margin-bottom: 8px;
		font-size: 16px;
	}
	
	#naver_id_login{
		text-align: center;
		line-height: 50px;
		background-color: #5ac451;
	}
	.loginMenu {
		width: 350px;
		margin: auto;
		margin-top: 20px;
		margin-bottom: 120px;
		display: flex;
		justify-content: space-between;
	}
	.loginMenu div{
		width: 100px;
		text-align: center;
		font-size: 13px;
		cursor: pointer;
	}
	.loginMenu div:nth-child(2) {
		border-left: 1px solid #cecece;
		border-right: 1px solid #cecece;
		padding: 0 10px;
	}
	
	
</style>
</head>
<body>

<c:if test="${not empty login }">
	<%	session.invalidate();%>
	<script>
		location.href = "${cpath }/login";
	</script>
</c:if>

<div class="loginWrap">	
	<div><img src="https://kream.co.kr/_nuxt/img/login_title.9f9ccc8.png"></div>

	<form action="${cpath }/member/loginPost" method="POST" class="login_form">
		<div>
			<p>이메일 주소</p>
			<p>
				<input type="text" name="email" id="email" class="login" oninput="funcCheckEmail()" placeholder="예) Email@Email.co.kr" onfocus="this.placeholder=''" onblur="this.placeholder='예) Email@Email.co.kr'"required>
				<span id="checkEmailMsg"></span>
			</p>
		</div>
		
		<div>
			<p>비밀번호</p>
			<p>
				<input type="password" name="pw" id="pw" oninput="funcCheckPw()" class="login" required>
				<span id="checkPwMsg"></span>
			</p>
		</div>
		<input type="submit" id="login_submit" value="로그인" disabled="">
	</form>

	<div id="naver_id_login" onclick="location.href='${cpath }/member/naver_login'">
		네이버 로그인
	</div>
	<div class="loginMenu">
		<div onclick="location.href='${cpath }/register'">이메일 가입</div>
		<div onclick="location.href='${cpath }/login/find_email'">아이디 찾기</div>
		<div onclick="location.href='${cpath }/login/find_password'">비밀번호 찾기</div>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	/* $('.login').focus(function(e){
		e.preventDefault();
		$(this).css('border-bottom', '2px solid black')
	})
	
	$('.login').blur(function(e){
		e.preventDefault();
		$(this).css('border-bottom', '1px solid #e2e2e2')
	})
	*/
	
	var idpass = false;
	function funcCheckEmail(){
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		var color;
		var ans;
		
		var email = $('input[name=email]').val();
		if(!reg_email.test(email)){
			ans = '이메일 주소를 정확히 입력해주세요';
			color ='#f15746';
			idpass = false;
			// judgeSubmit();
			
		}else {
			ans = '';
			color = 'black';
			idpass = true;
		}
			$('#checkEmailMsg').text(ans);
			$('#checkEmailMsg').css('color', color);
			$('input[name=email]').css('border-bottom-color', color);
			judgeSubmit();
			
			
	}


	var pwpass;
	function funcCheckPw() {
		var pwRegex = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var pw = $('input[name=pw]').val();
		var color;
		var ans;
		
		if(!pwRegex.test(pw)) {
			ans = '영문, 숫자, 특수문자를 조합하여 입력해주세요 (8~16자)';
			color ='#f15746';
			pwpass = false;
		}
		else {
			ans = '';
			color = 'black';
			pwpass = true;
			
		}
		
			$('#checkPwMsg').text(ans);
			$('#checkPwMsg').css('color', color);
			$('input[name=pw]').css('border-bottom-color', color);
		judgeSubmit();
	}
	
	function judgeSubmit() {
		if(idpass && pwpass) {
			SbmEnabled();
		} else {
			SbmDisabled();
		}
	}
	
	function SbmDisabled() {
		//console.log('sbmDisabled')
		$('#login_submit').attr('disabled', true);
		$('#login_submit').css('background-color', '#cecece');
	}
	
	function SbmEnabled() {
		//console.log("sbmEnabled")
		$('#login_submit').attr('disabled', false);
		$('#login_submit').css('background-color', 'black');
	}
	
</script>

<%@ include file="../footer.jsp" %>