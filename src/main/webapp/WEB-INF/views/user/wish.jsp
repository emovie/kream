<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/mypage.css?ver=2" />
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
		min-height: 250px;
		height: auto;
		text-align: center;
		padding: 40px 0;
		margin-bottom: 100px !important;
	}
	.wishContentEmpty {
		margin-top: 90px;
	}
	.wishThumb {
		width: 80px;
		height: 80px;
		overflow: hidden;
		border-radius: 10px;
		background-color: rgb(244, 244, 244);
		margin-right: 15px;
	}
	.wishThumb img {
		width: 100%;
	}
	.wishInfo {
		text-align: left;
	}
	.wishInfo p {
		margin: 0;
	}
	.wishItemsWrap > div:first-child{
		display: flex;
		margin-bottom: 18px;
	}
	.wishItemsWrap {
		border-bottom: 1px solid rgb(221, 221, 221);
		margin: 0;
		margin-bottom: 18px;
		cursor: pointer;
		display: flex;
		justify-content: space-between;
		
	}
	.wishItemsWrap > div p {
		color: black;
		font-size: 13px;
	}
	.wishItemsWrap > div p:first-child {
		font-size: 14px;
		font-weight: 500;
	}
	.wishItemsWrap > div p:last-child {
		margin-top: 20px;
		font-weight: 500;
	}
	.BuyADeleteBtn {
		margin: 0;
	}
	.WishBuyBtn {
		width: 150px;
		height: 60px;
		background-color: #ef6253;
		border-radius: 10px;
	}
	.WishDeleteBtn {
		text-align: right;
		font-size: 12px;
		font-weight: 300;
		text-decoration: underline;
		margin-top: 8px;
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
		<!-- 위시리스트 페이징 -->
		<div class="wishContent">
			<div class="wishContentEmpty">
				<p>추가하신 관심 상품이 없습니다.</p>
				<button class="myPagebutton" type="button" onclick="location.href='${cpath}/search'">SHOP 바로가기</button>
			</div>
		</div>
	</div>
	
</div>
<script>

const wishContent = document.querySelector('.wishContent')

function LoadWishList() {
	const loginIdx = '${login.idx}'
	
	const url = '${cpath}/my/wish/' + loginIdx + '/'
	const opt = {
			method: 'GET'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		const wishContentEmpty = document.querySelector('.wishContentEmpty')
		wishContentEmpty.classList.remove('hidden')

		if(json != null) {
			
			const wishContent = document.querySelector('.wishContent')
			wishContent.style.padding = '5px 0'
			const productList = json.productList
			
			const wishList = json.wishList
			
			// 위시 리스트 가져와서 출력
			for(let i = 0; i < wishList.length; i++) {
				
				wishContentEmpty.classList.add('hidden')
				
				const wishItemsWrap = document.createElement('div')
				wishItemsWrap.classList.add('wishItemsWrap')
				
				const wishThumb = document.createElement('div')
				const wishThumbImg = document.createElement('img')
				wishThumb.classList.add('wishThumb')

				const wishInfo = document.createElement('div')
				wishInfo.classList.add('wishInfo')

				const wishBrand = document.createElement('p')
				const wishName = document.createElement('p')
				const wishSize = document.createElement('p')

				const wishInfoWrap = document.createElement('div')

				// 썸네일
				wishThumbImg.src = productList[i].imgList[0].img
				wishThumb.appendChild(wishThumbImg)
				wishInfoWrap.appendChild(wishThumb)
				
				
				// 브랜드
				wishBrand.innerText = productList[i].brand
				wishInfo.appendChild(wishBrand)

				// 상품명
				wishName.innerText = productList[i].productName
				wishInfo.appendChild(wishName)
				
				// 사이즈 (외래키로 변경 필요 > buying table...의 즉시 구매가, 사이즈를 가져올 수 있어야 한다.)
				wishSize.innerText = wishList[i].psize
				wishInfo.appendChild(wishSize)
				
				
				wishInfoWrap.appendChild(wishInfo)
				wishItemsWrap.appendChild(wishInfoWrap)
				wishContent.appendChild(wishItemsWrap)
				
				const BuyADeleteBtn = document.createElement('div')
				BuyADeleteBtn.classList.add('BuyADeleteBtn')
				const WishBuyBtn = document.createElement('div')
				WishBuyBtn.classList.add('WishBuyBtn')

				const WishDeleteBtn = document.createElement('div')
				WishDeleteBtn.classList.add('WishDeleteBtn')
				WishDeleteBtn.innerText = '삭제'
				
				// 위시 삭제
				BuyADeleteBtn.appendChild(WishBuyBtn)
				BuyADeleteBtn.appendChild(WishDeleteBtn)
				wishItemsWrap.appendChild(BuyADeleteBtn)
				
				// 상품 판매페이지 이동
				wishContent.onclick = function() {
					location.href = cpath + '/products/' + productList[i].idx
				}
				
				WishDeleteBtn.onclick = function(event) {
					event.stopPropagation()
					
					const url = '${cpath}/wish/delete/' + wishList[i].idx + '/'
					const opt = {
							method: 'GET'
					}
					fetch(url, opt)
					.then(resp => resp.text())
					.then(text => {
						if(text == 1) {
							location.reload(true)
						}
						else {
							alert('삭제 실패')
						}
					})
				}
			}
		}
	})
}
window.onload = LoadWishList	


</script>


<%@ include file="../footer2.jsp" %>