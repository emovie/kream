<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" /> 

<%@ include file="../header.jsp" %>

<link rel="stylesheet" href="${cpath }/resources/css/style.css?ver=1">

<style>
	.registWrap {
		width: 400px;
		height: auto;
		margin: auto;
		margin-top: 60px;
		margin-bottom: 60px;
	}
	
	#help_title {
		text-align: center;
		font-size: 32px;
		margin-bottom: 60px;
	}
	
	.registWrap > div:first-child {
		width: 300px;
		text-align: center;
		margin: auto;
		margin-bottom: 40px;
		
	}
	/* .registWrap img {
		width: 250px;
	} */
	.regist_form p {
	 	font-size: 13px;
		font-weight: 500;
		margin: 0;
	}
	
	.regist_form div > p:first-child {
		margin-top: 20px; 
		margin-bottom: 5px;
	}
	
	p > input {
		width: 400px;
		height: 30px;
		border: none;
		border-bottom: 1px solid #ebebeb;
		outline: none;
		padding-left: 0;
		box-sizing: border-box;
	}
	
	.regist_form input:focus {
		border-bottom: 2px solid black;
	}
	
	.regist_form input::placeholder {
		color: #cecece;
		font-size: 15px;
		font-weight: 300;
	}
	.regist_form > div:nth-child(2) {
		margin-bottom: 50px;
	}
	.regist_form > div > p:last-child {
		height: 40px;
		box-sizing: border-box;
	}
	
	#regist_submit {
		width: 400px;
		height: 50px;
		color: white;
		background-color: #cecece;
		border-radius: 15px;  
		border: none;
		cursor: pointer;
		margin-top: 20px;
		margin-bottom: 8px;
		font-size: 16px;
	}
	
	.reigstMenu {
		width: 350px;
		margin: auto;
		margin-top: 20px;
		margin-bottom: 120px;
		display: flex;
		justify-content: space-between;
	}
	
	.registMenu div{
		width: 100px;
		text-align: center;
		font-size: 13px;
		cursor: pointer;
	}
	
	.registMenu div:nth-child(2) {
		border-left: 1px solid #cecece;
		border-right: 1px solid #cecece;
		padding: 0 10px;
		
	}

	.checkbox_main {
		display:flex;
		width: 400px;
		height: 30px;
		justify-content: space-between;
	}
	
	.checkbox_sub {
		display: block; 
		padding: 16px 0 0 36px;
	}
	
	.checkbox_item   {
		display: flex;
		width: 344px;
 		justify-content: space-between;


		
	}
	
	#ci_2 {
		margin-bottom: 15px;
	}
	
	.checkbox_item2 {
		margin-bottom: 40px;
	}
	
	.btn {
		
		background-repeat: no-repeat;
		/* border: none; */
		cursor: pointer;
		
	}
	
	.checkbox_item span {
		font-size: 13px;
   		margin: 0;
   		vertical-align: super;
   		cursor: pointer;
	}
	
	.checkbox_item a {
		display: block; 
		/* position: absolute; */
		text-decoration: underline;
		font-size: 13px;
    	font-weight: 500;
    	
    	margin: 0;
		font-size: 12px;
    	line-height: 20px;
    	letter-spacing: -.18px;
    	color: rgba(34,34,34,.5);
	}
	
	input[type=checkbox] {
		display: none;
	}
	
	.check-icon {
		display: inline-block;
		
		width: 22px;
		height: 22px;
		
		background-image: url("https://i.imgur.com/mC9xjtZ.png");
		background-size: cover;
	}
	
	input[type=checkbox]:checked + .check-icon {
		background-image: url("https://i.imgur.com/ixKhbRE.png");
		background-size: cover;
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
	
	.layer_container {
	    width: 580px;
		position: absolute;
	    top:50%;
	    left: 50%;
	    -webkit-transform: translate(-50%,-50%);
	    -ms-transform: translate(-50%,-50%);
	    transform: translate(-50%,-50%);
	    background-color: #fff;
	    box-sizing: border-box;
	    border-radius: 16px;
	    -webkit-box-shadow: 0 4px 10px 0 rgb(0 0 0 / 10%);
	    box-shadow: 0 4px 10px 0 rgb(0 0 0 / 10%);
	}
	
	.layer_header {
		height: 60px;
		padding: 1px 50px 14px;
    	min-height: 60px;
    	font-size: 18px;
    	letter-spacing: -.27px;
    	font-weight: 700;
    	color: #000;
    	text-align: center;
    	
	}
	
	.layer_content {
		max-height: 528px;
    	overflow-y: auto;
    	padding: 0 32px;
    	margin-bottom: 32px;
	}
	
	.agreement_list {
		word-break: keep-all;
		font-size: 14px;
		
	}
	
	.agreement_title > p, .agreement_title {
		font-size: 15px;
    	font-weight: 700;
	}
	
	.title {
		font-size: 20px;
	}
	
	.btn_layer_close {
		position: absolute;
		top: 18px;
		right: 20px;
		cursor: pointer;
		background-image: url("https://i.imgur.com/BINozym.png");
		background-size: cover;
		width: 24px;
		height: 24px;
	}
	
	/* .modal_overlay {
        background-color: rgba(0, 0, 0, 0.5);
        width: 100%;
        height: 100%;
        position: absolute;
     } */
     
     .modal_btn {
     	cursor: pointer;
     }
	
</style>
</head>
<body>
	
	
	
<div class="registWrap">

	<h2 id="help_title">회원가입 </h2>
	<form method="post" class="regist_form">
		<div>
			<p>이메일 주소</p>
			<p>
				<input type="text" name="email" oninput="funcCheckEmail()" placeholder="예)itbank@itbank.co.kr"  required autofocus>
				<span id="checkEmailMsg"></span>
			</p>			
		</div>
				
		<div>
			<p>비밀번호</p>
			<p>
			<input type="password" name="pw" oninput="funcCheckPw()" placeholder="영문, 숫자, 특수문자 조합 8~16자" required>
			<span id="checkPwMsg"></span>
			</p>	
		</div>
				
				
				
		<div class="checkbox_main">
			<div class="checkbox_item" id="checkbox_item1" >
				<label for="check_all_1">
				<input type="checkbox" id="check_all_1" class="normal">
				<i class="check-icon"></i>				
					<span>[필수] 만14세 이상이며 모두 동의합니다.</span>
				</label>
			</div>
			<img class="btn" id="main_btn" src="https://i.imgur.com/DOosbxM.png" alt="" />
		</div>
				
				
				
		<div class="checkbox_sub" id="checkbox_sub1" style="display:none">
			<div class="checkbox_item">
				<label for="check_1">
				<input type="checkbox" id="check_1" class="checkbox_sub1">
				<i class="check-icon"></i>
					<span>이용약관</span>
				</label>
				<a id="layer1_btn" class="modal_btn">내용 보기</a>
			</div>
					
			<div class="checkbox_item" id="ci_2">
				<label for="check_2">
				<input type="checkbox" id="check_2" class="checkbox_sub1">
				<i class="check-icon" ></i>
					<span>개인정보처리방침</span>
				</label>
				<a id="layer2_btn" class="modal_btn">내용 보기</a>
			</div>
		</div>
		
		
		
		<div id="layer" class="layer hidden">
			<div class="layer_container">
				<div class="layer_header">
					<h2 class="title">이용약관</h2>			
				</div>
				
				<div class="layer_content">
					<div class="agreement">
						<div data-v-8fc5a778="" class="agreement_list"><div data-v-8fc5a778="" class="agreement_title"> KREAM 서비스 이용 약관 </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 1 조 (목적)</p></div><div data-v-8fc5a778="" class="agreement_desc"> 이 약관은 “회원” 개인 상호 간에 상품을 매매하는 것을 중개하고, “상품”에 관한 정보를 상호 교환할 수 있도록 크림 주식회사(이하 "회사"라 합니다)가 운영, 제공하는 KREAM 서비스(이하 "서비스")에 대한 것으로 본 약관에서는 “서비스”의 이용과 관련하여 “회사”와 “회원”과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정합니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 2 조 (용어의 정의)</p></div><div data-v-8fc5a778="" class="agreement_desc"> 이 약관에서 사용하는 용어의 정의는 다음 각 호와 같으며, 정의되지 않은 용어에 대한 해석은 관계 법령 및 지침, 본 이용약관, 개인정보취급방침, 상관례 등에 의합니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""><li data-v-8fc5a778=""> "서비스"라 함은 회사가 PC 및/또는 모바일 환경에서 제공하는 KREAM 서비스 및 관련 제반 서비스를 말합니다. </li><li data-v-8fc5a778=""> "회원"이라 함은 “회사”의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다. </li><li data-v-8fc5a778=""> "구매자" 또는 “구매회원”이라 함은 "서비스"에 등록된 재화 및 용역(이하"상품")을 구매하거나 또는 구매할 의사로 서비스를 이용하는 회원을 말합니다. </li><li data-v-8fc5a778=""> "판매자" 또는 “판매회원”이라 함은 "서비스"에 “상품”을 등록하여 판매하거나 또는 제공할 의사로 서비스를 이용하는 회원을 말합니다. </li><li data-v-8fc5a778=""> “입찰”이라 함은 “상품”을 구매하기 위하여 원하는 “상품”의 구매 가격을 제출하는 행위 또는 ”상품”을 판매하기 위하여 원하는 “상품”의 판매 가격을 제출하는 행위를 말합니다. </li><li data-v-8fc5a778="">“거래 체결”이라 함은 “입찰”에 의하여 상품의 거래가 성립되는 것을 말합니다.</li><li data-v-8fc5a778=""> "게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스"상에 게시한 문자, 음성, 음향, 화상, 동영상 등의 정보 형태의 글(댓글 포함), 사진(이미지), 동영상 및 각종 파일과 링크 등 일체를 의미합니다. </li><li data-v-8fc5a778="">"회원정보"라 함은 “서비스”를 이용하는 고객이 등록한 정보를 말합니다.</li><li data-v-8fc5a778=""> “서비스수수료”라 함은 “회원”이 “서비스”를 이용하면서 발생할 수 있는 수수료입니다. “상품”의 판매/구매 및 제반 서비스를 이용함에 따라 부과되는 시스템이용료로서 거래완료수수료 또는 판매완료 수수료, 유료부가서비스수수료 등이 있으며, 관련내용은 제11조(서비스수수료)에 명시된 바에 따릅니다. </li><li data-v-8fc5a778=""> "포인트"라 함은 "서비스"의 효율적 이용을 위해 “회사”가 임의로 책정 또는 지급, 조정할 수 있는 "서비스" 상의 가상 데이터를 의미합니다. “포인트”의 적립, 지급, 사용 등과 관련한 구체적인 정책에 대해서는 이용약관 및 공지사항 등으로 별도 고지하는 바에 따릅니다. </li></div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 3 조 (약관의 명시, 효력 및 변경)</p></div><div data-v-8fc5a778="" class="agreement_desc"> 1. "회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 “서비스” 초기 화면에 게시합니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 2. "회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 7일 전부터 공지합니다. 다만, "회원"에게 불리한 내용으로 약관을 개정하는 경우에는 그 적용일자 30일 전부터 공지 외에 "회원정보"에 등록된 이메일 등 전자적 수단을 통해 별도로 명확히 통지하도록 합니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 3. "회사"가 전항에 따라 "회원"에게 통지하면서 공지 기간 이내에 거부의사를 표시하지 않으면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 “회원”이 명시적으로 거부의사를 밝히지 않거나, "서비스"를 이용할 경우에는 "회원"이 개정약관에 동의한 것으로 봅니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 4. "회원"이 개정약관에 동의하지 않는 경우 "회사"는 개정약관의 내용을 적용할 수 없으며, 이 경우 회원은 제8조 제1항의 규정에 따라 이용계약을 해지할 수 있습니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 4 조 (약관의 해석)</p></div><div data-v-8fc5a778="" class="agreement_desc"> "회사"는 개별 서비스에 대해서 별도의 이용약관 및 정책(이하 "개별 약관 등")을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 "개별 약관 등"이 우선하여 적용됩니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 이 약관에 명시되지 않은 사항은 '약관의 규제에 관한 법률'(이하 "약관법"), ‘전자상거래 등에서의 소비자보호에 관한 법률’(이하 "전자상거래법"), ‘정보통신망이용촉진및정보보호등에관한법률’(이하 “정보통신망법”), 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침(이하 “소비자보호지침”) 및 관계 법령 또는 상관례에 따릅니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 5 조 (이용계약의 체결)</p></div><div data-v-8fc5a778="" class="agreement_desc"> 1. 이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 후 회원가입신청을 하고 "회사"가 이러한 신청에 대하여 승낙함으로써 체결됩니다. "회사"는 "가입신청자"의 신청에 대하여 서비스 이용을 승낙함을 원칙으로 합니다. 다만, "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나, 사후에 이용계약을 해지할 수 있습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""><li data-v-8fc5a778="">가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우</li><li data-v-8fc5a778="">타인의 명의를 도용하여 이용신청을 하는 경우</li><li data-v-8fc5a778="">허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우</li><li data-v-8fc5a778="">14세 미만 아동이 회원가입 시 법정대리인(부모 등)의 동의를 얻지 아니한 경우</li><li data-v-8fc5a778=""> 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우 </li><br data-v-8fc5a778=""> 2. "회사"는 “서비스” 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 3. 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "회사"는 원칙적으로 이를 "가입신청자"에게 알리도록 합니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 4. 이용계약의 성립 시기는 "회사"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 5. "회사"는 "회원"에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 6 조 ("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)</p></div><div data-v-8fc5a778="" class="agreement_desc"> 1. "회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 2. "회사"는 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 회사 및 회사의 운영자로 오인한 우려가 있는 경우 등 “회원” 및 “서비스” 보호에 필요한 경우 해당 "아이디"의 이용을 제한할 수 있습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 3. "회원"은 "아이디"및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의 안내에 따라야 합니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 4. 제3항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 7 조 (이용제한 등)</p></div><div data-v-8fc5a778="" class="agreement_desc"> 1. "회사"는 "회원"이 이 약관의 의무를 위반하거나 "서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로 "서비스" 이용을 단계적으로 제한할 수 있습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 2. "회사"는 전항에도 불구하고, “회원”의 의무 위반 행위나 “서비스” 운영 방해 행위에 대하여 사안의 중대성이나 긴급성 등을 토대로 “서비스”에 미치는 영향을 고려하여 경고 등의 단계적인 조치를 거치지 않고 곧바로 일시 정지나 영구이용정지를 할 수 있습니다. <br data-v-8fc5a778=""> 특히, ‘주민등록법'을 위반한 명의도용 및 결제도용, '저작권법'을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반하여 서비스에 중대한 영향을 끼친 경우에는 즉시 영구이용정지를 할 수 있으며, 영구이용정지를 할 수 있는 위반행위는 이에 제한되지 않습니다. 본 항에 따른 영구이용정지 시 "서비스" 이용을 통해 획득한 "포인트" 및 기타 혜택 등도 모두 소멸되며, "회사"는 이에 대해 별도로 보상하지 않습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 3. "회사"는 본 조의 이용제한 범위 내에서 제한의 조건 및 세부내용은 본 약관 또는 운영 정책 및 개별 서비스 상의 이용약관이나 운영정책에서 정하는 바에 의합니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 4. "회원"은 본 조에 따른 이용제한 등에 대해 "회사"가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 "회사"가 인정하는 경우 "회사"는 즉시 "서비스"의 이용을 재개합니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 8 조 (계약해제, 해지 등)</p></div><div data-v-8fc5a778="" class="agreement_desc"> 1. "회원"은 언제든지 고객센터 또는 내 정보 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "회사"는 관련법 등이 정하는 바에 따라 이를 즉시 처리 합니다. 다만, 서비스 수수료나 부과된 페널티 금액의 미납이 있는 경우, 제16조 제3항의 "마이너스(-) 포인트"가 남아 있는 경우, “회사”와 “회원” 사이에 분쟁 계속 중인 경우 등과 같이 이용계약을 해지하는 것이 적절하지 않은 경우에는 해당하는 사유가 완전히 해소될 때까지 해지(탈퇴) 처리가 제한될 수 있습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 2. "회원"이 계약을 해지할 경우, 관련법 및 개인정보취급방침에 따라 "회사"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 "회원"의 모든 데이터는 소멸됩니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 3. "회원"이 계약을 해지하는 경우, "회원"이 작성한 "게시물" 중 피드, 블로그 등과 같이 본인 계정에 등록된 게시물 일체는 삭제됩니다. 다만, 타인에 의해 담기, 스크랩 등이 되어 재게시되거나, 공용게시판에 등록된 "게시물" 등은 삭제되지 않으니 사전에 삭제 후 탈퇴하시기 바랍니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 9 조 ("서비스"의 이용)</p></div><div data-v-8fc5a778="" class="agreement_desc"> 1. "회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다. 이 경우 "회사"는 제20조에 정한 방법으로 "회원"에게 통지합니다. 다만, "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 2. "회사"는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면 등에 공지한 바에 따릅니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 10 조 ("서비스"의 내용)</p></div><div data-v-8fc5a778="" class="agreement_desc"> 1. “상품”의 중개 서비스 <br data-v-8fc5a778=""> “회원” 개인 상호간에 미사용 secondhand “상품”에 대한 거래가 이루어질 수 있도록 회사가 온라인으로 제공하는 “상품”에 대한 중개 서비스 및 관련 부가서비스 일체를 말합니다. “회원”의 “상품”에 대한 거래는 입찰에 의한 거래 체결 또는 “판매자” 및 “구매자”가 설정한 가격에 즉시 거래 체결되는 방식을 모두 제공할 수 있습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 2. 정보 서비스 <br data-v-8fc5a778=""> “회사”가 각 “회원”에 대한 판매정보, 구매정보, 거래실적, 신용도, 회원정보 등 “회원”의 거래 기록을 모아 “회원” 상호 간의 상품의 거래 및 중개서비스를 신속하고 편리하게 이용하도록 하기 위하여 제공하는 서비스를 말합니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 3. 기타 정보 서비스 <br data-v-8fc5a778=""> “상품” 서비스 이외에 “회사”가 제공하는 서비스를 통하여 “회원”에게 온라인으로 제공하는 정보서비스, 커뮤니티 등의 인터넷 서비스를 말합니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 11 조 ("서비스"의 변경 및 중지)</p></div><div data-v-8fc5a778="" class="agreement_desc"> 1. "회사"는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 "서비스"를 제한, 변경하거나 중지할 수 있습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 2. "회사"는 제1항에 의한 서비스 중단의 경우에 인터넷 등에 사전 공지하거나 제20조("회원"에 대한 통지)에 정한 방법으로 "회원"에게 통지합니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 3. "서비스"의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 “서비스”의 내용 및 제공일자 등은 그 변경 전에 해당 “서비스” 초기화면에 게시 합니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 4. "회사"는 무료로 제공되는 “서비스”의 일부 또는 전부를 “회사”의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 "회원"에게 별도의 보상을 하지 않습니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 12 조 ("게시물"의 저작권)</p></div><div data-v-8fc5a778="" class="agreement_desc"> 1. "회원"은 저작권 관련 규정을 준수하기 위해 충분한 주의를 기울여야만 합니다. 만약 “회원”이 등록한 게시물이 제 3자의 저작권을 침해한 경우, 민형사상 모든 책임은 “회원” 당사자에게 있으며, 이와 관련해서 회사는 어떠한 책임도 지지 않습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 2. “회원”는 "서비스"를 이용함으로써 얻은 정보 중 "회사"에게 지적재산권이 귀속된 정보를 "회사"의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제 3자에게 이용하게 하여서는 안됩니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 3. "회사"는 "회원"이 작성한 각종 게시물을 판촉, 홍보 등의 목적으로 “서비스”에서 사용하는 것 외에도 “서비스” 제공에 필요한 범위에서 타 사이트에 복제, 배포, 전송, 전시할 수 있으며, 본질적인 내용에 변경을 가하지 않는 범위 내에서 수정, 편집될 수 있습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 4. "회원"이 공개한 "게시물"은 "서비스"를 통해 전체 “회원”, 관련 제반 서비스에 공유될 수 있으며, “회사”는 해당 “게시물”을 “서비스”의 홍보, 안내 등의 목적으로 사용할 수 있습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 5. "회사"가 작성한 저작물에 대한 저작권 및 기타 지적 재산권은 "회사"에 귀속합니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 13 조 ("게시물"의 관리)</p></div><div data-v-8fc5a778="" class="agreement_desc"> 1. 자동화된 수단을 활용하는 등 서비스의 기능을 비정상적으로 이용하여 게재된 게시물, 서비스의 제공 취지와 부합하지 않는 내용의 게시물은 다른 이용자들의 정상적인 서비스 이용에 불편을 초래하고 더 나아가 서비스의 원활한 제공을 방해하므로 역시 제한될 수 있습니다. 이용 제한의 대상이 될 수 있는 부적절한 게시물에 대한 상세한 내용은 본 약관 제24조의 규정 및 <b data-v-8fc5a778="">정보통신에 관한 심의 규정</b>, 기타 운영 정책 등을 참고해 주시기 바랍니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 2. "회원"은 자신의 "게시물"이 타인의 저작권이나 명예 등 제3자의 권리를 침해하지 않도록 주의하여야 합니다. “회사”는 이에 대한 문제를 해결하기 위해 "정보통신망법" 또는 "저작권법" 등을 근거로 권리 침해 주장자의 요청에 따른 게시물 게시중단, 원 게시자의 이의신청에 따른 해당 게시물 게시 재개 등을 내용으로 하는 <b data-v-8fc5a778="">게시중단요청 서비스</b>를 운영하고 있습니다. 타인의 “게시물”로 인해 자신의 저작권이나 명예가 침해되었다고 생각하는 “회원”은 게시중단요청 서비스를 통해 해당 “게시글”의 게시중단 요청을 할 수 있습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 3. "회사"는 전항에 따른 권리자의 요청이 없는 경우라도 "전자상거래법", “정보통신망법”, “저작권법”, “정보통신에 관한 심의 규정”등 권리침해가 인정될 만한 사유가 있거나 기타 “회사” 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 "게시물"에 대해 임시조치 등을 취할 수 있습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 4. 본 조에 따른 세부절차는 "정보통신망법" 및 "저작권법"이 규정한 범위 내에서 "회사"가 정한 "게시중단요청서비스"에 따르며, 부적절한 게시글을 게시한 “회원”에 대해서는 제7조 및 운영정책 등에서 정한 바에 따라 이용제한 조치를 취할 수 있습니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 14 조 (권리의 귀속)</p></div><div data-v-8fc5a778="" class="agreement_desc"> 1. "서비스"에 대한 저작권 및 지적재산권은 "회사"에 귀속됩니다. 단, "회원"의 "게시물" 및 제휴계약에 따라 제공된 저작물 등은 제외합니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 2. "회사"는 서비스와 관련하여 "회원"에게 "회사"가 정한 이용조건에 따라 계정, "아이디", "포인트" 등을 이용할 수 있는 이용권한만을 부여하며, "회원"은 이에 대한 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 3. “회사”가 "서비스"를 제공함에 사용되는 보안 기술이나 소프트웨어에 대해 “회원”은 회피 또는 변경하려 시도를 하여서는 안되며, “서비스” 및 이에 필요한 기술 또는 소프트웨어를 부정 사용 및 타인이 그렇게 하는 것을 조장하는 행위 등은 금지되어 있습니다. 만약 "회원"이 그와 같은 행위를 하는 경우 이에 대한 모든 책임은 "회원" 본인에게 있습니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 15 조 ("회사"의 의무)</p></div><div data-v-8fc5a778="" class="agreement_desc"> 1. "회사"는 관련법령 및 이 약관 등에서 금지한 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 2. "회사"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보보호정책을 공시하고 준수합니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 3. "회사"는 서비스 이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. “회원”이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달합니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 16 조 ("포인트")</p></div><div data-v-8fc5a778="" class="agreement_desc"> 1. "회사"는 서비스의 효율적 이용 및 운영을 위해 사전 공지 후 “포인트”에 대한 정책을 변경하거나 "포인트"의 일부 또는 전부를 조정할 수 있으며, "포인트"는 회사가 정한 기간에 따라 주기적으로 소멸할 수 있습니다.<br data-v-8fc5a778=""><br data-v-8fc5a778=""> 2. “회사”가 “회원”에게 “포인트”를 적립하였더라도 추후 “회원”의 거래취소, 반품, 이벤트 부정 응모 등 “포인트” 적립이 무효 또는 취소되거나 “포인트”가 부정한 방법으로 적립되었을 경우 그에 상응하는 “포인트”는 자동 차감될 수 있습니다.<br data-v-8fc5a778=""><br data-v-8fc5a778=""> 3. 전항에 따른 “포인트” 자동 차감 시 “회원”의 “포인트” 잔액이 “포인트” 차감 분 보다 적을 경우 “마이너스(-) 포인트”로 관리되며, 추후 “회원”이 적립하는 “포인트”와 상계됩니다.<br data-v-8fc5a778=""><br data-v-8fc5a778=""> 4. 1) “회원”이 “회사”와의 계약을 해지(탈회)하거나 기타 사유로 인하여 서비스 이용 자격을 박탈 당하는 등의 사유가 발생할 경우 또는 2) “회사”의 정책상 “마이너스(-) 포인트”에 대한 청구를 진행하거나 관리 방법을 변경하기로 결정한 경우에는 “회사”가 해당 “회원”에게 마이너스(-) 1포인트 당 한화(KRW) 1원으로 산정한 금액을 청구할 수 있습니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 17 조 ("대리행위의 부인")</p></div><div data-v-8fc5a778="" class="agreement_desc"> “회사"는 “상품” 거래의 당사자가 아닌 중개자로서 “회원” 상호 간의 거래에 대해서 효율적인 서비스를 위한 시스템 운영 및 관리 책임만을 부담하며, “상품”의 거래와 관련하여 “구매자” 또는 “판매자”를 대리하지 아니합니다. “회원” 사이에 성립된 거래 및 “회원”이 제공하고 등록한 정보에 대해서는 해당 “회원”이 그에 대한 모든 책임을 부담하여야 합니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 18 조 ("보증의 부인")</p></div><div data-v-8fc5a778="" class="agreement_desc"> 1. “회사”가 제공하는 시스템을 통하여 이루어지는 “구매자”와 “판매자” 간의 거래와 관련하여 판매의사 또는 구매의사의 존부 및 진정성, 등록 “상품”의 품질, 완전성, 안전성, 적법성, 및 타인의 권리에 대한 비침해성, “구매자” 또는 “판매자”가 입력하는 정보 및 그 정보를 통하여 링크된 URL에 게재된 자료의 진실성 또는 적법성 등 일체에 대하여 “회사”는 보증하지 아니하며, “판매자”가 “상품”의 정보를 고의적으로 속일 경우에는 모든 책임은 “판매자”에게 있습니다. 단, “회사”는 검수센터의 과실로 인한 검수 실책에 대한 내용에 대해서는 관련 법령 및 본 약관에 따른 책임을 부담합니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 2. “판매자”는 “상품”의 판매로 인하여 관세법 등에서 정한 내용에 위반되지 않도록 세금 납부 등 판매에 필요한 절차를 본인의 책임으로 이행하여야 하며, “회사”는 “판매자”의 “상품” 등록 또는 판매로 인한 법령 위반에 대해 책임을 부담하지 않습니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 19 조 (개인정보보호 의무)</p></div><div data-v-8fc5a778="" class="agreement_desc"> "회사"는 이용계약 체결 과정에서 가입신청자의 이메일 주소 등의 정보를 수집할 수 있으며, “회사”는 "개인정보보호법” 등 관계 법령이 정하는 바에 따라 "회원"의 "개인정보"를 보호하기 위해 노력합니다. "개인정보"의 보호 및 사용에 대해서는 관련법 및 "회사"의 개인정보보호정책이 적용됩니다. </div><div data-v-8fc5a778="" class="agreement_title"><p data-v-8fc5a778="">제 20 조 ("회원"에 대한 통지)</p></div><div data-v-8fc5a778="" class="agreement_desc"> 1. "회사"가 "회원"에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 "회원"이 지정한 전자우편주소, 서비스 내 전자메모 및 쪽지 등으로 할 수 있습니다. <br data-v-8fc5a778=""><br data-v-8fc5a778=""> 2. "회사"는 "회원" 전체에 대한 통지의 경우 7일 </div></div>	
					</div>
					<a class="btn_layer_close"></a>
					
				</div>
			</div>
		</div>			
				
				
				
		<div class="checkbox_main">
			<div class="checkbox_item" id="checkbox_item2" >
				<label for="check_all_2">
				<input type="checkbox" id="check_all_2" class="normal">	
				<i class="check-icon" ></i>			
					<span>[선택] 광고성 정보 수신에 모두 동의합니다.</span>
				</label>
			</div>
			<!-- <button type="button" id="main_btn2" class="btn"><img></button> -->
			<img class="btn" id="main_btn2" src="https://i.imgur.com/DOosbxM.png" alt=""/>
		</div>
				
		<div class="checkbox_sub" id="checkbox_sub2" style="display:none">
			<div class="checkbox_item">
				<label for="check_all_1_1">
				<input type="checkbox" id="check_all_1_1" class="checkbox_sub2">
				<i class="check-icon"></i>
					<span>앱 푸시</span>
				</label>
			</div>
					
			<div class="checkbox_item">
				<label for="check_all_1_2">
					<input type="checkbox" id="check_all_1_2" class="checkbox_sub2">
					<i class="check-icon" ></i>
					<span>문자 메시지</span>
				</label>
			</div>
					
			<div class="checkbox_item">
				<label for="check_all_1_3">
					<input type="checkbox" id="check_all_1_3" class="checkbox_sub2">
					<i class="check-icon" ></i>
					<span>이메일</span>
				</label>
			</div>
					
		</div>
		
		<input type="submit" id="regist_submit" value="가입" disabled="">
	</form>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
	
	
	$('.modal_btn').click(function(){
		$('.layer').removeClass('hidden');
	})
	
	$('.btn_layer_close').click(function(){
		$('.layer').addClass('hidden');
	})
	
	$('.layer').click(function(){
		$('.layer').addClass('hidden');
	})
	

	$("#check_all_1").click(function(){
		$('.checkbox_sub1:not(:disabled)').not(this).prop('checked', this.checked);
		judgeSubmit();
	})
	
	$(".checkbox_sub1").click(function(){
		if($(".checkbox_sub1:not(:disabled)").length == $('.checkbox_sub1:checked').length) {
			$('#check_all_1').prop('checked', true);
		}
		else {
			$('#check_all_1').prop('checked', false);
		}
	})
	
	$("#check_all_2").click(function(){
		$('.checkbox_sub2:not(:disabled)').not(this).prop('checked', this.checked);
	})
	
	$(".checkbox_sub2").click(function(){
		if($(".checkbox_sub2:not(:disabled)").length == $('.checkbox_sub2:checked').length) {
			$('#check_all_2').prop('checked', true);
		}
		else {
			$('#check_all_2').prop('checked', false);
		}
	})
	


	$("#main_btn").click(function() {
		if($("#checkbox_sub1").is(":visible")) {
			$("#checkbox_sub1").css("display", "none");
			$("#main_btn").attr("src", "https://i.imgur.com/DOosbxM.png");
			
		}else{
			$("#main_btn").attr("src", "https://i.imgur.com/12D1zk2.png");
			$("#checkbox_sub1").css("display", "block");
		}
		
		
	}); 
	
	$("#main_btn2").click(function() {
		if($("#checkbox_sub2").is(":visible")) {
			$("#main_btn2").attr("src", "https://i.imgur.com/DOosbxM.png");
			$("#checkbox_sub2").css("display", "none");
		}else{
			$("#main_btn2").attr("src", "https://i.imgur.com/12D1zk2.png");
			$("#checkbox_sub2").css("display", "block");
		}
		
	});
	


	var idpass = false;
	function funcCheckEmail(){
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		var color;
		var ans;
		
		var email = $('input[name=email]').val();
		if(reg_email.test(email)){
			$.ajax({
				url:'emailCheck?userEmail='+email,
				type:'GET',
				success:function(data){
					if (data > 0) {
						ans = '이미 사용중인 이메일입니다.';
						color = 'red';
						idpass = false;
					}else{
						ans = '';
						color = 'black';
						idpass = true;
					}
					$('#checkEmailMsg').text(ans);
					$('#checkEmailMsg').css('color', color);
					$('input[name=email]').css('border-bottom-color', color);
				}
			})			
		 } else {
			ans = '이메일 주소를 정확히 입력해주세요';
			color ='red';
			$('#checkEmailMsg').text(ans);
			$('#checkEmailMsg').css('color', color);
			$('input[name=email]').css('border-bottom-color', color);
		}
		judgeSubmit();
	}                 


	var pwpass;
	function funcCheckPw() {
		var pwRegex = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		var pw = $('input[name=pw]').val();
		var color;
		var ans;
		
		if(!pwRegex.test(pw)) {
			ans = '영문, 숫자, 특수문자를 조합하여 입력해주세요 (8~16자)';
			color ='red';
			pwpass = false;
		}
		else {
			ans = '';
			color = '';
			pwpass = true;
		}
		$('#checkPwMsg').text(ans);
		$('#checkPwMsg').css('color', color);
		$('input[name=pw]').css('border-bottom-color', color);
		$('intput[type=submit]').css('background-color', color);
		
		judgeSubmit();
	}
	
	
	function judgeSubmit() {
		if(idpass && pwpass && $('#check_all_1').prop("checked") ) {
			SbmEnabled();
		} else {
			SbmDisabled();
		}
	}
	
	function SbmDisabled() {
		//console.log('sbmDisabled')
		$('#regist_submit').attr('disabled', true);
		$('#regist_submit').css('background-color', '#cecece');
	}
	
	function SbmEnabled() {
		//console.log("sbmEnabled")
		$('#regist_submit').attr('disabled', false);
		$('#regist_submit').css('background-color', 'black');
	}
	
	/*
	 $('#check_all_1').click(function() {
		console.log(idpass);
		if ($(this).prop("checked") == true && idpass && pwpass) {
			console.log("true")
			$('#regist_submit').attr('disabled', false);
			$('#regist_submit').css('background-color', 'black');
		}
		else {
			$('#regist_submit').attr('disabled', true);
			$('#regist_submit').css('background-color', '#cecece');
		}
	});
	*/
	

	

	
	
	
</script>
<%@ include file="../footer.jsp" %>