<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/mypage.css?ver=1" />
<style>
	.wish {
		width: 1000px;
		height: auto;
		padding: 10px 0;
		margin: 0;
	}
	.wish h2 {
		font-size: 28px;
	}
	.wishContent {
		width: inherit;
		height: 250px;
		text-align: center;
		padding: 40px 0;
	}
</style>
<div class="myWrap">
	<div class="myMenu">
		<h1><a href="${cpath }/my">MY PAGE</a></h1>
		<nav>
			<div>
				<p>쇼핑 정보</p>
				<ul>
					<li><a href="${cpath }/my/buying">구매 내역</a></li>
					<li><a href="${cpath }/my/selling">판매 내역</a></li>
					<li><a href="${cpath }/my/wish" class="menuStrong">관심 상품</a></li>
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
	
	<div class="wish">
		<h2>관심 상품</h2>
		<div class="myContentLine"></div>
		<!-- 세션 로그인 정보로 관심 상품 데이터 체크 -->
		<div class="wishContent">
			<p>추가하신 관심 상품이 없습니다.</p>
			<button class="myPagebutton" type="button" onclick="location.href='${cpath}/search'">SHOP 바로가기</button>
		</div>
	</div>
	
</div>

<%@ include file="../footer2.jsp" %>