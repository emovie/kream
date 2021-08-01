<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/mypage.css" />
<style>
	.withdrawal {
		width: 1000px;
		height: auto;
		padding: 10px 0;
		margin-bottom: 100px;
	}
	.withdrawal h2 {
		font-size: 28px;
	}
	.oricheckBox + .checkBoxLabel {
		width: 100%;
		height: 25px;
		display: inline-block;
		background: url('https://imgur.com/7iDP3GS.png');
		background-size: 25px;
		background-repeat: no-repeat;
		cursor: pointer;
		position: relative;
		top: 6.5px;
		margin-right: 5px;
		padding-left: 32px;
	}
	.oricheckBox:checked + .checkBoxLabel {
		width: 100%;
		height: 25px;
		display: inline-block;
		background: url('https://imgur.com/6gofHuf.png');
		background-size: 25px;
		background-repeat: no-repeat;
		position: relative;
		top: 6.5px;
		margin-right: 5px;
		padding-left: 32px;
	}
	.oricheckBox {
		display: none;
		cursor: pointer;
	}
	.withdrawal .checkBoxLabel span {
		font-weight: 500;	
	}
	.withdrawal .checkBoxLabel:last-child {
		margin: 25px 0;
	}
	.withdrawalContent {
		border: 1px solid #d3d3d3;
		width: 100%;
		min-height: 400px;
		padding: 25px;
		margin-bottom: 10px;
	}
 	.withdrawalContent div ul {
		word-break: keep-all;
		list-style: disc;
		padding-left: 23px;
		margin-top: 10px;
	}
	.withdrawalContent div ul li {
		font-size: 15px;
		font-weight: 300;
	}
	.liDot {
		font-size:15px;
		font-weight: 900;
	}
	.withdrawalContent div:not(:first-child) {
		margin-top: 40px;
	}
	.withdrawalContent h5 {
		margin-bottom: 0;
		font-size: 15px;
		font-weight: 500;
	}
	.withdrawalBtns {
		width: 100%;
		text-align: center;
		margin-top: 40px; 
	}
	.withdrawalBtn {
		width: 120px;
		height: 40px;
		margin: 0 3px;
		color: black;
		font-size: 14px;
		font-weight: 300;
	}
	.withdrawalCancelBtn {
		width: 120px;
		height: 40px;
		margin: 0 3px;
		color: white;
		background-color: black;
		font-size: 14px;
		font-weight: 300;
	}
	.withdrawalPop {
		width: 360px;
		height: 315px;
		border-radius: 15px;
		
	    position: fixed;
	    top: 30%;
	    left: 50%;
	    transform: translateX(-50%);
	    z-index: 11;
	    background-color: white;
	    box-shadow: 0px 0px 20px -10px grey;
	}
	.withdrawalOverlay {
	    width: 100%;
	    height: 100%;
	    position: fixed;
	    top: 0;
	    left: 0;
	    background-color: rgba(99, 99, 99, 0.452);
	    z-index: 10;
	}
	.withdrawalPopTitle {
		display: flex;
		justify-content: space-between;
	}
	.withdrawalPopTitle h3 {
		margin-top: 35px;
	}
	.withdrawalCloseBtn {
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
	.withdrawalPopContent {
		text-align: center;
		font-weight: 300;
		font-size: 14px;
	}
	.LASTwithdrawalCheckLabelWrap {
		text-align: center;
	}
	.LASTwithdrawalCheckLabel {
		width: 175px !important;
		margin-top: 15px;
	}
	.LASTwithdrawalCheckLabel span {
		font-size: 13px;
		font-weight: 300;
		color: gray;
	}
	.withdrawalPOPCancelBtnWrap {
		text-align: center;
		margin-top: 30px;
	}
	.withdrawalFINALBtn {
		text-align: center;
		color: rgba(34,34,34,.5);
		font-size: 12.5px;
		font-weight: 300;
		text-decoration: underline;
		cursor: pointer;
		margin-top: 8px;
	}
	.withdrawalFINALBtn:hover {
		text-decoration: none;
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
					<li><a href="${cpath }/my/account">판매 정산 계좌</a></li>
				</ul>
			</div>
		</nav>
	</div>
	
	<div class="withdrawal">
		<h2>회원 탈퇴</h2>
		<h3>회원탈퇴에 앞서 아래 내용을 반드시 확인해 주세요.</h3>
		<div class="withdrawalContent">
		
			<div>
				<input type="checkbox" id="withdrawalCheck1" class="oricheckBox">
				<label class="checkBoxLabel" for="withdrawalCheck1"><span>KREAM을 탈퇴하면 회원 정보 및 서비스 이용 기록이 삭제됩니다.</span></label>
				<ul>
					<li>내 프로필, 거래내역(구매/판매), 관심상품, 보유상품, STYLE 게시물(게시물/댓글), 미사용 보유 포인트 등 사용자의 모든 정보가 사라지며 재가입 하더라도 복구가 불가능합니다.</li>
					<li>탈퇴 14일 이내 재가입할 수 없으며, 탈퇴 후 동일 이메일로 재가입할 수 없습니다.</li>
				</ul>
			</div>
			
			<div>
				<input type="checkbox" id="withdrawalCheck2" class="oricheckBox">
				<label class="checkBoxLabel" for="withdrawalCheck2"><span>관련 법령 및 내부 기준에 따라 별도 보관하는 경우에는 일부 정보가 보관될 수 있습니다.</span></label>
				
				<h5>1. 전자상거래 등 소비자 보호에 관한 법률</h5>
				<ul>
					<li>계약 또는 청약철회 등에 관한 기록: 5년 보관</li>
					<li>대금결제 및 재화 등의 공급에 관한 기록: 5년 보관</li>
					<li>소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관</li>
				</ul>
				
				<h5>2. 통신비밀보호법</h5>
				<ul>
					<li>접속 로그 기록: 3개월 보관</li>
				</ul>
				
				<h5>3. 내부 기준에 따라 별도 보관</h5>
				<ul>
					<li>부정이용 방지를 위해 이름, 이메일(로그인ID), 휴대전화번호, CI/DI: 3년 보관</li>
				</ul>
			</div>
			
			<div>
				<input type="checkbox" id="withdrawalCheck3" class="oricheckBox">
				<label class="checkBoxLabel" for="withdrawalCheck3"><span>KREAM 탈퇴가 제한된 경우에는 아래 내용을 참고하시기 바랍니다.</span></label>
				<ul>
					<li>진행 중인 거래(판매/구매)가 있을 경우: 해당 거래 종료 후 탈퇴 가능</li>
					<li>진행 중인 입찰(판매/구매)가 있을 경우: 해당 입찰 삭제 후 탈퇴 가능</li>
					<li>미납 수수료(착불 발송비/페널티)가 있을 경우: 해당 결제 완료 후 탈퇴 가능</li>
					<li>이용 정지 상태인 경우: 이용 정지 해제 후 탈퇴 가능</li>
				</ul>
			</div>
			
		</div>
		<input type="checkbox" id="withdrawalCheck4" class="oricheckBox">
		<label class="checkBoxLabel" for="withdrawalCheck4"><span>회원탈퇴 안내를 모두 확인하였으며 탈퇴에 동의합니다.</span></label>
		
		<div class="withdrawalBtns">
			<button class="myPagebutton withdrawalBtn" type="button">탈퇴하기</button>
			<button class="myPagebutton withdrawalCancelBtn" type="button" onclick="location.href='${cpath}/my/profile'">취소하기</button>
		</div>
	</div>
	
	<div class="withdrawalPop hidden">
		<div class="withdrawalPopTitle">
			<div style="width:30px;"><!-- guard --></div>
			<h3>정말 탈퇴하시겠습니까?</h3>
			<div style="width:30px;"><!-- guard --></div>
			<div class="withdrawalCloseBtn">×</div>
		</div>
		<div class="withdrawalPopContent">
		탈퇴하기 클릭 시 바로 탈퇴 처리됩니다.<br>
		탈퇴 후 14일 이내 재가입할 수 없으며,<br>
		재가입 시 동일 이메일을 사용할 수 없습니다.<br>
		</div>
		<div class="LASTwithdrawalCheckLabelWrap">
			<input type="checkbox" id="LASTwithdrawalCheck" class="oricheckBox">
			<label class="checkBoxLabel LASTwithdrawalCheckLabel" for="LASTwithdrawalCheck"><span>KREAM 회원을 탈퇴하겠습니다.</span></label>
		</div>
		
		<div class="withdrawalPOPCancelBtnWrap"><button class="myPagebutton withdrawalCancelBtn withdrawalPOPCancelBtn" type="button">탈퇴 안 할래요</button></div>
		<div class="withdrawalFINALBtn">탈퇴하기</div>
	</div>
	
	<div class="withdrawalOverlay hidden"></div>
	
</div>

<script>
	const withdrawalCheckedBox = document.querySelectorAll('input[type="checkbox"]')
	const withdrawalBtn = document.querySelector('.withdrawalBtn')
	
	const withdrawalPop = document.querySelector('.withdrawalPop')
	const withdrawalOverlay = document.querySelector('.withdrawalOverlay')
	
	withdrawalBtn.onclick = function() {
		let checkedCount = 0
		for(let i = 0; i < (withdrawalCheckedBox.length-1); i++) {
			if(withdrawalCheckedBox[i].checked == true) {
				checkedCount++
			}
		}
		if(checkedCount == (withdrawalCheckedBox.length-1)) {
			withdrawalPop.classList.remove('hidden')
			withdrawalOverlay.classList.remove('hidden')
		}
		else{
			alert('회원탈퇴 내용을 모두 동의해 주셔야 탈퇴가 가능합니다.')
		}
	}
	
	const withdrawalPOPCancelBtn = document.querySelector('.withdrawalPOPCancelBtn')
	const withdrawalCloseBtn = document.querySelector('.withdrawalCloseBtn')
	const withdrawalPopCloseFunc = function() {
		withdrawalPop.classList.add('hidden')
		withdrawalOverlay.classList.add('hidden')
		const LASTwithdrawalCheck = document.getElementById('LASTwithdrawalCheck')
		LASTwithdrawalCheck.checked = false
	}
	withdrawalPOPCancelBtn.onclick = withdrawalPopCloseFunc
	withdrawalCloseBtn.onclick = withdrawalPopCloseFunc
	withdrawalOverlay.onclick = withdrawalPopCloseFunc
	
	const withdrawalFINALBtn = document.querySelector('.withdrawalFINALBtn')
	withdrawalFINALBtn.onclick = function(event) {
		const url = '${cpath}/'
	}
</script>
<%@ include file="../footer2.jsp" %>