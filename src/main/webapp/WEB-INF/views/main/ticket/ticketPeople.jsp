<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
.people{
width:100%;
height:500px;

border:1px solid black;

} 
.box,.box1, .box2, .box3, .box4, .box5, .box6, .box7, .box8, .box9, .box10{
	display:inline-block;
	width:18px;
	height:16px;
	border:1px solid black;
	margin: 2px 5px;
	text-align: center;
	font-size: 13px;
	padding-top: 3px;
	font-weight: 900;
}
.selectpeople{
width:5%;
float: left;

}
.title_peo{
display:inline-block;
font-size: 13px;
margin:5px 5px;

}
.screen{
display:inline-block;
width:65%;
margin 0 auto;
border:1px solid black;
text-align: center;
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
width:45%;
height:60px;
margin : 20px 0;
font-size:25px;
font-weight:900;
padding:0 10px;
float: left;
}
</style>


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
        
        <div class="people">
        <div class="title">인원/ 좌석</div>
        <div class="people">
        <div class="selectpeople"><span class="title_peo" >일반</span> <br><span class="title_peo" >청소년</span> </div>
        <div><span class="box">1</span><span class="box">2</span><span class="box">3</span><span class="box">4</span><span class="box">5</span><span class="box">6</span><span class="box">7</span><span class="box">8</span><br>
        <span class="box">1</span><span class="box">2</span><span class="box">3</span><span class="box">4</span><span class="box">5</span><span class="box">6</span><span class="box">7</span><span class="box">8</span>
        </div>
        <div>
        
        <span class="screen">SCREEN</span><br>
       <!--  상영관 시크수를 받아 좌석 출력  -->
        <script>
		stat=${stats};
		rows= stat/10;
		
		for(i=65;i<=65+rows;i++){
		
			document.write("<span class='title_peo'>"+String.fromCharCode(i)+"</span>");
			for(j=1;j<=10;j++){
				document.write("<span class='box"+j+"'>"+j+"</span>")
			}
			document.write("<br>")
		}
		//document.write("<span class='box"+i+"'>"+i+"</span>")
		</script>
        </div>
        </div>
        </div>
        
<!--         <div class="theaters">
       <div class="title">지역</div>
       <div class="local">

			 </div>
			 <div class="localsub">
	
			 </div>
		</div>
		

        <div class="day">
  
        </div>
        <div class="time">
        <div class="title">시간</div>
        </div>
	</div> -->
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
        </div>
	<!-- /Contaniner -->





