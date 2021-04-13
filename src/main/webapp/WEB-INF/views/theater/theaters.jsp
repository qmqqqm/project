<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--   jstl를 사용하기위한 taglib 지시어--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>theaters</title>
<style>
	ul{
		list-style:none;
	}
	li{
		display:inline;
	}
</style>
<script src="https://code.jquery.com/jquery-2.2.1.js"></script>
<script>
	$(function (){
		
		$(".location").click(function(){
			$("#location_name").empty();
			<c:forEach  var="theaters"  items="${theaters}">
				if ($(this).text() == "${theaters.theater_location}") { 
					var str = "<li><button type='button'>" + "${theaters.theater_name}" + "</button></li>";
			    	$("#location_name").append(str);
				} 
			</c:forEach>
		})
		
	
	});
</script>
</head>
<body>
<hr>

	
	<hr>
	<ul>
		<c:forEach  var="location"  items="${location}">
		<li><button type="button" class="location">${location}</button></li>
		</c:forEach>
	</ul>
	
	<hr>
	<ul id = "location_name">
	</ul>
<hr>

</body>
</html>