<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/mypage.css" />
<style>
	.myprofile {
		width: 1000px;
		height: auto;
		padding: 10px 0;
		margin-bottom: 100px;
	}
	.myprofile h2 {
		font-size: 28px;
	}
	.profileContent {
		width: inherit;
		height: auto;
	}
	.profileImgBox {
		display: flex;
		width: inherit;
		height: 170px;
		align-items: center;
		border-bottom: 1px solid #d5d5d5;
	}
	.profileImgBox > div {
		margin-left: 0;
	}
	.userInfo .userName {
		font-size: 25px;
		font-weight: 600;
		margin-top: 10px;
		margin-bottom: 10px;
		text-align: left;
	}
	.profileContent h3 {
		font-size: 18px;
		margin-top: 40px;
		margin-bottom: 25px;
	}
	.profileContent span {
		line-height: 35px;
	}
	.loginInfo p, .privacyInfo p {
		font-size: 13px;
		color: gray;
		margin-bottom: 5px;
	}
	.loginInfo > div, .privacyInfo > div {
		width: 480px;
		border-bottom: 1px solid #d5d5d5;
		padding-bottom: 10px;
		margin-bottom: 30px;
	}
	.loginInfo button, .privacyInfo button {
		margin: 0;
	}
	.loginInfo > div > div, .privacyInfo > div > div {
		display: flex;
		justify-content: space-between;
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
					<img src="${login.profileimage }">
				</div>
				<div class="userInfo">
					<p class="userName">${login.name }</p>
					<button class="myPagebutton" type="button">이미지 변경</button>
					<button class="myPagebutton" type="button">삭제</button>
				</div>
			</div>
			
			<div class="loginInfo">
				<h3>로그인 정보</h3>
				<div>
					<p>이메일 주소</p>
					<span>${login.email }</span>
				</div>
				<div>
					<p>비밀번호</p>
					<div>
						<span>●●●●●●●●●</span>
						<button class="myPagebutton" type="button">변경</button>
					</div>
				</div>
			</div>
			
			<div class="privacyInfo">
				<h3>개인 정보</h3>
				<div>
					<p>이름</p>
					<div>
						<span>${login.name }</span>
						<button class="myPagebutton" type="button">변경</button>
					</div>
				</div>
				<div>
					<p>휴대폰 번호</p>
					<span>${login.phonenumber }</span>
				</div>
			</div>
		</div>
	</div>
	
</div>

<%@ include file="../footer2.jsp" %>