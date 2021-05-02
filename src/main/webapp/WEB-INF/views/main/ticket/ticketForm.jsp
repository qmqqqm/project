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
margin:7px 0;
padding-left:10px;
font-size:15px;
font-weight:900;
text-align:left;
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
        	$("#theaterform").empty();
        	 for(var i=0;theater.theaterchoice.length;i++){                            
                 var h = theater.theaterchoice[i].theater_name;
                 var k= theater.theaterchoice[i].theater_id;
                 var str = "<span onclick='selecttheater(this)' id='theater_"+k+"'> "+h+"</span><br>"
                 $("#theaterform").append(str);
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
	

	

});//jqury


// 선택한 영화이름 담는 전역변수
var selectmoviename;
//선택한 극장이름 담는 전역변수
var selecttheatername;
//선택한 날자 담는 전역변수
var selectdayname;
//선택한 영화 아이디 담는 전역변수
var selectmovieid;
//선택한 극장 아이디 담는 전역변수
var selecttheaterid;
// 유져가 선택한 상영관이름
var selectsangname;
//유져가 선택한 상영관 아이디
var selectsangid;
//유져가 선택한 시간
var selecttime;

//극장 css처리용 div id담는 전역변수 
var theaterid;
//날짜 css처리용
var dayname;

//유저가 영화선택시 실행
function selectmovie(movie){
	var moviename="";
	var movieid=0;
	moviename=movie.innerText;
	movieid=movie.getAttribute('id');
	if(selectmovieid==null){
		movie.style.color="red";
		selectmovieid=movieid;	
	}else{
		document.getElementById(selectmovieid).style.color="";
		selectmovieid=movieid;
		movie.style.color="red";	
	}
	selectmoviename=moviename;	
	userSelect();
	 document.getElementById('bottombarmovie').innerText=selectmoviename;
	//유져가 선택한 영화명과 아이디 전송폼에 입력
	 document.getElementById('movie_id').value=selectmovieid;
	 document.getElementById('movie_title').value=selectmoviename;
	 
}
//유저가 극장클릭시실행
function selecttheater(theater){
	var theatername="";//극장명 담을 임시변수
	
	theatername=theater.innerText; // html 극장명 변수에 담기
	if(selecttheaterid==null){ //유져가 선택한 극장 아이디가 없으면
		theater.style.color="red"; //선택한 극장 글자를 빨간색으로 변경
		theaterid=theater.getAttribute('id'); //유져가 선택한 극장명 아이디값을 임시 아이디 저장소에 저장
		id=theaterid.split('_'); // 디비 아이디 추출릉위해 theater_id 로 태그 아이디 지정 하여 스플릿
		selecttheaterid=id[1]; // 뒷에값이 디비 아이디이므로 뒤엤값 유져가 선택한 id값저장소에 저장
	}else{
		document.getElementById(theaterid).style.color=""; //이미 유져가 선택한 변수에 아이디가 저장된경우이므로 태그 아이디 저장소에있는 값을가져와 글짜색 해제
		theaterid=theater.getAttribute('id'); //유져 선택한 태그 아이디 변수에 저장
		id=theaterid.split('_'); //디비 아이디추출위해 불리
		selecttheaterid=id[1]; // 디비아이디 추출후 유져 선택변수에 저장
		theater.style.color="red"; // 유져 선택한 태그 글씨색 빨간색으로 변경
	}
	
	selecttheatername=theatername;	
	document.getElementById('selectmovie').innerText=selecttheatername;
	//유져가 선택한 극장명과 아이디 전송폼에 입력
	document.getElementById('theater_id').value=selecttheaterid;		
	document.getElementById('theater_name').value=selecttheatername;
	
	 
	userSelect();
}
//유저가 날짜 선택시 실행
function selectday(day){	
	
	if(selectdayname==null){
		day.style.color="red";
		dayname=day.getAttribute('id');
		selectdayname=dayname;	
	}else{
		document.getElementById(dayname).style.color="";
		
		dayname=day.getAttribute('id');
		selectdayname=dayname;	
		day.style.color="red";
	}
	document.getElementById('seletedate').innerText=dayname;
	//유져가 선택한 날짜 전송폼에 입력
	document.getElementById('ticket_date').value=dayname;		
	userSelect(); //아작스 함수 호출
}
//유져가 상영관 선택시 실행
function selectsangyg(sangygname,sangygid){
	
	var name;
	var id;
	name=document.getElementById('selectsangyg').innerText=sangygname.innerText;
	id=sangygid;
	selectsangname=name;
	selectsangid=id;
	/* if(selectsangname==null){
		sangygname.style.color="red";
		
		selectsangname=sangname.innerText;;	
	}else{
		document.getElementById(selectsangyg).style.color="";
		
		dayname=day.getAttribute('id');
		selectdayname=dayname;	
		day.style.color="red";
	} */
	//유져가 선택한 상영관과 사영관 아이디 전송폼에 입력
	document.getElementById('sangyg_id').value=selectsangid;		
	document.getElementById('sangyg_name').value=selectsangname;
		
}
//유져가 시간 선택시 실행
function selecttime(time){
	var usertime;
	usertime=document.getElementById('selecttime').innerText=time.innerText;
	selecttime=usertime;
	//유져가 선택한 시간 전송폼에 입력
	document.getElementById('times_time').value=selecttime;
	
}
function submit(){
	if(selectmoviename==null || selecttheatername==null || selectdayname==null ||selectsangname==null|| selecttime==null){
		alert("영화 극장 날짜 상영관 상영시간을 모두 선택하세요");
	}else{
		document.getElementById('selectcomp').submit();
	}
}

//유져가 클릭한 값들처리를 위한 아작스
function userSelect(){
	$.ajax({
        type:"POST",
        url:"./userSelect.do",
        // 전역변수에 유저가 선택한 값 파라미터 전달
        data : {'selectmovieid' : selectmovieid,'selecttheaterid':selecttheaterid,'selectdayname':selectdayname},
        dataType : "json",
        success: function(theater){
        	//확인용
        	//alert(theater.theaterchoice);
        	// $("#movie_name").empty();
        	//$("#theater_name").empty();
        	//$("#day_name").empty();
        	$("#sangygform").empty(); //상영관 태그 다시 뿌려주기위해 엠프티
        //	$(".reserve-date").empty();
        	 for(var i=0;theater.theaterchoice.length;i++){
        		 		 var theatername=theater.theaterchoice[i].theater_name;//디비에서 가져온 극장명
        		 		 var theaterid=theater.theaterchoice[i].theater_id;//디비에서 가져온 극장아이디
        		 		 var moviename=theater.theaterchoice[i].movie_title;//디비에서 가져온 영화명
        		 		 var movieid=theater.theaterchoice[i].movie_id;//디비에서 가져온 영화 아이디
        		 		 var dayname=theater.theaterchoice[i].times_time;//디비에서 가져온 시간
        		 		 var sangygname=theater.theaterchoice[i].sangyg_name; //디비에서 가져온 상영관이름       		 		 
        		 		 var sangygid=theater.theaterchoice[i].sangyg_id;// 디비에서 가져온 상영관 아이디        		 		 
                 
                
                //가져온 시간 데이터을 태그아이디와 마추고 시간 부분 짤라 뿌려주기위한 작업
                day=dayname.substring(0,10);//가져온 시간 데이터중 날짜 부분만 짤르기
                imsi=day.split("-") // 날자중-없에기위해 -단위로짤라 배열에 저장
                dayid=imsi[0]+imsi[1]+imsi[2];//날자 저장한 배열 탸그아이디 형식에따라 재조합
                document.getElementById(dayid).style.background="blue"; //가져온 날자태그 아이디 백그라운드 변경 
                 //상영관 div 에 가져온 데이터 뿌려주기위한 태그를 변수에 저장              
                 
                 document.getElementById(movieid).style.background="blue"; //가져온 영화아이디로 태그아이디 찾아 백그라운드 변경
                 document.getElementById('theater_'+theaterid).style.background="blue"; //가져온 극장아이디로 태그아이디 찾아 백그라운드 변경
                 var strsangygname = "<span class='theaterTxt' id='selectsangyg"+i+"' onclick='selectsangyg(this,"+sangygid+")'>"+sangygname+"</span><br/>";
                 var strdaytime = "<span onclick='selecttime(this)' >"+dayname.substring(10,16)+"</span><br/>";
                                
                 //상영관 div에 데이터 뿌려주는 태그 추가
                 $("#sangygform").append(strsangygname);
                 $("#sangygform").append(strdaytime);
                 
                 
        	 } 
        },//success
        error: function(xhr, status, error) {
            alert("11111111");
       	}//error  
    	});//ajax
	
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
        <div id="movie_name">
        <c:forEach items="${movieList.movies}" var="movie">
        
       <span onclick="selectmovie(this)" id="${movie.movie_id}"> ${movie.movie_title}</span><br/>
       
        </c:forEach>
        </div>
       
        </div>
        
        <div class="theaters">
       <div class="title">지역</div>
       <div class="local">
       <c:forEach items="${movieList.location}" var="theaters" varStatus="status">
			 <span class="location" >${theaters.theater_location}</span><br>
			 
			</c:forEach>
			 </div>
		
		  		<c:if test="${theaterchoice==null}">
				 <div id="theaterform">
					 	<c:forEach items="${movieList.theater}" var="theaters" varStatus="status"  >
						<span onclick="selecttheater(this)" id="theater_${theaters.theater_id}"> ${theaters.theater_name}</span><br>
						
						</c:forEach>
				 </div> 
			 		</c:if>
			  <c:if test="${theaterchoice!=null}">
			 <div id="theaterform"></div>
			 </c:if>
			
			 
		</div>
		
	
        <div class="day">
        
        	<div class="title" id="nal">날짜</div>
        	<span>2021년</span>
        	<div id=day_name">
        	<div class="reserve-date" >
        	</div>
        	</div>
        </div>
        <div class="time">
        <div class="title">시간</div>
        <div id="sangygform">
        </div>
        </div>
				</div>
				<form id="selectcomp" action="ticketPeople.do" method="post">
				<input type="hidden" id="movie_id" name="movie_id" value=""/>
				<input type="hidden" id="movie_title" name="movie_title" value=""/>
				<input type="hidden" id="theater_id" name="theater_id" value=""/>
				<input type="hidden" id="theater_name" name="theater_name" value=""/>
				<input type="hidden" id="sangyg_id" name="sangyg_id" value=""/>
				<input type="hidden" id="sangyg_name" name="sangyg_name" value=""/>
				<input type="hidden" id="ticket_date" name="ticket_date" value=""/>
				<input type="hidden" id="times_time" name="times_time" value=""/>
				</form>
        <div class="bottombar">
        <div class="bottombarmovie" id="bottombarmovie">
        	영화선택
        </div>
         <div class="bottombarselect" id="bottombarselect">
                 
         		극장선택 : <span id="selectmovie"></span> <br>
         		날짜선택 : <span id="seletedate"></span> <br>
         		상영관선택 : <span id="selectsangyg"></span> <br>
         		시간선택 : <span id="selecttime"></span> <br>
         	
        </div>
         <div class="bottombarpay">
         	좌석선택 > 결제 
        </div>
        <div class="bottomcount"><img onclick="submit()" src="/movie/resources/images/20210423_170823.png"/></div>
        </div>
	<!-- /Contaniner -->





