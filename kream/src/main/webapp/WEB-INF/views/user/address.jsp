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
	.addressContent > div {
		display: flex;
		justify-content: space-between;
	}
	.addressContent > div:first-child {
		border-bottom: 1px solid black;
	}
	.addressContent > div:not(.addressContent > div:first-child) {
		border-bottom: 1px solid #ebebeb;
		margin-top: 30px;
	}
	.addressContent div div:last-child {
		display: flex;
		justify-content: space-between;
	}
	.addressContent div:first-child .addBtnWrap {
		padding-top: 40px;
	}
	.addBtnWrap {
		padding-top: 13px;
		cursor: pointer;
	}
	.addBtnWrap div {
		border: 1px solid #d3d3d3;
		border-radius: 12px;
		height: 30px;
		line-height: 30px;
		padding: 3px 10px;
		margin-left: 5px;
		font-size: 12px;
		font-weight: 300;
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
	.addressRegistBtn, .addressModifyBtn {
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
	.addressListBasic p:first-child {
		margin-top: 0;
	}
	#basicckCheck + .checkBoxLabel {
		width: 25px;
		height: 25px;
		display: inline-block;
		background: url('https://imgur.com/7iDP3GS.png');
		background-size: 100%;
		cursor: pointer;
		position: relative;
		top: 6.5px;
		margin-right: 5px;
	}
	#basicckCheck:checked + .checkBoxLabel {
		width: 25px;
		height: 25px;
		display: inline-block;
		background: url('https://imgur.com/6gofHuf.png');
		background-size: 100%;
		position: relative;
		top: 6.5px;
		margin-right: 5px;
	}
	#basicckCheck {
		display: none;
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
				<p>?????? ??????</p>
				<ul>
					<li><a href="${cpath }/my/buying">?????? ??????</a></li>
					<li><a href="${cpath }/my/selling">?????? ??????</a></li>
					<li><a href="${cpath }/my/wish">?????? ??????</a></li>
				</ul>
			</div>
			<div>
				<p>??? ??????</p>
				<ul>
					<li><a href="${cpath }/my/profile">????????? ??????</a></li>
					<li><a href="${cpath }/my/address" class="menuStrong">?????????</a></li>
					<!-- <li><a href="${cpath }/my/payment">?????? ??????</a></li>  -->
					<li><a href="${cpath }/my/account">?????? ?????? ??????</a></li>
				</ul>
			</div>
		</nav>
	</div>
	
	<div class="myAddress">
		<div class="addTitle">
			<h2>?????????</h2>
			<button class="myPagebutton" id="newAddressBtn" type="button">??? ????????? ??????</button>
		</div>
		<div class="myContentLine"></div>
		<!-- ?????? ????????? ????????? ?????? ?????? ????????? ?????? -->
		<div class="addressContent">
			<p class="addressEmpty">?????? ????????? ????????? ????????????.<br>????????? ??????????????????.</p>
		</div>
	</div>
	
	
</div>

	<div class="addressPop hidden">
		<div class="addressPopTitle">
			<div style="width:30px;"><!-- guard --></div>
			<h3>??? ????????? ??????</h3>
			<div style="width:30px;"><!-- guard --></div>
			<div class="addPopCloseBtn">??</div>
		</div>
		<form class="myAddressForm" name="myAddressForm" method="POST">
			<input type="hidden" name="memberIdx" value="${login.idx }">
			<div>
				<p>??????</p>
				<input type="text" name="name" placeholder="???????????? ??????" onfocus="this.placeholder=''" onblur="this.placeholder='???????????? ??????'" required>
			</div>
			<div>
				<p>????????? ??????</p>
				<input type="text" name="phoneNumber" placeholder="-?????? ??????" onfocus="this.placeholder=''" onblur="this.placeholder='-?????? ??????'" required>
			</div>
	
			<div>
				<p>????????????</p>
				<input type="text" name="postcode" id="postcode" placeholder="??????????????? ???????????????" autocomplete="off" required>
				<input type="button" class="myPagebutton" onclick="execDaumPostcode()" value="???????????? "><br>
			</div>
			
			<div>
				<p>??????</p>
				<input type="text" name="address" id="roadAddress" placeholder="???????????? ?????? ???, ???????????? ?????????" onfocus="this.placeholder=''" onblur="this.placeholder='???????????? ?????? ???, ???????????? ?????????'" autocomplete="off" required>
			</div>
				<span id="guide" style="color:#999; font-size: 12px; display:none;"></span>
			
			<div>
				<p>?????? ??????</p>
				<input type="text" name="detail" id="detailAddress" placeholder="??????, ?????????, ???/?????? ??????" onfocus="this.placeholder=''" onblur="this.placeholder='??????, ?????????, ???/?????? ??????'">
			</div>
			<p>
				<input type="checkbox" id="basicckCheck" name="basicck" value="y">
				<label class="checkBoxLabel" for="basicckCheck"></label>?????? ???????????? ??????
			</p>
			<div>
				<button id="addressCancelBtn"class="myPagebutton" type="button">??????</button>
				<button id="addressSubmitBtn" class="myPagebutton addressRegistBtn" type="button">????????????</button>
				<button id="addressSubmitBtn" class="myPagebutton addressModifySubmitBtn" type="button">????????????</button>
			</div>
		</form>
	</div>
	
	<div class="addressOverlay hidden"></div>
	
	
	
	
	

<!-- ?????? api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //??? ??????????????? ????????? ?????? ?????? ????????? ?????? ????????? ??????, ???????????? ???????????? ???????????? ????????? ????????? ???????????? ????????? ???????????????.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

                // ????????? ????????? ?????? ????????? ?????? ????????? ????????????.
                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
                var roadAddr = data.roadAddress; // ????????? ?????? ??????
                var extraRoadAddr = ''; // ?????? ?????? ??????

                // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
                // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
                if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // ???????????? ??????, ??????????????? ?????? ????????????.
                if(data.buildingName !== '' || data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                
                // ???????????? ???????????? ?????? ?????? ?????? ????????? ?????????.
                if(roadAddr !== ''){
                    document.getElementById("roadAddress").value += extraRoadAddr;
                } else {
                    document.getElementById("roadAddress").value += '';
                }

                var guideTextBox = document.getElementById("guide");
                // ???????????? '?????? ??????'??? ????????? ??????, ?????? ???????????? ????????? ?????????.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(?????? ????????? ?????? : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(?????? ?????? ?????? : ' + expJibunAddr + ')';
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
/* ???????????? ?????? */
 
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
	
	const basicckInput = document.querySelector('input[name="basicck"]')
	basicckInput.disabled = false
	basicckInput.parentNode.onclick = function() {}
}


const addressRegistBtn = document.querySelector('.addressRegistBtn')
const addressModifySubmitBtn = document.querySelector('.addressModifySubmitBtn')

newAddressBtn.onclick = function() {
	const addressPopTitle = document.querySelector('.addressPopTitle h3')
	addressValueReset()
	addressPopTitle.innerText = ''
	addressPopTitle.innerText = '??? ????????? ??????'
	addressRegistBtn.classList.remove('hidden')
	addressModifySubmitBtn.classList.add('hidden')
	addressPopOpen()
}


/* ??????????????? ?????? */
const myAddressForm = document.querySelector('.myAddressForm')

addressRegistBtn.onclick = function() {

	const nameInput = document.querySelector('input[name="name"]')
	const phoneNumberInput = document.querySelector('input[name="phoneNumber"]')
	const postcodeInput = document.querySelector('input[name="postcode"]')
	const addressInput = document.querySelector('input[name="address"]')
	
	if(nameInput.value == '') {
		alert('????????? ??????????????????')
		return
	}
	if(phoneNumberInput.value == '') {
		alert('????????? ????????? ??????????????????')
		return
	}
	if(postcodeInput.value == '') {
		alert('??????????????? ??????????????????')
		return
	}
	if(addressInput.value == '') {
		alert('????????? ??????????????????')
		return
	}
	
	const formData = new FormData(myAddressForm)
	
	const url = "${cpath }/my/regiAddress/"
	const opt = {
		method: 'POST',
		body: formData,
	}
	fetch(url, opt).then(resp => resp.text())
	.then(text => {
		 addressContent.innerHTML = ''
		 loadAddressList()
		 addressPopClose()
	 })
}

addressOverlay.onclick = addressPopClose
addPopCloseBtn.onclick = addressPopClose
addressCancelBtn.onclick = addressPopClose


/* ?????? ??? ????????? */
const addressValueReset = function() {
	const input = document.querySelectorAll('.myAddressForm input:not(input[type="button"])')
	const checkBox = document.querySelector('input[name="basicck"]')
	for(let i = 1; i < input.length; i++) {
		input[i].value = null
		checkBox.checked = false
	}
	
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


function createDiv(dto) {
	
	const addressInfoWrap = document.createElement('div')
	const addressInfo = document.createElement('div')
	const addName = document.createElement('div')
	const address = document.createElement('div')
	const address1 = document.createElement('span')
	const address2 = document.createElement('span')
	const phoneNum = document.createElement('div')
	
	const addBtnWrap = document.createElement('div') 
	addBtnWrap.classList.add('addBtnWrap')
	
	const basicBtn = document.createElement('div')
	basicBtn.innerText = '?????? ?????????'
	
	const addressDelBtn = document.createElement('div')
	addressDelBtn.innerText = '??????'
	
	const addressModiBtn = document.createElement('div') 
	addressModiBtn.innerText = '??????'
	
	basicBtn.onclick = function(event) {
		const url = '${cpath}/my/regiAddress/changeBasic/' + dto.idx + '/'
		const opt = {
				method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				loadAddressList()
			}
			else{
				console.log('??????')
			}
		})
	}
	
	addressDelBtn.onclick = function(event) {
		const url = '${cpath}/my/regiAddress/deleteAdd/' + dto.idx + '/'
		const opt = {
				method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				loadAddressList()
			}
			else{
				console.log('??????')
			}
		})
	}
	
	addressModiBtn.onclick = function() {
		
		const addressPopTitle = document.querySelector('.addressPopTitle h3')
		addressPopTitle.innerText = ''
		addressPopTitle.innerText = '????????? ??????'
		addressRegistBtn.classList.add('hidden')
		addressModifySubmitBtn.classList.remove('hidden')
		addressPopOpen()
		
		const nameInput = document.querySelector('input[name="name"]')
		const phoneNumberInput = document.querySelector('input[name="phoneNumber"]')
		const postcodeInput = document.querySelector('input[name="postcode"]')
		const addressInput = document.querySelector('input[name="address"]')
		const detailInput = document.querySelector('input[name="detail"]')
		
		nameInput.value = dto.name
		phoneNumberInput.value = dto.phoneNumber
		postcodeInput.value = dto.postcode
		addressInput.value = dto.address
		
		if(dto.detail != null) {
			detailInput.value = dto.detail
		}
		const basicckInput = document.querySelector('input[name="basicck"]')
		if(dto.basicck == 'y') {
			basicckInput.checked = true
			basicckInput.disabled = true
			basicckInput.value = 'y'
			basicckInput.parentNode.onclick = function() {
			alert('?????? ????????? ?????? ???????????? ?????? ???, ????????? ??? ????????????.')
			}
		}
		
		if(nameInput.value == '') {
			alert('????????? ??????????????????')
			return
		}
		if(phoneNumberInput.value == '') {
			alert('????????? ????????? ??????????????????')
			return
		}
		if(postcodeInput.value == '') {
			alert('??????????????? ??????????????????')
			return
		}
		if(addressInput.value == '') {
			alert('????????? ??????????????????')
			return
		}
		
		
		addressModifySubmitBtn.onclick = function() {
			
			const formData = new FormData(myAddressForm)
			
			const url = "${cpath}/my/regiAddress/modifyAdd/" + dto.idx + '/'
			const opt = {
				method: 'POST',
				body: formData,
			}
			fetch(url, opt).then(resp => resp.text())
			.then(text => {
				addressPopClose()
				addressValueReset()
				addressContent.innerHTML = ''
				loadAddressList()
			})
		}
	}
	
	
	
	if(dto.basicck == 'y') {
		addressInfo.classList.add('addressListBasic')
		const basicAdd = document.createElement('p')
		basicAdd.innerText = '?????? ?????????'
		addressInfo.appendChild(basicAdd)
		
		addName.innerText = dto.name
		addressInfo.appendChild(addName)
		
		
		address1.innerText = '(' + dto.postcode + ')'
		address.appendChild(address1)
		
		address2.innerText = dto.address
		address.appendChild(address2)
		
		phoneNum.innerText = dto.phoneNumber.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3")
		
		if(dto.detail != null) {
			const address3 = document.createElement('span')
			address3.innerText = ' ' + dto.detail
			address.appendChild(address3)
			addressInfo.appendChild(address)
			addressInfo.appendChild(phoneNum)
			addressInfoWrap.appendChild(addressInfo)
		}
		else {
			addressInfo.appendChild(address)
			addressInfo.appendChild(phoneNum)
			addressInfoWrap.appendChild(addressInfo)
		}
		
		addBtnWrap.appendChild(addressModiBtn)
		addressInfoWrap.appendChild(addBtnWrap)
		
	}
	else {
		addressInfo.classList.add('addressListItem')
		addName.innerText = dto.name
		addressInfo.appendChild(addName)
		
		
		address1.innerText = '(' + dto.postcode + ')'
		address.appendChild(address1)
		
		address2.innerText = dto.address
		address.appendChild(address2)
		
		phoneNum.innerText = dto.phoneNumber.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3")
		
		if(dto.detail != null) {
			const address3 = document.createElement('span')
			address3.innerText = ' ' + dto.detail
			address.appendChild(address3)
			addressInfo.appendChild(address)
			addressInfo.appendChild(phoneNum)
			addressInfoWrap.appendChild(addressInfo)
		}
		else {
			addressInfo.appendChild(address)
			addressInfo.appendChild(phoneNum)
			addressInfoWrap.appendChild(addressInfo)
		}
		addBtnWrap.appendChild(basicBtn)
		addBtnWrap.appendChild(addressDelBtn)
		addBtnWrap.appendChild(addressModiBtn)
		addressInfoWrap.appendChild(addBtnWrap)
	}
	return addressInfoWrap
}

window.onload = loadAddressList		// ???????????? ????????? ????????? ?????? ????????? ??????

</script>



<%@ include file="../footer2.jsp" %>