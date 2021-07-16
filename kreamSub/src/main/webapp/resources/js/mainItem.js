
function itemList() {
	const opt = {
			metod: 'GET',
	} 
	
	fetch(cpath + '/main/justDropped/', opt)
	.then(resp => resp.json())
	.then(json => {
		const ItemList1 = document.querySelector('.List1')
		const moreBtn = document.querySelector('.moreBtn')
		
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
				
				// 현재 임시로 일부 상품에만 이미지를 넣어놨기 때문에
				// 상품에 이미지가 있는지 확인
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
				brandWrap.appendChild(document.createElement('div'))
				
				prodName.innerText = json[i].productName
				
				item.appendChild(thumbWrap)
				item.appendChild(brandWrap)
				item.appendChild(prodName)
				ItemList1.appendChild(item)
				
				if(count == 12) {
					moreBtn.classList.add('hidden')
				}
			}
		}
		
		itemList()
		
		moreBtn.onclick = function() {
			if(count < 12) {
				start = count
				count += 4
				itemList()
			}

		}
		
	})

	/* fetch('${cpath}/main/mostPopular/', opt)
	.then(resp => resp.json())
	.then(json => {
		const ItemList2 = document.querySelector('.ItemList2')
		json.forEach(e => {
			const item = document.createElement('div')
			const brand = document.createElement('div')
			brand.innerText = e.brand
			ItemList2.appendChild(item)
		})
	}) */
}

itemList()
