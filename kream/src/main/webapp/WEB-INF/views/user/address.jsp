<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/mypage.css" />
<style>
	.myAddress {
		width: 1000px;
		height: auto;
		padding: 10px 0;
		margin: 0;
		margin-bottom: 100px;
	}
	.myAddress h2 {
		font-size: 28px;
	}
	.addressContent {
		width: inherit;
		min-height: 250px;
		height: auto;
		text-align: center;
		padding: 40px 0;
	}
	.addTitle {
		width: inherit;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.addTitle button {
		margin: 0;
	}
	.addressContent p {
		color: gray;
		font-size: 13px;
		font-weight: 300;
		margin-top: 40px;
	}
	.addressPop {
		border-radius: 15px;
		width: 500px;
		height: 600px;
		margin: auto;
		padding: 0 40px 20px 40px;
		box-sizing: border-box;
		position: fixed;
		top: 10%;
		left: 50%;
		transform:translateX(-50%);
		z-index: 11;
		background-color: white;
		box-shadow: 0px 0px 20px -10px gray;
	}
	.myAddressForm p {
		font-size: 13px;
	}
	.myAddressForm p:not(.myAddressForm > p) {
		font-weight: 500;
		margin-bottom: 0;
		margin-top: 20px;
	}

	.addressPopTitle {
		display: flex;
		justify-content: space-between;
	}
	.addressPop h3 {
		text-align: center;
	}
	.myAddressForm div:not(.myAddressForm div:last-child) {
		width: 100%;
		border-bottom: 1px solid #d5d5d5;
	}
	.myAddressForm div input:not(.myAddressForm div input[type="button"]) {
		width: 300px;
		height: 25px;
		border: none;
		outline: none;
		background-color: inherit;
		margin-bottom: 5px; 
	}
	.myAddressForm div input[type="button"] {
		margin-bottom: 5px;
	}
	.myAddressForm div:nth-child(4) {
		box-sizing: border-box;
	}
	.myAddressForm div:last-child {
		text-align: center;
		margin-top: 35px; 
	}
	.myAddressForm div:last-child .myPagebutton {
		width: 80px;
		height: 40px;
	}
	.myAddressForm div:last-child .myPagebutton:last-child {
		background-color: black;
		color: white;
	}
	#postcode {
		width: 330px;
	}
	#roadAddress {
		width: 400px;
	}
	.addPopCloseBtn {
	    opacity: 0.6;
	    width: 50px;
	    height: 50px;
	    text-align: center;
	    line-height: 50px;
	    font-size: 20px;
	    cursor: pointer;
	    position: absolute;
	    right: 0;
	}
	.addressOverlay {
	    width: 100%;
	    height: 100%;
	    position: fixed;
	    top: 0;
	    left: 0;
	    background-color: rgba(99, 99, 99, 0.452);
	    z-index: 10;
	}
	
	.addressListBasic, .addressListItem {
		text-align: left;
		font-size: 13px;
		padding-bottom: 30px;
	}
	.addressListBasic {
		border-bottom: 1px solid black;
	}
	.addressListItem {
		border-bottom: 1px solid #ebebeb;
		margin-top: 30px;
	}
	.addressListBasic p:first-child {
		margin-top: 0;
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
					<li><a href="${cpath }/my/address" class="menuStrong">주소록</a></li>
					<li><a href="${cpath }/my/payment">결제 정보</a></li>
					<li><a href="${cpath }/my/account">판매 정산 계좌</a></li>
				</ul>
			</div>
		</nav>
	</div>
	
	<div class="myAddress">
		<div class="addTitle">
			<h2>주소록</h2>
			<button class="myPagebutton" id="newAddressBtn" type="button">새 배송지 추가</button>
		</div>
		<div class="myContentLine"></div>
		<!-- 세션 로그인 정보로 관심 상품 데이터 체크 -->
		<div class="addressContent">
			<p class="addressEmpty">현재 등록된 주소가 없습니다.<br>주소를 등록해주세요.</p>
		</div>
	</div>
	
	
</div>

	<div class="addressPop hidden">
		<div class="addressPopTitle">
			<div style="width:30px;"><!-- guard --></div>
			<h3>새 배송지 등록</h3>
			<div style="width:30px;"><!-- guard --></div>
			<div class="addPopCloseBtn">×</div>
		</div>
		<form class="myAddressForm" name="myAddressForm" method="POST">
			<input type="hidden" name="memberIdx" value="${login.idx }">
			<div>
				<p>이름</p>
				<input type="text" name="name" placeholder="수령인의 이름" onfocus="this.placeholder=''" onblur="this.placeholder='수령인의 이름'" required>
			</div>
			<div>
				<p>휴대폰 번호</p>
				<input type="text" name="phoneNumber" placeholder="-없이 입력" onfocus="this.placeholder=''" onblur="this.placeholder='-없이 입력'" required>
			</div>
	
			<div>
				<p>우편번호</p>
				<input type="text" name="postcode" id="postcode" placeholder="우편번호를 검색하세요" autocomplete="off" required>
				<input type="button" class="myPagebutton" onclick="execDaumPostcode()" value="우편번호 "><br>
			</div>
			
			<div>
				<p>주소</p>
				<input type="text" name="address" id="roadAddress" placeholder="우편번호 검색 후, 자동입력 됩니다" onfocus="this.placeholder=''" onblur="this.placeholder='우편번호 검색 후, 자동입력 됩니다'" autocomplete="off" required>
			</div>
				<span id="guide" style="color:#999; font-size: 12px; display:none;"></span>
			
			<div>
				<p>상세 주소</p>
				<input type="text" name="detail" id="detailAddress" placeholder="건물, 아파트, 동/호수 입력" onfocus="this.placeholder=''" onblur="this.placeholder='건물, 아파트, 동/호수 입력'">
			</div>
			<p><label><input type="checkbox" name="basicck" value="y">기본 배송지로 설정</label></p>
			<div>
				<button id="addressCancelBtn"class="myPagebutton" type="button">취소</button>
				<button id="addressSubmitBtn" class="myPagebutton" type="submit">저장하기</button>
			</div>
		</form>
	</div>
	<div class="addressOverlay hidden"></div>

<!-- 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' || data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("roadAddress").value += extraRoadAddr;
                } else {
                    document.getElementById("roadAddress").value += '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<!------------>

<script>
/* 새배송지 추가 */
 
const newAddressBtn = document.getElementById('newAddressBtn')
const addressPop = document.querySelector('.addressPop')
const addressOverlay = document.querySelector('.addressOverlay')
const addPopCloseBtn = document.querySelector('.addPopCloseBtn')
const addressCancelBtn = document.querySelector('#addressCancelBtn')

const addressContent = document.querySelector('.addressContent')

const addressPopOpen = function() {
	addressPop.classList.remove('hidden')
	addressOverlay.classList.remove('hidden')
}

const addressPopClose = function() {
	addressPop.classList.add('hidden')
	addressOverlay.classList.add('hidden')
	addressValueReset()
}

newAddressBtn.onclick = addressPopOpen

addressOverlay.onclick = addressPopClose
addPopCloseBtn.onclick = addressPopClose
addressCancelBtn.onclick = addressPopClose

/* 주소데이터 전송 */
const myAddressForm = document.querySelector('.myAddressForm')

const regiAddress = function(event) {
	event.preventDefault()
	
	const formData = new FormData(myAddressForm)
	
	const url = "${cpath }/my/regiAddress/"
	const opt = {
		method: 'POST',
		body: formData,
	}
	fetch(url, opt).then(resp => resp.text())
	.then(text => {
		 addressValueReset()
		 addressContent.innerHTML = ''
		 loadAddressList()
	 })
}

/* 인풋 값 비우기 */
const addressValueReset = function() {
	const input = document.querySelectorAll('.myAddressForm input:not(input[type="button"])')
	const checkBox = document.querySelector('input[name="basicck"]')
	for(let i = 1; i < input.length; i++) {
		input[i].value = null
		checkBox.checked = false
	}
	
}

myAddressForm.onsubmit = function(event) {
	regiAddress(event)
	addressPopClose()
}

const loginIdx = '${login.idx}'

function loadAddressList() {
	
 	const url = '${cpath}/my/regiAddress/' + loginIdx + '/'
	const opt = {
			method: 'GET'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		if(json.length > 0) {
			addressContent.innerHTML = ''
			json.forEach(dto => {
				addressContent.appendChild(createDiv(dto))
			})
		}
	})
}
window.onload = loadAddressList		// 페이지가 로딩이 끝나면 바로 호출할 함수

function createDiv(dto) {
	const addressInfo = document.createElement('div')
	if(dto.basicck == 'y') {
		addressInfo.classList.add('addressListBasic')
		const basicAdd = document.createElement('p')
		basicAdd.innerText = '기본 배송지'
		addressInfo.appendChild(basicAdd)
	}
	else {
		addressInfo.classList.add('addressListItem')		
	}
	const addName = document.createElement('div')
	addName.innerText = dto.name
	addressInfo.appendChild(addName)
	
	const address = document.createElement('div')
	const address1 = document.createElement('span')
	const address2 = document.createElement('span')
	
	address1.innerText = '(' + dto.postcode + ')'
	address.appendChild(address1)
	
	address2.innerText = dto.address
	address.appendChild(address2)
	
	const phoneNum = document.createElement('div')
	phoneNum.innerText = dto.phoneNumber
	
	if(dto.detail != null) {
		const address3 = document.createElement('span')
		address3.innerText = ' ' + dto.detail
		address.appendChild(address3)
		addressInfo.appendChild(address)
		addressInfo.appendChild(phoneNum)
	}
	else {
		addressInfo.appendChild(address)
		addressInfo.appendChild(phoneNum)
	}
	return addressInfo
}

</script>



<%@ include file="../footer2.jsp" %>