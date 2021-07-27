<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	div, .help_title, .help_notice, .notice_txt, form.find-form {
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
	.notice_text {
		font-size: 14px;
		margin: 40px 0px 40px 0px;
	}
	form.find-form input[type="text"] {
		all: unset;
		width: 400px;
		border-bottom: 2px solid black;
		padding-bottom: 8px;
		margin : 0;
	}
	form.find-form input[type="submit"] {
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
	form.find-form input[type="submit"]:disabled {
		background-color: #e2e2e2;
		cursor: default;
	}
	input:focus::-webkit-input-placeholder {
	 	color: transparent;
	}
	form.find-form .pnum, .mail {
		font-size: 13px;
		font-weight: 900;
		margin: 0;
		padding: 0;
	}
</style>
</head>
<body>
	<div>
		<h2 class="help_title">비밀번호 찾기</h2>
		<p class="notice_text">
			가입 시 등록하신 휴대폰 번호와 이메일을 입력하시면,<br>
			휴대폰으로 임시 비밀번호를 전송해 드립니다
		</p>
		<form class="find-form">
			<p class="pnum">휴대폰 번호</p>
			<p><input type="text" name="phonenumber" placeholder="가입하신 휴대폰 번호"></p>
		
			<p class="mail">이메일 주소</p>
			<p><input type="text" name="email" placeholder="예) kream@kream.co.kr"></p>
			
			<p><input type="submit" disabled="disabled" value="문자 발송하기"></p>
		</form>
	</div>
	
</body>
</html>