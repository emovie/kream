
function itemSection() {
	const opt = {
			metod: 'GET',
	} 
	
	fetch(cpath + '/main/justDropped/', opt)
	.then(resp => resp.json())
	.then(json => {
		const ItemList1 = document.querySelector('.List1')
		const moreBtn1 = document.querySelector('.moreBtn1')

		let start = 0
		let count = 4
		
		function itemList() {
			for(let i = start; i < count ; i++) {
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
					location.href = cpath + '/products/' + prodIdx
				}
				
				ItemList1.appendChild(item)
				
				if(count == 12) {
					moreBtn1.classList.add('hidden')
				}
			}
		}
		
		itemList()
		
		moreBtn1.onclick = function() {
			if(count < 12) {
				start = count
				count += 4
				itemList()
			}

		}
		
	})

	fetch(cpath + '/main/mostPopular/', opt)
	.then(resp => resp.json())
	.then(json => {
		const ItemList2 = document.querySelector('.List2')
		const moreBtn2 = document.querySelector('.moreBtn2')

		let start = 0
		let count = 4
		
		function itemList() {
			for(let i = start; i < count ; i++) {
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
					location.href = cpath + '/products/' + prodIdx
				}
				
				ItemList2.appendChild(item)
				
				if(count == 12) {
					moreBtn2.classList.add('hidden')
				}
			}
		}
		
		itemList()
		
		moreBtn2.onclick = function() {
			if(count < 12) {
				start = count
				count += 4
				itemList()
			}

		}
		
	})
	
	fetch(cpath + '/main/Electronics/', opt)
	.then(resp => resp.json())
	.then(json => {
		const ItemList3 = document.querySelector('.List3')
		const moreBtn3 = document.querySelector('.moreBtn3')

		let start = 0
		let count = 4
		
		function itemList() {
			for(let i = start; i < count ; i++) {
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
					location.href = cpath + '/products/' + prodIdx
				}
				
				ItemList3.appendChild(item)
				
				if(count == 12) {
					moreBtn3.classList.add('hidden')
				}
			}
		}
		
		itemList()
		
		moreBtn3.onclick = function() {
			if(count < 12) {
				start = count
				count += 4
				itemList()
			}

		}
		
	})
}

itemSection()

