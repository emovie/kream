<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		height: 950px;
	}
	.column:nth-child(1) {
		position : sticky;
		top : 100px;
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
		font-size: 24px;
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
	}
	.outlinegrey {
		border: 1px solid #d3d3d3;
	    color: rgba(34,34,34,.8);
	}
	.medium {
		width : 78px;
	    padding: 0 18px;
	    height: 42px;
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
		width: 100%;
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
	.layer_btn > button {
		background-color: #222;
    	color: #fff;
		border : none;
		width: 120px;
		box-sizing: border-box;
	}
</style>
</head>
<body>

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
									<li class="tab">
										<a href="#" class="item_link">판매 입찰</a>
									</li>
									<li class="tab">
										<a href="#" class="item_link">즉시 판매</a>
									</li>
								</ul>
							</div>
							<div class="price_now">
								<span class="price_now_title">즉시 판매가</span>
								<span class="price">
									<span class="amount">${sellPrice }</span><span class="unit">원</span>
								</span>
							</div>
							<div class="price_bind">
								<div class="price_addition">
									<span class="price_title">검수비</span>
									<span class="price_text">무료</span>
								</div>
								<div class="price_addition">
									<span class="price_title">판매 수수료</span>
									<span class="price_text">무료 이벤트</span>
								</div>
								<div class="price_addition">
									<span class="price_title">배송비</span>
									<span class="price_text">판매자 부담</span>
								</div>
							</div>
							<div class="price_total">
								<span class="price_title">총 정산금액</span>
								<span class="price">
									<span class="amount">${sellPrice }</span><span class="unit">원</span>
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
						<div class="section_title">판매 정산 계좌</div>
						<div class="setion_content">
							<div class="settlement_account">
								<div class="account_box">
									<span class="acc_bank">국민은행</span>
									<span class="acc_number">************000</span>								
								</div>
								<button class="btn outlinegrey medium">변경</button>
							</div>
						</div>					
					</section>
					<section class="column_box">
						<div class="section_title">반송 주소</div>
						<div class="setion_content">
							<div class="delivery_info">
								<div class="address_info">
									<div class="name_box">
										<span class="name">00</span><span class="mark">기본 배송지</span>
									</div>									
									<div class="address_box">
										<span class="zipcode">(06313)</span>
										<span class="address">서울 강남구 양재대로 333(개포동)</span>
									</div>
									<p class="phone">010-****-1111</p>
								</div>
								<button class="btn outlinegrey medium">변경</button>
							</div>
							<!-- delivery_list -->
							<div class="tab_area delivery_tab">
								<ul class="tab_list"></ul>
								<div class="tab_content"></div>
								<div class="tab_content">
									<div class="register_address_wrap">
										<div class="delivery_input">
											<div class="input_box">
												<h4 class="input_title">이름</h4>
												<div class="input_item">
													<input class="input_txt" placeholder="수령인의 이름">
												</div>
												<p class="input_error">올바른 이름을 입력해주세요. (2 - 50자)</p>
											</div>
											<div class="input_box">
												<h4 class="input_title">휴대폰 번호</h4>
												<div class="input_item">
													<input class="input_txt" placeholder="- 없이 입력">
												</div>
												<p class="input_error">정확한 휴대폰 번호를 입력해주세요.</p>
											</div>
											<div class="input_box">
												<h4 class="input_title">우편번호</h4>
												<div class="input_item">
													<input class="input_txt" placeholder="우편 번호를 검색하세요">
													<a type="button" class="btn outline small btn_zipcode">우편번호</a>
												</div>
												<p class="input_error"></p>
											</div>
											<div class="input_box">
												<h4 class="input_title">주소</h4>
												<div class="input_item">
													<input class="input_txt" placeholder="우편 번호 검색 후, 자동 입력 됩니다">
												</div>
												<p class="input_error"></p>
											</div>
											<div class="input_box">
												<h4 class="input_title">상세 주소</h4>
												<div class="input_item">
													<input class="input_txt" placeholder="건물, 아파트, 동/호수 입력">
												</div>
												<p class="input_error"></p>
											</div>
										</div>
										<div class="delivery_check">
											<div class="checkbox_item">
												<label class="check_label">
													<input type="checkbox" class="blind">
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
							<a type="button" class="btn solid">판매 입찰 계속</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- modal -->
	<div class="layer hidden">
		<div class="modal account">
			<div class="modal_header title">정산 계좌 변경</div>
			<div class="modal_content">
				<div class="account_registration">
					<div class="input_box">
						<h3 class="input_title">은행명</h3>
						<div class="input_item">
							<select class="input_txt">
								<option>은행을 선택하세요</option>
								<option value="국민은행">국민은행</option>
								<option value="신한은행">신한은행</option>
								<option value="우리은행">우리은행</option>
								<option value="하나은행">하나은행</option>
								<option value="기업은행">기업은행</option>
								<option value="농협은행">농협은행</option>
								<option value="SC은행">SC은행</option>
								<option value="한국씨티은행">한국씨티은행</option>
								<option value="우체국">우체국</option>
								<option value="산업은행">산업은행</option>
								<option value="부산은행">부산은행</option>
								<option value="카카오뱅크">카카오뱅크</option>
								<option value="대구은행">대구은행</option>
							</select>
						</div>
					</div>
					<div class="input_box">
						<h3 class="input_title">계좌번호</h3>
						<div class="input_item">
							<input type="text" placeholder="- 없이 입력하세요" class="input_txt" id="modal_accNum">
						</div>
						<p class="input_error hidden">올바른 계좌번호를 입력해주세요</p>
					</div>
					<div class="input_box">
						<h3 class="input_title">예금주</h3>
						<div class="input_item">
							<input type="text" placeholder="예금주명을 정확히 입력하세요" class="input_txt" id="modal_accName">
						</div>
						<p class="input_error hidden">올바른 이름을 입력해주세요. (2-50자)</p>
					</div>
				</div>
				<div class="layer_btn">
					<button disabled="disabled" class="btn solid medium">저장하기</button>
				</div>
			</div>
			<div class="btn_layer_close">X</div>		
		</div>
	</div>
</main>

<!-- DeadLine -->
<script>
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
		const url = '${cpath}/deadline/' + event.target.innerText
		fetch(url,{method:'GET'}).then(resp => resp.text())
		.then( text => {
			deadlineTxt.innerText = text
		})
	}
</script>

<!-- account -->
<script>
	const accountBtn = document.querySelector('.settlement_account').querySelector('.btn')
	accountBtn.addEventListener('click' , accountModal)
	
// 	layer open
	function accountModal(event) {
		document.querySelector('.layer').classList.remove('hidden')
		document.querySelector('.account').classList.remove('hidden')
	}
	
// 	layer close
	const layer = document.querySelector('.layer')
	const btnLayerClose = document.querySelector('.btn_layer_close')
	btnLayerClose.addEventListener('click', accountCloseModal)
	
	function accountCloseModal(event) {
		console.log(event.target)
		layer.classList.add('hidden')
	}
	
// 	accountBank select
	const bankList = document.querySelector('select.input_txt')
	let accBank
	bankList.addEventListener('change', accountBankSelect)
	
	function accountBankSelect(event) {
		accBank = event.target.value
	}
	
// 	accountNumber check
	const bankNum = document.getElementById('modal_accNum')
	let accNum
	bankNum.addEventListener('change', accountNumberCheck)
	
	function accountNumberCheck(event) {
		accNum = event.target.value
	}
	
// accountName check
	const bankName = document.getElementById('modal_accName')
	let accName
	bankName.addEventListener('change', accountNumberCheck)
	
	function accountNameCheck(event) {
		accName = event.target.value
	}
	
	const layerInputText = layer.querySelectorAll('.input_txt')
	const layerBtn = document.querySelector('.layer_btn').querySelector('button')
	layerBtn.addEventListener('click', accountSave)
	layerInputText.forEach( element => {
		element.addEventListener('change', btnDisabled)
	})
	
// 	disabled
	function btnDisabled() {
		if(accBank != null && accNum != null && accName != null) {
			layerBtn.disabled = true
		} else {
			layerBtn.disabled = false
		}
	}
	
// 	account save
	
	function accountSave(event) {
		console.log(accBank)
		console.log(accNum)
		console.log(accName)
	}
</script>


</body>
</html>