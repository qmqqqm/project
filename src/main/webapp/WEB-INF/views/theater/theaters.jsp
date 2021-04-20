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
	.timeBtn{
		border:1px solid blue;
	}
</style>
<script src="jquery-3.5.1.min.js"  type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"  type="text/javascript"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
$(function (){
	var id = "";
	
	//지역을 누르면 지역별 영화관 생성
	$(".location").click(function(){
		$("#location_name").empty();
		<c:forEach  var="theaters"  items="${theaters}">
			if ($(this).text() == "${theaters.theater_location}") { 
				var str = "<li><button type='button' name='th_name'>" + "${theaters.theater_name}" + "</button></li>";
		    	$("#location_name").append(str);
				
				} 
		</c:forEach>
	}); //$(".location").click()
	
	//영화관을 선택하면,
	$(document).on("click","button[name='th_name']",function(){
		$("#th_inform").empty();
		var theater = $(this).text();
		<c:forEach  var="theaters"  items="${theaters}">
			if (theater == "${theaters.theater_name}") { 
		    	var theater_inform = "${theaters.theater_address}" + "<br>" + 
		    	 			 		 "${theaters.theater_phone}" + "<br>";
		    	
		    	$("#th_inform").append(theater_inform);
		    	
		    	id = ${theaters.theater_id};
		    	
		    	$.ajax({             
		            type : "get",
		            url : "./theaterInform.do",
		            data : {"id" :"${theaters.theater_id}"},
		            dataType:"json",
		            error : function(){
		            	alert("에러!");
		            },
		            success : function(data){	
		               var i = data.totSangygDTO;
		               var s = i.totSangyg_id + "관/";
		               	s += i.totSangyg_seats + "석<br>";
		                $("#th_inform").append(s);
		            }
		             
		        });//$.ajax-> Sangyg 테이블을 사용하여 총 상영관 개수와 좌석 수를 가져온다.
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
	});// 영화관을 선택하면!!
	
	//날짜를 누르면 해당 영화관, 날짜에 맞는 상영시간표 나오는 function
	$(document).on("click","button[name='days']",function(){	
		var day = $(this).text();
		var movie_list=null;
		
		$("#mainTimes").empty();
	
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
      			
      					//6,2,3
      			var movieInform = "";
      			var sangygInfrom ="";
      			
      			for(i = 0; i < movie.length; i++){
      				//영화 정보 가져오기
      				movieInform = movie[i].movie_rating + " ";
      				movieInform += "<a href=''>"+ movie[i].movie_title + "</a> ";
      				movieInform += "[상영중] " + movie[i].movie_genre + " / ";
      				movieInform += movie[i].movie_time + " / ";
      				movieInform += movie[i].movie_Date + " 개봉 <br>";
      				$("#mainTimes").append(movieInform);
      				
      				var timeid_list = new Array();//같은영화의 times_id를 저장해두는 list
  					var sangygid_set = new Set();//같은영화의 sangyg_id 저장해두는 set
      				for(j = 0; j < time.length; j++){
      					if(time[j].movie_id == movie[i].movie_id){
      						timeid_list.push(time[j].times_id);
      						sangygid_set.add(time[j].sangyg_id);
      					}	
      				}
  					
  					//상영관 별로 정보 저장  
  					for (var value of sangygid_set) {
  						//상영관 정보 저장하기
  						var sangygInform = "";
  						for(j=0; j<sangyg.length; j++){
  							if(sangyg[j].sangyg_id == value){
  									sangygInform += "**";
  									sangygInform += sangyg[j].sangyg_name + " | ";
  									sangygInform += sangyg[j].sangyg_id + "관 | ";
  									sangygInform += "총 " + sangyg[j].sangyg_seats + "석<br>";
  							}	
  						}//for(j=0; j<sangyg.length; j++)
  						$("#mainTimes").append(sangygInform);
  						//상영관 별로 시간 정보 저장하기
  						var timeInform="";
  						for(z=0; z<time.length; z++)
  						{
  							if(time[z].movie_id == movie[i].movie_id && time[z].sangyg_id == value){
  								timeInform += "<li><button class='timeBtn'>" + moment(time[z].times_time).format("HH:mm") + "<br>" + time[z].times_seat + "석</button></li>";
  							}
  						}
  						timeInform += "<br>";
  						$("#mainTimes").append(timeInform);
					}	
      				
      			}//for(i = 0; i < movie.length; i++)
            }//success
		  })//ajax
	});//날짜를 누르면 해당 영화관, 날짜에 맞는 상영시간표 나오는 function   	
		
});//전체 function
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