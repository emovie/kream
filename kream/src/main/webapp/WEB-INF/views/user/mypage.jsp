<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.myWrap {
		display: flex;
		justify-content: center;
	}
	.mypage {
		width: 1000px;
		height: auto;
		padding: 30px 0;
	}
	.myMenu {
		width: 200px;
		height: 400px;
	}
	.myMenu ul {
		margin-top: 0;
	}
	.myMenu li {
		color: gray;
		font-weight: 300;
		font-size: 15px;
		margin-bottom: 5px;
	}
	.myMenu p {
		margin-bottom: 10px;
	}
	.profile {
		display: flex;
		align-items: center;
		border: 1px solid #d5d5d5;
		border-radius: 10px;
		width: inherit;
		height: 150px;
	}
	.profile p:first-child {
		font-weight: 700;
		font-size: 20px;
		margin: 0;
	}
	.profile p:nth-child(2) {
		font-weight: 400;
		font-size: 13px;
		color: gray;
		margin-top: 0;
	}
	.profileImg {
		width: 100px;
		height: 100px;
		border-radius: 50%;
		overflow: hidden;
		background-color: gray;
		margin: 0 20px;
	}
	.myPagebutton{
		background-color: inherit;
		height: 35px;
		padding: 0 15px;
		border: 1px solid #d5d5d5;
		border-radius: 10px;
		text-align: center;
		margin: auto;
		color: #5d5d5d;
		font-size: 12px;
		cursor: pointer;
	}
	.historySum {
		background-color: #f9f9f9;
		border-radius: 10px;
		width: inherit;
		height: 100px;
		display: flex;
		align-items: center;
	}
	.historySum > div {
		display: flex;
		justify-content: space-between;
		text-align: center;	
		width: 800px;
		margin: auto;
	}
	.historySum p {
		margin: 0;
	}
	
	.historySum p:first-child {
		font-size: 13px;
		font-weight: 300;
	}
	.historySum p:last-child {
		font-size: 20px;
		font-weight: 600;
	}
	
	.historyTitle {
		display: flex;
		justify-content: space-between;
		margin-top: 40px;
		margin-bottom: 15px;
	}
	.historyTitle > div:first-child {
		font-size: 18px;
		font-weight: 600;
	}
	.historyTitle > div:nth-child(2){
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.historyTitle > div:nth-child(2) > div{
		color: gray;
		font-size: 13px;
		font-weight: 300;
	}
	.historyList {
		width: inherit;
		height: 200px;
	}
	.historyList p {
		text-align: center;
		line-height: 200px;
		color: gray;
		font-size: 13px;
		font-weight: 300;
	}
	.wish {
		margin-top: 40px;
		margin-bottom: 100px;
	}
	.wishBox {
		width: inherit;
		height: 230px;
		background-color: #f9f9f9;
		border-radius: 10px;
		display: flex;
		align-items: center;
		justify-content: center;
		text-align: center;
	}
	.wish div{
		font-size: 18px;
		font-weight: 600;
		margin-bottom: 15px;
	}
	.wish p {
		color: gray;
		font-size: 13px;
		font-weight: 300;
	}
	
</style>
<div class="myWrap">
	<div class="myMenu">
		<h1><a href="${cpath }/my">MY PAGE</a></h1>
		<nav>
			<div>
				<p>쇼핑 정보</p>
				<ul>
					<li>구매 내역</li>
					<li>판매 내역</li>
					<li>관심 상품</li>
				</ul>
			</div>
			<div>
				<p>내 정보</p>
				<ul>
					<li>프로필 정보</li>
					<li>주소록</li>
					<li>결제 정보</li>
					<li>판매 정산 계좌</li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="mypage">
		<div class="profile">
			<!-- 저장된 로그인 세션을 통해 유저 정보 가져오기 -->
			<div class="profileImg"></div>
			<div class="userInfo">
				<p>이름</p>
				<p>email@email.com</p>
				<button class="myPagebutton" type="button" onclick="location.href='#'">프로필 수정</button>
			</div>
		</div>
		<div class="buying">
			<div class="historyTitle">
				<div>구매 내역</div>
				<div>
					<!-- buying 테이블에서 로그인 세션 유저 정보로 select -->
					<div>더보기</div>
					<div class="listArrow"></div>
				</div>
			</div>
			<div class="historySum">
			<!-- 마찬가지.. 해당하는 데이터 count 값 넣어주기 -->
				<div>
					<div>
						<p>전체</p>
						<p style="color:#f15746;">0</p>
					</div>
					<div>
						<p>입찰 중</p>
						<p>0</p>
					</div>
					<div>
						<p>진행 중</p>
						<p>0</p>
					</div>
					<div>
						<p>종료</p>
						<p>0</p>
					</div>
				</div>
			</div>
			<div class="historyList">
				<!-- 로그인 세션 유저 정보로 데이터 가져오기 -->
				<p>거래 내역이 없습니다</p>
			</div>
		</div>
		<div class="selling">
			<div class="historyTitle">
				<div>판매 내역</div>
				<div>
					<!-- selling 테이블에서 로그인 세션 유저 정보로 select -->
					<div>더보기</div>
					<div class="listArrow"></div>
				</div>
			</div>
			<div class="historySum">
				<div>
					<div>
						<p>전체</p>
						<p style="color:#31b46e;">0</p>
					</div>
					<div>
						<p>입찰 중</p>
						<p>0</p>
					</div>
					<div>
						<p>진행 중</p>
						<p>0</p>
					</div>
					<div>
						<p>종료</p>
						<p>0</p>
					</div>
				</div>
			</div>
			<!-- 로그인 세션 유저 정보로 데이터 가져오기 -->
			<div class="historyList">
				<p>거래 내역이 없습니다</p>
			</div>
		</div>
		<!-- 유저 데이터 가져오기.. -->
		<div class="wish">
			<div>관심 상품</div>
			<div class="wishBox">
				<div>
					<p>추가하신 관심 상품이 없습니다.</p>
					<button class="myPagebutton" type="button" onclick="location.href='${cpath}/search'">SHOP 바로가기</button>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../footer2.jsp" %>