<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- pageContext를 이용하여 request객체를 얻고 얻어진 request객체를 이용하여   contextPath를 얻어 변수에 저장
<c:set var="변수명"       value="값" />  --%>        
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main부분</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	h2 {text-align:center;}
	.no-unerline {text-decoration:none; /*밑줄없애기*/}
</style>
<script>
$(function(){
});
</script>	
</head>
<body>
	<h2>main.jsp</h2>
	<h3>메인 페이지예요!!</h3>
</body>
</html>










