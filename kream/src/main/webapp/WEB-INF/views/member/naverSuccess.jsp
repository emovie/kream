<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript"
  src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
  charset="utf-8"></script>
<script type="text/javascript"
  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
  $(document).ready(function() {
	console.log(${result})  
    var name = ${result}.response.name
    var email = ${result}.response.email
    $("#name").html("환영합니다. "+name+"님")
    })
  //location.href = "${cpath}/"
</script>
  <br>
  <h2 style="text-align: center" id="name"></h2>
  <h4 style="text-align: center" id="email"></h4>
  <script>
    $(function () {
      $("body").hide()
      $("body").fadeIn(1000)   
     
      setTimeout(function(){$("body").fadeOut(1000)},1000)
      setTimeout(function(){location.href= "${cpath}/"},2000)

    })
  </script>
  
</body>
</html>