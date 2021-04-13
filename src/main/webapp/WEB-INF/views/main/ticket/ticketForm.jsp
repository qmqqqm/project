<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
        
        <div class="movie">
        <div class="title">영화</div>
        </div>
        <div class="theaters">
        <div class="title">극장</div>
        </div>
        <div class="day">
        <div class="title">날짜</div>
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
         <!-- <table>
         <tr>
         <td>극장</td>
         <td></td>
         </tr>
         <tr>
         <td>일시</td>
         <td></td>
         </tr>
         <tr>
         <td>상영관</td>
         <td></td>
         </tr>
         <tr>
         <td>인원</td>
         <td></td>
         </tr>
         </table> -->
         		극장선택
        </div>
         <div class="bottombarpay">
         		좌석선택 > 결제
        </div>
        </div>
	<!-- /Contaniner -->





