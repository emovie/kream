<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/mypage.css?ver=1" />
<link rel="stylesheet" href="${cpath }/resources/css/myHistory.css?ver=1" />

<div class="myWrap">
	<div class="myMenu">
		<h1><a href="${cpath }/my">MY PAGE</a></h1>
		<nav>
			<div>
				<p>쇼핑 정보</p>
				<ul>
					<li><a href="${cpath }/my/buying" class="menuStrong">구매 내역</a></li>
					<li><a href="${cpath }/my/selling">판매 내역</a></li>
					<li><a href="${cpath }/my/wish">관심 상품</a></li>
				</ul>
			</div>
			<div>
				<p>내 정보</p>
				<ul>
					<li><a href="${cpath }/my/profile">프로필 정보</a></li>
					<li><a href="${cpath }/my/address">주소록</a></li>
					<li><a href="${cpath }/my/payment">결제 정보</a></li>
					<li><a href="${cpath }/my/account">판매 정산 계좌</a></li>
				</ul>
			</div>
		</nav>
	</div>
	
	<div class="myHistory">
		<h2>구매 내역</h2>
		<!-- 세션 로그인 정보로 구매 내역 데이터 체크 -->
		<div class="myHistoryContent">
			<div class="myHistoryMenu">
				<!-- 세션 로그인 정보로 구매 내역 데이터 상태별 카운트 체크 -->
				<div>
					<p>0</p>
					<p>구매 입찰</p>
				</div>
				<div>
					<p>0</p>
					<p>진행중</p>
				</div>
				<div>
					<p>0</p>
					<p>종료</p>
				</div>
			</div>
		</div>
		<div class="historyDate">
			<div class="DateBtns">
				<div>최근 2개월</div>
				<div>4개월</div>
				<div>6개월</div>
			</div>
			<div class="calendar"></div>
		</div>
		<ul>
			<li>한 번에 조회 가능한 기간은 최대 6개월입니다.</li>
			<li>기간별 조회 결과는 입찰일 기준으로 노출됩니다.</li>
		</ul>
		<div class="historySorting">
			
		</div>
	</div>
	
</div>

<%@ include file="../footer2.jsp" %>