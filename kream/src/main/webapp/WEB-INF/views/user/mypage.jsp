<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/mypage.css?ver=5" />
<c:if test="${empty login }">
	<script>
		location.href = '${cpath }/login'; 
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
	
	<div class="mypage">
		<div class="profile">
			<!-- 저장된 로그인 세션을 통해 유저 정보 가져오기 -->
			<div class="profileImg">
				<img class="${login.profileimage == 'default.jpg' ? 'defaultImg' : 'existImg' }" src="${cpath }/upload/${login.profileimage }">
			</div>
			<div class="userInfo">
				<p>${login.name }</p>
				<p>${login.email }</p>
				<button class="myPagebutton" type="button" onclick="location.href='${cpath }/my/profile'">프로필 수정</button>
			</div>
		</div>
		<div class="buying">
			<div class="historyTitle">
				<div>구매 내역</div>
				<div>
					<!-- buying 테이블에서 로그인 세션 유저 정보로 select -->
					<div onclick="location.href='${cpath}/my/buying'">더보기</div>
					<div class="listArrow"></div>
				</div>
			</div>
			<div class="historySum" onclick="location.href='${cpath}/my/buying'">
			<!-- 마찬가지.. 해당하는 데이터 count 값 넣어주기 -->
				<div>
					<div>
						<p>전체</p>
						<p class="buyAllCount" style="color:#f15746;">0</p>
					</div>
					<div>
						<p>입찰 중</p>
						<p class="buyBidCount">0</p>
					</div>
					<div>
						<p>진행 중</p>
						<p class="buyProceedCount">0</p>
					</div>
					<div>
						<p>종료</p>
						<p class="buyEndCount">0</p>
					</div>
				</div>
			</div>
			<div class="historyList buyList">
				<!-- 로그인 세션 유저 정보로 데이터 가져오기 -->
				<p>거래 내역이 없습니다</p>
			</div>
		</div>
		<div class="selling">
			<div class="historyTitle">
				<div>판매 내역</div>
				<div>
					<!-- selling 테이블에서 로그인 세션 유저 정보로 select -->
					<div onclick="location.href='${cpath}/my/selling'">더보기</div>
					<div class="listArrow"></div>
				</div>
			</div>
			<div class="historySum" onclick="location.href='${cpath}/my/selling'">
				<div>
					<div>
						<p>전체</p>
						<p class="sellAllCount" style="color:#31b46e;">0</p>
					</div>
					<div>
						<p>입찰 중</p>
						<p class="sellBidCount">0</p>
					</div>
					<div>
						<p>진행 중</p>
						<p class="sellProceedCount">0</p>
					</div>
					<div>
						<p>종료</p>
						<p class="sellEndCount">0</p>
					</div>
				</div>
			</div>
			<!-- 로그인 세션 유저 정보로 데이터 가져오기 -->
			<div class="historyList SellList">
				<p>거래 내역이 없습니다</p>
			</div>
		</div>
		<!-- 유저 데이터 가져오기.. -->
		<div class="wish">
			<div class="wishTitle">
				<div>관심 상품</div>
				<div>
					<!-- buying 테이블에서 로그인 세션 유저 정보로 select -->
					<div onclick="location.href='${cpath}/my/wish'">더보기</div>
					<div class="listArrow"></div>
				</div>
			</div>
			<div class="wishBox">
				<div>
					<p>추가하신 관심 상품이 없습니다.</p>
					<button class="myPagebutton" type="button" onclick="location.href='${cpath}/search'">SHOP 바로가기</button>
				</div>
			</div>
		</div>
	</div>
	
</div>

<script>

function getSellSummaryCount(event) {
	const url = '${cpath}/my/selling/SellHistory/Summary/'
	const opt = {
		method: 'GET',
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		const sellAllCount = document.querySelector('.sellAllCount')
		const sellBidCount = document.querySelector('.sellBidCount')
		const sellProceedCount = document.querySelector('.sellProceedCount')
		const sellEndCount = document.querySelector('.sellEndCount')
		
		sellAllCount.innerText = json.sellAllCount
		sellBidCount.innerText = json.sellBidCount
		sellProceedCount.innerText = json.sellProceedCount
		sellEndCount.innerText = json.sellEndCount
	})
}

function getBuySummaryCount(event) {
	const url = '${cpath}/my/buying/BuyHistory/Summary/'
	const opt = {
		method: 'GET',
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		const buyAllCount = document.querySelector('.buyAllCount')
		const buyBidCount = document.querySelector('.buyBidCount')
		const buyProceedCount = document.querySelector('.buyProceedCount')
		const buyEndCount = document.querySelector('.buyEndCount')
		
		buyAllCount.innerText = json.buyAllCount
		buyBidCount.innerText = json.buyBidCount
		buyProceedCount.innerText = json.buyProceedCount
		buyEndCount.innerText = json.buyEndCount
	})
}

window.onload = function(event) {
	
	getSellSummaryCount(event)
	getBuySummaryCount(event)
}
</script>


<%@ include file="../footer2.jsp" %>