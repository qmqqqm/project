<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
.people{
width:100%;
height:500px;

border:1px solid black;

} 
.box{
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
.selectpeoplenum{
width:50%;
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
.info{
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
.title_stat{
display:inline-block;
width:5%;
margin:5px 5px;
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
        
        <div class="selectpeople"><span class="title_peo" >일반</span> <br><span class="title_peo" >청소년</span> </div>
        <div class="selectpeoplenum"><span id="ad1" class="box" onclick="adcount(this)">1</span><span id="ad2" class="box" onclick="adcount(this)">2</span><span id="ad3" class="box" onclick="adcount(this)")>3</span><span id="ad4" class="box" onclick="adcount(this)">4</span><span id="ad5" class="box" onclick="adcount(this)">5</span><span id="ad6" class="box" onclick="adcount(this)">6</span><span id="ad7" class="box" onclick="adcount(this)">7</span><span id="ad8" class="box" onclick="adcount(this)">8</span><br>
        <span id="ch1" class="box" onclick="chcount(this)">1</span><span  id="ch2" class="box" onclick="chcount(this)">2</span><span  id="ch3" class="box" onclick="chcount(this)">3</span><span  id="ch4" class="box" onclick="chcount(this)">4</span><span  id="ch5" class="box" onclick="chcount(this)">5</span><span  id="ch6" class="box" onclick="chcount(this)">6</span><span  id="ch7" class="box" onclick="chcount(this)">7</span><span  id="ch8" class="box" onclick="chcount(this)">8</span>
        </div>
        <div class="info">
        좌석 : <span id="select"></span><br>
        인원 : <span id="count"></span><br>
        </div>
        <div>
        
        <span class="screen">SCREEN</span><br>
       <!--  상영관 시트수를 받아 좌석 출력  -->
        <script>
		stat=${stats};
		rows= stat/10;
		selectstat="";
		adcnt=0;
		chcnt=0;
		totalcnt=0;
		str=new Array();
		// price=Number(str.length)*12000; 
		
		
		for(i=65;i<65+rows;i++){
		
			document.write("<span class='title_stat'>"+String.fromCharCode(i)+"</span>");
			for(j=1;j<=10;j++){
				document.write("<span class='box' onclick='select(this)' id='"+String.fromCharCode(i)+j+"'>"+j+"</span>")
			}
			document.write("<br>")
		}
		//좌석선택
		function select(num){	
			if(totalcnt==0){
				alert("인원을선택하세요")			 
			}else if(totalcnt<str.length+1){
				alert("선택한인원에 맞게 좌석을 선택하세요")	;
				for(i=0;i<str.length;i++){
					document.getElementById(str[i]).style.background=""
				}
				num.style.background="";
				selectstat="";
				stat="";
				str="";
				document.getElementById('select').innerText="";
			}else{
				
				if(num.style.background!="red"){
					num.style.background="red";
					stat=num.getAttribute('id');
					
					}else{
							if(selectstat!=""){
								//str=selectstat.split(",");
								for(i=0;i<str.length;i++){
									document.getElementById(str[i]).style.background=""
								}
							}
							num.style.background="";
							selectstat="";
							stat="";
										
					}
					if(selectstat==""){					
						selectstat=stat
					}else{
						selectstat=selectstat+","+stat;
						str=selectstat.split(",");
					}
				
				document.getElementById('select').innerText=selectstat;
				alert(price);
				/* document.getElementById('bottombarpay').remove();
				str="<div id='bottombarpay'> 일반석 "+selectstat+"<br/>"+"금액 : "+price+" </div>";
				$('#selectstat').append(str); */
			}
		}
		//성인인원선택
		function adcount(count){	
			if(adcnt==0){
				adcnt=count.innerText;
				count.style.background="red";
			}else{			
				
			
					document.getElementById("ad"+adcnt).style.background="";
					count.style.background="red";
					adcnt=count.innerText;
				
			}	
		
			
			total(); 
		}
		//청소년인원선택
		function chcount(count){	
			if(chcnt==0){
				chcnt=count.innerText;
				count.style.background="red";
			}else{				
			
					document.getElementById("ch"+chcnt).style.background="";
					count.style.background="red";
					chcnt=count.innerText;
				}	
		
			
			total(); 
		}
		//총선택한 인원
		function total(count){	
			
			totalcnt=Number(adcnt)+Number(chcnt);
			document.getElementById('count').innerText=totalcnt;
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
         <div class="bottombarpay" id="selectstat" >
         <div id="bottombarpay">
         		좌석선택 > 결제
  		</div>
        </div>
         <div class="bottomcount"><a href="ticketpayment.do"><img src="/movie/resources/images/20210423_173910.png"/></a></div>
        </div>
	<!-- /Contaniner -->





