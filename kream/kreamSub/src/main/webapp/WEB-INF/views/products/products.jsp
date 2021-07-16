<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="${cpath }/resources/css/products_main.css">

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
						<div class="title">구매</div>
						<div class="price">
							<div class="amount">
								<span class="num">50000</span>
								<span class="won">원</span>
							</div>
							<div class="desc">즉시 구매가</div>
						</div>
					</div>
					<div class="division_sell">
						<div class="title">판매</div>
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
			<!-- layer_container -->
			<div class="layer hidden" id="division_layer">
				<div class="layer_container">
					<div class="layer_header">
						<h2 class="title">사이즈 선택</h2>
						<div class="subtitle">즉시 구매가(원)</div>
					</div>
					<div class="layer_content">
						<ul class="select_list"></ul>
					</div>
					<a class="btn_layer_close">X</a>
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
					<div class="wrap_sales">
						<div class="tab_sales">
							<div class="tab_area">
								<ul class="tab_list">
									<li class="item"><a href="#" id="tab_1" class="item_link item_one">1개월</a></li>
									<li class="item"><a href="#" id="tab_2" class="item_link item_one">3개월</a></li>
									<li class="item"><a href="#" id="tab_3" class="item_link item_one">6개월</a></li>
									<li class="item"><a href="#" id="tab_4" class="item_link item_one">1년</a></li>
									<li class="item"><a href="#" id="tab_5" class="item_link on item_one">전체</a></li>
								</ul>
							</div>
						</div>
						<!-- 내역 O -->
						<div class="tab_content">
							<canvas id="chart" height="136" width="570"></canvas>
							<div class="table_content">
								<table>
									<thead>
									<tr>
										<th class="table_th align_left">사이즈</th>
										<th class="table_th align_rigth">거래가</th>
										<th class="table_th align_rigth">거래일</th>
									</tr>
									</thead>
									<tbody class="table chart_body"></tbody>
								</table>
								<a type="button" href="#" class="btn medium">거래 내역 더보기</a>
							</div>
						</div>
						<!-- 내역 X -->		
						<div class="tab_content hidden">
							<div class="empty_content">
								<img src="https://i.ibb.co/GRBzMvH/upArrow.png" class="empty_img">
								<div class="empty_text">체결된 거래가 아직 없습니다.</div>
							</div>
						</div>
					</div>
					<!-- login Session -->
					<div class="loginSession">
						
					</div>	
				</div>
				<div>
					<h3>입찰 내역</h3>
					<div class="tab_sales">
						<div class="tab_area">
							<ul class="tab_list">
								<li class="item"><a href="#" id="tab_sell" class="item_link item_two on">판매 입찰</a></li>
								<li class="item"><a href="#" id="tab_buy" class="item_link item_two">구매 입찰</a></li>
							</ul>
						</div>
					</div>
					<!-- 내역 O -->
					<div class="table_content">
						<table>
							<thead>
								<tr>
									<th class="table_th align_left">사이즈</th>
									<th class="table_th align_rigth">거래가</th>
									<th class="table_th align_rigth">거래일</th>
								</tr>
							</thead>
							<tbody class="table table_body"></tbody>
						</table>
						<a type="button" href="#" class="btn medium">거래 내역 더보기</a>
					</div>
					<!-- 내역 X -->		
					<div class="tab_content hidden">
						<div class="empty_content">
							<img src="https://i.ibb.co/GRBzMvH/upArrow.png" class="empty_img">
							<div class="empty_text">판매 희망가가 아직 없습니다.</div>
						</div>
					</div>
				</div>
				<!-- layer_container -->
				<div class="layer hidden" id="market_layer">
					<div class="layer_container">
						<div class="layer_header">
							<h2 class="title">시세</h2>
						</div>
					<div class="layer_content">
							<div class="layer_product"></div>
							<ul class="select_list"></ul>
						</div>
						<a class="btn_layer_close">X</a>
					</div>
				</div>
				
				<div>
					<h3>상품 정보</h3>
					<div class="detail_product_wrap">
						<div class="detail_product">
							<span class="detail_title">브랜드</span>
							<span class="detail_info">Vans</span>
						</div>
						<div class="detail_product">
							<span class="detail_title">모델번호</span>
							<span class="detail_info">VN45</span>
						</div>
						<div class="detail_product">
							<span class="detail_title">대표색상</span>
							<span class="detail_info">Black</span>
						</div>
						<div class="detail_product">
							<span class="detail_title">출시일</span>
							<span class="detail_info">21/07/10</span>
						</div>
						<div class="detail_product">
							<span class="detail_title">발매가</span>
							<span class="detail_info">110,700원</span>
						</div>
					</div>
				</div>
				<div>
					<p class="notice_product">크림(주)는 통신판매 중개자로서 통신판매의 당사자가 아닙니다. 본 상품은 개별판매자가 등록한 상품으로 상품, 상품정보, 거래에 관한 의무와 책임은 각 판매자에게 있습니다. 단, 거래과정에서 검수하고 보증하는 내용에 대한 책임은 크림(주)에 있습니다.</p>
				</div>
			</div>
		</div>
	</div>	

	<div class="process_buy_sell">
		<div>
			<h2 class="process_title">KREAM 구매 방식을 꼭 확인해주세요!</h2>
			<div><img src="https://i.ibb.co/VJJ8jsp/process-buy-sell.png"></div>
		</div>
	</div>
	
	<div class="other_products">
		<div class="other_title">
			<h3>브랜드의 다른상품</h3>
			<span>더보기 ></span>	
		</div>
		<div class="more_products_list">
			<div class="product_item">
				<div class="more_product_img"><img src="https://kream-phinf.pstatic.net/MjAyMTA0MDJfMTE2/MDAxNjE3MzU2MDgyOTQx._YYmfkMlqvAs6uE0tqFkF_rwIQYKEK4KwP188wswnh8g.B2ZCn1ZAN8h_qTlTk-7jNTB7M4yMmjh7hwFa3CO8zIIg.PNG/p_3f37ae036808499d839aa116ee22a81c.png?type=m"></div>
				<div class="product_brand"><img src="https://kream-phinf.pstatic.net/MjAyMTAzMTJfMTM5/MDAxNjE1NTE4MjM2NzA5.zSACpHizj3F43ShNk2jRb5T-heUgCIE-jRlqa2vIf7gg.NW_igMJbRCQK0-FSC20_98iw6o8-g0myWOT57hHm-Hgg.PNG/p_daf0e110ace349afb7b14b48faef2c9f.png"></div>
				<div class="product_name">Nike Dunk Low Retro Varsity Green</div>
				<div class="product_price">
					<div class="amount">
						<span class="num">269,000</span>
						<span class="won">원</span>
					</div>
					<p>즉시 구매가</p>
				</div>
			</div>
		</div>
	</div>
</main>

<!-- data -->
<script>
	const list =  {		// 임시 데이터 값
			"total" : [
				{"size":"X","date":"2021/07/05","price":"550000"},
				{"size":"L","date":"2021/07/05","price":"600000"},
				{"size":"M","date":"2021/07/06","price":"510000"},
				{"size":"M","date":"2021/07/07","price":"450000"},
				{"size":"XL","date":"2021/07/08","price":"500000"},
				{"size":"X","date":"2021/07/09","price":"620000"},
			],
			"selling" : [
				{"size":"X","date":"2021/07/05","price":"550000"},
				{"size":"L","date":"2021/07/05","price":"600000"},
				{"size":"M","date":"2021/07/06","price":"510000"},
			],
			"buying" : [
				{"size":"M","date":"2021/07/07","price":"450000"},
				{"size":"XL","date":"2021/07/08","price":"500000"},
				{"size":"X","date":"2021/07/09","price":"620000"},
			]		
	}
</script>

<!-- wish_toggle -->
<script>
	const wishIcon = document.querySelector('.icon_wish')
	wishIcon.addEventListener('click',wishToggle)
	function wishToggle(event) {
		event.target.classList.toggle('wish_on')
	}
</script>

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

<!-- chart -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script>
	const chartX = ["2021/07/05", "2021/07/06", "2021/07/07", "2021/07/08", "2021/07/09", "2021/07/10", "2021/07/11"]
	const chartY = ['612000', '613000', '550000', '600000', '605000', '430000', '690000']
	
	const canvas = document.getElementById('chart');
    const ctx = canvas.getContext('2d');
	// getContext : 드로잉에 필요한 속성과 함수를 가진 객체를 생성합니다
    const grd = ctx.createLinearGradient(0, 0, 0,140);
    grd.addColorStop(0, 'rgba(247, 181, 173, 1)');
    grd.addColorStop(1, 'rgba(247, 181, 173, 0)');
	
    var data = {
        // The type of chart we want to create
        type: 'line',
        // The data for our dataset
        data: {
            labels: chartX,
            datasets: [{
                backgroundColor: grd,
                fill:true, // line의 아래쪽을 색칠할 것인가? 
                borderColor: 'rgb(255, 99, 132)',
                lineTension:0.1, // 값을 높이면, line의 장력이 커짐.
                data: chartY

            }]
        },
        // Configuration options go here
        options: {
        	scales: {
        		display : 'right',
                xAxes: [{
                	ticks : {
                		display : false
                	},
                    gridLines: {
                        display:false,
                        drawBorder : false
                    }
                }],
                yAxes: [{
                	position : 'right',
                    gridLines: {
                        display:false,
                        drawBorder : false
                    },
					ticks: {
						beginAtZero: true,
						fontSize : 11,
						fontColor : 'rgba(34,34,34,.5)',
					}
                }]
            },
            tooltips : {
            	
            },
        	legend : 'false',
        }
    }
    var chart = new Chart(ctx, data);
</script>

<!-- table -->
<script>
	addTable(list.total,document.querySelector('.chart_body'))
	addTable(list.selling,document.querySelector('.table_body'))

	
	function addTable(list,table) {
		const length = list.length
		for(var i=0;i<4;i++) {
			const tr = document.createElement('tr')
			const size = document.createElement('td')
			const price = document.createElement('td')
			const date = document.createElement('td')
			size.innerText = (length <= i ? "-" : list[i].size)
			tr.appendChild(size)
			price.innerText = (length <= i ? "-" : list[i].price+"원")
			price.classList.add('align_rigth')
			tr.appendChild(price)
			date.innerText = (length <= i ? "-" : list[i].date )
			date.classList.add('align_rigth')
			tr.appendChild(date)
			table.appendChild(tr)
		}
	}
</script>

<!-- tab 선택 -->
<script>
	const itemOne = document.querySelectorAll('.item_one')
	itemOne.forEach( (ele) => {
		ele.addEventListener('click', tabOneHandler)
	})
	const itemTwo = document.querySelectorAll('.item_two')
	itemTwo.forEach( (ele) => {
		ele.addEventListener('click', tabTwoHandler)
	})
	
	function tabOneHandler(event) {
		event.preventDefault()
		itemOne.forEach( (ele) => {
			ele.classList.remove('on')	
		})
		event.target.classList.add('on')
	}
	
	function tabTwoHandler(event) {
		event.preventDefault()
		itemTwo.forEach( (ele) => {
			ele.classList.remove('on')	
		})
		event.target.classList.add('on')
		document.querySelector('.table_body').innerHTML = ''
		addTable((event.target.id == 'tab_sell' ? list.selling : list.buying),document.querySelector('.table_body'))
	}
</script>

<!-- layer -->
<script>
	const buyBtn = document.querySelector('.division_buy')
	const sellBtn = document.querySelector('.division_sell')
	const btn = document.querySelectorAll('.btn')
	const division = document.getElementById('division_layer')
	const market = document.getElementById('market_layer')
	
	buyBtn.addEventListener('click',openLayer)
	sellBtn.addEventListener('click',openLayer)
	btn.forEach( element => {
		element.addEventListener('click',openLayer)
	})
	
	function openLayer(event) {
		switch (event.target.className) {
		case 'division_buy' :
			division.classList.remove('hidden')				
			break;
		case 'division_sell' :
			division.classList.remove('hidden')				
			break;
		case 'btn medium':
			event.preventDefault()
			market.classList.remove('hidden')
			break;
		default:
			break;
		}
	}
	
	const closeBtn = document.querySelectorAll('.btn_layer_close')
	const layer = document.querySelectorAll('.layer')
	closeBtn.forEach( element => {
		element.addEventListener('click',closeLayer)
	})
	layer.forEach( element => {
		element.addEventListener('click',closeLayer)
	})
	
	
	function closeLayer(event) {
		if(event.target.className == 'btn_layer_close') {
			return event.target.parentNode.parentNode.classList.add('hidden')
		} else {
			return event.target.classList.add('hidden')
		}
	}
</script>

<%@ include file="../footer2.jsp" %>