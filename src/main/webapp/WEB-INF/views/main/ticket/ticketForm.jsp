<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<style>
.movie{
width:26%;
height:500px;
float: left;
border:1px solid black;
margin:10px 1px;
} 
.theaters{
width:26%;
height:500px;
float: left;
border:1px solid black;
margin:10px 1px;
}
.local{
float: left;
width:40%;
}
.localsub{
width:55%;
float: left;
}
.day{
width:10%;
height:500px;
float: left;
border:1px solid black;
margin:10px 1px;
}
.time{
width:35%;
height:500px;
float: left;
border:1px solid black;
margin:10px 1px;
} 
.bottombar{
	clear: both;
	height:100px;
	background:black;
}
.title{
	text-align: center;
	font-size:15px;
	color:white;
	background: black;
	padding:5px 0;
}
.bottombarmovie{
width:25%;
height:60px;
border-right: 1px solid white;
margin : 20px 0;
font-size:25px;
font-weight:900;
text-align:center;
float: left;
}
.bottombarselect{
width:25%;
height:60px;
border-right: 1px solid white;
margin : 20px 0;
font-size:25px;
font-weight:900;
text-align:center;
float: left;
}
.bottombarpay{
width:25%;
height:60px;
margin : 20px 0;
font-size:25px;
font-weight:900;
padding:0 10px;
float: left;
}
.bottomcount{
width:21%;
height:60px;
margin-right:0;


float: right;
}
</style>
 <script src="/webjars/jquery/2.2.1/jquery.min.js"></script> 
<script>

$(function(){ 
	

	/* 극장위치 선택  */
	$(".location").on("click",function(){
		$.ajax({
        type:"POST",
        url:"./theaterchoice.do",
        data : {'name' : $(this).text()},
        dataType : "json",
        success: function(theater){
        	$("#theater_name").empty();
        	 for(var i=0;theater.theaterchoice.length;i++){                            
                 var h = theater.theaterchoice[i].theater_name;
                 var str = "<div class='theaterCho' ><span class='theaterTxt' onclick='selecttheater(this)'>"+h+"</span><input class='theaterCode' type='hidden' value='"+h+"'></div>"
                 $("#theater_name").append(str);
        	 }
        },//success
        error: function(xhr, status, error) {
            alert("11111111");
       	}//error  
    	});//ajax
	})//on

		
		//오늘 날짜
		var today = new Date();   

		var year = today.getFullYear(); // 년도
		var month = today.getMonth() + 1;  // 월
		var date = today.getDate();  // 날짜
		var dayA = today.getDay();  // 요일
		
		var day1 = year + '-' + month + '-' + date;
		
		//20일 후 날짜
		var oneMonthLater = new Date(today.setDate(today.getDate() + 20));	
		
		var year2 = oneMonthLater.getFullYear(); // 년도
		var month2 = oneMonthLater.getMonth() + 1;  // 월
		var date2 = oneMonthLater.getDate();  // 날짜
		var dayB = oneMonthLater.getDay();  // 요일
		
		var day2 = year2 + '-' + month2 + '-' + date2;
		
			
//	 	var res_day = [];
		var dayTxt = ["일","월","화","수","목","금","토"];
	 	var ss_day = new Date(day1);
	   	var ee_day = new Date(day2);
	   		var monthTxt = '';
	  		while(ss_day.getTime() <= ee_day.getTime()){
	  			var _mon_ 	= (ss_day.getMonth()+1);
	  			
	  			if(monthTxt  != _mon_){
	  				monthTxt = _mon_;
	  				var innerHtml = "<div><div><span>"+_mon_+"월</span>"+"</div></div>";
	  				$(".reserve-date").append(innerHtml);
	  			}
	  			
	  			_mon_ 		= _mon_ < 10 ? '0'+_mon_ : _mon_;
	  			var _day_ 	= ss_day.getDate();
	  			_day_ = _day_ < 10 ? '0'+_day_ : _day_;
				var todayTxt = ss_day.getFullYear() + '-' + _mon_ + '-' +  _day_ + '-' + dayTxt[ss_day.getDay()];
				var todayTxtList = todayTxt.split("-");
				
				var todayYearTxt = todayTxtList[0];
				var todayMonthTxt = todayTxtList[1];
				var todayDateTxt = todayTxtList[2];
				var todayDayTxt = todayTxtList[3];
				
				var innerHtml2 = "<div>";
				innerHtml2 += "<p class='dayCho' onclick='selectday(this)'"; 
				innerHtml2 += "id='"+todayYearTxt+todayMonthTxt+todayDateTxt+"');"; 
				innerHtml2 += ">"+todayDayTxt+" "+todayDateTxt+"</p>"; 
				innerHtml2 += "</div>"; 
				
				$(".reserve-date").append(innerHtml2);
				
	   			ss_day.setDate(ss_day.getDate() + 1);
	   	}
	
	function setDayInfo(day){
		$('#dayInfo').val(day);
	}
	

});//jqury
var selectmoviename;
var selecttheatername;
var selectdayname;
function selectmovie(movie){
	var moviename="";
	moviename=movie.innerText;
	selectmoviename=moviename;
	alert(selectmoviename);
}
function selecttheater(theater){
	var theatername="";
	theatername=theater.innerText;
	selecttheatername=theatername;
	alert(selecttheatername);
}
function selectday(day){
	var dayname="";
	dayname=day.getAttribute('id');
	selectdayname=dayname;
	alert(selectdayname);
}

function test(){
	alert(selectmoviename);
	alert(selecttheatername);
	alert(selectdayname);
}

	</script>
<div id="contaniner">

        <!-- LineMap -->
        <div id="navigation_line" class="linemap-wrap">
            <div class="sect-linemap">
                <div class="sect-bcrumb">
                    <ul>
                        <li><a href="./main.do"><img alt="home" src="/movie/resources/images/common/btn/btn_home.png" /></a></li>
                        <li><a href="index.html">예매</a></li>
                        <li class="last">빠른예매</li>
                    </ul>
                </div>
                <div class="sect-special">
                    <ul> 
                        <li><a href="../user/vip-lounge/index.html">VIP LOUNGE</a></li>
                        <li><a href="../user/memberShip/ClubService.html" class="specialclub" title="새창">CLUB 서비스</a></li>
                       <!-- <li><a href="#" class="photi" title="새창">포토티켓</a></li> -->
                    </ul>
                </div>
            </div>
        </div>
        <!-- //LineMap -->

		<!-- Contents Area -->
		<div id="contents" style="height:1px;padding:0;"></div>
       <p onclick="test() "> 변수설정테스트</p>
        <div class="movie">
        <div class="title">영화</div>
        <c:forEach items="${movieList.movies}" var="movie">
        
       <span onclick="selectmovie(this)"> ${movie.movie_title}</span><br/>
        </c:forEach>
       
        </div>
        
        <div class="theaters">
       <div class="title">지역</div>
       <div class="local">
       <c:forEach items="${movieList.location}" var="theaters" varStatus="status">
			 <span class="location">${theaters.theater_location}</span><br>
			 
			</c:forEach>
			 </div>
		
			  <c:if test="${theaterchoice==null}">
				 <div id="theater_name">
					 	<c:forEach items="${movieList.theater}" var="theaters" varStatus="status"  >
						<span onclick="selecttheater(this)"> ${theaters.theater_name}</span><br>
						
						</c:forEach>
				 </div> 
			 </c:if>
			  <c:if test="${theaterchoice!=null}">
			 <div id="theater_name"></div>
			 </c:if>
			
			 
		</div>
		
	
        <div class="day">
        
        	<div class="title" id="nal">날짜</div>
        	<span>2021년</span>
        	<div class="reserve-date" >
        	</div>
        </div>
        <div class="time">
        <div class="title">시간</div>
        </div>
	</div>
        <div class="bottombar">
        <div class="bottombarmovie">
        	영화선택
        </div>
         <div class="bottombarselect">
         
         		극장선택
        </div>
         <div class="bottombarpay">
         	좌석선택 > 결제 
        </div>
        <div class="bottomcount"><a href="ticketPeople.do"><img src="/movie/resources/images/20210423_170823.png"/></a></div>
        </div>
	<!-- /Contaniner -->





