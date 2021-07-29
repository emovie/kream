<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
	.shopWrap {
		width: 80%;
		height: auto;
		margin: auto;
	}
	.shopTitle {
		margin-top: 40px;
		margin-bottom: 40px;
		text-align: center;
		width: 100%;
	}
	.mainProductContainer {
		display: flex;
		margin-bottom: 100px;
	}
	.sideFilterMenu {
		width: 20%;
	}
	.mainProductList {
		width: 80%;
	}
	.mainListSubMenu {
		display: flex;
		justify-content: space-between;
		margin: 10px 0;
	}
	.ShopList {
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
	}
	.mainListSubMenu {
		font-size: 15px;
	}
	.productCount {
		font-weight: 600;
	}



	/* items */
		
	.ShopList > div {
		width: 230px;
		height: auto;
		cursor: pointer;
	}
	
	.ShopList > div > p {
		font-size: 14px;
	}
	.thumbWrap {
		width: 230px;
		height: 230px;
		background-color: rgb(244, 244, 244);
		border-radius: 12px;
		overflow: hidden;
		margin-top: 20px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.thumbnail {
		width: 190px;
		height: 190px;
	}
	.brandWrap {
		width: 230px;
		margin-top: 10px; 
		display: flex;
		justify-content: space-between;
	}
	.brandWrap div:first-child {
		font-size: 13px;		
		font-weight: 500;
	}
	.wishMark {
		width: 23px;
		height: 23px;
		background-repeat: no-repeat;
		background-position: center;
		background-size: 100%;
	}
	.wishMark.off {
		background-image: url("https://imgur.com/ZvqIAuS.png");
	}
	.wishMark.on {
		background-image: url("https://imgur.com/tiurw8c.png");
	}


</style>

<div class="shopWrap">
	<h2 class="shopTitle">SHOP</h2>
	<div></div>
	<div class="mainProductContainer">
		<div class="sideFilterMenu">
		</div>
		<div class="mainProductList">
			<div class="mainListSubMenu">
				<div>상품  <span class="productCount">${productCount }</span></div>
				<div>정렬</div>
			</div>
			<div class="ShopList">
			
			</div>
		</div>
	</div>
</div>

<!-- 
	Ajax 스크롤 페이징
 -->
 
 <script>
/*	let pageCount = 1

	function scrollPaging(pageCount) {
		const url = '${cpath}/search/paging'
		const opt = {
				method:'GET'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			
		})
	}
	
	
	window.onload = function() {
		scrollPaging(pageCount)
		pageCount++
	}
	
 	window.scroll = function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
	     if(window.scrollTop() >= document.height() - window.height()){
	          getList(page);
	          page++;
	     } 
	}); */
	

	window.addEventListener('scroll', function() {
		console.log(window.pageYOffset)
	});
	
</script>

<!-- <!-- 상품 불러오기 -->

<script>
	const searchKeyword = '${keyword}'
	
	
	function loadShopList(searchKeyword) {
		console.log(searchKeyword)
		let url = ''
		if(searchKeyword == '') {
			url += '${cpath}/search/allList/'
			console.log(url)
		}
		else {
			url += '${cpath}/search/allList/' + searchKeyword + '/'
			console.log(url)
		}
		
		const opt = {
				method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
			console.log(json[0].imgList[0].img)
			
			const ItemList1 = document.querySelector('.ShopList')
			
			function itemList() {
				for(let i = 0; i < json.length ; i++) {
					const item = document.createElement('div')
					const brandWrap = document.createElement('div')
					const brand = document.createElement('div')
					
					const thumbWrap = document.createElement('div')
					const thumbnail = document.createElement('img')
					const prodName = document.createElement('p')
					
					// 상품에 이미지가 있는지 확인
					// 이미지가 없는 경우 그냥 회색 박스 출력
					thumbnail.classList.add('thumbnail')
					thumbWrap.classList.add('thumbWrap')
					if(json[i].imgList != null) {
						thumbnail.src = json[i].imgList[0].img
					}
					else {
						thumbnail.style.backgroundColor = 'gray'	    				
					}
					
					thumbWrap.appendChild(thumbnail)
					brandWrap.classList.add('brandWrap')
					brand.innerText = json[i].brand
					brandWrap.appendChild(brand)
					
					// 관심 상품
					const wishMark = document.createElement('div')
					wishMark.classList.add('wishMark')
					wishMark.classList.add('off')
					
					wishMark.onclick = function(event) {
						// 상품 페이지로 이동하는 부모 요소 이벤트를 막는다
						event.stopPropagation()
						
						// 현재 요소 클래스 이름을 확인하고 관심상품 마크를 온/오프 할 수 있도록 한다
						console.log(event.target.classList[1])
						console.log(event.target.classList.value == 'wishMark off')
						if(event.target.classList.value == 'wishMark off') {
							event.target.classList.replace('off', 'on');
						}
						else {
							event.target.classList.replace('on', 'off');
						}
					}
					
					brandWrap.appendChild(wishMark)
					
					prodName.innerText = json[i].productName
					
					item.appendChild(thumbWrap)
					item.appendChild(brandWrap)
					item.appendChild(prodName)
					
					// 상품 판매 페이지 이동
					const prodIdx = json[i].idx
					
					item.onclick = function() {
						location.href = '${cpath}/products/' + prodIdx
					}
					

					ItemList1.appendChild(item)
					
				}
				
				if(json.length % 4 != 0) {
					const emptyBoxCount = 4 - (json.length % 4)
					for(let i = 0; i < emptyBoxCount; i++) {
						ItemList1.appendChild(document.createElement('div'))
					}
				}
				
			}
		
			itemList()
		})
	}
	
	window.onload = loadShopList(searchKeyword)
</script>

<%@ include file="footer.jsp" %>