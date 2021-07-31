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
	}
	.price_total > .price_title {
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
	section:nth-child(1) {
		border-top : none;
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
		border : none;
		height : 60px;
		width : 532px;
	    display: inline-block;
	    cursor: default;
	    font-weight : 700;
	    vertical-align: middle;
	    text-align: center;
	    font-size: 18px;
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
	    border : none;
	}
	.solid {
		background-color: #ebebeb;
	    color: #fff;
	    cursor: default;
	}
	.hidden {
		display: none;
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
	.unit, .price {
		font-size: 20px;
	}
	.hidden {
		display: none;
	}
	.model_title {
		padding-top : 4px;
	    font-size: 16px;
	    font-weight: 500;
	}
	.model_number, .size_txt {
	   	font-size: 14px;
	   	font-weight: bold;
	   	line-height: 20px;
	   	vertical-align: top;
	}
	.model_ko {
		font-size: 14px;
	    color: rgba(34,34,34,.5);
	}
	.section_title {
	    line-height: 22px;
	    font-size: 18px;
	    font-weight: bold;
	}
	.price_bind {
		padding-top: 10px;
		padding: 12px 0;
    	font-size: 15px;
	}
	.item_bind {
		display: flex;
		justify-content: space-between;
    	font-size: 14px;
    	margin-top: 8px;
	}
	.bind_title {
		color: rgba(34,34,34,.5);
	}
	.is_dark {
		color: black;
	}
	.price_total > .price {
		color: #31b46e;
	}
	.price_bind:nth-child(1) {
		border-top : 1px solid #ebebeb;
	}
	.price_total {
		padding-top: 0;
	    border-top: 0;
	    padding-bottom: 19px;
	    border-bottom: 2px solid #ebebeb;
	}
	.postItem {
		padding-top: 18px;
	}
	.company {
	    font-size: 15px;
	    line-height: 22px;
	    font-weight: 600;
	    letter-spacing: -.15px
	}
	.sub_text {
	    padding-top: 1px;
	    font-size: 13px;
	    letter-spacing: -.07px;
	    color: rgba(34,34,34,.5);
	}
	.regist_link {
		width : 550px;
		align-items: center;
	    padding: 0 12px;
	    height: 62px;
	    background-color: #fafafa;
	    border: 1px solid #ebebeb;
	    border-radius: 10px;
	    font-size: 14px;
	    color: rgba(34,34,34,.5);
	    cursor: pointer;
	}
	.desc_txt {
		font-size: 13px;
		color: rgba(34,34,34,.5);	
	}
	.check_item:first-child {
		border-top : none;
	}
	.check_item {
		display: flex;
		justify-content: space-between;
		padding: 16px 0;
		border-top: 1px solid #ebebeb;
		cursor: pointer;
	}
	.checkbox {
		width: 24px;
		height: 24px;
	}
	.notice_main {
		font-size: 16px;
	}
	.notice_sub {
		font-size: 14px;
		color: rgba(34,34,34,.5);
	}
	.last_notice_main {
		font-size: 16px;
		font-weight: bold;
	}
	.confirmBtnOff {
		background-color: #ebebeb;
	}
	.confirmBtnOn {
		background-color: black;
		cursor: pointer;
	}
	.topBorder {
		border-top: none;
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
							<div class="model_number">${product.model }</div>
							<div class="model_title">${product.productName }</div>
							<div class="model_ko">${product.krName }</div>
							<div class="size_txt">${selling.pSize }</div>
						</div>
					</div>
				</div>
				<div class="column">
					<div class="column_box">
					
						<section>
							<h3 class="section_title">최종 주문정보</h3>
							<div class="section_content">
								<div class="price_total">
									<span class="price_title">총 정산금액</span>
									<span class="price">
										<span class="amount">${selling.price }</span>
										<span class="unit">원</span>
									</span>
								</div>
								<div class="price_bind">
									<div class="item_bind">
										<span class="bind_title is_dark">판매 희망가</span>
										<span class="bind_text">${sellPrice }원</span>
									</div>
									<div class="item_bind">
										<span class="bind_title">검수비</span>
										<span class="bind_text">무료</span>
									</div>
									<div class="item_bind">
										<span class="bind_title">판매 수수료</span>
										<span class="bind_text">무료 이벤트</span>
									</div>
									<div class="item_bind">
										<span class="bind_title">배송비</span>
										<span class="bind_text">선불・판매자 부담</span>
									</div>
								</div>
								<c:if test="${not empty selling.countDate }">
								<div>
									<div class="price_bind item_bind">
										<span class="bind_title is_dark">입찰 마감 기한</span>
										<span class="bind_text">${selling.countDate }</span>
									</div>
								</div>
								</c:if>
							</div>
						</section>
					
<!-- 						<section> -->
<!-- 							<h3 class="section_title">판매 정산 계좌</h3> -->
<!-- 							<div class="section_content"> -->
<%-- 								<p><span>${member.accountBank}</span><span>${member.accountNumber}</span></p> --%>
<%-- 								<p>예금주 <span>${member.accountName}</span></p> --%>
<!-- 							</div> -->
<!-- 						</section> -->
						
						<section>
							<div class="postItem">
								<h3 class="section_title">반송 주소</h3>
								<div class="section_content">
									<div class="address_info">
										<div class="name_box">
											<span class="name">${address.name }</span>
											<c:if test="${address.basicck eq 'y' }">
												<span class="mark">기본 배송지</span>
											</c:if>
										</div>									
										<div class="address_box">
											<span class="zipcode">${address.postcode }</span>
											<span class="address">${address.address } ${address.detail }</span>
										</div>
										<p class="phone">${address.phoneNumber}</p>
									</div>
								</div>
							</div>
							<div class="postItem">
								<h3 class="section_title">발송 방법</h3>
								<div class="section_content post_content">
									<div class="info_text">
										<p class="company">선불 택배 발송</p>
										<p class="sub_text">착불 발송 시 정산 금액에서 차감됩니다</p>
									</div>
								</div>
							</div>
						</section>
						
						<section>
							<h3 class="section_title">패널티 결제 방법</h3>
							<div class="section_content">
								<h4>간편 결제</h4>
								<button class="regist_link">카드를 등록해주세요 ></button>
								<p class="desc_txt">- 페널티는 일시불만 지원하며, 카드사 홈페이지나 앱에서 분할납부로 변경 가능합니다. 단, 카드사별 정책에 따라 분할 납부 변경 시 수수료가 발생할 수 있습니다.</p>
								<p class="desc_txt">- 수수료(페널티, 착불배송비 등)가 정산되지 않을 경우, 별도 고시 없이 해당 금액을 결제 시도 할 수 있습니다.</p>
							</div>
						</section>
					
						<section>
							<a class="check_item">
								<div class="notice">
									<p class="notice_main">거래가 체결되면 일요일 · 공휴일을 제외하고 48시간 내에 KREAM으로 발송을 완료한 후, 발송 정보를 정확히 입력해야 합니다.</p>
									<p class="notice_sub">거래가 체결되면 일요일 · 공휴일을 제외하고 48시간 내에 KREAM으로 발송을 완료한 후, 발송 정보를 정확히 입력해야 합니다.</p>
								</div>
								<img src="https://i.imgur.com/7iDP3GS.png" class="checkbox">
							</a>
							<a class="check_item">
								<div class="notice">
									<p class="notice_main">송장 번호 미기재·오입력 시 입고가 진행되지 않으며, 발송 후 5일(일요일·공휴일 제외) 내 미도착은 허위 정보 입력으로 간주하여 미입고 페널티를 부과합니다.</p>
								</div>
								<img src="https://i.imgur.com/7iDP3GS.png" class="checkbox">
							</a>
							<a class="check_item">
								<div class="notice">
									<p class="notice_main">검수 기준과 페널티 및 이용 정책을 다시 한번 확인하였습니다.</p>
									<p class="notice_sub">이용정책 위반 시, 판매 금액의 최대 15.0%의 페널티가 부과됩니다. 페널티 회피 시 이후 거래가 제한되며 별도 고지없이 해당 금액을 결제 시도할 수 있습니다.</p>
								</div>
								<img src="https://i.imgur.com/7iDP3GS.png" class="checkbox">
							</a>
							<a class="check_item">
								<div class="notice">
									<p class="notice_main">‘바로 판매하기’ 를 선택하시면 즉시 거래가 체결되며, 단순 변심이나 실수에 의한 취소가 불가능합니다.</p>
								</div>
								<img src="https://i.imgur.com/7iDP3GS.png" class="checkbox">
							</a>
							<a class="check_item">
								<div class="notice">
									<p class="notice_main last_notice_main">판매 조건을 모두 확인하였으며, 거래 진행에 동의합니다.</p>
								</div>
								<img src="https://i.imgur.com/7iDP3GS.png" class="checkbox">
							</a>
						</section>
						
						<section class="topBorder">
							<div class="price_total">
								<span class="price_title">총 정산금액</span>
								<span class="price">
									<span class="amount">${selling.price}</span>
									<span class="unit">원</span>
								</span>
							</div>
						</section>						
						
						<section class="confirm topBorder">
						<form method="POST" action="${cpath }/products/sellThx" onsubmit="return submitCheck();">
							<input type="hidden" type="number" name="memberIdx" value="${login.idx }">
							<input type="hidden" type="number" name="productIdx" value="${product.idx }">
							<input type="hidden" type="number" name="addressIdx" value="${address.idx }">
							<input type="hidden" type="number" name="price" value="${selling.price }">
							<input type="hidden" type="text" name="pSize" value="${selling.pSize }">
							<input type="hidden" type="text" name="startDate" value="${selling.startDate }">
							<input type="hidden" type="text" name="endDate" value="${selling.endDate }">
							<input type="hidden" type="text" name="countDate" value="${selling.countDate }">
							<input type="hidden" type="text" name="step" value="${selling.step }">
							<button type="submit" class="confirmBtnOff btn solid">판매</button>
						</form>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<script>
	const checkBoxList = document.querySelectorAll('.check_item')
	const btn = document.querySelector('.btn')
	checkBoxList.forEach(ele => ele.addEventListener('click', boxClick))
	
	function boxClick(event) {
		let wrap
		let img
		if(event.target.classList.contains('check_item')) {
			wrap = event.target
			img = event.target.querySelector('.checkbox')
		} else if(event.target.classList.contains('notice') || event.target.classList.contains('checkbox')) {
			wrap = event.target.parentNode
			img = wrap.querySelector('.checkbox')
		} else if(event.target.classList.contains('notice_main') || event.target.classList.contains('notice_sub')) {
			wrap = event.target.parentNode.parentNode
			img = wrap.querySelector('.checkbox')
		}

		if(!wrap.classList.contains('on')) {
			img.src = 'https://imgur.com/6gofHuf.png'
			wrap.classList.add('on')
		} else {
			img.src = 'https://i.imgur.com/7iDP3GS.png'
			wrap.classList.remove('on')
		}
		
		activeBtn()
	}
	
	function boxOnCheck() {
		let cnt = 0
		checkBoxList.forEach( ele => {
			if(ele.classList.contains('on')) {
				cnt++
			}
		})
		if(cnt == 5) {
			return true
		} else {
			return false
		}
	}
	
	function activeBtn() {
		if(boxOnCheck()) {
			btn.classList.add('confirmBtnOn')
			btn.classList.remove('confirmBtnOff')
		} else {
			btn.classList.remove('confirmBtnOn')
			btn.classList.add('confirmBtnOff')
		}
	}
	
	function submitCheck(){
		if(!btn.classList.contains('confirmBtnOn')) {
			alert('판매 조건을 확인해주세요 !')
			return false
		}
	}
</script>

</body>
</html>