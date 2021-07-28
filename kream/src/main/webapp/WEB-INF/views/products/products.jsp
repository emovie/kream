<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KREAM</title>
	<link rel="stylesheet" href="${cpath }/resources/css/style.css?ver=1">
	<style>
		body {
			margin: 0;
			background-color: white;
		}
		a {
			text-decoration: none;
			color: black;
		}
		ul {
			list-style: none;
		}
		.hidden {
			visibility: hidden;
		}
		.title {
			max-width: 320px;
		    font-size: 14px;
		}
		main {
			width : 100%;
			display: flex;
			flex-flow : column;
			align-items: center;
		}
		
		/* login check */
		.login_check, .login_check2 {
			background-color: rgba(255,255,255,0.7);
			width : 100%;
			height : 435px;
			position: absolute;
			align-items: center;
			display: flex;
			justify-content: center;
			z-index: 1;
		}
		.login_check2 {
			height: 289px;
		}
		.login_check > div, .login_check2 > div {
			width: 315px;
			height: 145px;
			background-color: white;
			border: 1px solid #d3d3d3;
			box-sizing: border-box;
			text-align: center;
		}
		.layer_login {
			letter-spacing : -.14px;
			font-size: 14px;
			padding-top: 20px;
		}
		.layer_login_btn {
			display : inline-block;
			line-height : 40px;
			height : 40px;
			padding : 0 18px;
			border-radius : 12px;
			background-color: black;
			color: white;
		}
		
		/* column_top */
 		.img_list {
			position : absolute; 
			background-color: rgb(246, 238, 236); 
			width: 570px; 
			height: 570px;
		}
		.img_box {
			display: flex;
		}
		.slide_box {
			position : absolute;
			z-index: 99;
			display: flex;
			justify-content: space-between;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			padding-top : 50%;
		}
		.slide {
			color: #dad8d8;
			font-size : 30px;
			height : 44px;
			width : 44px;
			text-align: center;
			z-index : 2;
			cursor: pointer;			
		}
		.slide_on {
			z-index : 1;
		}
		.top_wrap {
			width : 1200px;
			padding : 40px;
			display: flex;
		}
		.column_left {
			position: sticky;
	 		top: 40px;
	 		height: 700px;
		}
		.column_right {
			position : relative;
			width: 570px;
			margin: 60px;
		}
		.product_img {
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
			width : 500px;
			margin : 0px;
			font-size: 24px;
		    letter-spacing: -.12px;
		    font-weight: 700;
		}
		.title_kr {
			all : initial;
			margin-top: 4px;
		    font-size: 16px;
		    letter-spacing: -.16px;
		    color: rgba(34,34,34,.5);
		}
		.icon_wish {
			margin-top: 20px;
			cursor: pointer;
		}
		.wish_on {
			background-color: gray;
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
			width : 280px;
			height : 60px;
			position: relative;
		    display: flex;
		    align-items: center;
		    border-radius: 12px;
		    color: #fff;
		    cursor: pointer;
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
			color : white;
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
		
		.layer {
			position: fixed;
		    top: 0;
		    left: 0;
		    right: 0;
		    bottom: 0;
		    background-color: rgba(34,34,34,.5);
		    z-index: 1010;
		}
		.layer_header {
			display : flex;
			flex-flow : column;
			justify-content: center;
		}
		.layer_header > .title {
			all : unset;
			padding: 18px 50px 0;
		    font-size: 18px;
		    letter-spacing: -.27px;
		    font-weight: 700;
		    text-align: center;
		    margin : 0px;
		}
		.layer_header > .subtitle {
		    font-size: 13px;
		    letter-spacing: -.07px;
		    font-weight: 400;
		    color: rgba(34,34,34,.5);
		    text-align: center;
		}
		.layer_container {
		    position: absolute;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%,-50%);
		    background-color: #fff;
		    width : 480px;
		    height : 530px;
		    border-radius: 16px;
		    box-shadow: 0 4px 10px 0 rgb(0 0 0 / 10%);
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
		.dropdown_head > .title {
			all : initial;
			font-weight: 300;
			font-size: 14px;
		}
		.icon_dropdown {
			color: #bebebe;
			font-size: 20px;
			margin-right: 10px;
		}
		.dropdown_content {
			border-bottom: 1px solid #ebebeb;
			display: none;
			color : rgba(34,34,34,.8);
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
		.detail_wrap h3{
			margin: 0px;
			padding: 60px 0px 20px 0px;
		}
		.tab_list {
			width : 570px;
			list-style: none;
			height : 35px;
			display: flex;
			padding: 0px;
			margin : 0px;
			background-color: #f4f4f4;
			border-radius: 7px;
			justify-content: space-between;
			align-items: center;
		}
		.item {
			width: 100%;
			height : 24px;
			text-align: center;
		}
		.item_link {
				height : 16px;
			    display: block;
			    padding: 4px 0px;
			    margin : 0px 5px;
			    font-size: 12px;
			    letter-spacing: -.06px;
			    text-align: center;
			    background-color: #f4f4f4;
			    color: rgba(34,34,34,.8);
		}
		.graph {
			height: 156px;
			padding-top: 20px;
		}
		table {
			width: 570px;
			height: 136px;
			padding: 20px 0px; 
		}
		.table_th {
			padding-bottom: 8px;
		    border-bottom: 1px solid #ebebeb;
		    font-size: 14px;
		    letter-spacing: -.21px;
		    color: rgba(34,34,34,.8);
		    font-weight: 400;
		}
		table td {
			padding-top: 12px;
	   		font-size: 14px;
	   		font-weight : 500px;
	   		font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,"나눔고딕","Segoe UI",Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
	    	color: #222;
		}
		.align_right {
			text-align: right;
		}
		.align_left {
			text-align: left;
		}
		.btn {
			box-sizing : border-box;
			display : inline-block;
			border : 1px solid #d3d3d3;
		    cursor: pointer;
		    vertical-align: middle;
		    text-align: center;
		    width: 100%;
		}
		.medium {
			width : 100%;
		    height: 42px;
		    line-height: 40px;
		    border-radius: 12px;
		    font-size: 14px;
		    letter-spacing: -.14px;
		}
		.on {
			background: white;
			font-weight: 700;
			border-radius: 7px;
		}
		.empty_content {
			margin-top : 30px;
			margin-bottom : 100px;
			text-align: center;
		}
		.empty_img {
		 	width : 58px;
		 	height : 58px;
		 	opacity: 0.7;
		 	border-bottom: 1px solid #dadada;
		}
		.empty_text {
			color: #dadada;
			margin-top: 8px;
		    font-size: 13px;
		    letter-spacing: -.07px;
		    color: rgba(34,34,34,.3);
		}
		.detail_product_wrap {
			border-top : 1px solid #dadada;
		}
		.detail_product {
			display : flex;
			justify-content: space-between;
			padding-top: 8px;
		}
		.detail_title {
		    font-size: 14px;
		    letter-spacing: -.21px;
		    color: rgba(34,34,34,.5);
		}
		.detail_info {
			font-size: 14px;
			font-weight: 500;
		}
		.notice_product {
		    margin: 60px 0 40px;
		    padding-top: 16px;
		    line-height: 16px;
		    border-top: 1px solid #ebebeb;
		    font-size: 12px;
		    letter-spacing: -.06px;
		    color: rgba(34,34,34,.5);
		}
		.process_buy_sell {
			display : flex;
			flex-flow : column;
			width: 100%;
			background-color: #fafafa;
			text-align: center;
			padding: 50px 0px;
		}
		.process_title {
			font-size: 28px;
		    font-weight: 700;
		    line-height: 36px;
		    letter-spacing: -.42px;
		    vertical-align: middle;
		}
		.process_buy_sell img {
			width: 1000px;
			height: 340px;
		}
		
		/* 다른상품 */
		.other_products {
			margin: 0 auto;
		    padding-bottom: 40px;
		    max-width: 1280px;
		}
		.other_title {
			margin-top : 100px;
			display: flex;
			justify-content: space-between;
		}
		.other_title >  h3 {
			font-weight: 700;
			font-size: 20px;
		}
		.other_title > span {
			line-height: 20px;
		    font-size: 13px;
		    display : flex;
		    align-items :center;
		    color: rgba(34,34,34,.5);
		}
		.product_item {
			width: 224px;
			padding: 0 10px;
		}
		.more_products_list {
			display: flex;
			justify-content: space-between;
		}
		.more_product_img {
			background-color: #ebf0f4;
			border-radius : 10px;
			width: 224px;
			text-align: center;
		}
		.more_product_img > img {
			width: 200px;
			height: 200px;
		}
		.product_brand > img {
			width: auto;
		    height: 20px;
		    padding-top: 12px;
		}
		.product_name {
			height: 40px;
	    	margin-bottom: 3px;
	    	font-size: 13px;
		}
		.amount {
			font-size: 15px;
		}
		.product_price > won {
			display: inline-block;
		    vertical-align: top;
		    line-height: 20px;
		    font-size: 15px;
		    letter-spacing: -.04px;
		}
		.product_price > p {
			margin: 0;
			font-size: 11px;
			color: rgba(34,34,34,.5);
		}
		
		/* 시세 Layer */
		.layer_header {
			align-items: center;
		}
		.layer_img_small {
			width: 80px;
			height: 80px;
			background-color: #EBF0F5;
			border-radius: 15px;
		}
		.layer_header_product {
			display: flex;
			width: 416px;
			height: 93px;
		}
		.layer_header_info {
			display: flex;
			flex-flow: column;
			margin-left: 8px;
			justify-content: center;
		}
		.layer_header_info > p {
			margin : 0;
		}
		.layer_krName {
			line-height: 16px;
    		font-size: 14px;
    		padding-top: 2px;
    		color: rgba(34,34,34,.5);
		}
		.select_size_btn {
			width : 120px;
			margin-top: 5px;
			padding: 0 6px 0 12px;
		    height: 40px;
		    border: 1px solid #ebebeb;
		}
		.select_size_btn:focus {
			outline: none;
		}
		.small_tab {
			all : unset;
			width: 416px;
			list-style: none;
		    height: 35px;
		    display: flex;
		    padding: 0px;
		    background-color: #f4f4f4;
		    border-radius: 7px;
		    justify-content: space-between;
		    align-items: center;
			margin: 0 32px 12px;
		}
		.layer_product {
			display: flex;
			justify-content: center;
		}
		.layer_product > ul {
			margin : 0px;
			padding : 0px;
			padding-bottom : 8px;
			width : 416px;
			border-bottom : 1px solid #ebebeb;
			display: flex;
			justify-content: space-between;
		}
		.layer_product > ul > li {
			width: 124.8px;
		}
		.layer_product > ul > li > a {
			font-size: 13px;
		    letter-spacing: -.07px;
		    color: rgba(34,34,34,.8);
		}
		.btn_layer_close {
			position: absolute;
		    top: 18px;
		    right: 20px;
		    cursor: pointer;
		}
		.btn_size {
			cursor : pointer;
		}
		.layer_size_box {
			list-style: none;
			padding: 6px 28px 0;
		    margin-bottom: 28px;
		    overflow-x: hidden;
		    overflow-y: auto;
		    max-height: 454px;
		    font-size: 0;
		}
		.layer_size_content {
		    margin: 4px;
		    display: inline-block;
		    padding-top : 7px;
		    width: 125px;
		    border: 1px solid #d3d3d3;
		    height: 46px;
		    border-radius: 12px;
		    background-color: #fff;
		    text-align: center;
		    cursor: pointer;
		}
		.layer_size_content > .layer_size_size {
			display : block;
			font-size: 14px;
    		font-weight: 600;
		}
		.layer_size_content > .layer_size_price {
			font-size : 12px;
		}
		span[class="item_link2"] {
			font-size: 13px;
		    letter-spacing: -.07px;
		    color: rgba(34,34,34,.8);
		}
		.size_border {
			border : 1px solid black;
		}
/* 		좋아요 */
		#layer_wish > div  {
			width: 440px;
		}
		#layer_wish > h2 {
		    padding: 18px 50px 0;
		    min-height: 60px;
		    font-size: 18px;
		    letter-spacing: -.27px;
		    font-weight: 700;
		    color: #000;
		    text-align: center;
		}
		.suggest_list {
			padding: 0 32px;
		}
		.suggest_item {
			border-bottom: 1px solid #ebebeb;
		}
		.suggest_link {
			display : flex;
			align-items: center;
    		height: 100%;
		}
		.suggest_info > p {
			margin: 0;
		}
		.thumb_img {
			width: 70px;
			height: 70px;
			margin-right: 7px;
		}
		.model_title {
			font-size: 15px;
		}
		.model_sub_info {
			line-height: 16px;
   	 		font-size: 11px;
   	 		color: rgba(34,34,34,.5);
   	 		margin-top: 2px;
		}
		.interest_list {
		    overflow-x: hidden;
		    overflow-y: auto;
		    padding: 8px 0 0 28px;
		    height: 288px;
		}
		.interest_box {
			width: 184px;
			float: left;
		    display: table;
		    margin: 4px;
		    height: 52px;
		}
		.btn_interest {
			display: table-cell;
		    line-height: normal;
		    border: 1px solid #d3d3d3;
		    border-radius: 12px;
		    background-color: #fff;
		    color: rgba(34,34,34,.8);
		    padding: 0 18px;
    		height: 42px;
    		font-size: 14px;
    		cursor: pointer;
    		vertical-align: middle;
    		text-align: center;
		}
		.btn_interest > p {
			margin : 0px;
		}
		.info_txt {
			font-size: 14px;
			color: black;
		}
		.layer_btn {
			padding: 24px 32px 32px;
		    display: flex;
		    justify-content: center;
		}
		.interest_icon {
			width: 16px;
			height: 16px;
		}
		.interest_close {
			width: 120px;
			border : 1px solid black;
			display: inline-block;
		    cursor: pointer;
		    vertical-align: middle;
		    text-align: center;
		    background-color: #fff;
		    padding: 0 18px;
		    height: 42px;
		    line-height: 40px;
		    border-radius: 12px;
		    font-size: 14px;
		}
		#chart {
			padding-top : 10px;
		}
/* 		modal list */
		.layer_content_body {
			overflow-y: auto;
		    overflow-x: hidden;
		    max-height: 270px;
		    display: flex;
		    flex-flow: column;
		    align-items: center;
		}
		.content_body {
			margin: 0px;
		    padding: 0px;
		    padding-bottom: 8px;
		    width: 416px;
		    display: flex;
		    justify-content: space-between;
		}
		.body_data {
			flex-basis: 30%;
	    	font-size: 14px;
		}
		.is_active {
			font-weight: 700;
		}
	</style>
</head>
<body>
    <header>
        <div class="top">
            <nav>
                <a href="#">고객센터</a>
                <a href="#">관심상품</a>
                <a href="#">마이페이지</a>
                <a href="${cpath }/member/${not empty login ? 'logout' : 'login'}">
					${not empty login ? '로그아웃' : '로그인'}
				</a>
                <!-- 로그인 세션 있을 경우 로그아웃으로 텍스트 변경 (로그인 기능 구현 후 작성必) -->
            </nav>
        </div>
        <div>
            <h1><a href="${cpath }">KREAM</a></h1>
            <nav>
                <a href="#">STYLE</a>
                <a href="${cpath }/search">SHOP</a>
                <a href="#">ABOUT</a>
                <div class="searchBtn"></div>
            </nav>
        </div>
    </header>
    <div class="guard"></div>
    <div class="searchWrap hidden">
        <div class="searchContainer">
            <div class="searchArea">
                <div></div>
                <form id="searchForm" method="POST" action="${cpath }/search">
	                <input id="inputSearch" type="text" name="keyword" placeholder="브랜드명, 모델명, 모델번호 등">
                </form>
                <div class="clearBtn hidden">×</div>
            </div>
            <button class="cancelBtn">취소</button>
        </div>
        <div class="recommendItem">
            <div onclick="location.href ='${cpath}/search?keyword=Jordan'"><div></div><p>Jordan 1</p></div>
            <div onclick="location.href ='${cpath}/search?keyword=지갑'"><div></div><p>지갑</p></div>
            <div onclick="location.href ='${cpath}/search?keyword=Dunk'"><div></div><p>Dunk</p></div>
            <div onclick="location.href ='${cpath}/search?keyword=Helinox'"><div></div><p>Helinox</p></div>
            <div onclick="location.href ='${cpath}/search?keyword=메종 키츠네'"><div></div><p>메종키츠네</p></div>
            <div onclick="location.href ='${cpath}/search?keyword=사카이'"><div></div><p>사카이</p></div>
        </div>
        
        <div class="searchResult hidden"></div>
        
    </div>
    <div class="overlay hidden"></div>
    
	<script src="${cpath }/resources/js/search.js?ver=2"/></script>

<main>
	<div class="top_wrap">
		<div class="column_left">
			<div class="product_img">
				<div class="slide_box">
					<div class="slide preBtn"><</div>
					<div class="slide nextBtn">></div>
				</div>
				<div class="img_box">
					<c:if test="${not empty product.imgList }">
						<c:forEach items="${product.imgList }" var="image" varStatus="vs">
							<img class="img_list" src="${image.img }" id="${vs.index}">
						</c:forEach>
					</c:if>
				</div>
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
						<h2 class="title_en">${product.productName }</h2>
						<p class="title_kr">${product.krName }</p>
					</span>
					<span class="wish">
						<img class="icon_wish" src="https://i.ibb.co/T2pr057/mark.png" width="22px" height="20px">
					</span>
				</div>
				<div class="detail_size">
					<span class="title_txt">사이즈</span>
					<a href="#" class="btn_size">모든 사이즈 ▽</a>
				</div>
				<div class="detail_price">
					<span class="title_txt">최근 거래가</span>
					<span class="price">
						<div class="title_price">
							<span class="num">${conclusionPrice }</span><span class="won">원</span>
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
								<span class="num buy_num">${buyPrice}</span>
								<span class="won">원</span>
							</div>
							<div class="desc">즉시 구매가</div>
						</div>
					</div>
					<div class="division_sell">
						<div class="title">판매</div>
						<div class="price">
							<div class="amount">
								<span class="num sell_num">${sellPrice}</span>
								<span class="won">원</span>
							</div>
							<div class="desc">즉시 판매가</div>
						</div>
					</div>					
				</div>
			</div>
			<!-- modal_sizs -->
			<div class="layer hidden" id="division_layer_buy">
				<div class="layer_container">
					<div class="layer_header">
						<h2 class="title">사이즈 선택</h2>
						<div class="subtitle">즉시 구매가(원)</div>
					</div>
					<div class="layer_content">
						<ul class="layer_size_box">
							<c:forEach var="size" items="${buySizeList }">
								<li class="layer_size_content">
									<span id="${size.key }" class="layer_size_size size_${size.key}">${size.key }</span>
									<span class="layer_size_price">${size.value }</span>
								</li>
							</c:forEach>
						</ul>
					</div>
					<a class="btn_layer_close">X</a>
				</div>
			</div>
			<div class="layer hidden" id="division_layer_sell">
				<div class="layer_container">
					<div class="layer_header">
						<h2 class="title">사이즈 선택</h2>
						<div class="subtitle">즉시 판매가(원)</div>
					</div>
					<div class="layer_content">
						<ul class="layer_size_box">
							<c:forEach var="size" items="${sellSizeList }">
								<li class="layer_size_content">
									<span id="${size.key }" class="layer_size_size size_${size.key}">${size.key }</span>
									<span class="layer_size_price">${size.value }</span>
								</li>
							</c:forEach>
						</ul>
					</div>
					<a class="btn_layer_close">X</a>
				</div>
			</div>
			<!-- modal_wish -->
			<div id="layer_wish" class="layer hidden">
				<div class="layer_container">
					<div class="layer_header">
						<h2 class="title">관심 상품 추가</h2>
					</div>
					<div class="layer_content">
						<div class="suggest_list">
							<div class="suggest_item">
								<span class="suggest_link">
									<div class="suggest_thumb">
										<img src="${product.imgList[0].img}" class="thumb_img">
									</div>
									<div class="suggest_info">
										<p class="model_title">${product.productName }</p>
										<p class="model_sub_info">${product.krName }</p>
									</div>
								</span>
							</div>
						</div>
						<div class="interest_list">
							<c:forEach items="${categorySize}" var="size">
								<div class="interest_box">
									<a class="btn_interest">
										<p class="info_txt">${size }</p>
										<img class="interest_icon interest_${size}" src="https://i.ibb.co/T2pr057/mark.png">
									</a>
								</div>
							</c:forEach>
						</div>
						<div class="layer_btn">
							<a class="interest_close">확인</a>
						</div>
					</div>
				</div>
			</div>
			
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
				<h3>체결 거래</h3>
				<div>
					<div class="login_check">
						<div class="layer_login_div">
							<p class="layer_login">모든 체결 거래는<br>로그인 후 확인 가능합니다.</p>
							<div><a href="${cpath }/member/login" class="layer_login_btn">로그인</a></div>
						</div>
					</div>
					<div class="wrap_sales">
						<div class="tab_sales">
							<div class="tab_area">
								<ul class="tab_list">
									<li class="item"><a href="#" id="chart1m" class="item_link item_one">1개월</a></li>
									<li class="item"><a href="#" id="chart3m" class="item_link item_one">3개월</a></li>
									<li class="item"><a href="#" id="chart6m" class="item_link item_one">6개월</a></li>
									<li class="item"><a href="#" id="chart1Y" class="item_link item_one">1년</a></li>
									<li class="item"><a href="#" id="chartAll" class="item_link on item_one">전체</a></li>
								</ul>
							</div>
						</div>
						<div class="tab_content">
							<div class="chart_div">
								<canvas id="chart" height="136" width="570"></canvas>
							</div>
							<!-- 내역 X -->
							<c:if test="${empty conclusionList}">
								<div class="tab_content empty_conclusion">
									<div class="empty_content">
										<img src="https://i.ibb.co/GRBzMvH/upArrow.png" class="empty_img">
										<div class="empty_text">체결된 거래가 아직 없습니다.</div>
									</div>
								</div>
							</c:if>
							<!-- 내역 O -->
							<c:if test="${not empty conclusionList}">
								<div class="tab_content empty_conclusion hidden">
									<div class="empty_content">
										<img src="https://i.ibb.co/GRBzMvH/upArrow.png" class="empty_img">
										<div class="empty_text">체결된 거래가 아직 없습니다.</div>
									</div>
								</div>
								<div class="table_content content_conclusion">
									<table>
										<thead>
											<tr>
												<th class="table_th align_left">사이즈</th>
												<th class="table_th align_right">거래가</th>
												<th class="table_th align_right">거래일</th>
											</tr>
										</thead>
										<tbody class="table chart_body">
<!-- 										size 선택 시 내역 출력 -->
											<c:forEach items="${conclusionList}" var="conclusion" begin="0" end="3" step="1">
												<tr>
													<td class="align_left">${conclusion.pSize }</td>
													<td class="align_right">${conclusion.price }원</td>
													<td class="align_right">${conclusion.endDate }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<a type="button" href="#" class="btn medium more_all">거래 내역 더보기</a>
								</div>
							</c:if>
						</div>
					</div>
				</div>
					
				<div>
					<h3>입찰 내역</h3>
						<div>
							<div class="login_check2">
								<div class="layer_login_div">
									<p class="layer_login">모든 체결 거래는<br>로그인 후 확인 가능합니다.</p>
									<div><a href="${cpath }/member/login" class="layer_login_btn">로그인</a></div>
								</div>
							</div>
							
							<div class="tab_sales">
								<div class="tab_area">
									<ul class="tab_list">
										<li class="item"><a href="#" id="tab_sell" class="item_link item_two on">판매 입찰</a></li>
										<li class="item"><a href="#" id="tab_buy" class="item_link item_two">구매 입찰</a></li>
									</ul>
								</div>
							</div>
							
							<div>
								<!-- sell -->
								<div class="div_sell">
									<c:if test="${not empty sellList }">
										<div class="table_content">
											<table>
												<thead>
													<tr>
														<th class="table_th align_left">사이즈</th>
														<th class="table_th align_right">거래가</th>
														<th class="table_th align_right">수량</th>
													</tr>
												</thead>
												<tbody class="table table_sell">
													<c:forEach items="${sellList }" var="sell" begin="0" end="3" step="1">
														<tr>
															<td class="align_left">${sell.pSize }</td>
															<td class="align_right">${sell.price }원</td>
															<td class="align_right">${sell.cnt }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<a type="button" href="#" class="btn medium" id="">거래 내역 더보기</a>
										</div>
										<div class="tab_content table_empty hidden">
											<div class="empty_content">
												<img src="https://i.ibb.co/GRBzMvH/upArrow.png" class="empty_img">
												<div class="empty_text">판매 희망가가 아직 없습니다.</div>
											</div>
										</div>
									</c:if>
									<c:if test="${empty sellList}">		
										<div class="tab_content table_empty">
											<div class="empty_content">
												<img src="https://i.ibb.co/GRBzMvH/upArrow.png" class="empty_img">
												<div class="empty_text">판매 희망가가 아직 없습니다.</div>
											</div>
										</div>
									</c:if>
								</div>
								<!-- buy -->
								<div class="div_buy hidden">
									<c:if test="${not empty buyList }">
										<div class="table_content">
											<table>
												<thead>
													<tr>
														<th class="table_th align_left">사이즈</th>
														<th class="table_th align_right">거래가</th>
														<th class="table_th align_right">수량</th>
													</tr>
												</thead>
													<tbody class="table table_buy">
														<c:forEach items="${buyList }" var="buy" begin="0" end="3" step="1">
															<tr>
																<td class="align_left">${buy.pSize }</td>
																<td class="align_right">${buy.price }원</td>
																<td class="align_right">${buy.cnt }</td>
															</tr>
														</c:forEach>
													</tbody>
											</table>
											<a type="button" href="#" class="btn medium" id="">거래 내역 더보기</a>
										</div>
										<div class="tab_content table_empty hidden">
											<div class="empty_content">
												<img src="https://i.ibb.co/GRBzMvH/upArrow.png" class="empty_img">
												<div class="empty_text">구매 희망가가 아직 없습니다.</div>
											</div>
										</div>
									</c:if>
									<c:if test="${empty buyList}">		
										<div class="tab_content table_empty">
											<div class="empty_content">
												<img src="https://i.ibb.co/GRBzMvH/upArrow.png" class="empty_img">
												<div class="empty_text">구매 희망가가 아직 없습니다.</div>
											</div>
										</div>
									</c:if>
								</div>
							</div>
						</div>
				<!-- layer_container -->
				<div class="layer hidden" id="market_layer">
					<div class="layer_container">
						<div class="layer_header">
							<h2 class="title">시세</h2>
							<div class="layer_header_product">
								<div><img src="${product.imgList[0].img }" class="layer_img_small"></div>
								<div class="layer_header_info">
									<p>${product.productName }</p>
									<p class="layer_krName">${product.krName }</p>
<!-- 									<select name="size" class="select_size_btn"> -->
<!-- 										<option class="modal_size modal_size_all">모든 사이즈</option> -->
<%-- 										<c:forEach items="${categorySize }" var="size"> --%>
<%-- 											<option class="modal_size modal_size_${size }">${size}</option> --%>
<%-- 										</c:forEach> --%>
<!-- 									</select> -->
								</div>
							</div>
						</div>
						<div class="layer_content">
							<div class="tab_sales">
								<div class="tab_area">
									<ul class="tab_list small_tab">							
										<li class="item"><a href="#" id="tab_all" class="item_link item_th on">최근 거래</a></li>
										<li class="item"><a href="#" id="tab_sell" class="item_link modal_tab_sell item_th">판매 입찰</a></li>
										<li class="item"><a href="#" id="tab_buy" class="item_link modal_tab_buy item_th">구매 입찰</a></li>
									</ul>
								</div>
							</div>
							
							<div class="layer_content_tab panel0">
								<div class="empty_content">
									<img src="https://i.ibb.co/GRBzMvH/upArrow.png" class="empty_img">
									<div class="empty_text">내역이 아직 없습니다.</div>
								</div>
							</div>

							<div class="layer_content_tab panel1">
								<div class="layer_product">
									<ul>
										<li><a href="#" id="size" class="item_link2 a_panel1">사이즈 </a></li>
										<li class="align_right"><a href="#" id="price" class="item_link2 a_panel1">거래가</a></li>
										<li class="align_right"><a href="#" id="date" class="item_link2 a_panel1">거래일</a></li>
									</ul>
								</div>
								<div class="layer_content_body layer_body_conclusion">
									<c:forEach items="${conclusionList }" var="conclusion">
										<ul class="content_body">
											<li class="body_data">${conclusion.pSize}</li>
											<li class="body_data align_right">${conclusion.price}</li>
											<li class="body_data align_right is_active">${conclusion.endDate}</li>
										</ul>
									</c:forEach>
								</div>
							</div>
							
							<div class="layer_content_tab panel2">
								<div class="layer_product">
									<ul>
										<li><a href="#" id="size" class="item_link2 a_panel2">사이즈</a></li>
										<li class="align_right"><a href="#" id="price" class="item_link2 a_panel2">판매 희망가</a></li>
										<li class="align_right"><span id="date" class="item_link2">수량</span></li>
									</ul>
								</div>
								<div class="layer_content_body">
									<c:forEach items="${sellList }" var="sell">
										<ul class="content_body">
											<li class="body_data">${sell.pSize}</li>
											<li class="body_data align_right is_active">${sell.price}</li>
											<li class="body_data align_right">${sell.cnt}</li>
										</ul>
									</c:forEach>
								</div>
							</div>
							<div class="layer_content_tab panel3">
								<div class="layer_product">
									<ul>
										<li><a href="#" id="size" class="item_link2 a_panel3">사이즈</a></li>
										<li class="align_right"><a href="#" id="price" class="item_link2 a_panel3">구매 희망가</a></li>
										<li class="align_right"><span id="date" class="item_link2">수량</span></li>
									</ul>
								</div>
								<div class="layer_content_body">
									<c:forEach items="${buyList }" var="buy">
										<ul class="content_body">
											<li class="body_data">${buy.pSize}</li>
											<li class="body_data align_right is_active">${buy.price}</li>
											<li class="body_data align_right">${buy.cnt}</li>
										</ul>
									</c:forEach>
								</div>
							</div>
						</div>
						<a class="btn_layer_close">X</a>
					</div>
				</div>
				
				<div>
					<h3>상품 정보</h3>
					<div class="detail_product_wrap">
						<div class="detail_product">
							<span class="detail_title">브랜드</span>
							<span class="detail_info">${product.brand }</span>
						</div>
						<div class="detail_product">
							<span class="detail_title">모델번호</span>
							<span class="detail_info">${product.model }</span>
						</div>
						<div class="detail_product">
							<span class="detail_title">대표색상</span>
							<span class="detail_info">${product.color }</span>
						</div>
						<div class="detail_product">
							<span class="detail_title">출시일</span>
							<span class="detail_info">${product.rdate }</span>
						</div>
						<div class="detail_product">
							<span class="detail_title">발매가</span>
							<span class="detail_info">${product.price }</span>
						</div>
					</div>
				</div>
				<div>
					<p class="notice_product">크림(주)는 통신판매 중개자로서 통신판매의 당사자가 아닙니다. 본 상품은 개별판매자가 등록한 상품으로 상품, 상품정보, 거래에 관한 의무와 책임은 각 판매자에게 있습니다. 단, 거래과정에서 검수하고 보증하는 내용에 대한 책임은 크림(주)에 있습니다.</p>
				</div>
			</div>
		</div>
		</div>
	</div> <!-- top_wrap -->	

	<div class="process_buy_sell">
		<div>
			<h2 class="process_title">KREAM 구매 방식을 꼭 확인해주세요!</h2>
			<div><img src="https://i.ibb.co/VJJ8jsp/process-buy-sell.png"></div>
		</div>
	</div>
	
	<div class="other_products">
		<div class="other_title">
			<h3>${product.brand }의 다른상품</h3>
			<span><a href="${cpath}/search">더보기 ></a></span>	
		</div>
		<div class="more_products_list">
			<c:forEach items="${moreProduct}" var="moreDto">
				<a href="${cpath }/products/${moreDto.idx}">
					<div class="product_item">
						<div class="more_product_img"><img src="${moreDto.imgList[0].img}"></div>
						<div class="product_brand"><img src="https://kream-phinf.pstatic.net/MjAyMTAzMTJfMTM5/MDAxNjE1NTE4MjM2NzA5.zSACpHizj3F43ShNk2jRb5T-heUgCIE-jRlqa2vIf7gg.NW_igMJbRCQK0-FSC20_98iw6o8-g0myWOT57hHm-Hgg.PNG/p_daf0e110ace349afb7b14b48faef2c9f.png"></div>
						<div class="product_name">${moreDto.productName }</div>
						<div class="product_price">
							<div class="amount">
								<span class="num">${moreDto.price }</span>
								<span class="won">원</span>
							</div>
							<p>즉시 구매가</p>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
</main>

<!-- imgSlider -->
<script>
	const slide = document.querySelectorAll('.slide')
	const imgList = document.querySelectorAll('.img_list')
	const imgBox = document.querySelector('.img_box')
	const imgLastIndex = imgBox.lastChild.previousSibling.id
	slide.forEach( element => {
		element.addEventListener('click',slideMove)
	})
	
	imgSlideCheck()
	function imgSlideCheck() {
		if(imgLastIndex == 0) {
			slide.forEach( element => {
				element.classList.add('hidden')
			})	
		} else if (imgLastIndex == null) {
			element.classList.add('hidden')
			const img = document.createElement('img')
			img.classList.add('img_list')
			img.src = 'https://kream.co.kr/images/common_thumbs_blank_L.png?type=l'
			imgBox.appendChild(img)
		} else {
			slide.forEach( element => {
				element.classList.remove('hidden')
			})	
			slideOnOff('0')
		}
	}
	
	function slideMove(event) {
		let imgIndex = Number(document.querySelector('.slide_on').id)
		if(event.target.classList.contains('preBtn')) {
			imgIndex = ( imgIndex-1 < 0 ? imgLastIndex : imgIndex-1)
		} else if(event.target.classList.contains('nextBtn')) {
			imgIndex = ( imgIndex+1 > imgLastIndex ? 0 : imgIndex+1)
		}
		slideOnOff(imgIndex)
	}
	
	function slideOnOff(imgIndex) {
		imgList.forEach( element => {
			if(element.id == imgIndex) {
				element.classList.add('slide_on')
			} else {
				element.classList.remove('slide_on')
			}
		})
	}
</script>

<!-- loginCheck -->
<script>
	const loginIdx = '${login.idx}'
	const loginEmail = '${login.email}'
	const loginCheck = document.querySelector('.login_check')
	const loginCheck2 = document.querySelector('.login_check2')
	console.log()
	
	
	if(loginEmail == '') {
		// 로그인이 없을 시 layer가 나타남
		loginCheck.classList.remove('hidden')
		loginCheck2.classList.remove('hidden')
	} else {
		// 로그인이 있다면 layer hidden
		loginCheck.classList.add('hidden')
		loginCheck2.classList.add('hidden')
	}
	
	function loginPage() {
		// 로그인이 없다면 로그인 페이지로 이동
		if(loginEmail == '') {
			location.replace('${cpath}/member/login')
		}
	}
</script>

<!-- wish -->
<script>
	const wishIcon = document.querySelector('.icon_wish')
	const wishBtn = document.querySelector('.interest_close')
	const btnInterest = document.querySelectorAll('.btn_interest')
	wishIcon.addEventListener('click',wishModal)
	wishBtn.addEventListener('click', wishModalClose)
	btnInterest.forEach( element => {
		element.addEventListener('click', wishSelect)
	})
	
	wishCheck()
	function wishCheck() {
		// 로그인이 있다면 fetch 실행 후 wish가 있는 지 확인
		if(loginEmail != '') {
			const url = '${cpath}/sizeWishList/' + ${product.idx}
			const opt = {
					method : 'GET'
			}
			fetch(url,opt)
			.then(resp => resp.json())
			.then( json => {
				if(json[0] == null) {
					wishIcon.src = "https://i.ibb.co/T2pr057/mark.png"
				} else {
					wishIcon.src = "https://i.ibb.co/ckMWtxK/mark.png"
				}
			})
		}
	}
	
	function wishModal(event) {
		// 로그인이 없다면 로그인페이지로 이동
		if(loginEmail == '') {
			location.href = '${cpath}/member/login'
		} else {
			document.getElementById('layer_wish').classList.remove('hidden')
			const url = '${cpath}/sizeWishList/' + ${product.idx}
			const opt = {
					method : 'GET'
			}
			fetch(url,opt)
			.then(resp => resp.json())
			.then(json => {
				const icon = document.querySelectorAll('.interest_icon')
				icon.forEach( element => {				
					for(dto in json) {
						const size = 'interest_' + json[dto]
						if(element.classList.contains(size)) {
							element.src = "https://i.ibb.co/ckMWtxK/mark.png";
							element.parentNode.classList.add('onWish')
						}
					}
				})
			})
		}
	}
	
	function wishSelect(event) {
		var url
		var wrap
		if(event.target.classList.contains('btn_interest')) {
			wrap = event.target
		} else if(event.target.classList.contains('info_txt')) {
			wrap = event.target.parentNode
		} else if(event.target.classList.contains('interest_icon')) {
			wrap = event.target.parentNode
		}
		const wishSize = wrap.querySelector('.info_txt').innerText
		const wishImg = wrap.querySelector('.interest_icon')
		
		if(wrap.classList.contains('onWish')) {
			url = '${cpath}/sizeWishOff/' + ${product.idx} + '/' + wishSize
			wishImg.src = "https://i.ibb.co/T2pr057/mark.png"
			wrap.classList.remove('onWish')
		} else {
			url = '${cpath}/sizeWishOn/' + ${product.idx} + '/' + wishSize
			wishImg.src = "https://i.ibb.co/ckMWtxK/mark.png";
			wrap.classList.add('onWish')
		}
		fetch(url,{method:'GET'})
	}
	
	function wishModalClose() {
		wishCheck()
		document.getElementById('layer_wish').classList.add('hidden')
	}
</script>

<!-- confirm_dropDown -->
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

<!-- chart.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script>
	chart(${chartXData}, ${chartYData})
	function chart(xData,yData) {
		let chartX = xData
		let chartY = yData
		
		const canvas = document.getElementById('chart');
	    const ctx = canvas.getContext('2d');
		// getContext : 드로잉에 필요한 속성과 함수를 가진 객체를 생성합니다
	    const grd = ctx.createLinearGradient(0, 0, 0,140);
	    grd.addColorStop(0, 'rgba(247, 181, 173, 1)');
	    grd.addColorStop(1, 'rgba(247, 181, 173, 0)');
		
	    let data = {
	        type: 'line',
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
	}
</script>

<!-- tab Module -->
<script>
	function clearTh() {
		const itemTh = document.querySelectorAll('.item_th')
		itemTh.forEach( element => {
			element.classList.remove('on')
		})
	}
	
	function clearLayerContentTab() {
		const layerContentTab = document.querySelectorAll('.layer_content_tab')
		layerContentTab.forEach( element => {
			element.classList.add('hidden')
		})
	}
	
	function tabAll(){
		clearTh()
		clearLayerContentTab()
		const tabAllBtn = document.getElementById('tab_all')
		tabAllBtn.classList.add('on')
		const panel = document.querySelector('.panel1')
		if(panel.classList.contains('none')) { 
			document.querySelector('.panel0').classList.remove('hidden') 
			panel.classList.add('hidden')	
		}
		else {
			document.querySelector('.panel0').classList.add('hidden')
			panel.classList.remove('hidden')
		}
	}
	
	function tabSell(){
		clearTh()
		clearLayerContentTab()
		const tabSellBtn = document.getElementById('tab_sell')
		tabSellBtn.classList.add('on')
		const modalTabSell = document.querySelector('.modal_tab_sell')
		modalTabSell.classList.add('on')
		const panel = document.querySelector('.panel2')
		if(panel.classList.contains('none')) { 
			document.querySelector('.panel0').classList.remove('hidden')
			panel.classList.add('hidden')
		} else {
			panel.classList.remove('hidden')
			document.querySelector('.panel0').classList.add('hidden')			
		}
	}
	
	function tabBuy(){
		clearTh()
		clearLayerContentTab()
		const tabBuyBtn = document.getElementById('tab_buy')
		tabBuyBtn.classList.add('on')
		const modalTabBuy = document.querySelector('.modal_tab_buy')
		modalTabBuy.classList.add('on')
		const panel = document.querySelector('.panel3')
		if(panel.classList.contains('none')) { 
			document.querySelector('.panel0').classList.remove('hidden')
			panel.classList.add()
		} else {
			panel.classList.remove('hidden')
			document.querySelector('.panel0').classList.add('hidden')
		}
	}
</script>

<!-- modal_onOff -->
<script>
	const btnSize = document.querySelector('.btn_size')
	const buyBtn = document.querySelector('.division_buy')
	const sellBtn = document.querySelector('.division_sell')
	const btn = document.querySelectorAll('.btn')
	const divisionBuy = document.getElementById('division_layer_buy')
	const divisionSell = document.getElementById('division_layer_sell')
	const market = document.getElementById('market_layer')
	const subTitle = document.querySelector('.subtitle')
	const sizePrice = document.querySelectorAll('.layer_size_price');
	
	btnSize.addEventListener('click',openLayer)
	buyBtn.addEventListener('click',openLayer)
	sellBtn.addEventListener('click',openLayer)
	btn.forEach( element => {
		element.addEventListener('click',openLayer)
	})
	
	function openLayer(event) {
		const selectSize = btnSize.innerText.replace(/\s▽$/,'')
		switch (event.target.className) {
		case 'division_buy' :
			// 로그인이 없다면 로그인 페이지로 이동
			if(loginEmail == '') {
				location.href = '${cpath}/member/login'
			} else {
				if(selectSize == "모든 사이즈") {
					divisionBuy.classList.remove('hidden')
					sizePrice.forEach(element => {
						if(element.innerText != '구매 입찰' && element.innerText != '-' ) {
							element.style.color = 'red'
						} else {
							element.style.color = 'black'
						}
					})
				} else {
					location.href = '${cpath}/buy/' + ${product.idx} + '?size=' + selectSize
				}
			}
			break;
		case 'division_sell' :
			if(loginEmail == '') {
				location.href = '${cpath}/member/login'				
			} else {
				if(selectSize == "모든 사이즈") {
					divisionSell.classList.remove('hidden')
					sizePrice.forEach(element => {
						if(element.innerText != '판매 입찰' && element.innerText != '-') {
							element.style.color = 'green'
						} else {
							element.style.color = 'black'
						}
					})
				} else {
					location.href = '${cpath}/sell/' + ${product.idx} + '?size=' + selectSize
				}
			}
			break;
		case 'btn medium':
			event.preventDefault()
			const itemTwo = document.querySelectorAll('.item_two')
			var targetTab
			itemTwo.forEach( element => {
				if(element.className == 'item_link item_two on') { targetTab=element.id }
			})
			if(targetTab=='tab_sell'){
				tabSell()
			} else {
				tabBuy()
			}
			market.classList.remove('hidden')
			break;
		case 'btn medium more_all':
			event.preventDefault();
			tabAll();
			market.classList.remove('hidden');
			break;
		case 'btn_size':
			event.preventDefault()
			divisionBuy.classList.remove('hidden')
			sizePrice.forEach(element => {
				if(element.innerText != '구매 입찰') {
					element.style.color = 'red'
				} else {
					element.style.color = 'black'
				}
			})
			break;
		default:
			break;
		}
	}
	
// 	modal close
	const closeBtn = document.querySelectorAll('.btn_layer_close')
	const layer = document.querySelectorAll('.layer')
	closeBtn.forEach( element => {
		element.addEventListener('click',closeLayer)
	})
	layer.forEach( element => {
		element.addEventListener('click',closeLayer)
	})
	
	
	function closeLayer(event) {
		if(event.target.classList.contains('btn_layer_close')) {
			return event.target.parentNode.parentNode.classList.add('hidden')
		} else if(event.target.classList.contains('layer')) {
			return event.target.classList.add('hidden')
		} else if(event.target.classList.contains('layer_size_size')) {
			const layer = event.target.parentNode.parentNode.parentNode.parentNode.parentNode
			return layer.classList.add('hidden')
		} else if(event.target.classList.contains('layer_size_price')) {
			const layer = event.target.parentNode.parentNode.parentNode.parentNode.parentNode
			return layer.classList.add('hidden')
		} else if(event.target.classList.contains('layer_size_content')) {
			const layer = event.target.parentNode.parentNode.parentNode.parentNode
			return layer.classList.add('hidden')
		}
	}
</script>

<!-- tab_focus -->
<script>
	const itemOne = document.querySelectorAll('.item_one')
	itemOne.forEach( (ele) => {
		ele.addEventListener('click', tabOneHandler)
	})
	const itemTwo = document.querySelectorAll('.item_two')
	itemTwo.forEach( (ele) => {
		ele.addEventListener('click', tabTwoHandler)
	})
	const itemTh = document.querySelectorAll('.item_th')
	itemTh.forEach( (ele) => {
		ele.addEventListener('click', tabThreeHandler)
	})
	
	function tabOneHandler(event) {
		event.preventDefault()
		itemOne.forEach( (ele) => {
			ele.classList.remove('on')	
		})
		event.target.classList.add('on')
		const tabId = event.target.id
		const url = '${cpath}/chartData/'+${product.idx} + '/' + tabId
		fetch(url,{method:'GET'}).then(resp => resp.json())
		.then(json => {
			document.querySelector('.chart_div').innerHTML = '<canvas id="chart" height="136" width="570"></canvas>'
			chart(json[0],json[1])
		})
	}
	
	function tabTwoHandler(event) {
		const divSell = document.querySelector('.div_sell')
		const divBuy = document.querySelector('.div_buy')
		event.preventDefault()
		if(event.target.id == 'tab_sell'){
			document.querySelector('.panel1').classList.add('hidden')
			document.querySelector('.panel2').classList.remove('hidden')
			document.querySelector('.panel3').classList.add('hidden')
			divSell.classList.remove('hidden')
			divBuy.classList.add('hidden')
		} else if(event.target.id == 'tab_buy') {
			document.querySelector('.panel1').classList.add('hidden')
			document.querySelector('.panel2').classList.add('hidden')
			document.querySelector('.panel3').classList.remove('hidden')
			divSell.classList.add('hidden')
			divBuy.classList.remove('hidden')
		}
		itemTwo.forEach( (ele) => {
			ele.classList.remove('on')	
		})
		event.target.classList.add('on')
	}
	
	function tabThreeHandler(event) {
		event.preventDefault()
		itemTh.forEach( (ele) => {
			ele.classList.remove('on')
		})
		event.target.classList.add('on')
		const tabId = event.target.id
		clearLayerContentTab()
		switch (tabId) {
		case 'tab_all':
			if(document.querySelector('.panel1').classList.contains('none')) {
				document.querySelector('.panel0').classList.remove('hidden')
			} else {
			document.querySelector('.panel1').classList.remove('hidden')
			}
			break;
		case 'tab_sell':
			if(document.querySelector('.panel2').classList.contains('none')) {
				document.querySelector('.panel0').classList.remove('hidden')
			} else {
			document.querySelector('.panel2').classList.remove('hidden')
			}
			break;
		case 'tab_buy':
			if(document.querySelector('.panel3').classList.contains('none')) {
				document.querySelector('.panel0').classList.remove('hidden')
			} else {
			document.querySelector('.panel3').classList.remove('hidden')
			}
			break;
		default:
			break;
		}
	}
	
</script>

<!-- size -->
<script>
	const sizeList = document.querySelectorAll('.layer_size_content')
	
	sizeList.forEach( element => {
		element.addEventListener('click',sizeFilter)
	})
	
	function clearSizeFilter() {
		sizeList.forEach( element => {
			element.classList.remove('size_border')
		})
	}
	
	function sizeFilter(event) {
		var box
		var size
		
		clearSizeFilter()
		if(event.target.classList.contains('layer_size_size')) {
			box = event.target.parentNode;
			size = event.target.id;
		} else if(event.target.classList.contains('layer_size_price')) {
			box = event.target.parentNode;
			size = box.firstChild.nextSibling.id;
		} else if(event.target.classList.contains('layer_size_content')) {
			box = event.target
			size = box.firstChild.nextSibling.id;
		}
		const searchSize = '.size_' + size
		var sizeClassList = document.querySelectorAll(searchSize)
		
		sizeClassList.forEach( element => {
			element.parentNode.classList.add('size_border')
		})

		sizeFocus(size)
		sizeSelectPrcie(size)
		
		closeLayer()
	}
	
	function sizeSelectPrcie(size) {
		const url = '${cpath}/products/' + ${product.idx} + '/' + size
		const opt = {
			method : 'GET'
		}
		fetch(url,opt).then (resp => resp.json())
		.then( json => {
			document.querySelector('.title_price').firstChild.nextSibling.innerText = json[0]
			document.querySelector('.buy_num').innerText = json[1]
			document.querySelector('.sell_num').innerText = json[2]
		})
		
		sizeSelectConclusionList(size)
		sizeSelectSellList(size)
		sizeSelectBuyList(size)
	}
	
	function sizeSelectBuyList(size) {
		const buyDiv = document.querySelector('.div_buy')
		const tableBuy = document.querySelector('.table_buy')
		const url = '${cpath}/buyList/' + ${product.idx} + '/' + size
		const panel3 = document.querySelector('.panel3')
		fetch(url,{method:'GET'}).then(resp => resp.json() )
		.then( json => {
			if(json.length == 0) {
				buyDiv.querySelector('.table_content').classList.add('hidden')
				buyDiv.querySelector('.table_empty').classList.remove('hidden')
				panel3.classList.add('none')
			}
			else {
				panel3.classList.remove('none')
				tableBuy.innerHTML = ''
				buyDiv.querySelector('.table_content').classList.remove('hidden')
				buyDiv.querySelector('.table_empty').classList.add('hidden')
				for(let i=0;i<4;i++){
					const tr = buySellTr(json[i])
					tableBuy.appendChild(tr)
				}
				panel3.querySelector('.layer_content_body').innerHTML = ''
				for(data in json) {
					const ul = document.createElement('ul')
					ul.classList.add('content_body')
					ul.innerHTML = '<li class="body_data">' + json[data].pSize + '</li>'
					ul.innerHTML += '<li class="body_data align_right">' + json[data].price + '</li>'
					ul.innerHTML += '<li class="body_data align_right is_active">' + json[data].cnt + '</li>'
					panel3.querySelector('.layer_content_body').appendChild(ul)
				}
			}
		})
	}
	
	function sizeSelectSellList(size) {
		const sellDiv = document.querySelector('.div_sell')
		const tableSell = document.querySelector('.table_sell')
		const url = '${cpath}/sellList/' + ${product.idx} + '/' + size
		const panel2 = document.querySelector('.panel2')
		fetch(url,{method:'GET'}).then(resp => resp.json() )
		.then( json => {
			if(json.length == 0) {
				sellDiv.querySelector('.table_content').classList.add('hidden')
				sellDiv.querySelector('.table_empty').classList.remove('hidden')
				panel2.classList.add('none')
			}
			else {
				panel2.classList.remove('none')
				tableSell.innerHTML = ''
				sellDiv.querySelector('.table_content').classList.remove('hidden')
				sellDiv.querySelector('.table_empty').classList.add('hidden')
				for(let i=0;i<4;i++){
					const tr = buySellTr(json[i])
					tableSell.appendChild(tr)
				}
				panel2.querySelector('.layer_content_body').innerHTML = ''
				for(data in json) {
					const ul = document.createElement('ul')
					ul.classList.add('content_body')
					ul.innerHTML = '<li class="body_data">' + json[data].pSize + '</li>'
					ul.innerHTML += '<li class="body_data align_right">' + json[data].price + '</li>'
					ul.innerHTML += '<li class="body_data align_right is_active">' + json[data].cnt + '</li>'
					panel2.querySelector('.layer_content_body').appendChild(ul)
				}
			}
		})
	}
	
	function buySellTr(data) {
		const tr = document.createElement('tr')
		tr.innerHTML = '<td class="align_left">' + (data != null ? data.pSize : '-' ) + '</td>'
		tr.innerHTML += '<td class="align_right">' + (data != null ? data.price : '-' ) + '</td>'
		tr.innerHTML += '<td class="align_right">' + (data != null ? data.cnt : '-' ) + '</td>'
		return tr
	}
	
	function sizeSelectConclusionList(size) {
		const chartTable = document.querySelector('.chart_body')
		const url = '${cpath}/conclusionList/' + ${product.idx} + '/' + size
		const panel1 = document.querySelector('.panel1')
		fetch(url, {method:'GET'}).then(resp => resp.json())
		.then(json => {
			chartTable.innerHTML = ''
			if(json.length == 0) { 
				document.querySelector('.content_conclusion').classList.add('hidden')
				document.querySelector('.empty_conclusion').classList.remove('hidden')
				panel1.classList.add('none')
				return
			}
			panel1.classList.remove('none')
			document.querySelector('.content_conclusion').classList.remove('hidden')
			document.querySelector('.empty_conclusion').classList.add('hidden')
			for(let i=0;i<4;i++){
				const tr = conclusionTr(json[i])
				chartTable.appendChild(tr)
			}
			const layerConclusion = document.querySelector('.layer_body_conclusion')
			layerConclusion.innerHTML = ''
			for(data in json){
				const ul = document.createElement('ul')
				ul.classList.add('content_body')
				ul.innerHTML = '<li class="body_data">' + json[data].pSize + '</li>'
				ul.innerHTML += '<li class="body_data align_right">' + json[data].price + '</li>'
				ul.innerHTML += '<li class="body_data align_right is_active">' + json[data].endDate + '</li>'
				layerConclusion.appendChild(ul)
			}
		})
	}
	
	function conclusionTr(data) {
		
		const tr = document.createElement('tr')
		tr.innerHTML = '<td class="align_left">' + (data != null ? data.pSize : '-' ) + '</td>'
		tr.innerHTML += '<td class="align_right">' + (data != null ? data.price : '-' ) + '</td>'
		tr.innerHTML += '<td class="align_right">' + (data != null ? data.endDate : '-' ) + '</td>'
		
		return tr
	}
	
	function sizeFocus(size) {
		if(size == "all") {
			btnSize.innerText = '모든 사이즈 ▽'
		} else {
			btnSize.innerText = size + ' ▽'
		}
	}
</script>


<%@ include file="../footer2.jsp" %>