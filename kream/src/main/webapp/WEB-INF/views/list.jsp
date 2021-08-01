<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<%@ include file="header.jsp" %>
<style>
	div {		
		font-weight: bold;
	}
	div.categorie {
	    display: flex;
	    position: relative;
	    margin: 0 auto;
	    padding: 0 40px 80px;
	    max-width: 1280px;
	}	
	div.fiter {		
		border: 1px solid black;
		width: 300px;
	}
	div.fiter > div {
		border: none;
		margin-top: 10px;
	}
	div.product {		
		width: 980px;
		height: 4000px;
		display: flex;
		padding-left: 6px;
		padding-right: 6px;	
		justify-content: flex-start;
		flex-wrap: wrap;		
		margin-right: 0;
	}
	div.categorie > div {
		border: 1px solid black;
	}
	ul.categorie1 {
		display: flex;		
	}
	ul.categorie2 {
		list-style: none;
		display: list-item;		
		width: 250px;
	}
	li {
		list-style: none;
		margin-left: 40px;
		cursor: pointer;	
	}
	ul.categorie2 > li {
		list-style: none;
		border-bottom: 1px solid black;		
	}
	p {		
		margin-top: 0;
		text-align: center;
		font-weight: bold;
	}
	img {
		height: 70px;
		width: 70px;
	}
	summary {
		cursor: pointer;
		list-style: none;
		font-weight: bold;
	}
	div.product_list {
		border: 1px solid black;
		width: 200px;
		height: 353px;
		margin-left: 3px;
		margin-bottom: 40px;
	}
	div.product_img {		
		width: 200px;
		height: 200px;				
	}
</style>
</head>
<body>

<div class="categorie" style="display: flex;">
	<!-- 상품 필터 -->
	<div class="fiter">
		<div>필터</div>
		<div>			
			<details>
			<summary>카테고리</summary>
				<ul class="categorie2">
					<li><label><input type="checkbox" name="category" value="스니커즈">스니커즈</label></li>
					<li><label>의류</label>
						<ul>
							<li><label><input type="checkbox" name="category" value="아우터">아우터</label>
							<li><label><input type="checkbox" name="category" value="상의">상의</label>
							<li><label><input type="checkbox" name="category" value="하의">하의</label>
							<li><label><input type="checkbox" name="category" value="의류/기타">기타</label>
						</ul>
					</li>
					<li><label>패션 잡화</label>
						<ul>
							<li><label><input type="checkbox" name="category" value="모자">모자</label></li>
							<li><label><input type="checkbox" name="category" value="가방">가방</label></li>
							<li><label><input type="checkbox" name="category" value="지갑 및 카드홀더">지갑 및 카드홀더</label></li>
							<li><label><input type="checkbox" name="category" value="패션 잡화/기타">기타</label></li>
						</ul>
					</li>
					<li><label>테크</label>
						<ul>
							<li><label><input type="checkbox" name="category" value="그래픽카드">그래픽카드</label></li>
							<li><label><input type="checkbox" name="category" value="게임기">게임기</label></li>
							<li><label><input type="checkbox" name="category" value="테크/기타">기타</label></li>
						</ul>
					</li>
					<li><label><input type="checkbox" name="category" value="라이프">라이프</label></li>
				</ul>
			</details>
		</div>
		<div>			
			<details>
			<summary>브랜드</summary>
				<ul class="categorie3">
					<li><label><input type="checkbox" name="brand" value="Acne Studios">Acne Studios</label></li>
					<li><label><input type="checkbox" name="brand" value="AMI">AMI</label></li>
					<li><label><input type="checkbox" name="brand" value="Balenciaga">Balenciaga</label></li>
					<li><label><input type="checkbox" name="brand" value="Bottega Veneta">Bottega Veneta</label></li>
					<li><label><input type="checkbox" name="brand" value="Burberry">Burberry</label></li>
					<li><label><input type="checkbox" name="brand" value="Celine">Celine</label></li>
					<li><label><input type="checkbox" name="brand" value="Chanel">Chanel</label></li>
					<li><label><input type="checkbox" name="brand" value="FOG Essentials">FOG Essentials</label></li>
					<li><label><input type="checkbox" name="brand" value="Goyard">Goyard</label></li>
					<li><label><input type="checkbox" name="brand" value="Helinox">Helinox</label></li>
					<li><label><input type="checkbox" name="brand" value="IAB Studio">IAB Studio</label></li>
					<li><label><input type="checkbox" name="brand" value="Jordan">Jordan</label></li>
					<li><label><input type="checkbox" name="brand" value="Maison Kitsune">Maison Kitsune</label></li>
					<li><label><input type="checkbox" name="brand" value="Maison Margiela">Maison Margiela</label></li>
					<li><label><input type="checkbox" name="brand" value="Microsoft">Microsoft</label></li>
					<li><label><input type="checkbox" name="brand" value="New Balance">New Balance</label></li>
					<li><label><input type="checkbox" name="brand" value="Nike">Nike</label></li>
					<li><label><input type="checkbox" name="brand" value="Nintendo">Nintendo</label></li>
					<li><label><input type="checkbox" name="brand" value="Nvidia">Nvidia</label></li>
					<li><label><input type="checkbox" name="brand" value="Off-White">Off-White</label></li>
					<li><label><input type="checkbox" name="brand" value="Oofos">Oofos</label></li>
					<li><label><input type="checkbox" name="brand" value="Palace">Palace</label></li>
					<li><label><input type="checkbox" name="brand" value="Prada">Prada</label></li>
					<li><label><input type="checkbox" name="brand" value="Saint Laurent">Saint Laurent</label></li>
					<li><label><input type="checkbox" name="brand" value="Sony">Sony</label></li>
					<li><label><input type="checkbox" name="brand" value="Starbucks">Starbucks</label></li>
					<li><label><input type="checkbox" name="brand" value="Stone Island">Stone Island</label></li>
					<li><label><input type="checkbox" name="brand" value="Stussy">Stussy</label></li>
					<li><label><input type="checkbox" name="brand" value="Supreme">Supreme</label></li>
					<li><label><input type="checkbox" name="brand" value="Thom Browne">Thom Browne</label></li>
					<li><label><input type="checkbox" name="brand" value="Valentino">Valentino</label></li>
				</ul>
			</details>
		</div>
<!-- 		<div> -->
<!-- 			<details> -->
<!-- 			<summary>성별</summary> -->
<!-- 				<ul class="categorie4"> -->
<!-- 					<li><label><input type="checkbox" name="man" value="남자">남자</label></li> -->
<!-- 					<li><label><input type="checkbox" name="woman" value="(W)">여자</label></li> -->
<!-- 				</ul> -->
<!-- 			</details> -->
<!-- 		</div>		 -->
		
<!-- 		미구현 -->
<!-- 		<div> -->
<!-- 			<details> -->
<!-- 			<summary>가격</summary> -->
<!-- 				<ul class="categorie5"> -->
<!-- 					<li><input type="checkbox" name="price" value="">10만원 이하</li> -->
<!-- 					<li><input type="checkbox" name="price" value="">10만원 - 30만원 이하</li> -->
<!-- 					<li><input type="checkbox" name="price" value="">30만원 - 50만원 이하</li> -->
<!-- 					<li><input type="checkbox" name="price" value="">50만원 이상</li> -->
<!-- 				</ul> -->
<!-- 			</details> -->
<!-- 		</div> -->
	</div>
	<!-- 상품 목록 -->
	<div class="product" id="product" style="overflow: auto;">	
	<div id="lists"></div>
	</div>	
</div>


<script>

	let allData = 0

	function loadList() {
		const lists = document.getElementById('lists')
		
		const url = '${cpath}/list'
		const opt = {
				method: 'POST'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			lists.innerHTML = ''
			for(let i = 0; i < json.length; i++) {
				const dto = json[i]
				const div = createDiv(dto)
				lists.appendChild(div)
			}
			allData = Array.from(document.querySelectorAll('.list'))
		})
	}
	
	function createDiv(dto) {
		const div = document.createElement('div')
// 		div.innerHTML = dto.img + dto.brand + dto.productname + dto.price 
// 						+ '<input type="hidden" name="category" value="'+ dto.category + '">'
		const img = document.createElement('img')		
		img.src = dto.img
		div.appendChild(img)
		
		const p = document.createElement('p')
		p.innerText += '브랜드 : ' + dto.brand + ' | '
		p.innerText += '상품이름 : ' + dto.productName + ' | '
		p.innerText += '가격 : ' + dto.price + ' | '
		div.appendChild(p)
						
		const input = document.createElement('input')
		input.type = 'hidden'
		input.name = 'category'
		input.value = dto.category
			
		div.appendChild(input)
		
		const input2 = document.createElement('input')
		input2.type = 'hidden'
		input2.name = 'brand'
		input2.value = dto.brand
		
		div.appendChild(input2)
		
		const input3 = document.createElement('input')
		input3.type = 'hidden'
		input3.name = 'productname'
		input3.value = dto.productName
		
		div.appendChild(input3)
		
		div.className = 'list'
// 		div.oncontextmenu = rightClickHandler

		return div		
	}
	
//------------------------------------------------------------------------------------------------------------	
	
	window.onload = loadList
	 
//------------------------------------------------------------------------------------------------------------	

	const listAll = (div) => {
		div.forEach(e => lists.appendChild(e))
	}
	
//------------------------------------------------------------------------------------------------------------
// 상위 카테고리 필터 - 상위카테고리 리스트 출력 안됨 , 하위카테고리 기능은 수행
	const Filter = (event) => {
		if(event.target.nodeName == 'LABEL') {
			return
		}
		
		allData.forEach(element => document.getElementById('lists').appendChild(element))
	
		const test = Array.from(document.querySelectorAll('.categorie2 input:checked')).map(v => v.value)
		const lists = Array.from(document.querySelectorAll('.list'))
		
// 		console.log(test)
// 		console.log(lists)
		
		if (test.length == 0) {
			lists.innerHTML = ''
			loadList()
			return		
		}
		
		document.getElementById('lists').innerHTML = ''
			
			test.forEach(t => {
				const result = lists.filter(e => t == e.querySelector('input[name="category"]').value)
				listAll(result)
			})	
		}
		
	document.querySelectorAll('.categorie2 > li').forEach(e => {
		e.addEventListener('click', oneCheckbox)
		e.addEventListener('click', Filter)
		
	})
		
		
//------------------------------------------------------------------------------------------------------------		
// 브랜드 필터 - 다른 카테고리와 중복 선택 불가능
	const BrandFilter = (event) => {
		if(event.target.nodeName == 'LABEL') {
			return
		}
		
		allData.forEach(element => document.getElementById('lists').appendChild(element))
	
		const test2 = Array.from(document.querySelectorAll('.categorie3 input:checked')).map(v => v.value)
		const lists = Array.from(document.querySelectorAll('.list'))
		
		if (test2.length == 0) {
			lists.innerHTML = ''
			loadList()
			return		
		}
		
	document.getElementById('lists').innerHTML = ''
		
		test2.forEach(t => {
			const result2 = lists.filter(e => t == e.querySelector('input[name="brand"]').value)
			listAll(result2)
		})	
	}
	
	document.querySelectorAll('.categorie3 > li').forEach(e => {		
		e.addEventListener('click', oneCheckbox)
		e.addEventListener('click', BrandFilter)		
	})
		
	
// 	lists.innerHTML = ''
// 	listAll(div)
	
//------------------------------------------------------------------------------------------------------------

// 	const GenderFilter = (event) => {
// 		if(event.target.nodeName == 'LABEL') {
// 			return
// 		}
		
// 		allData.forEach(element => document.getElementById('lists').appendChild(element))
	
// 		const test3 = Array.from(document.querySelectorAll('.categorie4 input:checked')).map(v => v.value)
// 		const lists = Array.from(document.querySelectorAll('.list'))
		
// // 		console.log(test)
// // 		console.log(lists)
		
// 		if (test3.length == 0) {
// 			lists.innerHTML = ''
// 			loadList()
// 			return		
// 		}
		
// 	document.getElementById('lists').innerHTML = ''

// 		const arr = Array.from(document.querySelectorAll('categorie4 input:checked'))
			
// 		console.log(arr)
		
// 		test3.forEach(t => {
// 			const result3 = lists.filter(e => t.querySelector('input[name="productname"]').value.substring(0, 3) == '(W)')			
// 			console.log(t)
// 			console.log(result3)
// 			listAll(result3)
// 		})	
// 	}
	
// 	document.querySelectorAll('.categorie4 > li').forEach(e => {		
// 		e.addEventListener('click', GenderFilter)
		
// 	})

//------------------------------------------------------------------------------------------------------------
	
	function oneCheckbox(event){
		if(event.target.nodeName == 'LABEL' || event.target.checked == false)	return
			
	    var obj = document.getElementsByName("category");
		var obj2 = document.getElementsByName("brand");
	    obj.forEach(e => e.checked = (e == event.target))
	    obj2.forEach(e => e.checked = (e == event.target))

	}	
//------------------------------------------------------------------------------------------------------------		


	
</script>
<%@ include file="footer.jsp" %>