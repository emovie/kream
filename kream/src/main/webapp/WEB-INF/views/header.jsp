<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KREAM</title>
	<link rel="stylesheet" href="${cpath }/resources/css/style.css">
</head>
<body>
    <header>
        <div class="top">
            <nav>
                <a href="#">고객센터</a>
                <a href="#">관심상품</a>
                <a href="#">마이페이지</a>
                <a href="#">로그인</a>
                <!-- 로그인 세션 있을 경우 로그아웃으로 텍스트 변경 (로그인 기능 구현 후 작성必) -->
            </nav>
        </div>
        <div>
            <h1><a href="${cpath }">KREAM</a></h1>
            <nav>
                <a href="#">STYLE</a>
                <a href="#">SHOP</a>
                <a href="#">ABOUT</a>
                <div class="searchBtn"></div>
            </nav>
        </div>
    </header>
    
    <div class="searchWrap hidden">
        <div class="searchContainer">
            <div class="searchArea">
                <div></div><input type="search" placeholder="브랜드명,모델명,모델번호 등">
            </div>
            <button class="cancelBtn">취소</button>
        </div>
        <div class="recommandItem">
            <div>1</div>
            <div>2</div>
            <div>3</div>
            <div>4</div>
            <div>5</div>
            <div>6</div>
        </div>
    </div>
    <div class="overlay hidden""></div>
    
    <script>
	    const searchBtn = document.querySelector('.searchBtn')
	    const search = document.querySelector('.searchWrap')
	    const overlay = document.querySelector('.overlay')
	    const searchCancel = document.querySelector('.cancelBtn')
	
	    searchBtn.onclick = function() {
	        search.classList.remove('hidden')
	        overlay.classList.remove('hidden')
	    }
	
	    overlay.onclick = function() {
	        search.classList.add('hidden')
	        overlay.classList.add('hidden')
	    }
	    searchCancel.onclick = function() {
	        search.classList.add('hidden')
	        overlay.classList.add('hidden')
	    }
    </script>
    