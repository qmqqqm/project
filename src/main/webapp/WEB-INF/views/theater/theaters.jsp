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
		margin-right:10px;
	}
	button{
		border:none;
		background:white;
	}
</style>
<script src="https://code.jquery.com/jquery-2.2.1.js"></script>
<script>
	$(function (){
		
		$(".location").click(function(){
			$("#location_name").empty();
			<c:forEach  var="theaters"  items="${theaters}">
				if ($(this).text() == "${theaters.theater_location}") { 
					var str = "<li><button type='button' name='th_name'>" + "${theaters.theater_name}" + "</button></li>";
			    	$("#location_name").append(str);
					
					} 
			</c:forEach>
		});
		
		$(document).on("click","button[name='th_name']",function(){
			$("#th_inform").empty();
			var theater = $(this).text();
			<c:forEach  var="theaters"  items="${theaters}">
				if (theater == "${theaters.theater_name}") { 
			    	var inform = "${theaters.theater_address}" +"<br>" + 
			    	 			 "${theaters.theater_phone}" +"<br>";
			    	$("#th_inform").append(inform);

			    	$.ajax({
			             
			            type : "get",
			            url : "./theaterInform.do",
			            data : {"id" :"1"},
			            error : function(){
			                alert('통신실패!!');
			            },
			            success : function(data){
			                alert("정보가져오기 성공했습니다~" + data) ;
			                location.reload();
			            }
			             
			        }); 
				} 
			</c:forEach>
			
		});
		
	
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

<h1>Theater</h1>

<hr>

<img src=""/>
<div id="th_inform">
</div>
</body>
</html>