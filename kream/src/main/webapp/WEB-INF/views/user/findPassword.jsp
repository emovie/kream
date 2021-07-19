<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/findPassword.css">

<div class="findPw">
	<h1>비밀번호 찾기</h1>
	<div class="findPwUnderline"></div>
	<p>가입 시 등록하신 휴대폰 번호와 이메일을 입력하시면,<br>
	해당 이메일로 임시 비밀번호를 전송해 드립니다.</p>
	
	<form id="findPwForm" method="POST">
		<p>휴대폰 번호</p>
		<p><input type="text" name="phoneNumber" placeholder="가입하신 휴대폰 번호" onfocus="this.placeholder=''" onblur="this.placeholder='가입하신 휴대폰 번호'" ></p>
		<p>이메일 주소</p>
		<p><input type="email" name="email" placeholder="예) Email@Email.co.kr" onfocus="this.placeholder=''" onblur="this.placeholder='예) Email@Email.co.kr'" ></p>
		<p><button id="findPwSubmitBtn" class="findPwBtn off" type="submit" disabled='disabled'>메일 전송하기</button></p>
	</form>
</div>

<div class="sendWrap hidden">
	<div class="sendMailSuccess">
		<p>임시 비밀번호를 전송하였습니다.<br>
		전송받은 임시 비밀번호로 로그인해주세요.</p>
		<button class="findPwBtn" type="button" onclick="location.href='${cpath}/login'">로그인</button>
	</div>
</div>


<script src="${cpath }/resources/js/findPassword.js"/></script>

<%@ include file="../footer.jsp" %>