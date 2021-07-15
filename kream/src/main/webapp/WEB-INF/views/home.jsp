<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/main.css?ver=2">

	<div class="slideWrapper">
        <ul class="slide">
            <li style="background-color: rgb(235, 235, 223);
            			background-image: url('https://kream-phinf.pstatic.net/MjAyMTA3MDhfMTEz/MDAxNjI1NzA5NzgyNDc4.2Pp95XFSfjxjXXy8NKJa4jA8ZHlcd1YMOYRZlWeq2Uwg.nhv-XEZbVXe6YEI-mzKnlKCAfmLqSsW92eIMx_QWiCkg.JPEG/p_7feebab597534e72bbdb92a8bf35da85.jpg');"></li>
            <li style="background-color: rgb(171, 171, 161);
            			background-image: url('https://kream-phinf.pstatic.net/MjAyMTA3MDdfNTQg/MDAxNjI1NjQ4MjQ0Nzc5.5jYUsC3T1nqkc3q9exNyd-D3H6arr61PEr1BcezJ9jwg.P5925iZBQiunI9sXOZLnB6klHbvsrGO-6wD7_pwZHLYg.JPEG/p_189b53727fda47f99c3c849a8e3a25b5.jpg')"></li>
            <li style="background-color: rgb(77, 89, 81);
            			background-image: url('https://kream-phinf.pstatic.net/MjAyMTA3MDZfMTk0/MDAxNjI1NTQ5OTA0NTg1.HRKO86Oh2ew4U0ocsgpMzrWUuuwzXZeOmLE6kAeiV6Ig.-vHNuPG0wby-G2K5j-lyNCfuz9nw33rN2kRUQcoUZccg.JPEG/p_51ef0966a9724b8eaf64838dd0fba74e.jpg')"></li>
            <li style="background-color: rgb(33, 37, 52);
            			background-image: url('https://kream-phinf.pstatic.net/MjAyMTA2MjVfMTY0/MDAxNjI0NjI5ODk0Nzg4.X72dEtRlRGgu71fh4LhsNf1GV94zwyiRiNDyZSarOjUg.hip1A4iqEo0YsUwIjbgNsXHWnEgiuRKna8Ks2E_ISB8g.JPEG/d_7370a7da31ae4f258c334db27cb9e368.jpg')"></li>
            <li style="background-color: rgb(225, 218, 204);
            			background-image: url('https://kream-phinf.pstatic.net/MjAyMTAzMjlfMjIx/MDAxNjE2OTUxOTIwMTYx.k4ZkrVWpWYSBsN-j1VgtgLuGwHK8nxwJgoJcrhElp7Mg.1kpDhuH3nlfljVlQoY-jtbatWm1GHAYGU3MNMV968MYg.JPEG/d_615f49845c0341a4bcec59d2597cc412.jpg')"></li>
            <li style="background-color: rgb(249, 249, 249);
            			background-image: url('https://kream-phinf.pstatic.net/MjAyMDExMjNfMjU0/MDAxNjA2MTAxMjMwOTg2.Lru1_LSFReeOGavo_Nv5iHAHEQDrgcRVuUDO_VwQbL0g.if4WbmNvghR7rUXR_MxttP9QrAVnboaK1IAxnaF0d6kg.JPEG/p_e1a64ddc68fe4c16b7e2390ee5daa6f4.jpg')"></li>
        </ul>
	    <div class="bannerBtn">
	        <div class="prev"></div>
	        <div class="next"></div>
	    </div>
    </div>
    
    <div class="MainItem justDropped">
    	<div class="MainItemTitle">
    		<p>Just Dropped</p>
    		<p>발매 상품</p>
    	</div>
    	<div class="ItemList List1">
    	</div>
    	<div class="moreBtn">더보기</div>
    </div>
    
    <div class="imgBanner img1"></div>
    
    <div class="MainItem mostPopular">
    	<div class="MainItemTitle">
    		<p>Most Popular</p>
    		<p>인기 상품</p>
    	</div>
    	<div class="ItemList List2">
    	</div>
    </div>

	
    <script>
    	function itemList() {
    		const opt = {
    				metod: 'GET',
    		} 
    		
    		fetch('${cpath}/main/justDropped/', opt)
    		.then(resp => resp.json())
    		.then(json => {
    			const ItemList1 = document.querySelector('.List1')
    			json.forEach(e => {
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
	    			if(e.imgList != null) {
	    				thumbnail.src = e.imgList[0].img

					}
	    			else {
	    				thumbnail.style.backgroundColor = 'gray'	    				
	    			}
    				thumbWrap.appendChild(thumbnail)
    				brandWrap.classList.add('brandWrap')
	    			brand.innerText = e.brand
					brandWrap.appendChild(brand)
					brandWrap.appendChild(document.createElement('div'))
					
					prodName.innerText = e.productName
					
					// 일단은 이미지가 존재하는 상품만 출력
    				item.appendChild(thumbWrap)
    				item.appendChild(brandWrap)
    				item.appendChild(prodName)
	    			ItemList1.appendChild(item)
    			})
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
    </script>
    
    
    <script src="${cpath }/resources/js/slideBanner.js"/></script>

<%@ include file="footer.jsp" %>