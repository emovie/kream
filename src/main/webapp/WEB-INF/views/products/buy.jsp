<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<style>
	main {
		background : #FAFAFA;
	}
	a {
		color: black;
		text-decoration: none;
	}
	ul {
		margin: 0px;
		padding: 0px;
		list-style: none;
	}
	p {
		margin: 0px;
	}
	h3 {
		margin: 0px;
	}
	h4 {
		margin: 0px;
	}
	.content {
		margin: 0 auto;
	    padding: 40px 40px 160px;
	    max-width: 1280px;
	    align-items: center;
	}
	.column_area {
		display: flex;
		justify-content: space-around;
	}
	.column_box {
		width: 100%;
	    background-color: #fff;
	}
	.column_box {
	    padding: 32px;
	}
	.column {
		align-items : center;
		box-sizing: border-box;
		height: auto;
	}
	.column:nth-child(1) {
		position : sticky;
		top : 50px;
		height : 590px;
		display: flex;
		width : 500px;
		justify-content: center;
	}
	.column:nth-child(2) {
		display: flex;
		width : 596px;
		flex-flow: column;
	}
	.shadow {
		box-shadow: 0 4px 10px 0 rgb(0 0 0 / 10%);
	}
	.product {
	    background-color: rgb(235, 240, 245);
		overflow: hidden;
	    position: relative;
	    padding-top: 100%;
	    border-radius: 12px;
	}
	.product_img {
		position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%,-50%);
	    width: 81.5%;
	    height: auto;
	}
	.price_list > ul, .tab_list > ul {
		display: flex;
		align-items: center;
	}
	.price_list .title {
	    font-size: 12px;
	    letter-spacing: -.06px;
	    color: rgba(34,34,34,.5);
	}
	.price_list span {
		display: inline-block;
	    line-height: 24px;
	    vertical-align: top;
	    font-size: 16px;
	}
	.price_list > ul > .list_item:nth-child(1) {
		border-right: 1px solid #ebebeb;
	}
	.list_item {
		margin : 13px 0px 11px;
		width: 100%;
		text-align: center;
	}
	.tab_list {
		background-color: #f4f4f4;
		border-radius: 80px;
	    border: 1px solid #ebebeb;
	    margin-bottom: 30px;
	}
	.tab_list > ul {
		padding: 2px;
	}
	.tab {
		width: 50%;
		cursor: pointer;
		border-radius: 80px;
	    padding: 13px 0 11px;
	    font-size: 14px;
	    text-align : center;
	    letter-spacing: -.21px;
	}
	.price_now, .price_addition, .price_total {
		display : flex;
		justify-content: space-between;
	}
	.price_now {
		padding-bottom: 16px;
    	border-bottom: 2px solid #ebebeb;
	}
	.price_total {
		padding-top: 16px;
    	border-top: 1px solid #ebebeb;
	}
	.price_now_title, .price_total > .price_title {
		font-size: 14px;
	    letter-spacing: -.21px;
	    font-weight: 700;
	    min-width: 63px;
	}
	.price {
		margin-top: 19px;
	}
	.price > span {
		font-weight: 600;
   		letter-spacing: normal;
	}
	.price_bind {
		padding: 12px 0;
	}
	.price_addition {
	    align-items: center;
    	min-height: 26px;
    	margin-top: 5px;
	}
	.price_addition > .price_title {
		color: rgba(34,34,34,.5);
	    font-size: 14px;
	    letter-spacing: -.21px;
	}
	.price_addition > .price_text {
	    font-size: 14px;
    	letter-spacing: -.21px;
	}
	section {
		padding: 32px;
	    background-color: #fff;
	    border-top: 8px solid #f4f4f4;
	}
	.section_title {
	    padding-bottom: 16px;
	    font-size: 14px;
    	letter-spacing: -.21px;
    	font-weight: bold;
	}
	.deadline_txt {
		font-size: 15px;
	    letter-spacing: -.15px;
	}
	.deadline_tab {
		margin-top: 8px;
		display: flex;
		justify-content: space-between;
	}
	.btn {
	    display: inline-block;
	    cursor: pointer;
	    vertical-align: middle;
	    text-align: center;
	    background-color: #fff;
	    width: 100%;
	}
	.outlinegrey {
		border: 1px solid #d3d3d3;
	    color: rgba(34,34,34,.8);
	}
	.medium {
		width : 78px;
	    padding: 0 18px;
	    line-height: 40px;
	    border-radius: 12px;
	    font-size: 14px;
	    letter-spacing: -.14px;
	}
	.is_active {
	    border: 1px solid #222;
	    background-color: #fff;
	    font-weight: 700;
	    color: #222;
	}
	.settlement_account, .delivery_info {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.mark, .name {
		display: inline-block;
	    font-weight: 700;
	    vertical-align: top;
	}
	.name, .address_info {
		font-size: 15px;
    	letter-spacing: -.15px;
	}
	.mark {
	    margin-left: 4px;
	    padding: 0 6px;
	    height: 18px;
	    line-height: 18px;
	    font-size: 11px;
	    color: #fff;
	    border-radius: 10px;
	    background-color: #bbb;
	}
	.address_info, .address_box {
		padding-top: 4px;
	    font-size: 14px;
	    letter-spacing: -.21px;
	    color: rgba(34,34,34,.8);
	}
	.phone {
		padding-top: 2px;
		font-size: 14px;
		color : rgba(34,34,34,.8);
	}
	.buy_check {
		border-top: 8px solid #f4f4f4;
		width: 660px;
	}
	.confirm {
		width: 100%;
	}
	.confirm > .btn {
	    height: 60px;
	    width : 100%;
	    line-height: 60px;
	    border-radius: 0;
	    font-size: 18px;
	    letter-spacing: -.27px;
	    font-weight: 700;
	}
	.solid {
		background-color: #ebebeb;
	    color: #fff;
	    cursor: default;
	}
	.hidden {
		visibility: hidden;
	}
	.layer {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		bottom: 0;
		background-color: rgba(34,34,34,.5);
		z-index: 1010;
	}
	.modal {
		position: absolute;
		top: 50%;
		left: 50%;
		background-color: white;
		transform: translate(-50%,-50%);
		border-radius: 16px;
		width : 448px;
		box-shadow: 0 4px 10px 0 rgb(0 0 0 / 10%);
	}
	.modal_header {
		padding: 18px 50px 0;
	    min-height: 60px;
	    font-size: 18px;
	    letter-spacing: -.27px;
	    font-weight: 700;
	    text-align: center;
	}
	.btn_layer_close {
	    position: absolute;
	    top: 18px;
	    right: 20px;
	    cursor: pointer;
	}
	.account_registration {
		padding: 0 32px;
	}
	.input_box {
		position: relative;
    	padding: 10px 0 14px;
	}
	.input_title {
		font-size: 13px;
	    letter-spacing: -.07px;
	    line-height: 18px;
	}
	input, select, textarea {
		outline: 0;
	    border: 0;
	    border-radius: 0;
	    background-color: rgba(0,0,0,0);
	}
	.input_txt {
		padding: 8px 0;
	    width: 100%;
	    font-size: 15px;
	    letter-spacing: -.15px;
	    line-height: 22px;
	    border-bottom: 1px solid #ebebeb;
	}
	.input_txt:focus {
		border-bottom : 1px solid black;
	}
	.hidden {
		display: none;
	}
	.layer_btn {
		padding: 24px 32px 32px;
		display: flex;
		justify-content: center;
	}
	.delivery_tab > .tab_list {
		display: flex;
		justify-content : space-around;
		border : none;
		border-radius: 3px;
		margin : 0px;
	}
	.on {
		background-color: white;
		border-bottom-color: rgba(0,0,0,0) !important;
		color: black !important;
		font-weight: 700;
	}
	.delivery_tab > .tab_list > .item {
		padding : 11px 0 11px;
		box-sizing: border-box;
		border-top : 1px solid #ebebeb;
		border-bottom : 1px solid #ebebeb;
		width: 50%;
		text-align: center;
		font-size : 13px;
		letter-spacing: -.07px;
    	color: rgba(34,34,34,.5);
    	cursor: pointer;
	}
	.delivery_tab > .tab_list > .item:nth-child(1) {
		border-right: 1px solid #ebebeb;
	}
	.address_list {
		display: flex;
		position: relative;
    	padding: 12px 50px 12px 0;
    	border-bottom: 1px solid #ebebeb;
    	cursor: pointer;
    	justify-content: space-between;
	}
	.radio_item {
	    position: absolute;
	    top: 50%;
	    right: 4%;
	    font-size: 0;
	}
	.icon {
		width: 24px;
		height: 24px;
	}
	.delivery_input {
		padding-top: 16px;
	}
	.input_error {
		display: block;
	    position: absolute;
	    line-height: 20px;
	    font-size: 11px;
	    color: #F15746;
	}
	.price_now > .input_error {
		line-height: 150px;
	}
	.outline {
		border: 1px solid black;
	}
	.small {
		font-size : 12px;
		padding: 0 14px;
	    height: 34px;
	    line-height: 32px;
	    border-radius: 10px;
	}
	.input_item {
		position: relative;
	}
	.check_label {
		cursor: pointer;
	}
	.label_txt {
		font-size: 13px;
    	letter-spacing: -.07px;
	}
	.address_input {
		width: 85%;
	}
	.show {
		background-color: #ef6253;
		font-weight: 700;
		color: white;
	}
	.input_amount {
		font-size: 20px;
		font-weight: 600;
		max-width: 200px;
		text-align: right;
	}
	input::placeholder {
		color: #BCBCBC;
	}
	.unit, .price {
		font-size: 20px;
	}
	.hidden {
		display: none;
	}
	.accountBtnOff {
		background-color : #ebebeb;
		border: none;
	    width: 120px;
	    box-sizing: border-box;
	}
	.accountBtnOn {
		background-color: #222;
    	color: #fff;
		border : none;
		width: 120px;
		box-sizing: border-box;
		cursor: pointer;
	}
	.confirmBtnOff {
		background-color: #ebebeb;
	}
	.confirmBtnOn {
		background-color: black;
		cursor: pointer;
	}
</style>
</head>
<body>
<c:if test="${empty login}" >
	<script>location.href = '${cpath}'</script>
</c:if>

<main>
	<div class="container">
		<div class="content">
			<div class="column_area">
				<div class="column">
					<div class="column_box shadow">
						<div class="product">
							<img class="product_img" src="${product.imgList[0].img }">
						</div>
						<div class="product_info">
							<div>${product.model }</div>
							<div>${product.productName }</div>
							<div>${product.krName }</div>
							<div>${size }</div>
						</div>
					</div>
				</div>
				<div class="column">
					<div class="column_box">
						<div class="price_list">
							<ul>
								<c:forEach var="price" items="${priceList }">
									<li class="list_item">
										<p class="title">${price.key }</p>
										<span>${price.value }</span><span>원</span>								
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="instant_group">
							<div class="tab_list">
								<ul>
									<li class="tab show">구매 입찰</li>
									<li class="tab">즉시 구매</li>
								</ul>
							</div>
							<div class="price_now">
								<span class="price_now_title">구매 희망가</span>
								<span class="price">
									<input class="input_amount" type="text" placeholder="희망가 입력"><span class="unit">원</span>
								</span>
								<p class="input_error hidden">3만원 이상 입력하세요</p>
							</div>
							<div class="price_now hidden">
								<span class="price_now_title">즉시 구매가</span>
								<span class="price">
									<span class="amount">${buyPrice }</span><span class="unit">원</span>
								</span>
							</div>
							<div class="price_bind">
								<div class="price_addition">
									<span class="price_title">검수비</span>
									<span class="price_text">무료</span>
								</div>
								<div class="price_addition">
									<span class="price_title">배송비</span>
									<span class="price_text">무료 배송</span>
								</div>
							</div>
							<div class="price_total">
								<span class="price_title">총 결제금액</span>
								<span class="price">
									<span class="amount">- </span><span class="unit">원</span>
								</span>
							</div>
						</div>
					</div>
					
					<section class="column_box">
						<div class="section_title">입찰 마감기한</div>
						<div class="setion_content">
							<p class="deadline_txt">${deadlineTxt }</p>
							<div class="deadline_tab">
								<a type="button" class="btn outlinegrey medium">1일</a>
								<a type="button" class="btn outlinegrey medium">3일</a>
								<a type="button" class="btn outlinegrey medium">7일</a>
								<a type="button" class="btn outlinegrey medium is_active">30일</a>
								<a type="button" class="btn outlinegrey medium">60일</a>
							</div>
						</div>					
					</section>
					<section class="column_box">
						<div class="section_title">배송 주소</div>
						<div class="setion_content">
							<div class="delivery_info">
								<div class="address_info">
									<div class="name_box">
										<span class="name">${basicAddress.name }</span>
										<c:if test="${basicAddress.basicck eq 'y' }">
											<span class="mark">기본 배송지</span>
										</c:if>
									</div>									
									<div class="address_box">
										<span class="zipcode">${basicAddress.postcode }</span>
										<span class="address">${basicAddress.address } ${basicAddress.detail }</span>
									</div>
									<p class="phone">${basicAddress.phoneNumber}</p>
								</div>
								<button class="btn outlinegrey medium">변경</button>
							</div>
							<!-- delivery_list -->
							<div class="tab_area delivery_tab hidden">
								<ul class="tab_list">
									<li class="item on">내 주소록</li>
									<li class="item">새로 입력</li>
								</ul>
								<div class="tab_content">
									<div class="address_book">
										<div class="address_list_wrap">
											<c:forEach items="${addressList}" var="item">
												<div class="address_list">
													<div class="address_info">
														<input type="hidden" class="addressIdx" value="${item.idx }">
														<div class="name_box">
															<span class="name">${item.name }</span>
															<c:if test="${item.basicck eq 'y' }">
																<span class="mark">기본 배송지</span>
															</c:if>
														</div>
														<div class="address_box">
															<span class="zipcode">${item.postcode }</span>
															<span class="address">${item.address } ${item.detail }</span>
														</div>
														<p class="phone">${item.phoneNumber}</p>
													</div>
													<c:if test="${item.basicck eq 'y'}">
													<div class="radio_item type_check">
															<img src="https://i.ibb.co/yqLFf8K/check-mark-icon.jpg" class="icon icon_check">
													</div>
													</c:if>
													<c:if test="${item.basicck eq 'n'}">
													<div class="radio_item type_check hidden">
															<img src="https://i.ibb.co/yqLFf8K/check-mark-icon.jpg" class="icon icon_check">
													</div>
													</c:if>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="tab_content hidden">
									<div class="register_address_wrap">
										<div class="delivery_input">
											<div class="input_box">
												<h4 class="input_title">이름</h4>
												<div class="input_item">
													<input type="text" name="name" class="input_txt" placeholder="수령인의 이름">
												</div>
												<p class="input_error hidden">올바른 이름을 입력해주세요. (2 - 50자)</p>
											</div>
											<div class="input_box">
												<h4 class="input_title">휴대폰 번호</h4>
												<div class="input_item">
													<input type="text" name="phoneNumber" class="input_txt" placeholder="- 없이 입력">
												</div>
												<p class="input_error hidden">정확한 휴대폰 번호를 입력해주세요.</p>
											</div>
											<div class="input_box">
												<h4 class="input_title">우편번호</h4>
												<div class="input_item">
													<input type="text" name="postcode" class="input_txt address_input" placeholder="우편 번호를 검색하세요">
													<input type="button" class="btn outline small btn_zipcode" value="우편번호">
												</div>
											</div>
											<div class="input_box">
												<h4 class="input_title">주소</h4>
												<div class="input_item">
													<input type="text" name="address" class="input_txt" placeholder="우편 번호 검색 후, 자동 입력 됩니다">
												</div>
											</div>
											<div class="input_box">
												<h4 class="input_title">상세 주소</h4>
												<div class="input_item">
													<input type="text" name="detail" class="input_txt" placeholder="건물, 아파트, 동/호수 입력">
												</div>
											</div>
										</div>
										<div class="delivery_check">
											<div class="checkbox_item">
												<label class="check_label">
													<input type="checkbox" class="blind" name="basicck">
													<span class="label_txt">기본 배송지로 설정</span>
												</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>					
					</section>
					<div class="buy_check">
						<div class="btn confirm">
							<a type="button" disabled class="confirmBtnOff btn solid">구매 계속</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<script>
	const tab = document.querySelectorAll('.tab')
	const priceNowList = document.querySelectorAll('.price_now')
	const columnBoxList = document.querySelectorAll('.column_box')
	const inputAmount = document.querySelector('.input_amount')
	const amountList = document.querySelectorAll('.amount')
	const inputErrorList = document.querySelectorAll('.input_error')
	const priceNowTitleList = document.querySelectorAll('.price_now_title')
	const priceList = document.querySelectorAll('.price')
	
	tab.forEach( element => {
		element.addEventListener('click', tabHandler)
	})
	function tabHandler(event) {
		if('${buyPrice}' == '-' && event.target.innerText =='즉시 구매') {
			return
		}
		
		priceList[2].style.color = 'black'
		tab.forEach( element => {
			element.classList.remove('show')
		})
		event.target.classList.add('show')
		
		priceNowList.forEach( ele => ele.classList.add('hidden') )
		if(event.target.innerText == '구매 입찰') {
			inputErrorList[0].classList.add('hidden')
			priceNowTitleList[0].style.color = 'black'
			priceNowList[0].style.borderBottom = '2px solid #ebebeb'
			amountList[1].innerText = '- '
			inputAmount.value = ''
			priceNowList[0].classList.remove('hidden')
			columnBoxList[2].classList.remove('hidden')
		} else {
			priceList[2].style.color = '#ef6253'
			amountList[1].innerText = ${buyPrice}
			priceNowList[1].classList.remove('hidden')
			columnBoxList[2].classList.add('hidden')
		}
		avtiveConfirmBtn()
	}
	
	inputAmount.addEventListener('focus' , borderBottom)
	inputAmount.addEventListener('change', priceTotal)
	function borderBottom() {
		if(priceNowList[0].style.borderBottom == '2px solid rgb(241, 87, 70)') return
		priceNowList[0].style.borderBottom = '2px solid black'
	}
	function priceTotal(event) {
		if(event.target.value < 30000) {
			event.target.value = ''
			priceNowList[0].style.borderBottom = '2px solid #F15746'
			priceList[2].style.color = 'black'
			inputErrorList[0].classList.remove('hidden')
			priceNowTitleList[0].style.color = '#F15746'
			amountList[1].innerText = '- '
			avtiveConfirmBtn()
			return
		}
		
		inputErrorList[0].classList.add('hidden')
		priceNowTitleList[0].style.color = 'black'
		priceNowList[0].style.borderBottom = '2px solid #ebebeb'
		amountList[1].innerText = event.target.value
		priceList[2].style.color = '#ef6253'
		avtiveConfirmBtn()
	}


	const btnAll = document.querySelector('.deadline_tab').querySelectorAll('.btn')
	btnAll.forEach( element => {
		element.addEventListener('click',active)
	})
	
	function active(event) {
		const deadlineTxt = document.querySelector('.deadline_txt')
		btnAll.forEach(element => {
			element.classList.remove('is_active')
		})
		event.target.classList.add('is_active')
		const url = '${cpath}/deadlineBuy/' + event.target.innerText
		fetch(url,{method:'GET'}).then(resp => resp.text())
		.then( text => {
			deadlineTxt.innerText = text
		})
	}

	function check(reg, val) {
		if(reg.test(val)){
			return true
		}
		else {
			return false
		}
	}	

	
	const addressList = document.querySelectorAll('.address_list')
	const deliveryInfo = document.querySelector('.delivery_info')
	const addressBtn = document.querySelector('.delivery_info').querySelector('.btn')
	const deliveryTab = document.querySelector('.delivery_tab')
	const deliveryItem = document.querySelector('.delivery_tab').querySelectorAll('.item')
	const tabContentList = document.querySelectorAll('.tab_content')
	const radioItem = document.querySelectorAll('.radio_item')
	let addressIdx
	
	addressBtn.addEventListener('click', showDeliveryList)
	function showDeliveryList() {
		deliveryInfo.classList.add('hidden')
		deliveryTab.classList.remove('hidden')
	}
	
	deliveryItem.forEach( ele => { ele.addEventListener('click', deliveryTabContent)})
	function deliveryTabContent(event) {
		deliveryItem.forEach(ele => {ele.classList.remove('on')})
		event.target.classList.add('on')
		
		tabContentList.forEach(ele => {ele.classList.add('hidden')})
		if(event.target.innerText == '내 주소록') {
			tabContentList[0].classList.remove('hidden')	
		} else {
			tabContentList[1].classList.remove('hidden')
		}
	}

	addressList.forEach( ele => { ele.addEventListener('click', selectAddress )})
	function selectAddress(event) {
		if(event.target.classList == 'address_list') {
			radioItem.forEach(ele => {
				ele.classList.add('hidden')
			})
			event.target.querySelector('.radio_item').classList.remove('hidden')
			addressIdx = event.target.querySelector('.addressIdx').value
		}
	}
	
	const confirmBtn = document.querySelector('.confirm').querySelector('.btn')
	let tabSelect = document.querySelector('.show').innerText
	let totalPrice = document.querySelector('.price_total').querySelector('.amount').innerText
	let deadlineTxt = document.querySelector('.deadline_txt').innerText
	
	function confirmInputCheck() {
		tabSelect = document.querySelector('.show').innerText
		totalPrice = document.querySelector('.price_total').querySelector('.amount').innerText
		addressIdx = document.querySelector('.addressIdx').value
		deadlineTxt = document.querySelector('.deadline_txt').innerText
		console.log(tabSelect)
		console.log(totalPrice)
		console.log(deadlineTxt)
		
		if(tabSelect == '구매 입찰') {
			if(totalPrice != '- ' && deadlineTxt != '' && addressIdx != null) {
				return true
			}
		} else if(tabSelect == '즉시 구매') {
			if(totalPrice != '- ' && addressIdx != null) {
				return true
			}
		}
		return false
	}
	
	function avtiveConfirmBtn() {
		if(confirmInputCheck()){
			confirmBtn.disabled = false
			confirmBtn.classList.remove('confirmBtnOff')
			confirmBtn.classList.add('confirmBtnOn')
		}
		else {
			confirmBtn.disabled = true
			confirmBtn.classList.add('confirmBtnOff')
			confirmBtn.classList.remove('confirmBtnOn')
		}
	}
	
	confirmBtn.addEventListener('click', nextPage)
	function nextPage() {
		
		if(confirmInputCheck()) {
			location.href='${cpath}/buy/confirm/' + ${product.idx} + '?size=' + ${size} 
							+  '&addressIdx=' + addressIdx + '&tabSelect=' + tabSelect
							+ '&total=' + totalPrice + '&deadline=' + deadlineTxt
		} else {
			console.log('buy 실패')
		}
		
	}

</script>
</body>
</html>