<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<h1>SHOP</h1>


<c:forEach var="dto" items="${list }">
	<div>${dto.productName }</div>
</c:forEach>


<%@ include file="footer.jsp" %>