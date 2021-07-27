<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {		
		font-weight: bold;
	}
	div.katagorie {
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
		width: 960px;
		display: flex;
		padding-left: 6px;
		padding-right: 6px;	
		justify-content: flex-start;
		flex-wrap: wrap;		
		margin-right: 0;
	}
	div.katagorie > div {
		border: 1px solid black;
	}
	ul.kategorie1 {
		display: flex;		
	}
	ul.kategorie2 {
		display: list-item;		
		width: 250px;
	}
	li {
		list-style: none;
		margin-left: 40px;
		cursor: pointer;	
	}
	ul.kategorie2 > li {
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
		width: 231px;
		height: 353px;
		margin-left: 3px;
		margin-bottom: 40px;
	}
	div.product_img {		
		width: 213px;
		height: 213px;				
	}
</style>
</head>
<body>

<!-- 브랜드? 큰 카테고리 -->
<div>
	<ul class="kategorie1">
		<li>
			<img src="https://kream-phinf.pstatic.net/MjAyMTA1MjZfOTQg/MDAxNjIyMDI0MTM3MzI5.t26Ls40IwBtfC9TFzUvC5yRLoae4sYf1BzNGQFSOY58g.apdLq7biCgFViqXSkOBX6KsBaJMWbVm9a2MnLjzsYDIg.PNG/p_f813766f0c694f138ea7f56acaefc4d2.png" alt="Jordan 1">
			<p>Jordan 1</p>
		</li>
		<li>
			<img src="https://kream-phinf.pstatic.net/MjAyMTA3MDJfMjg3/MDAxNjI1MjI2MjM3NTUx.dMU9QJTzGwfJMXwk6MH5oMfCcUnDUxb-iV3ZURLhyHog.k8WOOqonlxb3U6WecuNjpPGYrQyxh7N8_SCaaqUS83Ug.PNG/p_4f213a0866354fa39e72f459f3374589.png" alt="지갑">
			<p>지갑</p>
		</li>
		<li>
			<img src="https://kream-phinf.pstatic.net/MjAyMTA0MDlfMjI5/MDAxNjE3OTU0NzEyODQ1.sbIVaYXvZJMWcy77AFAF6M8XTEUvgMK1ufBgnIDtfXEg.5moF7jzHWbCi4jb4ZLJVVNmm2zNJ6v6k3HOrpj2NE4Ig.PNG/p_7a30ca3381504b60a57788c71dc09494.png" alt="Dunk">
			<p>Dunk</p>
		</li>
		<li>
			<img src="https://kream-phinf.pstatic.net/MjAyMTA2MjhfMTYy/MDAxNjI0ODQ5NTEwMTgw.rdabG9mfWvxgq5d8ApDZrlGnUpO2dGatJXJnBmThKn8g.EwtpyMMnSdo8PwL8bd68G4QelzpSC-fn_Tdkbux2SdMg.PNG/d_f4f11d8a3f8945499a0a547664bf0a74.png" alt="유니온">
			<p>유니온</p>
		</li>
		<li>
			<img src="https://kream-phinf.pstatic.net/MjAyMTA2MjNfMjc1/MDAxNjI0NDM3MjAyMzc2.3MmQ4qiDY0InTOokNabXo1lW1jQ0UjLBBRa9CV8Wnb8g.UTvwUj0z2oQcaelfhFdc2YVWFSrCjHg9oSGQdYQMXAMg.PNG/d_7471cb4db023420c8f6e4183a7e6fe36.png" alt="YEEZY">
			<p>YEEZY</p>
		</li>
		<li>
			<img src="https://kream-phinf.pstatic.net/MjAyMTA2MjFfMjU4/MDAxNjI0MjQxMjMzNjcx.FSSr64oYupdRK2J15HdOmkAEeFlBn80r0lBP_Mrm-B8g.HqfQGPewoc_fQkXQJuRsjM0jMJEqXyVff_GOuy1RtBAg.PNG/d_561597b7668c4efc910cd9f649597da3.png" alt="메종키츠네">
			<p>메종키츠네</p>
		</li>
		<li>
			<img src="https://kream-phinf.pstatic.net/MjAyMTA2MTBfODgg/MDAxNjIzMjU3MDM1OTk4.FjQCM_lleVlUSMB4n0SnAYC2IVkX6NMNEe06n-b0CTcg.jtxlzocLcyMrs6H7tbx4PN0Bsf52YPgohtBr6wqnaQUg.PNG/p_0141f0539fe44feeb196105851bd14b5.png" alt="사카이">
			<p>사카이</p>
		</li>
		<li>
			<img src="https://kream-phinf.pstatic.net/MjAyMTA2MDRfNjcg/MDAxNjIyNzc0NTMzMDU5.dyxks6TGOfZKtnM6uTkK2i1t2qglOLteksXVXMUM614g.X0C2X2qrJT7Y_W6ZwuPZk4iyq5k1EGXFASdJOQ5YJisg.PNG/p_8f5a99c319fb43d289df2d374f1ffdca.png" alt="Helinox">
			<p>Helinox</p>
		</li>
		<li>
			<img src="https://kream-phinf.pstatic.net/MjAyMTA0MDVfMjI2/MDAxNjE3NjI3ODUzMTMy.4E6bM2Yd6OSBaQe-PVVtb0WQps6XF2MmPUS7aok78hcg.zj45thbWbnjkUTQANtsla25Je0hWH9iTtNWXuic2GXEg.PNG/p_432fa9b37812420d9236ecebec133262.png" alt="마르지엘라">
			<p>마르지엘라</p>
		</li>
		<li>
			<img src="https://kream-phinf.pstatic.net/MjAyMTA0MjFfMjcg/MDAxNjE4OTk2NjM3NjQ2.SlDGBuYhWneQvKAXTvFbx8oEnIc2EOxhqoUxamfnhp8g.K4NYEub3LrPSJmhy7vMlupVUPSJpiCpAINtDjEUdZxAg.PNG/p_c5d3eb8f8b5d425dbcd7d947d5d25067.png" alt="PS5">
			<p>PS5</p>
		</li>
	</ul>
</div>

<div class="kategorie" style="display: flex;">
	<!-- 상품 필터 -->
	<div class="fiter">
		<div>필터</div>
		<div>			
			<details>
			<summary>카테고리</summary>
				<ul class="kategorie2">
					<li><input type="checkbox">스니커즈</li>
					<li><input type="checkbox">의류</li>
					<li><input type="checkbox">패션 잡화</li>
					<li><input type="checkbox">테크</li>
					<li><input type="checkbox">라이프</li>
				</ul>
			</details>
		</div>
		<div>			
			<details>
			<summary>브랜드</summary>
				<ul class="kategorie2">
					<li><input type="checkbox">Acne Studios</li>
					<li><input type="checkbox">Adidas</li>
					<li><input type="checkbox">Alexander McQueen</li>
					<li><input type="checkbox">AMI</li>
					<li><input type="checkbox">Anti Social Social Club</li>
					<li><input type="checkbox">Asics</li>
					<li><input type="checkbox">Balenciaga</li>
					<li><input type="checkbox">BAPE</li>
					<li><input type="checkbox">Bottega Veneta</li>
					<li><input type="checkbox">Burberry</li>
					<li><input type="checkbox">Celine</li>
					<li><input type="checkbox">Chanel</li>
					<li><input type="checkbox">Clarks</li>
					<li><input type="checkbox">Common Projects</li>
					<li><input type="checkbox">Converse</li>
					<li><input type="checkbox">Crocs</li>
					<li><input type="checkbox">Dior</li>
					<li><input type="checkbox">Dr. Martens</li>
					<li><input type="checkbox">FOG Essentials</li>
					<li><input type="checkbox">Golden Goose</li>
					<li><input type="checkbox">Goyard</li>
					<li><input type="checkbox">Gucci</li>
					<li><input type="checkbox">Helinox</li>
					<li><input type="checkbox">Hermes</li>
					<li><input type="checkbox">Hoka One One</li>
					<li><input type="checkbox">IAB Studio</li>
					<li><input type="checkbox">Jordan</li>
					<li><input type="checkbox">Maison Kitsune</li>
					<li><input type="checkbox">Maison Margiela</li>
					<li><input type="checkbox">Microsoft</li>
					<li><input type="checkbox">Mihara Yasuhiro</li>
					<li><input type="checkbox">Mizuno</li>
					<li><input type="checkbox">New Balance</li>
					<li><input type="checkbox">Nike</li>
					<li><input type="checkbox">Nintendo</li>
					<li><input type="checkbox">Nvidia</li>
					<li><input type="checkbox">Off-White</li>
					<li><input type="checkbox">Oofos</li>
					<li><input type="checkbox">Palace</li>
					<li><input type="checkbox">Play Comme des Garcons</li>
					<li><input type="checkbox">Prada</li>
					<li><input type="checkbox">Puma</li>
					<li><input type="checkbox">Reebok</li>
					<li><input type="checkbox">Saint Laurent</li>
					<li><input type="checkbox">Salomon</li>
					<li><input type="checkbox">Sony</li>
					<li><input type="checkbox">Starbucks</li>
					<li><input type="checkbox">Stone Island</li>
					<li><input type="checkbox">Stussy</li>
					<li><input type="checkbox">Supreme</li>
					<li><input type="checkbox">Thom Browne</li>
					<li><input type="checkbox">Valentino</li>
					<li><input type="checkbox">Vans</li>
					<li><input type="checkbox">Y-3</li>
				</ul>
			</details>
		</div>
		<div>
			<details>
			<summary>컬렉션</summary>
				<ul class="kategorie2">
					<li><input type="checkbox">Jordan 1</li>
					<li><input type="checkbox">Jordan 3</li>
					<li><input type="checkbox">Jordan 4</li>
					<li><input type="checkbox">Jordan 5</li>
					<li><input type="checkbox">Jordan 6</li>
					<li><input type="checkbox">Jordan 11</li>
					<li><input type="checkbox">Jordan 13</li>
					<li><input type="checkbox">Nike Dunk</li>
					<li><input type="checkbox">Nike Air Force</li>
					<li><input type="checkbox">Nike Air Max 1</li>
					<li><input type="checkbox">Nike Air Max 95</li>
					<li><input type="checkbox">Nike Air Max 97</li>
					<li><input type="checkbox">Nike Air Vapormax</li>
					<li><input type="checkbox">Nike Daybreak</li>
					<li><input type="checkbox">Nike Uptempo</li>
					<li><input type="checkbox">Nike Kobe</li>
					<li><input type="checkbox">Nike Blazer</li>
					<li><input type="checkbox">New Balance 237</li>
					<li><input type="checkbox">New Balance 327</li>
					<li><input type="checkbox">New Balance 530</li>
					<li><input type="checkbox">New Balance 990</li>
					<li><input type="checkbox">New Balance 991</li>
					<li><input type="checkbox">New Balance 992</li>
					<li><input type="checkbox">New Balance 993</li>
					<li><input type="checkbox">New Balance 1300</li>
					<li><input type="checkbox">New Balance 2002</li>
					<li><input type="checkbox">Converse Run Star</li>
					<li><input type="checkbox">Converse Chuck 70</li>
					<li><input type="checkbox">Adidas Yeezy</li>
					<li><input type="checkbox">Adidas Superstar</li>
					<li><input type="checkbox">x Off-White</li>
					<li><input type="checkbox">x Travis Scott</li>
					<li><input type="checkbox">x Sacai</li>
					<li><input type="checkbox">x Undercover</li>
					<li><input type="checkbox">x Supreme</li>
					<li><input type="checkbox">x Stussy</li>
					<li><input type="checkbox">x Fear of God</li>
					<li><input type="checkbox">x Peaceminusone</li>
					<li><input type="checkbox">Luxury Collection</li>
				</ul>
			</details>
		</div>
		<div>
			<details>
			<summary>스니커즈 사이즈</summary>
				<ul class="kategorie2">
					<li>미구현</li>
				</ul>
			</details>
		</div>
		<div>
			<details>
			<summary>의류 사이즈</summary>
				<ul class="kategorie2">
					<li>미구현</li>
				</ul>
			</details>
		</div>
		<div>
			<details>
			<summary>가격</summary>
				<ul class="kategorie2">
					<li>미구현</li>
				</ul>
			</details>
		</div>
	</div>
	<!-- 상품 목록 -->
	<div class="product">
		<c:forEach var="dto" items="${list }">
			<div class="product_list">				
				<!-- 상품 사진 -->
				<div class="product_img" style="background-color: rgb(235, 240, 245);"><img src="${dto.img }" style="width: 100%; height: 100%;"></div>
				<!-- 상품 내용 -->
				<div>					
					<p>${dto.brand }</p>
					<p>${dto.productname }</p>
					<p>${dto.price }</p>
				</div>				
			</div>
		</c:forEach>
	</div>
</div>









</body>
</html>

