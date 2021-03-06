<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/mypage.css?ver=1" />
<link rel="stylesheet" href="${cpath }/resources/css/myHistory.css?ver=4" />
<style>
	.HistoryTAB {
		cursor: pointer;
	}
	.checkedTAB {
		border-bottom: 2px solid black !important;
	}
	.checkedTAB p:first-child {
		color: #f15746;
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
	.historySorting {
		height: auto;
		min-height: 600px;
		margin-bottom: 150px;
	}
	.HistoryItemWrap {
		display: flex;
		margin: 15px 0;
		justify-content: space-between;
		border-bottom: 1px solid #eaeaea;
		padding-bottom: 15px;
	}
	.HistoryItemWrap > div {
		display: flex;
	}
	.HistoryItemWrap > div:nth-child(2) {
		justify-content: center;
		line-height: 80px;
		font-weight: 500;
	}
	.HistoryItemWrap > div:nth-child(2) div {
		width: 125px;
		text-align: center;
	}
	.HistoryItemWrap > div:nth-child(2) div:last-child {
		font-weight: 400;
		font-size: 14px;
	}
	.HistoryItemThumb {
		width: 80px;
		height: 80px;
		overflow: hidden;
		border-radius: 10px;
		background-color: rgb(244, 244, 244);
	}
	.HistoryItemThumb img {
		width: 100%;
	}
	.HistoryItemInfo {
		margin-left: 15px;
	}
	.HistoryItemInfo p {
		margin: 0;
		font-size: 14px;
		font-weight: 500;
	}
	.HistoryItemInfo p:nth-child(2) {
		font-weight: 300;
		margin-bottom: 15px;
	}
	.HistoryItemEndDate {
		width: 150px;
	}
	.historySortingHead {
		display: flex;
		justify-content: flex-end;
		margin: 10px 0;
		margin-bottom: 15px;
	}
	.historySortingHead div {
		width: 125px;
    	text-align: center;
    	font-size: 13px;
    	font-weight: 300;
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
					<li><a href="${cpath }/my/buying" class="menuStrong">?????? ??????</a></li>
					<li><a href="${cpath }/my/selling">?????? ??????</a></li>
					<li><a href="${cpath }/my/wish">?????? ??????</a></li>
				</ul>
			</div>
			<div>
				<p>??? ??????</p>
				<ul>
					<li><a href="${cpath }/my/profile">????????? ??????</a></li>
					<li><a href="${cpath }/my/address">?????????</a></li>
					<!-- <li><a href="${cpath }/my/payment">?????? ??????</a></li>  -->
					<li><a href="${cpath }/my/account">?????? ?????? ??????</a></li>
				</ul>
			</div>
		</nav>
	</div>
	
	<div class="myHistory">
		<h2>?????? ??????</h2>
		<!-- ?????? ????????? ????????? ?????? ?????? ????????? ?????? -->
		<div class="myHistoryContent">
			<div class="myHistoryMenu">
				<!-- ?????? ????????? ????????? ?????? ?????? ????????? ????????? ????????? ?????? -->
				<div class="HistoryTAB checkedTAB buyingTAB">
					<p class="buyBidCount">0</p>
					<p>?????? ??????</p>
				</div>
				<div class="HistoryTAB">
					<p class="buyProceedCount">0</p>
					<p>?????????</p>
				</div>
				<div class="HistoryTAB">
					<p class="buyEndCount">0</p>
					<p>??????</p>
				</div>
			</div>
		</div>
		<div class="historyDate">
			<div class="DateBtns">
				<div class="historyDateBtn checkedDateBtn">?????? 2??????</div>
				<div class="historyDateBtn">4??????</div>
				<div class="historyDateBtn">6??????</div>
			</div>
			<div class="historyCalendar">
				<form id="BuyingHistoryForm">
					<input type="hidden" id="historyStatus" name="step" value="??????">
					<input type="date" id="BuyHistoryStartDate" name="startDate" required><span>~</span><input type="date" id="BuyHistoryEndDate" name="endDate" required>
					<button type="submit" class="historyDateBtn submitDateBtn">??????</button>	
				</form>
			</div>
		</div>
		<ul>
			<li>??? ?????? ?????? ????????? ????????? ?????? 6???????????????.</li>
			<li>????????? ?????? ????????? ????????? ???????????? ???????????????.</li>
		</ul>
		<div class="historySortingHead">
			<div>?????? ?????????</div>
			<div>?????????</div>
		</div>
		<div class="historySorting">
			
		</div>
	</div>
	
</div>


<!-- ????????? -->
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
				historyStatus.value = '??????'
				
			}
			// HistoryTAB[1]
			else if(i == 1) {
				HistoryTAB[0].classList.remove('checkedTAB')
				HistoryTAB[1].classList.add('checkedTAB')
				HistoryTAB[2].classList.remove('checkedTAB')
				historyStatus.value = '??????'
			}
			// HistoryTAB[2]
			else if(i == 2) {
				HistoryTAB[0].classList.remove('checkedTAB')
				HistoryTAB[1].classList.remove('checkedTAB')
				HistoryTAB[2].classList.add('checkedTAB')
				historyStatus.value = '??????'
			}
			BuyHistoryLoad(event)
		}
	}
</script>


<!-- ????????? ?????? ?????? ?????? -->
<script>
	const BuyHistoryStartDate = document.getElementById('BuyHistoryStartDate')
	const BuyHistoryEndDate = document.getElementById('BuyHistoryEndDate')
	const BuyingHistoryForm = document.getElementById('BuyingHistoryForm')
	let today = new Date().toISOString().slice(0,10)

	var twoMonthAgo = new Date(new Date().setMonth(new Date().getMonth() - 2)).toISOString().slice(0,10)	// ??? ??? ???
	var fourMonthAgo = new Date(new Date().setMonth(new Date().getMonth() - 4)).toISOString().slice(0,10)	// ??? ??? ???
	var sixMonthAgo = new Date(new Date().setMonth(new Date().getMonth() - 6)).toISOString().slice(0,10)	// ?????? ??? ???

	BuyHistoryStartDate.value = twoMonthAgo
	BuyHistoryEndDate.value = today
	BuyHistoryEndDate.max = today
	
	const historyDateBtn = document.querySelectorAll('.historyDateBtn')
	const historySorting = document.querySelector('.historySorting')
	for(let i = 0; i < historyDateBtn.length; i++) {
		historyDateBtn[i].onclick = function(event) {
			
			// historyDateBtn[0]
			// ?????? 2??????
			if(i == 0) {
				historyDateBtn[0].classList.add('checkedDateBtn')
				historyDateBtn[1].classList.remove('checkedDateBtn')
				historyDateBtn[2].classList.remove('checkedDateBtn')
				BuyHistoryEndDate.value = today
				BuyHistoryStartDate.value = twoMonthAgo
			}
			// historyDateBtn[1]
			// ?????? 4??????
			else if(i == 1) {
				historyDateBtn[0].classList.remove('checkedDateBtn')
				historyDateBtn[1].classList.add('checkedDateBtn')
				historyDateBtn[2].classList.remove('checkedDateBtn')
				BuyHistoryEndDate.value = today
				BuyHistoryStartDate.value = fourMonthAgo
			}
			// historyDateBtn[2]
			// ?????? 6??????
			else if(i == 2) {
				historyDateBtn[0].classList.remove('checkedDateBtn')
				historyDateBtn[1].classList.remove('checkedDateBtn')
				historyDateBtn[2].classList.add('checkedDateBtn')
				BuyHistoryEndDate.value = today
				BuyHistoryStartDate.value = sixMonthAgo
			}
			// historyDateBtn[3]
			// ??????(submit)
			else if(i == 3) {
				event.preventDefault()
				
				const formData = new FormData(BuyingHistoryForm)
				const url = '${cpath}/my/buying/BuyHistory/'
				const opt = {
						method: 'POST',
						body: formData
				}
				fetch(url, opt)
				.then(resp => resp.json())
				.then(json => {
					historySorting.innerHTML = ''
					json.forEach(dto => {
						createHistoryList(dto)
					})
				})
			}
		}
	}
	
	function createHistoryList(dto) {
		const HistoryItemWrap = document.createElement('div')
		HistoryItemWrap.classList.add('HistoryItemWrap')

		const firstWrapDiv = document.createElement('div')
		
		const HistoryItemThumb = document.createElement('div')
		HistoryItemThumb.classList.add('HistoryItemThumb')
		const HistoryItemThumbImg = document.createElement('img')
		
		HistoryItemThumbImg.src = dto.imgList[0].img
		HistoryItemThumb.appendChild(HistoryItemThumbImg)
		
		firstWrapDiv.appendChild(HistoryItemThumb)
		
		const HistoryItemInfo = document.createElement('div')
		HistoryItemInfo.classList.add('HistoryItemInfo')
		
		const HistoryItemInfoBrand = document.createElement('p')
		HistoryItemInfoBrand.innerText = dto.productDTO.brand
		
		const HistoryItemInfoName = document.createElement('p')
		HistoryItemInfoName.innerText = dto.productDTO.productName
		
		const HistoryItemInfosize = document.createElement('p')
		HistoryItemInfosize.innerText = dto.pSize

		HistoryItemInfo.appendChild(HistoryItemInfoBrand)
		HistoryItemInfo.appendChild(HistoryItemInfoName)
		HistoryItemInfo.appendChild(HistoryItemInfosize)
		
		firstWrapDiv.appendChild(HistoryItemInfo)
		
		
		
		const lastWrapDiv = document.createElement('div')
		
		const HistoryItemPrice = document.createElement('div')
		HistoryItemPrice.classList.add('HistoryItemPrice')
		HistoryItemPrice.innerText = dto.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '???'

		lastWrapDiv.appendChild(HistoryItemPrice)
		const HistoryItemEndDate = document.createElement('div')
		HistoryItemEndDate.classList.add('HistoryItemEndDate')
		HistoryItemEndDate.innerText = dto.endDate
		lastWrapDiv.appendChild(HistoryItemEndDate)
		
		HistoryItemWrap.appendChild(firstWrapDiv)
		HistoryItemWrap.appendChild(lastWrapDiv)
		
		historySorting.appendChild(HistoryItemWrap)
		
		return
	}
	

function BuyHistoryLoad(event){
	event.preventDefault()
	
	const formData = new FormData(BuyingHistoryForm)
	const url = '${cpath}/my/buying/BuyHistory/'
	const opt = {
			method: 'POST',
			body: formData
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		historySorting.innerHTML = ''
		json.forEach(dto => {
			createHistoryList(dto)
		})
	})
}

function getSummaryCount(event) {
	const url = '${cpath}/my/buying/BuyHistory/Summary/'
	const opt = {
		method: 'GET',
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		const buyBidCount = document.querySelector('.buyBidCount')
		const buyProceedCount = document.querySelector('.buyProceedCount')
		const buyEndCount = document.querySelector('.buyEndCount')
		
		buyBidCount.innerText = json.buyBidCount
		buyProceedCount.innerText = json.buyProceedCount
		buyEndCount.innerText = json.buyEndCount
	})
}
window.onload = function(event) {
	BuyHistoryLoad(event)
	getSummaryCount(event)
}
</script>

<%@ include file="../footer2.jsp" %>