

// 검색 관련 스크립트

// 검색창 켜기,끄기 버튼
const searchBtn = document.querySelector('.searchBtn')
const searchWrap = document.querySelector('.searchWrap')
const overlay = document.querySelector('.overlay')
const searchCancel = document.querySelector('.cancelBtn')

function searchopen() {
	searchWrap.classList.remove('hidden')
    overlay.classList.remove('hidden')
    clear()
}

function searchclose() {
	searchWrap.classList.add('hidden')
    overlay.classList.add('hidden')
    clear()
}

searchBtn.onclick = searchopen
overlay.onclick = searchclose
searchCancel.onclick = searchclose 

// 검색 리스트
const inputSearch = document.querySelector('#inputSearch')
const clearBtn = document.querySelector('.clearBtn')
const recommendItems = document.querySelectorAll('.recommendItem > div')

const searchResult = document.querySelector('.searchResult')

function search(event) {
	searchResult.classList.add('hidden')
	
	// 검색 인풋에 입력값이 있을 때
	if(inputSearch.value.length > 0) {
		searchWrap.style.height = '315px'
    	clearBtn.classList.remove('hidden')
    	recommendItems.forEach(e => {
	    	e.classList.add('hidden')
    	})
    }
	
	// 검색 인풋에 입력값이 없을 때
    else {
    	clearBtn.classList.add('hidden')
    	recommendItems.forEach(e => {
	    	e.classList.remove('hidden')
    	})
    	searchWrap.style.height = 'auto'
    }
	
	// 현재 입력한 값을 키워드로 받아서 ajax를 통해 전달
	const keyword = event.target.value
	const url = cpath + '/search/' + keyword + '/'
	const opt = {
			method: 'GET',
	}
	fetch(url,opt)
	.then(resp => resp.json())
	.then(json => { return json })
	.then(e => {
		// 검색 결과가 있는 경우
		if(Object.keys(e).length > 0){	
			
			const listBox = document.createElement('div')
			searchWrap.style.height = 'auto'

			searchResult.innerHTML = ''
			searchResult.style.paddingTop = ''
			searchResult.style.paddingBottom = ''
			
			listBox.style.overflowY = 'auto'
			listBox.style.height = 'auto'
			listBox.style.width = '650px'
			
			const suggestWrap = document.createElement('div')
			const suggestTitle = document.createElement('div')
			const listArrow = document.createElement('div')
			const listCount = document.createElement('div')
			
			listCount.classList.add('listCount')
			// 검색 결과수를 클릭하면 서브밋
			listCount.onclick = searchSubmit
			
			suggestWrap.classList.add('suggestWrap')
			
			suggestTitle.classList.add('suggestTitle')
			suggestTitle.innerText = keyword
			
			listCount.classList.add('listCount')
			listCount.innerText = Object.keys(e).length
			
			listArrow.classList.add('listArrow')
			
			suggestWrap.prepend(suggestTitle)
			listCount.appendChild(listArrow)
			suggestWrap.appendChild(listCount)
			
			searchResult.prepend(suggestWrap)
			
			// 검색 결과가 10건 이상인 경우
			if(Object.keys(e).length > 10){
				// 최근 순으로 10개만 출력
				for(let i = 0; i < 10; i++){
					
					const searchListItemWrap = document.createElement('div')
					searchListItemWrap.classList.add('searchListItemWrap')
					const searchListItemThumb = document.createElement('img')
					searchListItemThumb.classList.add('searchListItemThumb')
					const searchListItemName = document.createElement('div')
					searchListItemName.classList.add('searchListItemName')

					// 판매페이지 연결
					const prodIdx = e[i].idx
					searchListItemWrap.onclick = function() {
						location.href = cpath + '/products/' + prodIdx
					}
					
					// 상품 이미지 null 체크
					if(e[i].imgList != null) {
						searchListItemThumb.src = e[i].imgList[0].img
					}
					else {
						searchListItemThumb.style.backgroundColor = 'gray'						
					}
					
					const enName = document.createElement('p')
					const krName = document.createElement('p')
					enName.innerText = e[i].productName
					krName.innerText = e[i].krName
					
					searchListItemName.appendChild(enName)
					searchListItemName.appendChild(krName)
					
					searchListItemWrap.appendChild(searchListItemThumb)
					searchListItemWrap.appendChild(searchListItemName)
					
					listBox.style.height = '385px'
					listBox.appendChild(searchListItemWrap)
					
					searchResult.appendChild(listBox)
					searchResult.classList.remove('hidden')
    			}
    		}
			
			// 검색 결과가 10건 미만인 경우
			else{
    			for(let i = 0; i < Object.keys(e).length; i++){
    				
    				const searchListItemWrap = document.createElement('div')
					searchListItemWrap.classList.add('searchListItemWrap')
					const searchListItemThumb = document.createElement('img')
					searchListItemThumb.classList.add('searchListItemThumb')
					const searchListItemName = document.createElement('div')
					searchListItemName.classList.add('searchListItemName')
    				
					// 판매페이지 연결
					const prodIdx = e[i].idx
					searchListItemWrap.onclick = function() {
						location.href = cpath + '/products/' + prodIdx
					}
					
    				// 상품 이미지 null 체크
					if(e[i].imgList != null) {
						searchListItemThumb.src = e[i].imgList[0].img
					}
					else {
						searchListItemThumb.style.backgroundColor = 'gray'						
					}
					
					const enName = document.createElement('p')
					const krName = document.createElement('p')
					enName.innerText = e[i].productName
					krName.innerText = e[i].krName
					
					searchListItemName.appendChild(enName)
					searchListItemName.appendChild(krName)
					
					searchListItemWrap.appendChild(searchListItemThumb)
					searchListItemWrap.appendChild(searchListItemName)
					
					listBox.style.height = 'auto'
					listBox.appendChild(searchListItemWrap)

					searchResult.appendChild(listBox)
					searchResult.classList.remove('hidden')
    			}
			}
		}
		
		// 검색 결과가 없는 경우
		else {
			searchResult.innerHTML = ''
			const pMain = document.createElement('p')
			const pSub = document.createElement('p')
			
			pMain.innerText = '검색하신 결과가 없습니다.'
			pSub.innerText = '상품 등록 요청은 앱 1:1 문의하기 로 요청해주세요.'

			searchResult.style.paddingTop = '80px'
			searchResult.style.paddingBottom = '80px'
			searchResult.appendChild(pMain)
			searchResult.appendChild(pSub)
			searchResult.classList.remove('hidden')
			return
		}

	})
}

inputSearch.oninput = search

// 검색어 클리어 버튼
function clear() {
	recommendItems.forEach(e => { e.classList.remove('hidden') })
	clearBtn.classList.add('hidden')
	searchResult.classList.add('hidden')
	searchResult.innerHTML = ''
	searchWrap.style.height = ''
	inputSearch.value = ''
}

clearBtn.onclick = clear


// Ajax 검색 리스트로 바로가기 (form submit)
const searchForm = document.getElementById('searchForm')
function searchSubmit() {
	searchForm.submit()
}

// 최근 검색어
searchForm.onsubmit = function(event) {
	console.log(event.target.value)
}



