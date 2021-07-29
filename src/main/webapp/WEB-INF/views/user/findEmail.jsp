<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	.findEmail {
		width: 400px;
		height: auto;
		margin: auto;
		margin-bottom: 110px;
	}
	.findEmail h1 {
		text-align: center;
		margin-bottom: 40px;
		margin-top: 80px;
	}
	.findEmail > p {
		font-size: 14px;
		font-weight: 300;
		margin: 40px 0;
	}
	.findEmailUnderline {
		width: inherit;
		border-top: 2px solid black;	
	}
	.findEmailSuccess > .findEmailUnderline {
		width: 400px;
		margin: auto;
	}
	#findEmailForm p {
		font-size: 13px;
		font-weight: 500;
		margin: 0;
	}
	#findEmailForm p:nth-child(1) {
		margin-top: 15px; 
	}
	#findEmailForm p:nth-child(2) {
		height: 40px;
		box-sizing: border-box;
	}
	#findEmailForm input {
		width: 400px;
		height: 30px;
		border: none;
		border-bottom: 1px solid #ebebeb;
		outline: none;
		padding-left: 0;
		box-sizing: border-box;
	}
	#findEmailForm input:focus {
		border-bottom: 2px solid black;
	}
	#findEmailForm input::placeholder {
		color: #cecece;
		font-size: 15px;
		font-weight: 300;
	}
	#findEmailForm button {
		width: 400px;
		margin-top: 50px;
	}
	.findEmailWrap {
		width: 500px;
		height: 400px;
		margin: auto;
		margin-top: 150px;
		margin-bottom: 150px;
	}
	.findEmailSuccess {
		width: inherit;
		height: auto;
		text-align: center;
	}
	.loginBtn, .findPwBtn, .findEmailBtn {
		width: 200px;
		height: 50px;
		color: white;
		background-color: black;
		border-radius: 15px;  
		border: none;
		cursor: pointer;
	}
	.findPwBtn {
	    background-color: white;
	    color: black;
	    border: 1px solid black;
	}
	.findEmailBtn.off {
		background-color: #cecece;
		cursor: default;
	}
	
	.phoneNumberMsg {
		font-size: 11px !important;
		font-weight: 400 !important;
		color: #f15746;
	}
	.findEmailSuccess h2 {
		margin-bottom: 40px;
	}
	.findEmailSuccess p:not(.hideMailadd) {
		font-size: 12px;
		color: gray;
		margin-top: 30px;
	}
	
	.hideMailadd {
		font-size: 18px;
		font-weight: 600;
		color: black;
		margin-bottom: 35px;
	}
	
</style>

<div class="findEmail">
	<h1>이메일 아이디 찾기</h1>
	<div class="findEmailUnderline"></div>
	<p>가입 시 등록한 휴대폰 번호를 입력하면<br>
	이메일 주소의 일부를 알려드립니다.</p>
	
	<form id="findEmailForm" method="POST">
		<p>휴대폰 번호</p>
		<p><input type="text" name="phoneNumber" placeholder="가입하신 휴대폰 번호" onfocus="this.placeholder=''" onblur="this.placeholder='가입하신 휴대폰 번호'" ></p>
		<p><button id="findEmailSubmitBtn" class="findEmailBtn off" type="submit" disabled='disabled'>이메일 아이디 찾기</button></p>
	</form>
</div>

<div class="findEmailWrap hidden">
	<div class="findEmailSuccess">
		<h2>이메일 주소 찾기에 성공하였습니다.</h2>
		<div class="findEmailUnderline"></div>
		<p>이메일 주소</p>
		<p class="hideMailadd"></p>
		<button class="findPwBtn" type="button" onclick="location.href='${cpath}/login/find_password'">비밀번호 찾기</button>
		<button class="loginBtn" type="button" onclick="location.href='${cpath}/login'">로그인</button>
	</div>
</div>

<script>


const findEmailForm = document.getElementById('findEmailForm')
const findEmail = document.querySelector('.findEmail')
const findEmailWrap = document.querySelector('.findEmailWrap')
const findEmailSuccess = document.querySelector('.findEmailSuccess')



const findEmailHandler = function(event){
	event.preventDefault()
	
  	const formData = new FormData(event.target)
	
	const phoneNumber = event.target.querySelector('input[name="phoneNumber"]')
	
	const url = '${cpath}/login/find_email/'
	const opt = {
		method: 'POST',
		body: formData,
	}
	fetch(url, opt).then(resp => resp.text())
		.then(text => {
		if(text != 0) {	// DB에 일치하는 전화번로 정보가 있다면
			const hideMailadd = document.querySelector('.hideMailadd')
			hideMailadd.innerText = text
			findEmail.classList.add('hidden')
			findEmailWrap.classList.remove('hidden')
		}
		else {	// DB에 일치하는 전화번로 정보가 없다면
			alert('일치하는 사용자 정보를 찾을 수 없습니다.')	
		}
	})
}

findEmailForm.onsubmit = findEmailHandler

const checkedInputBox = function(event) {
	const phoneNumber = document.querySelector('input[name="phoneNumber"]')
	
	// 전화번호 숫자만
	let reg_num = /^[0-9]{10,11}$/
	 
	const msg = document.createElement('p')
	msg.classList.add('phoneNumberMsg')
	
	// 유효성 체크 false && 유효성 체크 메세지가 없는 경우
	if(!check(reg_num,event.target.value) && !document.querySelector('.phoneNumberMsg')){
		msg.innerText = '휴대폰 번호를 정확히 입력해주세요.'
		phoneNumber.after(msg)
	}
	
	// 유효성 체크 true
	else if(check(reg_num,event.target.value)) {
		const phoneNumberMsg = document.querySelector('.phoneNumberMsg')
		
		// 유효성 체크 메세지가 있다면 삭제
		if(document.querySelector('.phoneNumberMsg')){
			phoneNumber.parentNode.removeChild(phoneNumberMsg);
		}
	}
}

function check(reg, val) {
	if(reg.test(val)){
		return true
	}
	else {
		return false
	}
}

const phoneNumber = document.querySelector('input[name="phoneNumber"]')

phoneNumber.oninput = function(event) {
	checkedInputBox(event)
	avtiveBtn()
}

// 유효성 체크 후 버튼 활성화
function avtiveBtn() {
	const findEmailSubmitBtn = document.getElementById('findEmailSubmitBtn')
	if(document.querySelector('.phoneNumberMsg') == null && phoneNumber.value.length > 0){
		findEmailSubmitBtn.disabled = false
		findEmailSubmitBtn.classList.remove('off')
	}
	else {
		findEmailSubmitBtn.disabled = true
		findEmailSubmitBtn.classList.add('off')
	}
}

</script>

<%@ include file="../footer.jsp" %>