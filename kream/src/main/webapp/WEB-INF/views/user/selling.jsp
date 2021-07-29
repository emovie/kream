<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/mypage.css?ver=1" />
<link rel="stylesheet" href="${cpath }/resources/css/myHistory.css?ver=1" />
<style>
	.HistoryTAB {
		cursor: pointer;
	}
	.checkedTAB {
		border-bottom: 2px solid black !important;
	}
	.checkedTAB p:first-child {
		color: #31b46e;
	}
	.checkedTAB p:last-child {
		color: black !important;
		font-weight: 500 !important;
	}
	.historyCalendar {
		margin-left: 20px;
		margin-right: 5px;
	}
	.historyCalendar input[type="date"]::-webkit-calendar-picker-indicator {
    	margin-left: 0;
	}
	.historyCalendar input[type="date"] {
		height: 31px;
		width: 100px;
	    border: 1px solid #ebebeb;
	    outline: none;
	    padding: 0 10px;
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
					<li><a href="${cpath }/my/selling" class="menuStrong">판매 내역</a></li>
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
	
	<div class="myHistory">
		<h2>판매 내역</h2>
		<!-- 세션 로그인 정보로 구매 내역 데이터 체크 -->
		<div class="myHistoryContent">
			<div class="myHistoryMenu">
				<!-- 세션 로그인 정보로 구매 내역 데이터 상태별 카운트 체크 -->
				<div class="HistoryTAB checkedTAB">
					<p>0</p>
					<p>판매 입찰</p>
				</div>
				<div class="HistoryTAB">
					<p>0</p>
					<p>진행중</p>
				</div>
				<div class="HistoryTAB">
					<p>0</p>
					<p>종료</p>
				</div>
			</div>
		</div>
		<div class="historyDate">
			<div class="DateBtns">
				<div class="historyDateBtn checkedDateBtn">최근 2개월</div>
				<div class="historyDateBtn">4개월</div>
				<div class="historyDateBtn">6개월</div>
			</div>
			<div class="historyCalendar">
				<form id="sellingHistoryForm">
					<input type="hidden" id="historyStatus" name="step" value="입찰">
					<input type="date" id="HistoryStartDate" name="startDate" required><span>~</span><input type="date" id="HistoryEndDate" name="endDate" required>
					<button type="submit" class="historyDateBtn submitDateBtn">조회</button>	
				</form>
			</div>
		</div>
		<ul>
			<li>한 번에 조회 가능한 기간은 최대 6개월입니다.</li>
			<li>기간별 조회 결과는 입찰일 기준으로 노출됩니다.</li>
		</ul>
		<div class="historySorting">
			
		</div>
	</div>
	
</div>

<!-- 탭메뉴 -->
<script>
	const HistoryTAB = document.querySelectorAll('.HistoryTAB')
	const historyStatus = document.getElementById('historyStatus')
	for(let i = 0; i < HistoryTAB.length; i++) {
		HistoryTAB[i].onclick = function(event) {
			// HistoryTAB[0]
			if(i == 0) {
				HistoryTAB[0].classList.add('checkedTAB')
				HistoryTAB[1].classList.remove('checkedTAB')
				HistoryTAB[2].classList.remove('checkedTAB')
				historyStatus.value = '입찰'
			}
			// HistoryTAB[1]
			else if(i == 1) {
				HistoryTAB[0].classList.remove('checkedTAB')
				HistoryTAB[1].classList.add('checkedTAB')
				HistoryTAB[2].classList.remove('checkedTAB')
				historyStatus.value = '진행'
			}
			// HistoryTAB[2]
			else if(i == 2) {
				HistoryTAB[0].classList.remove('checkedTAB')
				HistoryTAB[1].classList.remove('checkedTAB')
				HistoryTAB[2].classList.add('checkedTAB')
				historyStatus.value = '종료'
			}
		}
	}
</script>

<!-- 캘린더 현재 날짜 지정 -->
<script>
	const createHistoryList = function(dto) {
		
	}


	const HistoryStartDate = document.getElementById('HistoryStartDate')
	const HistoryEndDate = document.getElementById('HistoryEndDate')
	const sellingHistoryForm = document.getElementById('sellingHistoryForm')
	let today = new Date().toISOString().slice(0,10)

	var twoMonthAgo = new Date(new Date().setMonth(new Date().getMonth() - 2)).toISOString().slice(0,10)	// 두 달 전
	var fourMonthAgo = new Date(new Date().setMonth(new Date().getMonth() - 4)).toISOString().slice(0,10)	// 네 달 전
	var sixMonthAgo = new Date(new Date().setMonth(new Date().getMonth() - 6)).toISOString().slice(0,10)	// 여섯 달 전

	HistoryStartDate.value = twoMonthAgo
	HistoryEndDate.value = today
	HistoryEndDate.max = today
	
	const historyDateBtn = document.querySelectorAll('.historyDateBtn')
	const historySorting = document.querySelector('historySorting')
	for(let i = 0; i < historyDateBtn.length; i++) {
		historyDateBtn[i].onclick = function(event) {
			
			// historyDateBtn[0]
			// 최근 2개월
			if(i == 0) {
				historyDateBtn[0].classList.add('checkedDateBtn')
				historyDateBtn[1].classList.remove('checkedDateBtn')
				historyDateBtn[2].classList.remove('checkedDateBtn')
				HistoryEndDate.value = today
				HistoryStartDate.value = twoMonthAgo
			}
			// historyDateBtn[1]
			// 최근 4개월
			else if(i == 1) {
				historyDateBtn[0].classList.remove('checkedDateBtn')
				historyDateBtn[1].classList.add('checkedDateBtn')
				historyDateBtn[2].classList.remove('checkedDateBtn')
				HistoryEndDate.value = today
				HistoryStartDate.value = fourMonthAgo
			}
			// historyDateBtn[2]
			// 최근 6개월
			else if(i == 2) {
				historyDateBtn[0].classList.remove('checkedDateBtn')
				historyDateBtn[1].classList.remove('checkedDateBtn')
				historyDateBtn[2].classList.add('checkedDateBtn')
				HistoryEndDate.value = today
				HistoryStartDate.value = sixMonthAgo
			}
			// historyDateBtn[3]
			// 조회(submit)
			else if(i == 3) {
				event.preventDefault()
				const formData = new FormData(sellingHistoryForm)
				const url = '${cpath}/my/selling/SellHistory/'
				const opt = {
						method: 'POST',
						body: formData
				}
				fetch(url, opt)
				.then(resp => resp.json())
				.then(json => {})
			}
		}
	}
	
/* window.onload = function(event){
	
	event.preventDefault()
	const formData = new FormData(sellingHistoryForm)
	const url = '${cpath}/my/selling/SellHistory/'
	const opt = {
			method: 'POST',
			body: formData
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		if(json.length > 0) {
			
		}
	})
} */
</script>


<%@ include file="../footer2.jsp" %>