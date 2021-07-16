<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>

<!------------------------------------------------------------------------------------------------------------------->
<!-- 
	bottom Banner 없는 버전의 footer입니다.
	메인페이지와 SHOP 페이지에서는 footer.jsp가 사용됩니다.
	
	나머지 페이지는 footer2.jsp가 사용되니, 각 페이지에 맞는 footer를 사용해주세요.
-->
<!------------------------------------------------------------------------------------------------------------------->

	<div class="topline"></div>
    <footer>
        <div class="f-top">
            <div> 
                <div>
                    <h4>이용안내</h4>
                    <ul>
                        <li>검수기준</li>
                        <li>이용정책</li>
                        <li>페널티 정책</li>
                        <li>커뮤니티 가이드라인</li>
                    </ul>
                </div>
                <div>
                    <h4>고객지원</h4>
                    <ul>
                        <li>공지사항</li>
                        <li>서비스 소개</li>
                        <li>쇼룸 안내</li>
                        <li>판매자 방문접수</li>
                    </ul>
                </div>
            </div>
            <div>
                <h4>고객센터 1588-7813</h4>
                <pre>운영시간 평일 11:00 - 18:00 (토 ∙ 일, 공휴일 휴무)
점심시간 평일 13:00 - 14:00
<span>1 : 1 문의하기는 앱에서만 가능합니다.</span></pre>
                <button>자주 묻는 질문</button>
            </div>
        </div>
        
        <div class="bottomline"></div>
        <div class="f-bottom">
            <div>
                <div class="policy">
                    <div><a href="${cpath }/policy/privacy">개인정보처리방침</a></div>
                    <div><a href="${cpath }/policy/agreement">이용약관</a></div>
                </div>
                <div class="sns">
                    <a href="https://www.instagram.com/kream.co.kr/"><div></div></a>
                    <a href="https://www.facebook.com/kreamcokr"><div></div></a>
                    <a href="https://pf.kakao.com/_adpxlxb"><div></div></a>
                </div>
            </div>

            <div class="copyright">
                <p>
크림(주)는 통신판매 중개자로서 통신판매의 당사자가 아니므로 개별 판매자가 등록한 상품정보에 대해서 책임을 지지 않습니다.<br>
단, 거래과정에서 검수하고 보증하는 내용에 대한 책임은 당사에 있습니다.</p>
                <p><br>© 2021 KREAM.Corp.</p>
            </div>
        </div>
    </footer>
</body>
</html>