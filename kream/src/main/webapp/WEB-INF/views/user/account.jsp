<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/mypage.css?ver=3" />
<link rel="stylesheet" href="${cpath }/resources/css/myHistory.css?ver=1" />
<style>
	.myAccount {
		min-height: 600px;
	}
	.myAccount p {
		font-size: 13px;
	}
	.myAccount p:not(.myAccount p:first-child) {
		margin-top: 15px;
	}
	.AccountBankTitle {
		margin-bottom: 0;
		margin-top: 40px;
	}	
	.AccountSelect {
		width: 400px;
		margin-top: 10px;
		display: flex;
		border-bottom: 1px solid #ebebeb;
	}
	.AccountSelectDropdownBtn {
		background: url('https://imgur.com/PJvXrb8.png');
		background-repeat: no-repeat;
		background-size: 55%;
		background-position: center;
		width: 32px;
		height: 32px;
	}
	#accountForm {
		width: 400px;
	}
	#accountForm > p:last-child {
		text-align: center;
	}
	.accountBtnOff {
		width: 100px;
		height: 40px;
		background-color: #ebebeb;
		color: white;
		border: none;
		cursor: default;
	}
	.accountBtnOn {
		width: 100px;
		height: 40px;
		background-color: black;
		color: white;
		border: none;
		cursor: pointer;
	}
	#accountForm > div {
		box-sizing: border-box;
		height: 57px;
	}
	#accountForm > div input {
		outline: none;
		width: 400px;
		border: none;
		padding-bottom: 10px;
	}
	#accountForm > div > input {
		border-bottom: 1px solid #ebebeb;
	}
	#accountForm span {
		color: #f15746;
		font-size: 12px;
	}
	.AccountBankList {
		width: 378px;
		max-height: 150px;
		overflow: auto;
		border: 1px solid #ebebeb;
		border-top: none;
		padding: 10px 0 10px 20px;
		margin-top: 0;
		
		background-color: white;
		position: absolute;
	}
	.AccountBankList li{
		height: 35px;
		line-height: 35px;
		font-size: 13px;
		font-weight: 300;
		color: gray;
		cursor: pointer;
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
					<li><a href="${cpath }/my/profile">프로필 정보</a></li>
					<li><a href="${cpath }/my/address">주소록</a></li>
					<!-- <li><a href="${cpath }/my/payment">결제 정보</a></li>  -->		
					<li><a href="${cpath }/my/account" class="menuStrong">판매 정산 계좌</a></li>
				</ul>
			</div>
		</nav>
	</div>
	
	
	<div class="myAccount">
		<h2>정산 계좌 등록<!-- 등록된 후에는 정산 계좌 변경만 가능 --></h2>
		<form id="accountForm">
			<p class="AccountBankTitle">은행명</p>
			
			<div class="AccountSelectWrap">
				<div class="AccountSelect">
					<input type="text" name="accountBank" placeholder="선택하세요" readonly="readonly">
					<div class="AccountSelectDropdownBtn"></div>
				</div>
				<ul class="AccountBankList hidden">
					<li>국민은행</li>
					<li>신한은행</li>
					<li>우리은행</li>
					<li>하나은행</li>
					<li>기업은행</li>
					<li>농협은행</li>
					<li>SC은행</li>
					<li>한국씨티은행</li>
					<li>우체국</li>
					<li>산업은행</li>
					<li>부산은행</li>
					<li>카카오뱅크</li>
					<li>케이뱅크</li>
					<li>광주은행</li>
					<li>제주은행</li>
					<li>수협중앙회</li>
					<li>전북은행</li>
					<li>지역농축협</li>
					<li>경남은행</li>
					<li>새마을금고연합회</li>
					<li>신협</li>
					<li>저축은행</li>
					<li>HSBC은행</li>
					<li>도이치은행</li>
					<li>제이피모간체이스은행</li>
					<li>BOA은행</li>
					<li>비엔피파리바은행</li>
					<li>중국공상은행</li>
					<li>산림조합</li>
					<li>중국건설은행</li>
				</ul>
			</div>
			
			<p class="AccountNumberTitle">계좌번호</p>
			<div>
				<input type="text" name="accountNumber" placeholder="- 없이 입력하세요" onfocus="this.placeholder=''" onblur="this.placeholder='- 없이 입력하세요'">
				<span class="accountNumberMsg"></span>
			</div>
	
			<p class="AccountNameTitle">예금주</p>
			<div>
				<input type="text" name="accountName" placeholder="예금주명을 정확하게 입력하세요" onfocus="this.placeholder=''" onblur="this.placeholder='예금주명을 정확하게 입력하세요'">
				<span class="accountNameMsg"></span>
			</div>
		
			<p><button type="submit" id="accountSubmitBtn" class="myPagebutton accountBtnOff" disabled>저장하기</button></p>
		</form>
	</div>
</div>

<script>
// selectBox
const accountBankInput = document.querySelector('input[name="accountBank"]')
const accountNumberInput = document.querySelector('input[name="accountNumber"]')
const accountNameInput = document.querySelector('input[name="accountName"]')
const AccountBankList = document.querySelector('.AccountBankList')
const AccountSelectDropdownBtn = document.querySelector('.AccountSelectDropdownBtn')

const openSelectBox = function(event) {
	if(AccountBankList.classList.value === 'AccountBankList hidden') {
		AccountBankList.classList.remove('hidden')
	}
	else {
		AccountBankList.classList.add('hidden')
	}
}

AccountSelectDropdownBtn.onclick = openSelectBox
accountBankInput.onclick = openSelectBox

const AccountBankListValue = document.querySelectorAll('.AccountBankList li')

for(let i = 0; i < AccountBankListValue.length; i++) {
	AccountBankListValue[i].onclick = function(event) {
		accountBankInput.value = AccountBankListValue[i].innerText
		AccountBankList.classList.add('hidden')
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

const checkedAccountInputBox = function(event) {
	// 이름		
	let reg_name = /^[가-힣]{2,50}$/;
	// 계좌번호
	let reg_AccountNum = /^[0-9]{10,50}$/;

	
	if(event.target.name == 'accountNumber') {
		const accountNumberMsg = document.querySelector('.accountNumberMsg')
		// 계좌번호 유효성 체크
		
		// 유효성 체크 false && 유효성 체크 메세지가 없는 경우
		if(!check(reg_AccountNum,event.target.value)){
			accountNumberMsg.innerText = '올바른 계좌번호를 입력해주세요.'
		}

		// 유효성 체크 true
		else if(check(reg_AccountNum,event.target.value)) {
			accountNumberMsg.innerText = ''
		}
	}
	if(event.target.name == 'accountName') {
		const accountNameMsg = document.querySelector('.accountNameMsg')
		// 계좌번호 유효성 체크
		
		// 유효성 체크 false && 유효성 체크 메세지가 없는 경우
		if(!check(reg_name,event.target.value)){
			accountNameMsg.innerText = '올바른 이름을 입력해주세요. (2-50자)'
		}

		// 유효성 체크 true
		else if(check(reg_name,event.target.value)) {
			accountNameMsg.innerText = ''
		}
	}
	
}

function avtiveAccountBtn() {
	const accountSubmitBtn = document.getElementById('accountSubmitBtn')

	if(document.querySelector('.accountNumberMsg').innerText == '' && document.querySelector('.accountNameMsg').innerText == '' && accountBankInput.value.length > 0 && accountNumberInput.value.length > 0&& accountNameInput.value.length > 0){
		accountSubmitBtn.disabled = false
		accountSubmitBtn.classList.remove('accountBtnOff')
		accountSubmitBtn.classList.add('accountBtnOn')
	}
	else {
		accountSubmitBtn.disabled = true
		accountSubmitBtn.classList.add('accountBtnOff')
		accountSubmitBtn.classList.remove('accountBtnOn')
	}
}

accountBankInput.onchange = function(event) {
	checkedAccountInputBox(event)
	avtiveAccountBtn()
}
accountNumberInput.oninput = function(event) {
	checkedAccountInputBox(event)
	avtiveAccountBtn()
}
accountNameInput.oninput = function(event) {
	checkedAccountInputBox(event)
	avtiveAccountBtn()
}

const accountForm = document.getElementById('accountForm')

accountForm.onsubmit = function() {
	
	event.preventDefault()
	
	const formData = new FormData(accountForm) 
	
	const url = '${cpath}/my/account/register/'
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
			alert('계좌 등록에 실패했습니다')
		}
	})
}

window.onload = function() {
	
	const url = '${cpath}/my/account/read/'
	const opt = {
			method: 'GET'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
		if(json != null) {
			const accountTitle = document.querySelector('.myAccount h2')
			accountTitle.innerText = ''
			accountTitle.innerText = '정산 계좌 변경'
			accountBankInput.value = json.accountBank
			accountNumberInput.value = json.accountNumber
			accountNameInput.value = json.accountName
			
			for(let i = 0; i < AccountBankListValue.length; i++) {
				AccountBankListValue[i].onclick = function(event) {
					if(json.accountBank !== AccountBankListValue[i].innerText) {
						accountSubmitBtn.disabled = false
						accountSubmitBtn.classList.remove('accountBtnOff')
						accountSubmitBtn.classList.add('accountBtnOn')
						accountBankInput.value = AccountBankListValue[i].innerText
						AccountBankList.classList.add('hidden')
					}
					else {
						accountBankInput.value = AccountBankListValue[i].innerText
						accountSubmitBtn.disabled = true
						accountSubmitBtn.classList.add('accountBtnOff')
						accountSubmitBtn.classList.remove('accountBtnOn')
						AccountBankList.classList.add('hidden')
					}
				}
			}
		}
	})
	
	
}
</script>

<%@ include file="../footer2.jsp" %>