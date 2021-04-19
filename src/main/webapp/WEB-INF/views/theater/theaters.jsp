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
<script src="jquery-3.5.1.min.js"  type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"  type="text/javascript"></script>
<script>
	$(function (){
		var id = "";
		
		$(".location").click(function(){
			$("#location_name").empty();
			<c:forEach  var="theaters"  items="${theaters}">
				if ($(this).text() == "${theaters.theater_location}") { 
					var str = "<li><button type='button' name='th_name'>" + "${theaters.theater_name}" + "</button></li>";
			    	$("#location_name").append(str);
					
					} 
			</c:forEach>
		}); //$(".location").click()
		
		$(document).on("click","button[name='th_name']",function(){
			$("#th_inform").empty();
			var theater = $(this).text();
			<c:forEach  var="theaters"  items="${theaters}">
				if (theater == "${theaters.theater_name}") { 
			    	var inform = "${theaters.theater_address}" +"<br>" + 
			    	 			 "${theaters.theater_phone}" +"<br>";
			    	
			    	$("#th_inform").append(inform);
			    	
			    	id = ${theaters.theater_id};
			    	
			    	$.ajax({
			             
			            type : "get",
			            url : "./theaterInform.do",
			            data : {"id" :"${theaters.theater_id}"},
			            dataType:"json",
			            error : function(){
			            	alert("에러!");
			                alert("error:"+error);
	
			                 },
			            success : function(data){
			            	
			               var i = data.totSangygDTO;
			   
			               var s = i.totSangyg_id + "관/";
			               	s += i.totSangyg_seats + "석<br>";
			                $("#th_inform").append(s);
			            }
			             
			        });
			    	
				} 
			</c:forEach>
			
			//영화관 이미지와 관련된 코드
			
			//상영시간표 날짜 계산하기
			$("#calendar").empty();
			var today = new Date();
			var date ="<button type='button'>-</button>";
			for(var i = 0; i < 7; i++)
			{
				var day = today.getDate()+i;
				date += "<li><button type='button' name='days'>" + day + "</button></li>";
			}
			date += "<button type='button'>+</button>";
			$("#calendar").append(date);
		
			//시간을 누르면 상영t시간표
			$(document).on("click","button[name='days']",function(){	
				var day = $(this).text();
				
				var movie_list=null;
				$.ajax({
		            type : "get",
		            url : "./theaterTimes.do",
		            data : {"id" :id, "day": day},
		            dataType:"json",
		            error : function(){
		            	alert("에러!");
		           },
		            success : function(data){
		            	alert("성공!");
		            	
		            	var time = data.times;
		      			var movie = data.movieInform;
		      			var sangyg = data.sangygInform;
		      			
		      			
		      			var movieInform = "";
		      			var sangygInfrom ="";
		      			
		      			for(i = 0; i < movie.length; i++){
		      				alert(i);
		      				
		      				//영화 정보 가져오기
		      				movieInform = movie[i].movie_rating + " ";
		      				movieInform += "<a href=''>"+ movie[i].movie_title + "</a> ";
		      				movieInform += "[상영중]" + movie[i].movie_genre + " / ";
		      				movieInform += movie[i].movie_time + " / ";
		      				movieInform += movie[i].movie_Date + " 개봉 <br>";
		      				
		      				$("#mainTimes").append(movieInform);
		      			
		      				
		      				//상영관 별로 
		      				sangygInform = "**";
		      				
		      				for(j = 0; j < time.length; j++){
		      					if(movie[i].movie_id == time[j].movie_id){
		      						var imsi = new Array();
		      						imsi.push(time[j].sangyg_id);
		      						
		      					}
		      				}
		      				
		      				
		      				for(i = 0; i< count; i++){
		      					
		      				}
		      					
		      				
		      				
		      				
		      			}
		            	
		            
		            }
				  });
				
				
		});   	
		
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
	
	
	<div id="th_inform">
		<img src=""/>
	</div>
	
	<hr>
	
	<h1>상영시간표</h1>
	
	<hr>
	
	<ul id="calendar">
	
	</ul>
	<div id="mainTimes">
	
	</div>
</body>
</html>