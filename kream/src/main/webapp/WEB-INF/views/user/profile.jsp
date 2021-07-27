<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/mypage.css?ver=2" />
<link rel="stylesheet" href="${cpath }/resources/css/modifyProfile.css?ver=1" />

<style>

	.filebox label {
		width: 90px;
		height: 35px;
		display: inline-block;
		color: #5d5d5d;
		font-size: 12px;
		line-height: 35px;
		padding: 0 14px;
		box-sizing: border-box;
		background-color: inherit;
		cursor: pointer;
		border: 1px solid #d5d5d5;
		border-bottom-color: #e2e2e2;
		border-radius: 10px;
	}
	
	.filebox input[type="file"] {
		/* 파일 필드 숨기기 */
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip: rect(0,0,0,0);
		border: 0;
	}
	.ModifyImgBtnWrap {
		display: flex;
	}
	.ModifyImgBtnWrap div:first-child {
		margin-right: 5px;	
	}

</style>
<c:if test="${empty login }">
	<script>
		location.href = "${cpath }/login";
	</script>
</c:if>
<div class="myWrap">
	<div class="myMenu">
		<h1><a href="${cpath }/my">MY PAGE</a></h1>
		<nav>
			<div>
				<p>쇼핑 정보</p>
				<ul>
					<li><a href="${cpath }/my/buying">구매 내역</a></li>
					<li><a href="${cpath }/my/selling">판매 내역</a></li>
					<li><a href="${cpath }/my/wish">관심 상품</a></li>
				</ul>
			</div>
			<div>
				<p>내 정보</p>
				<ul>
					<li><a href="${cpath }/my/profile" class="menuStrong">프로필 정보</a></li>
					<li><a href="${cpath }/my/address">주소록</a></li>
					<li><a href="${cpath }/my/payment">결제 정보</a></li>
					<li><a href="${cpath }/my/account">판매 정산 계좌</a></li>
				</ul>
			</div>
		</nav>
	</div>
	
	<div class="myprofile">
		<h2>프로필 정보</h2>
		<div class="myContentLine"></div>
		<!-- 세션 로그인 정보로 관심 상품 데이터 체크 -->
		<div class="profileContent">
			<div class="profileImgBox">
				<div class="profileImg">
					<img class="${login.profileimage == 'default.jpg' ? 'defaultImg' : 'existImg' }" src="${cpath }/upload/${login.profileimage }">
				</div>
				<div class="userInfo">
					<p class="userName">${login.name }</p>
					<div class="ModifyImgBtnWrap">
						<form id="profileImgChangeForm" method="post" enctype="multipart/form-data">
							<div class="filebox"> <!-- class="filebox" -->
								<label for="profileImg">이미지 변경</label>
								<input type="file" id="profileImg" name="profileFile" accept="image/*">
							</div>
						</form>
						<button class="myPagebutton" type="button" onclick="profileImgDelete(event)">삭제</button>
					</div>
				</div>
			</div>
			
			<div class="loginInfo">
				<h3>로그인 정보</h3>
				
				<div class="myEmail">
					<p>이메일 주소</p>
					<div>
						<span>${login.email }</span>
						<button class="myPagebutton ModifyEmailBtn" type="button">변경</button>
					</div>
				</div>
				
				<div class="myEmailModify hidden">
					<p class="modifyTitle">이메일 주소 변경</p>
					<form class="myEmailModifyForm" name="myEmailModifyForm">
						<p class="modifyInputWrap">
							<input type="text" name="newEmail" placeholder="${login.email }" onfocus="this.placeholder=''" onblur="this.placeholder='${login.email }'">
						</p>
						<p class="modifyRegMsg newEmailMsg"></p>
						<button class="myPagebutton" type="button" onclick="MyModifyclose(event)">취소</button>
						<button class="myPagebutton sendModifyEmailBtn" type="submit" disabled>인증 메일 발송</button>
					</form>
				</div>

				<div class="myEmailModifyAuthNum hidden">
					<div class="newEmailParam hidden"></div>
					<p class="modifyTitle">인증번호 입력</p>
					<form class="myEmailModifyAuthNumForm">
						<p class="modifyInputWrap">
							<input type="text" name="authNum" placeholder="인증번호를 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='인증번호를 입력해주세요'">
						</p>
						<button class="myPagebutton" type="button" onclick="authNumInputCancel(event)">취소</button>
						<button class="myPagebutton authNumSubmitBtn" type="submit" disabled>인증하기</button>
					</form>
				</div>
				
				<div class="myPw">
					<p>비밀번호</p>
					<div>
						<span>●●●●●●●●●</span>
						<button class="myPagebutton ModifyPwBtn" type="button">변경</button>
					</div>
				</div>
				
				<div class="myPwModify hidden">
					<p class="modifyTitle">비밀번호 변경</p>
					<form class="myPwModifyForm">
						<p>이전 비밀번호</p>
						<p class="modifyInputWrap">
							<input type="password" name="nowPw" placeholder="영문, 숫자, 특수문자 조합  8-16글자" onfocus="this.placeholder=''" onblur="this.placeholder='영문, 숫자, 특수문자 조합  8-16글자'">
						</p>
						<p class="modifyRegMsg nowPwMsg"></p>
						<p>새 비밀번호</p>
						<p class="modifyInputWrap">
							<input type="password" name="newPw" placeholder="영문, 숫자, 특수문자 조합  8-16글자" onfocus="this.placeholder=''" onblur="this.placeholder='영문, 숫자, 특수문자 조합  8-16글자'">
						</p>
						<p class="modifyRegMsg newPwMsg"></p>
						<button class="myPagebutton" type="button" onclick="MyModifyclose(event)">취소</button>
						<button class="myPagebutton saveModifyPwBtn" type="submit" disabled>저장</button>
					</form>
				</div>
			</div>
			
			<div class="privacyInfo">
				<h3>개인 정보</h3>
				<div class="myName">
					<p>이름</p>
					<div>
						<span>${login.name }</span>
						<button class="myPagebutton ModifyNameBtn" type="button"onclick="MyModifyopen(event)">변경</button>
					</div>
				</div>
				<div class="myNameModify hidden">
					<p class="modifyTitle">이름 변경</p>
					<form class="myNameModifyForm">
						<p>새로운 이름</p>
						<p class="modifyInputWrap">
							<input type="text" name="newName" placeholder="고객님의 이름" onfocus="this.placeholder=''" onblur="this.placeholder='고객님의 이름'">
						</p>
						<p class="modifyRegMsg newNameMsg"></p>
						<button class="myPagebutton" type="button" onclick="MyModifyclose(event)">취소</button>
						<button class="myPagebutton saveModifyNameBtn" type="submit" disabled>저장</button>
					</form>
				</div>
				<div>
					<p>휴대폰 번호</p>
					<span>${login.phonenumber }</span>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 이미지 변경 스크립트 -->
<script>

	const profileImgChangeForm = document.getElementById('profileImgChangeForm')
	const profileImg = document.getElementById('profileImg')
	
	profileImg.onchange = function() {

		const formData = new FormData(profileImgChangeForm)
		
		const url = '${cpath}/my/profile/imgUpload/'
		const opt = {
				method: 'POST',
				body: formData,
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				location.reload(true)
			}
			else {
				alert('이미지 등록 실패')
			}
		})
	}

	// 프로필 이미지 삭제
	function profileImgDelete(event) {
		
		const url = '${cpath}/my/profile/delete/'
		const opt = {
				method: 'GET'
		}
		fetch(url,opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				location.reload(true)
			}
			else {
				alert('이미지 삭제 실패')
			}
		})
	}
</script>


<!-- <script src="${cpath }/resources/js/profileModify.js"/></script>  -->
<!-- 기본 유저 정보 수정 -->
<script>

const ModifyEmailBtn = document.querySelector('.ModifyEmailBtn')
const ModifyPwBtn = document.querySelector('.ModifyPwBtn')
const ModifyNameBtn = document.querySelector('.ModifyNameBtn')

const SocialCheck = '${login.email}'

const email = document.querySelector('input[name="newEmail"]')
const nowPw = document.querySelector('input[name="nowPw"]')
const newPw = document.querySelector('input[name="newPw"]')
const name = document.querySelector('input[name="newName"]')
const authNum = document.querySelector('input[name="authNum"]')

ModifyEmailBtn.onclick = function(event) {
	const url = '${cpath}/my/profile/check/' + SocialCheck + '/'
	const opt = {
			method: 'GET'
	}
	fetch(url, opt)
	.then(resp => resp.text())
	.then(text => {
		if(text == 0) {
			alert('소셜 로그인된 상태에서는 비밀번호를 변경할 수 없습니다.')
		}
		else{
			const ModifyEmail = document.querySelector('.myEmailModify')
			const myEmail = document.querySelector('.myEmail')
			ModifyEmail.classList.remove('hidden')
			myEmail.classList.add('hidden')
			
		}
	})
	
}

ModifyPwBtn.onclick = function(event) {
	const url = '${cpath}/my/profile/check/' + SocialCheck + '/'
	const opt = {
			method: 'GET'
	}
	fetch(url, opt)
	.then(resp => resp.text())
	.then(text => {
		if(text == 0) {
			alert('소셜 로그인된 상태에서는 이메일을 변경할 수 없습니다.')
		}
		else{
			const ModifyPw = document.querySelector('.myPwModify')
			const myPw = document.querySelector('.myPw')
			
			ModifyPw.classList.remove('hidden')
			myPw.classList.add('hidden')
		}
	})
}

function MyModifyopen(event) {
	event.target.parentNode.parentNode.classList.add('hidden')
	event.target.parentNode.parentNode.nextElementSibling.classList.remove('hidden')
}
function MyModifyclose(event) {
	event.target.parentNode.parentNode.classList.add('hidden')
	event.target.parentNode.parentNode.previousElementSibling.classList.remove('hidden')
	const eventClassInputName = event.target.previousElementSibling.previousElementSibling.firstElementChild.name
	
	switch (eventClassInputName) {
	case 'newEmail':
		const newEmailMsg = document.querySelector('.newEmailMsg')
		const sendModifyEmailBtn = document.querySelector('.sendModifyEmailBtn')
		
		email.value = null
		newEmailMsg.innerText = ''
		sendModifyEmailBtn.style.backgroundColor = 'inherit'
		sendModifyEmailBtn.style.color = '#5D5D5D'
		sendModifyEmailBtn.style.cursor = 'default'
		sendModifyEmailBtn.disabled = true
		break;
		
	case 'newPw':
		const nowPwMsg = document.querySelector('.nowPwMsg')
		const newPwMsg = document.querySelector('.newPwMsg')
		const saveModifyPwBtn = document.querySelector('.saveModifyPwBtn')
		
		nowPw.value = null
		newPw.value = null
		
		nowPwMsg.innerText = ''
		newPwMsg.innerText = ''
		saveModifyPwBtn.style.backgroundColor = 'inherit'
		saveModifyPwBtn.style.color = '#5D5D5D'
		saveModifyPwBtn.style.cursor = 'default'
		saveModifyPwBtn.disabled = true
		break;
	
	case 'newName':
		const newNameMsg = document.querySelector('.newNameMsg')
		const saveModifyNameBtn = document.querySelector('.saveModifyNameBtn')
		name.value = null
		
		newNameMsg.innerText = ''
		saveModifyNameBtn.style.backgroundColor = 'inherit'
		saveModifyNameBtn.style.color = '#5D5D5D'
		saveModifyNameBtn.style.cursor = 'default'
		saveModifyNameBtn.disabled = true
		break;

	default:
		break;
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





const myProfileModifyReg = function(event) {
	
	// 이메일
	let reg_email =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/
	// 패스워드
	let reg_pw = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	// 이름		
	let reg_name = /^[가-힣]{2,50}$/;
	
	if(event.target.name == 'newEmail') {
		const newEmailMsg = document.querySelector('.newEmailMsg')
		const sendModifyEmailBtn = document.querySelector('.sendModifyEmailBtn')
		// 유효성 체크 false
		if(!check(reg_email,event.target.value)){
			newEmailMsg.innerText = '이메일 주소를 정확히 입력해주세요.'
			sendModifyEmailBtn.style.backgroundColor = '#ebebeb'
			sendModifyEmailBtn.style.color = 'white'
			sendModifyEmailBtn.style.cursor = 'default'
			sendModifyEmailBtn.disabled = true			
		}
		// 유효성 체크 true
		else if(check(reg_email,event.target.value)) {
			newEmailMsg.innerText = ''
			sendModifyEmailBtn.style.backgroundColor = 'black'
			sendModifyEmailBtn.style.color = 'white'
			sendModifyEmailBtn.style.cursor = 'pointer'
			sendModifyEmailBtn.disabled = false				
		}
	}
	else if(event.target.name == 'nowPw') {
		const nowPwMsg = document.querySelector('.nowPwMsg')
		const saveModifyPwBtn = document.querySelector('.saveModifyPwBtn')
		// 유효성 체크 false
		if(!check(reg_pw,event.target.value)){
			nowPwMsg.innerText = '영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자)'
			saveModifyPwBtn.style.backgroundColor = '#ebebeb'
			saveModifyPwBtn.style.color = 'white'
			saveModifyPwBtn.style.cursor = 'default'
			saveModifyPwBtn.disabled = true
		}
		// 유효성 체크 true
		else if(check(reg_pw,event.target.value)) {
			nowPwMsg.innerText = ''
			if(newPw.value.length > 0 && document.querySelector('.newPwMsg').innerText == '') {
				saveModifyPwBtn.style.backgroundColor = 'black'
				saveModifyPwBtn.style.color = 'white'
				saveModifyPwBtn.style.cursor = 'pointer'
				saveModifyPwBtn.disabled = false				
			}
		}
	}
	else if(event.target.name == 'newPw') {
		const newPwMsg = document.querySelector('.newPwMsg')
		const saveModifyPwBtn = document.querySelector('.saveModifyPwBtn')
		// 유효성 체크 false
		if(!check(reg_pw,event.target.value)){
			newPwMsg.innerText = '영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자)'
			saveModifyPwBtn.style.backgroundColor = '#ebebeb'
			saveModifyPwBtn.style.color = 'white'
			saveModifyPwBtn.style.cursor = 'default'
			saveModifyPwBtn.disabled = true
		}
		// 유효성 체크 true
		else if(check(reg_pw,event.target.value)) {
			newPwMsg.innerText = ''
			if(nowPw.value.length > 0 && document.querySelector('.nowPwMsg').innerText == '') {
				saveModifyPwBtn.style.backgroundColor = 'black'
				saveModifyPwBtn.style.color = 'white'
				saveModifyPwBtn.style.cursor = 'pointer'
				saveModifyPwBtn.disabled = false				
			}
		}
		
	}
	if(event.target.name == 'newName') {
		const newNameMsg = document.querySelector('.newNameMsg')
		const saveModifyNameBtn = document.querySelector('.saveModifyNameBtn')
		// 유효성 체크 false
		if(!check(reg_name,event.target.value)){
			newNameMsg.innerText = '올바른 이름을 입력해주세요. (2-50자)'
			saveModifyNameBtn.style.backgroundColor = '#ebebeb'
			saveModifyNameBtn.style.color = 'white'
			saveModifyNameBtn.style.cursor = 'default'
			saveModifyNameBtn.disabled = true	
		}
		// 유효성 체크 true
		else if(check(reg_name,event.target.value)) {
			newNameMsg.innerText = ''
			saveModifyNameBtn.style.backgroundColor = 'black'
			saveModifyNameBtn.style.color = 'white'
			saveModifyNameBtn.style.cursor = 'pointer'
			saveModifyNameBtn.disabled = false				
		}
	}
	if(event.target.name == 'authNum' && event.target.value > 0) {
		const authNumSubmitBtn = document.querySelector('.authNumSubmitBtn')
		authNumSubmitBtn.style.backgroundColor = 'black'
		authNumSubmitBtn.style.color = 'white'
		authNumSubmitBtn.style.cursor = 'pointer'
		authNumSubmitBtn.disabled = false	
	}
	
}

email.oninput = myProfileModifyReg
nowPw.oninput = myProfileModifyReg
newPw.oninput = myProfileModifyReg
name.oninput = myProfileModifyReg
authNum.oninput = myProfileModifyReg

const newEmailParam = document.querySelector('.newEmailParam')

const myEmailModifyForm = document.querySelector('.myEmailModifyForm')

myEmailModifyForm.onsubmit = function(event) {
	event.preventDefault()
	
	const newEmail = this.newEmail.value
	newEmailParam.innerText = newEmail
	const url = '${cpath}/my/profile/modifyEmail/checked/' + newEmail + '/'
	const opt = {
			method: 'POST'
	}
	fetch(url, opt)
	.then(resp => resp.text())
	.then(text => {
		if(text == 1) {
			alert('이미 가입된 이메일 아이디입니다.')
		}
		else {
			const url = '${cpath}/my/profile/modifyEmail/' + newEmail +'/'
			const opt = {
					method: 'POST'
			}
			fetch(url, opt)
			.then(resp => resp.text())
			.then(text => {
				if(text.length == 128) {
					alert('이메일 발송이 완료됐습니다.')
					// 인증메일 발송폼
					event.target.parentNode.classList.add('hidden')
					this.newEmail.value = null
					// 인증번호 입력폼
					event.target.parentNode.nextElementSibling.classList.remove('hidden')
				}
				else {
					alert('이메일 발송이 실패했습니다.')
				}
			})
		}
	})
}
const myEmailModifyAuthNumForm = document.querySelector('.myEmailModifyAuthNumForm')


const authHandler =  function(event) {
	event.preventDefault()
	const userNumber = event.target.querySelector('input[name="authNum"]')
	
	const url = '${cpath}/getAuthResult/' + userNumber.value + '/' + newEmailParam.innerText + '/${login.email}/'
	const opt = {
			method: 'POST'
	}
	fetch(url, opt).then(resp => resp.text())
	.then(text => {
		if(text == 1){
			location.reload(true)
		}
		else {
			alert('인증 실패')
		}
		newEmailParam.innerText = ''
	})
}
myEmailModifyAuthNumForm.onsubmit = authHandler

// 인증번호 입력폼 닫기
function authNumInputCancel(event) {
	
	event.target.parentNode.parentNode.previousElementSibling.previousElementSibling.classList.remove('hidden')
	event.target.parentNode.parentNode.classList.add('hidden')
}


// 비밀번호 수정
const myPwModifyForm = document.querySelector('.myPwModifyForm')

myPwModifyForm.onsubmit = function(event) {
	event.preventDefault()
	
	const nowpw = this.nowPw.value
	const newpw = this.newPw.value
	
	console.log(nowpw)
	
	const url = '${cpath}/my/profile/modifyPw/check/' + nowpw + '/'
	const opt = {
			method: 'POST'
	}
	fetch(url, opt)
	.then(resp => resp.text())
	.then(text => {
		if(text == 1){
			const url = '${cpath}/my/profile/modifyPw/' + newpw + '/'
			const opt = {
					method: 'POST'
			}
			fetch(url, opt)
			.then(resp => resp.text())
			.then(text => {
				if(text == 1) {
					alert('비밀번호 변경 완료')
					location.reload(true)
				}
				else {
					alert('비밀번호 변경 실패')
				}
			})
		}
		else {
			alert('기존 비밀번호가 일치하지 않습니다')
		}
	})
}


// 이름 변경

const myNameModifyForm = document.querySelector('.myNameModifyForm')
myNameModifyForm.onsubmit = function(event) {
	event.preventDefault()
	
	const newName = this.newName.value
	
	const url = '${cpath}/my/profile/modifyName/' + newName + '/'
	const opt = {
			method: 'GET'
	}
	fetch(url, opt).then(resp => resp.text())
	.then(text => {
		if(text == 1) {
			location.reload(true)
		}
		else {
			alert('이름 변경 실패')
		}
	})
}

</script>
<%@ include file="../footer2.jsp" %>