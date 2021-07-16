<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KREAM | 한정판 거래의 FLEX</title>
<style>
	body {
		margin: 0;
	}
	a {
		text-decoration: none;
		color: black;
	}
	
	/* column_top */
	.top_wrap {
		padding : 40px;
		display: flex;
		margin-right: 119px;
		margin-left: 119px;
	}
	.column_right {
		width: 570px;
		margin-left: 60px;
	}
	.img_list {
		background-color: rgb(246, 238, 236);
		width: 570px;
		height: 570px;
	}
	.banner_method {
		border : 2px solid black;
		padding: 0;
		margin-top: 24px;
	}
	.banner_method > a {
		padding: 18px;
		display: flex;
	}
	.banner_link p {
		margin: 0;
		padding-left: 15px;
	}
	.method_text {
		font-size: 13px;
	    letter-spacing: -.07px;
	    color: rgba(34,34,34,.5);
	}
	.detail_main {
		display: flex;
		justify-content: space-between;
		margin-bottom: 40px;
	}
	.title_en {
		margin : 0px;
		font-size: 24px;
	    letter-spacing: -.12px;
	    font-weight: 700;
	}
	.title_kr {
		margin-top: 4px;
	    font-size: 16px;
	    letter-spacing: -.16px;
	    color: rgba(34,34,34,.5);
	}
	.icon_wish {
		margin-top: 20px;
		cursor: pointer;
	}
	.detail_size, .detail_price {
		display: flex;
		justify-content: space-between;
	}
	.detail_size {
		padding-bottom: 11px;
		border-bottom: 1px solid #dadada;
	}
	.detail_price {
		margin-top: 12px;
	}
	.title_txt {
		padding-top: 3px;
	    display: inline-block;
	    font-size: 13px;
	    letter-spacing: -.07px;
	    color: rgba(34,34,34,.8);
	}
	.fluctuation {
		margin: 0;
		font-size: 13px;
		float: right;
	}
	.num, .won {
		font-weight : 700;
   		letter-spacing: -.1px;
	}
	.amount > .num .won {
		fonst-size : 15px;
	}
	.title_price {
		font-size: 20px;
	}
	.division_btn_box {
		display: flex;
		justify-content: space-between;
		margin-top : 20px;
		padding-bottom: 60px;
	}
	.division_buy, .division_sell {
		width : 250px;
		height : 60px;
		position: relative;
	    display: flex;
	    flex: 1;
	    align-items: center;
	    border-radius: 12px;
	    color: #fff;
	}
	.division_buy {
		background-color: #ef6253;
	}
	.division_sell {
		background-color: #41b979;
	}
	.division_buy:before, .division_sell:before {
		content: "";
	    position: absolute;
	    top: 0;
	    bottom: 0;
	    left: 55px;
	    width: 1px;
	    background-color: rgba(34,34,34,.1);
	    box-sizing: border-box;
	}
	.division_buy > .title, .division_sell > .title {
		width: 55px;
		text-align: center;
		font-size: 18px;
	}
	.price {
		margin-left: 10px;
	}
	.desc {
		display: block;
	    font-size: 11px;
	    font-weight: 600;
	    color: hsla(0,0%,100%,.8);
	}
	
	/* confirm */
	.dropdown_list {
		list-style: none;
		padding: 0px;
	}
	.dropdown_head {
		display : flex;
		padding : 18px 0px 17px;
		justify-content: space-between;
		border-bottom: 1px solid #ebebeb;
		cursor: pointer;
	}
	.title {
		max-width: 320px;
	    font-size: 14px;
	    letter-spacing: -.21px;
	}
	.icon_dropdown {
		color: #bebebe;
		font-size: 20px;
		margin-right: 10px;
	}
	.dropdown_content {
		border-bottom: 1px solid #ebebeb;
		display: none;
	}
	.dropdown_content > p {
		font-size: 13px;
	    letter-spacing: -.07px;
	}
	.dropdown_content > p:first-child, .bold {
		font-weight: bold;
	}
	.dropdown_content > ul {
		font-size : 12px;
		list-style: none;
		padding: 0px;
		margin-bottom: 13px;
	}
	.txt_link {
		text-decoration: underline;
	}
	.open_title {
		border-bottom : 1px solid black;
	}
	.open_content {
		display: block;
	}

	/* 	체결, 입찰, 상품정보 */
	.tab_list {
		list-style: none;
		display: flex;
		padding: 0px;
		background-color: #f4f4f4;
		border-radius: 10px;
	}
	.item {
		width: 106px;
		height : 24px;
		text-align: center;
		line-height: 25px;
	}
	.item_link {
		width: 100px;
	}
</style>
</head>
<body>

<header>

</header>

<main>
	<div class="top_wrap">
	
		<div class="column_left">
			<div class="product_img">
					<img class="img_list" src="https://kream-phinf.pstatic.net/MjAyMTA3MDVfMjU3/MDAxNjI1NDgyNDYyNDYy.wS5EBEhpA4e2UKsEt0s9xKwfD8nClnXxPsEdV9AnNcEg.UZ6aWpIOSU5h6FQLBdnXK_mcCUcl87WhniIyMbRg6ysg.PNG/p_8fc6cd12df46482299d2a40764d5d09a.png?type=l">
			</div>
			<div class="banner_method">
				<a class="banner_link" href="">
					<span><img src="https://kream.co.kr/_nuxt/img/detail_banner_method.af8accb.png" width="46px" height="43px"></span>
					<span>
						<p>KREAM 구매방법</p>
						<p class="method_text">구매 프로세스를 확인 후 구매해주세요.</p>
					</span>
				</a>
			</div>
		</div>
		
		<div class="column_right">
			<!-- right 제품 -->
			<div class="column_top">
				<div class="detail_main">
					<span class="title">
						<h2 class="title_en">Product Name ENG</h2>
						<p class="title_kr">상품 이름 한글</p>
					</span>
					<span class="wish">
						<img class="icon_wish" src="https://i.ibb.co/T2pr057/mark.png" width="22px" height="20px">
					</span>
				</div>
				<div class="detail_size">
					<span class="title_txt">사이즈</span>
					<a class="btn_size">
						<span>모든 사이즈</span>
						<span></span>
					</a>
				</div>
				<div class="detail_price">
					<span class="title_txt">최근 거래가</span>
					<span class="price">
						<div class="title_price">
							<span class="num">189,000</span>
							<span class="won">원</span>
						</div>
						<div>
							<p class="fluctuation">0원 (0%)</p>
						</div>
					</span>
				</div>
				<div class="division_btn_box">
					<div class="division_buy">
						<strong class="title">구매</strong>
						<div class="price">
							<div class="amount">
								<span class="num">50000</span>
								<span class="won">원</span>
							</div>
							<div class="desc">즉시 구매가</div>
						</div>
					</div>
					<div class="division_sell">
						<strong class="title">판매</strong>
						<div class="price">
							<div class="amount">
								<span class="num">40000</span>
								<span class="won">원</span>
							</div>
							<div class="desc">즉시 판매가</div>
						</div>
					</div>					
				</div>
			</div>
			
			<!-- right 구매 전 공지 -->
			<div class="confirm">
				<h3>구매 전 꼭 확인해주세요!</h3>
				<div class="confirm_content">
					<ol class="dropdown_list">
						<li class="dropdown">
							<div class="dropdown_head">
								<span class="title">배송 기간 안내</span>
								<span class="icon_dropdown">∨</span>
							</div>
							<div class="dropdown_content">
								<p>KREAM은 최대한 빠르게 모든 상품을 배송하기 위해 노력하고 있습니다. 배송 시간은 판매자가 검수를 위하여 상품을 검수센터로 보내는 속도에 따라 차이가 있습니다.</p>
								
								<p>- 거래가 체결된 시점부터 48시간(일요일•공휴일 제외) 내에 판매자가 상품을 발송해야 하며, 통상적으로 발송 후 1-2일 내에 KREAM 검수센터에 도착합니다.</p>
								
								<p>- 검수센터에 도착한 상품은 입고 완료 후 3영업일 이내에 검수를 진행합니다. 검수 합격시 배송을 준비합니다.<br>
								* 상품 종류 및 상태에 따라 검수 소요 시간은 상이할 수 있으며, 구매의사 확인에 해당할 경우 구매자와 상담 진행으로 인해 지연이 발생할 수 있습니다.</p>
								
								<p>- 검수센터 출고는 매 영업일에 진행하고 있으며, 출고 마감시간은 오후 5시입니다. 출고 마감시간 이후 검수 완료건은 운송장번호는 입력되지만 다음 영업일에 출고됩니다.</p>
							</div>
						</li>
						<li class="dropdown">
							<div class="dropdown_head">
								<span class="title">검수 안내</span>
								<span class="icon_dropdown">∨</span>
							</div>
							<div class="dropdown_content">
								<p>판매자의 상품이 검수센터에 도착하면 전담 검수팀이 철저한 분석과 검사로 정가품 확인을 진행합니다.</p>
								<p>- 검수센터에서는 정가품 여부를 확인하기 위하여, 지속적으로 데이터를 쌓고 분석하여 기록하고 있습니다.</p>
								
								<p>- 업계 전문가로 구성된 검수팀은 박스와 상품의 라벨에서 바느질, 접착, 소재 등 모든 것을 검수합니다.</p>
								
								<p><span class="bold">검수 결과는 불합격•검수 보류•합격의 세가지 상태로 결과가 변경됩니다.</span><a href="#" class="txt_link">검수기준 보기</a></p>
								<ul>
									<li>* 검수 합격: KREAM 검수택(Tag)이 부착되어 배송을 준비함</li>
									<li>* 검수 보류: 앱에서 사진으로 상품의 상태 확인 및 구매 여부를 선택. (24시간 이후 자동 검수 합격)</li>
									<li>* 검수 불합격: 즉시 거래가 취소되고 구매하신 금액을 환불 처리함.(환불 수단은 결제 수단과 동일)</li>
								</ul>
							</div>
						</li>
						<li class="dropdown">
							<div class="dropdown_head">
								<span class="title">구매 환불/취소/교환 안내</span>
								<span class="icon_dropdown">∨</span>
							</div>
							<div class="dropdown_content">
								<p>KREAM은 익명 거래를 기반으로 판매자가 판매하는 상품을 구매자가 실시간으로 구매하여 거래를 체결합니다.</p>
								<p>- 단순 변심이나 실수에 의한 취소/교환/반품이 불가능합니다. 상품을 원하지 않으시는 경우 언제든지 KREAM에서 재판매를 하실 수 있습니다.</p>
								
								<p>- 상품 수령 후, 이상이 있는 경우 KREAM 고객센터로 문의해주시기 바랍니다.</p>
							</div>
						</li>
					</ol>
				</div>
			</div>
			
			<!-- 체결, 입찰, 상품정보 -->
			<div class="detail_wrap">
				<div>
					<h3>체결 거래</h3>
					<div class="tab_sales">
						<div class="tab_area">
							<ul class="tab_list">
								<li class="item"><a href="#" class="item_link">1개월</a></li>
								<li class="item"><a href="#" class="item_link">3개월</a></li>
								<li class="item"><a href="#" class="item_link">6개월</a></li>
								<li class="item"><a href="#" class="item_link">1년</a></li>
								<li class="item"><a href="#" class="item_link">전체</a></li>
							</ul>
						</div>
						<div class="table_wrap">
						
						</div>
					</div>
				</div>
				<div></div>
				<div></div>
			</div>
			
		</div>
	</div>	
</main>

<!-- confirm -->
<script>
	const dropheadList = document.querySelectorAll('.dropdown_head')
	const dropcontentList = document.querySelectorAll('.dropdown_content')
	dropheadList.forEach(function(dropdownHead,index) {
		dropdownHead.onclick = function() {
			const dropdownContent = dropcontentList[index]
			if(dropdownHead.classList.contains('open_title') == false) {
				dropdownHead.classList.add('open_title')
				dropdownContent.classList.add('open_content')
			} else {
				dropdownHead.classList.remove('open_title')
				dropdownContent.classList.remove('open_content')
			}
		}
	})
</script>

</body>
</html>